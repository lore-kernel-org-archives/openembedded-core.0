Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15953D609BB
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 09:12:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.67852.1732698722466239408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 01:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1061e56c4b=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR4xs5N019240
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:12:01 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618can2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:12:01 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 01:11:59 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 01:11:59 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] libsoup: fix CVE-2024-52530/CVE-2024-52531/CVE-2024-52532
Date: Wed, 27 Nov 2024 17:11:58 +0800
Message-ID: <20241127091158.1928488-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: d98jTluzU7DfAonZm1uSOUKkirMh7UJN
X-Proofpoint-GUID: d98jTluzU7DfAonZm1uSOUKkirMh7UJN
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=6746e261 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=A1X0JdhQAAAA:8 a=vggBfdFIAAAA:8
 a=xNf9USuDAAAA:8 a=i_Dtv0g5stPk0aknyNQA:9 a=GujchVMLVH5Nq9FO:21 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_04,2024-11-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411270075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207917

From: Changqing Li <changqing.li@windriver.com>

CVE-2024-52532:
GNOME libsoup before 3.6.1 has an infinite loop, and memory consumption.
during the reading of certain patterns of WebSocket data from clients.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2024-52532

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
---
 .../libsoup-3.0.7/CVE-2024-52530.patch        | 150 ++++++++++++++++++
 .../libsoup-3.0.7/CVE-2024-52531-1.patch      | 116 ++++++++++++++
 .../libsoup-3.0.7/CVE-2024-52531-2.patch      |  40 +++++
 .../libsoup-3.0.7/CVE-2024-52531-3.patch      | 136 ++++++++++++++++
 .../libsoup-3.0.7/CVE-2024-52532-1.patch      |  75 +++++++++
 .../libsoup-3.0.7/CVE-2024-52532-2.patch      |  46 ++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   8 +-
 7 files changed, 570 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
new file mode 100644
index 0000000000..fb6d5c3c6f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
new file mode 100644
index 0000000000..c8e855c128
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
new file mode 100644
index 0000000000..7e0d81ba4c
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
new file mode 100644
index 0000000000..a47c8747c5
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
new file mode 100644
index 0000000000..9afa1bb6bb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
@@ -0,0 +1,75 @@
+From 6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 11 Sep 2024 11:52:11 +0200
+Subject: [PATCH 1/2] websocket: process the frame as soon as we read data
+
+Otherwise we can enter in a read loop because we were not
+validating the data until the all the data was read.
+
+Fixes #391
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/410/diffs?commit_id=6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/websocket/soup-websocket-connection.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index a1a730473..a14481340 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -1199,9 +1199,9 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
+ 		}
+ 
+ 		priv->incoming->len = len + count;
+-	} while (count > 0);
+ 
+-	process_incoming (self);
++		process_incoming (self);
++	} while (count > 0 && !priv->close_sent && !priv->io_closing);
+ 
+ 	if (end) {
+ 		if (!priv->close_sent || !priv->close_received) {
+-- 
+GitLab
+
+
+From 29b96fab2512666d7241e46c98cc45b60b795c0c Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 2 Oct 2024 11:17:19 +0200
+Subject: [PATCH 2/2] websocket-test: disconnect error copy after the test ends
+
+Otherwise the server will have already sent a few more wrong
+bytes and the client will continue getting errors to copy
+but the error is already != NULL and it will assert
+---
+ tests/websocket-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 06c443bb5..6a48c1f9b 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1539,8 +1539,9 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	GError *error = NULL;
+ 	InvalidEncodeLengthTest context = { test, NULL };
+ 	guint i;
++	guint error_id;
+ 
+-	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
+ 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
+ 
+ 	/* We use 127(\x7f) as payload length with 65535 extended length */
+@@ -1553,6 +1554,7 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++        g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+         g_thread_join (thread);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
new file mode 100644
index 0000000000..6ae7845814
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
@@ -0,0 +1,46 @@
+From 4c9e75c6676a37b6485620c332e568e1a3f530ff Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Wed, 13 Nov 2024 14:14:23 +0000
+Subject: [PATCH] websocket-test: Disconnect error signal in another place
+
+This is the same change as commit 29b96fab "websocket-test: disconnect
+error copy after the test ends", and is done for the same reason, but
+replicating it into a different function.
+
+Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
+Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/410/diffs?commit_id=29b96fab2512666d7241e46c98cc45b60b795c0c]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 6a48c1f9..723f2857 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1508,8 +1508,9 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	GError *error = NULL;
+ 	InvalidEncodeLengthTest context = { test, NULL };
+ 	guint i;
++	guint error_id;
+ 
+-	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
+ 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
+ 
+ 	/* We use 126(~) as payload length with 125 extended length */
+@@ -1522,6 +1523,7 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++        g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+ 	g_thread_join (thread);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 59cc4a1d0a..20578978d7 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -11,7 +11,13 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://CVE-2024-52530.patch \
+           file://CVE-2024-52531-1.patch \
+           file://CVE-2024-52531-2.patch \
+           file://CVE-2024-52531-3.patch \
+           file://CVE-2024-52532-1.patch \
+           file://CVE-2024-52532-2.patch"
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
 PROVIDES = "libsoup-3.0"
-- 
2.25.1


