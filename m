Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828CAC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:49 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.3380.1685672564543116750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=JMYgGx0M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64d44b198baso1282501b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672563; x=1688264563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2DXY0rkq/i8yPccomW4TBuIc6WRwOAXTQ7Pnp02RM0=;
        b=JMYgGx0MQ0TjHPTvBoFYRQaIg8QOxxG0Yxp5e4SM66fXOoGU1H/oDibuaO9Fx9fpQa
         K1Ns1vHr+WdbM2usew1Ay03g8Z5Mc8GYLbJvdPXHDZAk0PkifvvMsoLxau4IgbKLJpbD
         Tu4m3GjJkhxcAa8vbvBq+mLbDRx4WEKHATT4K3u2U/8Gr8u6IX52WlPRT1nk169IvTy7
         42KodrLLXOwdqxeHmBri0bcKth+uETyUC5WL4Gt2SZ8rRSqh7W/TvqIYOgo1DDxGDgJG
         jm21QvEIFAyxUmLJ2BZX3LjdkyEP02j4N3OMM0FZDDSaRyko0SwEemE56HN+noW2ENtU
         NNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672563; x=1688264563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2DXY0rkq/i8yPccomW4TBuIc6WRwOAXTQ7Pnp02RM0=;
        b=lfgnnsDXV0eFth9eqi9c45XyX5sg8nYc2ueU8+ZGz1/ld9EvstNtauZfl7jVzZIn8e
         jRN0A/D2cE3pDQc6JT72uTG+NiaCNiQ4ZyFl6EFlH3PxGRsVYvO05d7dQ//cuhIgGza0
         30sy1b/LlVu1+RPAoaRkEPJ2fXAmmJ7IHUHhBASPK/N8nnYNOC86L29p4luAT79doR6x
         mMnwcpA9mBibTVGiZFpnnrLS06Oa44eexnN2U4uSEQu5+SBUjt+uFqXjr/5lPmB+1+vv
         +/TztVgimYek9kElxQk4pw3W07SmzLz2KjXecJhwrGdcd+eFtcKKxX+rJOxokjdRlsl5
         aBOQ==
X-Gm-Message-State: AC+VfDxGWDzAqjgFXQMmHcq9B7QCMcFQ1iehfnlTMxSJwkLzEGI38ysZ
	P1+sYHZsYCaioU6NNbBNGlxVsOgYRZ99qfoK3Fo=
X-Google-Smtp-Source: ACHHUZ4q6UDlvyJHUzO7Fr4DEk9UoQ70L2i9YoD2et9dAQcsP3Z1Bmfr5xsBbLNIHCSMOQpQktVmAw==
X-Received: by 2002:a05:6a00:21d3:b0:648:e2c8:c40 with SMTP id t19-20020a056a0021d300b00648e2c80c40mr3863217pfj.11.1685672563625;
        Thu, 01 Jun 2023 19:22:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/13] uninative: Upgrade to 3.10 to support gcc 13
Date: Thu,  1 Jun 2023 16:22:11 -1000
Message-Id: <29205f67bc4e4ba3e8ac6e284fc2cd282b545875.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182135

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


