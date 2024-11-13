Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71231D597DC
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:48 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3475.1731467801532945978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sww57aCz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-72097a5ca74so5382312b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467801; x=1732072601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3ceirSDV6ynp4tIgHK+mvky1ntA9Rwq3xKD4m5eHUA=;
        b=sww57aCzgfBkCnBj3jQYy4hl2GIqxgFIgqYYkqTLucQaxcpYOzSinh2jQ6PyB3E7oW
         2jeYQm7RSMvaZH7Z4WYbVeJEIHZi2zJBdJs1qD4klg8hD0nrwvLNV0dcOL/txN2gLvzT
         UiyZ8uI++YyZkRs8eZP06Fxvs6+ELmlSqMzFhVIh72RFgELsJ30D2CU/p+S41kRLNPP6
         CG9ky4M3qgug8iN4FyYeCNlPV842qov6ne7RslGiTkumHSL0q/ZLIbqLIPz9JTkwqDvp
         9tgVXQJ+CMp99d5N+KGVE03gMr6n9X357O1vgqvMIFoZzHlAyMDA2ImJ1oN6I0nMtENQ
         OhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467801; x=1732072601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3ceirSDV6ynp4tIgHK+mvky1ntA9Rwq3xKD4m5eHUA=;
        b=YqfJJUZwsU5JF3K+TRKtsy9KVHrylcBZzanBD7cJm3P78ZKsH/RjOWesifrtIXdRwW
         5hG0fOgwVyFbz7zIhrC0XLcUjAPq6FrJuw6vtCBXeIeGNc3saWkNwqbRd+RefqL7HwiG
         KSEwxK1ZwFDV3vL7YWqxz/WNB+VHVwih/z9SS38sSjQ9abrThv7ahs3NujXixeWOLy8H
         7nLw2huCJbzsQF3YsSA+y3t1oZO9Oz3rmGY5dNuKxgTdZ51jRlSO+x2fbC9+fparxVFO
         O39hscDFGSIbKOpBjiSEavhqGdGmOH7NOo92vNGA4t/pBwLj7Zrf4dUYvRp5ml8i5Ney
         cynQ==
X-Gm-Message-State: AOJu0YzrPW493t7pjIP5WOeGokCJiU48wDhO+j+t7P3QAie9DNOPUXAP
	H7fckMYJSufEvgJ1ICA0bxsoTIK/I2JRVwYPdKuW6xwWMU6750vBSAfFfHU7VAkDL7ZIEFzpyg1
	Q
X-Google-Smtp-Source: AGHT+IEfavloVky3mSJtEVF83w0Dv9mRdEVO0P8mOfJ3Beok5rD93Nlccw0gir6D8Oi3pzj+8VPz/g==
X-Received: by 2002:a05:6a20:430e:b0:1db:ef0d:95d9 with SMTP id adf61e73a8af0-1dc22b58803mr24339523637.31.1731467800788;
        Tue, 12 Nov 2024 19:16:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/19] pseudo: Update to pull in gcc14 fix and missing statvfs64 intercept
Date: Tue, 12 Nov 2024 19:16:07 -0800
Message-Id: <1b181d1fcef45f969ef9147912995d80dbe87d87.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207087

From: Richard Purdie <richard.purdie@linuxfoundation.org>

rpm 4.19 now builds with LFS64 support enabled by default,
so it calls statvfs64() to get the space available on the
filesystem it is installing packages into.  This is not
getting caught by pseudo, so rpm is checking the host's
root filesystem, rather than the filesystem where the
build is happening.

Merge in that fix and a gcc14 fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/files/glibc238.patch | 13 -------------
 meta/recipes-devtools/pseudo/pseudo_git.bb        |  2 +-
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index 76ca8c11eb..da4b8caee3 100644
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -44,19 +44,6 @@ Index: git/pseudo_util.c
  
  #include <ctype.h>
  #include <errno.h>
-Index: git/pseudolog.c
-===================================================================
---- git.orig/pseudolog.c
-+++ git/pseudolog.c
-@@ -8,7 +8,7 @@
-  */
- /* We need _XOPEN_SOURCE for strptime(), but if we define that,
-  * we then don't get S_IFSOCK... _GNU_SOURCE turns on everything. */
--#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <ctype.h>
- #include <limits.h>
 Index: git/pseudo_client.c
 ===================================================================
 --- git.orig/pseudo_client.c
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 067fb6b378..ad7067a08f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "a8453eea4d902bbb0e01c786f1cb4a178c3bbee3"
+SRCREV = "516a0a3c4b46f046895d27bfa019d685fe462dfa"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


