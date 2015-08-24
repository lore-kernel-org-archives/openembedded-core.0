Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 72EC876BC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:54:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 24 Aug 2015 05:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,737,1432623600"; d="scan'208";a="754330065"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2015 05:54:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:55:51 +0300
Message-Id: <ceae3553f28d4f66d289d37cf9fac273516747f0.1440420666.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b93e9e96bb37641bf112d201daeb837d04d50363.1440420666.git.jussi.kukkonen@intel.com>
References: <b93e9e96bb37641bf112d201daeb837d04d50363.1440420666.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1440420666.git.jussi.kukkonen@intel.com>
References: <cover.1440420666.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 3/3] libical: Upgrade 1.0.0 -> 1.0.1
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
X-List-Received-Date: Mon, 24 Aug 2015 12:54:09 -0000

* Build system changed to cmake.
* Patch build system to not check for perl (we use host
  perl which won't be found)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libical/Remove-cmake-check-for-Perl.patch      | 33 ++++++++++++++++++++++
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb} | 12 +++++---
 2 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (61%)

diff --git a/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch b/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
new file mode 100644
index 0000000..fe43373
--- /dev/null
+++ b/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
@@ -0,0 +1,33 @@
+From 918cd8764a845a9d25918a444fbaa5070d2be609 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 21 Aug 2015 16:38:05 +0300
+Subject: [PATCH] Remove cmake check for Perl
+
+We set "CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY" in cmake bbclass to
+make sure cmake does not find host programs. In this case we actually
+are fine with host perl: remove the check.
+
+Inappropriate [workaround]
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d5aad80..5cc9863 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -91,8 +91,7 @@ if(SHARED_ONLY)
+   set(LIBRARY_TYPE SHARED)
+ endif()
+ 
+-# must have Perl to create the derived stuff
+-find_package(Perl REQUIRED)
++set(PERL_EXECUTABLE perl)
+ 
+ # MSVC specific definitions
+ if(WIN32)
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes-support/libical/libical_1.0.1.bb
similarity index 61%
rename from meta/recipes-support/libical/libical_1.0.0.bb
rename to meta/recipes-support/libical/libical_1.0.1.bb
index be6b635..7dcb9eb 100644
--- a/meta/recipes-support/libical/libical_1.0.0.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -6,8 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
                     file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION = "libs"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "f4b8e33ae5efb2f025eb43ce69682a36"
-SRC_URI[sha256sum] = "0072e83834092315772e6719b85fc8b11530b1ff53f4d108315fb38cddbce8c2"
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz \
+           file://Remove-cmake-check-for-Perl.patch \
+           "
+SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
+SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
 
-inherit autotools
+inherit cmake
+
+FILES_${PN}-dev += "${libdir}/cmake/*"
-- 
2.1.4


