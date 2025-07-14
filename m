Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBEEC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:23 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.82431.1752510201249475881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j0ZNCN7k;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4911533b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510200; x=1753115000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQbmPdvBRqXN9+dBXmz6xYn3xuMOZfqd0aZnbJDpvAE=;
        b=j0ZNCN7k1lKhpP0nPCdAHz2n1AE6ywiTZcZuXwiCVg+wYTxjev5JH9qPRVx0NAPTc/
         H8AfZwAZVqzdEaMSKnhNOAc9Cv3+ULuy/4i5RJzNLihM5U1AxEQtR03UqMqoo1zLyIil
         XnPGR+PIY7Mrou+oquq15ywfG01K9DM6pZ4RIvlhS6bUjqCj5Ud7mgn6sL/YNS47MrXu
         uFrl/S6TXb/qnlDjtJkrtgVWUrW8biE/vdq5c+2xKlRRnZFJa/tN4U/s2ofHopaL97QK
         UzqR+zeaztLXcLwdr7O1M8VNJS3lc1euQilVXHXiDGCk4ISrUWxrCU1cwvE2j3b6l4+b
         K+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510200; x=1753115000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQbmPdvBRqXN9+dBXmz6xYn3xuMOZfqd0aZnbJDpvAE=;
        b=MgiLyiNNxd+9V06gIrs58j1RKh5qZDfJHOr7HIPQE686m58sAlJ6t3z/BuuTI7OvOd
         lg7bAM1JjvBmf9YDKKeo4nTjRxjovC2kTgqiicCyia150FsZ3+L6C+Vb0L35cwUhrHNp
         Fqkx7sRyHjjJkt1eSD/kNMJ4HizK4f4MPSlLhSRS/nD94WrpfiXWydiL8KNkrCNkZp1F
         X8n8YhSN3zQHDXLLS3g4h88zE9vskEmJLAAERhDjgvr+fHwTqb+RCpNGor8b9xWitXEZ
         6GJQ3y/wZaeuncUjXd+cspt/ygC4vwdnSveM4Wmq+ZjwAMqgz8UUinqvdNbgUL9SPEKf
         0IrA==
X-Gm-Message-State: AOJu0YxtAQi+SlajgABy7d79TEwHYHM7QzEESR+V/cL7OQ2sC8+K54qB
	RhQy0SST6GxdRKEpgI6SOlOOZEmJB4tMtiER+47y4G4aTQyh5PdZGrxhYVmo1r7SeauXjk7H0p0
	N8fLN
X-Gm-Gg: ASbGncsO3k+9yZBHdsQd2zZvmJ/B0WHT75CXjLAUPhsNyPC7DRpl8ZVXB9pUWkSxxBy
	6SCOQ5SqfAo2znK7J8cZIRKrmjjkF2OH6PDPt0VPWxLOz7Gtm5ZZqh0V0/NV4PcnKz86hHZsnFa
	OHqFZSsze0J6SkWEPDzwSyfrw46gr3uIEpW3GZtTOF6A6ZEpy/OpscDJI86E6p9ivbi+iV2eqC6
	zSgWwT/LJYoIrwakEObD+R6mcP8m7RaV3ULKfyGiqh3n30/lbzefhPVxM59tyYrWbW5OXsceDlK
	efAknC4YHdIX6Qmp49BhaAJFllx3RLMLtOVkWSyIZSWmtRPRQ6L+rBm7c4vem2n5Ex6OAjytqQa
	vlfDKnWVouNsc
X-Google-Smtp-Source: AGHT+IEaYl42rN1Iu4f7IKHaDEb56UzIAK3tx7kYEdKVmB5DlvyNIkN6YMIn1J0FkTJdf33vnp9CTQ==
X-Received: by 2002:a05:6a00:3c8e:b0:748:3385:a4a with SMTP id d2e1a72fcca58-74ee3531e63mr17483613b3a.23.1752510200316;
        Mon, 14 Jul 2025 09:23:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/15] libsoup-2.4: fix CVE-2025-4945
Date: Mon, 14 Jul 2025 09:22:57 -0700
Message-ID: <5d0cab3103f336d741e07ff4a2439450846f7273.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220241

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
index e005e7200e..47f7ba385c 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32907.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4969.patch \
+           file://CVE-2025-4945.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


