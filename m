Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0683C71134
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:49 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.95772.1749584082390689655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L2gvlJte;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so2280601a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584082; x=1750188882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5w34AhyU4N7B5fQbIaTEECbiMWoR/B+9csMsYQAMKA=;
        b=L2gvlJteXSCr7zMaKX3VvmvnG4hNQYQbU4dUNXVT0orUYQU5u58nV4tXdO7/6KZcoG
         gsUcuPKNN1Sl07uQuhkYD+BvXIMIP1cZOLfxDhpC6lw4YuRfGcjfJiGkUuAG35McxIzy
         c54ZdWCrdeTrc9KNmXCx3T8Q1dwGcd3+f+1fB1oeL4FyTivGbd21cgkPx2oD+i9p/EgF
         qeREtfsNBDdr9Stbg48qaHBnYFgBWlsUFhOeP/p7HnrE56rfPpyaBi7oZNvkAb4AtgeS
         0lC7wwl4ezSDV7UeESKW7D69NQeNRwbgXSflLwDKfaUG5stNxebPfGp+DOpmn1Zhw4TA
         jzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584082; x=1750188882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5w34AhyU4N7B5fQbIaTEECbiMWoR/B+9csMsYQAMKA=;
        b=Gn2vwxgjNrL0idpJmByHYmZpZzOVJETWzI/8VGKlgZaDU3fsELFJuGKCGQSIW/Jxh9
         xsJDYE0cIhRxj+7f6X9L+77oWQC7GVWT8T848O9bqJHWbdYxV87Kz7P+OhiFp82NuJbB
         z74PD7rXrngQDbo1Mg2hUehIg/qNW9o3UwzLq8EyrvWjRg69Lt4TjtJIaHha0vAFTr0+
         wzjU9L2ZrmpfI5Elhw6blSP3CLAoF8M3bjc1WrmX4LYldakJFv8LyyYPCQzi5MKYFz9T
         QywRyy2i/v5GVnq8VB3I6McBuMmryiDQUPYz7Ajdf33kLj82EeDyJn9lzMe+zP8Xun8h
         5uZg==
X-Gm-Message-State: AOJu0Yy8G7SOgUQfkqXxUzaNiHMDvIgSjt1EtbhlZTOIAjl0cfI7UGRR
	0ilmtvUyXfJPhm3cAWhj37PyhE+TKFaV34nubl3H1aPZi+rS7Awe0ouoEhl5UnPj4e3LQ8Trd5a
	RMueg
X-Gm-Gg: ASbGncsLldt49QzsuxBjMx2CwL5t2Eu5pn6s6PjXuhiU9EBCVw3hd1/qijqw6zv+g3t
	FFoYtLNKPeqipOKkMP3CAHLILIVz9ByF2hOMU2yv242uPZAzGf1kCTbI6FjLmKykdkH6OfiKb8C
	bDRr0juVk4LCNEqY7rw79ZTxKWeHqgW0v4vjCT07ohbxrDGh4ShaXnU7Em/Ocz2bCGq832fTlpv
	Foo1K1PeSupxrN4RRvx7vYSky4k1tkLIvewrk1R5NYxmysN3ZjscyUBxVS8SFxcJo52Id9f6BG1
	hBNRfXCmuFLOCuyRZPWHLOebfjoXaKsO5Umtbe5PxVrTw3UIF77VZg==
X-Google-Smtp-Source: AGHT+IEy1MBwlnU7lTs6CHUMXouTlc+8SHTVUVOWTJP99SJzF7fgT547YjVti3WRIaPmHwxWtmUCWg==
X-Received: by 2002:a17:90b:2f10:b0:312:db8:dbd2 with SMTP id 98e67ed59e1d1-313af1a8e41mr975519a91.19.1749584081459;
        Tue, 10 Jun 2025 12:34:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/16] libsoup-2.4: fix CVE-2025-4476
Date: Tue, 10 Jun 2025 12:34:05 -0700
Message-ID: <ebb87904c97f4b27a023b2347622519c702d4d2d.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218415

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/440

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
new file mode 100644
index 0000000000..874f62e7ad
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
@@ -0,0 +1,38 @@
+From 52a0f9234d384b9dab368835b22e5a5a01542168 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 14:16:10 +0800
+Subject: [PATCH] auth-digest: fix crash in
+ soup_auth_digest_get_protection_space()
+
+We need to validate the Domain parameter in the WWW-Authenticate header.
+
+Unfortunately this crash only occurs when listening on default ports 80
+and 443, so there's no good way to test for this. The test would require
+running as root.
+
+Fixes #440
+
+CVE: CVE-2025-4476
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=457]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index f1621ec..a2dc560 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -229,7 +229,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
+ 			uri = soup_uri_new (d);
+ 			if (uri && uri->scheme == source_uri->scheme &&
+ 			    uri->port == source_uri->port &&
+-			    !strcmp (uri->host, source_uri->host))
++			    !g_strcmp0 (uri->host, source_uri->host))
+ 				dir = g_strdup (uri->path);
+ 			else
+ 				dir = NULL;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 5c834e394a..8f0b706276 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-4476.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


