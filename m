Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0353E731B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2016 18:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,365,1464678000"; d="scan'208";a="995612656"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2016 18:49:02 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 18:49:36 -0700
Message-Id: <a7391cf7ad68817364c09cb966b0e02735c4465f.1468546499.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
Subject: [krogoth][PATCH 5/8] glib-2.0: Ignore useless warning found with gcc-6
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:02 -0000

From: Khem Raj <raj.khem@gmail.com>

../../glib-2.46.2/glib/gdate.c:2497:7: error: format not a string literal, format string not checked [-Werror=format-nonliteral]
       tmplen = strftime (tmpbuf, tmpbufsize, locale_format, &tm);
       ^~~~~~

| ../../../../../../../../workspace/sources/glib-2.0/glib/tests/gdatetime.c: In function 'test_strftime':
| ../../../../../../../../workspace/sources/glib-2.0/glib/tests/gdatetime.c:1338:3: error: '%c' yields only last 2 digits of year in some locales [-Werror=format-y2k]
|    "a%a A%A b%b B%B c%c C%C d%d e%e F%F g%g G%G h%h H%H I%I j%j m%m M%M " \

Additionally fix the problem seen where write() return code is ignored

(From OE-Core rev: 3fdecff96dd7516605ec9248b2a39de4db81306f)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Do-not-ignore-return-value-of-write.patch | 42 ++++++++++++++++++++++
 .../glib-2.0/0002-tests-Ignore-y2k-warnings.patch  | 42 ++++++++++++++++++++++
 .../ignore-format-nonliteral-warning.patch         | 39 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb      |  7 ++--
 4 files changed, 128 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
new file mode 100644
index 0000000..aee96aa
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
@@ -0,0 +1,42 @@
+From d6501b107940e9f548c89236d773c6d33c15a5c9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 16 Apr 2016 13:28:59 -0700
+Subject: [PATCH 1/2] Do not ignore return value of write()
+
+gcc warns about ignoring return value when compiling
+with fortify turned on.
+
+assert when write() fails
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ glib/tests/unix.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/glib/tests/unix.c b/glib/tests/unix.c
+index 3543458..4e7ed85 100644
+--- a/glib/tests/unix.c
++++ b/glib/tests/unix.c
+@@ -32,14 +32,15 @@ test_pipe (void)
+   GError *error = NULL;
+   int pipefd[2];
+   char buf[1024];
+-  ssize_t bytes_read;
++  ssize_t bytes_read, bytes_written;
+   gboolean res;
+ 
+   res = g_unix_open_pipe (pipefd, FD_CLOEXEC, &error);
+   g_assert (res);
+   g_assert_no_error (error);
+ 
+-  write (pipefd[1], "hello", sizeof ("hello"));
++  bytes_written = write (pipefd[1], "hello", sizeof ("hello"));
++  g_assert (bytes_written != -1 && "write() failed");
+   memset (buf, 0, sizeof (buf));
+   bytes_read = read (pipefd[0], buf, sizeof(buf) - 1);
+   g_assert_cmpint (bytes_read, >, 0);
+-- 
+2.8.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch b/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
new file mode 100644
index 0000000..f61fa0a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
@@ -0,0 +1,42 @@
+From b06b22fecc7deda8c65e28670562ca2371e4e725 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 16 Apr 2016 13:43:54 -0700
+Subject: [PATCH 2/2] tests: Ignore y2k warnings
+
+silences
+| ../../../../../../../../workspace/sources/glib-2.0/glib/tests/gdatetime.c: In function 'test_strftime':
+| ../../../../../../../../workspace/sources/glib-2.0/glib/tests/gdatetime.c:1338:3: error: '%c' yields only last 2 digits of year in some locales [-Werror=format-y2k]
+|    "a%a A%A b%b B%B c%c C%C d%d e%e F%F g%g G%G h%h H%H I%I j%j m%m M%M "
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ glib/tests/gdatetime.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 16a163c..e6062fc 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -1326,6 +1326,9 @@ test_z (void)
+   g_time_zone_unref (tz);
+ }
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-y2k"
++
+ static void
+ test_strftime (void)
+ {
+@@ -1351,6 +1354,7 @@ test_strftime (void)
+     }
+ #endif
+ }
++#pragma GCC diagnostic pop
+ 
+ static void
+ test_find_interval (void)
+-- 
+2.8.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch b/meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch
new file mode 100644
index 0000000..d533975
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch
@@ -0,0 +1,39 @@
+From 8cdbc7fb2c8c876902e457abe46ee18a0b134486 Mon Sep 17 00:00:00 2001
+From: coypu <coypu@sdf.org>
+Date: Wed, 2 Mar 2016 19:38:48 +0200
+Subject: gdate: Move warning pragma outside of function
+
+Commit 0817af40e8c74c721c30f6ef482b1f53d12044c7 breaks the build on
+older versions of GCC, which don't allow pragma inside functions.
+
+https://bugzilla.gnome.org/761550
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ glib/gdate.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gdate.c b/glib/gdate.c
+index cdc735c..92c34d2 100644
+--- a/glib/gdate.c
++++ b/glib/gdate.c
+@@ -2439,6 +2439,9 @@ win32_strftime_helper (const GDate     *d,
+  *
+  * Returns: number of characters written to the buffer, or 0 the buffer was too small
+  */
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
++
+ gsize     
+ g_date_strftime (gchar       *s, 
+                  gsize        slen, 
+@@ -2552,3 +2552,5 @@ g_date_strftime (gchar       *s,
+   return retval;
+ #endif
+ }
++
++#pragma GCC diagnostic pop
+-- 
+cgit v0.12
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
index 8e445b4..9e95149 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
@@ -13,11 +13,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://uclibc_musl_translation.patch \
            file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
-	   file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
+           file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
            file://gi-exclude.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
-          "
+           file://ignore-format-nonliteral-warning.patch \
+           file://0001-Do-not-ignore-return-value-of-write.patch \
+           file://0002-tests-Ignore-y2k-warnings.patch \
+           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
                                 file://relocate-modules.patch"
-- 
2.7.4


