Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD5CC54E69
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:31 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.34195.1710728546014708549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B85t0Wks;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c37d50adecso1345583b6e.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728545; x=1711333345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FFBPXBeDZxmg9WIrfGltp9RsfYGigeAeqmBuMuSioo=;
        b=B85t0WksjnNu/kcnhLArhvhiWFQtdSuy/WYkQ+Qz9XpqrC77Bg1TIPLUB5b8ovVcsT
         p0rlwMw4K1QsYM/BT+nHnUSPCx+NIV8oXD/FuiOTnqNrjCSnSSXSjExLxMmcJWyY9tzF
         Xq8g5ZkFMBbg5i3m5a6htXEPTEHWBv3o+dEr9Pq3aAFqhAuQqudDQUqAioFgxorOyz4v
         wadpWf4awizMevxEACsAqaLLgQRF3ME4zsthLm3263eMSLdPrDHa5tw4Q2Fx54uQD0iP
         YdyCiyx+8mrQ4MkatBoR5TN18MRUiDJ82o6P6bbpUxdbB+UzR0flE4zGU85f+TbMdWi4
         W9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728545; x=1711333345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FFBPXBeDZxmg9WIrfGltp9RsfYGigeAeqmBuMuSioo=;
        b=W2cgCInw7riJfZTc9MVStGnYFPOdtqdJ1CYTLe3NG1KhNKtheLOtPtYFgBY4M5H/WO
         HfAVLQOtFmQQ/Da/bki08VLxHDxK33bFiR7mhMquen3O7GWHus/uxqpSCVgoafgf2K+I
         pDrteZu/iO49iMyF+lhd8vy46NJhmjZiWKyMNcrIiMZ/6Zt0Glv6SS+fG9gsUaecUqrQ
         pXGwcF9b/UbNUP1jySuywun0TJ0tcKriCXiPSJhGiqMWyEjBDOG/Fsp4HsPh4Ij/qLqg
         Ss77eeSaFTYgfqiK0f8RBaEd+hS1GEReYfX5Zzh6BdFNAGB8nTZvTUB+YopzpRK96i2M
         rIzw==
X-Gm-Message-State: AOJu0YyEMtRmmpEzvGrBVuDtIQHfmcsagIv+iapNhvAPcr4BkspcOWsO
	mCP9UkZbXmpXHlrYV5R8FFeuKIGwffzxaVpppyqHvjnzRKi1PMshjOJs44t8DzTdUQxOVpI89B5
	99DguVw==
X-Google-Smtp-Source: AGHT+IGOlZOgaeVLJMYNfVlys9Yr9zjaklsnhC9oN01QJcpbe4yOKp4uBzuNLBxTan6HWLVHDA1N8g==
X-Received: by 2002:a05:6808:399b:b0:3c3:7f24:4537 with SMTP id gq27-20020a056808399b00b003c37f244537mr8710002oib.42.1710728544869;
        Sun, 17 Mar 2024 19:22:24 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 13/14] yocto-uninative: Update to 4.4 for glibc 2.39
Date: Sun, 17 Mar 2024 16:21:57 -1000
Message-Id: <eebb03d9409df143c68262264a7d3991f6e94a9a.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197288

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56fdd8b79e2f7ec30d2cdcfa0c399a6553efac1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index eaa3e9b31c..4ac66fd506 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.38"
-UNINATIVE_VERSION = "4.3"
+UNINATIVE_MAXGLIBCVERSION = "2.39"
+UNINATIVE_VERSION = "4.4"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "8df05f4a41455018b4303b2e0ea4eac5c960b5a13713f6dbb33dfdb3e32753ec"
-UNINATIVE_CHECKSUM[i686] ?= "bea76b4a97c9ba0077c0dd1295f519cd599dbf71f0ca1c964471c4cdb043addd"
-UNINATIVE_CHECKSUM[x86_64] ?= "1c35f09a75c4096749bbe1e009df4e3968cde151424062cf4aa3ed89db22b030"
+UNINATIVE_CHECKSUM[aarch64] ?= "b61876130f494f75092f21086b4a64ea5fb064045769bf1d32e9cb6af17ea8ec"
+UNINATIVE_CHECKSUM[i686] ?= "9f28627828f0082cc0344eede4d9a861a9a064bfa8f36e072e46212f0fe45fcc"
+UNINATIVE_CHECKSUM[x86_64] ?= "d81c54284be2bb886931fc87281d58177a2cd381cf99d1981f8923039a72a302"
-- 
2.34.1


