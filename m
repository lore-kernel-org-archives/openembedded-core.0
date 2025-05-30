Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B022C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:22:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.453.1748640136400018540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 14:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qcUNT1gW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234488c2ea6so26707815ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640136; x=1749244936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3ADV7BvRDgcIqSlWFUdYjsu4YDKxeV+wX37Ep0O26M=;
        b=qcUNT1gWGYdM7kKU1U5FWlMvlx7ibnHy3ZHx7ft6dZ8QSGGG7wiWX2sAqLHnvIhcA0
         bIFMbd+ejExBWjg6uy7/Pxsry8pSr8B0TLdfOK1dMpVdxTErTA70re+RFkO+ZCAhkGFX
         oXshSEl3TJDUdqxMbK3ZyJnxcTxzrkUBRX0kqJlJ5eA/0h7YRqG+sb3jIcil/kQ6G1+M
         fyRSqmTjst4GoXfkHsJ6Vnd+zN4RZOmhHejwqOuLrU4ArWThRs46jgT+s9dOrzCEzIvN
         +LrTHQnULSoy2AkyuM0dH8gzNZCU423vFDTkBVa+VU7BLlSl6HSsJUysE4Cg9mdu4v8j
         OVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640136; x=1749244936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3ADV7BvRDgcIqSlWFUdYjsu4YDKxeV+wX37Ep0O26M=;
        b=XHuGrinVy9sZhrcdNGkd7DHFO+Wk+eyJamZCn99fOiGrGQTpfoYoyUKSOhEp7CNtrO
         pEhwtPvzSI8VmCnbaMfmCdHq75JTs93JIxBF8RmjQJkcYKd9DLnEKwXQ9FFvg+Dzrwcj
         gm/kUB2Z6Osot7tN+qS3BQnZZiym2XkjGELEpVn7QzgX4PnQFI4nsNJ8tJi9rr4WzSnt
         KtF4dG0xIlsttP8Fej7sEsqE5UrMum/NRY8ZNSeuEh3NhkHMPapWtyDipWJtuhhs1NO4
         HD6kljZ+dXQ9uWyC2FAwqqEisE1+7sB13fRoZCdsYrfiNEP0uKhjz3ohOco46Lk/g2gZ
         2VlQ==
X-Gm-Message-State: AOJu0YxaBV/wcwgMAEfgJ4/3pVTp9nhAttDNy6VUNPf5wWMHmXakERxz
	QPeXhJ9qm5OkDpLBFQVPJYCGoNhpvMpPwFuVk0lwAzRPBJoyhpcovW76nQk/u2kQSGXCXucEe1z
	7siCi
X-Gm-Gg: ASbGncss4cHR9yYINHKXGYZJin+SjL1BbcZsT6ws/8O2+wloa5k8cNrAu9oxY5xS3eH
	VS/4sU8usaAhKU5oB140UjGuLDoAqvB9W899+rfTG7XvALn7AnxHHXHgopmpb2FJOp5P97QhlI0
	YaOpJHwdJ7M+yFyo6mAQwfgzdhoOTlkMGv0Y8RhkpCfULO0lCR7OFpiJPaq1Q3dqWKj2wb2qIta
	prF2vVT8e9mXniiu+zSfJSb89qDtFTN30WYjP122F3PhRpADkhw6g/Ktv6fvxDhR1IBpHRaPdr5
	2cRIJL0ife10lUSUtLVEzSxMbRdgmKsCrH3kA9L/KcY=
X-Google-Smtp-Source: AGHT+IGiS/BWM60XImNsX/I2FhOjAVG8wgxqC1wk9K49pn0z0Vwu/U7CntL37K86Cxn6yzhHrsyQdg==
X-Received: by 2002:a17:903:32c7:b0:234:a779:47cd with SMTP id d9443c01a7336-235390d8e0fmr54213545ad.15.1748640135582;
        Fri, 30 May 2025 14:22:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be2622sm32621815ad.102.2025.05.30.14.22.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:22:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/14] libsoup-3.4.4: Fix CVE-2025-4969
Date: Fri, 30 May 2025 14:21:51 -0700
Message-ID: <97ff2fd8234a3db695c80e4a766086d277c4a4b8.1748639952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748639952.git.steve@sakoman.com>
References: <cover.1748639952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 21:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217539

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-4969.patch | 76 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch
new file mode 100644
index 0000000000..70c5fd5593
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch
@@ -0,0 +1,76 @@
+From 07b94e27afafebf31ef3cd868866a1e383750086 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Mon, 19 May 2025 17:48:27 +0200
+Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
+ members
+
+The boundary could be at a place which, calculated, pointed
+before the beginning of the array. Check the bounds, to avoid
+read out of the array bounds.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086]
+CVE: CVE-2025-4969
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 22 ++++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index 102ce37..e1c442e 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -104,7 +104,7 @@ find_boundary (const char *start, const char *end,
+ 			continue;
+ 
+ 		/* Check that it's at start of line */
+-		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
++		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
+ 			continue;
+ 
+ 		/* Check for "--" or "\r\n" after boundary */
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index ab5f41c..84852e2 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -527,6 +527,27 @@ test_multipart_bounds_bad (void)
+ 	g_bytes_unref (bytes);
+ }
+ 
++static void
++test_multipart_bounds_bad_2 (void)
++{
++	SoupMultipart *multipart;
++	SoupMessageHeaders *headers;
++	GBytes *bytes;
++	const char *raw_data = "\n--123\r\nline\r\n--123--\r";
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	multipart = soup_multipart_new_from_message (headers, bytes);
++	g_assert_nonnull (multipart);
++
++	soup_multipart_free (multipart);
++	soup_message_headers_unref (headers);
++	g_bytes_unref (bytes);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -556,6 +577,7 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
++	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index d3a0840044..21a1bbe6cd 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -31,6 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46420.patch \
            file://CVE-2025-32914.patch \
            file://CVE-2025-4476.patch \
+           file://CVE-2025-4969.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


