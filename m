Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F946E98FBF
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:16:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126101.1775715405298552858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qxwyb+Pn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394ik6l1723129
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Apr 2026 06:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Ejp+Tdnhp2xtmYjq2PyNMa99b0ubiZH3u7tY035cZGU=; b=Qxwyb+Pn2kr7
	d4JBzqKIMYXhcSBlelvlhNuVuoJbbIrEkuFI/z7QQjbK9pGCJrcyjV6cJIEykzSR
	sdTVpNfiruAph/s/FeuhEnVpddeux2w/UdlsRCfubMLHyMiAU1u8Wyr7xqYjX/Gj
	ry1iLDvIp9G+WdVYzb/5Tmi0cd/CJkGU6b5pzCBXoFpXp2JzAcaLl7sBWjyEaKte
	TpTgbx4tVOc7d5ifoQuReSAW3k6BQni9mQh2iUag/jOz1rwj9HuJSV00njpGzF2w
	1bQa7+A89fLuMmObBHfAGP81c9LsI+ILEmBfbEit2HPnlfSNq0I1oTWbArKgB3Lv
	LuvNTYn5gw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrybr22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:43 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:42 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:42 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 02/12] libsoup: fix CVE-2025-14523/CVE-2025-32049
Date: Thu, 9 Apr 2026 14:16:29 +0800
Message-ID: <20260409061639.1688205-3-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d7444c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=GHR8O2WEAAAA:20 a=A1X0JdhQAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=QIhr-27iAAAA:8 a=vggBfdFIAAAA:8 a=rx_AovpYf663lZIAXkQA:9
 a=x0VARC6ywv8H5U4u:21 a=FdTzh2GWekK77mhwV6Dw:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-GUID: GjsVNAD6UNiH3KRjqpCBV3EuhdGTX2Kq
X-Proofpoint-ORIG-GUID: GjsVNAD6UNiH3KRjqpCBV3EuhdGTX2Kq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX5gyi9nM+WX8h
 Vfjyt5ZjPn2pnUL9cfalEWlpaiLvyvUP5+eHVJP3Z+BZO2loqrFaNLqWJibNpcsB31syd0NScyZ
 nImhXNgq4Slup/b4TXLrlxAExOJB6qxt2lgNbaj6g7AtAQbMMhFDNWET8/tjqKYJKl/j4zwnpSz
 +1CljKzYlaJXeeg63CQWBeXTpnNK7tD/KXFzeLMeWruutrBVg725upafdQXJKC/hqMOpMo54xsa
 kmKkqmtsz/19rGMjwh7Yy9FyL+VVsijF4sj9YX8nM4eRbCDx9askdqRwUa6KgJrLiZCh9NSYTK6
 WfR8T/Nx+ibIMDfOHqYJc4cq9Kljd5AiyYugBmFFjUdJE9HeZUc62wsheQG6k01yByk5gLP/4cr
 zh7yqg7/BnATRLkdfjWXMpHTKdQ9pSMqt8e2SsLWWHsf/mk/vYNKkTdNMpZveJlsZEcf/MHFYAb
 Fz/9KcL7gls5RIRX4vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234879

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/472
https://gitlab.gnome.org/GNOME/libsoup/-/issues/390

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../libsoup-3.4.4/CVE-2025-14523.patch        | 715 ++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32049-1.patch      | 229 ++++++
 .../libsoup-3.4.4/CVE-2025-32049-2.patch      |  34 +
 .../libsoup-3.4.4/CVE-2025-32049-3.patch      | 134 ++++
 .../libsoup-3.4.4/CVE-2025-32049-4.patch      | 292 +++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   5 +
 6 files changed, 1409 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..b90f8bd29d
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472]
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
new file mode 100644
index 0000000000..0772c759dc
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
@@ -0,0 +1,229 @@
+From 176cb31003252a69d3fc7908e8f505c0ee006b7a Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 24 Jul 2024 15:20:35 +0200
+Subject: [PATCH 1/4] websocket: add a way to restrict the total message size
+
+Otherwise a client could send small packages smaller than
+total-incoming-payload-size but still to break the server
+with a big allocation
+
+Fixes: #390
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/websocket/soup-websocket-connection.c | 107 +++++++++++++++++-
+ libsoup/websocket/soup-websocket-connection.h |   7 ++
+ 2 files changed, 110 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index 5eb8150..19bdd39 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -84,7 +84,7 @@ enum {
+ 	PROP_MAX_INCOMING_PAYLOAD_SIZE,
+ 	PROP_KEEPALIVE_INTERVAL,
+ 	PROP_EXTENSIONS,
+-
++	PROP_MAX_TOTAL_MESSAGE_SIZE,
+         LAST_PROPERTY
+ };
+ 
+@@ -126,6 +126,7 @@ typedef struct {
+ 	char *origin;
+ 	char *protocol;
+ 	guint64 max_incoming_payload_size;
++	guint64 max_total_message_size;
+ 	guint keepalive_interval;
+ 
+ 	gushort peer_close_code;
+@@ -156,6 +157,7 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -670,8 +672,8 @@ bad_data_error_and_close (SoupWebsocketConnection *self)
+ }
+ 
+ static void
+-too_big_error_and_close (SoupWebsocketConnection *self,
+-                         guint64 payload_len)
++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self,
++                                          guint64 payload_len)
+ {
+         SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
+ 	GError *error;
+@@ -687,6 +689,24 @@ too_big_error_and_close (SoupWebsocketConnection *self,
+ 	emit_error_and_close (self, error, TRUE);
+ }
+ 
++static void
++too_big_message_error_and_close (SoupWebsocketConnection *self,
++                                 guint64 len)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++	GError *error;
++
++	error = g_error_new_literal (SOUP_WEBSOCKET_ERROR,
++				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
++				     priv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ?
++				     "Received WebSocket payload from the client larger than configured max-total-message-size" :
++				     "Received WebSocket payload from the server larger than configured max-total-message-size");
++	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater, but max supported size is %" G_GUINT64_FORMAT,
++	         priv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ? "server" : "client",
++	         len, priv->max_total_message_size);
++	emit_error_and_close (self, error, TRUE);
++}
++
+ static void
+ close_connection (SoupWebsocketConnection *self,
+                   gushort                  code,
+@@ -918,6 +938,12 @@ process_contents (SoupWebsocketConnection *self,
+ 		switch (priv->message_opcode) {
+ 		case 0x01:
+ 		case 0x02:
++			/* Safety valve */
++			if (priv->max_total_message_size > 0 &&
++			    (priv->message_data->len + payload_len) > priv->max_total_message_size) {
++				too_big_message_error_and_close (self, (priv->message_data->len + payload_len));
++				return;
++			}
+ 			g_byte_array_append (priv->message_data, payload, payload_len);
+ 			break;
+ 		default:
+@@ -1056,7 +1082,7 @@ process_frame (SoupWebsocketConnection *self)
+ 	/* Safety valve */
+ 	if (priv->max_incoming_payload_size > 0 &&
+ 	    payload_len > priv->max_incoming_payload_size) {
+-		too_big_error_and_close (self, payload_len);
++		too_big_incoming_payload_error_and_close (self, payload_len);
+ 		return FALSE;
+ 	}
+ 
+@@ -1363,6 +1389,10 @@ soup_websocket_connection_get_property (GObject *object,
+ 		g_value_set_pointer (value, priv->extensions);
+ 		break;
+ 
++        case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		g_value_set_uint64 (value, priv->max_total_message_size);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1416,6 +1446,10 @@ soup_websocket_connection_set_property (GObject *object,
+ 		priv->extensions = g_value_get_pointer (value);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		priv->max_total_message_size = g_value_get_uint64 (value);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1628,6 +1662,26 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                       G_PARAM_CONSTRUCT_ONLY |
+                                       G_PARAM_STATIC_STRINGS);
+ 
++	/**
++	 * SoupWebsocketConnection:max-total-message-size:
++	 *
++	 * The total message size for incoming packets.
++	 *
++	 * The protocol expects or 0 to not limit it.
++	 *
++	 * Since: 3.8
++	 */
++        properties[PROP_MAX_TOTAL_MESSAGE_SIZE] =
++                g_param_spec_uint64 ("max-total-message-size",
++                                     "Max total message size",
++                                     "Max total message size ",
++                                     0,
++                                     G_MAXUINT64,
++                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                     G_PARAM_READWRITE |
++                                     G_PARAM_CONSTRUCT |
++                                     G_PARAM_STATIC_STRINGS);
++
+         g_object_class_install_properties (gobject_class, LAST_PROPERTY, properties);
+ 
+ 	/**
+@@ -2111,6 +2165,51 @@ soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection
+ 	}
+ }
+ 
++/**
++ * soup_websocket_connection_get_max_total_message_size:
++ * @self: the WebSocket
++ *
++ * Gets the maximum total message size allowed for packets.
++ *
++ * Returns: the maximum total message size.
++ *
++ * Since: 3.8
++ */
++guint64
++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *self)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++
++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++
++	return priv->max_total_message_size;
++}
++
++/**
++ * soup_websocket_connection_set_max_total_message_size:
++ * @self: the WebSocket
++ * @max_total_message_size: the maximum total message size
++ *
++ * Sets the maximum total message size allowed for packets.
++ *
++ * It does not limit the outgoing packet size.
++ *
++ * Since: 3.8
++ */
++void
++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConnection *self,
++                                                      guint64                  max_total_message_size)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++
++	g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
++
++	if (priv->max_total_message_size != max_total_message_size) {
++		priv->max_total_message_size = max_total_message_size;
++		g_object_notify_by_pspec (G_OBJECT (self), properties[PROP_MAX_TOTAL_MESSAGE_SIZE]);
++	}
++}
++
+ /**
+  * soup_websocket_connection_get_keepalive_interval:
+  * @self: the WebSocket
+diff --git a/libsoup/websocket/soup-websocket-connection.h b/libsoup/websocket/soup-websocket-connection.h
+index eeb093d..922de56 100644
+--- a/libsoup/websocket/soup-websocket-connection.h
++++ b/libsoup/websocket/soup-websocket-connection.h
+@@ -88,6 +88,13 @@ SOUP_AVAILABLE_IN_ALL
+ void                soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection *self,
+                                                                              guint64                  max_incoming_payload_size);
+ 
++SOUP_AVAILABLE_IN_3_0
++guint64             soup_websocket_connection_get_max_total_message_size    (SoupWebsocketConnection *self);
++
++SOUP_AVAILABLE_IN_3_0
++void                soup_websocket_connection_set_max_total_message_size    (SoupWebsocketConnection *self,
++                                                                             guint64                  max_total_message_size);
++
+ SOUP_AVAILABLE_IN_ALL
+ guint               soup_websocket_connection_get_keepalive_interval (SoupWebsocketConnection *self);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
new file mode 100644
index 0000000000..6f00fabfdb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
@@ -0,0 +1,34 @@
+From 81eb7cf7422878f0b78b833a3b741f734502921f Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Fri, 20 Sep 2024 12:12:38 +0200
+Subject: [PATCH 2/4] websocket-test: set the total message size
+
+This is required when sending a big amount of data
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4904a46a2d9a014efa6be01a186ac353dbf5047b]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index a0b8334..827b041 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -567,6 +567,11 @@ test_send_big_packets (Test *test,
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+ 	g_assert (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
+ 
++	soup_websocket_connection_set_max_total_message_size (test->client, 1000 * 1000 + 1);
++	g_assert (soup_websocket_connection_get_max_total_message_size (test->client) == (1000 * 1000 + 1));
++	soup_websocket_connection_set_max_total_message_size (test->server, 1000 * 1000 + 1);
++	g_assert (soup_websocket_connection_get_max_total_message_size (test->server) == (1000 * 1000 + 1));
++
+ 	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+ 	WAIT_UNTIL (received != NULL);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
new file mode 100644
index 0000000000..29fb0d7ddb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
@@ -0,0 +1,134 @@
+From 25616e1a958bc1503cc24d6845a6e80ffc287727 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 8 May 2025 16:16:25 -0500
+Subject: [PATCH] Set message size limit in SoupServer rather than
+ SoupWebsocketConnection
+
+We're not sure about the compatibility implications of having a default
+size limit for clients.
+
+Also not sure whether the server limit is actually set appropriately,
+but there is probably very little server usage of
+SoupWebsocketConnection in the wild, so it's not so likely to break
+things.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/server/soup-server.c                  | 24 +++++++++++++----
+ libsoup/websocket/soup-websocket-connection.c | 26 +++++++++++++------
+ 2 files changed, 37 insertions(+), 13 deletions(-)
+
+diff --git a/libsoup/server/soup-server.c b/libsoup/server/soup-server.c
+index 6b486f5..c779f7d 100644
+--- a/libsoup/server/soup-server.c
++++ b/libsoup/server/soup-server.c
+@@ -186,6 +186,16 @@ static GParamSpec *properties[LAST_PROPERTY] = { NULL, };
+ 
+ G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
+ 
++/* SoupWebsocketConnection by default limits only maximum packet size. But a
++ * message may consist of multiple packets, so SoupServer additionally restricts
++ * total message size to mitigate denial of service attacks on the server.
++ * SoupWebsocketConnection does not do this by default because I don't know
++ * whether that would or would not cause compatibility problems for websites.
++ *
++ * This size is in bytes and it is arbitrary.
++ */
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
++
+ static void request_finished (SoupServerMessage      *msg,
+                               SoupMessageIOCompletion completion,
+                               SoupServer             *server);
+@@ -937,11 +947,15 @@ complete_websocket_upgrade (SoupServer        *server,
+ 
+ 	g_object_ref (msg);
+ 	stream = soup_server_message_steal_connection (msg);
+-	conn = soup_websocket_connection_new (stream, uri,
+-					      SOUP_WEBSOCKET_CONNECTION_SERVER,
+-					      soup_message_headers_get_one_common (soup_server_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),
+-					      soup_message_headers_get_one_common (soup_server_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
+-					      handler->websocket_extensions);
++	conn = SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_CONNECTION,
++					  "io-stream", stream,
++					  "uri", uri,
++					  "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
++					  "origin", soup_message_headers_get_one_common (soup_server_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),
++					  "protocol", soup_message_headers_get_one_common (soup_server_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
++					  "extensions", handler->websocket_extensions,
++					  "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					  NULL));
+ 	handler->websocket_extensions = NULL;
+ 	g_object_unref (stream);
+ 
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index 26476df..cbb1b72 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -149,7 +149,6 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
+-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -1612,9 +1611,10 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-incoming-payload-size:
+ 	 *
+-	 * The maximum payload size for incoming packets.
+-	 *
+-	 * The protocol expects or 0 to not limit it.
++     * The maximum payload size for incoming packets, or 0 to not limit it.
++     *
++     * Each message may consist of multiple packets, so also refer to
++     * [property@WebSocketConnection:max-total-message-size].
+ 	 */
+         properties[PROP_MAX_INCOMING_PAYLOAD_SIZE] =
+                 g_param_spec_uint64 ("max-incoming-payload-size",
+@@ -1662,9 +1662,19 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-total-message-size:
+ 	 *
+-	 * The total message size for incoming packets.
++	 * The maximum size for incoming messages.
++	 *
++	 * Set to a value to limit the total message size, or 0 to not
++	 * limit it.
++	 *
++	 * [method@Server.add_websocket_handler] will set this to a nonzero
++	 * default value to mitigate denial of service attacks. Clients must
++	 * choose their own default if they need to mitigate denial of service
++	 * attacks. You also need to set your own default if creating your own
++	 * server SoupWebsocketConnection without using SoupServer.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-incoming-payload-size].
+ 	 *
+ 	 * Since: 3.8
+ 	 */
+@@ -1674,7 +1684,7 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                      "Max total message size ",
+                                      0,
+                                      G_MAXUINT64,
+-                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                     0,
+                                      G_PARAM_READWRITE |
+                                      G_PARAM_CONSTRUCT |
+                                      G_PARAM_STATIC_STRINGS);
+@@ -2164,7 +2174,7 @@ soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *s
+ {
+ 	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
+ 
+-	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
+ 
+ 	return priv->max_total_message_size;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
new file mode 100644
index 0000000000..6f391e98e2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
@@ -0,0 +1,292 @@
+From 3c87790a4ba141125e6ba165c478f0440e8e693e Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Fri, 16 May 2025 16:55:40 -0500
+Subject: [PATCH 4/4] Add tests for max-incoming-packet-size and
+ max-total-message-size
+
+An even better test would verify that it's possible to send big messages
+containing small packets, but libsoup doesn't offer control over packet
+size, and I don't want to take the time to learn how WebSockets work to
+figure out how to do that manually. Instead, I just check that both
+limits work, for both client and server.
+
+I didn't add deflate variants of these tests because I doubt that would
+add valuable coverage.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4d00b45b7eebdcfa0706b58e34c40b8a0a16015b]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 214 +++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 197 insertions(+), 17 deletions(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 827b041..ec1324c 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -543,16 +543,9 @@ test_send_big_packets (Test *test,
+ {
+ 	GBytes *sent = NULL;
+ 	GBytes *received = NULL;
++	gulong signal_id;
+ 
+-	g_signal_connect (test->client, "message", G_CALLBACK (on_text_message), &received);
+-
+-	sent = g_bytes_new_take (g_strnfill (400, '!'), 400);
+-	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+-	WAIT_UNTIL (received != NULL);
+-	g_assert (g_bytes_equal (sent, received));
+-	g_bytes_unref (sent);
+-	g_bytes_unref (received);
+-	received = NULL;
++	signal_id = g_signal_connect (test->client, "message", G_CALLBACK (on_text_message), &received);
+ 
+ 	sent = g_bytes_new_take (g_strnfill (100 * 1000, '?'), 100 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+@@ -563,23 +556,174 @@ test_send_big_packets (Test *test,
+ 	received = NULL;
+ 
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->client, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_incoming_payload_size (test->client) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 1000 * 1000 + 1);
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 1000 * 1000 + 1);
+ 
+ 	soup_websocket_connection_set_max_total_message_size (test->client, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_total_message_size (test->client) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 1000 * 1000 + 1);
+ 	soup_websocket_connection_set_max_total_message_size (test->server, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_total_message_size (test->server) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 1000 * 1000 + 1);
+ 
+ 	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+ 	WAIT_UNTIL (received != NULL);
+ 	g_assert (g_bytes_equal (sent, received));
++	g_bytes_unref (received);
++	received = NULL;
++
++	/* Reverse the test and send the big message to the server. */
++	g_signal_handler_disconnect (test->client, signal_id);
++	g_signal_connect (test->server, "message", G_CALLBACK (on_text_message), &received);
++
++	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++	WAIT_UNTIL (received != NULL);
++	g_assert_true (g_bytes_equal (sent, received));
+ 	g_bytes_unref (sent);
+ 	g_bytes_unref (received);
+ }
+ 
++static void
++test_send_big_packets_direct (Test *test,
++                              gconstpointer data)
++{
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++   test_send_big_packets (test, data);
++}
++
++static void
++test_send_big_packets_soup (Test *test,
++                            gconstpointer data)
++{
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++   /* Max total message size defaults to 0 (unlimited), but SoupServer applies its own limit by default. */
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++   test_send_big_packets (test, data);
++}
++
++static void
++test_send_exceeding_client_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++
++   soup_websocket_connection_set_max_incoming_payload_size (test->server, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 0);
++
++   /* The message to the client is dropped due to the client's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   soup_websocket_connection_set_max_incoming_payload_size (test->client, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 0);
++
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++
++   /* The message to the server is dropped due to the server's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_client_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   soup_websocket_connection_set_max_total_message_size (test->client, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 128 * 1024);
++
++   soup_websocket_connection_set_max_total_message_size (test->server, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++   /* The message to the client is dropped due to the client's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   soup_websocket_connection_set_max_total_message_size (test->client, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++   /* Set the server message total message size manually, because its
++    * default is different for direct connection vs. soup connection.
++    */
++   soup_websocket_connection_set_max_total_message_size (test->server, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++   /* The message to the server is dropped due to the server's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++
+ static void
+ test_send_empty_packets (Test *test,
+ 			 gconstpointer data)
+@@ -2064,11 +2208,47 @@ main (int argc,
+ 
+ 	g_test_add ("/websocket/direct/send-big-packets", Test, NULL,
+ 		    setup_direct_connection,
+-		    test_send_big_packets,
++		    test_send_big_packets_direct,
+ 		    teardown_direct_connection);
+ 	g_test_add ("/websocket/soup/send-big-packets", Test, NULL,
+ 		    setup_soup_connection,
+-		    test_send_big_packets,
++		    test_send_big_packets_soup,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-client-max-payload-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_client_max_payload_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-client-max-payload-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_client_max_payload_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-server-max-payload-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_server_max_payload_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-server-max-payload-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_server_max_payload_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-client-max-message-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_client_max_message_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-client-max-message-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_client_max_message_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-server-max-message-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_server_max_message_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-server-max-message-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_server_max_message_size,
+ 		    teardown_soup_connection);
+ 
+ 	g_test_add ("/websocket/direct/send-empty-packets", Test, NULL,
+@@ -2217,11 +2397,11 @@ main (int argc,
+ 
+ 	g_test_add ("/websocket/direct/deflate-send-big-packets", Test, NULL,
+ 		    setup_direct_connection_with_extensions,
+-		    test_send_big_packets,
++		    test_send_big_packets_direct,
+ 		    teardown_direct_connection);
+ 	g_test_add ("/websocket/soup/deflate-send-big-packets", Test, NULL,
+ 		    setup_soup_connection_with_extensions,
+-		    test_send_big_packets,
++		    test_send_big_packets_soup,
+ 		    teardown_soup_connection);
+ 
+ 	g_test_add ("/websocket/direct/deflate-send-empty-packets", Test, NULL,
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index c09b06fec2..fc4a286dcf 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -46,6 +46,11 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
            file://CVE-2025-12105.patch \
+           file://CVE-2025-14523.patch \
+           file://CVE-2025-32049-1.patch \
+           file://CVE-2025-32049-2.patch \
+           file://CVE-2025-32049-3.patch \
+           file://CVE-2025-32049-4.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


