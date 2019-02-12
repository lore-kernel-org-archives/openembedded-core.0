Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3143B607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 05:10:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1C5AhMf010314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 21:10:44 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Mon, 11 Feb 2019 21:10:43 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2019 13:10:41 +0800
Message-ID: <1549948241-309157-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <608ce7362098bbc8c96431fd8c56441a46e1a56b.camel@linuxfoundation.org>
References: <608ce7362098bbc8c96431fd8c56441a46e1a56b.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH V2] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Tue, 12 Feb 2019 05:10:43 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

    The SDK was unable to find the C++ header pieces correctly since it's
    using a generic compiler, not one specifically targeting the multilib
    vendor prefix and default tune.  This adds the right mapping to ensure
    SDKs work as expected. And fix problem in below configurations:

    multilib configuration 1:
    MACHINE="qemumips64"
    MULTILIBS ?= "multilib:lib32 multilib:libn32"
    DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
    DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
    MULTILIB_GLOBAL_VARIANTS_append = " libn32"
    require conf/multilib.conf

    ignoring nonexistent directory "<path>/sysroots/mips64-poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32

    multilib configuration 2:
    MACHINE="qemumips64"
    MULTILIBS = 'multilib:lib64 multilib:lib32'
    DEFAULTTUNE = 'mips64-n32'
    DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
    DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
    require conf/multilib.conf

    For this configuration:
    for target gcc-runtime, need to create symlink like mips64-poly-linux --> mips64-poky-linux-gnu32
    for target lib64-gcc-runtime, need to create symlink like mips64-poly-linux/32 --> mips64-pokymllib64-linux
    in order to avoid conflict during populate_sdk, create symlink for subfoler bits/ext for target gcc-runtime,
    this is ugly, but seems no better way to cover all kinds of configuration.

    single lib configuration:
    MACHINE="qemumips64"
    DEFAULTTUNE = "mips64-n32"

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 50ecc81..f92becc 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -85,10 +85,6 @@ do_install () {
 	if [ -d ${D}${infodir} ]; then
 		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
 	fi
-	if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
-		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
-	fi
-
 }
 
 do_install_append_class-target () {
@@ -97,20 +93,29 @@ do_install_append_class-target () {
 	fi
 
 	if [ "${TARGET_OS}" = "linux-gnun32" ]; then
-		if [ "${MULTILIBS}" != "" ]; then
-			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
-			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
+		if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
+			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
+			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32
+		elif [ "${MULTILIB_VARIANTS}" != "" ]; then
+			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
+			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
 		else
 			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
 		fi
-	fi
-	if [ "${TARGET_OS}" = "linux-gnux32" ]; then
-		if [ "${MULTILIBS}" != "" ]; then
-			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux
-			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux/x32
+	elif [ "${TARGET_OS}" = "linux-gnux32" ]; then
+		if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
+			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
+			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32
+		elif [ "${MULTILIB_VARIANTS}" != "" ]; then
+			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
+			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
 		else
 			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
 		fi
+	elif [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
+		mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
+		ln -s ../${TARGET_SYS}/bits ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/bits
+		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
 	fi
 
 	if [ "${TCLIBC}" != "glibc" ]; then
-- 
2.7.4


