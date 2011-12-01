Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RWGER-0006t3-0b
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 00:39:59 +0100
Received: from mail106-db3-R.bigfish.com (10.3.81.241) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.22; Thu, 1 Dec 2011 23:33:13 +0000
Received: from mail106-db3 (localhost [127.0.0.1])	by
	mail106-db3-R.bigfish.com (Postfix) with ESMTP id E0C7E3403C4	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 23:33:13 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail106-db3 (localhost.localdomain [127.0.0.1]) by mail106-db3
	(MessageSwitch) id 1322782393773504_31101;
	Thu,  1 Dec 2011 23:33:13 +0000 (UTC)
Received: from DB3EHSMHS004.bigfish.com (unknown [10.3.81.247])	by
	mail106-db3.bigfish.com (Postfix) with ESMTP id B85991C0045	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 23:33:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS004.bigfish.com
	(10.3.87.104) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 1 Dec 2011 23:33:12 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.339.2; Thu, 1 Dec 2011 17:33:14 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pB1NXDtB000075	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 17:33:13 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Dec 2011 17:33:13 -0600
Message-ID: <1322782393-31385-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] sstate.bbclass: add option to use alternate compression in lieu of gzip
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
X-List-Received-Date: Thu, 01 Dec 2011 23:39:59 -0000
Content-Type: text/plain

The savings can be substantial. The resutls below are for a
core-image-minimal type image:

gzip:    1.1G	sstate-cache
xz       714M	sstate-cache

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/sstate.bbclass |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3d259f0..16c4b43 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -18,6 +18,9 @@ SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
 SSTATEPOSTINSTFUNCS ?= ""
 
+SSTATE_PKG_SUFFIX = "tgz"
+SSTATE_PKG_TAROPT = "z"
+
 python () {
     if bb.data.inherits_class('native', d):
         bb.data.setVar('SSTATE_PKGARCH', bb.data.getVar('BUILD_ARCH', d), d)
@@ -155,7 +158,7 @@ def sstate_installpkg(ss, d):
         oe.path.remove(dir)
 
     sstateinst = bb.data.expand("${WORKDIR}/sstate-install-%s/" % ss['name'], d)
-    sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_' + ss['name'] + ".tgz"
+    sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_' + ss['name'] + ".${SSTATE_PKG_SUFFIX}"
 
     if not os.path.exists(sstatepkg):
        pstaging_fetch(sstatepkg, d)
@@ -206,7 +209,7 @@ def sstate_clean_cachefile(ss, d):
     import oe.path
 
     sstatepkgdir = bb.data.getVar('SSTATE_DIR', d, True)
-    sstatepkgfile = sstatepkgdir + '/' + bb.data.getVar('SSTATE_PKGSPEC', d, True) + "*_" + ss['name'] + ".tgz*"
+    sstatepkgfile = sstatepkgdir + '/' + bb.data.getVar('SSTATE_PKGSPEC', d, True) + "*_" + ss['name'] + ".${SSTATE_PKG_SUFFIX}*"
     bb.note("Removing %s" % sstatepkgfile)
     oe.path.remove(sstatepkgfile)
 
@@ -351,7 +354,7 @@ def sstate_package(ss, d):
     tmpdir = bb.data.getVar('TMPDIR', d, True)
 
     sstatebuild = bb.data.expand("${WORKDIR}/sstate-build-%s/" % ss['name'], d)
-    sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_'+ ss['name'] + ".tgz"
+    sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_'+ ss['name'] + ".${SSTATE_PKG_SUFFIX}"
     bb.mkdirhier(sstatebuild)
     bb.mkdirhier(os.path.dirname(sstatepkg))
     for state in ss['dirs']:
@@ -448,9 +451,9 @@ sstate_create_package () {
 	cd ${SSTATE_BUILDDIR}
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
-		tar -czf ${SSTATE_PKG} *
+		tar -cf${SSTATE_PKG_TAROPT} ${SSTATE_PKG} *
 	else
-		tar -cz --file=${SSTATE_PKG} --files-from=/dev/null
+		tar -c${SSTATE_PKG_TAROPT} --file=${SSTATE_PKG} --files-from=/dev/null
 	fi
 
 	cd ${WORKDIR}
@@ -463,7 +466,7 @@ sstate_create_package () {
 sstate_unpack_package () {
 	mkdir -p ${SSTATE_INSTDIR}
 	cd ${SSTATE_INSTDIR}
-	tar -xvzf ${SSTATE_PKG}
+	tar -xvf${SSTATE_PKG_TAROPT}  ${SSTATE_PKG}
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




