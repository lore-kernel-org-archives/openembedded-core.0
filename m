Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517E8C83F12
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.5626.1752029499823529260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jTF98YA5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b391d6780d2so1819751a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029499; x=1752634299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENGpRpQ50q20j0pihOxl+6vpwF6kNRB50YTScI+LXdc=;
        b=jTF98YA5G8ERqCpqK6x+Rn1lh366LcFpZkFrVWoDaB2rmuIIoavlarzoEOXHgEdwSc
         YCiJoHRQnWF2i7ma2dWVpHl2Fec0bhTREDt5rgDTk8COLZ0atLBm7yCIPHCmlsZbc5+e
         E++ZSea5+47jPr7oVvlhetvrQtBwSbWNQDfZg39gf1COQkTRfyFW9flOAAB3FoAcLxae
         KzKsWUQdn8eu6VeyyVzjJgbYauAJDorIRwOZt7JDDr8UxvyTajCMnpQqD47zzA2IpGU/
         PUdgF9ImPE5cOTzgPDW2zGgK2CEaIfF6VvR780lxHonTMS3jZqWasIQiqoaXe8l6k6S3
         a5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029499; x=1752634299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENGpRpQ50q20j0pihOxl+6vpwF6kNRB50YTScI+LXdc=;
        b=dwL+GOcXE3W6rJUbUYPuLvPuwQ4RPyr78MZ6nUPM7LGgyfABiaFH7licSXUQasHQ8E
         9CKwJ3RiCTBcj12PSHVKnn1z1a1J+msEWvBtTTNVnSuooW5/vlElXyhR97rsVc0KhH/s
         iQSbWQ7ci0CIXKWPTQWGV7V4c6Aq9SE4+Tu5NPL1glxV2Ky0n37PnoQEcS0G14e9lgW5
         VZfHg8ioNBHE1lCezPSu85VdrN/YKnZ4iPJF7K5gsG9vQLNdVsMwSZPurH80upXbtW4I
         riknNBIxP3pW7vqlcK/Bc6XwpuQZPupCCtxtiZyjJyAvPpN9R4X4IkGLs1R54/4kYUZj
         /pxg==
X-Gm-Message-State: AOJu0Yz0F8p79q1k6kR7BPvzDlh6O5AaWGAsD5kQS8SCJTdflOrYiB2z
	aec0fKg4JTUQ7dPjCdm5NzPduIY8pDqXqHy7u80i0vUHwY0sxHdAK1P9V32+248pV0hpR1BTHDi
	1Ps9W
X-Gm-Gg: ASbGncv6IIOZiqPZPcZmWIellfU7zxnhFarZJpfZSiicBDR+IBU4rMdWLqjUza92f8P
	qBdzUlb3y5NuF5y9NXPLYYIsbadXJkew2eQqTnRpFLxxItd7Kk03yVXC+bzOsm3SUszM1WYD0tP
	OWV0S4lzivRo/X1SUK2a7+LRGEgpNCNXCpMv1pv78Tb14I7UTaOCWyI334JJkirOp+wze2vlg7u
	ruSpvF/FhunoUHsOHVAQBeFSuGRR92mC5vKhedlZlvTefzXuDgI2JlQsuhZATRgHXQY8J/ASjVU
	VId8E4CVwbu6ErSC5U+VsywDxkR4M9B3eWfgj9hzduZ4yD6k4K/j3g==
X-Google-Smtp-Source: AGHT+IEAmHrMYoJ94nVZ78KchGXltzvTl0YzRxMjf3AFV95I0dlX+EUmYpUoT0DqJSoVdzU7057PUw==
X-Received: by 2002:a17:903:41cb:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-23ddb2f2d05mr13869555ad.31.1752029498970;
        Tue, 08 Jul 2025 19:51:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/12] libsoup-2.4: fix CVE-2025-4945
Date: Tue,  8 Jul 2025 19:51:16 -0700
Message-ID: <92039926b164fae418eed988f6fa172c3554b9e7.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220062

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
new file mode 100644
index 0000000000..c9fbdbacc8
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
@@ -0,0 +1,117 @@
+From 3844026f74a41dd9ccab955899e005995293d246 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 8 Jul 2025 14:58:30 +0800
+Subject: [PATCH] soup-date-utils: Add value checks for date/time parsing
+
+Reject date/time when it does not represent a valid value.
+
+Closes #448
+
+CVE: CVE-2025-4945
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/8988379984e33dcc7d3aa58551db13e48755959f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-date.c  | 21 +++++++++++++++------
+ tests/cookies-test.c | 10 ++++++++++
+ 2 files changed, 25 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/soup-date.c b/libsoup/soup-date.c
+index 9602d1f..4c114c1 100644
+--- a/libsoup/soup-date.c
++++ b/libsoup/soup-date.c
+@@ -284,7 +284,7 @@ parse_day (SoupDate *date, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return date->day >= 1 && date->day <= 31;
+ }
+ 
+ static inline gboolean
+@@ -324,7 +324,7 @@ parse_year (SoupDate *date, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return date->year > 0 && date->year < 9999;
+ }
+ 
+ static inline gboolean
+@@ -348,7 +348,7 @@ parse_time (SoupDate *date, const char **date_string)
+ 	while (*p == ' ')
+ 		p++;
+ 	*date_string = p;
+-	return TRUE;
++	return  date->hour >= 0 && date->hour < 24 && date->minute >= 0 && date->minute < 60 && date->second >= 0 && date->second < 60;
+ }
+ 
+ static inline gboolean
+@@ -361,8 +361,15 @@ parse_timezone (SoupDate *date, const char **date_string)
+ 		gulong val;
+ 		int sign = (**date_string == '+') ? -1 : 1;
+ 		val = strtoul (*date_string + 1, (char **)date_string, 10);
++		if (val > 9999)
++			return FALSE;
+ 		if (**date_string == ':')
+-			val = 60 * val + strtoul (*date_string + 1, (char **)date_string, 10);
++		{
++			gulong val2 = strtoul (*date_string + 1, (char **)date_string, 10);
++			if (val > 99 || val2 > 99)
++				return FALSE;
++			val = 60 * val + val2;
++		}
+ 		else
+ 			val =  60 * (val / 100) + (val % 100);
+ 		date->offset = sign * val;
+@@ -407,7 +414,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
+ 		if (!parse_month (date, &date_string) ||
+ 		    !parse_day (date, &date_string) ||
+ 		    !parse_time (date, &date_string) ||
+-		    !parse_year (date, &date_string))
++		    !parse_year (date, &date_string) ||
++		    !g_date_valid_dmy(date->day, date->month, date->year))
+ 			return FALSE;
+ 
+ 		/* There shouldn't be a timezone, but check anyway */
+@@ -419,7 +427,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
+ 		if (!parse_day (date, &date_string) ||
+ 		    !parse_month (date, &date_string) ||
+ 		    !parse_year (date, &date_string) ||
+-		    !parse_time (date, &date_string))
++		    !parse_time (date, &date_string) ||
++		    !g_date_valid_dmy(date->day, date->month, date->year))
+ 			return FALSE;
+ 
+ 		/* This time there *should* be a timezone, but we
+diff --git a/tests/cookies-test.c b/tests/cookies-test.c
+index 2e2a54f..6035a86 100644
+--- a/tests/cookies-test.c
++++ b/tests/cookies-test.c
+@@ -413,6 +413,15 @@ do_remove_feature_test (void)
+ 	soup_uri_free (uri);
+ }
+ 
++static void
++do_cookies_parsing_int32_overflow (void)
++{
++	SoupCookie *cookie = soup_cookie_parse ("Age=1;expires=3Mar9    999:9:9+ 999999999-age=main=gne=", NULL);
++	g_assert_nonnull (cookie);
++	g_assert_null (soup_cookie_get_expires (cookie));
++	soup_cookie_free (cookie);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -434,6 +443,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/cookies/accept-policy-subdomains", do_cookies_subdomain_policy_test);
+ 	g_test_add_func ("/cookies/parsing", do_cookies_parsing_test);
+ 	g_test_add_func ("/cookies/parsing/no-path-null-origin", do_cookies_parsing_nopath_nullorigin);
++	g_test_add_func ("/cookies/parsing/int32-overflow", do_cookies_parsing_int32_overflow);
+ 	g_test_add_func ("/cookies/get-cookies/empty-host", do_get_cookies_empty_host_test);
+ 	g_test_add_func ("/cookies/remove-feature", do_remove_feature_test);
+ 	g_test_add_func ("/cookies/secure-cookies", do_cookies_strict_secure_test);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 0da309ebd8..7e00cd678a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -40,6 +40,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4476.patch \
            file://CVE-2025-2784.patch \
+           file://CVE-2025-4945.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


