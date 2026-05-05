Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF6ACD343B
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1064.1778000350760564985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OPzzdmZ1;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so53164255e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000349; x=1778605149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMgbeviAuWQdOzNo3YmG1vpGsCOX84ejd/Dd3yM6jAo=;
        b=OPzzdmZ1W8eIQuHmO6+5uDTM8Vur3pDk8pymV6IXciLmTwwFehq5mxtmc/LjpsiVKI
         JsUTLN1uThMn9nxn/fsgjsvfnyxIDO7MAvT1ljNiZGf0NgxEMk8u2TQ7wdG75a8AtGHX
         n3kywa0/Vto/oRsDSpVpW1z2imA2TZvNHJh6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000349; x=1778605149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yMgbeviAuWQdOzNo3YmG1vpGsCOX84ejd/Dd3yM6jAo=;
        b=XXFEC9L5IJjxt3dVFSPbfDRsP2PAwdlw/aXW8S48eML+BO8pTDIpWO0+6vJeSuqTP/
         +etODHRftvhbTIFXA9/Sio6vNhzkVU4nI+QgNFRURr+jDrrAC3xd+6H+2+qMJ44kIwHi
         Ve0bgCrPAK0w64MptZM2OY4cRpB3FzVdt2XoEuBNSwknigRCNyeBet13Kw7nrD0kTslE
         RQsfP7LCHsPCqjea9fwUt2Fk8MF8XQFvFpHMzePyOcboJD9Vqiic8JLDsZJ75kaWHH44
         SkurxPZQ96Jvb79L3A8SBy7kFsfjEXuK5rs3LmgcWHudQdg72zCxSSu7QB1WxdP9Rbmq
         Cukg==
X-Gm-Message-State: AOJu0YzKVbYWQmC09D683rDMWkaBPwk7hVc7dZzhtQaADLkZaJ+cVy8+
	rLe90tY004D2StRaqePIy0R2oKw8ER4ekQL9Rt5HwOs0nwvHlkN51S4VyBdkNe8lzdzuSObhKZr
	ptt6PqH8=
X-Gm-Gg: AeBDiet1p4TdcLONviZmeQznBWEhv48VwCb1kTG+a3XFGHrjTDDk4i/hxl2WVioGBmm
	+mQ+JmznGQ8ZZZC1vExzOhbTeCzB/9uZ7Bj7LOwMz0McOg9Dcwe43/lPBqGx70oyqTSFa6F2AB7
	U3ysLUGdKrhWW8QImgRpRzyAQ3ezDDS/ROLs1xzvIXH7oNrW9630IwJOoO6hTto3jF7x4BLguL4
	t6D3XHrygpRvuouBPdMUnLv2/k87cj7CfskXFw7wyHyFKe79Ch/zvmailZaynrBRBe7bPWf1kmj
	mXjtmGVc6LpC0F5B/oXicEaCs++Lp4jVIOf+A+h7poWg9CRnkkPCQBfYeZCMeWZUKqt4WimThB1
	22Ib5zwY+TVVM9PJagRg8WtqdG/ODHPaiwaC9PgK+G3Mu3Pakjk8cOmlIon2j6gbJNBuDe8J+kS
	hhyENyJurlNwu37xEyflOCukrLQIt8N4C1WFfi3u/8G3L53UOfYHeDFQET5hw5y65rT5GineMEu
	3a/u4QBeIuoV6WzjYV1UXCQhA==
X-Received: by 2002:a05:600c:34c8:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48e51f2f85emr984985e9.13.1778000348768;
        Tue, 05 May 2026 09:59:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.59.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:59:07 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/23] libsoup: fix CVE-2025-14523
Date: Tue,  5 May 2026 18:57:39 +0200
Message-ID: <277297409dbf0bdb17653419e2d5e4a5ee8f33d5.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236513

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/work_items/472

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libsoup-3.4.4/CVE-2025-14523.patch        | 715 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 716 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..1cf5c9d667
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
@@ -0,0 +1,715 @@
+From 70123da95418f5d6e00e8ac2d586fb6c5d02cdc6 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 7 Jan 2026 14:50:33 -0600
+Subject: [PATCH] Reject duplicate Host headers
+
+RFC 9112 section 3.2 says:
+
+A server MUST respond with a 400 (Bad Request) status code to any
+HTTP/1.1 request message that lacks a Host header field and to any
+request message that contains more than one Host header field line or a
+Host header field with an invalid field value.
+
+In addition to rejecting a duplicate header when parsing headers, also
+reject attempts to add the duplicate header using the
+soup_message_headers_append() API, and add tests for both cases.
+
+These checks will also apply to HTTP/2. I'm not sure whether this is
+actually desired or not, but the header processing code is not aware of
+which HTTP version is in use.
+
+(Note that while SoupMessageHeaders does not require the Host header to
+be present in an HTTP/1.1 request, SoupServer itself does. So we can't
+test the case of missing Host header via the header parsing test, but it
+really is enforced.)
+
+Fixes #472
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/aecd8daadc110f8561fb2d6b2806a4cacf2e4c85]
+CVE: CVE-2025-14523
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c                 |   3 +-
+ libsoup/soup-message-headers-private.h |   4 +-
+ libsoup/soup-message-headers.c         |  80 +++++++------
+ tests/header-parsing-test.c            | 148 +++++++++++++++++--------
+ 4 files changed, 153 insertions(+), 82 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 155c11d..3fec9b3 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -139,7 +139,8 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 		for (p = strchr (value, '\r'); p; p = strchr (p, '\r'))
+ 			*p = ' ';
+ 
+-		soup_message_headers_append_untrusted_data (dest, name, value);
++		if (!soup_message_headers_append_untrusted_data (dest, name, value))
++                        goto done;
+         }
+ 	success = TRUE;
+ 
+diff --git a/libsoup/soup-message-headers-private.h b/libsoup/soup-message-headers-private.h
+index 9815464..770f3ef 100644
+--- a/libsoup/soup-message-headers-private.h
++++ b/libsoup/soup-message-headers-private.h
+@@ -10,10 +10,10 @@
+ 
+ G_BEGIN_DECLS
+ 
+-void        soup_message_headers_append_untrusted_data  (SoupMessageHeaders *hdrs,
++gboolean    soup_message_headers_append_untrusted_data  (SoupMessageHeaders *hdrs,
+                                                          const char         *name,
+                                                          const char         *value);
+-void        soup_message_headers_append_common          (SoupMessageHeaders *hdrs,
++gboolean    soup_message_headers_append_common          (SoupMessageHeaders *hdrs,
+                                                          SoupHeaderName      name,
+                                                          const char         *value);
+ const char *soup_message_headers_get_one_common         (SoupMessageHeaders *hdrs,
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index d69d6e8..ce4b3b3 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -267,12 +267,16 @@ soup_message_headers_clean_connection_headers (SoupMessageHeaders *hdrs)
+ 	soup_header_free_list (tokens);
+ }
+ 
+-void
++gboolean
+ soup_message_headers_append_common (SoupMessageHeaders *hdrs,
+                                     SoupHeaderName      name,
+                                     const char         *value)
+ {
+         SoupCommonHeader header;
++        if (name == SOUP_HEADER_HOST && soup_message_headers_get_one (hdrs, "Host")) {
++                g_warning ("soup_message_headers_append_common: Rejecting duplicate Host header");
++                return FALSE;
++        }
+ 
+         if (!hdrs->common_headers)
+                 hdrs->common_headers = g_array_sized_new (FALSE, FALSE, sizeof (SoupCommonHeader), 6);
+@@ -284,32 +288,18 @@ soup_message_headers_append_common (SoupMessageHeaders *hdrs,
+                 g_hash_table_remove (hdrs->common_concat, GUINT_TO_POINTER (header.name));
+ 
+         soup_message_headers_set (hdrs, name, value);
++        return TRUE;
+ }
+ 
+-/**
+- * soup_message_headers_append:
+- * @hdrs: a #SoupMessageHeaders
+- * @name: the header name to add
+- * @value: the new value of @name
+- *
+- * Appends a new header with name @name and value @value to @hdrs.
+- *
+- * (If there is an existing header with name @name, then this creates a second
+- * one, which is only allowed for list-valued headers; see also
+- * [method@MessageHeaders.replace].)
+- *
+- * The caller is expected to make sure that @name and @value are
+- * syntactically correct.
+- **/
+-void
+-soup_message_headers_append (SoupMessageHeaders *hdrs,
+-			     const char *name, const char *value)
++static gboolean
++soup_message_headers_append_internal (SoupMessageHeaders *hdrs,
++                         const char *name, const char *value)
+ {
+ 	SoupUncommonHeader header;
+         SoupHeaderName header_name;
+ 
+-	g_return_if_fail (name != NULL);
+-	g_return_if_fail (value != NULL);
++	g_return_val_if_fail (name != NULL, FALSE);
++	g_return_val_if_fail (value != NULL, FALSE);
+ 
+ 	/* Setting a syntactically invalid header name or value is
+ 	 * considered to be a programming error. However, it can also
+@@ -317,23 +307,22 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	 * compiled with G_DISABLE_CHECKS.
+ 	 */
+ #ifndef G_DISABLE_CHECKS
+-	g_return_if_fail (*name && strpbrk (name, " \t\r\n:") == NULL);
+-	g_return_if_fail (strpbrk (value, "\r\n") == NULL);
++	g_return_val_if_fail (*name && strpbrk (name, " \t\r\n:") == NULL, FALSE);
++	g_return_val_if_fail (strpbrk (value, "\r\n") == NULL, FALSE);
+ #else
+ 	if (*name && strpbrk (name, " \t\r\n:")) {
+-		g_warning ("soup_message_headers_append: Ignoring bad name '%s'", name);
+-		return;
++		g_warning ("soup_message_headers_append: Rejecting bad name '%s'", name);
++		return FALSE;
+ 	}
+ 	if (strpbrk (value, "\r\n")) {
+-		g_warning ("soup_message_headers_append: Ignoring bad value '%s'", value);
+-		return;
++		g_warning ("soup_message_headers_append: Rejecting bad value '%s'", value);
++		return FALSE;
+ 	}
+ #endif
+ 
+         header_name = soup_header_name_from_string (name);
+         if (header_name != SOUP_HEADER_UNKNOWN) {
+-                soup_message_headers_append_common (hdrs, header_name, value);
+-                return;
++                return soup_message_headers_append_common (hdrs, header_name, value);
+         }
+ 
+         if (!hdrs->uncommon_headers)
+@@ -344,21 +333,48 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	g_array_append_val (hdrs->uncommon_headers, header);
+ 	if (hdrs->uncommon_concat)
+ 		g_hash_table_remove (hdrs->uncommon_concat, header.name);
++        return TRUE;
++}
++
++/**
++ * soup_message_headers_append:
++ * @hdrs: a #SoupMessageHeaders
++ * @name: the header name to add
++ * @value: the new value of @name
++ *
++ * Appends a new header with name @name and value @value to @hdrs.
++ *
++ * (If there is an existing header with name @name, then this creates a second
++ * one, which is only allowed for list-valued headers; see also
++ * [method@MessageHeaders.replace].)
++ *
++ * The caller is expected to make sure that @name and @value are
++ * syntactically correct.
++ **/
++void
++soup_message_headers_append (SoupMessageHeaders *hdrs,
++			     const char *name, const char *value)
++{
++	soup_message_headers_append_internal (hdrs, name, value);
+ }
+ 
+ /*
+- * Appends a header value ensuring that it is valid UTF8.
++ * Appends a header value ensuring that it is valid UTF-8, and also checking the
++ * return value of soup_message_headers_append_internal() to report whether the
++ * headers are invalid for various other reasons.
+  */
+-void
++gboolean
+ soup_message_headers_append_untrusted_data (SoupMessageHeaders *hdrs,
+                                             const char         *name,
+                                             const char         *value)
+ {
+         char *safe_value = g_utf8_make_valid (value, -1);
+         char *safe_name = g_utf8_make_valid (name, -1);
+-        soup_message_headers_append (hdrs, safe_name, safe_value);
++        gboolean result = soup_message_headers_append_internal (hdrs, safe_name, safe_value);
++
+         g_free (safe_value);
+         g_free (safe_name);
++        return result;
+ }
+ 
+ void
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 9490559..98a22a4 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -24,6 +24,7 @@ static struct RequestTest {
+ 	const char *method, *path;
+ 	SoupHTTPVersion version;
+ 	Header headers[10];
++	GLogLevelFlags log_flags;
+ } reqtests[] = {
+ 	/**********************/
+ 	/*** VALID REQUESTS ***/
+@@ -33,7 +34,7 @@ static struct RequestTest {
+ 	  "GET / HTTP/1.0\r\n", -1,
+ 	  SOUP_STATUS_OK,
+ 	  "GET", "/", SOUP_HTTP_1_0,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header", NULL,
+@@ -42,7 +43,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, no leading whitespace", NULL,
+@@ -51,7 +52,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header including trailing whitespace", NULL,
+@@ -60,7 +61,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, wrapped", NULL,
+@@ -69,7 +70,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, wrapped with additional whitespace", NULL,
+@@ -78,7 +79,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, wrapped with tab", NULL,
+@@ -87,7 +88,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, wrapped before value", NULL,
+@@ -96,7 +97,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header with empty value", NULL,
+@@ -105,7 +106,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 2 headers", NULL,
+@@ -115,7 +116,7 @@ static struct RequestTest {
+ 	  { { "Host", "example.com" },
+ 	    { "Connection", "close" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 3 headers", NULL,
+@@ -126,7 +127,7 @@ static struct RequestTest {
+ 	    { "Connection", "close" },
+ 	    { "Blah", "blah" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 3 headers, 1st wrapped", NULL,
+@@ -137,7 +138,7 @@ static struct RequestTest {
+             { "Foo", "bar baz" },
+ 	    { "Blah", "blah" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 3 headers, 2nd wrapped", NULL,
+@@ -148,7 +149,7 @@ static struct RequestTest {
+ 	    { "Blah", "blah" },
+ 	    { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 3 headers, 3rd wrapped", NULL,
+@@ -159,7 +160,7 @@ static struct RequestTest {
+ 	    { "Blah", "blah" },
+ 	    { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ same header multiple times", NULL,
+@@ -168,7 +169,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar, baz, quux" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Connection header on HTTP/1.0 message", NULL,
+@@ -178,21 +179,21 @@ static struct RequestTest {
+ 	  { { "Connection", "Bar, Quux" },
+             { "Foo", "bar" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "GET with full URI", "667637",
+ 	  "GET http://example.com HTTP/1.1\r\n", -1,
+ 	  SOUP_STATUS_OK,
+ 	  "GET", "http://example.com", SOUP_HTTP_1_1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "GET with full URI in upper-case", "667637",
+ 	  "GET HTTP://example.com HTTP/1.1\r\n", -1,
+ 	  SOUP_STATUS_OK,
+ 	  "GET", "HTTP://example.com", SOUP_HTTP_1_1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	/* It's better for this to be passed through: this means a SoupServer
+@@ -202,7 +203,7 @@ static struct RequestTest {
+ 	  "GET AbOuT: HTTP/1.1\r\n", -1,
+ 	  SOUP_STATUS_OK,
+ 	  "GET", "AbOuT:", SOUP_HTTP_1_1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	/****************************/
+@@ -217,7 +218,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	/* RFC 2616 section 3.1 says we MUST accept this */
+@@ -228,7 +229,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	/* RFC 2616 section 19.3 says we SHOULD accept these */
+@@ -240,7 +241,7 @@ static struct RequestTest {
+ 	  { { "Host", "example.com" },
+ 	    { "Connection", "close" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "LF instead of CRLF after Request-Line", NULL,
+@@ -249,7 +250,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Mixed CRLF/LF", "666316",
+@@ -261,7 +262,7 @@ static struct RequestTest {
+ 	    { "e", "f" },
+ 	    { "g", "h" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ incorrect whitespace in Request-Line", NULL,
+@@ -270,7 +271,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ incorrect whitespace after Request-Line", "475169",
+@@ -279,7 +280,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	/* If the request/status line is parseable, then we
+@@ -293,7 +294,7 @@ static struct RequestTest {
+ 	  { { "Host", "example.com" },
+ 	    { "Bar", "two" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "First header line is continuation", "666316",
+@@ -303,7 +304,7 @@ static struct RequestTest {
+ 	  { { "Host", "example.com" },
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Zero-length header name", "666316",
+@@ -313,7 +314,7 @@ static struct RequestTest {
+ 	  { { "a", "b" },
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "CR in header name", "666316",
+@@ -323,7 +324,7 @@ static struct RequestTest {
+ 	  { { "a", "b" },
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "CR in header value", "666316",
+@@ -336,7 +337,7 @@ static struct RequestTest {
+ 	    { "s", "t" },		/* CR at end is ignored */
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Tab in header name", "666316",
+@@ -351,7 +352,7 @@ static struct RequestTest {
+ 	    { "p", "q z: w" },
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Tab in header value", "666316",
+@@ -364,7 +365,7 @@ static struct RequestTest {
+ 	    { "z", "w" },	/* trailing tab ignored */
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	/************************/
+@@ -375,77 +376,77 @@ static struct RequestTest {
+ 	  "GET /\r\n", -1,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "HTTP 1.2 request (no such thing)", NULL,
+ 	  "GET / HTTP/1.2\r\n", -1,
+ 	  SOUP_STATUS_HTTP_VERSION_NOT_SUPPORTED,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "HTTP 2000 request (no such thing)", NULL,
+ 	  "GET / HTTP/2000.0\r\n", -1,
+ 	  SOUP_STATUS_HTTP_VERSION_NOT_SUPPORTED,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Long HTTP version terminating at missing minor version", "https://gitlab.gnome.org/GNOME/libsoup/-/issues/404",
+ 	  unterminated_http_version, sizeof (unterminated_http_version),
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Non-HTTP request", NULL,
+ 	  "GET / SOUP/1.1\r\nHost: example.com\r\n", -1,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Junk after Request-Line", NULL,
+ 	  "GET / HTTP/1.1 blah\r\nHost: example.com\r\n", -1,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "NUL in Method", NULL,
+ 	  "G\x00T / HTTP/1.1\r\nHost: example.com\r\n", 37,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "NUL at beginning of Method", "666316",
+ 	  "\x00 / HTTP/1.1\r\nHost: example.com\r\n", 35,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "NUL in Path", NULL,
+ 	  "GET /\x00 HTTP/1.1\r\nHost: example.com\r\n", 38,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "No terminating CRLF", NULL,
+ 	  "GET / HTTP/1.1\r\nHost: example.com", -1,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Unrecognized expectation", NULL,
+ 	  "GET / HTTP/1.1\r\nHost: example.com\r\nExpect: the-impossible\r\n", -1,
+ 	  SOUP_STATUS_EXPECTATION_FAILED,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
+@@ -453,21 +454,40 @@ static struct RequestTest {
+ 	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "NUL in header value", NULL,
+ 	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Only newlines", NULL,
+ 	  only_newlines, sizeof (only_newlines),
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
++	},
++	{ "Duplicate Host headers",
++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
++	  "GET / HTTP/1.1\r\nHost: example.com\r\nHost: example.org\r\n",
++	  -1,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } },
++	  G_LOG_LEVEL_WARNING
++	},
++
++	{ "Duplicate Host headers, case insensitive",
++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
++	  "GET / HTTP/1.1\r\nHost: example.com\r\nhost: example.org\r\n",
++	  -1,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } },
++	  G_LOG_LEVEL_WARNING
+ 	}
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+@@ -915,10 +935,17 @@ do_request_tests (void)
+ 			len = strlen (reqtests[i].request);
+ 		else
+ 			len = reqtests[i].length;
++
++		if (reqtests[i].log_flags)
++			g_test_expect_message ("libsoup", reqtests[i].log_flags, "*");
++
+ 		status = soup_headers_parse_request (reqtests[i].request, len,
+ 						     headers, &method, &path,
+ 						     &version);
+ 		g_assert_cmpint (status, ==, reqtests[i].status);
++		if (reqtests[i].log_flags)
++			g_test_assert_expected_messages ();
++
+ 		if (SOUP_STATUS_IS_SUCCESSFUL (status)) {
+ 			g_assert_cmpstr (method, ==, reqtests[i].method);
+ 			g_assert_cmpstr (path, ==, reqtests[i].path);
+@@ -1312,6 +1339,32 @@ do_bad_header_tests (void)
+ 	soup_message_headers_unref (hdrs);
+ }
+ 
++static void
++do_append_duplicate_host_test (void)
++{
++   SoupMessageHeaders *hdrs;
++   const char *list_value;
++
++   hdrs = soup_message_headers_new (SOUP_MESSAGE_HEADERS_REQUEST);
++   soup_message_headers_append (hdrs, "Host", "a");
++
++   g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
++                      "soup_message_headers_append_common: Rejecting duplicate Host header");
++   soup_message_headers_append (hdrs, "Host", "b");
++   g_test_assert_expected_messages ();
++
++        /* Case insensitive */
++   g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
++                      "soup_message_headers_append_common: Rejecting duplicate Host header");
++   soup_message_headers_append (hdrs, "host", "b");
++   g_test_assert_expected_messages ();
++
++   list_value = soup_message_headers_get_list (hdrs, "Host");
++   g_assert_cmpstr (list_value, ==, "a");
++
++   soup_message_headers_unref (hdrs);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1327,6 +1380,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/header-parsing/content-type", do_content_type_tests);
+ 	g_test_add_func ("/header-parsing/append-param", do_append_param_tests);
+ 	g_test_add_func ("/header-parsing/bad", do_bad_header_tests);
++	g_test_add_func ("/header-parsing/append-duplicate-host", do_append_duplicate_host_test);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index c09b06fec2..6be31806f1 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -46,6 +46,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
            file://CVE-2025-12105.patch \
+           file://CVE-2025-14523.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 

