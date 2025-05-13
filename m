Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610F9C3ABDC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:44 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.84923.1747163316809552087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IdWQBnsF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7411f65811cso5710764b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163316; x=1747768116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5X9+l/gQjKCMkV/Bo3z+UpZiE/HjE9hBOHmG2kqcBY=;
        b=IdWQBnsFDyZ7PqZthWijkmeYCrQx7gOuchy1Jc/m8ExTVKCa1qxLB0bEubIy5AErNu
         Fe6ZRkd91Mt/BUaphAFsTb/OxDQn1RRwJcMm8Bab1eDnj27XDMNUkreJ0tYTFSM2L5ZD
         O9nrWXuFi7eiWw4oS5iZgW0CRiy5IfpCFhCklBGzhH5DDwO6BzCsHESOBQEs21g7Qi2a
         ccivbv92VeIYid62lSG5ONyc8UHjED0Vxv2guQPaXkyuXNNhaVWV2jVHdfpKFLjomBjj
         +em95n+NAeDxbPN/Bo+iih2LQ901yL583WUkMfPQg25r37CIR40AzJ50akvOR1RsZN6U
         yd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163316; x=1747768116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5X9+l/gQjKCMkV/Bo3z+UpZiE/HjE9hBOHmG2kqcBY=;
        b=ac8l0023yASDkx0uSryrW9NpIX+UVeVHUcVLDieIKyRLHojZpZ3hhP75bFWKyi+LdL
         UTH5MzPuMnIAY/BNlF+SdkMrZkGM0A2job4VJvQ09vh4KW1xPZhMbX+M0Dh8fdH/LOjK
         7yulmCXlh19pnesjgDoDdMRUyCEJDjoTHjWCQ+t90LH4KrJ8jpDsHHXudwU/sE4O7Kiv
         4ploxRNhGTzM3GJbN21N7kDp9Si9rRRGs2eu+S4z26HOzmkuYpmDSzW79FGokHnP4Iac
         /5vkLdPvbIKq1uFpHo6+XE4E/xCkmO4HtD1SADPnW0f1ormjo7Zy/6Q6xIgtaasEJ+/0
         85pg==
X-Gm-Message-State: AOJu0YyYRuRVdPWGcXoX884IcGKLoPiVpJmW0ucbEiHvgu00askf3J2v
	Rxb6AiISB5IH7WWZSTerPn94S1NGkT4nTGnCy8Fx4iz8Rz7eWEd3a0bxRy7Z4E5qZJWNkCrTP0U
	l
X-Gm-Gg: ASbGnctLvKlTh1p1kd2zdIX483PzJoz8j7ACozLiS6JYyFklKDfyjct87sfnZur3Q31
	AXo9FN0n/0l9d6osCmyRG34noH4jt0aAAcnYoc7cRkatvsReyWu6MGhLw8A6qaZ190r8mYYyw/p
	fnH7EgwU9WlFrKcABO3mtk6UADgFJuPjdHsF2zjSuWz3PRML0lBKZ7xiak+xRAy+DbU4+zKo8wI
	GkEOgLL/3wFPW/pCHfRSDxwJCcinkgkR+hGfOXi748JeFs39hhovxVDxEPvzU4wJkpFzLNRriLh
	4/CfgNL5vqICuhezU3zY3DEESyuo6mJUGjgjA9BpJ/8=
X-Google-Smtp-Source: AGHT+IFSe3Tjh3QBpCbeNMiDeG4jq3cqpRApVgD9TMm9ZKaZ5mVxjq9tzQkDcPNp9RfHDAaYmzgjuA==
X-Received: by 2002:a17:902:cf06:b0:22e:50e1:746 with SMTP id d9443c01a7336-231981c8e77mr7689985ad.36.1747163316003;
        Tue, 13 May 2025 12:08:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] libsoup: Fix CVE-2025-32914
Date: Tue, 13 May 2025 12:08:08 -0700
Message-ID: <ce7cda16d823012f71d91c820083b0da93762d9d.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216444

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/5bfcf8157597f2d327050114fb37ff600004dbcf]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


