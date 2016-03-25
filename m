Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C3BBF6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 02:18:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2P2InHp006813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 19:18:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Mar 2016 19:18:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Mar 2016 10:19:09 +0800
Message-ID: <a6bf8ae4700486a6068bd04ad1b3c92b96dc8698.1458872261.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458872261.git.Qi.Chen@windriver.com>
References: <cover.1458872261.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] cross-canadian/libgcc: fix aarch64's multilib SDK
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
X-List-Received-Date: Fri, 25 Mar 2016 02:18:56 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,
this makes multilib sdk doesn't work, for example:

MACHINE = qemuarm64
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"

$ bitbake core-image-minimal -cpopulate_sdk

Then extract SDK, the
environment-setup-armv7a-vfp-neon-pokymllib32-linux-gnueabi
doesn't work since:
* The CC is arm-pokymllib32-linux-gnueabi-gcc
  which doesn't exist, the patch for cross-canadian.bbclass
  fixes problem.
* Need aarch64-poky-linux/usr/lib/arm-poky-linux-linux-gnueabi
  which doesn't exist, the patch for libgcc-common.inc fixes the
  problem.

[YOCTO #8616]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/cross-canadian.bbclass         |  3 +++
 meta/recipes-devtools/gcc/libgcc-common.inc | 24 +++++++++++++++++-------
 meta/recipes-devtools/gcc/libgcc.inc        |  2 +-
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index e07b1bd..a8e8074 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -18,6 +18,7 @@ PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 CANADIANEXTRAOS = "linux-uclibc linux-musl"
 CANADIANEXTRAVENDOR = ""
 MODIFYTOS ??= "1"
+GNUEABI_SUFFIX = ""
 python () {
     archs = d.getVar('PACKAGE_ARCHS', True).split()
     sdkarchs = []
@@ -69,6 +70,7 @@ python () {
         d.appendVar("CANADIANEXTRAOS", " linux-gnun32 linux-uclibcn32 linux-musln32")
     if tarch == "arm" or tarch == "armeb":
         d.setVar("TARGET_OS", "linux-gnueabi")
+        d.setVar("GNUEABI_SUFFIX", "-gnueabi")
     else:
         d.setVar("TARGET_OS", "linux")
 
@@ -164,6 +166,7 @@ SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-shlibs2"
 cross_canadian_bindirlinks () {
 	for i in linux ${CANADIANEXTRAOS}
 	do
+		i="$i${GNUEABI_SUFFIX}"
 		for v in ${CANADIANEXTRAVENDOR}
 		do
 			d=${D}${bindir}/../${TARGET_ARCH}$v-$i
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index dae07e9..30a0dbb 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -135,11 +135,21 @@ BASETARGET_SYS = "${TARGET_ARCH}${ORIG_TARGET_VENDOROS}"
 
 addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
 fakeroot python do_extra_symlinks() {
-    targetsys = d.getVar('BASETARGET_SYS', True)
-
-    if targetsys != d.getVar('TARGET_SYS', True):
-        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + targetsys
-        src = d.getVar('TARGET_SYS', True)
-        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
-            os.symlink(src, dest)
+    base_targetsys = d.getVar('BASETARGET_SYS', True)
+    targetsys = d.getVar('TARGET_SYS', True)
+
+    if base_targetsys != targetsys:
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + base_targetsys
+        dest_list = [dest]
+        # For multilib like aarch64 + arm, need 2 symlinks:
+        # 1) BASETARGET_SYS as usual
+        # 2) BASETARGET_SYS + "-gnueabi" for multilib
+        libce = d.getVar('LIBCEXTENSION', True)
+        abie = d.getVar('ABIEXTENSION', True)
+        if abie and libce and targetsys.endswith(libce + abie):
+            dest_list.append(dest + libce + abie)
+        src = targetsys
+        for dir in dest_list:
+            if not os.path.lexists(dir) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
+                os.symlink(src, dir)
 }
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 68377869..4e67f04 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -17,7 +17,7 @@ LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
 
 FILES_${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
-    ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
+    ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}*', d)} \
     ${libdir}/${TARGET_SYS}/${BINV}* \
 "
 
-- 
1.9.1


