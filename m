Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601C0C83F21
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:23 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.82432.1752510202706656046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RkJkeObx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso2556878b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510202; x=1753115002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh0wuGI5NUKKrmrAzPmbZozhlrWw5uNX3w8kAvL4rzA=;
        b=RkJkeObxESZtGFKCYjFuzjAZEqMR+2SSwGQLrYjXAiheaxsmjQ0K663q4m6HRsCMWs
         AeM1/9oXdxKagjg3bFwLScCrXiMBH8GLIYMZjl03wEjk5/4gyuN8fME2qQP5n28AJLxJ
         2svgikJBHh5CHxjV0GI/hDMI5Xda75YtYT/f8B71P73K5shKTOefH4FJHlxquEbDqC6k
         6cYCVJYjOTJ2duicpIUAldz4CK1w8psGAS2I0teI6LS+f8QaV8n1eLaFdtpx3qSZ982F
         4QAyBiKPjsueVejaEg50M4WHx90M63owa9NAdQkARln3x5O4tyKlXbGhkAb8GNvtI8X+
         Sh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510202; x=1753115002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh0wuGI5NUKKrmrAzPmbZozhlrWw5uNX3w8kAvL4rzA=;
        b=Sxwy3gBT2NOPRTiAR1k7PoVLGFSEty++mDR4Saylc5mVLDOg0NyUk5GCE0aE1ufGXx
         yz7wfECdw88qcCLpt4y1OHM4THVuwH+jkxrx+To1GBokYP0mnT4FGA6RnHHaeZ5/E+kp
         /uIZa/3pNWH7tubaEYfO49rQd+vyM/3SLds2WbMPKqMyIOKuy/TjcdwPrUdGYZ1sVKBO
         NzJDsA3QXwGRL42+ialdOmwkxCZWF99pm/Kpgl0Kzyz9f3kmgRgw9PeVFUciWs32D/pV
         YCydUyVsr/ngQ7EHXk/205uNIVzzSCRp7pxiTucxrpyxGOoQBdAIc+8dCxzZa63Zx+MO
         YxkQ==
X-Gm-Message-State: AOJu0YwsRMuq8U/CVxDJFcsqO2NkmsBra3ekC7k8ioBiUm+T3kv6Ufmx
	pNG2SB7eA8WEj73TeshWSKaKvtFvajGtFEfN49df8Klknrfp6diaGXljGtYzckiMHRhyeZNlkch
	/RYOt
X-Gm-Gg: ASbGnct4eHbLLFUI+cZi5sqR4HNR08GGwZAOzUwBwAfN/uoJ75xR//SX30hPPWO+gTC
	CHXUJNQf9AGKd3V9FkHv0uM7hWxLRX7YPC02kHZUBIFyQSh+L+NZFU6uEkdA1wXu8fY01eRKyFP
	6aS0/7l6Dl1z2CtJ8jLGLhcrKTW9AVJc/YoQ37vRehuWdoobdip9c+VqVG5UqgFTe43lb5TCTTX
	pVvCMXuAveTnj2QQRvT/XKJSaLKv+JXO2ODjiCIkp9naZL7xZJoMlJVhXf2pZHTi0IrJLc0wnrr
	StdMwtEWbRYvcMPLmU3TE8j+bl+KQsemz0MaXFv+5mPYG/QTO4EvLR6wIve0ep0js66cHRsVPnR
	mi0jAZwaS0fyR
X-Google-Smtp-Source: AGHT+IHdH84RkhcSczd4+fF/3EEf5W+gihgPyT2dAW2ElCNw4fbpc3cWcQ9SBw+gJkDTbjlvVaGrdw==
X-Received: by 2002:a05:6a00:a94:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74ee07b6f50mr23336907b3a.8.1752510201677;
        Mon, 14 Jul 2025 09:23:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/15] libsoup: fix CVE-2025-4945
Date: Mon, 14 Jul 2025 09:22:58 -0700
Message-ID: <db607024fdf95a03d7e08d728a6fdb6537835eee.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220242

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4945.patch       | 118 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch
new file mode 100644
index 0000000000..22a8908f23
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch
@@ -0,0 +1,118 @@
+From f0ee9d522f302d7d199e3e61fa8cd45eae7b248f Mon Sep 17 00:00:00 2001
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
+index fd785f5..34ca995 100644
+--- a/libsoup/soup-date-utils.c
++++ b/libsoup/soup-date-utils.c
+@@ -129,7 +129,7 @@ parse_day (int *day, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return *day >= 1 && *day <= 31;
+ }
+ 
+ static inline gboolean
+@@ -169,7 +169,7 @@ parse_year (int *year, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return *year > 0 && *year < 9999;
+ }
+ 
+ static inline gboolean
+@@ -193,7 +193,7 @@ parse_time (int *hour, int *minute, int *second, const char **date_string)
+ 	while (*p == ' ')
+ 		p++;
+ 	*date_string = p;
+-	return TRUE;
++	return *hour >= 0 && *hour < 24 && *minute >= 0 && *minute < 60 && *second >= 0 && *second < 60;
+ }
+ 
+ static inline gboolean
+@@ -209,9 +209,14 @@ parse_timezone (GTimeZone **timezone, const char **date_string)
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
+@@ -264,7 +269,8 @@ parse_textual_date (const char *date_string)
+ 		if (!parse_month (&month, &date_string) ||
+ 		    !parse_day (&day, &date_string) ||
+ 		    !parse_time (&hour, &minute, &second, &date_string) ||
+-		    !parse_year (&year, &date_string))
++		    !parse_year (&year, &date_string) ||
++		    !g_date_valid_dmy (day, month, year))
+ 			return NULL;
+ 
+ 		/* There shouldn't be a timezone, but check anyway */
+@@ -276,7 +282,8 @@ parse_textual_date (const char *date_string)
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
+index 1d2d456..ff809a4 100644
+--- a/tests/cookies-test.c
++++ b/tests/cookies-test.c
+@@ -460,6 +460,15 @@ do_cookies_parsing_max_age_long_overflow (void)
+ 	soup_cookie_free (cookie);
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
+ static void
+ do_cookies_equal_nullpath (void)
+ {
+@@ -718,6 +727,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/cookies/parsing/no-path-null-origin", do_cookies_parsing_nopath_nullorigin);
+ 	g_test_add_func ("/cookies/parsing/max-age-int32-overflow", do_cookies_parsing_max_age_int32_overflow);
+ 	g_test_add_func ("/cookies/parsing/max-age-long-overflow", do_cookies_parsing_max_age_long_overflow);
++	g_test_add_func ("/cookies/parsing/int32-overflow", do_cookies_parsing_int32_overflow);
+ 	g_test_add_func ("/cookies/parsing/equal-nullpath", do_cookies_equal_nullpath);
+ 	g_test_add_func ("/cookies/parsing/control-characters", do_cookies_parsing_control_characters);
+         g_test_add_func ("/cookies/parsing/name-value-max-size", do_cookies_parsing_name_value_max_size);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index 457a30ec70..acd84af934 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32908-2.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4969.patch \
+           file://CVE-2025-4945.patch \
 "
 SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
-- 
2.43.0


