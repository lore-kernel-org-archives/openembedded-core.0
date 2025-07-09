Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FECC83F14
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:35 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.18420.1752074368511981922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fjaoP7S3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b3226307787so80945a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074368; x=1752679168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S91+qJ9k35eHnFbbsDEBi2PJfod2PESeNTle5wkmViM=;
        b=fjaoP7S3jMzfHFjaOy+cyo05gievLxyv96e+Swb+qoDyTIPq5puKI8AVje9pFP30lq
         ouU3RA7UrA9Ug/JXY3oXnWFUWL/opChvBtEoetF6M58qW2fleDtHMO1rR3/s5uOTwsXa
         ofvTBQIOJFCijwJ7eqW8vUjai+pJiPTgWBevCTU3ePSf8EMSTkL/xI1akSrRhLb7pvxk
         746ZWRMoBgSAQQ7oiyQTAm/XP/Cfx2ZLZUb4SssMk2HAc1cOIydpqyhgxakweLLZlkew
         zMVLqWWl3cPhIHexTSbwiJ2ryPvLIxm7oxpUiZZALu5UGs5Yu4an/Covr95mItfGvuI7
         cakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074368; x=1752679168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S91+qJ9k35eHnFbbsDEBi2PJfod2PESeNTle5wkmViM=;
        b=QhiAjP7pXRDf+HPclGWBpcIf3Ths7QlTS6Gg6JnluewJ1RVrQ/ZCKqNH5MN2CkbzXq
         YunhjPX1LRJibm+W8WuA6/7Rwr+r1dH6caJFdqW3uxWJ1IzjYRugIUy6KnwIyW8dwq8A
         QVa8N46fxV+iZ7UmwIl4w2w2o5j/GlRKA+OUFq+KKOaVDUxUkaGjzcUEVdDhrH1bH8sg
         HyBnZ/v1NF/PgeIZhLypcjr0nYr7qzHrbME/6U65CExhutvUAaOQI5l7awSSS3jJKw4O
         4YmCjO6yG+mr5QmVyazmPZy85vOVVYIFattCqfbdubNt1PhGjB5ZMNQN+/6puIPOb2Aa
         BYKA==
X-Gm-Message-State: AOJu0Yw8beUID8InFeC9WyVQSziYHTI5F0n7YZcvxOK308gsh7QxZdfC
	a6be8nCR9RCADfqPM56QrPXck2S1qKGjsiV//ied8VkiLEgWP82AsurPnAmPsrRxa2w+Q4icqxI
	aue7a
X-Gm-Gg: ASbGncu4AwXgzOgj1vEdsvGPlkyMPD+nsaUUqyu/Uc3LN1mLx32hwunK7RdFLqHN5xH
	ND7viufkZBq1nPB08WO5dtrlhWMgna0vTYQ6xq85ersyuOljVK1FgWA354S9qyI2cgr1qTYA4qI
	tkVS77VuTnN7Ll+Bd0ARyui+9lkAtSpwXOeZhP3ggywaPkqCPpzODUwFECK83aBN3cTznK2MI4i
	onNz51nZcpD94icnhaSM7BvOeax+K7k62Izd0WtDKoXTvoR/hT3G8YJYEO6k8C+ZGyVaHY9T7wE
	KRVS6GfWiTi1lzYLQ3WXWgLrUyBhI0sDnUoudTpi02XlnLb86UQERg==
X-Google-Smtp-Source: AGHT+IH01DieBrwY5lm82YoNMkMae5kRWaSxq7Iwonv54XgqU5hIHRlSXlMRp4vUyn03J8JOaEbYMQ==
X-Received: by 2002:a17:90b:4a4c:b0:311:d670:a10d with SMTP id 98e67ed59e1d1-31c2fe21d62mr4468845a91.26.1752074367452;
        Wed, 09 Jul 2025 08:19:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/11] libsoup: fix CVE-2025-4945
Date: Wed,  9 Jul 2025 08:19:08 -0700
Message-ID: <cd589717c05b887986b9d61f5193e764f4deb3ee.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220096

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4945.patch       | 118 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch
new file mode 100644
index 0000000000..cb6640a6c6
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch
@@ -0,0 +1,118 @@
+From ee76a57af0e9fe1e43d3ab5a146a3da233573819 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 07:59:14 +0200
+Subject: [PATCH] soup-date-utils: Add value checks for date/time parsing
+
+Reject date/time when it does not represent a valid value.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/448
+
+CVE: CVE-2025-4945
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/8988379984e33dcc7d3aa58551db13e48755959f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-date-utils.c | 23 +++++++++++++++--------
+ tests/cookies-test.c      | 10 ++++++++++
+ 2 files changed, 25 insertions(+), 8 deletions(-)
+
+diff --git a/libsoup/soup-date-utils.c b/libsoup/soup-date-utils.c
+index 061057e..43616d6 100644
+--- a/libsoup/soup-date-utils.c
++++ b/libsoup/soup-date-utils.c
+@@ -138,7 +138,7 @@ parse_day (int *day, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return *day >= 1 && *day <= 31;
+ }
+ 
+ static inline gboolean
+@@ -178,7 +178,7 @@ parse_year (int *year, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return *year > 0 && *year < 9999;
+ }
+ 
+ static inline gboolean
+@@ -202,7 +202,7 @@ parse_time (int *hour, int *minute, int *second, const char **date_string)
+ 	while (*p == ' ')
+ 		p++;
+ 	*date_string = p;
+-	return TRUE;
++	return *hour >= 0 && *hour < 24 && *minute >= 0 && *minute < 60 && *second >= 0 && *second < 60;
+ }
+ 
+ static inline gboolean
+@@ -218,9 +218,14 @@ parse_timezone (GTimeZone **timezone, const char **date_string)
+ 		gulong val;
+ 		int sign = (**date_string == '+') ? 1 : -1;
+ 		val = strtoul (*date_string + 1, (char **)date_string, 10);
+-		if (**date_string == ':')
+-			val = 60 * val + strtoul (*date_string + 1, (char **)date_string, 10);
+-		else
++		if (val > 9999)
++			return FALSE;
++		if (**date_string == ':') {
++			gulong val2 = strtoul (*date_string + 1, (char **)date_string, 10);
++			if (val > 99 || val2 > 99)
++				return FALSE;
++			val = 60 * val + val2;
++		} else
+ 			val =  60 * (val / 100) + (val % 100);
+ 		offset_minutes = sign * val;
+                 utc = (sign == -1) && !val;
+@@ -273,7 +278,8 @@ parse_textual_date (const char *date_string)
+ 		if (!parse_month (&month, &date_string) ||
+ 		    !parse_day (&day, &date_string) ||
+ 		    !parse_time (&hour, &minute, &second, &date_string) ||
+-		    !parse_year (&year, &date_string))
++		    !parse_year (&year, &date_string) ||
++		    !g_date_valid_dmy (day, month, year))
+ 			return NULL;
+ 
+ 		/* There shouldn't be a timezone, but check anyway */
+@@ -285,7 +291,8 @@ parse_textual_date (const char *date_string)
+ 		if (!parse_day (&day, &date_string) ||
+ 		    !parse_month (&month, &date_string) ||
+ 		    !parse_year (&year, &date_string) ||
+-		    !parse_time (&hour, &minute, &second, &date_string))
++		    !parse_time (&hour, &minute, &second, &date_string) ||
++		    !g_date_valid_dmy (day, month, year))
+ 			return NULL;
+ 
+ 		/* This time there *should* be a timezone, but we
+diff --git a/tests/cookies-test.c b/tests/cookies-test.c
+index 1c04534..6ba4458 100644
+--- a/tests/cookies-test.c
++++ b/tests/cookies-test.c
+@@ -419,6 +419,15 @@ do_remove_feature_test (void)
+ 	g_uri_unref (uri);
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
+@@ -440,6 +449,7 @@ main (int argc, char **argv)
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 3ddcb3e568..af8554aa78 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -44,6 +44,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32051-2.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-4945.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


