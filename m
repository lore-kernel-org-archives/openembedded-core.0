Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34D0C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 14:42:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.912.1685457767523920333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 07:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ZZ5ZfTKZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so31667975e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 07:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685457766; x=1688049766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qObKjTGZdvO5LKSdlBza9xISHP0Bs4It+tzIjEG6acM=;
        b=ZZ5ZfTKZtG/AK6vY65hx59GNEICzgLjb99Ea3oSlCxRR7NMsG5kUQ1s75uLXUrU2z7
         xIxlhyP06yJ5314i8/wFD65ZICPHq+ohm2rdVcFUGOsK3skUmQ/+Spc7exUilu4UJjyn
         7ekPRPzz1HGoe/M7rIdJuv9Cnh3PQ7nMvQ3Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685457766; x=1688049766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qObKjTGZdvO5LKSdlBza9xISHP0Bs4It+tzIjEG6acM=;
        b=EkqiA4Sj7bDNiOqOtfbVMNAXYqg1Dj1Xow2yR0boAQ/vLyqqrW6D7a1pkStfkSTL5B
         Ew0uSRiCAzels1SPOJ9FAC6yy7rwg4Dhz54WnA6332ECECcFJG5klRxrZlKqI00fFSZN
         jyrJPKVhoPTfdjTni9leRX57JAIwU+7JqrMdIihjeBLS/7gv0Fj96cl09jEZN1OTXoAa
         FgE2YOqL9s/iJQUMaXay3M/AQNVCd+x10fUhSO1n4WaNhMsz4W4ZXDtjuljCKzuG/UCs
         gs83iBDQhujCp7HrWEY4cfRlibPp7T4L3HgCWLEVhSFcAWJczfco8nA3SHeUIoAqUStM
         xtkg==
X-Gm-Message-State: AC+VfDxD2aUJKnVmzb70aoceJaMgQ54uxkCU1qnHaa1YOOSZBhodqThE
	Iuu9N3JziCsINwFGTf2F2SC4ScpmmOo/Rh8Aa0c=
X-Google-Smtp-Source: ACHHUZ4l5xYhdDCbxQYuLso0QSrbo7ArOCAERKC16kz5BoWrWsyNvs+an8Vuu/oOqJwN0vhQ9XQHyw==
X-Received: by 2002:a05:600c:213:b0:3f6:c8c:7048 with SMTP id 19-20020a05600c021300b003f60c8c7048mr1826178wmi.20.1685457765598;
        Tue, 30 May 2023 07:42:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3])
        by smtp.gmail.com with ESMTPSA id y12-20020a1c4b0c000000b003f4290720d0sm21070309wma.47.2023.05.30.07.42.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:42:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: Update ptest fix to upstream backport
Date: Tue, 30 May 2023 15:42:44 +0100
Message-Id: <20230530144244.3268051-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181929

Update the ptest fix to match the one accepted upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-support-Fix-snap-test-ordering-race.patch | 107 +++++++++++
 .../glib-2.0/glib-2.0/fix-ptest.patch         | 166 ------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb |   2 +-
 3 files changed, 108 insertions(+), 167 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-ptest.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch
new file mode 100644
index 00000000000..9e2bc1338b1
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch
@@ -0,0 +1,107 @@
+From f47503cc5ae10de6dee319ba6cff257eddabf33e Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 30 May 2023 11:52:38 +0100
+Subject: [PATCH] gio/tests/portal-support: Fix snap test ordering race
+
+When the gnome test runner executes the tests, the test appear to execute in disk
+order. This means it sometimes works and sometimes we see breakage in portal-support-snap
+and portal-support-snap-classic.
+
+The issue is that some tests create config files but some don't. If they run
+in the wrong order, tests see config files they shouldn't and break.
+
+Fix this by deleting the files after each test run, properly cleaning up after
+themselves. The cleanup code is based upon gtestutils.c:rm_rf().
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c63cf19d9a8a6ae315a7f9a3fe4ea60c8cf5dece]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ gio/tests/portal-support-snap-classic.c |  3 +++
+ gio/tests/portal-support-snap.c         |  3 +++
+ gio/tests/portal-support-utils.c        | 27 +++++++++++++++++++++++++
+ gio/tests/portal-support-utils.h        |  2 ++
+ 4 files changed, 35 insertions(+)
+
+diff --git a/gio/tests/portal-support-snap-classic.c b/gio/tests/portal-support-snap-classic.c
+index 8c0ed90c2..5b67865e7 100644
+--- a/gio/tests/portal-support-snap-classic.c
++++ b/gio/tests/portal-support-snap-classic.c
+@@ -66,6 +66,9 @@ tests_teardown (SetupData *setup_data,
+   else
+     g_unsetenv ("SNAP");
+ 
++  cleanup_snapfiles (setup_data->snap_path);
++  cleanup_snapfiles (setup_data->bin_path);
++
+   g_clear_pointer (&setup_data->old_path, g_free);
+   g_clear_pointer (&setup_data->old_snap, g_free);
+ }
+diff --git a/gio/tests/portal-support-snap.c b/gio/tests/portal-support-snap.c
+index 7dd14d82f..cd904678f 100644
+--- a/gio/tests/portal-support-snap.c
++++ b/gio/tests/portal-support-snap.c
+@@ -67,6 +67,9 @@ tests_teardown (SetupData *setup_data,
+   else
+     g_unsetenv ("SNAP");
+ 
++  cleanup_snapfiles (setup_data->snap_path);
++  cleanup_snapfiles (setup_data->bin_path);
++
+   g_clear_pointer (&setup_data->old_path, g_free);
+   g_clear_pointer (&setup_data->old_snap, g_free);
+ }
+diff --git a/gio/tests/portal-support-utils.c b/gio/tests/portal-support-utils.c
+index ae7073a3a..b7ee22630 100644
+--- a/gio/tests/portal-support-utils.c
++++ b/gio/tests/portal-support-utils.c
+@@ -26,6 +26,33 @@
+ #include <glib.h>
+ #include <glib/gstdio.h>
+ 
++
++void
++cleanup_snapfiles (const gchar *path)
++{
++  GDir *dir = NULL;
++  const gchar *entry;
++
++  dir = g_dir_open (path, 0, NULL);
++  if (dir == NULL)
++    {
++      /* Assume it’s a file. Ignore failure. */
++      (void) g_remove (path);
++      return;
++    }
++
++  while ((entry = g_dir_read_name (dir)) != NULL)
++    {
++      gchar *sub_path = g_build_filename (path, entry, NULL);
++      cleanup_snapfiles (sub_path);
++      g_free (sub_path);
++    }
++
++  g_dir_close (dir);
++
++  g_rmdir (path);
++}
++
+ void
+ create_fake_snapctl (const char *path,
+                      const char *supported_op)
+diff --git a/gio/tests/portal-support-utils.h b/gio/tests/portal-support-utils.h
+index 40c035b43..defbdcd4e 100644
+--- a/gio/tests/portal-support-utils.h
++++ b/gio/tests/portal-support-utils.h
+@@ -23,6 +23,8 @@
+ 
+ #include <glib.h>
+ 
++void cleanup_snapfiles (const gchar *path);
++
+ void create_fake_snap_yaml (const char *snap_path,
+                             gboolean is_classic);
+ 
+-- 
+2.39.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-ptest.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-ptest.patch
deleted file mode 100644
index 1ae98be7076..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/fix-ptest.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-gio/tests/portal: Fix test ordering race
-
-When the gnome test runner executes the tests, the test appear to execute in disk 
-order. This means it sometimes works and we sometimes see breakage in portal-support-snap
-and portal-support-snap-classic.
-
-The issue is that some tests create config files but some don't. If they run
-in the wrong order, tests see config files they shouldn't and break.
-
-Fix this by deleting the files after each test run, properly cleaning up after 
-themselves. There are probably better ways to handle this but this patch should
-at least let us check this is the issue.
-
-I've tried to report upstream but their issue tracker account creation is struggling
-and I can't get my account to work.
-
-Upstream-Status: Pending
-
-Index: glib-2.76.2/gio/tests/portal-support-snap-classic.c
-===================================================================
---- glib-2.76.2.orig/gio/tests/portal-support-snap-classic.c
-+++ glib-2.76.2/gio/tests/portal-support-snap-classic.c
-@@ -89,6 +89,9 @@ test_portal_support_snap_none (SetupData
-   g_assert_false (glib_should_use_portal ());
-   g_assert_true (glib_network_available_in_sandbox ());
-   g_assert_true (glib_has_dconf_access_in_sandbox ());
-+
-+  cleanup_snapfiles (setup->snap_path);
-+  cleanup_snapfiles (setup->bin_path);
- }
- 
- static void
-@@ -101,6 +104,9 @@ test_portal_support_snap_all (SetupData
-   g_assert_false (glib_should_use_portal ());
-   g_assert_true (glib_network_available_in_sandbox ());
-   g_assert_true (glib_has_dconf_access_in_sandbox ());
-+
-+  cleanup_snapfiles (setup->snap_path);
-+  cleanup_snapfiles (setup->bin_path);
- }
- 
- int
-Index: glib-2.76.2/gio/tests/portal-support-snap.c
-===================================================================
---- glib-2.76.2.orig/gio/tests/portal-support-snap.c
-+++ glib-2.76.2/gio/tests/portal-support-snap.c
-@@ -80,6 +80,8 @@ test_portal_support_snap_no_snapctl (Set
-   g_assert_false (glib_should_use_portal ());
-   g_assert_false (glib_network_available_in_sandbox ());
-   g_assert_false (glib_has_dconf_access_in_sandbox ());
-+
-+  cleanup_snapfiles (setup->snap_path);
- }
- 
- static void
-@@ -92,6 +94,9 @@ test_portal_support_snap_none (SetupData
-   g_assert_false (glib_should_use_portal ());
-   g_assert_false (glib_network_available_in_sandbox ());
-   g_assert_false (glib_has_dconf_access_in_sandbox ());
-+
-+  cleanup_snapfiles (setup->snap_path);
-+  cleanup_snapfiles (setup->bin_path);
- }
- 
- static void
-@@ -104,6 +109,9 @@ test_portal_support_snap_all (SetupData
-   g_assert_true (glib_should_use_portal ());
-   g_assert_true (glib_network_available_in_sandbox ());
-   g_assert_true (glib_has_dconf_access_in_sandbox ());
-+
-+  cleanup_snapfiles (setup->snap_path);
-+  cleanup_snapfiles (setup->bin_path);
- }
- 
- static void
-@@ -116,6 +124,9 @@ test_portal_support_snap_desktop_only (S
-   g_assert_true (glib_should_use_portal ());
-   g_assert_true (glib_network_available_in_sandbox ());
-   g_assert_false (glib_has_dconf_access_in_sandbox ());
-+
-+  cleanup_snapfiles (setup->snap_path);
-+  cleanup_snapfiles (setup->bin_path);
- }
- 
- static void
-@@ -128,6 +139,9 @@ test_portal_support_snap_network_only (S
-   g_assert_false (glib_should_use_portal ());
-   g_assert_true (glib_network_available_in_sandbox ());
-   g_assert_false (glib_has_dconf_access_in_sandbox ());
-+
-+  cleanup_snapfiles (setup->snap_path);
-+  cleanup_snapfiles (setup->bin_path);
- }
- 
- static void
-@@ -140,6 +154,9 @@ test_portal_support_snap_gsettings_only
-   g_assert_false (glib_should_use_portal ());
-   g_assert_false (glib_network_available_in_sandbox ());
-   g_assert_true (glib_has_dconf_access_in_sandbox ());
-+
-+  cleanup_snapfiles (setup->snap_path);
-+  cleanup_snapfiles (setup->bin_path);
- }
- 
- static void
-@@ -182,6 +199,9 @@ test_portal_support_snap_updates_dynamic
-   g_assert_false (glib_should_use_portal ());
-   g_assert_false (glib_network_available_in_sandbox ());
-   g_assert_false (glib_has_dconf_access_in_sandbox ());
-+
-+  cleanup_snapfiles (setup->snap_path);
-+  cleanup_snapfiles (setup->bin_path);
- }
- 
- int
-Index: glib-2.76.2/gio/tests/portal-support-utils.c
-===================================================================
---- glib-2.76.2.orig/gio/tests/portal-support-utils.c
-+++ glib-2.76.2/gio/tests/portal-support-utils.c
-@@ -26,6 +26,33 @@
- #include <glib.h>
- #include <glib/gstdio.h>
- 
-+
-+void
-+cleanup_snapfiles (const gchar *path)
-+{
-+  GDir *dir = NULL;
-+  const gchar *entry;
-+
-+  dir = g_dir_open (path, 0, NULL);
-+  if (dir == NULL)
-+    {
-+      /* Assume it’s a file. Ignore failure. */
-+      (void) g_remove (path);
-+      return;
-+    }
-+
-+  while ((entry = g_dir_read_name (dir)) != NULL)
-+    {
-+      gchar *sub_path = g_build_filename (path, entry, NULL);
-+      cleanup_snapfiles (sub_path);
-+      g_free (sub_path);
-+    }
-+
-+  g_dir_close (dir);
-+
-+  g_rmdir (path);
-+}
-+
- void
- create_fake_snapctl (const char *path,
-                      const char *supported_op)
-Index: glib-2.76.2/gio/tests/portal-support-utils.h
-===================================================================
---- glib-2.76.2.orig/gio/tests/portal-support-utils.h
-+++ glib-2.76.2/gio/tests/portal-support-utils.h
-@@ -23,6 +23,8 @@
- 
- #include <glib.h>
- 
-+void cleanup_snapfiles (const gchar *path);
-+
- void create_fake_snap_yaml (const char *snap_path,
-                             gboolean is_classic);
- 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
index 7a0ed6b6036..6a9a5f359c6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch \
-           file://fix-ptest.patch \
+           file://0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.39.2


