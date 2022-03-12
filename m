Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C02CC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 17:12:45 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.6864.1647105164670082995
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 09:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b/BbVCb4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id j26so17550367wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 09:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cdpg330xv4xEcBsQ3OHaq40XRNExzFnX47Gd7oVjbR8=;
        b=b/BbVCb4PZU4J5efZklG9aT7NSYlM6ZnI4K3fpiEt/1d5g5y0hdtdX9MTDKgmcc3e+
         BGHTcw6aPUppQukaPEKsLp/R3oYKMJ32QwYNkBGUm1jpib5z5PzOwGsU8yWRzRRcjxnf
         6hy7lmzHWXd1zEtRgikF4VQMu3avPrhiQqvvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cdpg330xv4xEcBsQ3OHaq40XRNExzFnX47Gd7oVjbR8=;
        b=2WRFnKdvnIrY2HQhqW+Pn9O+pCKt6z8j8th6zqFh3/LpruPFED5vneEUWgeWgkxrpt
         jFh1kxDtH6VI02MFCpvHZbLZQnQhktyiZN5qfpU8MgVIGlrNPdhTmK7OoZd3NsDKhaz3
         bkcW3Mx2BShlkI8i4jNwk8CcDzHI6tjl0WWG2HtMAd1EkPZHzH/eXLzRoTVAF3oSA3D3
         b1zunjwn5T74PldXtZmE6VVmTOu88zMxYv1oPeMxkIgoBHsNoY5wDM1tqP732f+tWhwp
         uALeHOHylRTnqMSAAvCObgVtUnP8v1OAmWm2AI6UMfrcs3MEfjSlFBE9O+xvsaZYYIFl
         U8CQ==
X-Gm-Message-State: AOAM531kPNlh/mroy8L9axIQ2efiCCZWaeDgtBf6l2aTbimIq2w4wsu0
	msZsJNQ9hF0sq6ZzJx6ESJixPFNZb/PFFWAF
X-Google-Smtp-Source: 
 ABdhPJyL8Ev62SlydycrzvLZRSnInLkCwzC7kvsx7tyoxrJWYMem1jmkl1/zYlAGZ7fm7r8caZmuyg==
X-Received: by 2002:adf:f852:0:b0:1f0:c888:d240 with SMTP id
 d18-20020adff852000000b001f0c888d240mr11208794wrq.300.1647105162615;
        Sat, 12 Mar 2022 09:12:42 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7])
        by smtp.gmail.com with ESMTPSA id
 h36-20020a05600c49a400b00382aa0b1619sm9759244wmp.45.2022.03.12.09.12.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 09:12:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "mesa: make sure GLES3 headers are installed"
Date: Sat, 12 Mar 2022 17:12:41 +0000
Message-Id: <20220312171241.725269-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 17:12:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163097

This reverts commit 7c6effef9d471efbaea76e23e91938687fcc661c.

It uses old overrides syntax which simply doesn't work.
---
 meta/recipes-graphics/mesa/mesa.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 62895665338..2a89b8e8f04 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -190,9 +190,6 @@ RDEPENDS:${PN}-dev = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
-# Add dependency so that GLES3 header don't need to be added manually
-RDEPENDS_libgles2-mesa-dev += "libgles3-mesa-dev"
-
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
-- 
2.32.0


