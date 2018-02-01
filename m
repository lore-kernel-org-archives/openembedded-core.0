Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 73717783C9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 13:08:43 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1ehEbe-0005CW-NK
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Feb 2018 14:08:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cALHneHFs/78g5HPnF0xN6iCpwpOIqC/y3sCiApj2eE=;
	b=QAIYpIg+A0kAlcwOqw+xQ0xjCt
	E2fqGV8fA/zKwpB1ns87ecbm/BPGnwRDacxsd/au0aikUaHXCgfzzCPgiZPm3RRV5de0fnD0g+VqF
	1LiFVtvVm/28V0b4VjQKygboLG6nMNBbPGY738L5zESmxKC4NEC2dsoPSddd9HAiTRDYtUkaLcJ7d
	9ihHdwyeHs6Z118WuziQNY+V5wbnnBVHvSVkzqIchyq3T05uKwo4DWo8rEvnfL4EKKNi5xmA9aHaf
	8BdY/U4sw24CWGuHNyk9J0SAuIfkUjC8PU1h2V3kVVdLZn+HwJAp3q6E7Rz8x++Tx3JDGsY9qp2mv
	ggjkOm8w==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1ehEbY-0005Ce-Uu; Thu, 01 Feb 2018 14:08:42 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 14:08:31 +0100
Message-Id: <20180201130831.4027-2-zboszor@pr.hu>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180201130831.4027-1-zboszor@pr.hu>
References: <20180201130831.4027-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Scan-Signature: d44095b4f95319110725e3628198b104
X-Spam-Tracer: backend.mail.pr.hu -0.4 20180201130842Z
Subject: [PATCH 2/2] npm.bbclass: Node module name and recipe name can be different
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Feb 2018 13:08:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some NPM modules have the same name as their low level dependencies.
To prevent recipe naming conflicts, allow node module recipe names
to start with the "node-" prefix.

Signed-off-by: Zoltán Böszörményi <zboszor@pr.hu>
---
 meta/classes/npm.bbclass | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 898a54eb50..c351ff0866 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -2,7 +2,15 @@ DEPENDS_prepend = "nodejs-native "
 RDEPENDS_${PN}_prepend = "nodejs "
 S = "${WORKDIR}/npmpkg"
 
-NPM_INSTALLDIR = "${D}${libdir}/node_modules/${PN}"
+def node_pkgname(d):
+    bpn = d.getVar('BPN')
+    if bpn.startswith("node-"):
+        return bpn[5:]
+    return bpn
+
+NPMPN ?= "${@node_pkgname(d)}"
+
+NPM_INSTALLDIR = "${D}${libdir}/node_modules/${NPMPN}"
 
 # function maps arch names to npm arch names
 def npm_oe_arch_map(target_arch, d):
@@ -46,7 +54,7 @@ npm_do_install() {
 	export HOME=${WORKDIR}
 	mkdir -p ${NPM_INSTALLDIR}/
 	npm pack .
-	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry ${PN}-${PV}.tgz
+	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry ${NPMPN}-${PV}.tgz
 	if [ -d ${D}${prefix}/etc ] ; then
 		# This will be empty
 		rmdir ${D}${prefix}/etc
@@ -54,13 +62,13 @@ npm_do_install() {
 }
 
 python populate_packages_prepend () {
-    instdir = d.expand('${D}${libdir}/node_modules/${PN}')
+    instdir = d.expand('${D}${libdir}/node_modules/${NPMPN}')
     extrapackages = oe.package.npm_split_package_dirs(instdir)
     pkgnames = extrapackages.keys()
     d.prependVar('PACKAGES', '%s ' % ' '.join(pkgnames))
     for pkgname in pkgnames:
         pkgrelpath, pdata = extrapackages[pkgname]
-        pkgpath = '${libdir}/node_modules/${PN}/' + pkgrelpath
+        pkgpath = '${libdir}/node_modules/${NPMPN}/' + pkgrelpath
         # package names can't have underscores but npm packages sometimes use them
         oe_pkg_name = pkgname.replace('_', '-')
         expanded_pkgname = d.expand(oe_pkg_name)
@@ -76,7 +84,7 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN} += " \
-    ${libdir}/node_modules/${PN} \
+    ${libdir}/node_modules/${NPMPN} \
 "
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
2.14.3


