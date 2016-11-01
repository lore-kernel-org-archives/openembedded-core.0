Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A0F9171A23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876274"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:28:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:18 +0200
Message-Id: <2390b6f08557caeab56f25fb8064c9d0746155c5.1478013702.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/13] valgrind: update to 3.12.0
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
X-List-Received-Date: Tue, 01 Nov 2016 15:27:59 -0000

Remove backported gcc5-port.patch
Remove 11_mips-link-tool.patch as there is nothing in the target file
(or the entire source tree) that resembles anything contained in the patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../valgrind/valgrind/11_mips-link-tool.patch      | 37 -------------
 .../valgrind/valgrind/gcc5-port.patch              | 64 ----------------------
 .../{valgrind_3.11.0.bb => valgrind_3.12.0.bb}     |  6 +-
 3 files changed, 2 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.11.0.bb => valgrind_3.12.0.bb} (95%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch b/meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
deleted file mode 100644
index ecb33b8..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Debian fix for MIPS: mmap(0x400000, 32768) failed in UME with error 22 (Invalid argument)
-
-  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=777704
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-
-Description: Disable the MIPS linker workarounds when using -Ttext-section
-Origin: vendor
-Bug-Debian: http://bugs.debian.org/777704
-Author: James Cowgill <james410@cowgill.org.uk>
-Last-Update: 2015-04-25
-
---- a/coregrind/link_tool_exe_linux.in
-+++ b/coregrind/link_tool_exe_linux.in
-@@ -76,12 +76,13 @@
- my $arch = substr($x, 0, index($x, "'"));
- 
- my $extra_args;
--if (($arch eq 'mips') || ($arch eq 'mipsel')
--    || ($arch eq 'mipsisa32r2el')) {
--   $extra_args = "-static -Wl,--section-start=.reginfo=$ala";
--} elsif (($arch eq 'mips64') || ($arch eq 'mips64el') ||
--         ($arch eq 'mipsisa64el')) {
--   $extra_args = "-static -Wl,--section-start=.MIPS.options=$ala";
-+if ($arch =~ /^mips/ && "@FLAG_T_TEXT@" eq '-Ttext') {
-+   # We only need to use the special mips options when using -Ttext
-+   if ($arch =~ /^mips(64|isa64)/) {
-+      $extra_args = "-static -Wl,--section-start=.MIPS.options=$ala";
-+   } else {
-+      $extra_args = "-static -Wl,--section-start=.reginfo=$ala";
-+   }
- } else {
-    $extra_args = "-static -Wl,@FLAG_T_TEXT@=$ala";
- }
diff --git a/meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch b/meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch
deleted file mode 100644
index 76bc821..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-backport fix from upstream to fix build errors with gcc 6
-
-http://valgrind.10908.n7.nabble.com/Valgrind-r15773-in-trunk-configure-ac-drd-tests-std-thread-cpp-drd-tests-std-thread2-cpp-td56109.html
-
-../../../valgrind-3.11.0/drd/tests/std_thread.cpp:30:3: error: '_Impl_base' is not a member of 'std::thread'
-   std::thread::_Impl_base* __t = static_cast<std::thread::_Impl_base*>(__p);
-   ^~~
-../../../valgrind-3.11.0/drd/tests/std_thread.cpp:30:28: error: '__t' was not declared in this scope
-   std::thread::_Impl_base* __t = static_cast<std::thread::_Impl_base*>(__p);
-                            ^~~
-../../../valgrind-3.11.0/drd/tests/std_thread.cpp:30:59: error: '_Impl_base' in 'class std::thread' does not name a type
-   std::thread::_Impl_base* __t = static_cast<std::thread::_Impl_base*>(__p);
-                                                           ^~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
-Index: configure.ac
-===================================================================
---- a/configure.ac	(revision 15772)
-+++ b/configure.ac	(revision 15773)
-@@ -160,7 +160,7 @@
-      icc-1[[3-9]].*)
- 	AC_MSG_RESULT([ok (ICC version ${gcc_version})])
- 	;;
--     notclang-[[3-9]].*|notclang-[[1-9][0-9]]*)
-+     notclang-[[3-9]]|notclang-[[3-9]].*|notclang-[[1-9][0-9]]*)
- 	AC_MSG_RESULT([ok (${gcc_version})])
- 	;;
-      clang-2.9|clang-[[3-9]].*|clang-[[1-9][0-9]]*)
-Index: drd/tests/std_thread2.cpp
-===================================================================
---- a/drd/tests/std_thread2.cpp	(revision 15772)
-+++ b/drd/tests/std_thread2.cpp	(revision 15773)
-@@ -26,6 +26,7 @@
-   return 0;
- }
- 
-+#if defined(__GNUC__) && __GNUC__ -0 < 6
- //
- // From libstdc++-v3/src/c++11/thread.cc
- //
-@@ -70,3 +71,4 @@
-     }
-   }
- }
-+#endif
-Index: drd/tests/std_thread.cpp
-===================================================================
---- a/drd/tests/std_thread.cpp	(revision 15772)
-+++ b/drd/tests/std_thread.cpp	(revision 15773)
-@@ -21,6 +21,7 @@
-   return 0;
- }
- 
-+#if defined(__GNUC__) && __GNUC__ -0 < 6
- //
- // From libstdc++-v3/src/c++11/thread.cc
- //
-@@ -65,3 +66,4 @@
-     }
-   }
- }
-+#endif
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
similarity index 95%
rename from meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 42fd27f..a113880 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -16,20 +16,18 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
-           file://11_mips-link-tool.patch \
            file://0002-remove-rpath.patch \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
-           file://gcc5-port.patch \
 "
 SRC_URI_append_libc-musl = "\
            file://0001-fix-build-for-musl-targets.patch \
 "
-SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
-SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
+SRC_URI[md5sum] = "6eb03c0c10ea917013a7622e483d61bb"
+SRC_URI[sha256sum] = "67ca4395b2527247780f36148b084f5743a68ab0c850cb43e4a5b4b012cf76a1"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
-- 
2.10.1


