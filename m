Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RWWxT-0008F5-1T
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 18:31:35 +0100
Received: from mail93-am1-R.bigfish.com (10.3.201.242) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.22; Fri, 2 Dec 2011 17:24:52 +0000
Received: from mail93-am1 (localhost [127.0.0.1])	by mail93-am1-R.bigfish.com
	(Postfix) with ESMTP id 450CB400619	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 17:24:52 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail93-am1 (localhost.localdomain [127.0.0.1]) by mail93-am1
	(MessageSwitch) id 1322846692126029_19416;
	Fri,  2 Dec 2011 17:24:52 +0000 (UTC)
Received: from AM1EHSMHS016.bigfish.com (unknown [10.3.201.249])	by
	mail93-am1.bigfish.com (Postfix) with ESMTP id 18C642E0047	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 17:24:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS016.bigfish.com
	(10.3.207.154) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 2 Dec 2011 17:24:50 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.339.2; Fri, 2 Dec 2011 11:24:48 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pB2HOlWe010650	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Dec 2011 11:24:47 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2011 11:24:47 -0600
Message-ID: <1322846687-13057-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <CAEsOVNe8RPoKqokyxoJTFQBm=g+EZ+0LkCmsnhBDMQ0uemepcA@mail.gmail.com>
References: <CAEsOVNe8RPoKqokyxoJTFQBm=g+EZ+0LkCmsnhBDMQ0uemepcA@mail.gmail.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] sstate.bbclass: add option to use alternate compression in lieu of gzip
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
X-List-Received-Date: Fri, 02 Dec 2011 17:31:35 -0000
Content-Type: text/plain

The savings can be substantial. The resutls below are for a
core-image-minimal type image:

gzip:    1.1G	sstate-cache
xz       714M	sstate-cache

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: This one actually works!

 meta/classes/sstate.bbclass |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3d259f0..e3a2a83 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -18,6 +18,9 @@ SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
 SSTATEPOSTINSTFUNCS ?= ""
 
+SSTATE_PKG_SUFFIX ?= "tgz"
+SSTATE_PKG_TAROPT ?= "z"
+
 python () {
     if bb.data.inherits_class('native', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.getVar('BUILD_ARCH', d), d)
@@ -155,7 +158,7 @@ def sstate_installpkg(ss, d):
         oe.path.remove(dir)
 
     sstateinst = bb.data.expand("${WORKDIR}/sstate-install-%s/" % ss['name'], d)
-    sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_' + ss['name'] + ".tgz"
+    sstatepkg = bb.data.expand("${SSTATE_PKG}" + '_' + ss['name'] + ".${SSTATE_PKG_SUFFIX}", d)
 
     if not os.path.exists(sstatepkg):
        pstaging_fetch(sstatepkg, d)
@@ -206,7 +209,7 @@ def sstate_clean_cachefile(ss, d):
     import oe.path
 
     sstatepkgdir = bb.data.getVar('SSTATE_DIR', d, True)
-    sstatepkgfile = sstatepkgdir + '/' + bb.data.getVar('SSTATE_PKGSPEC', d, True) + "*_" + ss['name'] + ".tgz*"
+    sstatepkgfile = bb.data.expand(sstatepkgdir + '/' + "${SSTATE_PKGSPEC}" + "*_" + ss['name'] + ".${SSTATE_PKG_SUFFIX}*", d)
     bb.note("Removing %s" % sstatepkgfile)
     oe.path.remove(sstatepkgfile)
 
@@ -351,7 +354,7 @@ def sstate_package(ss, d):
     tmpdir = bb.data.getVar('TMPDIR', d, True)
 
     sstatebuild = bb.data.expand("${WORKDIR}/sstate-build-%s/" % ss['name'], d)
-    sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_'+ ss['name'] + ".tgz"
+    sstatepkg = bb.data.expand("${SSTATE_PKG}" + '_' + ss['name'] + ".${SSTATE_PKG_SUFFIX}", d)
     bb.mkdirhier(sstatebuild)
     bb.mkdirhier(os.path.dirname(sstatepkg))
     for state in ss['dirs']:
@@ -448,9 +451,9 @@ sstate_create_package () {
 	cd ${SSTATE_BUILDDIR}
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
-		tar -czf ${SSTATE_PKG} *
+		tar -${SSTATE_PKG_TAROPT}cf ${SSTATE_PKG} *
 	else
-		tar -cz --file=${SSTATE_PKG} --files-from=/dev/null
+		tar -${SSTATE_PKG_TAROPT}c --file=${SSTATE_PKG} --files-from=/dev/null
 	fi
 
 	cd ${WORKDIR}
@@ -463,7 +466,7 @@ sstate_create_package () {
 sstate_unpack_package () {
 	mkdir -p ${SSTATE_INSTDIR}
 	cd ${SSTATE_INSTDIR}
-	tar -xvzf ${SSTATE_PKG}
+	tar -${SSTATE_PKG_TAROPT}xvf  ${SSTATE_PKG}
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
@@ -483,7 +486,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
     }
 
     for task in range(len(sq_fn)):
-        sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz", d)
+        sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".${SSTATE_PKG_SUFFIX}", d)
         sstatefile = sstatefile.replace("${BB_TASKHASH}", sq_hash[task])
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
@@ -508,7 +511,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             if task in ret:
                 continue
 
-            sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz", d)
+            sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".${SSTATE_PKG_SUFFIX}", d)
             sstatefile = sstatefile.replace("${BB_TASKHASH}", sq_hash[task])
 
             srcuri = "file://" + os.path.basename(sstatefile)
-- 
1.7.6.1




