Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C5FC83F13
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:26 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.10496.1693064363296796004
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vxx2yMMt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a410316a2so1455667b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064362; x=1693669162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23NeLciyWMSs0mANQXVWfRZf8zN8Jmtxql9mGq5ClTQ=;
        b=vxx2yMMtepDKQuk81qvj1og58LmJh/BGGPyDSp7dOKy9NVob6OrADCfSSE3/LNk87U
         f7tz5Ndn88oyaDNad2CnHgK/l8tYtRBEnPBfX2wAnciUEOZhrItzXKmk+byAE4UErAgM
         cckUn3WpTOiznm3tHlFtk8o4PDQfh7cwbnMDr3xFnf/R58W72qa6PHlot25f7Ag7TRPe
         Q/XQO09I/pg2iXxdBEyw3nhXx1JWckvHIfoA4NzbOaShB6IijKJAiDODkRvULvnoILHU
         f/CYWVwBQnhnZJlMoOZ5ncgpNg1i8YK/rKA5tm5+mXfVreoMThA87FiVjM604yZeFf4U
         ElUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064362; x=1693669162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23NeLciyWMSs0mANQXVWfRZf8zN8Jmtxql9mGq5ClTQ=;
        b=HOb61cI4YBTZvt8VLgpM0HKU04bAeZztYBQjVGayBdtb4z+pMvpo1T2Me8KTxbK4sc
         lGS/HUYFtQVO8lxpubgWqjj5fKPUJY8uGRXcK0WyeGIJDVa4Gk0PPtE56mx/KIMiAC7h
         /W+eC2XKI5KBuh7nxqkUm3PwhNupdPShFP7LW6PPq+P4mOuVjfD+iCAII//TNDsMOsA7
         Hb/e1maR+7RyxC8hntxK3ohdrocVtLMfjgR8CZ3y2FGiEo0D1rujBQtzs8+LPFT+pFpx
         e9yRmuYB93zGN6YWl0BkJeXsbkLqw4IeRlZPmI4TkxoM3d70UyKLbsIZ0AHAoJ5ad2MJ
         wXNw==
X-Gm-Message-State: AOJu0YwVjX9T3nco0CDi5pTUjDbelEiEoCyrQrXGVvRx0v6bF0n+AMVf
	zN4zes6vI+Mj5gsJxH7r1FwaUdu51/DU+HClFJg=
X-Google-Smtp-Source: AGHT+IFZEETNBnhZqoOh+2Anls78AcMDwrH/awEDH3qxnBxIacbyY6NkN8neQdu3JvQHwvGaHUabvg==
X-Received: by 2002:a05:6a00:80d4:b0:68c:3f20:5e8b with SMTP id ei20-20020a056a0080d400b0068c3f205e8bmr944702pfb.15.1693064362249;
        Sat, 26 Aug 2023 08:39:22 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/20] yocto-uninative: Update to 4.2 for glibc 2.38
Date: Sat, 26 Aug 2023 05:38:45 -1000
Message-Id: <f6c43c32394f1d603679061819f7720e5158ba3a.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186758

From: Michael Halstead <mhalstead@linuxfoundation.org>

Uninative 4.2 adds glibc 2.38.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6654fab00a1b4e4bb05eec8b77c8c60e1f8a709)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index b3bd7794fb..6596c0f4a2 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "4.1"
+UNINATIVE_MAXGLIBCVERSION = "2.38"
+UNINATIVE_VERSION = "4.2"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b6ff9171aa7d3828bc81197822e804725908856bbd488bf412121cc0deddcb60"
-UNINATIVE_CHECKSUM[i686] ?= "6354fd2e09af1f111bad5e34ce7af4f9ad7cd266188af7eeceaeb982afd5354b"
-UNINATIVE_CHECKSUM[x86_64] ?= "f83eca543170adfd2432b135ca655922a4303622d73cc4b13e92b973cdf49e3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "cff40e7bdde50aeda06707af8c001796a71b4cf33c5ae1616e5c47943ff6b94e"
+UNINATIVE_CHECKSUM[i686] ?= "a70516447e9a9f1465ffaf1c7f89e79d1692d2356d86fd2a5a63acd908db1ff2"
+UNINATIVE_CHECKSUM[x86_64] ?= "6a86d71eeafba4fefec600c9bf8cf4a01324d1eb52788b6e398d3f23c10d19fb"
-- 
2.34.1


