Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5468ACCA47B
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:57 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.6489.1655130169466529240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rWwfbO/s;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id y196so5886392pfb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0FzUE0gGuyMckaNy1t4GWexhH/7x0NCGfzrE62pzuiw=;
        b=rWwfbO/snAwwV5vCMUpyCb0Bi1y/VihYJYDS+rjyQtEXsDe5JcmYOr63PUbxJkUEHX
         pn0flFS6Or834Sr4IeF8P0V4DeZE2S/Ui6zuNLNr852BByNEk5z2K4E70q6eFwgWCb2L
         ymWPShWwQMwEQTd1kivymtwTwAjxhaM6kpAimP42uS+BVETX62ELcYFsUZno1N3lII9D
         TO1F4ZIfyjGSxd1H/JBESqCX+5BEGpchs/DsE13ZlBYhHrV6ukS3MdhYhEs2HJ7J/mAE
         BcnV7Ji+6RcFX7mUKs4SCYOkWh5+oyF3QsGPrFPm/Ro1JWOXM91o7lt975+U4ZS6gwX2
         JRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FzUE0gGuyMckaNy1t4GWexhH/7x0NCGfzrE62pzuiw=;
        b=0uwIQJq2Q9bS1tQak7JEBd1CcsOBxgolSGncYeskaN6FhLLjccyB4eV4xVAcsms4nB
         fQXTe3F7HUhCOunOhsROpUtMQfzOhMwDu7srEs/R2PcHy0i8o0YA6ENTlM3peka0rgZ+
         zNXu/G/ZiVV45nZFt7aFlsquOYDHo/B4RPnM9ht7+0VMcHivDJWhGIqoFE66AyPJpZTN
         AFuseQhrVDEEWlaReatjmrQ33SSgKy7tblA09IaLo6ptm6gq7BNTkDJkmPNBQDUAVyP1
         ILqieU1M34gy4YlXNyE6R/6msEHr8nBqXCZeuUUJK1sVsulR0yBGd/OcnNCD/YZy5OW/
         ZTLQ==
X-Gm-Message-State: AOAM530v392iW7uA2j0vZFKnwTY+2lnZwnZt7prQQwGcQlRMgzrY1ysH
	687zC3G6Icp/Yaxd1+03r2/rfa8BQaiz/N2I
X-Google-Smtp-Source: 
 ABdhPJy9CVYYBpUgKC7h4oa7vlCWlUvfr2FVLwxDL2evBdnVrqTWFsCeVEoXSdjQvo27Or3TZFpX8g==
X-Received: by 2002:a63:5f53:0:b0:3fc:c510:c4a0 with SMTP id
 t80-20020a635f53000000b003fcc510c4a0mr52420122pgb.80.1655130170526;
        Mon, 13 Jun 2022 07:22:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/20] systemd: Correct
 0001-pass-correct-parameters-to-getdents64.patch
Date: Mon, 13 Jun 2022 04:21:50 -1000
Message-Id: 
 <741030ce3251d0f6084b6c58904760316ac84487.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166862

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

Current patch removes the uint8_t* cast in src/basic/recurse-dir.c:57
to fix musl build, but it changes the value here as pointer arithmetic
is type-depended in C. This patch corrects the behavior by adding an
extra cast to struct dirent*.

Also changes the patch's Upstream-Status to Inappropriate as it's musl-
specific.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9e43d7f7488c4da8598759c4882cceeda9d2095)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-pass-correct-parameters-to-getdents64.patch | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
index 028f50b243..9ebff9825a 100644
--- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
@@ -1,4 +1,4 @@
-From 8c8899b4641125cfe8e7baee32e5c5f452545d2c Mon Sep 17 00:00:00 2001
+From dab02796780f00d689cc1c7a0ba81abe7c5f28d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
 Subject: [PATCH] pass correct parameters to getdents64
@@ -12,16 +12,16 @@ Fixes
         n = getdents64(fd, &buffer, sizeof(buffer));
                            ^~~~~~~
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
 ---
  src/basic/recurse-dir.c | 2 +-
  src/basic/stat-util.c   | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
-index efa1797b7b..797285e3be 100644
+index efa1797b7b..03ff10ebe9 100644
 --- a/src/basic/recurse-dir.c
 +++ b/src/basic/recurse-dir.c
 @@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
@@ -29,7 +29,7 @@ index efa1797b7b..797285e3be 100644
                  assert(bs > de->buffer_size);
  
 -                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
-+                n = getdents64(dir_fd, de->buffer + de->buffer_size, bs - de->buffer_size);
++                n = getdents64(dir_fd, (struct dirent*)((uint8_t*) de->buffer + de->buffer_size), bs - de->buffer_size);
                  if (n < 0)
                          return -errno;
                  if (n == 0)
@@ -46,3 +46,6 @@ index c2269844f8..7cd6c7fa42 100644
          if (n < 0)
                  return -errno;
  
+-- 
+2.34.1
+
-- 
2.25.1


