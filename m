Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DE6C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:39 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.7287.1654699230805625898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7LCvAwrC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id n18so17816507plg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Jx7YVzMI35uGAl9V7RsxhqHmYzkN5B6v69kLgj7ewZ4=;
        b=7LCvAwrCiGzWpPWhmjbJSiPMn/tXyHSNjK441TUYri/8toUb3Xs6qp9cdIDXKJ316H
         7Bbjqo63CNbkyX2OEUjkqzS2rlIxFcnztkh82X6b3QKYC72xLAmFH/zxcOlmYFCsKr8r
         hoMP6q+6qHh0mbWT8xvUp72XYQhPTfZfMQVlBBv3QWucm1N641+SXu49OU5bBnCIwpjp
         JQs5lqGOMQZZQKlM/QXLIYn18cThfJA0X5JrtPrnKyX9DEwlVmNsVCedtCIZ24sHeJwE
         i4Ic1/SUUcT3M5ax37sqCOy5PB5mjk+gSe+6Pk+vas142UjQmNbo3uphU4BePxGChiC5
         XxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jx7YVzMI35uGAl9V7RsxhqHmYzkN5B6v69kLgj7ewZ4=;
        b=d11Io9AV4ufUPIbltgNHal+D3oQBQsk+mk6UDU+i4pcx2mUKvx0d5BK8Kj7o4WnZYY
         jgv/Of/9wEDSj0Gif41Maq88g/k2EsW0ZcIFIT86gMN0DVwynev6QN0gCf+Xmrk/BAVy
         YRCVX4PPc/Q0K4JEqxdBXxCFimMMPYYgZbeCDZS8a5qdDbaylYHglx2N7XV1bUzQ2ceN
         lKtdErnvC8oFxDDFaKraKhqN+LzNBYSiRftfGefKEf+7FCI8xy2oKMVWDgmnYK5+6xEA
         95IWE/0uFoUA2Wi8OrPyMcw/zkttKsLfZWxazdYVDdUJwfayeoH81KofAb2m6vFbzw5s
         i/Yg==
X-Gm-Message-State: AOAM530OgN2hp02A7MW+yoobkFFQeMJfWFpctU59sJPsng7d50NRLhey
	3ktSbkOY5HNjJsOlrA+Dn3rYZRiZJtxZFgHx
X-Google-Smtp-Source: 
 ABdhPJwPa8LRPYRL6C/dIX+UNGYdsIDaw9AOsIF0w8+2mk5Bfn2ySIslIdtYglaT7LymnzjMJD/20A==
X-Received: by 2002:a17:90a:64c5:b0:1e6:a230:2a71 with SMTP id
 i5-20020a17090a64c500b001e6a2302a71mr33054050pjm.49.1654699232062;
        Wed, 08 Jun 2022 07:40:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/22] gcc: depend on zstd-native
Date: Wed,  8 Jun 2022 04:39:28 -1000
Message-Id: 
 <0efcba381d51a9ab8519c3d50a8b48181a0e38e4.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166726

From: Jeremy Puhlman <jpuhlman@mvista.com>

Sharing sstate cache binaries between two systems, one with libzstd installed
and the other without, leads to various gcc components being linked against
the system libzstd and failing to run on the system with out it installed.

Make zstd-native from our system available.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b0a6f03137f24b211c8881cebf65732e550a942)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-11.3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
index b1ef9d25af..acbb43a25f 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -11,7 +11,7 @@ BINV = "11.3.0"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 
-- 
2.25.1


