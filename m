Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94A7C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:46:13 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.1978.1746805564799933483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t3pPkSXC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b12b984e791so1811596a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746805564; x=1747410364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKHa1Tin6Ao0OHFFPEW/BssJ318magWLBA3viX34GXw=;
        b=t3pPkSXCjE47PKH84/OE6g9ygDi5Dm8BR5tMG3A9zNENKHlWIpl6Qb17f6zzWE8U8J
         1zSzVAXrcfQhDEwOKD6uKeZI0DRPJUxwf0u3Ek9b0Gt16LGVXykcuKZp6cqsmOtvrNOQ
         8HDacAzC5mbekHWz6DOz1fASmXkk8DoMimAiF5LwCxc4akfZm+IAp0Q6VNNEjFddLl+G
         9hciC0AuX8wujQGe3ffeQH8gsm2YHngmKt1Q+1kYNoQCqOvx83rJiDUsxdigIoe9R5Wx
         t6v/GMw0aBUs73sn1vGEI5/5Olhgcn8Kgd7vpCR9fbStQlnlObBYxopRIzTO98UM32Tx
         kjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805564; x=1747410364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKHa1Tin6Ao0OHFFPEW/BssJ318magWLBA3viX34GXw=;
        b=fbUUykql+qV60HKlS/JtMafeJZI/yff16g/jZVeOJD2v4QshgfnJcMCr0QnB++JAIQ
         xWFud/8Bkx5A6GnEPtT05Hx5+TnFSrANKUMzNXNtd6h+VsRRDhOoe7X9mJiGT3GVxBHC
         +a7es+KyIlPed82qcbyJhBkSgaMJh5sq+w0m9CTCX8OL2H9m4TmWFmeHs/3lVPAgeabV
         vywHko6IScYv/AwfZ81vG2/Eki2YJ92Kw/oEBKD3YwiLEb7NskN5I+mCbY5beZ3HXMjs
         bz7tGAE92DRFYnPqAsLqL6oIxyYCOxuI0X8f9PZ0R3ZVHXmAwHMocmb8u4qpg9qxU6lF
         BnCg==
X-Gm-Message-State: AOJu0Yxvtq4PHH0Ggz+2M8jwc4mlScUEHhiDrfxEc+rtU0VHmNPBDxlZ
	RbJ9ZKucG+5MdBwwPvIvChu0REYlotRaeyRRV0dMUVk0ao09+6xzJIMe6fJ2uLx7I8QN4Eq/CC8
	7
X-Gm-Gg: ASbGncsgOcNSLGs5t2fatkRep2CKXgO1RvJfmjHcSCijLjT+kM9MrhDWnK1kWOlCUQ3
	tXhdt6dny+Aw1AUKxmaB3qJrD2fiJaPj4W+wbqGC88fElrmhRszWTD4+dSQwxoNB948/aNoXNct
	mbnQXE3JPn1fkeCsmClLJOC1S7Vzebfk+lDW4kfG6t/zLhDXvJGHPOlJOk+hhuky6ZffKMPm9li
	Sqdu3jc1AYlmAjD0CCBh4BB1oPuVVaB2ZjlUof/JZdibHJL1Mih2OGveEqlSJZTxZbYCNfxcS6p
	zIpc+R1C8DkKXHEaqsfvppHl3tTQ7tSO
X-Google-Smtp-Source: AGHT+IFyKBPIrqkkfTFAohKLkX9hGRsqydDTXzT/TARxf26w7fdcDZPzxfEJ+tpJ6mgO91ff/Dfl8g==
X-Received: by 2002:a17:90b:3907:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-30c3b90e372mr7713863a91.0.1746805563920;
        Fri, 09 May 2025 08:46:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dee9aasm1983093a91.25.2025.05.09.08.46.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:46:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/8] libsoup-2.4: Fix CVE-2024-52530
Date: Fri,  9 May 2025 08:45:48 -0700
Message-ID: <ef1bff79d6b84eacccff2a3f8a5c3b8ed92fe0c4.1746805404.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746805404.git.steve@sakoman.com>
References: <cover.1746805404.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216227

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092ac20607f3e150936624d4f536e68b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


