Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BFAE64025
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:41 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.10679.1732226072264388338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JT4Z8wor;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e52582cf8so1099135b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226071; x=1732830871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYM3t1AZz0Q/rWsT46gID8CxDHLNQO7IsgP4cTRdZO4=;
        b=JT4Z8worhvNkqhjTEh+/3W/Zs8hZVu2V+lnc5ixnKgigI44RoMtniNh6ECwmeHANbl
         ijV3PxpboKV4Oyu8FFv6nh2NNYiz0UqSFUsExAG+bb99h9DzKph7oHHhJOYGYiKMdREN
         hWRnAEj7LJzE1SG9aUvNxwaYccogkAdWwpjSPQAV6pz195IgVOGOCjmJ+S16DxS2xpPi
         XAA3DmXeUq0gJFoTWsDp+AmLz8sdpLmklH3Z0AStX2BkZxLWxQ8OnT56tP72iy/bWH0i
         mQ4cHeQQZCs2H87ENXBoLK/doN4fNQ0rLsunxI3cJTxhXwsbwUMWCUgcFkCARBvgWOVp
         TbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226071; x=1732830871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYM3t1AZz0Q/rWsT46gID8CxDHLNQO7IsgP4cTRdZO4=;
        b=D1RLvDcvq2KDkjjbZ5VyJknLGrqsoQ3UPPGmkcCYANeA4NsJ8XRAoWHw/r9Rqx+nMk
         cOhZhmoljI1W10E4DaPOL/7j1EO6hGCLmU9D7Mym6GA1J8l+jRdDazfytG7yABnxvMZq
         Izm4eH1cu6PzojJ84DWyn9zGFVHofJZ6B6+MVbetjGjmC8FLBn3VYGimxAatUXvNkPdG
         x6ddx6kJQKIlKUJdrXqzVeiuX4+37u8mi6WHmupYUeJQHlzvU1GfyBcpl5W8CsoPrS/N
         VcY11eQ+zfqhLL9e4cN5Imuabnz7mzvenUQwqFaIeBPsnhcW+/7rQ4gF9TLQrd1ysKUg
         Xc0g==
X-Gm-Message-State: AOJu0Yyfqez4XJ3RTv5cZIVL46NY82CLZnHr9hup1HKW2DN+rcYsK5pQ
	At8Jl9CJFob850rS9ceKki0GdpKKKKMl1oY8zxAbQ6KN7I2wiZkCvwtB/A0JPXXY0+v/B065exP
	P
X-Gm-Gg: ASbGncsbz94Zk/EzASFtW6Gy04Esu9F3WgX+ctlOEBrU84RljdHmzbW1AQoUI9rlVVA
	tbMRHtuMi3VSsx7VR/Wd8peVcifIO+Ec8EqIg5GQhDKDFnSLtn/OR/NOLqJoD0EnQUO03rbWp2c
	NQj9u54hX6Sq/ZmH2DzSXSznBf80nuJyhmsZFnoxPESNEu9Eos3RP9aTc9ZSQlDS/pxsxTd3QzP
	bFyQei/hnFK4QwNDq99slQZUV7GaouqpUfXjtQ=
X-Google-Smtp-Source: AGHT+IHOPKPA233B8B31ZEPpUIzMK8fWUjT4JtT2jX/8ak2YdyRlS9WXUfBDGofcTUfrNldCBWE2eQ==
X-Received: by 2002:aa7:88cb:0:b0:71d:f821:1981 with SMTP id d2e1a72fcca58-724df3c8232mr858434b3a.4.1732226071378;
        Thu, 21 Nov 2024 13:54:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/27] tzdata&tzcode-native: upgrade 2024a -> 2024b
Date: Thu, 21 Nov 2024 13:53:56 -0800
Message-Id: <def5ab1d73cc680b1c9a045894556c59f771f2f3.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207561

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


