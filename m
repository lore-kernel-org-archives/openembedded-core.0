Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A47B2789AE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652044"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:32 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:06 +0200
Message-Id: <20180309185614.31113-28-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 28/36] mesa: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:32 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ....vulkan.am-explictly-add-lib-expat-to-intel-.patch | 13 +++++--------
 .../files/0001-Use-wayland-scanner-in-the-path.patch  | 19 ++++++++-----------
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
index ff8eda458c2..f908d46550e 100644
--- a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
@@ -28,10 +28,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  src/intel/Makefile.vulkan.am | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/src/intel/Makefile.vulkan.am b/src/intel/Makefile.vulkan.am
-index 271b0a5..8fbe2c8 100644
---- a/src/intel/Makefile.vulkan.am
-+++ b/src/intel/Makefile.vulkan.am
+Index: mesa-17.3.6/src/intel/Makefile.vulkan.am
+===================================================================
+--- mesa-17.3.6.orig/src/intel/Makefile.vulkan.am
++++ mesa-17.3.6/src/intel/Makefile.vulkan.am
 @@ -144,6 +144,7 @@ VULKAN_LIB_DEPS = \
  	$(LIBDRM_LIBS) \
  	$(PTHREAD_LIBS) \
@@ -39,7 +39,4 @@ index 271b0a5..8fbe2c8 100644
 +	$(EXPAT_LIBS) \
  	-lm
  
- if HAVE_PLATFORM_X11
--- 
-2.7.4
-
+ if HAVE_PLATFORM_ANDROID
diff --git a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
index eb6ff4ff044..2444b2846b0 100644
--- a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  configure.ac | 7 +------
  1 file changed, 1 insertion(+), 6 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 2c7e636fac..d2b2350739 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2174,12 +2174,7 @@ if test "x$with_platforms" != xauto; then
-     with_egl_platforms=$with_platforms
+Index: mesa-17.3.6/configure.ac
+===================================================================
+--- mesa-17.3.6.orig/configure.ac
++++ mesa-17.3.6/configure.ac
+@@ -1694,12 +1694,7 @@ if test "x$with_platforms" = xauto; then
+     with_platforms=$with_egl_platforms
  fi
  
 -PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
@@ -30,8 +30,5 @@ index 2c7e636fac..d2b2350739 100644
 -fi
 +AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
  
- # Do per-EGL platform setups and checks
- egl_platforms=`IFS=', '; echo $with_egl_platforms`
--- 
-2.13.0
-
+ PKG_CHECK_EXISTS([wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], [have_wayland_protocols=yes], [have_wayland_protocols=no])
+ if test "x$have_wayland_protocols" = xyes; then
-- 
2.16.1


