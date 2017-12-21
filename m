Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4930E7870F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 13:10:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Dec 2017 05:10:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,435,1508828400"; d="scan'208";a="14537350"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Dec 2017 05:10:15 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Dec 2017 15:04:33 +0200
Message-Id: <20171221130434.24427-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
References: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 8/9] meson: export native env only for native build
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
X-List-Received-Date: Thu, 21 Dec 2017 13:10:15 -0000

From: Martin Kelly <mkelly@xevo.com>

Although the meson crossfile should take care of setting the right cross
environment for a target build, meson slurps any set CFLAGS, CXXFLAGS,
LDFLAGS, and CPPFLAGS from the environment and injects them into the
build (see mesonbuild/environment.py:get_args_from_envvars for details).

This means that we are seeing native CFLAGS, CXXFLAGS, LDFLAGS, and
CPPFLAGS in the target build, which is wrong and causes build failures
when target and native have libraries in common (the linker gets
confused and bails).

That said, we *do* need to set certain vars for all builds so that meson
can find the right build tools. Without this, meson will fail during its
sanity checking step because it will determine the build tools to be
unrunnable since they output target instead of native artifacts.

The solution to all of this is to set CC, CXX, LD, and AR globally to
the native tools while setting the other native vars *only* for the
native build. For target builds, these vars will get overridden by the
cross file as we expect.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/meson.bbclass | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 5953b5d698c..b72e5207abc 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -9,13 +9,6 @@ do_configure[cleandirs] = "${B}"
 # Where the meson.build build configuration is
 MESON_SOURCEPATH = "${S}"
 
-# These variables in the environment override meson's *native* tools settings.
-# We have to unset them, so that meson doesn't pick up the cross tools and
-# use them for native builds.
-unset CC
-unset CXX
-unset AR
-
 def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
 
@@ -92,6 +85,18 @@ meson_do_configure() {
     fi
 }
 
+meson_do_configure_prepend_class-target() {
+    # Set these so that meson uses the native tools for its build sanity tests,
+    # which require executables to be runnable. The cross file will still
+    # override these for the target build. Note that we do *not* set CFLAGS,
+    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
+    # target build, causing errors.
+    export CC="${BUILD_CC}"
+    export CXX="${BUILD_CXX}"
+    export LD="${BUILD_LD}"
+    export AR="${BUILD_AR}"
+}
+
 meson_do_configure_prepend_class-native() {
     export PKG_CONFIG="pkg-config-native"
 }
-- 
2.15.1


