Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id D38B36E9BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 11:52:03 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so1542979eek.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 03:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bHLuFC/HrUPTanalUSPElCpl9P4tKFyntvTUVMsVdw4=;
	b=N5P4eDpt+9rxUOZ0O8fOsgiSwZlyjmdFq0iQChT9BdBB/RWallUqq1yomH1dTpyC0V
	FiEZMS/XTYIt/BJm7Tf1VhlIC3kFMxiVgJsFnS4ksDy+K6KYplqNL0QXO+b1/mZq7gJ4
	zKje2ZThdDXfJqhUN9PWowh4BYJ/CXDPrroNBZOjkd3oBeaodjHj2E7I6h7E+WmYydse
	d6bSfXlMSHWGW1mZqLxJurhZsN75c4wtDmg5OtgJc0wgOB57UEEc/SOx3XcQOjhsB+pa
	OGeMQqif9SsKV2gpG3lcemyBWcRqjtpYSbzw76dh6+IwZ/QUF2M7G/LZyPzpV+SN+kNa
	7AvQ==
X-Gm-Message-State: ALoCoQlbg6nM9mIM4jNYaFbyCJkJr7iKvSd3kPUJrAY3Y8fB1yPdeQ4DJZeXYeD3teJ3SdDYBrXG
X-Received: by 10.14.246.68 with SMTP id p44mr1890297eer.72.1391082724518;
	Thu, 30 Jan 2014 03:52:04 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	d43sm21491574eep.18.2014.01.30.03.52.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jan 2014 03:52:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2014 11:51:57 +0000
Message-Id: <1391082719-14432-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] glib-2.0: fix handling of skipped tests
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
X-List-Received-Date: Thu, 30 Jan 2014 11:52:04 -0000

Backport a patch from upstream to fix skipped tests, essential for gdk-pixbuf to
pass without enabling all loaders.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/gtest-skip-fixes.patch       |  197 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb      |    1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gtest-skip-fixes.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gtest-skip-fixes.patch b/meta/recipes-core/glib-2.0/glib-2.0/gtest-skip-fixes.patch
new file mode 100644
index 0000000..3dba0ee
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/gtest-skip-fixes.patch
@@ -0,0 +1,197 @@
+Fix the handling of skipped tests so that it follows what automake does.
+
+Upstream-Status: Backport [https://bugzilla.gnome.org/show_bug.cgi?id=720263]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/glib/gtestutils.c b/glib/gtestutils.c
+index bc7bbcf..feaafa3 100644
+--- a/glib/gtestutils.c
++++ b/glib/gtestutils.c
+@@ -607,9 +607,10 @@ static gchar      *test_run_name = "";
+ static GSList    **test_filename_free_list;
+ static guint       test_run_forks = 0;
+ static guint       test_run_count = 0;
++static guint       test_skipped_count = 0;
+ static GTestResult test_run_success = G_TEST_RUN_FAILURE;
+ static gchar      *test_run_msg = NULL;
+-static guint       test_skip_count = 0;
++static guint       test_startup_skip_count = 0;
+ static GTimer     *test_user_timer = NULL;
+ static double      test_user_stamp = 0;
+ static GSList     *test_paths = NULL;
+@@ -765,6 +766,8 @@ g_test_log (GTestLogType lbit,
+             g_print ("Bail out!\n");
+           abort();
+         }
++      if (largs[0] == G_TEST_RUN_SKIPPED)
++        test_skipped_count++;
+       break;
+     case G_TEST_LOG_MIN_RESULT:
+       if (test_tap_log)
+@@ -869,11 +872,11 @@ parse_args (gint    *argc_p,
+         {
+           gchar *equal = argv[i] + 16;
+           if (*equal == '=')
+-            test_skip_count = g_ascii_strtoull (equal + 1, NULL, 0);
++            test_startup_skip_count = g_ascii_strtoull (equal + 1, NULL, 0);
+           else if (i + 1 < argc)
+             {
+               argv[i++] = NULL;
+-              test_skip_count = g_ascii_strtoull (argv[i], NULL, 0);
++              test_startup_skip_count = g_ascii_strtoull (argv[i], NULL, 0);
+             }
+           argv[i] = NULL;
+         }
+@@ -1516,14 +1519,21 @@ g_test_get_root (void)
+  * g_test_run_suite() or g_test_run() may only be called once
+  * in a program.
+  *
+- * Returns: 0 on success
++ * Returns: 0 on success, 1 on failure (assuming it returns at all),
++ *   77 if all tests were skipped with g_test_skip().
+  *
+  * Since: 2.16
+  */
+ int
+ g_test_run (void)
+ {
+-  return g_test_run_suite (g_test_get_root());
++  if (g_test_run_suite (g_test_get_root()) != 0)
++    return 1;
++
++  if (test_run_count > 0 && test_run_count == test_skipped_count)
++    return 77;
++  else
++    return 0;
+ }
+ 
+ /**
+@@ -2063,7 +2073,7 @@ test_case_run (GTestCase *tc)
+         }
+     }
+ 
+-  if (++test_run_count <= test_skip_count)
++  if (++test_run_count <= test_startup_skip_count)
+     g_test_log (G_TEST_LOG_SKIP_CASE, test_run_name, NULL, 0, NULL);
+   else if (test_run_list)
+     {
+@@ -2117,7 +2127,8 @@ test_case_run (GTestCase *tc)
+   g_free (test_uri_base);
+   test_uri_base = old_base;
+ 
+-  return success == G_TEST_RUN_SUCCESS;
++  return (success == G_TEST_RUN_SUCCESS ||
++          success == G_TEST_RUN_SKIPPED);
+ }
+ 
+ static int
+diff --git a/glib/tests/testing.c b/glib/tests/testing.c
+index 20c2e79..1025f12 100644
+--- a/glib/tests/testing.c
++++ b/glib/tests/testing.c
+@@ -575,10 +575,93 @@ test_nonfatal (void)
+   g_test_trap_assert_stdout ("*The End*");
+ }
+ 
++static void
++test_skip (void)
++{
++  g_test_skip ("Skipped should count as passed, not failed");
++}
++
++static void
++test_pass (void)
++{
++}
++
++static const char *argv0;
++
++static void
++test_skip_all (void)
++{
++  GPtrArray *argv;
++  GError *error = NULL;
++  int status;
++
++  argv = g_ptr_array_new ();
++  g_ptr_array_add (argv, (char *) argv0);
++  g_ptr_array_add (argv, "--GTestSubprocess");
++  g_ptr_array_add (argv, "-p");
++  g_ptr_array_add (argv, "/misc/skip");
++  g_ptr_array_add (argv, NULL);
++
++  g_spawn_sync (NULL, (char **) argv->pdata, NULL,
++                G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL,
++                NULL, NULL, NULL, NULL, &status,
++                &error);
++  g_assert_no_error (error);
++
++  g_spawn_check_exit_status (status, &error);
++  g_assert_error (error, G_SPAWN_EXIT_ERROR, 77);
++  g_clear_error (&error);
++
++  g_ptr_array_set_size (argv, 0);
++  g_ptr_array_add (argv, (char *) argv0);
++  g_ptr_array_add (argv, "--GTestSubprocess");
++  g_ptr_array_add (argv, "-p");
++  g_ptr_array_add (argv, "/misc/skip");
++  g_ptr_array_add (argv, "-p");
++  g_ptr_array_add (argv, "/misc/skip-all/subprocess/skip1");
++  g_ptr_array_add (argv, "-p");
++  g_ptr_array_add (argv, "/misc/skip-all/subprocess/skip2");
++  g_ptr_array_add (argv, NULL);
++
++  g_spawn_sync (NULL, (char **) argv->pdata, NULL,
++                G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL,
++                NULL, NULL, NULL, NULL, &status,
++                &error);
++  g_assert_no_error (error);
++
++  g_spawn_check_exit_status (status, &error);
++  g_assert_error (error, G_SPAWN_EXIT_ERROR, 77);
++  g_clear_error (&error);
++
++  g_ptr_array_set_size (argv, 0);
++  g_ptr_array_add (argv, (char *) argv0);
++  g_ptr_array_add (argv, "--GTestSubprocess");
++  g_ptr_array_add (argv, "-p");
++  g_ptr_array_add (argv, "/misc/skip");
++  g_ptr_array_add (argv, "-p");
++  g_ptr_array_add (argv, "/misc/skip-all/subprocess/pass");
++  g_ptr_array_add (argv, "-p");
++  g_ptr_array_add (argv, "/misc/skip-all/subprocess/skip1");
++  g_ptr_array_add (argv, NULL);
++
++  g_spawn_sync (NULL, (char **) argv->pdata, NULL,
++                G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL,
++                NULL, NULL, NULL, NULL, &status,
++                &error);
++  g_assert_no_error (error);
++
++  g_spawn_check_exit_status (status, &error);
++  g_assert_no_error (error);
++
++  g_ptr_array_unref (argv);
++}
++
+ int
+ main (int   argc,
+       char *argv[])
+ {
++  argv0 = argv[0];
++
+   g_test_init (&argc, &argv, NULL);
+ 
+   g_test_add_func ("/random-generator/rand-1", test_rand1);
+@@ -633,5 +716,11 @@ main (int   argc,
+ 
+   g_test_add_func ("/misc/nonfatal", test_nonfatal);
+ 
++  g_test_add_func ("/misc/skip", test_skip);
++  g_test_add_func ("/misc/skip-all", test_skip_all);
++  g_test_add_func ("/misc/skip-all/subprocess/skip1", test_skip);
++  g_test_add_func ("/misc/skip-all/subprocess/skip2", test_skip);
++  g_test_add_func ("/misc/skip-all/subprocess/pass", test_pass);
++
+   return g_test_run();
+ }
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
index 9745a9e..161f7da 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch \
            file://ptest-dbus.patch \
            file://ptest-paths.patch \
+           file://gtest-skip-fixes.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
1.7.10.4


