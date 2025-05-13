Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6B2C3ABD7
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 10:52:01 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.72962.1747133520291574943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 03:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CwMc66Nb;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7423fadbe77so3879614b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 03:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747133519; x=1747738319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6PrZlRI6otvXxvG3NM2TXcXmdxNhA87VpVg2gvmR6I=;
        b=CwMc66NbtjJpKDTaPhlIcS+Yp/0kZXx1VnRlmN1+mDfHrJwVIrO1xQdiK5y+nkcOMy
         rhoIrN1oYIDNIC5/z6FjpaZlfjWIr2R7u1NGyC07os+bcpl1laNauW/D9khumxQmTDgV
         FTAHYw3RQ7aiT7OFrsoWJmjgRUWkIL2LPL7G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133519; x=1747738319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6PrZlRI6otvXxvG3NM2TXcXmdxNhA87VpVg2gvmR6I=;
        b=A8Gm7jWVUFno2m+/lDsBxhPaSGjAMQMkJ2evCViRBzdAHHjlVWhe9F/FkECGMCNQoj
         S8kY52Axy6GqUW64x0hSBNsT3ejNGaKwg5hWTyvL8cr2g4UeU1ZiD2Y/tVisH1FiF4tz
         Vvm3efvEVJAxDf3eCu1yXkWDVYFFXGWfWA1fLAL8BWy1s1G+x6Ye/zEk/4Dooxm+UU/b
         GN8tRj+ETfbMZuzNwRM1oPat7MxdjLTa0KYwK9to//5s0Inuyja8pGbS9ki5YeF1QsGr
         Sp+ut7dzlQpqdOrAhBOY/0DOI3CebB0zvJzKd8d/N3AWo9uC3P+QpP6mgLkr1B1VGQM0
         e/sg==
X-Gm-Message-State: AOJu0YzZToeUccUhggaUh+jC/0nagiFpy2z4GqRqzP+i3JvaLD1ggLAm
	F9ZbPPPWLWb5x8Z7gcTMg3Rhv7HPus7T87R4cpc+TzD11WxXKeaEAqRs4yk7EsxtQTbCJ05yoWR
	FXFw=
X-Gm-Gg: ASbGnctfNv8DY9D9BhD4PuZv3nxrs32TANT/nrLLe/bMoHV1naLgv00zi4itV8tG435
	WSV+alGg81SLV5KEwYgiQTv8LzAo5JqgBxZbOtm/Uvegug4C2zrY6TPn981HLtZ9VVmKhwIyRo4
	Ddx7cb35SK6fx1/3arbp9yZcaEc/6PI/uhbRt9jL48EXqNVmpB7QLCCvx6EgixVOnqxjCwceS+0
	L9ZJzYqjeOsEx/soUr7bSuwOHU3AR1TmyM+nyaEsKBy7O3p6fl+CRTbwlP7KZ2zUCE4zNWo+XVP
	Ikl/eKUzHz2puD7l0A2gMPgLBwS0KR2pP8suwN4X21cD4ry4evbn89bNabkIQbA=
X-Google-Smtp-Source: AGHT+IHKCxKo40S2G9jPeVTdUNH7a+srPq1ECJhZStNIvaEF/qJzL/O9TavKGjAZ5ira2Zi353cwUQ==
X-Received: by 2002:a05:6a20:7d9e:b0:1fd:f4df:9a89 with SMTP id adf61e73a8af0-215abb3ba50mr19328082637.25.1747133519359;
        Tue, 13 May 2025 03:51:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d861sm7796759b3a.147.2025.05.13.03.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:51:58 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 7/7] libsoup: Fix CVE-2025-32914
Date: Tue, 13 May 2025 16:21:29 +0530
Message-Id: <20250513105129.2284690-7-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513105129.2284690-1-vanusuri@mvista.com>
References: <20250513105129.2284690-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 10:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216417

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/5bfcf8157597f2d327050114fb37ff600004dbcf]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2025-32914.patch      | 111 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch
new file mode 100644
index 0000000000..0ada9f3134
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch
@@ -0,0 +1,111 @@
+From 5bfcf8157597f2d327050114fb37ff600004dbcf Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 09:03:00 +0200
+Subject: [PATCH] multipart: Fix read out of buffer bounds under
+ soup_multipart_new_from_message()
+
+This is CVE-2025-32914, special crafted input can cause read out of buffer bounds
+of the body argument.
+
+Closes #436
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/5bfcf8157597f2d327050114fb37ff600004dbcf]
+CVE: CVE-2025-32914
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 58 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index 2421c91f8..102ce3722 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -173,7 +173,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 			return NULL;
+ 		}
+ 
+-		split = strstr (start, "\r\n\r\n");
++		split = g_strstr_len (start, body_end - start, "\r\n\r\n");
+ 		if (!split || split > end) {
+ 			soup_multipart_free (multipart);
+ 			return NULL;
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 2c0e7e969..f5b986889 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -471,6 +471,62 @@ test_multipart (gconstpointer data)
+ 	loop = NULL;
+ }
+ 
++static void
++test_multipart_bounds_good (void)
++{
++	#define TEXT "line1\r\nline2"
++	SoupMultipart *multipart;
++	SoupMessageHeaders *headers, *set_headers = NULL;
++	GBytes *bytes, *set_bytes = NULL;
++	const char *raw_data = "--123\r\nContent-Type: text/plain;\r\n\r\n" TEXT "\r\n--123--\r\n";
++	gboolean success;
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	multipart = soup_multipart_new_from_message (headers, bytes);
++
++	g_assert_nonnull (multipart);
++	g_assert_cmpint (soup_multipart_get_length (multipart), ==, 1);
++	success = soup_multipart_get_part (multipart, 0, &set_headers, &set_bytes);
++	g_assert_true (success);
++	g_assert_nonnull (set_headers);
++	g_assert_nonnull (set_bytes);
++	g_assert_cmpint (strlen (TEXT), ==, g_bytes_get_size (set_bytes));
++	g_assert_cmpstr ("text/plain", ==, soup_message_headers_get_content_type (set_headers, NULL));
++	g_assert_cmpmem (TEXT, strlen (TEXT), g_bytes_get_data (set_bytes, NULL), g_bytes_get_size (set_bytes));
++
++	soup_message_headers_unref (headers);
++	g_bytes_unref (bytes);
++
++	soup_multipart_free (multipart);
++
++	#undef TEXT
++}
++
++static void
++test_multipart_bounds_bad (void)
++{
++	SoupMultipart *multipart;
++	SoupMessageHeaders *headers;
++	GBytes *bytes;
++	const char *raw_data = "--123\r\nContent-Type: text/plain;\r\nline1\r\nline2\r\n--123--\r\n";
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	/* it did read out of raw_data/bytes bounds */
++	multipart = soup_multipart_new_from_message (headers, bytes);
++	g_assert_null (multipart);
++
++	soup_message_headers_unref (headers);
++	g_bytes_unref (bytes);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -498,6 +554,8 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/sync", GINT_TO_POINTER (SYNC_MULTIPART), test_multipart);
+ 	g_test_add_data_func ("/multipart/async", GINT_TO_POINTER (ASYNC_MULTIPART), test_multipart);
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
++	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
++	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index dbf437c42f..87ffb34f7d 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32911_CVE-2025-32913-2.patch \
            file://CVE-2025-32912-1.patch \
            file://CVE-2025-32912-2.patch \
+           file://CVE-2025-32914.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.25.1


