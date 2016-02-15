Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA9773175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:02:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 15 Feb 2016 07:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,450,1449561600"; d="scan'208";a="915355679"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2016 07:01:51 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 17:01:49 +0200
Message-Id: <1455548509-14576-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH v2] nss: define RPATH variable for nss-native
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
X-List-Received-Date: Mon, 15 Feb 2016 15:02:21 -0000

Otherwise the nss libs do not get any RPATH/RUNPATH. Consequently, the
.so dependencies of nss libs are always searched from the base lib
directories of the host (i.e. /lib/ and /usr/lib). This causes problems
with nss-native where the .so's should be searched from the base lib
directories of the sysroot instead of the host file system.

This particular problem has probably been unnoticed as most users are
likely to have nss libraries installed on their host system. In this
case everything most likely work as expected.

[YOCTO #9041]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-support/nss/nss_3.21.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes-support/nss/nss_3.21.bb
index 552fd6c..d2e2411 100644
--- a/meta/recipes-support/nss/nss_3.21.bb
+++ b/meta/recipes-support/nss/nss_3.21.bb
@@ -55,6 +55,11 @@ do_compile_prepend_class-nativesdk() {
     export LDFLAGS=""
 }
 
+do_compile_prepend_class-native() {
+    # Need to set RPATH so that chrpath will do its job correctly
+    RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
+}
+
 do_compile() {
     export CROSS_COMPILE=1
     export NATIVE_CC="gcc"
@@ -96,7 +101,8 @@ do_compile() {
     #
     export CC="${CC} -g"
     make -C ./nss CCC="${CXX} -g" \
-        OS_TEST=${OS_TEST}
+        OS_TEST=${OS_TEST} \
+        RPATH="${RPATH}"
 }
 
 
-- 
2.6.2


