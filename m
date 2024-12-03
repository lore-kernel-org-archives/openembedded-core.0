Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B330E64AA1
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:44 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.19582.1733233057563581306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F2dYKam2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-215bd2c32a6so7306315ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233057; x=1733837857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqqwygsYogRfXq3FcjEQlLjiAY7c3tAId1HbIRxfa7A=;
        b=F2dYKam2AQAUxYUdOD7k4tdTGEF8667/3oLjXU82Rls8cpehQHX03Clsvdl15R9o/7
         PwjJqtbKMqM/Z46BUzeO4FdpeB2DaQubKFLqyLHMbANrapjBj1ZLgLvxrZwHASr5QrHM
         msukXFqs5atUkxp9M4TDjdGxVrUyIq3BAZSHLCJPCdLoyCsj4K5FVpudsBgxqL2yC9oN
         C1UgcoHKfYppl1Un/DJ0UtdeqvoPHRc2e7pk+jxigoARldepaURcGaSnjvs5px1JDbo3
         4uyuAlNXYNh3nIBwg/5w4kvSB8UTbfepwK4evTFnJhtRaQB4dlZwZhNoDDR1nBd4wUCc
         xe8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233057; x=1733837857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqqwygsYogRfXq3FcjEQlLjiAY7c3tAId1HbIRxfa7A=;
        b=P+SFhWijvT8+XWEcQvTKbq7DMEIEU9AdP4nMq8t6LKNsLC6jxWer3lVTR00HQwBSLo
         D7PPHQXsqWRFixZvYEz6Y8DGZdc/KCBzAhawNwYvj8WPvHFzFOJkmxUM7xI3Yuc7Vr7v
         pE3cZrfVbPcD7X8M4v65nNT+1Op1LyJr7hM8EjNerQODCAQNIWndy2rAytWhzRKQCq6z
         GbRogcku2SM6UfonEe8wKV2/7NlrgZrz6jF9floEhJ4oPFXXhy2o6vKSQ4zB2PkmQL8V
         LbHUWqUTum9z5Ia8zyP+nyj+AIchUw9EQjlcBdki8gyoMnfG85arH+9CAWCASZaiHZsH
         NBog==
X-Gm-Message-State: AOJu0Yxcfank40+VMpqROuq0FLrYXM/i6U6idFJCj3CMDuuRnj6bgnqc
	rmTfBj2pYIy7mm7/U9BMdxbRGG4+LJjw4XK0f/1/vvBPV8rb5lsmF6yK6Lpz0EMX3YC7ahj60lE
	g
X-Gm-Gg: ASbGncsnkrgLBbaUYILuFgC4vhobs6jojJ/cJKl67lVPpbyklN5zfMbRmRSI/5aSnkN
	qypQZzR4smM5xn53JxKLiNGsniT9uetvJ1HTxvAV2wxC0YcF56n8GW9zKdEtOlGQoUCrY92bbtL
	pntPeyvVcGqPOmMbJSRObHoTgU1krd36kH95Lg6uLDtoFYKpwq4qr8lLZ3Yx+1xQbmPtWTe+OPc
	5yPg8tzULayk8SIacHaITbh4K5JY7oqbctZiZM=
X-Google-Smtp-Source: AGHT+IGsaT5MG17grGmVNJgEZihOxvGwW+U4ilJ2Aw3P/z5oPYzLFpPtFJmv+If6METveJALiJrMGw==
X-Received: by 2002:a17:902:e743:b0:215:a96d:ec17 with SMTP id d9443c01a7336-215bd0d2fb6mr33736975ad.14.1733233056566;
        Tue, 03 Dec 2024 05:37:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/16] libsoup: fix CVE-2024-52530, CVE-2024-52531
Date: Tue,  3 Dec 2024 05:37:09 -0800
Message-Id: <0af9ac076cdbab70f526520acbbb0c38d237c407.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208194

From: Changqing Li <changqing.li@windriver.com>

CVE-2024-52531:
GNOME libsoup before 3.6.1 allows a buffer overflow in applications that
perform conversion to UTF-8 in soup_header_parse_param_list_strict.
Input received over the network cannot trigger this.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2024-52531

CVE-2024-52530:
GNOME libsoup before 3.6.0 allows HTTP request smuggling in some
configurations because '\0' characters at the end of header names are
ignored, i.e., a "Transfer-Encoding\0: chunked" header is treated the
same as a "Transfer-Encoding: chunked" header.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2024-52530

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2024-52530.patch        | 150 ++++++++++++++++++
 .../libsoup-3.4.4/CVE-2024-52531-1.patch      | 116 ++++++++++++++
 .../libsoup-3.4.4/CVE-2024-52531-2.patch      |  40 +++++
 .../libsoup-3.4.4/CVE-2024-52531-3.patch      | 136 ++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   4 +
 5 files changed, 446 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52530.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52530.patch
new file mode 100644
index 0000000000..fb6d5c3c6f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52530.patch
@@ -0,0 +1,150 @@
+From 04df03bc092ac20607f3e150936624d4f536e68b Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 8 Jul 2024 12:33:15 -0500
+Subject: [PATCH] headers: Strictly don't allow NUL bytes
+
+In the past (2015) this was allowed for some problematic sites. However Chromium also does not allow NUL bytes in either header names or values these days. So this should no longer be a problem.
+
+CVE: CVE-2024-52530
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092ac20607f3e150936624d4f536e68b]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-1.patch
new file mode 100644
index 0000000000..c8e855c128
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-1.patch
@@ -0,0 +1,116 @@
+From 4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Tue, 27 Aug 2024 12:18:58 -0500
+Subject: [PATCH] fuzzing: Cover soup_header_parse_param_list
+
+CVE: CVE-2024-52531
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ fuzzing/fuzz.h                   |  9 +++++++--
+ fuzzing/fuzz_header_parsing.c    | 19 +++++++++++++++++++
+ fuzzing/fuzz_header_parsing.dict |  8 ++++++++
+ fuzzing/meson.build              |  2 ++
+ 4 files changed, 36 insertions(+), 2 deletions(-)
+ create mode 100644 fuzzing/fuzz_header_parsing.c
+ create mode 100644 fuzzing/fuzz_header_parsing.dict
+
+diff --git a/fuzzing/fuzz.h b/fuzzing/fuzz.h
+index 0d380285..f3bd28ee 100644
+--- a/fuzzing/fuzz.h
++++ b/fuzzing/fuzz.h
+@@ -1,13 +1,14 @@
+ #include "libsoup/soup.h"
+ 
+ int LLVMFuzzerTestOneInput (const unsigned char *data, size_t size);
++static int set_logger = 0;
+ 
+ #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
+ static GLogWriterOutput
+ empty_logging_func (GLogLevelFlags log_level, const GLogField *fields,
+                     gsize n_fields, gpointer user_data)
+ {
+-  return G_LOG_WRITER_HANDLED;
++        return G_LOG_WRITER_HANDLED;
+ }
+ #endif
+ 
+@@ -16,6 +17,10 @@ static void
+ fuzz_set_logging_func (void)
+ {
+ #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
+-  g_log_set_writer_func (empty_logging_func, NULL, NULL);
++        if (!set_logger)
++        {
++                set_logger = 1;
++                g_log_set_writer_func (empty_logging_func, NULL, NULL);
++        }
+ #endif
+ }
+diff --git a/fuzzing/fuzz_header_parsing.c b/fuzzing/fuzz_header_parsing.c
+new file mode 100644
+index 00000000..a8e5c1f9
+--- /dev/null
++++ b/fuzzing/fuzz_header_parsing.c
+@@ -0,0 +1,19 @@
++#include "fuzz.h"
++
++int
++LLVMFuzzerTestOneInput (const unsigned char *data, size_t size)
++{
++        GHashTable *elements;
++
++        // We only accept NUL terminated strings
++        if (!size || data[size - 1] != '\0')
++                return 0;
++
++        fuzz_set_logging_func ();
++
++        elements = soup_header_parse_param_list((char*)data);
++
++        g_hash_table_unref(elements);
++
++        return 0;
++}
+\ No newline at end of file
+diff --git a/fuzzing/fuzz_header_parsing.dict b/fuzzing/fuzz_header_parsing.dict
+new file mode 100644
+index 00000000..1562ca3a
+--- /dev/null
++++ b/fuzzing/fuzz_header_parsing.dict
+@@ -0,0 +1,8 @@
++"*=UTF-8''"
++"*=iso-8859-1''"
++"'"
++"''"
++"="
++"*="
++"""
++";"
+\ No newline at end of file
+diff --git a/fuzzing/meson.build b/fuzzing/meson.build
+index b14cbb50..5dd0f417 100644
+--- a/fuzzing/meson.build
++++ b/fuzzing/meson.build
+@@ -5,6 +5,7 @@ fuzz_targets = [
+   'fuzz_cookie_parse',
+   'fuzz_content_sniffer',
+   'fuzz_date_time',
++  'fuzz_header_parsing',
+ ]
+ 
+ fuzzing_args = '-fsanitize=fuzzer,address,undefined'
+@@ -34,6 +35,7 @@ if have_fuzzing and (fuzzing_feature.enabled() or fuzzing_feature.auto())
+         '-runs=200000',
+         '-artifact_prefix=meson-logs/' + target + '-',
+         '-print_final_stats=1',
++        '-max_len=4096',
+       ] + extra_args,
+       env: [
+         'ASAN_OPTIONS=fast_unwind_on_malloc=0',
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-2.patch
new file mode 100644
index 0000000000..7e0d81ba4c
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-2.patch
@@ -0,0 +1,40 @@
+From 825fda3425546847b42ad5270544e9388ff349fe Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Tue, 27 Aug 2024 13:52:08 -0500
+Subject: [PATCH] tests: Add test for passing invalid UTF-8 to
+ soup_header_parse_semi_param_list()
+
+CVE: CVE-2024-52531
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=825fda3425546847b42ad5270544e9388ff349fe]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/header-parsing-test.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 715c2c6f..5e423d2b 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -825,6 +825,17 @@ static struct ParamListTest {
+ 	    { "filename", "t\xC3\xA9st.txt" },
+ 	  },
+ 	},
++
++        /* This tests invalid UTF-8 data which *should* never be passed here but it was designed to be robust against it. */
++        { TRUE,
++              "invalid*=\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; filename*=iso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; foo",
++              {
++                    { "filename", "i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
++                    { "invalid", "\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
++                    { "foo", NULL },
++
++                },
++        }
+ };
+ static const int num_paramlisttests = G_N_ELEMENTS (paramlisttests);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-3.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-3.patch
new file mode 100644
index 0000000000..a47c8747c5
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-3.patch
@@ -0,0 +1,136 @@
+From a35222dd0bfab2ac97c10e86b95f762456628283 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Tue, 27 Aug 2024 13:53:26 -0500
+Subject: [PATCH] headers: Be more robust against invalid input when parsing
+ params
+
+If you pass invalid input to a function such as soup_header_parse_param_list_strict()
+it can cause an overflow if it decodes the input to UTF-8.
+
+This should never happen with valid UTF-8 input which libsoup's client API
+ensures, however it's server API does not currently.
+
+CVE: CVE-2024-52531
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=a35222dd0bfab2ac97c10e86b95f762456628283]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ libsoup/soup-headers.c | 46 ++++++++++++++++++++++--------------------
+ 1 file changed, 24 insertions(+), 22 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index f30ee467..613e1905 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -646,8 +646,9 @@ soup_header_contains (const char *header, const char *token)
+ }
+ 
+ static void
+-decode_quoted_string (char *quoted_string)
++decode_quoted_string_inplace (GString *quoted_gstring)
+ {
++	char *quoted_string = quoted_gstring->str;
+ 	char *src, *dst;
+ 
+ 	src = quoted_string + 1;
+@@ -661,10 +662,11 @@ decode_quoted_string (char *quoted_string)
+ }
+ 
+ static gboolean
+-decode_rfc5987 (char *encoded_string)
++decode_rfc5987_inplace (GString *encoded_gstring)
+ {
+ 	char *q, *decoded;
+ 	gboolean iso_8859_1 = FALSE;
++	const char *encoded_string = encoded_gstring->str;
+ 
+ 	q = strchr (encoded_string, '\'');
+ 	if (!q)
+@@ -696,14 +698,7 @@ decode_rfc5987 (char *encoded_string)
+ 		decoded = utf8;
+ 	}
+ 
+-	/* If encoded_string was UTF-8, then each 3-character %-escape
+-	 * will be converted to a single byte, and so decoded is
+-	 * shorter than encoded_string. If encoded_string was
+-	 * iso-8859-1, then each 3-character %-escape will be
+-	 * converted into at most 2 bytes in UTF-8, and so it's still
+-	 * shorter.
+-	 */
+-	strcpy (encoded_string, decoded);
++	g_string_assign (encoded_gstring, decoded);
+ 	g_free (decoded);
+ 	return TRUE;
+ }
+@@ -713,15 +708,17 @@ parse_param_list (const char *header, char delim, gboolean strict)
+ {
+ 	GHashTable *params;
+ 	GSList *list, *iter;
+-	char *item, *eq, *name_end, *value;
+-	gboolean override, duplicated;
+ 
+ 	params = g_hash_table_new_full (soup_str_case_hash, 
+ 					soup_str_case_equal,
+-					g_free, NULL);
++					g_free, g_free);
+ 
+ 	list = parse_list (header, delim);
+ 	for (iter = list; iter; iter = iter->next) {
++		char *item, *eq, *name_end;
++		gboolean override, duplicated;
++		GString *parsed_value = NULL;
++
+ 		item = iter->data;
+ 		override = FALSE;
+ 
+@@ -736,19 +733,19 @@ parse_param_list (const char *header, char delim, gboolean strict)
+ 
+ 			*name_end = '\0';
+ 
+-			value = (char *)skip_lws (eq + 1);
++			parsed_value = g_string_new ((char *)skip_lws (eq + 1));
+ 
+ 			if (name_end[-1] == '*' && name_end > item + 1) {
+ 				name_end[-1] = '\0';
+-				if (!decode_rfc5987 (value)) {
++				if (!decode_rfc5987_inplace (parsed_value)) {
++					g_string_free (parsed_value, TRUE);
+ 					g_free (item);
+ 					continue;
+ 				}
+ 				override = TRUE;
+-			} else if (*value == '"')
+-				decode_quoted_string (value);
+-		} else
+-			value = NULL;
++			} else if (parsed_value->str[0] == '"')
++				decode_quoted_string_inplace (parsed_value);
++		}
+ 
+ 		duplicated = g_hash_table_lookup_extended (params, item, NULL, NULL);
+ 
+@@ -756,11 +753,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
+ 			soup_header_free_param_list (params);
+ 			params = NULL;
+ 			g_slist_foreach (iter, (GFunc)g_free, NULL);
++			if (parsed_value)
++				g_string_free (parsed_value, TRUE);
+ 			break;
+-		} else if (override || !duplicated)
+-			g_hash_table_replace (params, item, value);
+-		else
++		} else if (override || !duplicated) {
++			g_hash_table_replace (params, item, parsed_value ? g_string_free (parsed_value, FALSE) : NULL);
++		} else {
++			if (parsed_value)
++				g_string_free (parsed_value, TRUE);
+ 			g_free (item);
++		}
+ 	}
+ 
+ 	g_slist_free (list);
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 0e66715589..b2e32b892a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -14,6 +14,10 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52532-0001.patch \
            file://CVE-2024-52532-0002.patch \
+           file://CVE-2024-52530.patch \
+           file://CVE-2024-52531-1.patch \
+           file://CVE-2024-52531-2.patch \
+           file://CVE-2024-52531-3.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


