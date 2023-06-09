Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107B6C83005
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:46 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.187.1686329682722155443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rAOriBA+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-655d1fc8ad8so1727819b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329682; x=1688921682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNsbHdvStTsW4fDbMrd3Ir4W3/T01WFGLpOehofLk4o=;
        b=rAOriBA+B7iUUO2a/pXFeHHqL2sT+E2ixsnZ4H5UAu/ZDMER6ZrrDyAP42r0Bkdkmd
         yIcF4gCcyuYGcQ1vDs4iG2CY4McAu/o3vFNIGn8tZScwSggnOA7QMxLHKoqbw6SU3WMs
         eb1d3hxojgrtVQr3jKS5BDzHI7Sf+63lpI/DFPHKdfO0rZDbebBEIOqEANp+u3KYrWtO
         2VkQU/gdR1qb3DLezYiLH7+pbWcOucbmvQuPCW3XoHhSobj6diB6flqqsvUN71FtXtWt
         X/3to6a4f1tO4dDp+1pCqWse+OhSEkGdqFaIcfI2roEAPIURycleD77SmCAwDp5cgN3/
         m7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329682; x=1688921682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNsbHdvStTsW4fDbMrd3Ir4W3/T01WFGLpOehofLk4o=;
        b=PY1zJFJqMQCPiw2wCtiKO/ipaFg3nBYauroSbswft/y+QiCcGzDzjYnb02W8/sphtD
         NTiniy2FMP9SP1zBLqRhgb7VVaBWPA/6aISJr5JAR7qHdls0a5tBuCB2k0Rns5GXZDhO
         TLR5Zz4moBx3kSRhZXcM8tWw3UdNBcE9EjYXKW2kRorqdOycgV1sqt/ffRAW/DW8Zj6+
         SHduJeoD2S1+3vWkCPZ5Ey/GgwqFW8jOVBXfS3heIOHDncV1xKjmP2F+A1O7WR8m0scV
         CnC7qM2cIAPMYgBtotCcL5rWNIDdXis0ugPbKOYjbj7dlmMckFU6HxhHpVugYjYmCdkW
         wuUQ==
X-Gm-Message-State: AC+VfDwPIL8iqq3yDGTXIN8sfZzk7XCDf6B7lkYaP/SzwYx1LhEgF8uG
	/2qlxz/GG+8C2p0Kk1tUdzvqYlrBT1D+brpjmdU=
X-Google-Smtp-Source: ACHHUZ5KXQCxvqqCxJPcDKPaY/Q8qcEOPlp9GzvjiCBogSDtGnqN1/vG74ye8/y9uEI6VEfuMyzZjA==
X-Received: by 2002:a05:6a00:1887:b0:663:18c:a176 with SMTP id x7-20020a056a00188700b00663018ca176mr1937541pfh.32.1686329681657;
        Fri, 09 Jun 2023 09:54:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/30] xf86-video-intel: Use the HTTPS protocol to fetch the Git repositories
Date: Fri,  9 Jun 2023 06:53:50 -1000
Message-Id: <155fb4ffbb02522cc5dde22c4d8a69a3e299b86f.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182589

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This matches the change in commit 139102a73d (recipes: Default to https
git protocol where possible), which did this for most recipes.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21a06cb3f19570c65fc83d45069cab22136768b0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 74ec57aa66..21b499e666 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,8 +13,7 @@ SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel;branch=master \
-"
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel;protocol=https;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


