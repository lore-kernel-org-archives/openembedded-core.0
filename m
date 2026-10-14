Return-Path: <jason.stasiak@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0B4CC6B2C
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 16:12:45 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17970.1791994355673933917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 09:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qnMHYfQ/;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: jason.stasiak@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33c2520ad38so9804885eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 09:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791994355; x=1792599155; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btzZMfBCuoA87eUiBLyqdJY9mxEMNAZJDdE/DiJrZZo=;
        b=qnMHYfQ/A03i+57pZzUWSqSApNmOJ/0rEidquIQaYzF/zkxY5supOWHaK14zHSCs29
         iL5xkNQXwieJacVV8Kcs184HI4VKllEbxk1rhgEgqOjy8hqNO9DdT734DpJa5BEagDM1
         QxSApJ9TFe8DmIG/0pWpb4NmRvKH6WhCc3KAXUE4A+N9Rzf7jarlX3JhPZ2iOQCCvFdr
         EAVkhWhsJlc5uBkwaT0KIB46Ho28FjgOAN4FlSK9LEqKhFaBAZCb7gU4krSa6HihMrky
         Nv+FOh96LGZXljqM6Eeile6stSCGi1AWB/SNL9x6+YZ1R2kf6DByMkC1SjYFakBTq9L/
         Q3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994355; x=1792599155;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btzZMfBCuoA87eUiBLyqdJY9mxEMNAZJDdE/DiJrZZo=;
        b=B96NoWRYMARrkSuHRxSPm19uubqwjbhQDnCMP7pV1zPZ88ZOYoVTn+Uo6anUtRzQbJ
         NOREPsucV9iqBijapRlNtcXSbJ3JMRcvzDhBjo0X16ngk1k+RuIbHSJnfJgK+NmjXVQV
         iXoT7lGijWBjWe5xFz1jFyfVx6knlPqRmpvjyfTtOmr4daCgQVvHZwtPKzkPqHHkDtPx
         lzlBdeGuZCFX7uTEzW9yHt0JxO3okzR7GdNNl85ayxdqWLEhCiyL477KIF5oaRErBa69
         MrmLZxXc4MewaOwxc8wsmB9FtbI/OvUkmRCJxjJJe+KQHwXH4EyFxq4Canf8jthS3MRW
         wj6Q==
X-Gm-Message-State: AFq9FYLcXuqcRDHwn/OSy9tS0zGVyXNJ+hF3DZrg35fKYjCvLp7WBKhS
	88KLynJnQfrEcRVdhJ/Yn5NUzCcuJsQUXKpOF787AeX7mBdTJt0GOyKj2KoGWw==
X-Gm-Gg: AYBFou2+GK44eP0lQTx0kVobMNe78/tBZm/l0lRJNwtdocbaI4QxLilT6JHyrUgvmcD
	AutnXGmPUo+8RpY1A0w1VyJzSE/+dlsTSMjOICxUbvrQmR/oDYdtM9GsAebrv1ij6GXAFHfvtLB
	iA/DNa2AzvmOPHA8a+5oao/V/vb6irrb4Sm25n8F2dgOzrmYtdxOQTs9X4pIsgqL8utLB2zeIYm
	isP0xzW7853lSVY7qfFiHMMymsUCUqw/pxG6z2/VRu1iynsswoKpC5iYXKrH8x6cx78FAaiyZwO
	6+rZlIy3ofDX+v9IDhrwALqhp6P/IgwFkAFvmG9L1Btv0bbEggGaLhZbMFI7+gFnx6OCiNV2Z1k
	UOCg4j4trPB+ZUCkB4bM7pTWSOw5KIs6WlGt0YIE/qh1Ekio4cyJIHT5R3sOP4kwVheAr/ST4x7
	leWX1QJUtm9ejed9poUQoXhkqFjUFK9Z5HSWZyWvu6by2JxSWqSGgm6UK7nqEe8HUrymj2qmfkl
	NKCHbhaNuWbLw12Fijw
X-Received: by 2002:a05:7301:470e:b0:35c:73ca:a1e0 with SMTP id 5a478bee46e88-35c73caae65mr7230191eec.15.1791994354472;
        Wed, 14 Oct 2026 09:12:34 -0700 (PDT)
Received: from CHA-FQKPM83.ad.garmin.com ([65.175.40.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm36006426eec.19.2026.10.14.09.12.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:12:33 -0700 (PDT)
From: Jason Stasiak <jason.stasiak@gmail.com>
X-Google-Original-From: Jason Stasiak <jason.stasiak@garmin.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 3/5] libsoup-2.4: fix CVE-2026-2443
Date: Wed, 14 Oct 2026 09:12:07 -0700
Message-ID: <20261014161209.2227316-3-jason.stasiak@garmin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014161209.2227316-1-jason.stasiak@garmin.com>
References: <20260929205055.2403390-2-jason.stasiak@gmail.com>
 <20261014161209.2227316-1-jason.stasiak@garmin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 16:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247785

Backport fix for CVE-2026-2443 from meta-oe to OE-core. Update CVE
patch to restore the range-test validation unit test from the
upstream libsoup3 patch (b9a1c0663ff8ab6e79715db4b35b54f560416ddd).

(From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)

Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
---
 .../libsoup/libsoup-2.4/CVE-2026-2443.patch   | 390 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 391 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
new file mode 100644
index 0000000000..e4d5f184fa
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
@@ -0,0 +1,390 @@
+From 7bb3115a296154e3f465900ea5c984a493385a7f Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Fri, 19 Dec 2025 23:49:05 +0000
+Subject: [PATCH] Fix CVE-2026-2443
+
+Upstream-Status: Backport [
+c1796442 soup-message-headers: Rework Range response statuses to match Apache
+191ef313 soup-message-headers: Fix rejection of Range headers with trailing garbage
+be677bea soup-message-headers: Fix parsing of invalid Range suffix lengths
+2bbfdfe8 soup-message-headers: Reject ranges where end is before start
+739bf7cb soup-message-headers: Reject invalid Range ends longer than the content
+]
+CVE: CVE-2026-2443
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Backport the range-test validation unit tests from the upstream libsoup3 patches.
+
+Upstream-Status: Backport [
+5890c42d tests: Add more tests for invalid Range headers
+c1796442 soup-message-headers: Rework Range response statuses to match Apache
+6574a84f tests: Allow range tests to check more response statuses
+191ef313 soup-message-headers: Fix rejection of Range headers with trailing garbage
+be677bea soup-message-headers: Fix parsing of invalid Range suffix lengths
+2bbfdfe8 soup-message-headers: Reject ranges where end is before start
+739bf7cb soup-message-headers: Reject invalid Range ends longer than the content
+]
+
+Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
+---
+ libsoup/soup-message-headers.c |  62 ++++++++++----
+ tests/range-test.c             | 149 ++++++++++++++++++++++++++++-----
+ 2 files changed, 172 insertions(+), 39 deletions(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index ff10e103..f30dd461 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -940,10 +940,16 @@ sort_ranges (gconstpointer a, gconstpointer b)
+ }
+ 
+ /* like soup_message_headers_get_ranges(), except it returns:
+- *   SOUP_STATUS_OK if there is no Range or it should be ignored.
+- *   SOUP_STATUS_PARTIAL_CONTENT if there is at least one satisfiable range.
+- *   SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE if @check_satisfiable
+- *     is %TRUE and the request is not satisfiable given @total_length.
++ *  - SOUP_STATUS_OK if there is no Range or it should be ignored due to being
++ *    entirely invalid.
++ *  - SOUP_STATUS_PARTIAL_CONTENT if there is at least one satisfiable range.
++ *  - SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE if @check_satisfiable
++ *     is %TRUE, the Range is valid, but no part of the request is satisfiable
++ *     given @total_length.
++ *
++ * @ranges and @length are only set if SOUP_STATUS_PARTIAL_CONTENT is returned.
++ *
++ * See https://httpwg.org/specs/rfc9110.html#field.range
+  */
+ guint
+ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+@@ -957,22 +963,28 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 	GArray *array;
+ 	char *spec, *end;
+ 	guint status = SOUP_STATUS_OK;
++	gboolean is_all_valid = TRUE;
+ 
+ 	if (!range || strncmp (range, "bytes", 5) != 0)
+-		return status;
++		return SOUP_STATUS_OK;  /* invalid header or unknown range unit */
+ 
+ 	range += 5;
+ 	while (g_ascii_isspace (*range))
+ 		range++;
+ 	if (*range++ != '=')
+-		return status;
++		return SOUP_STATUS_OK;  /* invalid header */
+ 	while (g_ascii_isspace (*range))
+ 		range++;
+ 
+ 	range_list = soup_header_parse_list (range);
+ 	if (!range_list)
+-		return status;
++		return SOUP_STATUS_OK;  /* invalid list */
+ 
++	/* Loop through the ranges and modify the status accordingly. Default to
++	 * status 200 (OK, ignoring the ranges). Switch to status 206 (Partial
++	 * Content) if there is at least one partially valid range. Switch to
++	 * status 416 (Range Not Satisfiable) if there are no partially valid
++	 * ranges at all. */
+ 	array = g_array_new (FALSE, FALSE, sizeof (SoupRange));
+ 	for (r = range_list; r; r = r->next) {
+ 		SoupRange cur;
+@@ -985,30 +997,44 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 			cur.start = g_ascii_strtoull (spec, &end, 10);
+ 			if (*end == '-')
+ 				end++;
+-			if (*end) {
++			if (*end)
+ 				cur.end = g_ascii_strtoull (end, &end, 10);
+-				if (cur.end < cur.start) {
+-					status = SOUP_STATUS_OK;
+-					break;
+-				}
+-			} else
++			else
+ 				cur.end = total_length - 1;
+ 		}
++
+ 		if (*end) {
+-			status = SOUP_STATUS_OK;
+-			break;
+-		} else if (check_satisfiable && cur.start >= total_length) {
+-			if (status == SOUP_STATUS_OK)
+-				status = SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE;
++			/* Junk after the range */
++			is_all_valid = FALSE;
++			continue;
++		}
++
++		if (cur.end < cur.start) {
++			is_all_valid = FALSE;
++			continue;
++		}
++
++		g_assert (cur.start >= 0);
++		if (cur.end >= total_length)
++			cur.end = total_length - 1;
++
++		if (cur.start >= total_length) {
++			/* Range is valid, but unsatisfiable */
+ 			continue;
+ 		}
+ 
++		/* We have at least one (at least partially) satisfiable range */
+ 		g_array_append_val (array, cur);
+ 		status = SOUP_STATUS_PARTIAL_CONTENT;
+ 	}
+ 	soup_header_free_list (range_list);
+ 
+ 	if (status != SOUP_STATUS_PARTIAL_CONTENT) {
++		g_assert (status == SOUP_STATUS_OK);
++
++		if (is_all_valid && check_satisfiable)
++			status = SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE;
++
+ 		g_array_free (array, TRUE);
+ 		return status;
+ 	}
+diff --git a/tests/range-test.c b/tests/range-test.c
+index d3c49963..8bd0fa1c 100644
+--- a/tests/range-test.c
++++ b/tests/range-test.c
+@@ -57,7 +57,8 @@ check_part (SoupMessageHeaders *headers, const char *body, gsize body_len,
+ 
+ static void
+ do_single_range (SoupSession *session, SoupMessage *msg,
+-		 int start, int end, gboolean succeed)
++		 int start, int end, SoupStatus expected_status,
++		 int expected_start, int expected_end)
+ {
+ 	const char *content_type;
+ 
+@@ -66,7 +67,7 @@ do_single_range (SoupSession *session, SoupMessage *msg,
+ 
+ 	soup_session_send_message (session, msg);
+ 
+-	if (!succeed) {
++	if (expected_status == SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE) {
+ 		soup_test_assert_message_status (msg, SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE);
+ 		if (msg->status_code != SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE) {
+ 			const char *content_range;
+@@ -76,31 +77,78 @@ do_single_range (SoupSession *session, SoupMessage *msg,
+ 			if (content_range)
+ 				debug_printf (1, "    Content-Range: %s\n", content_range);
+ 		}
+-
+ 		g_object_unref (msg);
+ 		return;
++	} else if (expected_status == SOUP_STATUS_OK) {
++		soup_test_assert_message_status (msg, SOUP_STATUS_OK);
++
++		content_type = soup_message_headers_get_content_type(msg->response_headers, NULL);
++		g_assert_cmpstr (content_type, !=, "multipart/byteranges");
++
++		g_assert_false (soup_message_headers_get_content_range (msg->response_headers, NULL,
++			NULL, NULL));
++		g_assert_cmpint (soup_message_headers_get_content_length (msg->response_headers),
++			==, full_response->length);
++		} else {
++		soup_test_assert_message_status (msg, SOUP_STATUS_PARTIAL_CONTENT);
++		content_type = soup_message_headers_get_content_type (msg->response_headers, NULL);
++		g_assert_cmpstr (content_type, !=, "multipart/byteranges");
++
++		check_part (msg->response_headers, msg->response_body->data,
++			msg->response_body->length, TRUE, expected_start, expected_end);
+ 	}
+ 
+-	soup_test_assert_message_status (msg, SOUP_STATUS_PARTIAL_CONTENT);
+-
+-	content_type = soup_message_headers_get_content_type (
+-		msg->response_headers, NULL);
+-	g_assert_cmpstr (content_type, !=, "multipart/byteranges");
+-
+-	check_part (msg->response_headers, msg->response_body->data,
+-		    msg->response_body->length, TRUE, start, end);
+ 	g_object_unref (msg);
+ }
+ 
+ static void
+ request_single_range (SoupSession *session, const char *uri,
+-		      int start, int end, gboolean succeed)
++		      int start, int end, SoupStatus expected_status,
++			  int expected_start, int expected_end)
+ {
+ 	SoupMessage *msg;
+ 
+ 	msg = soup_message_new ("GET", uri);
+ 	soup_message_headers_set_range (msg->request_headers, start, end);
+-	do_single_range (session, msg, start, end, succeed);
++	do_single_range (session, msg, start, end, expected_status, expected_start, expected_end);
++}
++
++/* This always asserts failure (either 406 or 200 with no Content-Range); it’s
++ * intended to be used for passing invalid
++ * Range header formats which can’t be built by calling
++ * soup_message_headers_set_range(). */
++static void
++request_single_range_by_string (SoupSession *session, const char *uri,
++             const char *range, SoupStatus expected_status)
++{
++	SoupMessage *msg;
++
++	msg = soup_message_new ("GET", uri);
++	soup_message_headers_replace (msg->request_headers, "Range", range);
++
++	debug_printf (1, "    Range: %s\n",
++	soup_message_headers_get_one (msg->request_headers, "Range"));
++
++	soup_session_send_message (session, msg);
++
++	if (expected_status == SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE) {
++		soup_test_assert_message_status (msg, SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE);
++	} else {
++		const char *content_type;
++
++		soup_test_assert_message_status (msg, SOUP_STATUS_OK);
++
++		content_type = soup_message_headers_get_content_type (msg->response_headers, NULL);
++		g_assert_cmpstr (content_type, !=, "multipart/byteranges");
++
++		g_assert_false (soup_message_headers_get_content_range (msg->response_headers,
++			NULL, NULL, NULL));
++
++		g_assert_cmpint (soup_message_headers_get_content_length (msg->response_headers),
++			==, full_response->length);
++	}
++
++	g_object_unref (msg);
+ }
+ 
+ static void
+@@ -165,7 +213,9 @@ request_double_range (SoupSession *session, const char *uri,
+ 		do_single_range (session, msg,
+ 				 MIN (first_start, second_start),
+ 				 MAX (first_end, second_end),
+-				 TRUE);
++				 SOUP_STATUS_PARTIAL_CONTENT,
++				 MIN (first_start, second_start),
++				 MAX (first_end, second_end));
+ 	} else
+ 		do_multi_range (session, msg, expected_return_ranges);
+ }
+@@ -193,7 +243,9 @@ request_triple_range (SoupSession *session, const char *uri,
+ 		do_single_range (session, msg,
+ 				 MIN (first_start, MIN (second_start, third_start)),
+ 				 MAX (first_end, MAX (second_end, third_end)),
+-				 TRUE);
++				 SOUP_STATUS_PARTIAL_CONTENT,
++				 MIN (first_start, MIN (second_start, third_start)),
++				 MAX (first_end, MAX (second_end, third_end)));
+ 	} else
+ 		do_multi_range (session, msg, expected_return_ranges);
+ }
+@@ -248,7 +300,8 @@ do_range_test (SoupSession *session, const char *uri,
+ 	debug_printf (1, "Requesting %d-%d\n", 0 * twelfths, 1 * twelfths);
+ 	request_single_range (session, uri,
+ 			      0 * twelfths, 1 * twelfths,
+-			      TRUE);
++			      SOUP_STATUS_PARTIAL_CONTENT,
++			      0 * twelfths, 1 * twelfths);
+ 
+ 	/* B: 11, end-relative request. These two are mostly redundant
+ 	 * in terms of data coverage, but they may still catch
+@@ -257,11 +310,13 @@ do_range_test (SoupSession *session, const char *uri,
+ 	debug_printf (1, "Requesting %d-\n", 11 * twelfths);
+ 	request_single_range (session, uri,
+ 			      11 * twelfths, -1,
+-			      TRUE);
++			      SOUP_STATUS_PARTIAL_CONTENT,
++			      11 * twelfths, -1);
+ 	debug_printf (1, "Requesting -%d\n", 1 * twelfths);
+ 	request_single_range (session, uri,
+ 			      -1 * twelfths, -1,
+-			      TRUE);
++			      SOUP_STATUS_PARTIAL_CONTENT,
++			      -1 * twelfths, -1);
+ 
+ 	/* C: 2 and 5 */
+ 	debug_printf (1, "Requesting %d-%d,%d-%d\n",
+@@ -314,7 +369,8 @@ do_range_test (SoupSession *session, const char *uri,
+ 		      (int) full_response->length + 100);
+ 	request_single_range (session, uri,
+ 			      full_response->length + 1, full_response->length + 100,
+-			      FALSE);
++			      SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE,
++			      0, 0);
+ 
+ 	debug_printf (1, "Requesting (semi-invalid) 1-10,%d-%d,20-30\n",
+ 		      (int) full_response->length + 1,
+@@ -322,7 +378,58 @@ do_range_test (SoupSession *session, const char *uri,
+ 	request_semi_invalid_range (session, uri,
+ 				    1, 10,
+ 				    full_response->length + 1, full_response->length + 100,
+-				    20, 30); 
++				    20, 30);
++
++	debug_printf (1, "Requesting (invalid end) %d-%d\n",
++		      1,
++		      (int) full_response->length + 1000);
++	request_single_range (session, uri,
++			      1, full_response->length + 1000,
++			      SOUP_STATUS_PARTIAL_CONTENT,
++			      1, full_response->length - 1);
++
++	debug_printf (1, "Requesting (end before start) %d-%d\n",
++		      10,
++		      1);
++	request_single_range (session, uri,
++			      10, 1,
++			      SOUP_STATUS_OK,
++			      1, full_response->length);
++
++	debug_printf (1, "Requesting (malformed suffix length) -0\n");
++	request_single_range_by_string (session, uri,
++					"bytes=-0",
++					SOUP_STATUS_OK);
++
++	debug_printf (1, "Requesting (extra content after valid header value) 0-10\n");
++	request_single_range_by_string (session, uri,
++					"bytes=0-10 but with weird trailing content",
++					SOUP_STATUS_OK);
++
++	debug_printf (1, "Requesting (invalid range dash) 0a10\n");
++	request_single_range_by_string (session, uri,
++					"bytes=0a10",
++					SOUP_STATUS_OK);
++
++	debug_printf (1, "Requesting (invalid range unit) 0-10\n");
++	request_single_range_by_string (session, uri,
++					"horses=0-10",
++					SOUP_STATUS_OK);
++
++	debug_printf (1, "Requesting (missing equals) 0-10\n");
++	request_single_range_by_string (session, uri,
++					"bytes 0-10",
++					SOUP_STATUS_OK);
++
++	debug_printf (1, "Requesting (end before start but with whitespace) 10-1\n");
++	request_single_range_by_string (session, uri,
++					"bytes \t = \t 10-1",
++					SOUP_STATUS_OK);
++
++	debug_printf (1, "Requesting (delimiters but no ranges)\n");
++	request_single_range_by_string (session, uri,
++					"bytes=, ,,\t, ",
++					SOUP_STATUS_OK);
+ }
+ 
+ static void
+@@ -341,7 +448,7 @@ do_apache_range_test (void)
+ 
+ static void
+ server_handler (SoupServer        *server,
+-		SoupMessage       *msg, 
++		SoupMessage       *msg,
+ 		const char        *path,
+ 		GHashTable        *query,
+ 		SoupClientContext *client,
+-- 
+2.55.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 9da2dde714..18f82f8ef7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4945.patch \
            file://CVE-2026-1539.patch \
            file://CVE-2026-1801.patch \
+           file://CVE-2026-2443.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.55.0


