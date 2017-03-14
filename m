Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C383F71ACB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 07:01:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="16543378"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Mar 2017 15:01:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 63E7448A294D;
	Tue, 14 Mar 2017 15:00:59 +0800 (CST)
Received: from localhost.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 14 Mar 2017 15:00:52 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Mar 2017 00:00:38 +0800
Message-ID: <1489507238-3384-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 63E7448A294D.A8E7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [jethro][PATCH] sdk: arm toolchain patch for multilib
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
X-List-Received-Date: Tue, 14 Mar 2017 07:01:17 -0000
Content-Type: text/plain

  The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,this makes multilib sdk doesn't work, for example:

  MACHINE = qemuarm64
  require conf/multilib.conf
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"

  $ bitbake core-image-minimal -cpopulate_sdk

  Then extract SDK, the environment-setup-armv7a-vfp-neon-pokymllib32-linux-gnueabi doesn't work since:
  * The CC is arm-pokymllib32-linux-gnueabi-gcc which doesn't exist, the patch for cross-canadian.bbclass fixes problem.
  * Need aarch64-poky-linux/usr/lib/arm-poky-linux-linux-gnueabi which doesn't exist, the patch for libgcc-common.inc fixes the problem.

  [YOCTO #8616]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/classes/cross-canadian.bbclass         |  3 +++
 meta/recipes-devtools/gcc/libgcc-common.inc | 25 ++++++++++++++++++-------
 meta/recipes-devtools/gcc/libgcc.inc        |  2 +-
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ea17f09..458185d 100644
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
 
@@ -167,6 +169,7 @@ SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-shlibs2"
 cross_canadian_bindirlinks () {
 	for i in linux ${CANADIANEXTRAOS}
 	do
+                i="$i${GNUEABI_SUFFIX}"
 		for v in ${CANADIANEXTRAVENDOR}
 		do
 			d=${D}${bindir}/../${TARGET_ARCH}$v-$i
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index b09ea65..46f8cfd 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -134,11 +134,22 @@ BASETARGET_SYS = "${TARGET_ARCH}${ORIG_TARGET_VENDOROS}"
 
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
+
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 95fa3f4..f6a0a8c 100644
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
2.7.4




