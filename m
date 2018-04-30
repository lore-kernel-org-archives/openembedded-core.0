Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 13112607E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 12:54:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Apr 2018 05:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,346,1520924400"; d="scan'208";a="41783105"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2018 05:54:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2018 15:48:41 +0300
Message-Id: <20180430124841.16354-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] glib-2.0: update to 2.56.1
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
X-List-Received-Date: Mon, 30 Apr 2018 12:54:39 -0000

Remove upstreamed ptest-paths.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-Do-not-ignore-return-value-of-write.patch | 17 +++++-------
 .../glib-2.0/glib-2.0/ptest-paths.patch            | 30 ----------------------
 .../glib-2.0/glib-2.0/relocate-modules.patch       | 13 ++++++----
 .../{glib-2.0_2.54.3.bb => glib-2.0_2.56.1.bb}     |  5 ++--
 4 files changed, 17 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.54.3.bb => glib-2.0_2.56.1.bb} (82%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
index aee96aaa6e7..0ebf138d60a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
@@ -1,30 +1,30 @@
-From d6501b107940e9f548c89236d773c6d33c15a5c9 Mon Sep 17 00:00:00 2001
+From d250652782b65b071b7cc8f01f2db833df104e0e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 16 Apr 2016 13:28:59 -0700
-Subject: [PATCH 1/2] Do not ignore return value of write()
+Subject: [PATCH] Do not ignore return value of write()
 
 gcc warns about ignoring return value when compiling
 with fortify turned on.
 
 assert when write() fails
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Submitted
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+---
  glib/tests/unix.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/glib/tests/unix.c b/glib/tests/unix.c
-index 3543458..4e7ed85 100644
+index 9d55a6c..a07f945 100644
 --- a/glib/tests/unix.c
 +++ b/glib/tests/unix.c
 @@ -32,14 +32,15 @@ test_pipe (void)
    GError *error = NULL;
    int pipefd[2];
    char buf[1024];
--  ssize_t bytes_read;
-+  ssize_t bytes_read, bytes_written;
+-  gssize bytes_read;
++  gssize bytes_read, bytes_written;
    gboolean res;
  
    res = g_unix_open_pipe (pipefd, FD_CLOEXEC, &error);
@@ -37,6 +37,3 @@ index 3543458..4e7ed85 100644
    memset (buf, 0, sizeof (buf));
    bytes_read = read (pipefd[0], buf, sizeof(buf) - 1);
    g_assert_cmpint (bytes_read, >, 0);
--- 
-2.8.0
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch b/meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch
deleted file mode 100644
index f3be02770cb..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Instead of writing the temporary mapping files in the mappedfile test to the
-user runtime directory, write them to $TMP.  The runtime directory may not
-currently exist if the test is executed on a non-desktop system and the test
-doesn't attempt to create the directory structure.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/glib/tests/mappedfile.c b/glib/tests/mappedfile.c
-index 40e0e60..27a24be 100644
---- a/glib/tests/mappedfile.c
-+++ b/glib/tests/mappedfile.c
-@@ -81,7 +81,7 @@ test_writable (void)
-   const gchar *new = "abcdefghijklmnopqrstuvxyz";
-   gchar *tmp_copy_path;
- 
--  tmp_copy_path = g_build_filename (g_get_user_runtime_dir (), "glib-test-4096-random-bytes", NULL);
-+  tmp_copy_path = g_build_filename (g_get_tmp_dir (), "glib-test-4096-random-bytes", NULL);
- 
-   g_file_get_contents (g_test_get_filename (G_TEST_DIST, "4096-random-bytes", NULL), &contents, &len, &error);
-   g_assert_no_error (error);
-@@ -125,7 +125,7 @@ test_writable_fd (void)
-   int fd;
-   gchar *tmp_copy_path;
- 
--  tmp_copy_path = g_build_filename (g_get_user_runtime_dir (), "glib-test-4096-random-bytes", NULL);
-+  tmp_copy_path = g_build_filename (g_get_tmp_dir (), "glib-test-4096-random-bytes", NULL);
- 
-   g_file_get_contents (g_test_get_filename (G_TEST_DIST, "4096-random-bytes", NULL), &contents, &len, &error);
-   g_assert_no_error (error);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 65d5b43f9b6..0c8cbd731b6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,3 +1,8 @@
+From c8fa58dc2e9322727ba21eafbe9a69a5f68ffd35 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 11 Mar 2016 15:35:55 +0000
+Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
+
 Instead of hard-coding GIO_MODULE_PATH when glib is built, use dladdr() to
 determine where libglib.so is and use that path to calculate GIO_MODULES_DIR.
 
@@ -8,12 +13,13 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
  gio/giomodule.c | 12 +++++++++++-
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index da7c167..cc0bc7c 100644
+index 1ead84c..f744aa2 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
 @@ -40,6 +40,8 @@
@@ -25,7 +31,7 @@ index da7c167..cc0bc7c 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1036,7 +1038,15 @@ get_gio_module_dir (void)
+@@ -1083,7 +1085,15 @@ get_gio_module_dir (void)
  #endif
        g_free (install_dir);
  #else
@@ -42,6 +48,3 @@ index da7c167..cc0bc7c 100644
  #endif
      }
  
--- 
-2.1.4
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.56.1.bb
similarity index 82%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.56.1.bb
index faf594569d6..cdfb6241854 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.56.1.bb
@@ -7,7 +7,6 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://run-ptest \
-           file://ptest-paths.patch \
            file://uclibc_musl_translation.patch \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
@@ -20,5 +19,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "16e886ad677bf07b7d48eb8188bcf759"
-SRC_URI[sha256sum] = "963fdc6685dc3da8e5381dfb9f15ca4b5709b28be84d9d05a9bb8e446abac0a8"
+SRC_URI[md5sum] = "988af38524804ea1ae6bc9a2bad181ff"
+SRC_URI[sha256sum] = "40ef3f44f2c651c7a31aedee44259809b6f03d3d20be44545cd7d177221c0b8d"
-- 
2.16.1


