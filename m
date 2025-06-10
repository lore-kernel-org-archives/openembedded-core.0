Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D42C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:08:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.90687.1749571737091996933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d+be/xwX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235ef62066eso70544995ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571736; x=1750176536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ln+utEX2UNEWOKr0xeBEzt5t+MiFm/DslC0aZBEhos=;
        b=d+be/xwXVuKK/9PCUS7abtIcSN9JA/4vxaemn5Xwvn8ZmQ7nzBMpAivQDAydaW2pvM
         ABiAvAuAgh/Eh15+7RYk1CLrrYemp9GRiiBI5kFVOuajKiAnSBANq86IUVnDQ3a5QFAE
         iUPP2BPZbIC3i/fKmMIpRlmjJp/58Psrp9pL8Zr860HGlXAdp7yj6oX60symh7Kfiw+O
         7TycZmTErWStyeQEebyUAn30xpczU61VXJsAbNEzjuRs2isP4IbnAgMxOw5tfHWowrgE
         ifGJlBZDSMDju2Ycw5LqlcDGfGGV2hd/5Qsf1wsOKd2EHglBxM/6P+aneb6Up9uuvhIU
         kScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571736; x=1750176536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ln+utEX2UNEWOKr0xeBEzt5t+MiFm/DslC0aZBEhos=;
        b=MLw9xIL6qUOxp3VZ7ZuhavGeQV9ApAQozJNapdQG0hTdFPbIFhVFKu/FzW1sM4T/kl
         SF9DUFT9oieepbzwW3xfazKq4n/nnEOTD3PsYzqv+AZqMEhpkbGjP9sdFD5K+VkvV9cy
         D3310TEgIPQEeOiBqOPQRkcJ2+qfvnYAg9zQ6mpqgQd5FyCSR711ieaS6f0vkNtQhpDM
         jTA3O28GpK5Sq2DwtTfSiXg4h0bVJ78h86wLQIgNz9Le+WK9Q9fN/pOPoayl6rm2MTt8
         cWHMXsJ58yDSXIoQTqMvlGvkNcCcDI31ntk2U/z0KFm4RawBkhPWyoLcu06eYLd5MuTo
         Tkcg==
X-Gm-Message-State: AOJu0Yw687w9Mvd/Xs4IB+cqplpLA8z0G2z+GbmP3vdpeK4tJIoWqpaT
	k4l4EPhlc7rFa5T2hdTiYzndN6dSHDdEn+kPGTPGDxkM/TBj1bZ2t+ajRIMe29iI745hHTAFbJM
	NyLhe
X-Gm-Gg: ASbGncvI7cDWrp/HYhuyV4xz/Y+ZyhD+yzJEmnuWG2DgCYhKedezEis8+uCEun+My3+
	7IlLNK/sz5elXbo1nHK8ztu2uWW9cP4qTZ75GFUotwgYqkxah4a+aANdsIHmhsWF2wUQxS04aSp
	TDmsUCszkYQyNO1x7syu/dMlsrHW9lWggRyqritcM9x1zCxUzqBjTn+OVTrAEZNtOYEDRrLXW5j
	NTXBXVWzDYwnQXH/0RJpFSAspQRYm32SFU/NINiC1BLw45Xl17sQ6I0wgPANtAclar3G0s+IX+y
	pBVOr23bzVZDds8Agov/fjJtgdhMyO7ioEoT4Ai2OINbrn9Hjsg2aQ==
X-Google-Smtp-Source: AGHT+IH8fVBTVhy68HfX3AYwpHnLEqO6kuZJI2c/qOQ3N3f7HQNrYVQn8u6Lc8tYAO8HRaZdlnvvEw==
X-Received: by 2002:a17:903:2990:b0:234:ed31:fcae with SMTP id d9443c01a7336-23640cb7821mr6222525ad.22.1749571736169;
        Tue, 10 Jun 2025 09:08:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.08.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:08:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/32] libsoup-2.4: fix CVE-2024-52530
Date: Tue, 10 Jun 2025 09:08:17 -0700
Message-ID: <5fb04759fcc5b74ea7c2c47fbd1971755a6acb55.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218373

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/377

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
new file mode 100644
index 0000000000..04713850e1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
@@ -0,0 +1,150 @@
+From 4a2bb98e03d79146c729dca52c8d6edc635218ff Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 8 Jul 2024 12:33:15 -0500
+Subject: [PATCH] headers: Strictly don't allow NUL bytes
+
+In the past (2015) this was allowed for some problematic sites. However Chromium also does not allow NUL bytes in either header names or values these days. So this should no longer be a problem.
+
+CVE: CVE-2024-52530
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/402/diffs?commit_id=04df03bc092ac20607f3e150936624d4f536e68b]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c      | 15 +++------
+ tests/header-parsing-test.c | 62 +++++++++++++++++--------------------
+ 2 files changed, 32 insertions(+), 45 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index eec28ad..e5d3c03 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -50,13 +50,14 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 	 * ignorable trailing whitespace.
+ 	 */
+ 
++	/* No '\0's are allowed */
++	if (memchr (str, '\0', len))
++		return FALSE;
++
+ 	/* Skip over the Request-Line / Status-Line */
+ 	headers_start = memchr (str, '\n', len);
+ 	if (!headers_start)
+ 		return FALSE;
+-	/* No '\0's in the Request-Line / Status-Line */
+-	if (memchr (str, '\0', headers_start - str))
+-		return FALSE;
+ 
+ 	/* We work on a copy of the headers, which we can write '\0's
+ 	 * into, so that we don't have to individually g_strndup and
+@@ -68,14 +69,6 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 	headers_copy[copy_len] = '\0';
+ 	value_end = headers_copy;
+ 
+-	/* There shouldn't be any '\0's in the headers already, but
+-	 * this is the web we're talking about.
+-	 */
+-	while ((p = memchr (headers_copy, '\0', copy_len))) {
+-		memmove (p, p + 1, copy_len - (p - headers_copy));
+-		copy_len--;
+-	}
+-
+ 	while (*(value_end + 1)) {
+ 		name = value_end + 1;
+ 		name_end = strchr (name, ':');
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 752196e..c1d3b33 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -358,24 +358,6 @@ static struct RequestTest {
+ 	  }
+ 	},
+ 
+-	{ "NUL in header name", "760832",
+-	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
+-	  SOUP_STATUS_OK,
+-	  "GET", "/", SOUP_HTTP_1_1,
+-	  { { "Host", "example.com" },
+-	    { NULL }
+-	  }
+-	},
+-
+-	{ "NUL in header value", "760832",
+-	  "GET / HTTP/1.1\r\nHost: example\x00" "com\r\n", 35,
+-	  SOUP_STATUS_OK,
+-	  "GET", "/", SOUP_HTTP_1_1,
+-	  { { "Host", "examplecom" },
+-	    { NULL }
+-	  }
+-	},
+-
+ 	/************************/
+ 	/*** INVALID REQUESTS ***/
+ 	/************************/
+@@ -448,6 +430,21 @@ static struct RequestTest {
+ 	  SOUP_STATUS_EXPECTATION_FAILED,
+ 	  NULL, NULL, -1,
+ 	  { { NULL } }
++	},
++
++	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
++	{ "NUL in header name", NULL,
++	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } }
++	},
++
++	{ "NUL in header value", NULL,
++	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
++	  SOUP_STATUS_BAD_REQUEST,
++           NULL, NULL, -1,
++	  { { NULL } }
+ 	}
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+@@ -620,22 +617,6 @@ static struct ResponseTest {
+ 	    { NULL } }
+ 	},
+ 
+-	{ "NUL in header name", "760832",
+-	  "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
+-	  SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
+-	  { { "Foo", "bar" },
+-	    { NULL }
+-	  }
+-	},
+-
+-	{ "NUL in header value", "760832",
+-	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
+-	  SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
+-	  { { "Foo", "bar" },
+-	    { NULL }
+-	  }
+-	},
+-
+ 	/********************************/
+ 	/*** VALID CONTINUE RESPONSES ***/
+ 	/********************************/
+@@ -768,6 +749,19 @@ static struct ResponseTest {
+ 	  { { NULL }
+ 	  }
+ 	},
++
++	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
++	{ "NUL in header name", NULL,
++	  "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
++	  -1, 0, NULL,
++	  { { NULL } }
++	},
++
++	{ "NUL in header value", "760832",
++	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
++	  -1, 0, NULL,
++	  { { NULL } }
++	},
+ };
+ static const int num_resptests = G_N_ELEMENTS (resptests);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index f66ea6105c..64383e1221 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52532-3.patch \
            file://CVE-2025-32053.patch \
            file://CVE-2025-2784.patch \
+           file://CVE-2024-52530.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


