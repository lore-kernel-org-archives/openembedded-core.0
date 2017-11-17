Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFB378867
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 12:02:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2017 04:02:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,409,1505804400"; 
   d="scan'208";a="3341774"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 17 Nov 2017 04:02:52 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 14:02:54 +0200
Message-Id: <5fd0b679e9a7310b4988c304343fad77f0ebe7ff.1510920094.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 9/9] meson: export native env only for native build
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
X-List-Received-Date: Fri, 17 Nov 2017 12:02:51 -0000

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
index 64553cd8f3d..f64377efcba 100644
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
     return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
 
@@ -91,6 +84,18 @@ meson_do_configure() {
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
2.15.0


