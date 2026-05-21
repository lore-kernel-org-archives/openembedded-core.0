Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E67CD4F54
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 00:39:50 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26496.1779323982239002545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 17:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 21 May 2026 09:39:39 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.151 with ESMTP; 21 May 2026 09:39:39 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH 1/2] clang: introduce thin-lto-pgo PACKAGECONFIG for PGO bootstrap
Date: Thu, 21 May 2026 09:39:28 +0900
Message-ID: <20260521003929.14947-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 00:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237469

From: "mark.yang" <mark.yang@lge.com>

Introduce thin-lto-pgo PACKAGECONFIG enabling clang's PGO+ThinLTO bootstrap for standalone clang builds.
clang-native and llvm-native are separate recipes, so the PGO build runs in standalone mode.

Using PGO only for clang optimizes only the frontend, so it is recommended to also apply PGO optimization to libLLVM (mid-end, backend).
llvm-project assumes PGO optimization is performed when clang and llvm are in a monorepo.

Selected the top 10 components using clang as a toolchain in core-image-sato and compared their do_compile time from buildstat.
Built sequentially to avoid warm cache hits and performed 10 cycles.
Compared the median of compile time.
AMD Ryzen 9 7950x (16 cores, 32 threads)
BB_NUMBER_THREADS = "32"
PARALLEL_MAKE = "-j 32"
TOOLCHAIN = "clang"
PACKAGECONFIG:append:pn-clang-native = " thin-lto-pgo"

Recipe         baseline (s)   thin-lto-pgo (s)   diff
sqlite3        36.455         35.550             -2.5%
fmt            24.770         21.685             -12.5%
perl           36.470         35.250             -3.3%
libunistring   36.300         30.820             -15.1%
icu            30.930         19.840             -35.9%
librsvg        73.785         74.700             +1.2%
mesa           39.610         28.380             -28.4%
openssl        27.505         20.485             -25.5%
binutils       36.855         33.280             -9.7%
busybox        18.100         16.925             -6.5%

One-time bootstrap cost: clang-native do_compile 448s -> 1307s

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...opagate-OE-sysroot-flags-to-sub-buil.patch | 44 ++++++++++
 ...-stage2-install-to-bootstrap-targets.patch | 50 ++++++++++++
 ...-training-out-of-CLANG_INCLUDE_TESTS.patch | 60 ++++++++++++++
 ...mptions-for-standalone-PGO-bootstrap.patch | 80 +++++++++++++++++++
 ...-DEPENDS-in-standalone-clang-PGO-boo.patch | 59 ++++++++++++++
 ...ld-in-standalone-clang-PGO-bootstrap.patch | 41 ++++++++++
 meta/recipes-devtools/clang/clang_git.bb      | 23 +++++-
 meta/recipes-devtools/clang/common.inc        |  6 ++
 8 files changed, 362 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/clang/clang/0042-perf-training-Propagate-OE-sysroot-flags-to-sub-buil.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0043-PGO.cmake-Add-stage2-install-to-bootstrap-targets.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0044-Move-perf-training-out-of-CLANG_INCLUDE_TESTS.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0045-Fix-path-assumptions-for-standalone-PGO-bootstrap.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0046-Skip-llvm-config-DEPENDS-in-standalone-clang-PGO-boo.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0047-Allow-external-lld-in-standalone-clang-PGO-bootstrap.patch

diff --git a/meta/recipes-devtools/clang/clang/0042-perf-training-Propagate-OE-sysroot-flags-to-sub-buil.patch b/meta/recipes-devtools/clang/clang/0042-perf-training-Propagate-OE-sysroot-flags-to-sub-buil.patch
new file mode 100644
index 0000000000..4e5b25f28d
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0042-perf-training-Propagate-OE-sysroot-flags-to-sub-buil.patch
@@ -0,0 +1,44 @@
+From 8d706f148ad956eb65faeabb5e870aeebdc13651 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 19 Mar 2026 17:42:22 +0900
+Subject: perf-training: Propagate OE sysroot flags to sub-build
+
+Propagate OE sysroot paths to sub-builds (cmake projects) in PGO/BOLT perf-training.
+If sysroot paths from the OE build environment are not passed to sub-builds,
+headers/libraries cannot be found, causing build failures.
+
+The lit framework only passes its own environment variables (such as PATH) when running tests,
+and does not pass CFLAGS/CXXFLAGS/LDFLAGS (see lit/TestingConfig.py).
+Therefore, these must be explicitly added to config.environment to propagate to sub-build cmake.
+
+cmake automatically uses CFLAGS/CXXFLAGS environment variables as initial values for CMAKE_C/CXX_FLAGS
+on the first configure. The environment variables exported by OE's do_compile
+contain only sysroot paths (such as -isystem), and do not include PGO/LTO/BOLT flags
+(these are added at the cmake level). Thus, sysroot paths can be cleanly propagated via environment variables.
+
+However, LDFLAGS are not automatically used by cmake, so they must be explicitly passed as CMAKE_EXE_LINKER_FLAGS.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ clang/utils/perf-training/lit.cfg | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/clang/utils/perf-training/lit.cfg b/clang/utils/perf-training/lit.cfg
+index 3f6089b71..0e1ad1147 100644
+--- a/clang/utils/perf-training/lit.cfg
++++ b/clang/utils/perf-training/lit.cfg
+@@ -37,6 +37,13 @@ config.test_format = lit.formats.ShTest(use_lit_shell == "0")
+ config.cmake_compiler_args = '-DCMAKE_C_COMPILER="{0}" -DCMAKE_CXX_COMPILER="{0};--driver-mode=g++"'.format(
+    config.clang.replace(' ', ';')
+ )
++for var in ['CFLAGS', 'CXXFLAGS']:
++    val = os.environ.get(var, '')
++    if val:
++        config.environment[var] = val
++ldflags = os.environ.get('LDFLAGS', '')
++if ldflags:
++    config.cmake_compiler_args += ' -DCMAKE_EXE_LINKER_FLAGS="{}"'.format(ldflags)
+ config.substitutions.append( ('%clang_cpp_skip_driver', ' %s %s %s ' % (cc1_wrapper, config.clang, sysroot_flags)))
+ config.substitutions.append( ('%clang_cpp', ' %s --driver-mode=g++ %s ' % (config.clang, sysroot_flags)))
+ config.substitutions.append( ('%clang_skip_driver', ' %s %s %s ' % (cc1_wrapper, config.clang, sysroot_flags)))
diff --git a/meta/recipes-devtools/clang/clang/0043-PGO.cmake-Add-stage2-install-to-bootstrap-targets.patch b/meta/recipes-devtools/clang/clang/0043-PGO.cmake-Add-stage2-install-to-bootstrap-targets.patch
new file mode 100644
index 0000000000..3fc327ab9b
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0043-PGO.cmake-Add-stage2-install-to-bootstrap-targets.patch
@@ -0,0 +1,50 @@
+From d4abf54e7fcf9a7e307f5e4a33899d53d40295df Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 19 Mar 2026 17:47:36 +0900
+Subject: PGO.cmake: Add stage2-install to bootstrap targets
+
+PGO.cmake defines stage2-install-distribution as a bootstrap target,
+but does not define stage2-install.
+In build environments where LLVM_DISTRIBUTION_COMPONENTS is not set
+(e.g. Yocto/OE), the install-distribution target does nothing and installs nothing.
+
+The clang bootstrap mechanism (clang/CMakeLists.txt:840-847) already creates
+the ${NEXT_CLANG_STAGE}-install target at each stage via the "really-install" ExternalProject step.
+This target executes the command "cmake --build <BINARY_DIR> --target install"
+within the build directory of the next stage.
+
+If you add stage2-install to CLANG_BOOTSTRAP_TARGETS in PGO.cmake,
+the following installation chain is constructed.
+Stage 1: ExternalProject step "stage2-install"
+  cmake --build stage2-instrumented-bins/ --target stage2-install
+Stage 2: really-install mechanism's stage2-install target
+  cmake --build stage2-bins/ --target install
+Stage 3: install target executes
+  PGO+ThinLTO optimized binaries install to ${DESTDIR}
+
+The reason why it is not necessary to add "install" to CLANG_BOOTSTRAP_TARGETS
+in PGO-stage2-instrumented.cmake is as follows.
+1. "install" is a reserved ExternalProject built-in step name.
+ExternalProject_Add_Step would conflict with the existing install step's stamp file
+(stage2-stamps/stage2-install.rule)
+2. "really-install" mechanism aleary creates the ${NEXT_CLANG_STAGE}-install
+target independently of CLANG_BOOTSTRAP_TARGETS
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ clang/cmake/caches/PGO.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/clang/cmake/caches/PGO.cmake b/clang/cmake/caches/PGO.cmake
+index d64711600..0b42c9bba 100644
+--- a/clang/cmake/caches/PGO.cmake
++++ b/clang/cmake/caches/PGO.cmake
+@@ -9,6 +9,7 @@ set(BOOTSTRAP_LLVM_BUILD_INSTRUMENTED IR CACHE BOOL "")
+ set(CLANG_BOOTSTRAP_TARGETS
+   generate-profdata
+   stage2
++  stage2-install
+   stage2-distribution
+   stage2-install-distribution
+   stage2-install-distribution-toolchain
diff --git a/meta/recipes-devtools/clang/clang/0044-Move-perf-training-out-of-CLANG_INCLUDE_TESTS.patch b/meta/recipes-devtools/clang/clang/0044-Move-perf-training-out-of-CLANG_INCLUDE_TESTS.patch
new file mode 100644
index 0000000000..fb79ee4fa6
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0044-Move-perf-training-out-of-CLANG_INCLUDE_TESTS.patch
@@ -0,0 +1,60 @@
+From 57f932c1701f4f6901d39ee3b57a85fb016d7fde Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 15 Apr 2026 08:29:40 +0900
+Subject: Move perf-training out of CLANG_INCLUDE_TESTS
+
+perf-training defines the generate-profdata target used by the PGO bootstrap build.
+However, it is currently enabled only when CLANG_INCLUDE_TESTS=ON.
+For distribution builds such as Yocto/OE, tests are usually disabled by setting this to OFF.
+
+But perf-training is a PGO utility, not a test target, and it is currently gated by that block.
+As a result, generate-profdata is unavailable to the PGO bootstrap build when
+CLANG_INCLUDE_TESTS=OFF.
+
+Move perf-training out of the CLANG_INCLUDE_TESTS block.
+
+This is safe because utils/perf-training/CMakeLists.txt adds targets only when
+LLVM_BUILD_INSTRUMENTED or CLANG_BOLT is enabled, so moving it out does not add
+any targets unless PGO or BOLT is actually in use.
+
+Also fix the path in lit.site.cfg.in for standalone builds.
+When llvm_src_dir is set from CMAKE_SOURCE_DIR, standalone clang builds end up
+using the clang source directory instead of the LLVM source directory.
+Set it to the proper LLVM source location instead.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/192163]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ clang/CMakeLists.txt                      | 3 ++-
+ clang/utils/perf-training/lit.site.cfg.in | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt
+index b650b3b98..2820e2b54 100644
+--- a/clang/CMakeLists.txt
++++ b/clang/CMakeLists.txt
+@@ -549,9 +549,10 @@ if( CLANG_INCLUDE_TESTS )
+   if(CLANG_BUILT_STANDALONE)
+     umbrella_lit_testsuite_end(check-all)
+   endif()
+-  add_subdirectory(utils/perf-training)
+ endif()
+ 
++add_subdirectory(utils/perf-training)
++
+ option(CLANG_INCLUDE_DOCS "Generate build targets for the Clang docs."
+   ${LLVM_INCLUDE_DOCS})
+ if( CLANG_INCLUDE_DOCS )
+diff --git a/clang/utils/perf-training/lit.site.cfg.in b/clang/utils/perf-training/lit.site.cfg.in
+index da81ec21a..43579b027 100644
+--- a/clang/utils/perf-training/lit.site.cfg.in
++++ b/clang/utils/perf-training/lit.site.cfg.in
+@@ -9,7 +9,7 @@ config.test_source_root = "@CLANG_PGO_TRAINING_DATA@"
+ config.target_triple = "@LLVM_TARGET_TRIPLE@"
+ config.python_exe = "@Python3_EXECUTABLE@"
+ config.cmake_exe = "@CMAKE_COMMAND@"
+-config.llvm_src_dir ="@CMAKE_SOURCE_DIR@"
++config.llvm_src_dir = "@LLVM_MAIN_SRC_DIR@"
+ config.cmake_generator ="@CMAKE_GENERATOR@"
+ config.use_llvm_build = @CLANG_PGO_TRAINING_USE_LLVM_BUILD@
+ 
diff --git a/meta/recipes-devtools/clang/clang/0045-Fix-path-assumptions-for-standalone-PGO-bootstrap.patch b/meta/recipes-devtools/clang/clang/0045-Fix-path-assumptions-for-standalone-PGO-bootstrap.patch
new file mode 100644
index 0000000000..26f32c1a18
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0045-Fix-path-assumptions-for-standalone-PGO-bootstrap.patch
@@ -0,0 +1,80 @@
+From bebb6024b146958bba6330042b1b380f69ef0c54 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Mon, 11 May 2026 14:38:36 +0900
+Subject: Fix path assumptions for standalone PGO bootstrap
+
+When clang-native is configured as a standalone clang build (rather
+than a monorepo) and LLVM is provided by a separate recipe
+(llvm-native) installed into the sysroot, LLVM_BINARY_DIR and
+LLVM_RUNTIME_OUTPUT_INTDIR resolve to llvm-native's install prefix
+(recipe-sysroot-native/usr). clang/runtime/CMakeLists.txt anchors
+output_resource_dir there, so libclang_rt.profile.a lands in the
+install tree and the clang in clang-native's build tree cannot find
+it in its own build tree.
+
+clang/CMakeLists.txt passes -DLLVM_PROFDATA=LLVM_RUNTIME_OUTPUT_INTDIR/
+llvm-profdata to the stage2 cmake.
+Those paths point at clang-native's build tree bin/ where the tools
+never exist.
+They are installed into the sysroot by llvm-native.
+stage2 generate-profdata then fails with FileNotFoundError when
+perf-helper.py merges the profile.
+
+Under CLANG_BUILT_STANDALONE, anchor output_resource_dir at
+CMAKE_BINARY_DIR and take llvm-profdata/llvm-profgen from
+LLVM_TOOLS_BINARY_DIR. Drop the add_dependencies on those tools in
+the standalone case since they are not build targets.
+
+Upstream-Status: Inappropriate [OE specific - standalone clang build]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ clang/CMakeLists.txt         | 16 ++++++++++++----
+ clang/runtime/CMakeLists.txt |  6 +++++-
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt
+index 2820e2b54..bd5527f42 100644
+--- a/clang/CMakeLists.txt
++++ b/clang/CMakeLists.txt
+@@ -755,12 +755,20 @@ if (CLANG_ENABLE_BOOTSTRAP)
+   endif()
+ 
+   if(BOOTSTRAP_LLVM_BUILD_INSTRUMENTED)
+-    add_dependencies(clang-bootstrap-deps llvm-profdata)
+-    set(PGO_OPT -DLLVM_PROFDATA=${LLVM_RUNTIME_OUTPUT_INTDIR}/llvm-profdata)
++    if(CLANG_BUILT_STANDALONE)
++      set(PGO_OPT -DLLVM_PROFDATA=${LLVM_TOOLS_BINARY_DIR}/llvm-profdata)
++    else()
++      add_dependencies(clang-bootstrap-deps llvm-profdata)
++      set(PGO_OPT -DLLVM_PROFDATA=${LLVM_RUNTIME_OUTPUT_INTDIR}/llvm-profdata)
++    endif()
+     string(TOUPPER "${BOOTSTRAP_LLVM_BUILD_INSTRUMENTED}" BOOTSTRAP_LLVM_BUILD_INSTRUMENTED)
+     if (BOOTSTRAP_LLVM_BUILD_INSTRUMENTED STREQUAL "CSSPGO")
+-      add_dependencies(clang-bootstrap-deps llvm-profgen)
+-      list(APPEND PGO_OPT -DLLVM_PROFGEN=${LLVM_RUNTIME_OUTPUT_INTDIR}/llvm-profgen)
++      if(CLANG_BUILT_STANDALONE)
++        list(APPEND PGO_OPT -DLLVM_PROFGEN=${LLVM_TOOLS_BINARY_DIR}/llvm-profgen)
++      else()
++        add_dependencies(clang-bootstrap-deps llvm-profgen)
++        list(APPEND PGO_OPT -DLLVM_PROFGEN=${LLVM_RUNTIME_OUTPUT_INTDIR}/llvm-profgen)
++      endif()
+     endif()
+   endif()
+ 
+diff --git a/clang/runtime/CMakeLists.txt b/clang/runtime/CMakeLists.txt
+index ff2605b23..7b6ba3194 100644
+--- a/clang/runtime/CMakeLists.txt
++++ b/clang/runtime/CMakeLists.txt
+@@ -67,7 +67,11 @@ if(LLVM_BUILD_EXTERNAL_COMPILER_RT AND EXISTS ${COMPILER_RT_SRC_ROOT}/)
+   endif()
+ 
+   include(GetClangResourceDir)
+-  get_clang_resource_dir(output_resource_dir PREFIX ${LLVM_BINARY_DIR})
++  if(CLANG_BUILT_STANDALONE)
++    get_clang_resource_dir(output_resource_dir PREFIX ${CMAKE_BINARY_DIR})
++  else()
++    get_clang_resource_dir(output_resource_dir PREFIX ${LLVM_BINARY_DIR})
++  endif()
+   get_clang_resource_dir(install_resource_dir)
+   ExternalProject_Add(compiler-rt
+     DEPENDS llvm-config clang ${compiler_rt_configure_deps}
diff --git a/meta/recipes-devtools/clang/clang/0046-Skip-llvm-config-DEPENDS-in-standalone-clang-PGO-boo.patch b/meta/recipes-devtools/clang/clang/0046-Skip-llvm-config-DEPENDS-in-standalone-clang-PGO-boo.patch
new file mode 100644
index 0000000000..21f67012ba
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0046-Skip-llvm-config-DEPENDS-in-standalone-clang-PGO-boo.patch
@@ -0,0 +1,59 @@
+From c13732ec5721b790b5c6004a474cd3d63fcf3f59 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 19 May 2026 16:29:00 +0900
+Subject: Skip llvm-config DEPENDS in standalone clang PGO bootstrap
+
+LLVM's add_llvm_tool installs tool binaries without EXPORT, so
+llvm-config never lands in LLVMExports.cmake. The target only exists
+in monorepo builds where LLVM is built alongside. In a standalone
+clang build against a sysroot-installed LLVM, ExternalProject_Add's
+DEPENDS llvm-config fails with "unknown target".
+
+The compiler-rt ExternalProject is gated by both
+LLVM_BUILD_EXTERNAL_COMPILER_RT=ON (set by oe-core's clang_git.bb)
+and EXISTS ${COMPILER_RT_SRC_ROOT}/. Regular OE builds skip the path
+silently because COMPILER_RT_SRC_ROOT isn't pointed anywhere real.
+Standalone PGO bootstrap pins LLVM_EXTERNAL_COMPILER_RT_SOURCE_DIR
+at a compiler-rt tree to build the profiling runtime in-tree, which
+trips both gates and reaches the broken DEPENDS.
+
+Skip the DEPENDS when llvm-config isn't a target, and point
+LLVM_CONFIG_PATH at LLVM_TOOLS_BINARY_DIR/llvm-config.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ clang/runtime/CMakeLists.txt | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/clang/runtime/CMakeLists.txt b/clang/runtime/CMakeLists.txt
+index 7b6ba3194..62381ce64 100644
+--- a/clang/runtime/CMakeLists.txt
++++ b/clang/runtime/CMakeLists.txt
+@@ -73,8 +73,16 @@ if(LLVM_BUILD_EXTERNAL_COMPILER_RT AND EXISTS ${COMPILER_RT_SRC_ROOT}/)
+     get_clang_resource_dir(output_resource_dir PREFIX ${LLVM_BINARY_DIR})
+   endif()
+   get_clang_resource_dir(install_resource_dir)
++
++  set(_compiler_rt_ep_deps clang)
++  if(TARGET llvm-config)
++    list(APPEND _compiler_rt_ep_deps llvm-config)
++    set(_compiler_rt_llvm_config_path ${LLVM_RUNTIME_OUTPUT_INTDIR}/llvm-config)
++  else()
++    set(_compiler_rt_llvm_config_path ${LLVM_TOOLS_BINARY_DIR}/llvm-config)
++  endif()
+   ExternalProject_Add(compiler-rt
+-    DEPENDS llvm-config clang ${compiler_rt_configure_deps}
++    DEPENDS ${_compiler_rt_ep_deps} ${compiler_rt_configure_deps}
+     PREFIX ${COMPILER_RT_PREFIX}
+     SOURCE_DIR ${COMPILER_RT_SRC_ROOT}
+     STAMP_DIR ${STAMP_DIR}
+@@ -87,7 +95,7 @@ if(LLVM_BUILD_EXTERNAL_COMPILER_RT AND EXISTS ${COMPILER_RT_SRC_ROOT}/)
+                -DCMAKE_MAKE_PROGRAM=${CMAKE_MAKE_PROGRAM}
+                -DCMAKE_C_COMPILER_LAUNCHER=${CMAKE_C_COMPILER_LAUNCHER}
+                -DCMAKE_CXX_COMPILER_LAUNCHER=${CMAKE_CXX_COMPILER_LAUNCHER}
+-               -DLLVM_CONFIG_PATH=${LLVM_RUNTIME_OUTPUT_INTDIR}/llvm-config
++               -DLLVM_CONFIG_PATH=${_compiler_rt_llvm_config_path}
+                -DLLVM_LIT_ARGS=${LLVM_LIT_ARGS}
+                -DCOMPILER_RT_OUTPUT_DIR=${output_resource_dir}
+                -DCOMPILER_RT_EXEC_OUTPUT_DIR=${LLVM_RUNTIME_OUTPUT_INTDIR}
diff --git a/meta/recipes-devtools/clang/clang/0047-Allow-external-lld-in-standalone-clang-PGO-bootstrap.patch b/meta/recipes-devtools/clang/clang/0047-Allow-external-lld-in-standalone-clang-PGO-bootstrap.patch
new file mode 100644
index 0000000000..c47ae70efb
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0047-Allow-external-lld-in-standalone-clang-PGO-bootstrap.patch
@@ -0,0 +1,41 @@
+From 5511c1a1c4731cf7a7f87a63c60d31c7b932ad52 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 19 May 2026 17:06:11 +0900
+Subject: Allow external lld in standalone clang PGO bootstrap
+
+When clang is built standalone against a sysroot-installed LLVM,
+lld is not a build target and LLVM_ENABLE_PROJECTS doesn't carry it.
+ld.lld comes from OE's lld-native recipe. BOOTSTRAP_LLVM_ENABLE_LLD=ON
+fails the LLVM_ENABLE_PROJECTS check with FATAL_ERROR, and
+add_dependencies(clang-bootstrap-deps lld) refers to a target that
+doesn't exist.
+
+Accept ld.lld under LLVM_TOOLS_BINARY_DIR in the guard, and skip the
+DEPENDS when lld isn't a target.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ clang/CMakeLists.txt | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt
+index bd5527f42..64c2f2616 100644
+--- a/clang/CMakeLists.txt
++++ b/clang/CMakeLists.txt
+@@ -620,10 +620,13 @@ if (CLANG_ENABLE_BOOTSTRAP)
+   if(BOOTSTRAP_LLVM_ENABLE_LLD)
+     # adding lld to clang-bootstrap-deps without having it enabled in
+     # LLVM_ENABLE_PROJECTS just generates a cryptic error message.
+-    if (NOT "lld" IN_LIST LLVM_ENABLE_PROJECTS)
++    if (NOT "lld" IN_LIST LLVM_ENABLE_PROJECTS
++        AND NOT EXISTS "${LLVM_TOOLS_BINARY_DIR}/ld.lld")
+       message(FATAL_ERROR "LLD is enabled in the bootstrap build, but lld is not in LLVM_ENABLE_PROJECTS")
+     endif()
+-    add_dependencies(clang-bootstrap-deps lld)
++    if(TARGET lld)
++      add_dependencies(clang-bootstrap-deps lld)
++    endif()
+   endif()
+ 
+   if (WIN32)
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 662cda1b2e..1b0ea69d49 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -32,6 +32,8 @@ PACKAGECONFIG ??= "build-id clangd libclang-python \
                    ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
                    "
 PACKAGECONFIG:remove:class-native = "lto thin-lto"
+PACKAGECONFIG:remove:class-target = "thin-lto-pgo"
+PACKAGECONFIG:remove:class-nativesdk = "thin-lto-pgo"
 
 PACKAGECONFIG[build-id] = "-DENABLE_LINKER_BUILD_ID=ON,-DENABLE_LINKER_BUILD_ID=OFF,,"
 PACKAGECONFIG[clangd] = "-DCLANG_ENABLE_CLANGD=ON,-DCLANG_ENABLE_CLANGD=OFF,,"
@@ -47,10 +49,13 @@ PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_IN
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[unwindlib] = "-DCLANG_DEFAULT_UNWINDLIB=libunwind,-DCLANG_DEFAULT_UNWINDLIB=libgcc,,"
 PACKAGECONFIG[libclang-python] = "-DCLANG_PYTHON_BINDINGS_VERSIONS=${PYTHON_BASEVERSION},,"
+PACKAGECONFIG[thin-lto-pgo] = "-DCLANG_LINK_CLANG_DYLIB=OFF -DBOOTSTRAP_LLVM_ENABLE_LLD=ON -DBOOTSTRAP_BOOTSTRAP_LLVM_ENABLE_LTO=Thin \
+                               -DLLVM_EXTERNAL_COMPILER_RT_SOURCE_DIR=${S}/compiler-rt -DLLVM_EXTERNAL_LIT=${S}/llvm/utils/lit/lit.py \
+                               -DCLANG_BOOTSTRAP_PASSTHROUGH='${PASSTHROUGH}' -DBOOTSTRAP_CLANG_BOOTSTRAP_PASSTHROUGH='${PASSTHROUGH}' \
+                               -C ${S}/clang/cmake/caches/PGO.cmake,,lld-native"
 
 OECMAKE_SOURCEPATH = "${S}/clang"
 
-
 # linux hosts (.so) on Windows .pyd
 SOLIBSDEV:mingw32 = ".pyd"
 
@@ -83,6 +88,22 @@ DEPENDS:append:class-target = " ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', '
 RDEPENDS:${PN}:append:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' lld', '', d)}"
 RRECOMMENDS:${PN}:append:class-target = "binutils ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
 
+PASSTHROUGH = "LLVM_CMAKE_DIR;\
+LLVM_INCLUDE_TESTS;CLANG_INCLUDE_TESTS;\
+LLVM_EXTERNAL_LIT;\
+LLVM_ENABLE_ASSERTIONS;LLVM_ENABLE_PIC;CLANG_DEFAULT_PIE_ON_LINUX;\
+FFI_INCLUDE_DIR;\
+LLVM_NATIVE_TOOL_DIR;LLVM_TABLEGEN_EXE;CLANG_TABLEGEN_EXE;\
+LLVM_LIBDIR_SUFFIX;LLVM_VERSION_SUFFIX;\
+ENABLE_LINKER_BUILD_ID;CLANG_ENABLE_CLANGD;CLANGD_BUILD_DEXP;\
+CLANG_PYTHON_BINDINGS_VERSIONS;\
+CLANG_DEFAULT_RTLIB;CLANG_DEFAULT_CXX_STDLIB;CLANG_DEFAULT_UNWINDLIB;\
+CLANG_DEFAULT_OPENMP_RUNTIME;CLANG_DEFAULT_LINKER;\
+LLVM_ENABLE_LTO;LLVM_ENABLE_LLD;"
+
+OECMAKE_TARGET_COMPILE:class-native = "${@bb.utils.contains('PACKAGECONFIG', 'thin-lto-pgo', 'stage2', 'all', d)}"
+OECMAKE_TARGET_INSTALL:class-native = "${@bb.utils.contains('PACKAGECONFIG', 'thin-lto-pgo', 'stage2-install', 'install', d)}"
+
 do_configure:prepend() {
   # Link clang-tools-extra into the clang tree as clang will look for it here
   # if it's doing a standalone build.
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 9d45898c68..2187e3c3fd 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -60,6 +60,12 @@ SRC_URI = "\
     file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch \
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
     file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
+    file://0042-perf-training-Propagate-OE-sysroot-flags-to-sub-buil.patch \
+    file://0043-PGO.cmake-Add-stage2-install-to-bootstrap-targets.patch \
+    file://0044-Move-perf-training-out-of-CLANG_INCLUDE_TESTS.patch \
+    file://0045-Fix-path-assumptions-for-standalone-PGO-bootstrap.patch \
+    file://0046-Skip-llvm-config-DEPENDS-in-standalone-clang-PGO-boo.patch \
+    file://0047-Allow-external-lld-in-standalone-clang-PGO-bootstrap.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

