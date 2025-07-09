Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53537C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:51 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5569.1752029501204638758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OKRYZHbp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23636167afeso50950965ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029500; x=1752634300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qnu1ASSsskY1dpCUwsXGvrauLOXQpsDPxW6pTR10w+Y=;
        b=OKRYZHbpDeSgp2M5EFJBFjpTPMkARPc/Ij4UYBnCTUHaf+Gkhc2ffjGDT8GNrIkrp9
         Rq769mT4WPJ8Ln/0YArjXvVxvzf5jFpbFW4TjioFuZa3gXRwt52dwBJvPh45sqQZyThk
         TDF9+kyYSsa+A9EhlUJWVGafBQUoZ52akdKlGNQBJvIYsK7jYnYnqvvpE+zywSXA3EOr
         ifoH1V7m4zaDHcptqGhfuE7Ar9Gcgrbyuk5wBcnCceDfl2wt7biii8r0wa610Grg5JZ/
         2o0W2Bqp3NJFrmZtblst7haCcqs8s6pU8mkZ++BV7voYuS2snQI/mhCrcKv0F0jCojvo
         WzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029500; x=1752634300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qnu1ASSsskY1dpCUwsXGvrauLOXQpsDPxW6pTR10w+Y=;
        b=qtdZxEJGVKLClpHw0bzP25BHs1AeeafGVyFmNnmSRXTVpmTjF7zD2of8oIiqapVthN
         HK2Hgmy5rPdyihWEKFP/EwHf6jC8BfNmA6XYfVctosk4PgsHL4d7erKaGzZJ3M6CGy5D
         RRm4dMFKx+nUfk812wYtd3yMC5i7ku4ngmJ8bWCjksPVC6T3k15so/ch599iTR6kKuxA
         V9xuaE2mMqveBk3uyXyodc9kslpSqosmLJsKUS/uzyl5XQND7ZqQX0PIBKlvEw/bvWyW
         QrBFY3AfPTuh+snkY9MiKxRPW+0PRA/thHzf7IcsvH86/4EgMAUbWwEJzEBrLJHKhzcE
         aR3Q==
X-Gm-Message-State: AOJu0Yxl++MYBxh9lkiTr/4zKekw0kI8DJThj5BPY2u1qeA3SquOmWG+
	xrcRV13Gpmu8sdP0a2G03OC6wtNIJcwp9uJ5/4USjaTvhY+ZtprugzId1aoBP5IupH8sJ3atWML
	2zejN
X-Gm-Gg: ASbGncsTbY1Z2Sqfo9dqh8TimXfazhH3fbveIWf+9KGokEgy/LgjhoCjzpayx7k3E/y
	NXQdVZZejXG+SWwGM8/woVmSNz4Bf2C66O32D8+GnmBZFzg1F1rhDkuYPVjo9ioGmkEkUIjl0N3
	VTw+/EomQ/S/EaNdp09sPZJb0gwvDfjrfjlFs/wB+CD8cGOa2YO375jyysxJJhzvVy7KIGnt/99
	mP588vHaE5NBN31Uif0fE0rac+l58fDlJKpAhG5iC3ipAaWMB+3mXDJpfyTBerdZR1O+rWx/bnH
	z9PtbO977+XL/rXnl1m7ETRNJAlS4kl3x4nNd5LECKTqOVSNsQMpWQ==
X-Google-Smtp-Source: AGHT+IGJTcuxC63p4ZiiAzx6RSdxNmRxgaDs6mESdANMg16ncWIPlIY0o9e6xk58mg+LSjZ9K/pmRQ==
X-Received: by 2002:a17:902:e88a:b0:234:9375:e081 with SMTP id d9443c01a7336-23ddb305b33mr13750815ad.42.1752029500396;
        Tue, 08 Jul 2025 19:51:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/12] libsoup: fix CVE-2025-4945
Date: Tue,  8 Jul 2025 19:51:17 -0700
Message-ID: <6455484a26edc69be806c1356314c018d1940294.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220063

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-4945.patch | 118 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4945.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4945.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4945.patch
new file mode 100644
index 0000000000..cf34dcd231
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4945.patch
@@ -0,0 +1,118 @@
+From f168bc7d6dbf04915cd7bf6bfe962bd23f63ec3b Mon Sep 17 00:00:00 2001
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
+index cafa26e..ccf7a4c 100644
+--- a/tests/cookies-test.c
++++ b/tests/cookies-test.c
+@@ -434,6 +434,15 @@ do_cookies_parsing_nopath_nullorigin (void)
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
+@@ -655,6 +664,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/cookies/accept-policy-subdomains", do_cookies_subdomain_policy_test);
+ 	g_test_add_func ("/cookies/parsing", do_cookies_parsing_test);
+ 	g_test_add_func ("/cookies/parsing/no-path-null-origin", do_cookies_parsing_nopath_nullorigin);
++	g_test_add_func ("/cookies/parsing/int32-overflow", do_cookies_parsing_int32_overflow);
+ 	g_test_add_func ("/cookies/parsing/equal-nullpath", do_cookies_equal_nullpath);
+ 	g_test_add_func ("/cookies/parsing/control-characters", do_cookies_parsing_control_characters);
+ 	g_test_add_func ("/cookies/get-cookies/empty-host", do_get_cookies_empty_host_test);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 37319f007f..f64d0d6745 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -44,6 +44,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-2784.patch \
+           file://CVE-2025-4945.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


