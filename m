Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A08F46FFFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 05:21:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="16589124"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Mar 2017 13:21:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E76448A294D;
	Wed, 15 Mar 2017 13:21:25 +0800 (CST)
Received: from localhost.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 15 Mar 2017 13:21:23 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Mar 2017 22:19:35 +0800
Message-ID: <1489587575-8761-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 2E76448A294D.A6D3F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [jethro][PATCH] sdk: fix toolchain for arm multilib
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
X-List-Received-Date: Wed, 15 Mar 2017 05:21:37 -0000
Content-Type: text/plain

    cross-canadian/libgcc-common: Fixes for arm multilib

    Arm is unusual in that we force it to "linux-gnueabi" and "linux" doesn't
    build. This was causing problems for multilib configurations which were assuming
    "linux" was the default compiler rather than linux-gnueabi.

    This change does two things, ensures symlinks are generated for linux-gnueabi
    and also adapts the libgcc code to account for the difference on arm.

    It still needs to immediately expand/save TARGET_VENDOR but we defer
    deciding what TARGET_OS should be until we know TARGET_ARCH (which the
    multilib code may change).

    [YOCTO #8642]

    Note that sanity tests of a 32 bit arm multilib still break due to issues
    with the kernel headers on a mixed bit system. This looks to be a general
    headers issue for the platform though and a different type of bug.

    (From OE-Core rev: b6253350fb86d8e54792905342a5892af570d526)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/classes/cross-canadian.bbclass         |  1 +
 meta/recipes-devtools/gcc/libgcc-common.inc | 11 +++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ea17f09..f60d728 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -68,6 +68,7 @@ python () {
     elif tarch == "mips64":
         d.appendVar("CANADIANEXTRAOS", " linux-gnun32 linux-uclibcn32 linux-musln32")
     if tarch == "arm" or tarch == "armeb":
+        d.appendVar("CANADIANEXTRAOS", " linux-gnueabi linux-musleabi linux-uclibceabi")
         d.setVar("TARGET_OS", "linux-gnueabi")
     else:
         d.setVar("TARGET_OS", "linux")
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index b09ea65..f3de9e9 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -122,15 +122,18 @@ fakeroot python do_multilib_install() {
         os.symlink(src, dest)
 }
 
-def get_original_vendoros(d):
-    vendoros = d.expand('${TARGET_VENDOR}-${TARGET_OS}')
+def get_original_os(d):
+    vendoros = d.expand('${TARGET_ARCH}${ORIG_TARGET_VENDOR}-${TARGET_OS}')
     for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSION', True)]:
         if suffix and vendoros.endswith(suffix):
             vendoros = vendoros[:-len(suffix)]
+    # Arm must use linux-gnueabi not linux as only the former is accepted by gcc
+    if vendoros.startswith("arm-") and not vendoros.endswith("-gnueabi"):
+        vendoros = vendoros + "-gnueabi"
     return vendoros
 
-ORIG_TARGET_VENDOROS := "${@get_original_vendoros(d)}"
-BASETARGET_SYS = "${TARGET_ARCH}${ORIG_TARGET_VENDOROS}"
+ORIG_TARGET_VENDOR := "${TARGET_VENDOR}"
+BASETARGET_SYS = "${@get_original_os(d)}"
 
 addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
 fakeroot python do_extra_symlinks() {
-- 
2.7.4




