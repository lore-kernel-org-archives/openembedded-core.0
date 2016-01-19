Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 532D06FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:41:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 07:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,317,1449561600"; d="scan'208";a="893851757"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2016 07:40:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:37:32 +0200
Message-Id: <5f464411a18a53b395e749b2b3a1fbfaab4ffd74.1453217744.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/12] nss: update to 3.21
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
X-List-Received-Date: Tue, 19 Jan 2016 15:41:20 -0000

Explicitly disable tests (they were previously implicitly disabled upstream),
as they cause various architecture-specific build failures.

Add 0001-Fix-build-failure-on-opensuse-13.1.patch that fixes compilation using gcc 4.8.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-Fix-build-failure-on-opensuse-13.1.patch  | 27 ++++++++++++++++++++++
 .../nss/{nss_3.19.2.bb => nss_3.21.bb}             | 11 ++++++---
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch
 rename meta/recipes-support/nss/{nss_3.19.2.bb => nss_3.21.bb} (95%)

diff --git a/meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch b/meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch
new file mode 100644
index 0000000..cb3ad00
--- /dev/null
+++ b/meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch
@@ -0,0 +1,27 @@
+From 8758c6a4508a5ca01505a8d69a269c912ce10bee Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 18 Jan 2016 18:26:16 +0000
+Subject: [PATCH] Fix build failure on opensuse 13.1
+
+Upstream-Status: Inappropriate [gcc 4.8 specific issue]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ nss/cmd/modutil/install-ds.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/cmd/modutil/install-ds.h b/nss/cmd/modutil/install-ds.h
+index 3a3afb3..433efe0 100644
+--- a/nss/cmd/modutil/install-ds.h
++++ b/nss/cmd/modutil/install-ds.h
+@@ -243,7 +243,7 @@ struct Pk11Install_Info_str {
+ Pk11Install_Info*
+ Pk11Install_Info_new();
+ void
+-Pk11Install_Info_init();
++Pk11Install_Info_init(Pk11Install_Info* _this);
+ void
+ Pk11Install_Info_delete(Pk11Install_Info* _this);
+ /*// Returns NULL for success, error message if parse error.*/
+-- 
+1.8.4.5
+
diff --git a/meta/recipes-support/nss/nss_3.19.2.bb b/meta/recipes-support/nss/nss_3.21.bb
similarity index 95%
rename from meta/recipes-support/nss/nss_3.19.2.bb
rename to meta/recipes-support/nss/nss_3.21.bb
index c51b056..24892b4 100644
--- a/meta/recipes-support/nss/nss_3.19.2.bb
+++ b/meta/recipes-support/nss/nss_3.21.bb
@@ -15,17 +15,18 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI = "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_19_2_RTM/src/${BP}.tar.gz \
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_21_RTM/src/${BP}.tar.gz \
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
     file://nss-fix-nsinstall-build.patch \
+    file://0001-Fix-build-failure-on-opensuse-13.1.patch \
     file://nss.pc.in \
     file://signlibs.sh \
 "
 
-SRC_URI[md5sum] = "b02ffd1e8e8ef5f8512fa02d8ca9db3d"
-SRC_URI[sha256sum] = "1306663e8f61d8449ad8cbcffab743a604dcd9f6f34232c210847c51dce2c9ae"
+SRC_URI[md5sum] = "3c8b2ed880dd3a8d86c9e0151afe6eba"
+SRC_URI[sha256sum] = "3f7a5b027d7cdd5c0e4ff7544da33fdc6f56c2f8c27fff02938fd4a6fbe87239"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
@@ -84,6 +85,8 @@ do_compile() {
         export USE_X32=1
     fi
 
+    export NSS_DISABLE_GTESTS=1
+
     # We can modify CC in the environment, but if we set it via an
     # argument to make, nsinstall, a host program, will also build with it!
     #
@@ -129,6 +132,8 @@ do_install() {
         export USE_X32=1
     fi
 
+    export NSS_DISABLE_GTESTS=1
+
     make -C ./nss \
         CCC="${CXX}" \
         OS_TEST=${OS_TEST} \
-- 
2.6.4


