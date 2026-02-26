Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F37FC5907
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 07:24:08 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65379.1772090641266906841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 23:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SC/64ejY;
 spf=pass (domain: mvista.com, ip: 74.125.82.46, mailfrom: rsangam@mvista.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1275910b930so312490c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 23:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1772090640; x=1772695440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JAmvG5K+43RZ3wOqjLCdH5oTbodRaQN91QqpJ7qMpeE=;
        b=SC/64ejY1lSfcWimBqr9mzmKQfbChbC1IpWHc+aIQKnQfakFKaOi4KIIVftHdAEFPe
         FXR4Molz9hJql4oOwP8tda9g6sduMvPcn5k/PVFIL+6+x8Wv346brHtbLD3svHBn9Mv1
         oT4nak1NvKQhg1bTxu6d9IycjpmXn6g6jUGho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090640; x=1772695440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAmvG5K+43RZ3wOqjLCdH5oTbodRaQN91QqpJ7qMpeE=;
        b=WujEabDS1+Y1+GZrUS45iAkzou7632a0zfsL0jmkJe8157NX0okO2Xosks+psuAI8k
         3VHxKZ9aZT3204Y42NuCYY1pHWgevwO3zB441HOWr0A9OEFeu7VFypuHqikezkwcGM/a
         2U3yk+uWrwvlLZ6JTzWWc3Fu7kG5RvBlE92c46gLSO2ocK0OFKTxJhWKVYAr2HIobq40
         Rw/78DgmHevk0SMIM6AfpJhiyKzs0tIr7IznMPK7fZioLyYoSs/UTmD5J6SpUDNChV1Z
         uKMJh5LiIyPtADvYaSOEcFV8C6I+YudKxxHuYncR3kc0LjDX/AsuFGAIK+ugR4sLC/ga
         uJzA==
X-Gm-Message-State: AOJu0YwafDhX78KSNs1xldsb22r3oA/ETiOyzRc/Ht0qkNnWvQ4hvbTK
	97lmHQAq+1Uzzz7bzGVuhnBfqxkkmWdDT6BIOCdIjTNRoo1dSiuaikTIJY7l6q0F82d8GueJbS2
	xTuUcfDE=
X-Gm-Gg: ATEYQzxc/ZUw14A3j7gUQ7EuQVBGu87bpZlybH+9x9AU9hSIhsSq2LViFZ3Qce5xfZC
	jOcXYEbdJxU0SdYETXTBio8M1rYB6/UASLc/8+xKrSTYpVhSDBDP2TA61nPVEoX3QFM7KCRGVUZ
	WVpUb4+bJXQaV6ipAREbg/XCLz1ZOFIr4Njy3Jywi60FP4LhNbW60C0hdtbvqWT6BRBb4+tyNKi
	pZErkEkA3MLI8T/LU0aqjBq+1rXWoftQ6ZzuxqQjZhtzi1bOJ271XBaHoq66FUyscHGSRb92SWL
	bjLM6eSwveXrZ77xy3ws5HMGHBuv4ORG4kTL86IOpFh1uLYKOuf8Q0bWTWeltgCqcvEelOEthfI
	fR/Gv/17QVPFpy1TexzXyT1vfXKuQvr91m4tOicI1OVOv48ruSlOLg0yxKeAFvvuaqBtaeRZWIt
	uXN/au7NpaFIVKaflwEFtZF51kL/pF6bilRSSw8TEZyw==
X-Received: by 2002:a05:7022:23a9:b0:11b:9386:a38e with SMTP id a92af1059eb24-1278910bb77mr963010c88.21.1772090639943;
        Wed, 25 Feb 2026 23:23:59 -0800 (PST)
Received: from MVIN00040.mvista.com ([49.207.223.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43c12sm1486154c88.14.2026.02.25.23.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:23:59 -0800 (PST)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libsoup: Security fix for CVE-2025-14523 & CVE-2026-1761
Date: Thu, 26 Feb 2026 12:53:52 +0530
Message-Id: <20260226072352.8670-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 07:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231992

CVEs fixed:
- CVE-2025-14523 libsoup: Duplicate Host Header Handling Causes Host-Parsing Discrepancy (First- vs Last-Value Wins)
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/383cc02354c2a4235a98338005f8b47ffab4e53a,
https://gitlab.gnome.org/GNOME/libsoup/-/commit/a94c4fb5bd9ef0f6b47128f9808c45f2259f9409]

- CVE-2026-1761 libsoup: Stack-Based Buffer Overflow in libsoup Multipart Response Parsingmultipart HTTP response
Upstream-Status : Backport [import from RHEL9 - libsoup-2.72.0-12.el9_7.5
Upstream-commit: https://gitlab.gnome.org/GNOME/libsoup/-/commit/cfa9d90d1a5c274233554a264c56551c13d6a6f0]

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-14523.patch  |  77 ++
 .../libsoup/libsoup-2.4/CVE-2026-1761.patch   |  38 +
 .../libsoup/libsoup-2.4_2.74.3.bb             |   2 +
 .../libsoup-3.4.4/CVE-2025-14523.patch        | 697 ++++++++++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2026-1761.patch | 102 +++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   2 +
 6 files changed, 918 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-1761.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..b951fcd627
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
@@ -0,0 +1,77 @@
+From 383cc02354c2a4235a98338005f8b47ffab4e53a Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 7 Jan 2026 14:50:33 -0600
+Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
+
+https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/491
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/383cc02354c2a4235a98338005f8b47ffab4e53a]
+CVE: CVE-2025-14523
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ libsoup/soup-headers.c         |  3 +++
+ libsoup/soup-message-headers.c |  3 +++
+ tests/header-parsing-test.c    | 18 ++++++++++++++++++
+ 3 files changed, 24 insertions(+)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index ea2f986..6cd3dad 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 		for (p = strchr (value, '\r'); p; p = strchr (p, '\r'))
+ 			*p = ' ';
+ 
++		if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (dest, "Host"))
++			goto done;
++
+ 		soup_message_headers_append (dest, name, value);
+         }
+ 	success = TRUE;
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index ff10e10..4fc6768 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	}
+ #endif
+ 
++	if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (hdrs, "Host"))
++		return;
++
+ 	header.name = intern_header_name (name, &setter);
+ 	header.value = g_strdup (value);
+ 	g_array_append_val (hdrs->array, header);
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index d20da95..f2286d0 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -468,6 +468,24 @@ static struct RequestTest {
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+ 	  { { NULL } }
++	},
++
++	{ "Duplicate Host headers",
++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
++	  "GET / HTTP/1.1\r\nHost: example.com\r\nHost: example.org\r\n",
++	  -1,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } }
++	},
++
++	{ "Duplicate Host headers (case insensitive)",
++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
++	  "GET / HTTP/1.1\r\nHost: example.com\r\nhost: example.org\r\n",
++	  -1,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } }
+ 	}
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
new file mode 100644
index 0000000000..f6a30c86f9
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
@@ -0,0 +1,38 @@
+From cfa9d90d1a5c274233554a264c56551c13d6a6f0 Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Mon, 19 Jan 2026 15:14:58 +0100
+Subject: [PATCH] multipart: check length of bytes read
+ soup_filter_input_stream_read_until()
+
+We do make sure the read length is smaller than the buffer length when
+the boundary is not found, but we should do the same when the boundary
+is found.
+
+Spotted in #YWH-PGM9867-149
+Closes #493
+
+Upstream-Status: Backport [import from RHEL9 - libsoup-2.72.0-12.el9_7.5
+Upstream-commit: https://gitlab.gnome.org/GNOME/libsoup/-/commit/cfa9d90d1a5c274233554a264c56551c13d6a6f0]
+CVE: CVE-2026-1761
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ libsoup/soup-filter-input-stream.c |  3 +-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-filter-input-stream.c b/libsoup/soup-filter-input-stream.c
+index 2c30bf9..b16246d 100644
+--- a/libsoup/soup-filter-input-stream.c
++++ b/libsoup/soup-filter-input-stream.c
+@@ -272,6 +272,7 @@ soup_filter_input_stream_read_until (SoupFilterInputStream  *fstream,
+ 	if (eof && !*got_boundary)
+ 		read_length = MIN (fstream->priv->buf->len, length);
+ 	else
+-		read_length = p - buf;
++		read_length = MIN ((gsize)(p - buf), length);
++
+ 	return read_from_buf (fstream, buffer, read_length);
+ }
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 7e00cd678a..9f6beaee69 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -41,6 +41,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4476.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-14523.patch \
+           file://CVE-2026-1761.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..7ce8571c8b
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
@@ -0,0 +1,697 @@
+From a94c4fb5bd9ef0f6b47128f9808c45f2259f9409 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/a94c4fb5bd9ef0f6b47128f9808c45f2259f9409]
+CVE: CVE-2025-14523
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ libsoup/soup-headers.c                 |   3 +-
+ libsoup/soup-message-headers-private.h |   4 +-
+ libsoup/soup-message-headers.c         |  76 ++++++++------
+ tests/header-parsing-test.c            | 132 ++++++++++++++++---------
+ 4 files changed, 135 insertions(+), 80 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 52ef2ec..6688dfd 100644
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
+index d69d6e8..383a09f 100644
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
++	if (name == SOUP_HEADER_HOST && soup_message_headers_get_one (hdrs, "Host")) {
++                g_warning ("Attempted to add duplicate Host header to a SoupMessageHeaders that already contains a Host header");
++                return FALSE;
++        }
+ 
+         if (!hdrs->common_headers)
+                 hdrs->common_headers = g_array_sized_new (FALSE, FALSE, sizeof (SoupCommonHeader), 6);
+@@ -284,32 +288,18 @@ soup_message_headers_append_common (SoupMessageHeaders *hdrs,
+                 g_hash_table_remove (hdrs->common_concat, GUINT_TO_POINTER (header.name));
+ 
+         soup_message_headers_set (hdrs, name, value);
++	return TRUE;
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
++			              const char *name, const char *value)
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
+ 		g_warning ("soup_message_headers_append: Ignoring bad name '%s'", name);
+-		return;
++		return FALSE;
+ 	}
+ 	if (strpbrk (value, "\r\n")) {
+ 		g_warning ("soup_message_headers_append: Ignoring bad value '%s'", value);
+-		return;
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
++	return TRUE;
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
+index 4faafbd..380f706 100644
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
+@@ -453,21 +454,31 @@ static struct RequestTest {
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
++
++	{ "Duplicate Host headers",
++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
++	  "GET / HTTP/1.1\r\nHost: example.com\r\nHost: example.org\r\n",
++	  -1,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } },
++	  G_LOG_LEVEL_WARNING
+ 	}
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+@@ -915,10 +926,17 @@ do_request_tests (void)
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
+@@ -1314,6 +1332,25 @@ do_bad_header_tests (void)
+ 	soup_message_headers_unref (hdrs);
+ }
+ 
++static void
++do_append_duplicate_host_test (void)
++{
++	SoupMessageHeaders *hdrs;
++	const char *list_value;
++
++	hdrs = soup_message_headers_new (SOUP_MESSAGE_HEADERS_REQUEST);
++	soup_message_headers_append (hdrs, "Host", "a");
++	g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
++		               "Attempted to add duplicate Host header to a SoupMessageHeaders that already contains a Host header");
++	soup_message_headers_append (hdrs, "Host", "b");
++	g_test_assert_expected_messages ();
++
++	list_value = soup_message_headers_get_list (hdrs, "Host");
++	g_assert_cmpstr (list_value, ==, "a");
++
++	soup_message_headers_unref (hdrs);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1329,6 +1366,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/header-parsing/content-type", do_content_type_tests);
+ 	g_test_add_func ("/header-parsing/append-param", do_append_param_tests);
+ 	g_test_add_func ("/header-parsing/bad", do_bad_header_tests);
++	g_test_add_func ("/header-parsing/append-duplicate-host", do_append_duplicate_host_test);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-1761.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-1761.patch
new file mode 100644
index 0000000000..b47ddbae5d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-1761.patch
@@ -0,0 +1,102 @@
+From cfa9d90d1a5c274233554a264c56551c13d6a6f0 Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Mon, 19 Jan 2026 15:14:58 +0100
+Subject: [PATCH] multipart: check length of bytes read
+ soup_filter_input_stream_read_until()
+
+We do make sure the read length is smaller than the buffer length when
+the boundary is not found, but we should do the same when the boundary
+is found.
+
+Spotted in #YWH-PGM9867-149
+Closes #493
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOMiE/libsoup/-/commit/cfa9d90d1a5c274233554a264c56551c13d6a6f0]
+CVE: CVE-2026-1761
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ libsoup/soup-filter-input-stream.c |  3 +-
+ tests/multipart-test.c             | 46 ++++++++++++++++++++++++++++++
+ 2 files changed, 48 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-filter-input-stream.c b/libsoup/soup-filter-input-stream.c
+index b1e616c..76ff086 100644
+--- a/libsoup/soup-filter-input-stream.c
++++ b/libsoup/soup-filter-input-stream.c
+@@ -337,6 +337,7 @@ soup_filter_input_stream_read_until (SoupFilterInputStream  *fstream,
+ 	if (eof && !*got_boundary)
+ 		read_length = MIN (priv->buf->len, length);
+ 	else
+-		read_length = p - buf;
++		read_length = MIN ((gsize)(p - buf), length);
++
+ 	return read_from_buf (fstream, buffer, read_length);
+ }
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index b07e4db..b617056 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -548,6 +548,51 @@ test_multipart_bounds_bad_2 (void)
+ 	g_bytes_unref (bytes);
+ }
+ 
++static void
++test_multipart_bounds_bad_3 (void)
++{
++        SoupMessage *msg;
++        SoupMessageHeaders *headers;
++        GInputStream *in;
++        SoupMultipartInputStream *multipart;
++        GError *error = NULL;
++        const char raw_data[] = "\0$--A\r\nContent-Disposition: form-data; name=\"f\"\r\n\r\nXXXXXXXXX\r\n--A--\r\n";
++
++        msg = soup_message_new(SOUP_METHOD_POST, "http://foo/upload");
++        headers = soup_message_get_response_headers (msg);
++        soup_message_headers_replace (headers, "Content-Type", "multipart/form-data; boundary=\"A\"");
++
++        in = g_memory_input_stream_new_from_data (raw_data + 2, sizeof(raw_data) - 2, NULL);
++        multipart = soup_multipart_input_stream_new (msg, in);
++        g_object_unref (in);
++
++        while (TRUE) {
++                in = soup_multipart_input_stream_next_part (multipart, NULL, &error);
++                g_assert_no_error (error);
++                if (!in) {
++                        g_clear_error (&error);
++                        break;
++                }
++
++                char buffer[10];
++                while (TRUE) {
++                        gssize bytes_read;
++
++                        bytes_read = g_input_stream_read (in, buffer, sizeof(buffer), NULL, &error);
++                        g_assert_no_error (error);
++                        if (bytes_read <= 0) {
++                                g_clear_error (&error);
++                                break;
++                        }
++                }
++
++                g_object_unref (in);
++        }
++
++        g_object_unref (multipart);
++        g_object_unref (msg);
++}
++
+ static void
+ test_multipart_too_large (void)
+ {
+@@ -617,6 +662,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
+ 	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
++	g_test_add_func ("/multipart/bounds-bad-3", test_multipart_bounds_bad_3);
+ 	g_test_add_func ("/multipart/too-large", test_multipart_too_large);
+ 
+ 	ret = g_test_run ();
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index c09b06fec2..b59f08b363 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -46,6 +46,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
            file://CVE-2025-12105.patch \
+           file://CVE-2025-14523.patch \
+           file://CVE-2026-1761.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


