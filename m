Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528C1C83F16
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:41 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.5567.1752029498172454162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q7EAHSZh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23694cec0feso45136145ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029497; x=1752634297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Clp4Zzv4lp/5my0Ec+R76LEGQ+wb4RhPXhQx5cjx/kg=;
        b=q7EAHSZhjXesfadoEdYXPBjv2qK/LYZ3QryQJzpBUVEu8xoveCgGYQwKh7FepVog0q
         6W9uZC74Cj5dOiBmlaOyTy8UiPKqzxEmXx6XtgOhzOjkqfycGCxh0a8eQZQK3IHfbHcR
         eOB09Yt0FHx6FLoR6vDgs95hHjptNnZlMZD2bJ0c6/MP/iJCkb8VI3O/c7DsQBMcnaau
         g0c7iCX5VXQ9F+AwHJDvc+FTzdxqNpq4tAfcAEUzfar4qZfPiJ9L+mv/3Ciz1TrlEK8T
         q0bUleryKcMX2cM5TPzaNyk5o9oTLxVkq00BFBhky9oRgzfcHIXpF19dRRW//tO22IWQ
         ccMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029497; x=1752634297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Clp4Zzv4lp/5my0Ec+R76LEGQ+wb4RhPXhQx5cjx/kg=;
        b=SrEB+volydLrCHIQEh7RhysPPhYBoaPTuTV7/7uYgokrfu19U7P4mNN9oqNdsCcjYY
         Mju4ZCJx61H4eQ4OY93jBpX3EKT2pd6FxKGw/kfK3XlUPme/O1qgeCaQ/YcNTjhuzNgZ
         Zu/MW09aV8TA9GzfVeVX/f3S14DBU80DFq3K6Ro+YnBNQcfIaOReFPZiAr+0esj1uGgw
         +AhPkl+OiJ0kwBu4Wx0+1zc9Gs2xllSN852nscxAFesM7Ghb/L2v3UisJK3a9wxR8xgN
         4Vfqt2J9QzTK3u6ZC8awOcN6oCI2ploxE+LMgQDoW05xkxFOFHO4ylY0RQsm8XEevvzb
         XZDw==
X-Gm-Message-State: AOJu0YzKJfiiCbGrIG1DZDdyiX5NdBnYmNvAA0m6L12pzpHVbRyxHXpO
	hL/svsTzC5nBlcJdBxS7D7xaexUMdFeCS7GRIk9pbtpxTXbPbDsLsHmG/mUPFlkMDAikrzNq/vY
	xlluQ
X-Gm-Gg: ASbGncuCa4xlpJIu3b+iK/UAbLVMaD1YtEl/6bUpvteKT3Zh63LlqS+4W9x1kv7hW5j
	TCAtMqLz6IOg2TCx6dSnKbWV8WrGWFxM32xrsFv5E60SpS/YYpHOlHmXOj5EIoq2CDx4Q2kqulv
	7RjUrD4jPsrpMsVq0YU9qYTvY6yO4Q4YrFwIAIXwVqajchkT3PYRiwB5QCmSFYxZZsu+1oewsfN
	xjSZd52oEqIFxFiiKAK96rJKlP0rYIxxcQKnjzczhKCZnzW95Sf+uJ9oAkgAz/Sj3Z2DhqMO5Dx
	qvJ/oa5QDZYHFuWvmKjgTJIurhVdqI/fsAzOUhkmO5dzuOfV4tDj3A==
X-Google-Smtp-Source: AGHT+IGfylbhUSzY8QZNgCWSqUgP5EfjRgNg3LIKrGma6tDr/qrhz/Y8uTCHgpDkw9kB5ahCl6fYOw==
X-Received: by 2002:a17:903:6c8:b0:226:38ff:1d6a with SMTP id d9443c01a7336-23ddb1a0471mr7975525ad.7.1752029497343;
        Tue, 08 Jul 2025 19:51:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/12] libsoup-2.4: refresh CVE-2025-4969.patch
Date: Tue,  8 Jul 2025 19:51:15 -0700
Message-ID: <aaeea20b5c0f0c5a9d6554dd5e9693a9432cfa54.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220061

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


