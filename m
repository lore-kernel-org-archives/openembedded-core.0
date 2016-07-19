Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE8B60290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 12:17:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2016 05:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,389,1464678000"; d="scan'208";a="141829434"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2016 05:17:01 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2016 15:16:35 +0300
Message-Id: <1468930595-24113-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1468310468.git.jussi.kukkonen@intel.com>
References: <cover.1468310468.git.jussi.kukkonen@intel.com>
Subject: [PATCH] piglit: Add build fix patch
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
X-List-Received-Date: Tue, 19 Jul 2016 12:17:03 -0000

Fixes [YOCTO #9851] (fingers crossed).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

This is a potential build fix for a problem Martin reported that I
couldn't reproduce myself.

I've pushed this on top of the piglit branch that isn't yet merged.

  git://git.yoctoproject.org/poky-contrib jku/piglit
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/piglit

Thanks, 
  Jussi


 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
new file mode 100644
index 0000000..d591da5
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
@@ -0,0 +1,54 @@
+From 73e4fbc5777eddd89bb0fb16e90343551fe3e0ef Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 5 Jul 2016 10:56:23 +0300
+Subject: [PATCH] cmake: Link utils with xcb explicitly
+
+Linking with g++ can reportedly lead to:
+
+libpiglitutil_gl.so.0: error: undefined reference to 'xcb_connect'
+libpiglitutil_gl.so.0: error: undefined reference to 'xcb_get_setup'
+libpiglitutil_gl.so.0: error: undefined reference to 'xcb_setup_roots_iterator'
+
+This may have appeared now because xcb-dri2 used to overlink publicly
+but now does not.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Pending
+---
+ CMakeLists.txt            | 1 +
+ tests/util/CMakeLists.txt | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8e2abba..2e1a473 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -151,6 +151,7 @@ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+ 
+ 	pkg_check_modules(LIBDRM QUIET libdrm)
+ 	pkg_check_modules(LIBDRM_INTEL QUIET libdrm_intel)
++	pkg_check_modules(XCB QUIET xcb)
+ 	pkg_check_modules(XCB_DRI2 QUIET xcb-dri2)
+ 	pkg_check_modules(GLPROTO QUIET glproto)
+ ELSEIF(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
+diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
+index fb22ffa..e1f8073 100644
+--- a/tests/util/CMakeLists.txt
++++ b/tests/util/CMakeLists.txt
+@@ -121,11 +121,13 @@ if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+ 
+ 		list(APPEND UTIL_GL_LIBS
+ 			${LIBDRM_LDFLAGS}
++			${XCB_LDFLAGS}
+ 			${XCB_DRI2_LDFLAGS}
+ 		)
+ 
+ 		list(APPEND UTIL_GL_INCLUDES
+ 			${LIBDRM_INCLUDE_DIRS}
++			${XCB_INCLUDE_DIRS}
+ 			${XCB_DRI2_INCLUDE_DIRS}
+ 		)
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index f5ef364..f14a7b4 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
+           file://0001-cmake-Link-utils-with-xcb-explicitly.patch \
            "
 
 # From 2016-07-07
-- 
2.1.4


