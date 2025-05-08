Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128E6C3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 09:19:02 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.11196.1746695939342518198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 02:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=J2d03E2h;
 spf=pass (domain: mvista.com, ip: 209.85.210.43, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c1425fbfcso662571a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1746695938; x=1747300738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XbFeD3JbSXUBFWR84UR97nuwGlN9fZlvv6QnnzKLwLo=;
        b=J2d03E2hFqrjymeshem4TUEc0g9ams6NejToru89JYUQ/NdL1D8GC/WhFrDkS80nGb
         b1Ab6LuFZhiLTmC01vzqwcCYSnA7OD7g+Ct5H23sAjX1dwKdjPlHLLEmyd4Ctjr0qeEO
         PalrHSsKxSwmazcZCTnLk8BGCn6sNjshXWOEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695938; x=1747300738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbFeD3JbSXUBFWR84UR97nuwGlN9fZlvv6QnnzKLwLo=;
        b=G+gNEF/GG/RQSiCEA0Kzv8eALhGOacICLw38BFYfmRbhvkiDatoVepwgWpRD3BI74F
         I2fulxE7H6S254li9p5W3wX9XvVtXGhujdJn6bmwsOTFkTwXV8xuoznc31/gaUVrkmTr
         9/+6mg9N4CXy/5BNgxHUBs01s6DsY19YnArJyS3wtmsDYkyYgf3PWA4Z7jsu8h6+gVOM
         8fbhLTQWq7ciBKuc26lu9MERjQocdK3WqiYeHU1npYeEu1euoutFYxxWHAhD/XRom8vd
         eKs8Pk5dScbCIeJskjJ3YEWD45MfmAT6z5ttg5awt7RS6TRNhg3bI/1R5b0y+eBL48Yg
         3BdQ==
X-Gm-Message-State: AOJu0Yz/SMceRPiVnjm/STo/axpIYQlW+u5tbk5gcdr8w5tWnThZLGtg
	B5QBY1a0svOrKqcd1JcJ9NW42wrSai8IO32LaSjejNmg68epBiYhmSeCSrOJBQw7cxrsr0a7ner
	Ys8g=
X-Gm-Gg: ASbGncsrbvmvID9W9W/4I2EFFy4Ye4H3MC86e8ZsKpYlm3Mn+N6q3qa9QkMAWN4xajj
	1zS50k5a+6omgkAtkmcdVA4DCVEk2P1n0SVzlzaw6ma6TD92xKV2RcKRNzkaLWiN4iCsX4SofU7
	XNZNSXfvLXW3NS8BHm46qTqhlIGY+JDz4buIsfmQLBPwg/B927dg+pqa8vtZt39ZxQCNjpPif9r
	gybDXciEItR0JzCHJxVdsV7Q29Enu+qEyNPSEgTQrrMRky5z1NTO7OPk5oJOfEvoICXKvkbPpr/
	qaTw9HW1VsS5Rc4T7MkPW+x6y+dDDZvtrEXh0D/cId65LGU2xrU=
X-Google-Smtp-Source: AGHT+IElf7lsfQjtiOV2E4bPjHneyAO78L3pEEtUAH93w6zuz5/Tdgxe17w9ozLMa0Cnzh0FCPV7iw==
X-Received: by 2002:a17:90b:48c3:b0:2ff:64c3:3bd4 with SMTP id 98e67ed59e1d1-30b3a6eaf4amr3368245a91.31.1746695926975;
        Thu, 08 May 2025 02:18:46 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.195.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d2f152sm1687256a91.19.2025.05.08.02.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:18:46 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libsoup: Fix CVE-2025-32914
Date: Thu,  8 May 2025 14:48:36 +0530
Message-Id: <20250508091836.62923-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 09:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216146

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/5bfcf8157597f2d327050114fb37ff600004dbcf]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32914.patch        | 111 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32914.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32914.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32914.patch
new file mode 100644
index 0000000000..0ada9f3134
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32914.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 63e9afa6fc..8cca980faf 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-46420.patch \
+           file://CVE-2025-32914.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


