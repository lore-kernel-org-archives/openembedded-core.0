Return-Path: <n.merinov@inango-systems.com>
X-Greylist: delayed 329 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Oct 2017 07:32:41 UTC
Received: from main-1.inango.com (main-1.inango-systems.com [5.189.174.2])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7276007A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 07:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-1.inango.com (Postfix) with ESMTP id 206934C0EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 09:27:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-1.inango.com ([127.0.0.1])
	by localhost (main-1.inango.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFZOXnmlje3W; Thu,  5 Oct 2017 09:27:10 +0200 (CEST)
Received: from nmerinov.inango-sw (unknown [194.60.247.123])
	by main-1.inango.com (Postfix) with ESMTPSA id 263BC4C0C6D;
	Thu,  5 Oct 2017 09:27:10 +0200 (CEST)
From: Nikolay Merinov <n.merinov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 12:25:39 +0500
Message-Id: <20171005072539.26530-1-n.merinov@inango-systems.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] nspr, nss: Use BUILD_CC instead of hardcoded "gcc"
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
X-List-Received-Date: Thu, 05 Oct 2017 07:32:41 -0000

Recipes nspr_4.16.bb and nss_3.31.1.bb ignored BUILD_CC and it's
BUILD_CFLAGS and tried to compile with hardcoded "gcc" instead. As
result build for this recipes will fail if host use different name for
compiler or require any flags.

Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
---
 meta/recipes-support/nspr/nspr_4.16.bb | 2 +-
 meta/recipes-support/nss/nss_3.31.1.bb | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/nspr/nspr_4.16.bb b/meta/recipes-support/nspr/nspr_4.16.bb
index bb178fe712..78ef994ffd 100644
--- a/meta/recipes-support/nspr/nspr_4.16.bb
+++ b/meta/recipes-support/nspr/nspr_4.16.bb
@@ -155,7 +155,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 do_compile_prepend() {
-	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX" LDFLAGS="" CC=gcc -C config export
+	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
 }
 
 do_compile_append() {
diff --git a/meta/recipes-support/nss/nss_3.31.1.bb b/meta/recipes-support/nss/nss_3.31.1.bb
index 955862fddb..588708fc31 100644
--- a/meta/recipes-support/nss/nss_3.31.1.bb
+++ b/meta/recipes-support/nss/nss_3.31.1.bb
@@ -66,8 +66,8 @@ do_compile_prepend_class-native() {
 
 do_compile() {
     export CROSS_COMPILE=1
-    export NATIVE_CC="gcc"
-    export NATIVE_FLAGS="${HOST_CFLAGS}"
+    export NATIVE_CC="${BUILD_CC}"
+    export NATIVE_FLAGS="${BUILD_CFLAGS}"
     export BUILD_OPT=1
 
     export FREEBL_NO_DEPEND=1
@@ -118,7 +118,7 @@ do_install_prepend_class-nativesdk() {
 
 do_install() {
     export CROSS_COMPILE=1
-    export NATIVE_CC="gcc"
+    export NATIVE_CC="${BUILD_CC}"
     export BUILD_OPT=1
 
     export FREEBL_NO_DEPEND=1
-- 
2.14.2


