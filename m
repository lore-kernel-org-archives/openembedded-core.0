Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF56E64AA3
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:44 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.19386.1733233059356766172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wHBjFWYO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215cc7b0c56so2902945ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233059; x=1733837859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYM3t1AZz0Q/rWsT46gID8CxDHLNQO7IsgP4cTRdZO4=;
        b=wHBjFWYOpD/3X4uyJ9gkyTFtErItdboTVdqwbySVq4FDgbbXJBSNi8JYPQxzo071k0
         LGgjEJmZ0EJ/kyMHNK15F5BK8AvRDMiyma7vyBgJpC6RpPCjcfO0N+AjtcBoMVbfcNcP
         YTSjYKzoG5zzNcQ29tdgF0iL0yobRtzl6prn7wa/9abNzuEwhFMg85/sfJaKMInZHj8Y
         50B9tYkC1TbnzLVjN2UAOoIhV5wTifs44umNKDDjgUvoeKCdJfLjgpnNF9QZE8Bt1A1k
         069nL533C+WJRe6HHtka7hoGRG7HkUZEn2V3P1ljggF8SjUgEQatYu64wP26riTix9ZN
         3VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233059; x=1733837859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYM3t1AZz0Q/rWsT46gID8CxDHLNQO7IsgP4cTRdZO4=;
        b=snTKT4GSOo2q4gLaNhvpT6XzHchgcaq1QmXjwEgYCqLJEwiO+cFxX+8TQHjedozEan
         2ZTwx8GaiCIRTr5s5L2mK+UJdMOQj5RWBMigR2peqYWslzMUTgxeNlc4MLWxYazijwjK
         svYofKgyPpoXIAd6Ir54ZA//o9fqAihLvh69tVjk6c51ZtuAaYypRuaAIWTDhZ648nhA
         UZZPav1Rz5rA4Ffn95Uo3lbbSQkIiC6Fc2LpJ67VKp1a+IZbBKq09nBqqrAs95QbImNF
         gzdPkXps34h8F2i7BT9l5jgH3wS6GvrDOwvZoDXXeaJEpZ5F5dXmpg1H9+5dbiJoA5zT
         iUCw==
X-Gm-Message-State: AOJu0Yxj1XMgyAmZGFqRsOJEaPVqQfx24bX7FOgglsWdrzRZHdR6M/wg
	MS87z5Y5eEEf31vuKQ74N5tReJtZ9/cJuEcgfkvRFIb9qPYyTtEsNf7h652hm6vstnOmtDm+BdP
	E
X-Gm-Gg: ASbGnctdhQ6X4hrRosELgi34RXwus0GiqBgKCPutnB4a8P14Pvuaj4oknJvUSxeAbrO
	iLqeiV9sJpv5j4k2J+PdrEQ83m48Yjbc0fkeDzJfjzZRH+No+zWsbmDWMzJ8TVqfn8HLGLCJtVB
	b6qR0zl2gjl3Xd7Izu+bQIaT1BxlF77orqEZQ23/xJydSoCltWt5jn5HHrtZx2KvRun2zHbgnJ9
	jG2a5mLPbLJ8iENk/q9a28kF0qEP+qpy5mZGDM=
X-Google-Smtp-Source: AGHT+IHdO5THbgza4O+ISvg9Q2d8xzGBFg1l+e7wtN0FWH4Bjk8anopFV+iM+5aVDMsY4tg3x/sBhQ==
X-Received: by 2002:a17:902:d490:b0:212:4aec:f646 with SMTP id d9443c01a7336-215bd10fe24mr29489665ad.33.1733233058488;
        Tue, 03 Dec 2024 05:37:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/16] tzdata&tzcode-native: upgrade 2024a -> 2024b
Date: Tue,  3 Dec 2024 05:37:10 -0800
Message-Id: <76fcb907f4db9ec64669d81e5e9c6baffac71973.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208195

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit c8d3edb2562ea4d980186e78b4abb5a94b1d7b22)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/gdatetime-test-fail-0001.patch   | 72 +++++++++++++++++++
 .../glib-2.0/gdatetime-test-fail-0002.patch   | 65 +++++++++++++++++
 .../glib-2.0/gdatetime-test-fail-0003.patch   | 63 ++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  3 +
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 5 files changed, 206 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch
new file mode 100644
index 0000000000..1997f88f12
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch
@@ -0,0 +1,72 @@
+From 39af934b11ec7bb8f943ba963919816266a3316e Mon Sep 17 00:00:00 2001
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
+index 141263b66..cfe00906d 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2625,6 +2625,7 @@ test_posix_parse (void)
+ {
+   GTimeZone *tz;
+   GDateTime *gdt1, *gdt2;
++  gint i1, i2;
+ 
+   /* Check that an unknown zone name falls back to UTC. */
+   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
+@@ -2648,16 +2649,25 @@ test_posix_parse (void)
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch
new file mode 100644
index 0000000000..b3d11b5076
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch
@@ -0,0 +1,65 @@
+From 27eb6eb01d5752c201dd2ec02f656463d12ebee0 Mon Sep 17 00:00:00 2001
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
+index cfe00906d..22aa5112a 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2649,19 +2649,16 @@ test_posix_parse (void)
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
+@@ -2669,6 +2666,8 @@ test_posix_parse (void)
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch
new file mode 100644
index 0000000000..b9afad15c5
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch
@@ -0,0 +1,63 @@
+From 9dd5e9f49620f13a3eaf2b862b7aa3c680953f01 Mon Sep 17 00:00:00 2001
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
+index 22aa5112a..4e963b171 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2626,6 +2626,7 @@ test_posix_parse (void)
+   GTimeZone *tz;
+   GDateTime *gdt1, *gdt2;
+   gint i1, i2;
++  const char *expect_id;
+ 
+   /* Check that an unknown zone name falls back to UTC. */
+   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
+@@ -2648,11 +2649,25 @@ test_posix_parse (void)
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 506e72bd4c..ce7c57df9a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -18,6 +18,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://memory-monitor.patch \
            file://skip-timeout.patch \
            file://CVE-2024-52533.patch \
+           file://gdatetime-test-fail-0001.patch \
+           file://gdatetime-test-fail-0002.patch \
+           file://gdatetime-test-fail-0003.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4734adcc08..adf095280f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024a"
+PV = "2024b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
-SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
+SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
+SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.34.1


