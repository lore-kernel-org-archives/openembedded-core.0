Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E3DC4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:09 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.11882.1651248121486996509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1J9UalMs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id c23so7559559plo.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NTlHYOw0VFArTK+VLbh36WOwkbeMOFqD36OxMGLiSP0=;
        b=1J9UalMswsljCI6LfSqBSlGCnzsafJGQbOCYGdZoS6SeaFBps0zPewGqG9cODPN6p1
         Tyv4CX/mZhV7GLpz0WH7W5QEiPmxArbTjbg4tVl2Jkw3w4eLneQwcr813Lh7YgfRBd0X
         vby3SCOPp6z2wsiZaxyopzPXiUNSxco10HpYHHCvq2IgFYiPa/uIxV3PWQxb+n+Pnix2
         /oDpdtut8/Ifb5HB9CxNit0UIiqlRxn0yzH9fsxVB4JbvkfHyfRu1UNFltqGjmDQCpI2
         Qcp3HTPqGWZMU4CheLZTK5ezhTBw4+dKi0mby+GatT8xXvpoolLV5li50WklnpAqahAC
         kSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NTlHYOw0VFArTK+VLbh36WOwkbeMOFqD36OxMGLiSP0=;
        b=74+8d2W28gidjyjllrcFwBQTh82IUdAs5/4j7BcFt56gq9PGyoeftS1Oy1xN5wAOcw
         ZpZKzAQ3lVNVyc5gd3DXu1YMxQhEU1zFSUq2nETDsuCJIsiJk9YDCFZGTYzb3YFd8UU+
         PmzxNY5n2Ye/+2MitkEqpVhYZo5ifHFqINczS6pf9jG0BFD6/neHrR3q70AEOrtMSirN
         PCqNhTxJZ2jaJcy/WB28BPrX0BFYFCpCb9d1tTdG54FEm+7HFEheawQQebX23KMHKyp2
         RAHoB7tA+9rct6bUsJipJqJejDaJHgpfdYthlRF9CSrW06OL+6Qcg5pUUAoR9V4SC5wD
         NVXg==
X-Gm-Message-State: AOAM530nGUniAy7iQPqVYFsgFAeJTJZ/oHwPOZU+T7Owo4SzG3hSDBe/
	mr0Zkx0FAyLg82E70NuZWZ7JXMMSMUZL8Pk9yDA=
X-Google-Smtp-Source: 
 ABdhPJyn3u5L2LogiFc/i6ut/yywoR/plpwz0IfrzOb2CuhIyzNzJW69J121/XVCXZ+91rWmiZH3IA==
X-Received: by 2002:a17:902:ce86:b0:15c:3807:e66 with SMTP id
 f6-20020a170902ce8600b0015c38070e66mr66060plg.125.1651248120275;
        Fri, 29 Apr 2022 09:02:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/34] libc-glibc: Use libxcrypt to provide
 virtual/crypt
Date: Fri, 29 Apr 2022 06:00:35 -1000
Message-Id: 
 <bdccfa48f2dc58d716bd2ddd9c6279584fd6515b.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165035

From: Khem Raj <raj.khem@gmail.com>

Fixes
NOTE: Multiple providers are available for virtual/crypt (libxcrypt, musl)
Consider defining a PREFERRED_PROVIDER entry to match virtual/crypt

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4417dbf6fcb1f067705c8bd2220f4093ba899cc1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/tclibc-glibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index f4855dce11..f48d16939e 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
 PREFERRED_PROVIDER_virtual/libc ?= "glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/libc-locale ?= "glibc-locale"
+PREFERRED_PROVIDER_virtual/crypt ?= "libxcrypt"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
-- 
2.25.1


