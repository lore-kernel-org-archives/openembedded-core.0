Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C089C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:35 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.18576.1752074366733455559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m4y03CEO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23c8f179e1bso379695ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074366; x=1752679166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdBzgWbisVkh6H5X/hWSlf3yKJGXEWhQ/5M6ADGdXpc=;
        b=m4y03CEOlEfZrQD8enplP6WmTG2k9Ua81R+3hPXGNBI3upvaY/zrV9seM8Q2cJOJli
         Q1tc0FatKXq36GPMUCcvb8JWY9a9H3zJ1tIxwl5OI2kZwGmuq4I4odPywA5xpbe1D6vI
         h2n2YqedgCmhP/khcRrxg2wqLXfQ171xr3sziA561jX/vTgUmHd9NjVasgDHwtY7v2cb
         m5S8i7MAh7sXdB0vCyMuGSOxdgUuyRkUvdZliCMh4KbGB0NGBXRTZ1iiBsLhLwHp+nd+
         L9Sr9D2+lMk+jjx2ETfGxeiofgrMIwK2mYzZpd6j0MI/01erDGbWgvaY9UPxX8ope65Y
         rsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074366; x=1752679166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdBzgWbisVkh6H5X/hWSlf3yKJGXEWhQ/5M6ADGdXpc=;
        b=OLBz0Atu/hDhBweWOcJBcl7McVESoZ5S/q9ieeeTugyzoWt4p1LOMrpnoJ6jlvMTG3
         Op7jTR7JITTEJGKFsIiJe8QTO+lpvgH/r9m9thS37EiyMkwXIUXxQU1PR27sq/Ul4sB+
         MwFC0d5DQ1fFbn2+eIdAD1gjp49jxutGxs2WQ/u5UYCaHfc05XWHhmZ2rVEccHQjjwUH
         AB0R33Vo5hT10KB2aL8XaunYUodWnfPNNlvfOrj/0UVSlBA3/G+OfoupJ6p2sEhEEWK/
         rdP3KXiuD5psgqYeKNSKGgA7bOThUXz0n8z4rhZHMh/l2gJRXGih5Je0xNWjUU92UpXN
         yXeQ==
X-Gm-Message-State: AOJu0YzIGc+9hQiZ+FdWkhRhqJrUvtmq7wQbWaLuj8ndEF9N6OzQhzlc
	RerJw+aiVL5zCi3983FpJ9h1sx3Ab5pEoNbY1+/tmu6FcfVGmlb+eIWSn28unuEcYZqGfxTReLE
	uN9Kv
X-Gm-Gg: ASbGnctXG0aXNcWXCt4nrmAYdP8bnV/TGQKM4hzNyKMIjeYk/GzrS5tc6Gz8dNStkp8
	3gdF8lflYvpatE2CmwCwrgtWmLBwAx263U1RlPq4E1Z7/tjhUzqfmMI/rEYs/pKYSfrBH4fVhxg
	udHydIP8H0L5BqPbclnEG7dVs1uWZpJOrdCZYKkXJJPUGf3blhTpLF7cBPTWUqEB7CNQ6PXnwG6
	KCx/weiaYHChoVp8tnMc9G3gHcqSYBaFp6nW08Id2MuJVNkxMdtf3bwGXaeaDf3yWKbuW2skeV6
	IDlXXR+9+uH32MIrrcIGwsTGaL+8tfnPrq50l6ozlGW5zPOGycFxQtPaLaNMKpx1
X-Google-Smtp-Source: AGHT+IH5QXtrEcmqkp1q+PRSZW4qNK3o/fUEjX9oCu4gwSdlLSknly5aSMYo338qwQUYeiemchmCtA==
X-Received: by 2002:a17:903:2f87:b0:235:e96b:191c with SMTP id d9443c01a7336-23ddb34fa56mr53711705ad.29.1752074365914;
        Wed, 09 Jul 2025 08:19:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/11] libsoup-2.4: fix CVE-2025-4945
Date: Wed,  9 Jul 2025 08:19:07 -0700
Message-ID: <2169742d4b88f9072501819b5842efbed04939f2.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220095

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   1 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 686e3b6720..0cc90a17cc 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4476.patch \
+           file://CVE-2025-4945.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


