Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEAFC77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 15:13:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.11964.1685200371589466853
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 08:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=hoVHcnfJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3095557dd99so1733044f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685200370; x=1687792370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYeNrvGjHpNXWchzKv4Q4Fqdp1kDCt93yI1u+yLMeGg=;
        b=hoVHcnfJkwU7ruXKcRZyzuAp4LdYEqxG2+ehrEBaYZvJ+vmd/6kidLW+Wvov0wInhQ
         ET4idgkT3n21V1Y3Jn6DOPGCpib4+9mRhciULboToLGaf98znlRquLV4mnUWjZ7g2mpa
         2T42J6s9kcZBkZ5ucXmrw9OJv43OS2cXW2JiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685200370; x=1687792370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYeNrvGjHpNXWchzKv4Q4Fqdp1kDCt93yI1u+yLMeGg=;
        b=gRBNlTGNVtqVEaWrhFakeivxMRzezljPzLW8TT8XMkIEXMnXd6aOGVGuuqIuZ7K3Yf
         +ZyiIv9co14rFVHTAGkkdlZ0E5eT6fg4iAyqNvTVM2XavhKNUTUm3JaajsHV1BZiE2dX
         OsnaBn77W3VtkLb9cgEDNQePuhWy8TZxEkqF0XRl/iE17aImOhR4v2cak8uPDxjvX+ma
         yjyaOHQU0c5Um92EqsGDE2j6txMnbH9JwQb5IPEjSv9/Etr2AVOldwhWoms+zc9f9rQ+
         T7IHBnemJ0DMy1KdkaHkHQKFKzUd1YheazlfEysN+uD3EhAtPd0ttewdjQz8NhJM990y
         Xlhg==
X-Gm-Message-State: AC+VfDym3aFXM77CRnR9+Dco3awMz88oxMTPb1mLqSBjSfwoVPRsbwDc
	sQr5e3l0WDVWsnRBspkPOdrsJBD8DfWZ1dqah/k=
X-Google-Smtp-Source: ACHHUZ7tHCkwCyAuuX+ehmZymI7fJCCT4bbij7BEG7gsegQW1uWrNPmvb31IueKIMZPRF0NpopD/eA==
X-Received: by 2002:adf:ee0d:0:b0:309:3828:2bde with SMTP id y13-20020adfee0d000000b0030938282bdemr4169492wrn.60.1685200369706;
        Sat, 27 May 2023 08:12:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d24:65e6:bc0:7a3])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d6781000000b002fae7408544sm8252839wru.108.2023.05.27.08.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 08:12:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Emmanuele Bassi <ebassi@gmail.com>,
	Ross Burton <ross@burtonini.com>
Subject: [PATCH] glib: Fix ptest race issue
Date: Sat, 27 May 2023 16:12:48 +0100
Message-Id: <20230527151248.2943421-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 15:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181808

gio/tests/portal: Fix test ordering race

When the gnome test runner executes the tests, the test appear to execute in disk
order. This means it sometimes works and we sometimes see breakage in portal-support-snap
and portal-support-snap-classic.

The issue is that some tests create config files but some don't. If they run
in the wrong order, tests see config files they shouldn't and break.

Fix this by deleting the files after each test run, properly cleaning up after
themselves. There are probably better ways to handle this but this patch should
at least let us check this is the issue.

I've tried to report upstream but their issue tracker account creation is struggling
and I can't get my account to work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../glib-2.0/glib-2.0/fix-ptest.patch         | 166 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-ptest.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-ptest.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-ptest.patch
new file mode 100644
index 00000000000..1ae98be7076
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/fix-ptest.patch
@@ -0,0 +1,166 @@
+gio/tests/portal: Fix test ordering race
+
+When the gnome test runner executes the tests, the test appear to execute in disk 
+order. This means it sometimes works and we sometimes see breakage in portal-support-snap
+and portal-support-snap-classic.
+
+The issue is that some tests create config files but some don't. If they run
+in the wrong order, tests see config files they shouldn't and break.
+
+Fix this by deleting the files after each test run, properly cleaning up after 
+themselves. There are probably better ways to handle this but this patch should
+at least let us check this is the issue.
+
+I've tried to report upstream but their issue tracker account creation is struggling
+and I can't get my account to work.
+
+Upstream-Status: Pending
+
+Index: glib-2.76.2/gio/tests/portal-support-snap-classic.c
+===================================================================
+--- glib-2.76.2.orig/gio/tests/portal-support-snap-classic.c
++++ glib-2.76.2/gio/tests/portal-support-snap-classic.c
+@@ -89,6 +89,9 @@ test_portal_support_snap_none (SetupData
+   g_assert_false (glib_should_use_portal ());
+   g_assert_true (glib_network_available_in_sandbox ());
+   g_assert_true (glib_has_dconf_access_in_sandbox ());
++
++  cleanup_snapfiles (setup->snap_path);
++  cleanup_snapfiles (setup->bin_path);
+ }
+ 
+ static void
+@@ -101,6 +104,9 @@ test_portal_support_snap_all (SetupData
+   g_assert_false (glib_should_use_portal ());
+   g_assert_true (glib_network_available_in_sandbox ());
+   g_assert_true (glib_has_dconf_access_in_sandbox ());
++
++  cleanup_snapfiles (setup->snap_path);
++  cleanup_snapfiles (setup->bin_path);
+ }
+ 
+ int
+Index: glib-2.76.2/gio/tests/portal-support-snap.c
+===================================================================
+--- glib-2.76.2.orig/gio/tests/portal-support-snap.c
++++ glib-2.76.2/gio/tests/portal-support-snap.c
+@@ -80,6 +80,8 @@ test_portal_support_snap_no_snapctl (Set
+   g_assert_false (glib_should_use_portal ());
+   g_assert_false (glib_network_available_in_sandbox ());
+   g_assert_false (glib_has_dconf_access_in_sandbox ());
++
++  cleanup_snapfiles (setup->snap_path);
+ }
+ 
+ static void
+@@ -92,6 +94,9 @@ test_portal_support_snap_none (SetupData
+   g_assert_false (glib_should_use_portal ());
+   g_assert_false (glib_network_available_in_sandbox ());
+   g_assert_false (glib_has_dconf_access_in_sandbox ());
++
++  cleanup_snapfiles (setup->snap_path);
++  cleanup_snapfiles (setup->bin_path);
+ }
+ 
+ static void
+@@ -104,6 +109,9 @@ test_portal_support_snap_all (SetupData
+   g_assert_true (glib_should_use_portal ());
+   g_assert_true (glib_network_available_in_sandbox ());
+   g_assert_true (glib_has_dconf_access_in_sandbox ());
++
++  cleanup_snapfiles (setup->snap_path);
++  cleanup_snapfiles (setup->bin_path);
+ }
+ 
+ static void
+@@ -116,6 +124,9 @@ test_portal_support_snap_desktop_only (S
+   g_assert_true (glib_should_use_portal ());
+   g_assert_true (glib_network_available_in_sandbox ());
+   g_assert_false (glib_has_dconf_access_in_sandbox ());
++
++  cleanup_snapfiles (setup->snap_path);
++  cleanup_snapfiles (setup->bin_path);
+ }
+ 
+ static void
+@@ -128,6 +139,9 @@ test_portal_support_snap_network_only (S
+   g_assert_false (glib_should_use_portal ());
+   g_assert_true (glib_network_available_in_sandbox ());
+   g_assert_false (glib_has_dconf_access_in_sandbox ());
++
++  cleanup_snapfiles (setup->snap_path);
++  cleanup_snapfiles (setup->bin_path);
+ }
+ 
+ static void
+@@ -140,6 +154,9 @@ test_portal_support_snap_gsettings_only
+   g_assert_false (glib_should_use_portal ());
+   g_assert_false (glib_network_available_in_sandbox ());
+   g_assert_true (glib_has_dconf_access_in_sandbox ());
++
++  cleanup_snapfiles (setup->snap_path);
++  cleanup_snapfiles (setup->bin_path);
+ }
+ 
+ static void
+@@ -182,6 +199,9 @@ test_portal_support_snap_updates_dynamic
+   g_assert_false (glib_should_use_portal ());
+   g_assert_false (glib_network_available_in_sandbox ());
+   g_assert_false (glib_has_dconf_access_in_sandbox ());
++
++  cleanup_snapfiles (setup->snap_path);
++  cleanup_snapfiles (setup->bin_path);
+ }
+ 
+ int
+Index: glib-2.76.2/gio/tests/portal-support-utils.c
+===================================================================
+--- glib-2.76.2.orig/gio/tests/portal-support-utils.c
++++ glib-2.76.2/gio/tests/portal-support-utils.c
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
+Index: glib-2.76.2/gio/tests/portal-support-utils.h
+===================================================================
+--- glib-2.76.2.orig/gio/tests/portal-support-utils.h
++++ glib-2.76.2/gio/tests/portal-support-utils.h
+@@ -23,6 +23,8 @@
+ 
+ #include <glib.h>
+ 
++void cleanup_snapfiles (const gchar *path);
++
+ void create_fake_snap_yaml (const char *snap_path,
+                             gboolean is_classic);
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
index f3a716eb9d7..7a0ed6b6036 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch \
+           file://fix-ptest.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.39.2


