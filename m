Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E676C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.17946.1708013927322419706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lOG7YSuy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d932f6ccfaso9239235ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013927; x=1708618727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3krB0WviS7Wb5ikT3JqSlOuzu0yJZqKCju45g46chGg=;
        b=lOG7YSuy8eZd+EpKQHwISxWSfeZfyJinZJeLnfTmmrARnV4TWtobogyhp0Lqa/20k5
         ELJLQBKKO3O205Sn0F8uIR7bkZ/3qVHTSH+KR1zS9CfzvfwCvaL751mpSjhxDxsq3hbY
         XIZ6PLbKOb575NieSEAA83+3fHOGMsU40LM7cGrJyrdp0oYAvtxhgCDDl+LOkFjijXs0
         nepigB7PhfYAsCxljku6D6g9DAreeppXyz+yVHPZuQru/f7/O7ogpHbCn+Hus+mNTm14
         VjrVuc9M4S8Rh6ayI4zI9JMNhvuw2/RWjAAEVSUDeAeukhObO5FYF5iXxinKAp2jZBxt
         Yd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013927; x=1708618727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3krB0WviS7Wb5ikT3JqSlOuzu0yJZqKCju45g46chGg=;
        b=DAO/VO03X9Ou8mBZHe63k5Ht6xFUhH+xY3O9Pkf5hrRjxug0+8lwcCUhF3NlDFQL5i
         vsqkGujchpCfOvuUTuTyGpEjq50mdAEljDWmtaZB0PrgTfxrVEH5Mh4stWBpQSWX5ZBn
         up+YNgcRMwySn8BDKJGUkA0yrSz1bCb+yM1JdZpHNkk0ZygiOcEoUEbHb2xGGFq4rFNR
         7YbIQo1Xp8FEqdqQ+D1rgWCqhiVhIhy+6PX6oBvouSHBsy42WNcDSImbI4aoTjnHi/XS
         PPxRIGUPVEGllDV6Inf0xAIRLUXK/nbwo84ehS3UXx5KPNg0wTpSQe81vbMizPDeZ2an
         pUjA==
X-Gm-Message-State: AOJu0Yw8SqBRszXI9sMMRu46iUtJYL8LPj9HvR0prdTR53JZpQKVuvgI
	iMh3RcacFscEeAhqCflGiYtpom6a8nHMTrYG/QwBtiR/tUsjUcaKiwGWIhlLsMkNW8pyt0K6NFE
	OeuY=
X-Google-Smtp-Source: AGHT+IHoRu/VjswwTHDuRYyO6sJ7lnAOGLheLDidddz64a/5qJZdqcXfLIm0alLRvnVs6jm4kuj5iw==
X-Received: by 2002:a17:903:2346:b0:1d9:620d:d40c with SMTP id c6-20020a170903234600b001d9620dd40cmr2538414plh.51.1708013926657;
        Thu, 15 Feb 2024 08:18:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 19/21] pseudo: Update to pull in gcc14 fix and missing statvfs64 intercept
Date: Thu, 15 Feb 2024 06:18:02 -1000
Message-Id: <f7ef390b70709c0b6a607fcfe1da4c85144840e5.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195539

From: Richard Purdie <richard.purdie@linuxfoundation.org>

rpm 4.19 now builds with LFS64 support enabled by default,
so it calls statvfs64() to get the space available on the
filesystem it is installing packages into.  This is not
getting caught by pseudo, so rpm is checking the host's
root filesystem, rather than the filesystem where the
build is happening.

Merge in that fix and a gcc14 fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6d021c860b2b99f46c604149317b326f493022d)
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
index 699cab11c6..025cf0fc9c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "a8453eea4d902bbb0e01c786f1cb4a178c3bbee3"
+SRCREV = "516a0a3c4b46f046895d27bfa019d685fe462dfa"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.34.1


