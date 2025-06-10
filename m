Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BF0C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.91274.1749571738634329906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Fc7DE6Sy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2363616a1a6so10793665ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571738; x=1750176538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/rYarmgzAhpTwZjSqYBiwxG8Y3fIzqEw0n1zaN4lUw=;
        b=Fc7DE6Syj4/kvBKjyXbNqSHtBoqU1dgIlloOh58/mhk7oZ5GlnDZOWyoIcvvMKO/O3
         pyPnA5PhrUpSpZSvEy0ppdvUnJv7cL5u4G+3S6kgqwAeuUHN1FA450KO65G3XfDUA+Pf
         1VKnvFGypyGVpQY75LOOI7P/kw47z5uwRyK7BuOxXL4wSYxV6fV5W/tckd5txN9eGdvl
         6Ts5EnlyQGS43HLVJG+0ZGsLeCn7P8RfRlItjiPAlh6tPa50laizQ3bSHRws7QoI5pKn
         +ocwF0gdKpc0p8kFQk+yFXeprMs5rbwDClPN/3UK54Vnobb7b12Q990RwF+UIGcJ1R+e
         0VcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571738; x=1750176538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/rYarmgzAhpTwZjSqYBiwxG8Y3fIzqEw0n1zaN4lUw=;
        b=hdkN88+jYmqL8h4FJfWd/5P7v+J0nGWia739abCpT/dFMNd1aHZ6K4RtGPV2l5CjIf
         V0IHk55hPl3DA5wUUaOGID7JEKcrI2wAdWrdM/f/9aW7ouj0YYOVSM9X1tBHtIYVIero
         gZ13yuNylI2kXZAz6n/prkAafkQCwOrwzwh0z6N/9UVt0Df8AmILRrKiz6Slhg1gSBvW
         DePvJ12A8BYIk9Sa1E7qbPxDf0yTr96tnZlLzrm0Li5B6LKNZivIexboHN8nMnzNjMCA
         6JvIQSiuilMtkxMKFUPk/2XK3x285nCszE0336KJ4QAIhqpEhDqvhuxmOF8h4gIo38pS
         fxWQ==
X-Gm-Message-State: AOJu0Yw6TJggotN0SQFb0zSoVbGw/imLYqge78SGF2j/2hDZSCOwzCKI
	U99E4ePxHMG6FE9BUj42uCWVkGu3OCT4yQmNR8fYO28a9OGQsV0DKq5jYGYbSOXcJstSn55PqX9
	O8lHG
X-Gm-Gg: ASbGnctFKklfbPIzKNWoNdOJ6WHHsXfeCPdN828vP0hyOdoa8yTVwmaZKjMVduGdb1d
	TsgYORB/rOarVGEbQ4y4u/Ds+AMpVRKOuRmSAvDuRj4MTevebUkR64Ok6QOz4tFox4dGbfSixBe
	rwG+mRvC8rkzZiL2U3kjgkcKu+STAKdhxERPLZOf1WZiWTp4u7ym4q7O450wTU8t0b7WKNEXKfm
	z09QBpQnLvNmBC2Vd7ZHBzHiqcA1SNbwIsayU8DkPNvYB1HwZXzQUKlm6YUpjQ/o93PzhruTPBh
	TF8gL4n3ZHDj3/L9Eyqb85LyXCeWUlQsUZnU21NAcD7ajQT4kjjySg==
X-Google-Smtp-Source: AGHT+IFWLyj/ahvleF+DuYHKEIOD6nEOkyrkCS7REW2/76XcZgyWj31oiq6e0q47C8ES87L9zGXGeQ==
X-Received: by 2002:a17:902:ced1:b0:224:23ab:b88b with SMTP id d9443c01a7336-23601cf68e4mr219722375ad.8.1749571737745;
        Tue, 10 Jun 2025 09:08:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.08.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:08:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/32] libsoup-2.4: fix CVE-2025-32906
Date: Tue, 10 Jun 2025 09:08:18 -0700
Message-ID: <8bd48ff06234b7dc387e0c578c61429359894edd.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218374

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/404

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32906.patch  | 71 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
new file mode 100644
index 0000000000..c33ebf8056
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
@@ -0,0 +1,71 @@
+From 4b8809cca4bbcbf9514314d86227f985362258b0 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 12 Feb 2025 11:30:02 -0600
+Subject: [PATCH] headers: Handle parsing only newlines
+
+Closes #404
+Closes #407
+
+CVE: CVE-2025-32906
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c      |  4 ++--
+ tests/header-parsing-test.c | 11 +++++++++++
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index e5d3c03..87bb3dc 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -185,7 +185,7 @@ soup_headers_parse_request (const char          *str,
+ 	/* RFC 2616 4.1 "servers SHOULD ignore any empty line(s)
+ 	 * received where a Request-Line is expected."
+ 	 */
+-	while ((*str == '\r' || *str == '\n') && len > 0) {
++	while (len > 0 && (*str == '\r' || *str == '\n')) {
+ 		str++;
+ 		len--;
+ 	}
+@@ -369,7 +369,7 @@ soup_headers_parse_response (const char          *str,
+ 	 * after a response, which we then see prepended to the next
+ 	 * response on that connection.
+ 	 */
+-	while ((*str == '\r' || *str == '\n') && len > 0) {
++	while (len > 0 && (*str == '\r' || *str == '\n')) {
+ 		str++;
+ 		len--;
+ 	}
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index c1d3b33..b811115 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -6,6 +6,10 @@ typedef struct {
+ 	const char *name, *value;
+ } Header;
+ 
++static char only_newlines[] = {
++        '\n', '\n', '\n', '\n'
++};
++
+ static struct RequestTest {
+ 	const char *description;
+ 	const char *bugref;
+@@ -445,6 +449,13 @@ static struct RequestTest {
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+ 	  { { NULL } }
++	},
++
++	{ "Only newlines", NULL,
++	  only_newlines, sizeof (only_newlines),
++	  SOUP_STATUS_BAD_REQUEST,
++           NULL, NULL, -1,
++	  { { NULL } }
+ 	}
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 64383e1221..79ffa19c20 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32053.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2024-52530.patch \
+           file://CVE-2025-32906.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


