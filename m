Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109B5C83005
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.158.1686329674265455063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eKSJq/Ok;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-651e298be3fso2074374b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329673; x=1688921673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJ/Xc6YYXCZj3TY64EvDqcJvT4S8QnZvQkFGFgmnJgs=;
        b=eKSJq/OkGuZsP9l0+Q5an2MpX+mJF3zv/KDf0SYP5050l3Ig2QVkpyVsT1K9Jovw2E
         2b0X5qlDzH+u+bjKMniCCvNMpoPOxozyvSviuovRb8AEVV0pUox4/ZP64cSbfo6lEJlv
         bellcGOJ018DG6umIyG3+i6n+H33SPLB2GUYZ2U+JAGqzAl77MqBxCenNuyeuAPWjLv8
         gsK1s82fW0ADN6puFY9BrAeMCv6t4eHWo10dR48TkHxjpTXP7YM1CUpPtlTc9zgZUxiG
         9/xJV7+G2DILofRPBBs3T9gtXGegfgQgBM6tGE5WzR5UIThJxgCzMzqQEjnUox2VgP7F
         RqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329673; x=1688921673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJ/Xc6YYXCZj3TY64EvDqcJvT4S8QnZvQkFGFgmnJgs=;
        b=AEkPJLd+FhfgHMTdYADBErQ8F2Dv7W9wFBqw/CYG9gftamd62nl6hrRmqjRCr7p5iI
         78/Mwo4a/kmpFrK12pMWQ2HkSPn9MPOSPjLzLwF3htdee/umrQKIWjzMt9gP+LCU847a
         QiNZs+xQjgobenioMzuEqgJuZbONPg/+so5Kit2AcDXue3HBkL/iHwrUvq+SW3GHujkQ
         QQelk7OfxStIuGdnF9KQAY3TD+gpfFOR91V0GxuUiZZAZ2QWKaR0U4vglOfMyJEMQKmu
         gZ3eEyLvxm5LXDRWC1t2luFuk5yVwEShYVvHbydUnS2g8emuFa05zzT0wRlP59SzfCUZ
         x0GA==
X-Gm-Message-State: AC+VfDz5BLXGy0GZGGzJ+stDxhapMQaLRrIpWlVf/CIfRgyWis0FEALB
	mcANpWs3xXiomlbYNyp/l/p/OCr5z8jkWM4oBTo=
X-Google-Smtp-Source: ACHHUZ6HXiQDwU6oD3eRiIf+MraRizHd1ERuZnek33Vh0/cuiqe8KHyFXE5Ypwfj+wuBtlV5r3dEdA==
X-Received: by 2002:a05:6a20:3d8a:b0:10c:c407:92e5 with SMTP id s10-20020a056a203d8a00b0010cc40792e5mr2379750pzi.22.1686329673329;
        Fri, 09 Jun 2023 09:54:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/30] kernel: don't force PAHOLE=false
Date: Fri,  9 Jun 2023 06:53:45 -1000
Message-Id: <c6f13dcb3e04655c8076c1100ceada760ffb1ddb.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182584

From: Bruce Ashfield <bruce.ashfield@gmail.com>

If a specific kernel provider or configuration wants to enable BTF
and pahole analysis, it isn't currently possible due to the explicit
definition to false in the base kernel build arguments.

pahole is now detected by the kernel built itself, so unless
pahole-native is enabled, the result is the same.

If a kernel does require an explicit disable of pahole, it is better
to carry PAHOLE=false in those specific recipes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1e4851a36ed47ce6ba880a49264b9a57c78cf4f)
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e634eabd49..1e97de5696 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -235,7 +235,7 @@ KERNEL_EXTRA_ARGS ?= ""
 
 EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
-EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false'
+EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-- 
2.34.1


