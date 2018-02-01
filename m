Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 77784786C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465194"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:02:01 +0200
Message-Id: <20180201180210.21652-11-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/20] boost: update to 1.66.0
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:22 -0000

Rework 0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch to
remove the offending bits from the function instead of removing
calls to the function all over the place.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...bjam-native_1.65.1.bb => bjam-native_1.66.0.bb} |   0
 .../boost/{boost-1.65.1.inc => boost-1.66.0.inc}   |   4 +-
 ...or-which-appeared-when-compiling-non-c-co.patch |  28 -----
 ...Don-t-set-up-m32-m64-we-do-that-ourselves.patch | 138 ++++++++-------------
 ...p-arch-instruction-set-flags-we-do-that-o.patch |  22 ++--
 .../boost/{boost_1.65.1.bb => boost_1.66.0.bb}     |   1 -
 6 files changed, 70 insertions(+), 123 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.65.1.bb => bjam-native_1.66.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.65.1.inc => boost-1.66.0.inc} (85%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch
 rename meta/recipes-support/boost/{boost_1.65.1.bb => boost_1.66.0.bb} (83%)

diff --git a/meta/recipes-support/boost/bjam-native_1.65.1.bb b/meta/recipes-support/boost/bjam-native_1.66.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.65.1.bb
rename to meta/recipes-support/boost/bjam-native_1.66.0.bb
diff --git a/meta/recipes-support/boost/boost-1.65.1.inc b/meta/recipes-support/boost/boost-1.66.0.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.65.1.inc
rename to meta/recipes-support/boost/boost-1.66.0.inc
index f0ca88ca3e9..fe2b8639f79 100644
--- a/meta/recipes-support/boost/boost-1.65.1.inc
+++ b/meta/recipes-support/boost/boost-1.66.0.inc
@@ -12,8 +12,8 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "41d7542ce40e171f3f7982aff008ff0d"
-SRC_URI[sha256sum] = "9807a5d16566c57fd74fb522764e0b134a8bbe6b6e8967b83afefd30dcd3be81"
+SRC_URI[md5sum] = "b2dfbd6c717be4a7bb2d88018eaccf75"
+SRC_URI[sha256sum] = "5721818253e6a0989583192f96782c4a98eb6204965316df9f5ad75819225ca9"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch b/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch
deleted file mode 100644
index f96005ebc75..00000000000
--- a/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 02fa5cee1b8d0321787113e2dc10b162c657f333 Mon Sep 17 00:00:00 2001
-From: Robert Ramey <ramey@rrsd.com>
-Date: Wed, 1 Feb 2017 16:43:59 -0800
-Subject: [PATCH] correct error which appeared when compiling non c++ compliant
- code for arrays
-
-Upstream-Status: Backport [expected to be released in v1.65]
-
----
- boost/serialization/array.hpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/boost/serialization/array.hpp b/boost/serialization/array.hpp
-index 61708b3..612d1a6 100644
---- a/boost/serialization/array.hpp
-+++ b/boost/serialization/array.hpp
-@@ -23,6 +23,8 @@ namespace std{
- } // namespace std
- #endif
- 
-+#include <boost/serialization/array_wrapper.hpp>
-+
- #ifndef BOOST_NO_CXX11_HDR_ARRAY
- 
- #include <array>
--- 
-2.9.3
-
diff --git a/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch b/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
index e9c7e4c555b..26f3cbb0512 100644
--- a/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
+++ b/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
@@ -1,97 +1,65 @@
-From c0e785f8da2caa6617052b1c7b347e0dffb1520d Mon Sep 17 00:00:00 2001
+From e4d3a7470b307693660d0412732e7266d1738d8c Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Tue, 13 Dec 2016 10:29:17 -0700
-Subject: [PATCH 2/3] Don't set up -m32/-m64, we do that ourselves
+Subject: [PATCH 6/6] Don't set up -m32/-m64, we do that ourselves
 
 Upstream-Status: Inappropriate
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
 ---
- tools/build/src/tools/gcc.jam | 10 ----------
- 1 file changed, 10 deletions(-)
+ tools/build/src/tools/gcc.jam | 39 ---------------------------------------
+ 1 file changed, 39 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 0f346a5..942f141 100644
+index e4fc6c32..37914fd0 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -509,7 +509,6 @@ rule compile.c++.pch ( targets * : sources * : properties * )
- {
-     setup-threading $(targets) : $(sources) : $(properties) ;
-     setup-fpic $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
- }
- 
- actions compile.c++.pch
-@@ -521,7 +520,6 @@ rule compile.c.pch ( targets * : sources * : properties * )
- {
-     setup-threading $(targets) : $(sources) : $(properties) ;
-     setup-fpic $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
- }
- 
- actions compile.c.pch
-@@ -533,7 +531,6 @@ rule compile.c++.preprocess ( targets * : sources * : properties * )
- {
-     setup-threading $(targets) : $(sources) : $(properties) ;
-     setup-fpic $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
- 
-     # Some extensions are compiled as C++ by default. For others, we need to
-     # pass -x c++. We could always pass -x c++ but distcc does not work with it.
-@@ -548,7 +545,6 @@ rule compile.c.preprocess ( targets * : sources * : properties * )
- {
-     setup-threading $(targets) : $(sources) : $(properties) ;
-     setup-fpic $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
- 
-     # If we use the name g++ then default file suffix -> language mapping does
-     # not work. So have to pass -x option. Maybe, we can work around this by
-@@ -564,7 +560,6 @@ rule compile.c++ ( targets * : sources * : properties * )
- {
-     setup-threading $(targets) : $(sources) : $(properties) ;
-     setup-fpic $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
- 
-     # Some extensions are compiled as C++ by default. For others, we need to
-     # pass -x c++. We could always pass -x c++ but distcc does not work with it.
-@@ -594,7 +589,6 @@ rule compile.c ( targets * : sources * : properties * )
- {
-     setup-threading $(targets) : $(sources) : $(properties) ;
-     setup-fpic $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
- 
-     # If we use the name g++ then default file suffix -> language mapping does
-     # not work. So have to pass -x option. Maybe, we can work around this by
-@@ -610,7 +604,6 @@ rule compile.fortran ( targets * : sources * : properties * )
- {
-     setup-threading $(targets) : $(sources) : $(properties) ;
-     setup-fpic $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
+@@ -337,45 +337,6 @@ rule set-address-model-options ( targets * : sources * : properties * )
+     {
+         local option ;
+         local target-os = [ feature.get-values target-os : $(properties) ] ;
+-        if $(target-os) = aix
+-        {
+-            if $(model) = 32
+-            {
+-                option = -maix32 ;
+-            }
+-            else
+-            {
+-                option = -maix64 ;
+-            }
+-        }
+-        else if $(target-os) = hpux
+-        {
+-            if $(model) = 32
+-            {
+-                option = -milp32 ;
+-            }
+-            else
+-            {
+-                option = -mlp64 ;
+-            }
+-        }
+-        else
+-        {
+-            local arch = [ feature.get-values architecture : $(properties) ] ;
+-            if $(arch) = power || $(arch) = sparc || $(arch) = x86
+-            {
+-                if $(model) = 32
+-                {
+-                    option = -m32 ;
+-                }
+-                else if $(model) = 64
+-                {
+-                    option = -m64 ;
+-                }
+-            }
+-            # For darwin, the model can be 32_64. darwin.jam will handle that
+-            # on its own.
+-        }
+         OPTIONS on $(targets) += $(option) ;
+     }
  }
- 
- actions compile.c++ bind PCH_FILE
-@@ -641,7 +634,6 @@ actions compile.fortran
- rule compile.asm ( targets * : sources * : properties * )
- {
-     setup-fpic $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
-     LANG on $(<) = "-x assembler-with-cpp" ;
- }
- 
-@@ -950,7 +942,6 @@ rule quote-rpath ( targets * )
- rule link ( targets * : sources * : properties * )
- {
-     setup-threading $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
-     SPACE on $(targets) = " " ;
-     # Serialize execution of the 'link' action, since running N links in
-     # parallel is just slower. For now, serialize only gcc links, it might be a
-@@ -1018,7 +1009,6 @@ actions piecemeal archive
- rule link.dll ( targets * : sources * : properties * )
- {
-     setup-threading $(targets) : $(sources) : $(properties) ;
--    setup-address-model $(targets) : $(sources) : $(properties) ;
-     SPACE on $(targets) = " " ;
-     JAM_SEMAPHORE on $(targets) = <s>gcc-link-semaphore ;
-     quote-rpath $(targets) ;
 -- 
-2.8.0
+2.15.1
+
diff --git a/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 6bb25f885c5..fb6d9711b96 100644
--- a/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,20 +1,21 @@
-From 7c49525812567f1219706c4ed330b3bd2cc8e94a Mon Sep 17 00:00:00 2001
+From 0868761e7d2d75d472090e3ef96f3d2f9ced27f3 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Tue, 13 Dec 2016 10:29:32 -0700
-Subject: [PATCH 3/3] Don't set up arch/instruction-set flags, we do that
+Subject: [PATCH 5/6] Don't set up arch/instruction-set flags, we do that
  ourselves
 
 Upstream-Status: Inappropriate
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
 ---
- tools/build/src/tools/gcc.jam | 121 ------------------------------------------
- 1 file changed, 121 deletions(-)
+ tools/build/src/tools/gcc.jam | 127 ------------------------------------------
+ 1 file changed, 127 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 942f141..d062c20 100644
+index e3b1b952..e4fc6c32 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1068,124 +1068,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1276,130 +1276,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
@@ -60,6 +61,10 @@ index 942f141..d062c20 100644
 -cpu-flags gcc OPTIONS : x86 : core-avx-i : -march=core-avx-i ;
 -cpu-flags gcc OPTIONS : x86 : ivy-bridge : -march=core-avx-i ;
 -cpu-flags gcc OPTIONS : x86 : haswell : -march=core-avx-i -mavx2 -mfma -mbmi -mbmi2 -mlzcnt ;
+-cpu-flags gcc OPTIONS : x86 : broadwell : -march=broadwell ;
+-cpu-flags gcc OPTIONS : x86 : skylake : -march=skylake ;
+-cpu-flags gcc OPTIONS : x86 : skylake-avx512 : -march=skylake-avx512 ;
+-cpu-flags gcc OPTIONS : x86 : cannonlake : -march=skylake-avx512 -mavx512vbmi -mavx512ifma -msha ;
 -cpu-flags gcc OPTIONS : x86 : k6 : -march=k6 ;
 -cpu-flags gcc OPTIONS : x86 : k6-2 : -march=k6-2 ;
 -cpu-flags gcc OPTIONS : x86 : k6-3 : -march=k6-3 ;
@@ -81,8 +86,10 @@ index 942f141..d062c20 100644
 -cpu-flags gcc OPTIONS : x86 : bdver1 : -march=bdver1 ;
 -cpu-flags gcc OPTIONS : x86 : bdver2 : -march=bdver2 ;
 -cpu-flags gcc OPTIONS : x86 : bdver3 : -march=bdver3 ;
+-cpu-flags gcc OPTIONS : x86 : bdver4 : -march=bdver4 ;
 -cpu-flags gcc OPTIONS : x86 : btver1 : -march=btver1 ;
 -cpu-flags gcc OPTIONS : x86 : btver2 : -march=btver2 ;
+-cpu-flags gcc OPTIONS : x86 : znver1 : -march=znver1 ;
 -cpu-flags gcc OPTIONS : x86 : winchip-c6 : -march=winchip-c6 ;
 -cpu-flags gcc OPTIONS : x86 : winchip2 : -march=winchip2 ;
 -cpu-flags gcc OPTIONS : x86 : c3 : -march=c3 ;
@@ -140,4 +147,5 @@ index 942f141..d062c20 100644
 -# AIX variant of RS/6000 & PowerPC
 -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
 -- 
-2.8.0
+2.15.1
+
diff --git a/meta/recipes-support/boost/boost_1.65.1.bb b/meta/recipes-support/boost/boost_1.66.0.bb
similarity index 83%
rename from meta/recipes-support/boost/boost_1.65.1.bb
rename to meta/recipes-support/boost/boost_1.66.0.bb
index 9ba56703a5c..63b82a5995c 100644
--- a/meta/recipes-support/boost/boost_1.65.1.bb
+++ b/meta/recipes-support/boost/boost_1.66.0.bb
@@ -8,5 +8,4 @@ SRC_URI += "\
     file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
     file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
     file://0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch \
-    file://0001-correct-error-which-appeared-when-compiling-non-c-co.patch \
 "
-- 
2.15.1


