Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6679AC7EE43
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:03:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.39009.1686499391492943589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=JwlKSxq5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b3af7e3925so6464105ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499390; x=1689091390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2DXY0rkq/i8yPccomW4TBuIc6WRwOAXTQ7Pnp02RM0=;
        b=JwlKSxq5RINhSwL50M/rThTmSZi6cQP6b0FDjqtB22UNEMvyPHI2hUCvV86h6lMn/M
         yTd5DkvqLm6FE2kshuCNhLU5aZ10ARcaSsBuC6YW52nRkKG1Pe3LzpOtxfCUCjWh+Vqb
         KhRrgiV84HS2El+qG+IM7coTtXb3TC05HtuYMs7ewsXNheVe7deUixr30SzRMyjlF7NC
         tnBlMHvFqzHWo6HKDCmu4mojc3/wfSgnpVB4CeQYY4KVYkhKVdZ1HUGVEAovkeu2DrTm
         qGG1UfyH89vYEnD0K4mAw9aJosFXREYuqo4ELeS51wnIIZHmtb6ZzHcA+mM2Illy6cZm
         ZTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499390; x=1689091390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2DXY0rkq/i8yPccomW4TBuIc6WRwOAXTQ7Pnp02RM0=;
        b=l95vfSGU4VIW6g9lfUuGo+9rjoxrmO51RxkanKqTw+Zo+iVv7P8cemkFWoCOptOv3k
         kGEozEKVERykPMFax6IuhQnOc+grbCwFu3yqNUiDus0pUwVHeO0GOlToZORlCZNRvtoB
         F5y0HalGf0KUXFiR9URid4Hqv48mZCH8Knz80+5GVa3fYR8iin7ng5Qhrhbgn6WhXPRS
         DUW6BP/wCmILP0Ld+JNSauOKe+zWFYg3C+P2G2AsfyN/jZ9OeJrbqIfD63uPDCIiWnaA
         Cj2w6K0Mclc33ISbfATydcQAvBVGpqYwhtRn0k0R6mw4/wPqDxX2pCIpegt5VjKDEu65
         rJPA==
X-Gm-Message-State: AC+VfDwfI6JOTGQEgSHrSXxj3u/J9GnyW2Hanv8PqVD0X1YJW/KUJclg
	QbtrOnkUy+hrChNYRcqrtCJsejQDTei2mPW1YmE=
X-Google-Smtp-Source: ACHHUZ7t93peZv8/bh1qeM1LzBOvyo0DEKcErn1avmm4gct7hdnlZaUoyH0DWJWqH46Hb13Z1jVJZA==
X-Received: by 2002:a17:903:244e:b0:1b3:c7c7:74ae with SMTP id l14-20020a170903244e00b001b3c7c774aemr1439335pls.45.1686499390568;
        Sun, 11 Jun 2023 09:03:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.03.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:03:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/11] uninative: Upgrade to 3.10 to support gcc 13
Date: Sun, 11 Jun 2023 06:02:43 -1000
Message-Id: <dbf2a81d42b48c22864f64425672315158eb99cb.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686499221.git.steve@sakoman.com>
References: <cover.1686499221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182632

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f811bffb861b23238e8291394bd6e8407f013619)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 8a5cab5360..f3c05b7e20 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "3.9"
+UNINATIVE_VERSION = "3.10"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "de35708c95c34573af140da910132c3291ba4fd26ebf7b74b755ada432cdf07b"
-UNINATIVE_CHECKSUM[i686] ?= "adac07b08adb88eb26fc7fd87fee0cec9d5be167bf7c5ffd3a549a2a6699c29c"
-UNINATIVE_CHECKSUM[x86_64] ?= "3dd82c3fbdb59e87bf091c3eef555a05fae528eeda3083828f76cd4deaceca8b"
+UNINATIVE_CHECKSUM[aarch64] ?= "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
+UNINATIVE_CHECKSUM[i686] ?= "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
+UNINATIVE_CHECKSUM[x86_64] ?= "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
-- 
2.34.1


