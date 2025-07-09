Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC6CC83F0F
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:25 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.18415.1752074362194235605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rvH/pNko;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so98923a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074361; x=1752679161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Clp4Zzv4lp/5my0Ec+R76LEGQ+wb4RhPXhQx5cjx/kg=;
        b=rvH/pNkoGwzZR9TXzKYRts345l4U/p1xjmQVHwlw0CzXt5BLLv6krs/oOpPAUBYXkk
         8aR9UPDePxxP8BHnerUDlahuWSOmh6AUDYCZsGKXSZqHnJ1MpKbDIyX0E+MpTWxCQ9t6
         6A/PADpVhVfofeeidoYW7SYgxn5117hHWSbaBNnsTxT5A1UjK0v0X2r+AKnwUsY7ZIrf
         xus9Kta96HLUdoowNhQrbvKc9GozX+56bIL16LS1vyWG3JXtj5cJwgkE2zxeWYIPTxXL
         nNMDskgX5tWnRhYoR+pHglw/h3NKmwtxUj/NfzD7hl3mfvtoKkIyTm0jszRrmI9muaxX
         CSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074361; x=1752679161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Clp4Zzv4lp/5my0Ec+R76LEGQ+wb4RhPXhQx5cjx/kg=;
        b=CwkvY4SgITDge9vHwM+7WBzi+TmKx/lwBuoX6cRhZlF+SJkV16DIkDQo90o9ZMhAlH
         DWOaTnfsymFbATCVXpf6o3jtaAJjVVr7EzJKgNaH+44X9ekTWw0lM+7RGl0Vfq1gzKrz
         gy3OdmJX6CpPKQn/WIiynFA3dJ9loHsxd4QXrLNAXo/fOSzXLFzXBpSE+cZQEXdfCwZx
         Hy5g6zHtuqszm5KQw/fFTy6DYdTOecKVQySL97WABEp4Y2Rz7+KP6CHYlN6r4ybtbBCY
         PfemeuvTniGo6tfDncE/k45ulbp1rjFfc14z3ssmVwVZo0zdWQDQGI1MbozeJ94FCxlh
         OBPA==
X-Gm-Message-State: AOJu0Yx/Qndn7pg5JfYSPp07TYmiGvdRayZ1/ovvq7u0UEC2S3VfbxKe
	55dIDZrxwLpS37SchfzumO8xPV2RgwWby0bwMvw67yoC1MPKk77hiDGX5UBkMzA6umLpW3smVDr
	DmcpJ
X-Gm-Gg: ASbGnctTo29LowFEDndW+EnwU7MTJwpiWga1VSRAtEinbfIFZue7wJQ2AndUw67tSvo
	8gB4bztV8d30aUFO6t8hjv6GOM8UkszdGFeS5MRl/Y9Y7sCvY7BWjzEZJNnJ8Fk6cW/wGVzQMdB
	o0UC1vqtfRuLQhCjmnU5bVO0BpQt2QVzu2UNUekgbNS4XlDGSYCJcbk7ys/FU9yZDDZJHsn0pIq
	cPjX7zEAAb3Qx4PcWjLtWAJ5jVVHZNcAbfU1mR07cIQOvdxvNYCfVwKkqAz0oOhN6ZqQ1JoQkCC
	z4xailVmF3jJS7oQaJoiqIVVkUb6tGe10nLEjFd+3m8Ju32f+sflEA==
X-Google-Smtp-Source: AGHT+IGBZtFzwuoF8TIe6Z2L/AUg8NDd73aCFUSVe3uyDKk8c6an2TocSdtA3l9HmZJmvbz5PJpMnA==
X-Received: by 2002:a17:90b:1b08:b0:315:aa28:9501 with SMTP id 98e67ed59e1d1-31c2fddc381mr5174495a91.24.1752074361248;
        Wed, 09 Jul 2025 08:19:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/11] libsoup-2.4: refresh CVE-2025-4969.patch
Date: Wed,  9 Jul 2025 08:19:04 -0700
Message-ID: <4a0135992778110f2b523f436538c1197ef971b8.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220092

From: Changqing Li <changqing.li@windriver.com>

refresh CVE-2025-4969.patch to fix the following build failure for
libsoup-2.4-native on fedora40/41:

../libsoup-2.74.3/tests/multipart-test.c:578:63: error: passing argument 2 of ‘soup_multipart_new_from_message’ from incompatible pointer type [-Wincompatible-pointer-types]
  578 |         multipart = soup_multipart_new_from_message (headers, bytes);
      |                                                               ^~~~~
      |                                                               |
      |                                                               GBytes * {aka struct _GBytes *}

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   | 54 +++++--------------
 1 file changed, 12 insertions(+), 42 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
index d45b2a2cb0..c1936b0b0c 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
@@ -13,10 +13,20 @@ Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086]
 CVE: CVE-2025-4969
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Refresh the patch, remove the test part, following commit in libsoup3 has a
+type refactor, which make the test is not suitable for libsoup2
+[0d7e672e forms: Use GBytes instead of SoupMessageBody]
+The test part will cause libsoup-2.3-native build failed on fedora40/41:
+../libsoup-2.74.3/tests/multipart-test.c:578:63: error: passing argument 2 of ‘soup_multipart_new_from_message’ from incompatible pointer type [-Wincompatible-pointer-types]
+  578 |         multipart = soup_multipart_new_from_message (headers, bytes);
+      |                                                               ^~~~~
+      |                                                               |
+      |                                                               GBytes * {aka struct _GBytes *}
+
 ---
  libsoup/soup-multipart.c |  2 +-
- tests/multipart-test.c   | 22 ++++++++++++++++++++++
- 2 files changed, 23 insertions(+), 1 deletion(-)
+ 1 files changed, 1 insertions(+), 1 deletion(-)
 
 diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
 index dd93973..b3611db 100644
@@ -31,46 +41,6 @@ index dd93973..b3611db 100644
  			continue;
  
  		/* Check for "--" or "\r\n" after boundary */
-diff --git a/tests/multipart-test.c b/tests/multipart-test.c
-index 834b181..980eb68 100644
---- a/tests/multipart-test.c
-+++ b/tests/multipart-test.c
-@@ -562,6 +562,27 @@ test_multipart_bounds_bad (void)
- 	g_bytes_unref (bytes);
- }
- 
-+static void
-+test_multipart_bounds_bad_2 (void)
-+{
-+	SoupMultipart *multipart;
-+	SoupMessageHeaders *headers;
-+	GBytes *bytes;
-+	const char *raw_data = "\n--123\r\nline\r\n--123--\r";
-+
-+	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
-+	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
-+
-+	bytes = g_bytes_new (raw_data, strlen (raw_data));
-+
-+	multipart = soup_multipart_new_from_message (headers, bytes);
-+	g_assert_nonnull (multipart);
-+
-+	soup_multipart_free (multipart);
-+	soup_message_headers_free (headers);
-+	g_bytes_unref (bytes);
-+}
-+
- int
- main (int argc, char **argv)
- {
-@@ -593,6 +614,7 @@ main (int argc, char **argv)
- 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
- 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
- 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
-+	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
- 
- 	ret = g_test_run ();
- 
 -- 
 2.49.0
 
-- 
2.43.0


