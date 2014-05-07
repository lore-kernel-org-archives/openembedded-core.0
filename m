Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 440AB60781
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 21:31:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2014 14:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1006,1389772800"; d="scan'208";a="528103684"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 07 May 2014 14:31:22 -0700
Message-ID: <536AA62A.4000005@linux.intel.com>
Date: Wed, 07 May 2014 14:31:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1399478735-27819-1-git-send-email-ross.burton@intel.com>
	<1399478735-27819-2-git-send-email-ross.burton@intel.com>
In-Reply-To: <1399478735-27819-2-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 2/5] glib-2.0: upgrade to 2.40.0
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
X-List-Received-Date: Wed, 07 May 2014 21:32:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2014 09:05 AM, Ross Burton wrote:
> The patches Fix-Werror-format-string, gio-test-race, gtest-skip-fixes, and
> ptest-dbus have all been merged upstream.
>
> Two license checksums changed as upstream has updated the FSF address in those
> files.
>

This update seems to have introduced a definition of 
g_ptr_array_insert() which causes an issue with gst-openmax.

So a patch to gst-openmax might be needed.

Sau!


> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   ...ror-format-string-errors-from-mismatched-.patch |   56 ------
>   .../glib-2.0/glib-2.0/gio-test-race.patch          |   54 ------
>   .../glib-2.0/glib-2.0/gtest-skip-fixes.patch       |  197 --------------------
>   .../glib-2.0/glib-2.0/ptest-dbus.patch             |   65 -------
>   .../{glib-2.0_2.38.2.bb => glib-2.0_2.40.0.bb}     |    8 +-
>   meta/recipes-core/glib-2.0/glib.inc                |    4 +-
>   6 files changed, 4 insertions(+), 380 deletions(-)
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gio-test-race.patch
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gtest-skip-fixes.patch
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ptest-dbus.patch
>   rename meta/recipes-core/glib-2.0/{glib-2.0_2.38.2.bb => glib-2.0_2.40.0.bb} (60%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
> deleted file mode 100644
> index 9b87d9d..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 0167c3340d8201dca8e9031b61703bbc5ed6ce33 Mon Sep 17 00:00:00 2001
> -From: Jan Schmidt <thaytan@noraisin.net>
> -Date: Wed, 25 Sep 2013 19:22:26 +1000
> -Subject: [PATCH] gio: Fix -Werror format string errors from mismatched ints.
> -
> -Upstream-Status: Backport
> -
> ----
> - gio/gdbusmessage.c | 8 ++++----
> - gio/gdbusprivate.c | 4 ++--
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/gio/gdbusmessage.c b/gio/gdbusmessage.c
> -index ac233a3..ad77aa6 100644
> ---- a/gio/gdbusmessage.c
> -+++ b/gio/gdbusmessage.c
> -@@ -3468,10 +3468,10 @@ g_dbus_message_print (GDBusMessage *message,
> -                                           statbuf.st_mode);
> -                   g_string_append_printf (fs, "%s" "ino=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
> -                                           (guint64) statbuf.st_ino);
> --                  g_string_append_printf (fs, "%s" "uid=%d", fs->len > 0 ? "," : "",
> --                                          statbuf.st_uid);
> --                  g_string_append_printf (fs, "%s" "gid=%d", fs->len > 0 ? "," : "",
> --                                          statbuf.st_gid);
> -+                  g_string_append_printf (fs, "%s" "uid=%u", fs->len > 0 ? "," : "",
> -+                                          (guint) statbuf.st_uid);
> -+                  g_string_append_printf (fs, "%s" "gid=%u", fs->len > 0 ? "," : "",
> -+                                          (guint) statbuf.st_gid);
> -                   g_string_append_printf (fs, "%s" "rdev=%d:%d", fs->len > 0 ? "," : "",
> -                                           major (statbuf.st_rdev), minor (statbuf.st_rdev));
> -                   g_string_append_printf (fs, "%s" "size=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
> -diff --git a/gio/gdbusprivate.c b/gio/gdbusprivate.c
> -index 0e5bef2..785a0c0 100644
> ---- a/gio/gdbusprivate.c
> -+++ b/gio/gdbusprivate.c
> -@@ -2155,7 +2155,7 @@ write_message_print_transport_debug (gssize bytes_written,
> -   _g_dbus_debug_print_lock ();
> -   g_print ("========================================================================\n"
> -            "GDBus-debug:Transport:\n"
> --           "  >>>> WROTE %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
> -+           "  >>>> WROTE %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
> -            "       size %" G_GSIZE_FORMAT " from offset %" G_GSIZE_FORMAT " on a %s\n",
> -            bytes_written,
> -            g_dbus_message_get_serial (data->message),
> -@@ -2206,7 +2206,7 @@ read_message_print_transport_debug (gssize bytes_read,
> -     _g_dbus_debug_print_lock ();
> -   g_print ("========================================================================\n"
> -            "GDBus-debug:Transport:\n"
> --           "  <<<< READ %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
> -+           "  <<<< READ %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
> -            "       size %d to offset %" G_GSIZE_FORMAT " from a %s\n",
> -            bytes_read,
> -            serial,
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gio-test-race.patch b/meta/recipes-core/glib-2.0/glib-2.0/gio-test-race.patch
> deleted file mode 100644
> index 720ea6c..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/gio-test-race.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -Upstream-Status: Submitted
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From a047a0270ee5faf1d9d6080cbc613defdf52baea Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Tue, 4 Feb 2014 13:15:08 +0000
> -Subject: [PATCH] gio/tests: fix race when generating code
> -
> -There is a race condition in the makefile that can result in build failures like this in parallel builds:
> -
> -| ./gdbus-test-codegen-generated.h:7:0: error: unterminated #ifndef
> -|  #ifndef __GDBUS_TEST_CODEGEN_GENERATED_H__
> -
> -This is because a rule like this:
> -
> -x.c x.h: prerequisites
> -	@commands
> -
> -doesn't consider x.c and x.h together. Instead, it expands to two rules, one to
> -generate x.c and one to generate x.h, which happen to run the same commands.  In
> -the worst case they execute in parallel, overwriting each other's output.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=723616
> ----
> - gio/tests/Makefile.am |    4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
> -index 0beb239..270faf6 100644
> ---- a/gio/tests/Makefile.am
> -+++ b/gio/tests/Makefile.am
> -@@ -436,7 +436,7 @@ gmenumodel_SOURCES                       = $(gdbus_sessionbus_sources) gmenumode
> - gnotification_SOURCES                    = $(gdbus_sessionbus_sources) gnotification.c gnotification-server.h gnotification-server.c
> -
> - gdbus-test-codegen.o: gdbus-test-codegen-generated.h
> --gdbus-test-codegen-generated.h gdbus-test-codegen-generated.c: test-codegen.xml Makefile $(top_builddir)/gio/gdbus-2.0/codegen/gdbus-codegen
> -+gdbus-test-codegen-generated.h: test-codegen.xml Makefile $(top_builddir)/gio/gdbus-2.0/codegen/gdbus-codegen
> - 	$(AM_V_GEN) UNINSTALLED_GLIB_SRCDIR=$(top_srcdir) \
> - 		UNINSTALLED_GLIB_BUILDDIR=$(top_builddir) \
> - 		$(PYTHON) $(top_builddir)/gio/gdbus-2.0/codegen/gdbus-codegen \
> -@@ -455,6 +455,8 @@ gdbus-test-codegen-generated.h gdbus-test-codegen-generated.c: test-codegen.xml
> - 		--annotate "org.project.Bar::TestSignal[array_of_strings]" Key8 Value8 \
> - 		$(srcdir)/test-codegen.xml \
> - 		$(NULL)
> -+gdbus-test-codegen-generated.c: gdbus-test-codegen-generated.h
> -+	@: # Generated as side-effect of .h
> -
> - EXTRA_DIST += test-codegen.xml
> - CLEANFILES += gdbus-test-codegen-generated.[ch] gdbus-test-codegen-generated-doc-*.xml
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gtest-skip-fixes.patch b/meta/recipes-core/glib-2.0/glib-2.0/gtest-skip-fixes.patch
> deleted file mode 100644
> index 3dba0ee..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/gtest-skip-fixes.patch
> +++ /dev/null
> @@ -1,197 +0,0 @@
> -Fix the handling of skipped tests so that it follows what automake does.
> -
> -Upstream-Status: Backport [https://bugzilla.gnome.org/show_bug.cgi?id=720263]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/glib/gtestutils.c b/glib/gtestutils.c
> -index bc7bbcf..feaafa3 100644
> ---- a/glib/gtestutils.c
> -+++ b/glib/gtestutils.c
> -@@ -607,9 +607,10 @@ static gchar      *test_run_name = "";
> - static GSList    **test_filename_free_list;
> - static guint       test_run_forks = 0;
> - static guint       test_run_count = 0;
> -+static guint       test_skipped_count = 0;
> - static GTestResult test_run_success = G_TEST_RUN_FAILURE;
> - static gchar      *test_run_msg = NULL;
> --static guint       test_skip_count = 0;
> -+static guint       test_startup_skip_count = 0;
> - static GTimer     *test_user_timer = NULL;
> - static double      test_user_stamp = 0;
> - static GSList     *test_paths = NULL;
> -@@ -765,6 +766,8 @@ g_test_log (GTestLogType lbit,
> -             g_print ("Bail out!\n");
> -           abort();
> -         }
> -+      if (largs[0] == G_TEST_RUN_SKIPPED)
> -+        test_skipped_count++;
> -       break;
> -     case G_TEST_LOG_MIN_RESULT:
> -       if (test_tap_log)
> -@@ -869,11 +872,11 @@ parse_args (gint    *argc_p,
> -         {
> -           gchar *equal = argv[i] + 16;
> -           if (*equal == '=')
> --            test_skip_count = g_ascii_strtoull (equal + 1, NULL, 0);
> -+            test_startup_skip_count = g_ascii_strtoull (equal + 1, NULL, 0);
> -           else if (i + 1 < argc)
> -             {
> -               argv[i++] = NULL;
> --              test_skip_count = g_ascii_strtoull (argv[i], NULL, 0);
> -+              test_startup_skip_count = g_ascii_strtoull (argv[i], NULL, 0);
> -             }
> -           argv[i] = NULL;
> -         }
> -@@ -1516,14 +1519,21 @@ g_test_get_root (void)
> -  * g_test_run_suite() or g_test_run() may only be called once
> -  * in a program.
> -  *
> -- * Returns: 0 on success
> -+ * Returns: 0 on success, 1 on failure (assuming it returns at all),
> -+ *   77 if all tests were skipped with g_test_skip().
> -  *
> -  * Since: 2.16
> -  */
> - int
> - g_test_run (void)
> - {
> --  return g_test_run_suite (g_test_get_root());
> -+  if (g_test_run_suite (g_test_get_root()) != 0)
> -+    return 1;
> -+
> -+  if (test_run_count > 0 && test_run_count == test_skipped_count)
> -+    return 77;
> -+  else
> -+    return 0;
> - }
> -
> - /**
> -@@ -2063,7 +2073,7 @@ test_case_run (GTestCase *tc)
> -         }
> -     }
> -
> --  if (++test_run_count <= test_skip_count)
> -+  if (++test_run_count <= test_startup_skip_count)
> -     g_test_log (G_TEST_LOG_SKIP_CASE, test_run_name, NULL, 0, NULL);
> -   else if (test_run_list)
> -     {
> -@@ -2117,7 +2127,8 @@ test_case_run (GTestCase *tc)
> -   g_free (test_uri_base);
> -   test_uri_base = old_base;
> -
> --  return success == G_TEST_RUN_SUCCESS;
> -+  return (success == G_TEST_RUN_SUCCESS ||
> -+          success == G_TEST_RUN_SKIPPED);
> - }
> -
> - static int
> -diff --git a/glib/tests/testing.c b/glib/tests/testing.c
> -index 20c2e79..1025f12 100644
> ---- a/glib/tests/testing.c
> -+++ b/glib/tests/testing.c
> -@@ -575,10 +575,93 @@ test_nonfatal (void)
> -   g_test_trap_assert_stdout ("*The End*");
> - }
> -
> -+static void
> -+test_skip (void)
> -+{
> -+  g_test_skip ("Skipped should count as passed, not failed");
> -+}
> -+
> -+static void
> -+test_pass (void)
> -+{
> -+}
> -+
> -+static const char *argv0;
> -+
> -+static void
> -+test_skip_all (void)
> -+{
> -+  GPtrArray *argv;
> -+  GError *error = NULL;
> -+  int status;
> -+
> -+  argv = g_ptr_array_new ();
> -+  g_ptr_array_add (argv, (char *) argv0);
> -+  g_ptr_array_add (argv, "--GTestSubprocess");
> -+  g_ptr_array_add (argv, "-p");
> -+  g_ptr_array_add (argv, "/misc/skip");
> -+  g_ptr_array_add (argv, NULL);
> -+
> -+  g_spawn_sync (NULL, (char **) argv->pdata, NULL,
> -+                G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL,
> -+                NULL, NULL, NULL, NULL, &status,
> -+                &error);
> -+  g_assert_no_error (error);
> -+
> -+  g_spawn_check_exit_status (status, &error);
> -+  g_assert_error (error, G_SPAWN_EXIT_ERROR, 77);
> -+  g_clear_error (&error);
> -+
> -+  g_ptr_array_set_size (argv, 0);
> -+  g_ptr_array_add (argv, (char *) argv0);
> -+  g_ptr_array_add (argv, "--GTestSubprocess");
> -+  g_ptr_array_add (argv, "-p");
> -+  g_ptr_array_add (argv, "/misc/skip");
> -+  g_ptr_array_add (argv, "-p");
> -+  g_ptr_array_add (argv, "/misc/skip-all/subprocess/skip1");
> -+  g_ptr_array_add (argv, "-p");
> -+  g_ptr_array_add (argv, "/misc/skip-all/subprocess/skip2");
> -+  g_ptr_array_add (argv, NULL);
> -+
> -+  g_spawn_sync (NULL, (char **) argv->pdata, NULL,
> -+                G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL,
> -+                NULL, NULL, NULL, NULL, &status,
> -+                &error);
> -+  g_assert_no_error (error);
> -+
> -+  g_spawn_check_exit_status (status, &error);
> -+  g_assert_error (error, G_SPAWN_EXIT_ERROR, 77);
> -+  g_clear_error (&error);
> -+
> -+  g_ptr_array_set_size (argv, 0);
> -+  g_ptr_array_add (argv, (char *) argv0);
> -+  g_ptr_array_add (argv, "--GTestSubprocess");
> -+  g_ptr_array_add (argv, "-p");
> -+  g_ptr_array_add (argv, "/misc/skip");
> -+  g_ptr_array_add (argv, "-p");
> -+  g_ptr_array_add (argv, "/misc/skip-all/subprocess/pass");
> -+  g_ptr_array_add (argv, "-p");
> -+  g_ptr_array_add (argv, "/misc/skip-all/subprocess/skip1");
> -+  g_ptr_array_add (argv, NULL);
> -+
> -+  g_spawn_sync (NULL, (char **) argv->pdata, NULL,
> -+                G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL,
> -+                NULL, NULL, NULL, NULL, &status,
> -+                &error);
> -+  g_assert_no_error (error);
> -+
> -+  g_spawn_check_exit_status (status, &error);
> -+  g_assert_no_error (error);
> -+
> -+  g_ptr_array_unref (argv);
> -+}
> -+
> - int
> - main (int   argc,
> -       char *argv[])
> - {
> -+  argv0 = argv[0];
> -+
> -   g_test_init (&argc, &argv, NULL);
> -
> -   g_test_add_func ("/random-generator/rand-1", test_rand1);
> -@@ -633,5 +716,11 @@ main (int   argc,
> -
> -   g_test_add_func ("/misc/nonfatal", test_nonfatal);
> -
> -+  g_test_add_func ("/misc/skip", test_skip);
> -+  g_test_add_func ("/misc/skip-all", test_skip_all);
> -+  g_test_add_func ("/misc/skip-all/subprocess/skip1", test_skip);
> -+  g_test_add_func ("/misc/skip-all/subprocess/skip2", test_skip);
> -+  g_test_add_func ("/misc/skip-all/subprocess/pass", test_pass);
> -+
> -   return g_test_run();
> - }
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/ptest-dbus.patch b/meta/recipes-core/glib-2.0/glib-2.0/ptest-dbus.patch
> deleted file mode 100644
> index 0db8fd1..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/ptest-dbus.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Fix dbus-appinfo from attempting to use the session's bus, and hanging if there
> -isn't one present.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 940fa98290812789d095d93ff1c550cd86fb2428 Mon Sep 17 00:00:00 2001
> -From: Xavier Claessens <xavier.claessens@collabora.co.uk>
> -Date: Mon, 28 Oct 2013 21:18:54 +0000
> -Subject: Tests: add session_bus_run() and use it where possible
> -
> -This is to avoid having again the subtil bug in dbus-appinfo.c:
> -session_bus_down() was called before g_test_run() so the test was
> -running on the user's dbus session.
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=697348
> ----
> -diff --git a/gio/tests/dbus-appinfo.c b/gio/tests/dbus-appinfo.c
> -index ca11e98..7698429 100644
> ---- a/gio/tests/dbus-appinfo.c
> -+++ b/gio/tests/dbus-appinfo.c
> -@@ -280,11 +280,7 @@ main (int argc, char **argv)
> - {
> -   g_test_init (&argc, &argv, NULL);
> -
> --  session_bus_up ();
> --
> -   g_test_add_func ("/appinfo/dbusappinfo", test_dbus_appinfo);
> -
> --  session_bus_down ();
> --
> --  return g_test_run ();
> -+  return session_bus_run ();
> - }
> -diff --git a/gio/tests/gdbus-sessionbus.c b/gio/tests/gdbus-sessionbus.c
> -index 68c4449..13c2edb 100644
> ---- a/gio/tests/gdbus-sessionbus.c
> -+++ b/gio/tests/gdbus-sessionbus.c
> -@@ -47,3 +47,14 @@ session_bus_down (void)
> -   g_clear_object (&singleton);
> - }
> -
> -+gint
> -+session_bus_run (void)
> -+{
> -+  gint ret;
> -+
> -+  session_bus_up ();
> -+  ret = g_test_run ();
> -+  session_bus_down ();
> -+
> -+  return ret;
> -+}
> -diff --git a/gio/tests/gdbus-sessionbus.h b/gio/tests/gdbus-sessionbus.h
> -index 7ef3abd..284cd00 100644
> ---- a/gio/tests/gdbus-sessionbus.h
> -+++ b/gio/tests/gdbus-sessionbus.h
> -@@ -30,6 +30,7 @@ G_BEGIN_DECLS
> - void session_bus_up   (void);
> - void session_bus_stop (void);
> - void session_bus_down (void);
> -+gint session_bus_run (void);
> -
> - G_END_DECLS
> -
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
> similarity index 60%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
> index 4052950..3be126f 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
> @@ -10,15 +10,11 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>              file://add-march-i486-into-CFLAGS-automatically.patch \
>              file://glib-2.0-configure-readlink.patch \
>              file://run-ptest \
> -           file://0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch \
> -           file://ptest-dbus.patch \
>              file://ptest-paths.patch \
> -           file://gtest-skip-fixes.patch \
> -           file://gio-test-race.patch \
>              file://uclibc.patch \
>             "
>
>   SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
>
> -SRC_URI[md5sum] = "26d1d08e478fc48c181ca8be44f5b69f"
> -SRC_URI[sha256sum] = "056a9854c0966a0945e16146b3345b7a82562a5ba4d5516fd10398732aea5734"
> +SRC_URI[md5sum] = "05fb7cb17eacbc718e90366a1eae60d9"
> +SRC_URI[sha256sum] = "0d27f195966ecb1995dcce0754129fd66ebe820c7cd29200d264b02af1aa28b5"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 4d27262..1b29e48 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -4,9 +4,9 @@ DESCRIPTION = "GLib is a general-purpose utility library, which provides many us
>   # docs/reference/COPYING is with a 'public domai'-like license!
>   LICENSE = "LGPLv2+ & BSD & PD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
> -                    file://glib/glib.h;beginline=4;endline=17;md5=62b7bd0d17b98573dfb87495ac1c5b4c \
> +                    file://glib/glib.h;beginline=4;endline=17;md5=b4f0f4a399c19e5ebb20c31b79d6bc32 \
>                       file://gmodule/COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
> -                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=62b7bd0d17b98573dfb87495ac1c5b4c \
> +                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=b4f0f4a399c19e5ebb20c31b79d6bc32 \
>                       file://glib/pcre/COPYING;md5=266ebc3ff74ee9ce6fad65577667c0f4 \
>                       file://glib/pcre/pcre.h;beginline=11;endline=35;md5=de27f2bf633d20a2b7af0b1983423283 \
>                       file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
>

