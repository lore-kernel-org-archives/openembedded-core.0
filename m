Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5316A78993
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652038"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:30 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:05 +0200
Message-Id: <20180309185614.31113-27-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 27/36] drm: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:30 -0000

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
 ...ac-Allow-explicit-enabling-of-cunit-tests.patch | 25 ++++++++++------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch b/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
index bf526370b0c..40bebc0f50c 100644
--- a/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
+++ b/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
@@ -12,11 +12,11 @@ Upstream-Status: Submitted [mailing list]
  configure.ac | 14 ++++++++++++--
  1 file changed, 12 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index e3048c7..918d21d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,6 +137,12 @@ AC_ARG_ENABLE(install-test-programs,
+Index: libdrm-2.4.91/configure.ac
+===================================================================
+--- libdrm-2.4.91.orig/configure.ac
++++ libdrm-2.4.91/configure.ac
+@@ -163,6 +163,12 @@ AC_ARG_ENABLE(install-test-programs,
  		  [Install test programs (default: no)]),
  		  [INSTALL_TESTS=$enableval], [INSTALL_TESTS=no])
  
@@ -29,8 +29,8 @@ index e3048c7..918d21d 100644
  dnl ===========================================================================
  dnl check compiler flags
  AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
-@@ -372,7 +378,7 @@ if test "x$RADEON" = xyes; then
- 	AC_DEFINE(HAVE_RADEON, 1, [Have radeon support])
+@@ -411,7 +417,7 @@ else
+ 	AC_DEFINE(HAVE_RADEON, 0)
  fi
  
 -if test "x$AMDGPU" != xno; then
@@ -38,8 +38,8 @@ index e3048c7..918d21d 100644
  	# Detect cunit library
  	PKG_CHECK_MODULES([CUNIT], [cunit >= 2.1], [have_cunit=yes], [have_cunit=no])
  	# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
-@@ -399,7 +406,11 @@ if test "x$AMDGPU" = xyes; then
- 	AC_DEFINE(HAVE_CUNIT, [test "x$have_cunit" != "xno"], [Enable CUNIT Have amdgpu support])
+@@ -436,7 +442,11 @@ if test "x$AMDGPU" = xyes; then
+ 	AC_DEFINE(HAVE_AMDGPU, 1, [Have amdgpu support])
  
  	if test "x$have_cunit" = "xno"; then
 -		AC_MSG_WARN([Could not find cunit library. Disabling amdgpu tests])
@@ -49,8 +49,5 @@ index e3048c7..918d21d 100644
 +			AC_MSG_WARN([Could not find cunit library. Disabling amdgpu tests])
 +		fi
  	fi
- fi
- 
--- 
-2.1.4
-
+ else
+ 	AC_DEFINE(HAVE_AMDGPU, 0)
-- 
2.16.1


