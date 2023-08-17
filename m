Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7387AC2FC0F
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 18:01:37 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.711.1692295292059435356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 11:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iTpwwP2P;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so1238061fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692295290; x=1692900090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xiNLYeScTbD3pDR9DEQpq4HmqWfQh6PSQ8uxi1BchBk=;
        b=iTpwwP2PUbPat41iJ3GOAk8bYZnV9uZQJ2kOg393RKXvJKA5nyWJfPzbWudg7U+3vE
         b0zXmEfhOQUf35ravVqN07Gu+TZEAHeKB8Wi6+1I/CUy9jTgEZdiRSYLzq6ifQfGeMpZ
         nDdKEhLt0VQGQ7uvT3PP+c3YQH8og954/OHZDKduu4n0I/crqM3RN7pqtPxlPS9QEw/X
         G8N2UoKon6jK93lkNg6FkOMn3dJcYshKWajzltylPLdDrQ7zVw29RUD9d7HPou5Uk2BW
         AVcMSZ/qt6vox0fwbRVsAbKJboklUEeYfhKM7pM2N2l5q/t/rEcHpURMv5ckiO/nI9K1
         ICPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692295290; x=1692900090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiNLYeScTbD3pDR9DEQpq4HmqWfQh6PSQ8uxi1BchBk=;
        b=Wkhmuc0ebLeTHhRTeuO74o1p4tUZWkJew9FQMuLIT3k7zQt1cf6RXe5lYPnNaIgWIb
         +STnJ+4lvGM8PPZFVReVB//jWeIKUxDrMfyHxcYYCPflZ3idoUJyYB9K3yo5NtLD9mfT
         CWEpRapv+oyRanarSr/yjrPc7Dl8Tky05w8so0OGHHZIH6AITt14BDWlzZSAaJDU7TNv
         58UwcwRrKZaFTt0LicWGuZXsHUr2Th4KH/waACOcQNPyUYpwMTK/UihgUqiza9YXiGl3
         TWO1tBARC/bxeb9V2JIChWobp+fdTQ5DpHEDJsTVOKGIUn3mXkVEbuRw/e9DDbMT3+ih
         NhXQ==
X-Gm-Message-State: AOJu0Yx7zKcqBG/Nn1JhfpMTkQn78cwA8jKHWgb4Am540HiFeVSa2VRJ
	uFsvrYarTvfmQiO4a7bQ2M7At3goDJI=
X-Google-Smtp-Source: AGHT+IGUp3qi8c6vMC/49EeWF2PfdtUr+6HD+cu0U+sSiSO6VgJNZVSbDTv/R6HbiTxqpUjJdGjzsg==
X-Received: by 2002:a2e:9087:0:b0:2b6:e958:d03 with SMTP id l7-20020a2e9087000000b002b6e9580d03mr62590ljg.30.1692295289669;
        Thu, 17 Aug 2023 11:01:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c25-20020a170906529900b0099cf840527csm24670ejm.153.2023.08.17.11.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 11:01:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] cross-localedef-native: fix build on hosts with older glibc
Date: Thu, 17 Aug 2023 20:01:05 +0200
Message-ID: <20230817180105.1544006-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186332

Older glibc on host might be missing __glibc_has_attribute added in glibc-2.34 with:

https://sourceware.org/git/?p=glibc.git;a=blobdiff;f=misc/sys/cdefs.h;h=8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=57ca262bdfb642bf4a945645532f2319ec1ff437;hb=c8ba52ab3350c334d6e34b1439a4c0c1431351f3;hpb=7dd416491e080456fc7742d884c520526509413e

Fixes:
In file included from ../git/localedef/include/programs/xmalloc.h:21,
                 from glibc/locale/programs/localedef.h:124,
                 from glibc/locale/programs/localedef.c:36:
../git/localedef/include/sys/cdefs.h:85:51: error: missing binary operator before token "("
   85 | #if __GNUC_PREREQ (4, 3) || __glibc_has_attribute (__cold__)
      |                                                   ^

Only commit included:
e0eca29 cdefs.h: define __glibc_has_attribute

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 7d5219f2d2..f53e59103e 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38"
 SRCREV_glibc ?= "36f2487f13e3540be9ee0fb51876b1da72176d3f"
-SRCREV_localedef ?= "2d6d138500779504ba52e564edd21a3e50ae9472"
+SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
-- 
2.41.0


