Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359E9C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:57:46 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.79919.1746547063466090313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QeKWWQPe;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e4db05fe8so7520775ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1746547062; x=1747151862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=luMSY2MRzIdTTXrJ8ezpha2m3hRnuDNUisznFtbTT+0=;
        b=QeKWWQPeDyNKC4/JuuM84hDHImtJ88X7XBXXLO0fIkTCSqnxczbpaDQ4ZCVBdMR2rl
         9OO8T11RcbKit2yNtIDa6vMPJc5uhoZU2Y8OxsUuBRM+B+/8sEUdniPMjM/DF2EYW3HD
         swb7c/61H4Vj/MNvdZuFBShZG6uKA8nLXIqsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547062; x=1747151862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luMSY2MRzIdTTXrJ8ezpha2m3hRnuDNUisznFtbTT+0=;
        b=ujoZ1q92wWtbz3TdA1UGzCS2XQeEZFjCdSBQ2iCmf2CWhi9i2BX5jtjbhWjMqXfC8e
         JPg0/8Qayu9y6u/tZGF6CKYkv0X8nBKbh/sezxnlwMsyxMvWUOkAk8OgLn/odEPbI5Gb
         VAbNFpm9rphEcLEwDcM3wUYVeYoPvXlsw2hK6oKvy+W5x7nu/mZQz1duMTJAnEmDVoM8
         lneQU9qLlgN7Fopc46PGDy3KACA9QD6iuTYLfu1y95jyDoxAEL1BoAhGH0Cbo0UpDlbq
         5F9mc80yjTryin2jvC2WKDuTM04WYsM/Iw4k+orffcdN+xmh0iY/z3iyZ0c1lD/a8eMn
         DJ8w==
X-Gm-Message-State: AOJu0Yz88l032YP5I4s5c0ezt2TulFVXbhxfZ2OJjtg6l1xmyQ1Jeo7p
	6F6LfpXnO0IMTs2ccVViTCjOebTBtS02STAklYJwz0cj0JNjuNG7mHqVjas+npf7CAHaSHVi6Q/
	umZo=
X-Gm-Gg: ASbGncsgNYaxtdg/J9aPv/7S9L+Ld5oLHV02FrH0ULF9+qLn0IPzoEE1+qY10xt5H4Y
	f7L5z8l1WrtdPw/tnIBG4YTrutx4tEv1kD/mjv7xIS5GDbrceR3yX2xuCHzfCx86smS3UiUOSZA
	XAIAkIzn3/LInPieZL5cwyGHbmsKJy+WNUCiedMJmrRHdyVfpnscJ8Uxbq2LaXuivYQ9wqAk7ic
	i0AjVMq5tGDeWjJnAmlGj+jggLGVKoBjZP9Jl9mzx4KolRY9cSNByyL2hoNhsiyXdzr9Nz+Os0b
	ms43aKZD4mwqYYSPLiJuMqr/V6VqBdc37kkRl6keMESNrzbvh18=
X-Google-Smtp-Source: AGHT+IHL2sloteVZrA2fj1hcGyie/S3BEAn5kQW/4YuHYjfM95OupimVs5qQP7pogFc6qEKsJfkmMg==
X-Received: by 2002:a17:903:1a10:b0:224:1074:6393 with SMTP id d9443c01a7336-22e1eafeb7fmr177174485ad.43.1746547062353;
        Tue, 06 May 2025 08:57:42 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.214.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152204desm75502685ad.140.2025.05.06.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:57:41 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 1/5] libsoup-2.4: Fix CVE-2024-52530
Date: Tue,  6 May 2025 21:27:27 +0530
Message-Id: <20250506155731.677168-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216068

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092ac20607f3e150936624d4f536e68b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 149 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   4 +-
 2 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
new file mode 100644
index 0000000000..bd62a748eb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
@@ -0,0 +1,149 @@
+From 04df03bc092ac20607f3e150936624d4f536e68b Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 8 Jul 2024 12:33:15 -0500
+Subject: [PATCH] headers: Strictly don't allow NUL bytes
+
+In the past (2015) this was allowed for some problematic sites. However Chromium also does not allow NUL bytes in either header names or values these days. So this should no longer be a problem.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092ac20607f3e150936624d4f536e68b]
+CVE: CVE-2024-52530
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c      | 15 +++------
+ tests/header-parsing-test.c | 62 +++++++++++++++++--------------------
+ 2 files changed, 32 insertions(+), 45 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index a0cf351ac..f30ee467a 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -51,13 +51,14 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
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
+@@ -69,14 +70,6 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
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
+index edf8eebb3..715c2c6f2 100644
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
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index ee20530b64..b833d2cfa9 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -12,7 +12,9 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch"
+           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
+           file://CVE-2024-52530.patch \
+          "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
-- 
2.25.1


