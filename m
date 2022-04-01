Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH] glib-2.0: Backport patches C++ variant of g_atomic_int_compare_and_exchange()
Date: Fri,  1 Apr 2022 07:41:14 -0700
Message-Id: <20220401144114.1699496-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>

This fixes a regression when glib-2.0 was used with clang.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-for-typechecking-with-atomic-compa.patch | 64 +++++++++++++++++
 ...variant-of-g_atomic_int_compare_and_.patch | 70 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb |  2 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
new file mode 100644
index 00000000000..4842f462e14
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
@@ -0,0 +1,64 @@
+From 44b4bcd56d7ac2bd8ebf00e9fa433ad897d68216 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Fri, 1 Apr 2022 13:44:45 +0100
+Subject: [PATCH 1/2] tests: Add C++ tests for typechecking with atomic compare
+ and exchanges
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2625
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2578]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glib/tests/cxx.cpp | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+
+diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
+index be0a6bfa1..7d7f27c91 100644
+--- a/glib/tests/cxx.cpp
++++ b/glib/tests/cxx.cpp
+@@ -53,6 +53,32 @@ test_typeof (void)
+ #endif
+ }
+ 
++static void
++test_atomic_pointer_compare_and_exchange (void)
++{
++  const gchar *str1 = "str1";
++  const gchar *str2 = "str2";
++  const gchar *atomic_string = str1;
++
++  g_test_message ("Test that g_atomic_pointer_compare_and_exchange() with a "
++                  "non-void* pointer doesn’t have any compiler warnings in C++ mode");
++
++  g_assert_true (g_atomic_pointer_compare_and_exchange (&atomic_string, str1, str2));
++  g_assert_true (atomic_string == str2);
++}
++
++static void
++test_atomic_int_compare_and_exchange (void)
++{
++  gint atomic_int = 5;
++
++  g_test_message ("Test that g_atomic_int_compare_and_exchange() doesn’t have "
++                  "any compiler warnings in C++ mode");
++
++  g_assert_true (g_atomic_int_compare_and_exchange (&atomic_int, 5, 50));
++  g_assert_cmpint (atomic_int, ==, 50);
++}
++
+ int
+ main (int argc, char *argv[])
+ {
+@@ -63,6 +89,8 @@ main (int argc, char *argv[])
+ #endif
+ 
+   g_test_add_func ("/C++/typeof", test_typeof);
++  g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
++  g_test_add_func ("/C++/atomic-int-compare-and-exchange", test_atomic_int_compare_and_exchange);
+ 
+   return g_test_run ();
+ }
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch b/meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch
new file mode 100644
index 00000000000..a07f94672f7
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch
@@ -0,0 +1,70 @@
+From 2668390454bc0efe52a262eb2faa4a2bd5a062e2 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Fri, 1 Apr 2022 13:47:19 +0100
+Subject: [PATCH 2/2] gatomic: Add a C++ variant of
+ g_atomic_int_compare_and_exchange()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The C++ variant implements type safety differently, to avoid warnings
+from C++ compilers about:
+```
+../../../gnome-commander-1.14.2/src/intviewer/searcher.cc:303:5: error: cannot initialize a parameter of type 'gint *' (aka 'int *') with an rvalue of type 'void *'
+    g_atomic_int_compare_and_exchange ((gint*)&src->priv->progress_value, oldval, (gint)d);
+    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-commander/1.14.2-r0/recipe-sysroot/usr/include/glib-2.0/glib/gatomic.h:160:44: note: expanded from macro 'g_atomic_int_compare_and_exchange'
+    __atomic_compare_exchange_n ((atomic), (void *) (&(gaicae_oldval)), (newval), FALSE, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? TRUE : FALSE; \
+                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
+```
+
+This complements the existing C++ variant for
+`g_atomic_pointer_compare_and_exchange()`, and fixes a regression on C++
+from https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2114.
+
+With the addition of the unit tests in the previous commit, this is
+effectively tested by the FreeBSD and macOS CI jobs, as they use
+`clang++` in C++ mode. `g++` doesn’t seem to emit a warning about this.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2625
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2578]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glib/gatomic.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/glib/gatomic.h b/glib/gatomic.h
+index 5eba1dbc7..8b2b880c8 100644
+--- a/glib/gatomic.h
++++ b/glib/gatomic.h
+@@ -152,6 +152,17 @@ G_END_DECLS
+     (void) (0 ? *(atomic) ^ *(atomic) : 1);                                  \
+     __atomic_fetch_sub ((atomic), 1, __ATOMIC_SEQ_CST) == 1;                 \
+   }))
++#if defined(glib_typeof) && defined(__cplusplus) && __cplusplus >= 201103L
++/* See comments below about equivalent g_atomic_pointer_compare_and_exchange()
++ * shenanigans for type-safety when compiling in C++ mode. */
++#define g_atomic_int_compare_and_exchange(atomic, oldval, newval) \
++  (G_GNUC_EXTENSION ({                                                       \
++    glib_typeof (*(atomic)) gaicae_oldval = (oldval);                        \
++    G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
++    (void) (0 ? *(atomic) ^ (newval) ^ (oldval) : 1);                        \
++    __atomic_compare_exchange_n ((atomic), &gaicae_oldval, (newval), FALSE, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? TRUE : FALSE; \
++  }))
++#else /* if !(defined(glib_typeof) && defined(__cplusplus) && __cplusplus >= 201103L) */
+ #define g_atomic_int_compare_and_exchange(atomic, oldval, newval) \
+   (G_GNUC_EXTENSION ({                                                       \
+     gint gaicae_oldval = (oldval);                                           \
+@@ -159,6 +170,7 @@ G_END_DECLS
+     (void) (0 ? *(atomic) ^ (newval) ^ (oldval) : 1);                        \
+     __atomic_compare_exchange_n ((atomic), (void *) (&(gaicae_oldval)), (newval), FALSE, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? TRUE : FALSE; \
+   }))
++#endif /* defined(glib_typeof) */
+ #define g_atomic_int_add(atomic, val) \
+   (G_GNUC_EXTENSION ({                                                       \
+     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb
index 8b7016ec0fe..62479e3c3f6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb
@@ -16,6 +16,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
+           file://0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch \
+           file://0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.35.1

