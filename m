Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA127C243
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 08:03:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0U830pQ020003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 00:03:10 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 30 Jan 2019 00:02:49 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jan 2019 16:02:48 +0800
Message-ID: <1548835368-52735-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Wed, 30 Jan 2019 08:03:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

    The SDK was unable to find the C++ header pieces correctly since it's
    using a generic compiler, not one specifically targeting the multilib
    vendor prefix and default tune.  This adds the right mapping to ensure
    SDKs work as expected. And fix problem in below configurations:

    multilib configuration:
    MACHINE="qemumips64"
    MULTILIBS ?= "multilib:lib32 multilib:libn32"
    DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
    DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
    MULTILIB_GLOBAL_VARIANTS_append = " libn32"
    require conf/multilib.conf

    ignoring nonexistent directory "<path>/sysroots/mips64-poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 50ecc81..e0f5c80 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -98,16 +98,16 @@ do_install_append_class-target () {
 
 	if [ "${TARGET_OS}" = "linux-gnun32" ]; then
 		if [ "${MULTILIBS}" != "" ]; then
-			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
-			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
+			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
+			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32
 		else
 			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
 		fi
 	fi
 	if [ "${TARGET_OS}" = "linux-gnux32" ]; then
 		if [ "${MULTILIBS}" != "" ]; then
-			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux
-			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux/x32
+			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
+			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32
 		else
 			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
 		fi
-- 
2.7.4


