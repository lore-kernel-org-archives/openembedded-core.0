Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591AED6D254
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 01:47:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.86614.1732758418804031257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 17:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1062ca15bd=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS0f0QR006545
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 17:46:58 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 436719rg0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 17:46:58 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 17:46:57 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 17:46:56 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH V2] libsoup: fix CVE-2024-52531
Date: Thu, 28 Nov 2024 09:46:56 +0800
Message-ID: <20241128014656.2840113-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JtysJZZ2Vv_mxi0isFIu9Bll3hjEcJBl
X-Proofpoint-GUID: JtysJZZ2Vv_mxi0isFIu9Bll3hjEcJBl
X-Authority-Analysis: v=2.4 cv=Z/8WHGRA c=1 sm=1 tr=0 ts=6747cb92 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=uZ5qXiJthfZSyKJJ8b8A:9
 a=AFZSVh-ye9kRu7Yu:21 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-28_01,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2411280013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 01:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207974

From: Changqing Li <changqing.li@windriver.com>

CVE-2024-52531:
GNOME libsoup before 3.6.1 allows a buffer overflow in applications that
perform conversion to UTF-8 in soup_header_parse_param_list_strict.
Input received over the network cannot trigger this.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2024-52531
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup/CVE-2024-52531-1.patch    | 116 +++++++++++++++
 .../libsoup/libsoup/CVE-2024-52531-2.patch    |  40 ++++++
 .../libsoup/libsoup/CVE-2024-52531-3.patch    | 136 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   3 +
 4 files changed, 295 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52531-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52531-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2024-52531-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2024-52531-1.patch
new file mode 100644
index 00000000000..c8e855c1289
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2024-52531-1.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2024-52531-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2024-52531-2.patch
new file mode 100644
index 00000000000..7e0d81ba4c3
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2024-52531-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2024-52531-3.patch b/meta/recipes-support/libsoup/libsoup/CVE-2024-52531-3.patch
new file mode 100644
index 00000000000..a47c8747c56
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2024-52531-3.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 919fef51071..869f0f1696b 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -15,6 +15,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52530.patch \
            file://CVE-2024-52532-1.patch \
            file://CVE-2024-52532-2.patch \
+           file://CVE-2024-52531-1.patch \
+           file://CVE-2024-52531-2.patch \
+           file://CVE-2024-52531-3.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.25.1


