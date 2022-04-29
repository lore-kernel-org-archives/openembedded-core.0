Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 06/34] glib: upgrade 2.72.0 -> 2.72.1
Date: Fri, 29 Apr 2022 06:00:25 -1000
Message-Id: <d8222529a1caa2703ed296d8a8274983e738cefc.1651246310.git.steve@sakoman.com>
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release

Overview of changes in GLib 2.72.1

Fix building projects which use g_warning_once() with clang++ (#2625)
Fix g_file_trash() not deleting directories via the portals backend (work by Matthias Clasen) (#2629)
A number more compiler warnings fixed for MSVC (work by Loïc Le Page) (!2495)
Fix detection of broken poll() function on macOS (work by Haruka Ma) (!2571)
Fix spawning subprocesses from GUI programs on Windows (work by Marc-André Lureau) (!2582)

Bugs fixed:

2312 gdbus-test-codegen tests leak GWeakRef objects
2625 g_warning_once fails to build with clang++
2629 g_file_trash() does not work on directories inside a sandbox
2495 Cleanup warnings split 6
2499 Various contenttype-related test fixes on win32
2534 gpowerprofilemonitor: Tweak wording of documentation to make more sense
2540 Various win32 tests skip & fixes
2541 meson: simplify lookup of python command
2543 ci: Update the Fedora CI image to Fedora 34
2556 gdbusconnection: Use g_strv_contains() rather than a home-grown version
2557 gdbusmethodinvocation: Fix a leak on an early return path
2558 Move unit test on g_basename() function to glib/tests/fileutils.c
2559 Move tests/relation-test.c to glib/tests/relation.c
2560 ci: Update Coverity, mingw and Android CI images to Fedora 34
2563 glib: Format GDateTime ISO8601 years as %C%y
2564 Move test files on slices from tests/ to glib/tests/
2566 tests: Add more tests for GResolver response parsing
2573 Backport translation fixes and !2571 “meson: Set BROKEN_POLL in macOS builds” to glib-2-72
2574 Backport !2565 “Revert "meson: simplify lookup of python command"” to glib-2-72
2587 Backport !2583 “Fix trashing sandboxed directories” to glib-2-72
2588 Backport !2582 “glib/win32: fix spawn from GUI regression” to glib-2-72
2590 Backport !2589 “tests: Don’t exit gdbus-method-invocation test early on connection close” to glib-2-72
2593 Backport !2578 “gatomic: Add a C++ variant of g_atomic_int_compare_and_exchange()” to glib-2-72

Translation updates:

Bulgarian
Catalan
Indonesian
Italian
Lithuanian
Polish
Portuguese
Russian
Slovenian
Swedish
Turkish
Ukrainian

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e167060bfb105799e0931c06a6aa1275163bf261)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...s-for-typechecking-with-atomic-compa.patch | 64 -----------------
 ...variant-of-g_atomic_int_compare_and_.patch | 70 -------------------
 ...ble-more-tests-while-cross-compiling.patch | 32 ++++-----
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  8 +--
 ...{glib-2.0_2.72.0.bb => glib-2.0_2.72.1.bb} |  4 +-
 5 files changed, 20 insertions(+), 158 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.0.bb => glib-2.0_2.72.1.bb} (90%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
deleted file mode 100644
index 4842f462e1..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 44b4bcd56d7ac2bd8ebf00e9fa433ad897d68216 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@endlessos.org>
-Date: Fri, 1 Apr 2022 13:44:45 +0100
-Subject: [PATCH 1/2] tests: Add C++ tests for typechecking with atomic compare
- and exchanges
-
-Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
-
-Helps: #2625
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2578]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- glib/tests/cxx.cpp | 28 ++++++++++++++++++++++++++++
- 1 file changed, 28 insertions(+)
-
-diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
-index be0a6bfa1..7d7f27c91 100644
---- a/glib/tests/cxx.cpp
-+++ b/glib/tests/cxx.cpp
-@@ -53,6 +53,32 @@ test_typeof (void)
- #endif
- }
- 
-+static void
-+test_atomic_pointer_compare_and_exchange (void)
-+{
-+  const gchar *str1 = "str1";
-+  const gchar *str2 = "str2";
-+  const gchar *atomic_string = str1;
-+
-+  g_test_message ("Test that g_atomic_pointer_compare_and_exchange() with a "
-+                  "non-void* pointer doesn’t have any compiler warnings in C++ mode");
-+
-+  g_assert_true (g_atomic_pointer_compare_and_exchange (&atomic_string, str1, str2));
-+  g_assert_true (atomic_string == str2);
-+}
-+
-+static void
-+test_atomic_int_compare_and_exchange (void)
-+{
-+  gint atomic_int = 5;
-+
-+  g_test_message ("Test that g_atomic_int_compare_and_exchange() doesn’t have "
-+                  "any compiler warnings in C++ mode");
-+
-+  g_assert_true (g_atomic_int_compare_and_exchange (&atomic_int, 5, 50));
-+  g_assert_cmpint (atomic_int, ==, 50);
-+}
-+
- int
- main (int argc, char *argv[])
- {
-@@ -63,6 +89,8 @@ main (int argc, char *argv[])
- #endif
- 
-   g_test_add_func ("/C++/typeof", test_typeof);
-+  g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
-+  g_test_add_func ("/C++/atomic-int-compare-and-exchange", test_atomic_int_compare_and_exchange);
- 
-   return g_test_run ();
- }
--- 
-2.35.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch b/meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch
deleted file mode 100644
index a07f94672f..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 2668390454bc0efe52a262eb2faa4a2bd5a062e2 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@endlessos.org>
-Date: Fri, 1 Apr 2022 13:47:19 +0100
-Subject: [PATCH 2/2] gatomic: Add a C++ variant of
- g_atomic_int_compare_and_exchange()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The C++ variant implements type safety differently, to avoid warnings
-from C++ compilers about:
-```
-../../../gnome-commander-1.14.2/src/intviewer/searcher.cc:303:5: error: cannot initialize a parameter of type 'gint *' (aka 'int *') with an rvalue of type 'void *'
-    g_atomic_int_compare_and_exchange ((gint*)&src->priv->progress_value, oldval, (gint)d);
-    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-commander/1.14.2-r0/recipe-sysroot/usr/include/glib-2.0/glib/gatomic.h:160:44: note: expanded from macro 'g_atomic_int_compare_and_exchange'
-    __atomic_compare_exchange_n ((atomic), (void *) (&(gaicae_oldval)), (newval), FALSE, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? TRUE : FALSE; \
-                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
-```
-
-This complements the existing C++ variant for
-`g_atomic_pointer_compare_and_exchange()`, and fixes a regression on C++
-from https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2114.
-
-With the addition of the unit tests in the previous commit, this is
-effectively tested by the FreeBSD and macOS CI jobs, as they use
-`clang++` in C++ mode. `g++` doesn’t seem to emit a warning about this.
-
-Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
-
-Fixes: #2625
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2578]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- glib/gatomic.h | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/glib/gatomic.h b/glib/gatomic.h
-index 5eba1dbc7..8b2b880c8 100644
---- a/glib/gatomic.h
-+++ b/glib/gatomic.h
-@@ -152,6 +152,17 @@ G_END_DECLS
-     (void) (0 ? *(atomic) ^ *(atomic) : 1);                                  \
-     __atomic_fetch_sub ((atomic), 1, __ATOMIC_SEQ_CST) == 1;                 \
-   }))
-+#if defined(glib_typeof) && defined(__cplusplus) && __cplusplus >= 201103L
-+/* See comments below about equivalent g_atomic_pointer_compare_and_exchange()
-+ * shenanigans for type-safety when compiling in C++ mode. */
-+#define g_atomic_int_compare_and_exchange(atomic, oldval, newval) \
-+  (G_GNUC_EXTENSION ({                                                       \
-+    glib_typeof (*(atomic)) gaicae_oldval = (oldval);                        \
-+    G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
-+    (void) (0 ? *(atomic) ^ (newval) ^ (oldval) : 1);                        \
-+    __atomic_compare_exchange_n ((atomic), &gaicae_oldval, (newval), FALSE, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? TRUE : FALSE; \
-+  }))
-+#else /* if !(defined(glib_typeof) && defined(__cplusplus) && __cplusplus >= 201103L) */
- #define g_atomic_int_compare_and_exchange(atomic, oldval, newval) \
-   (G_GNUC_EXTENSION ({                                                       \
-     gint gaicae_oldval = (oldval);                                           \
-@@ -159,6 +170,7 @@ G_END_DECLS
-     (void) (0 ? *(atomic) ^ (newval) ^ (oldval) : 1);                        \
-     __atomic_compare_exchange_n ((atomic), (void *) (&(gaicae_oldval)), (newval), FALSE, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? TRUE : FALSE; \
-   }))
-+#endif /* defined(glib_typeof) */
- #define g_atomic_int_add(atomic, val) \
-   (G_GNUC_EXTENSION ({                                                       \
-     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
--- 
-2.35.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index 6147bdae46..f5c161fe04 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -1,4 +1,4 @@
-From d2d7af496b4f4a13779179dbcbb98de56b09783f Mon Sep 17 00:00:00 2001
+From 1f3c05529c0c9032ae0a289fb1f088b7541fc9b0 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
 Subject: [PATCH] Enable more tests while cross-compiling
@@ -9,24 +9,25 @@ case we can depend on glib-2.0-native.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
  gio/tests/meson.build | 24 ++++++++++++------------
  1 file changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index e8d10a0f11f2..abe676767c60 100644
+index 3ed23a5..5df932a 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
-@@ -250,7 +250,7 @@ if host_machine.system() != 'windows'
+@@ -253,7 +253,7 @@ if host_machine.system() != 'windows'
+     }
+   endif
  
-   #  Test programs that need to bring up a session bus (requires dbus-daemon)
-   have_dbus_daemon = find_program('dbus-daemon', required : false).found()
 -  if have_dbus_daemon
 +  if true
      annotate_args = [
        '--annotate', 'org.project.Bar', 'Key1', 'Value1',
        '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2',
-@@ -601,14 +601,14 @@ if installed_tests_enabled
+@@ -603,14 +603,14 @@ if installed_tests_enabled
    endforeach
  endif
  
@@ -43,7 +44,7 @@ index e8d10a0f11f2..abe676767c60 100644
                 compiler_type,
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
-@@ -634,7 +634,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -636,7 +636,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_gresource = custom_target('test.gresource',
      input : 'test.gresource.xml',
      output : 'test.gresource',
@@ -52,7 +53,7 @@ index e8d10a0f11f2..abe676767c60 100644
                 compiler_type,
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
-@@ -647,7 +647,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -649,7 +649,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_c = custom_target('test_resources2.c',
      input : 'test3.gresource.xml',
      output : 'test_resources2.c',
@@ -61,7 +62,7 @@ index e8d10a0f11f2..abe676767c60 100644
                 compiler_type,
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
-@@ -660,7 +660,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -662,7 +662,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_h = custom_target('test_resources2.h',
      input : 'test3.gresource.xml',
      output : 'test_resources2.h',
@@ -70,7 +71,7 @@ index e8d10a0f11f2..abe676767c60 100644
                 compiler_type,
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
-@@ -674,7 +674,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -676,7 +676,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
      input : 'test2.gresource.xml',
      depends : big_test_resource,
      output : 'test_resources.c',
@@ -79,7 +80,7 @@ index e8d10a0f11f2..abe676767c60 100644
                 compiler_type,
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
-@@ -687,7 +687,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -689,7 +689,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    digit_test_resources_c = custom_target('digit_test_resources.c',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.c',
@@ -88,7 +89,7 @@ index e8d10a0f11f2..abe676767c60 100644
                 compiler_type,
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
-@@ -700,7 +700,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -702,7 +702,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    digit_test_resources_h = custom_target('digit_test_resources.h',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.h',
@@ -97,7 +98,7 @@ index e8d10a0f11f2..abe676767c60 100644
                 compiler_type,
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
-@@ -742,11 +742,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -744,11 +744,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
  
    ld = find_program('ld', required : false)
  
@@ -111,7 +112,7 @@ index e8d10a0f11f2..abe676767c60 100644
                   compiler_type,
                   '--target=@OUTPUT@',
                   '--sourcedir=' + meson.current_source_dir(),
-@@ -760,7 +760,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -762,7 +762,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
      test_resources_binary_c = custom_target('test_resources_binary.c',
        input : 'test5.gresource.xml',
        output : 'test_resources_binary.c',
@@ -120,6 +121,3 @@ index e8d10a0f11f2..abe676767c60 100644
                   compiler_type,
                   '--target=@OUTPUT@',
                   '--sourcedir=' + meson.current_source_dir(),
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index d3bb05e669..816b790ce7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From d4e95568151cb7a62b6a29a4d2c3f532fd55c98c Mon Sep 17 00:00:00 2001
+From d52b1b530c5d8a1e70ae45d6e2139e9d3f25207f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,10 +19,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index d34037a..7442df6 100644
+index 2a043cc..e2d2310 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -54,6 +54,8 @@
+@@ -56,6 +56,8 @@
  #ifdef G_OS_WIN32
  #include "gregistrysettingsbackend.h"
  #include "giowin32-priv.h"
@@ -31,7 +31,7 @@ index d34037a..7442df6 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1224,7 +1226,15 @@ get_gio_module_dir (void)
+@@ -1267,7 +1269,15 @@ get_gio_module_dir (void)
                                       NULL);
        g_free (install_dir);
  #else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb
similarity index 90%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb
index 62479e3c3f..c9ccedd81f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb
@@ -16,12 +16,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-           file://0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch \
-           file://0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "d7bef0d4c4e7a62e08efb8e5f252a01357007b9588a87ff2b463a3857011f79d"
+SRC_URI[sha256sum] = "c07e57147b254cef92ce80a0378dc0c02a4358e7de4702e9f403069781095fe2"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.25.1

