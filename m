Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9D5D63959
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:58:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.13968.1732111084370182814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gMQhSkuv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21262a191a5so14429175ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111084; x=1732715884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YstW2t2RO8ENWCgAsHaIQWJCTP/70JiNu+vdqQxFTVI=;
        b=gMQhSkuvJe5K6i3J4jzAPF6oh0sO3T+SOdMFZrGvOyOvlBijuB51z0DfSumyp35fyC
         zm1IhaT/l1gGIA6jYlsOVVKE6v6UWeCwAM3UfiXlj1hv2FyvMh03tZiJyP1rbRI6cqPM
         JmfStdIpKHsQwGqvylcgBGreBVlXlv6eSuQ2WWKv9fULgNNrYpWrrMz5O0wx0oFU0A2o
         OXBPS5SHCv8BA4v7IZIheGFeIqFpEzhj2U0LHwOcDqrHvIh0bAu3aLGbqV4kBv7lFT3b
         zUR7o7IgpcOiaU0pz3U0aFodp8xHBu1qSyx288Ai12rBZE+bQxth1i4PUdIzxW1PW7Jq
         ZxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111084; x=1732715884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YstW2t2RO8ENWCgAsHaIQWJCTP/70JiNu+vdqQxFTVI=;
        b=SW2h6wuE/mqRo9rbMYZoZN2BSMuhQGWLregxv24vtRWosXOd6Ms+AWf8Qn2k6QW3Ob
         c1qFmRfyNCJk+9wgBuNgTFfeCn6h4YJqSyVNwelsXIWXe5e/s8zbm/sH2Elb745NrN+v
         zgK5zRSM+IF+l4eCHNlMwu99IrxutvnFLo9vm+/k6tTpR4VYGQ3VRCWDJEkyiFczyTfE
         N6EW3iX9rwM8E739GN10v6554JTUSJp8/jKMVHOtgw/2xV6mQcYxMHFIo2v4MT7ezQKv
         0cj7so1cYkquUM+y5xqouTkO4ZREIGv5WGdq0drdAxs+ARZ5LFUnx58zwnERpPeEfgLK
         D5Kg==
X-Gm-Message-State: AOJu0YwCJ1MY08KFBV+z7PqMVIGZH7JWJqyLrh7qkidFLnUfztwSrE0a
	EjMwu8M2LUzrQGg3LC0XNtQITEHslHBy+aIZzjpCxZConvZzwJGYTp+eq7BGxjf0/wijWvDx+Aw
	n
X-Google-Smtp-Source: AGHT+IEPIGogQJ/tfQ3FQ2PXm86VS7BKdiafww7fA/waZp/DH7bdFzHQobNH2rZ0g1QojrTg34Qifw==
X-Received: by 2002:a17:903:22d0:b0:212:6011:594a with SMTP id d9443c01a7336-2126c117c14mr29848745ad.3.1732111083519;
        Wed, 20 Nov 2024 05:58:03 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.58.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:58:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 30/31] glib-2.0: fix glib-2.0 ptest failure when upgrading tzdata2024b
Date: Wed, 20 Nov 2024 05:57:02 -0800
Message-Id: <db5f60c88a2f9c2996846e45ab52ad11eafc6a83.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207454

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Backport 3 patches [1][2][3] for gdatetime test to fix the ptest failure.

[1] https://github.com/GNOME/glib/commit/c0619f08e6c608fd6464d2f0c6970ef0bbfb9ecf
[2] https://github.com/GNOME/glib/commit/30e9cfa5733003cd1079e0e9e8a4bff1a191171a
[3] https://github.com/GNOME/glib/commit/fe2699369f79981dcf913af4cfd98b342b84a9c1

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c8f87d5d4ec9f286b1e85d114cb9a728c1ff64b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/gdatetime-test-fail-0001.patch      | 72 +++++++++++++++++++
 .../files/gdatetime-test-fail-0002.patch      | 65 +++++++++++++++++
 .../files/gdatetime-test-fail-0003.patch      | 63 ++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  3 +
 4 files changed, 203 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch

diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
new file mode 100644
index 0000000000..e78d96c3ce
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
@@ -0,0 +1,72 @@
+From 729d1cbcd599e848bee07c72a276ccc02a06ddc0 Mon Sep 17 00:00:00 2001
+From: "Rebecca N. Palmer" <rebecca_palmer@zoho.com>
+Date: Fri, 11 Oct 2024 09:38:52 +0100
+Subject: [PATCH 1/3] gdatetime test: Do not assume PST8PDT was always exactly
+ -8/-7
+
+In newer tzdata, it is an alias for America/Los_Angeles, which has a
+slightly different meaning: DST did not exist there before 1883. As a
+result, we can no longer hard-code the knowledge that interval 0 is
+standard time and interval 1 is summer time, and instead we need to look
+up the correct intervals from known timestamps.
+
+Resolves: https://gitlab.gnome.org/GNOME/glib/-/issues/3502
+Bug-Debian: https://bugs.debian.org/1084190
+[smcv: expand commit message, fix whitespace]
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport
+[https://github.com/GNOME/glib/commit/c0619f08e6c608fd6464d2f0c6970ef0bbfb9ecf]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index d46f653ac..2eefc4106 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2930,6 +2930,7 @@ test_posix_parse (void)
+ {
+   GTimeZone *tz;
+   GDateTime *gdt1, *gdt2;
++  gint i1, i2;
+ 
+   /* Check that an unknown zone name falls back to UTC. */
+   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
+@@ -2953,16 +2954,25 @@ test_posix_parse (void)
+ 
+ /* This fails rules_from_identifier on Unix (though not on Windows)
+  * but passes anyway because PST8PDT is a zone name.
++ *
++ * Intervals i1 and i2 (rather than 0 and 1) are needed because in
++ * recent tzdata, PST8PDT may be an alias for America/Los_Angeles,
++ * and hence be aware that DST has not always existed.
++ * https://bugs.debian.org/1084190
+  */
+   tz = g_time_zone_new_identifier ("PST8PDT");
+   g_assert_nonnull (tz);
+   g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
+-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 0), ==, "PST");
+-  g_assert_cmpint (g_time_zone_get_offset (tz, 0), ==, - 8 * 3600);
+-  g_assert (!g_time_zone_is_dst (tz, 0));
+-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 1), ==, "PDT");
+-  g_assert_cmpint (g_time_zone_get_offset (tz, 1), ==,- 7 * 3600);
+-  g_assert (g_time_zone_is_dst (tz, 1));
++  /* a date in winter = non-DST */
++  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, 0);
++  /* approximately 6 months in seconds, i.e. a date in summer = DST */
++  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, 15000000);
++  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i1), ==, "PST");
++  g_assert_cmpint (g_time_zone_get_offset (tz, i1), ==, - 8 * 3600);
++  g_assert (!g_time_zone_is_dst (tz, i1));
++  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i2), ==, "PDT");
++  g_assert_cmpint (g_time_zone_get_offset (tz, i2), ==,- 7 * 3600);
++  g_assert (g_time_zone_is_dst (tz, i2));
+   g_time_zone_unref (tz);
+ 
+   tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
new file mode 100644
index 0000000000..d97bec12d6
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
@@ -0,0 +1,65 @@
+From 2702d7ff73649c05297105bab8977e2a9d28fa0b Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Fri, 18 Oct 2024 11:03:19 +0100
+Subject: [PATCH 2/3] gdatetime test: Try to make PST8PDT test more obviously
+ correct
+
+Instead of using timestamp 0 as a magic number (in this case interpreted
+as 1970-01-01T00:00:00-08:00), calculate a timestamp from a recent
+year/month/day in winter, in this case 2024-01-01T00:00:00-08:00.
+
+Similarly, instead of using a timestamp 15 million seconds later
+(1970-06-23T15:40:00-07:00), calculate a timestamp from a recent
+year/month/day in summer, in this case 2024-07-01T00:00:00-07:00.
+
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport
+[https://github.com/GNOME/glib/commit/30e9cfa5733003cd1079e0e9e8a4bff1a191171a]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 2eefc4106..728b87343 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2954,19 +2954,16 @@ test_posix_parse (void)
+ 
+ /* This fails rules_from_identifier on Unix (though not on Windows)
+  * but passes anyway because PST8PDT is a zone name.
+- *
+- * Intervals i1 and i2 (rather than 0 and 1) are needed because in
+- * recent tzdata, PST8PDT may be an alias for America/Los_Angeles,
+- * and hence be aware that DST has not always existed.
+- * https://bugs.debian.org/1084190
+  */
+   tz = g_time_zone_new_identifier ("PST8PDT");
+   g_assert_nonnull (tz);
+   g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
+   /* a date in winter = non-DST */
+-  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, 0);
+-  /* approximately 6 months in seconds, i.e. a date in summer = DST */
+-  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, 15000000);
++  gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
++  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
++  /* a date in summer = DST */
++  gdt2 = g_date_time_new (tz, 2024, 7, 1, 0, 0, 0);
++  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, g_date_time_to_unix (gdt2));
+   g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i1), ==, "PST");
+   g_assert_cmpint (g_time_zone_get_offset (tz, i1), ==, - 8 * 3600);
+   g_assert (!g_time_zone_is_dst (tz, i1));
+@@ -2974,6 +2971,8 @@ test_posix_parse (void)
+   g_assert_cmpint (g_time_zone_get_offset (tz, i2), ==,- 7 * 3600);
+   g_assert (g_time_zone_is_dst (tz, i2));
+   g_time_zone_unref (tz);
++  g_date_time_unref (gdt1);
++  g_date_time_unref (gdt2);
+ 
+   tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
+ #ifdef G_OS_WIN32
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
new file mode 100644
index 0000000000..dfeec97810
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
@@ -0,0 +1,63 @@
+From df251923fb2c80cc7acfe99aaf8c98d7d7cbd29f Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Fri, 18 Oct 2024 11:23:42 +0100
+Subject: [PATCH 3/3] gdatetime test: Fall back if legacy System V PST8PDT is
+ not available
+
+On recent versions of Debian, PST8PDT is part of the tzdata-legacy
+package, which is not always installed and might disappear in future.
+Successfully tested with and without tzdata-legacy on Debian unstable.
+
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport
+[https://github.com/GNOME/glib/commit/fe2699369f79981dcf913af4cfd98b342b84a9c1]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 728b87343..9e1acd097 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2931,6 +2931,7 @@ test_posix_parse (void)
+   GTimeZone *tz;
+   GDateTime *gdt1, *gdt2;
+   gint i1, i2;
++  const char *expect_id;
+ 
+   /* Check that an unknown zone name falls back to UTC. */
+   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
+@@ -2953,11 +2954,25 @@ test_posix_parse (void)
+   g_time_zone_unref (tz);
+ 
+ /* This fails rules_from_identifier on Unix (though not on Windows)
+- * but passes anyway because PST8PDT is a zone name.
++ * but can pass anyway because PST8PDT is a legacy System V zone name.
+  */
+   tz = g_time_zone_new_identifier ("PST8PDT");
++  expect_id = "PST8PDT";
++
++#ifndef G_OS_WIN32
++  /* PST8PDT is in tzdata's "backward" set, packaged as tzdata-legacy and
++   * not always present in some OSs; fall back to the equivalent geographical
++   * name if the "backward" time zones are absent. */
++  if (tz == NULL)
++    {
++      g_test_message ("Legacy PST8PDT time zone not available, falling back");
++      tz = g_time_zone_new_identifier ("America/Los_Angeles");
++      expect_id = "America/Los_Angeles";
++    }
++#endif
++
+   g_assert_nonnull (tz);
+-  g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
++  g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, expect_id);
+   /* a date in winter = non-DST */
+   gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
+   i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 9e742c4d3b..6ab52481b1 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -226,6 +226,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://skip-timeout.patch \
+           file://gdatetime-test-fail-0001.patch \
+           file://gdatetime-test-fail-0002.patch \
+           file://gdatetime-test-fail-0003.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.34.1


