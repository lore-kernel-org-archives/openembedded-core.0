Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE007.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RY5s3-0003Kv-RH
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 02:00:28 +0100
Received: from mail142-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Wed, 7 Dec 2011 00:53:35 +0000
Received: from mail142-va3 (localhost [127.0.0.1])	by
	mail142-va3-R.bigfish.com (Postfix) with ESMTP id 7F7C9100544	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 00:53:35 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail142-va3 (localhost.localdomain [127.0.0.1]) by mail142-va3
	(MessageSwitch) id 1323219215152597_20633;
	Wed,  7 Dec 2011 00:53:35 +0000 (UTC)
Received: from VA3EHSMHS002.bigfish.com (unknown [10.7.14.244])	by
	mail142-va3.bigfish.com (Postfix) with ESMTP id 159BF3E025D	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 00:53:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS002.bigfish.com
	(10.7.99.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 7 Dec 2011 00:53:35 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.339.2; Tue, 6 Dec 2011 18:52:30 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pB70qTkW015418	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 18:52:30 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Dec 2011 18:52:29 -0600
Message-ID: <1323219149-17056-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <CAEsOVNdDP0oEUi3HbrgTZTGbE4r1DS53gE66wR6kXs5-MkUX6Q@mail.gmail.com>
References: <CAEsOVNdDP0oEUi3HbrgTZTGbE4r1DS53gE66wR6kXs5-MkUX6Q@mail.gmail.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3] sstate.bbclass: add option to use alternate compression in lieu of gzip
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2011 01:00:29 -0000
Content-Type: text/plain

The savings can be substantial. The resutls below are for a
core-image-minimal type image:

gzip:    1.1G	sstate-cache
xz       714M	sstate-cache

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: This one actually works!
v3:
 - Use --use-compress-program= option to tar so we can use any compression
   not just ones built into tar
 - Add ASSUME_PROVIDED for the compression program we are using, this way
   it won't effect the build and if you are using it - it's already
   going to be available on the host


 meta/classes/sstate.bbclass |   22 ++++++++++++++--------
 1 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3d259f0..a2d7b65 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -18,6 +18,12 @@ SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
 SSTATEPOSTINSTFUNCS ?= ""
 
+SSTATE_PKG_SUFFIX ?= "tgz"
+SSTATE_PKG_TARZIPPROG ?= "gzip"
+# the tool used above for sstate-cache will always need to be used from the host
+# so we can ASSUME_PROVIDED it
+ASSUME_PROVIDED += "${SSTATE_PKG_TARZIPPROG}-native"
+
 python () {
     if bb.data.inherits_class('native', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.getVar('BUILD_ARCH', d), d)
@@ -155,7 +161,7 @@ def sstate_installpkg(ss, d):
         oe.path.remove(dir)
 
     sstateinst = bb.data.expand("${WORKDIR}/sstate-install-%s/" % ss['name'], d)
-    sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_' + ss['name'] + ".tgz"
+    sstatepkg = bb.data.expand("${SSTATE_PKG}" + '_' + ss['name'] + ".${SSTATE_PKG_SUFFIX}", d)
 
     if not os.path.exists(sstatepkg):
        pstaging_fetch(sstatepkg, d)
@@ -206,7 +212,7 @@ def sstate_clean_cachefile(ss, d):
     import oe.path
 
     sstatepkgdir = bb.data.getVar('SSTATE_DIR', d, True)
-    sstatepkgfile = sstatepkgdir + '/' + bb.data.getVar('SSTATE_PKGSPEC', d, True) + "*_" + ss['name'] + ".tgz*"
+    sstatepkgfile = bb.data.expand(sstatepkgdir + '/' + "${SSTATE_PKGSPEC}" + "*_" + ss['name'] + ".${SSTATE_PKG_SUFFIX}*", d)
     bb.note("Removing %s" % sstatepkgfile)
     oe.path.remove(sstatepkgfile)
 
@@ -351,7 +357,7 @@ def sstate_package(ss, d):
     tmpdir = bb.data.getVar('TMPDIR', d, True)
 
     sstatebuild = bb.data.expand("${WORKDIR}/sstate-build-%s/" % ss['name'], d)
-    sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_'+ ss['name'] + ".tgz"
+    sstatepkg = bb.data.expand("${SSTATE_PKG}" + '_' + ss['name'] + ".${SSTATE_PKG_SUFFIX}", d)
     bb.mkdirhier(sstatebuild)
     bb.mkdirhier(os.path.dirname(sstatepkg))
     for state in ss['dirs']:
@@ -448,9 +454,9 @@ sstate_create_package () {
 	cd ${SSTATE_BUILDDIR}
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
-		tar -czf ${SSTATE_PKG} *
+		tar --use-compress-program=${SSTATE_PKG_TARZIPPROG} -cf ${SSTATE_PKG} *
 	else
-		tar -cz --file=${SSTATE_PKG} --files-from=/dev/null
+		tar --use-compress-program=${SSTATE_PKG_TARZIPPROG} -c --file=${SSTATE_PKG} --files-from=/dev/null
 	fi
 
 	cd ${WORKDIR}
@@ -463,7 +469,7 @@ sstate_create_package () {
 sstate_unpack_package () {
 	mkdir -p ${SSTATE_INSTDIR}
 	cd ${SSTATE_INSTDIR}
-	tar -xvzf ${SSTATE_PKG}
+	tar --use-compress-program=${SSTATE_PKG_TARZIPPROG} -xvf ${SSTATE_PKG}
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
@@ -483,7 +489,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
     }
 
     for task in range(len(sq_fn)):
-        sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz", d)
+        sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".${SSTATE_PKG_SUFFIX}", d)
         sstatefile = sstatefile.replace("${BB_TASKHASH}", sq_hash[task])
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
@@ -508,7 +514,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             if task in ret:
                 continue
 
-            sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz", d)
+            sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".${SSTATE_PKG_SUFFIX}", d)
             sstatefile = sstatefile.replace("${BB_TASKHASH}", sq_hash[task])
 
             srcuri = "file://" + os.path.basename(sstatefile)
-- 
1.7.6.1




