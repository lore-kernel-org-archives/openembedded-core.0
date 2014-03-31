Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20C1F6EC7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 14:21:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2VELFH3013523
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 07:21:15 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Mon, 31 Mar 2014 07:21:14 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 31 Mar 2014 22:20:49 +0800
Message-ID: <1396275649-32352-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Mon, 31 Mar 2014 14:21:18 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

When native package is built, use the uname to return the kernel version.

When target is built, read kernel version from ${STAGING_KERNEL_DIR}/kernel-abiversion
to avoid to use the hardcode kernel version.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-support/nss/nss.inc | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 404decc..f24da68 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -26,6 +26,7 @@ SRC_URI_append_class-target = "\
 inherit siteinfo
 PR = "r0"
 DEPENDS = "sqlite3 nspr zlib nss-native"
+DEPENDS_append_class-target += "virtual/kernel"
 DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
 RDEPENDS_${PN} = "perl"
 
@@ -37,12 +38,24 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 do_compile_prepend_class-native() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
     export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
+    export OS_RELEASE=`uname -r`
 }
 
 do_compile_prepend_class-nativesdk() {
     export LDFLAGS=""
 }
 
+do_compile_prepend_class-target() {
+    export OS_RELEASE=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|sed 's/-.*//'`
+}
+
+do_install_prepend_class-native() {
+    export OS_RELEASE=`uname -r`
+}
+
+do_install_prepend_class-target() {
+    export OS_RELEASE=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|sed 's/-.*//'`
+}
 do_compile() {
     export CROSS_COMPILE=1
     export NATIVE_CC="gcc"
@@ -57,7 +70,6 @@ do_compile() {
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
 
-    export OS_RELEASE=3.4
     export OS_TARGET=Linux
     export OS_ARCH=Linux
 
@@ -97,7 +109,6 @@ do_install() {
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
 
-    export OS_RELEASE=3.4
     export OS_TARGET=Linux
     export OS_ARCH=Linux
 
-- 
1.8.1.2


