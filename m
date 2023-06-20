Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369DEEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.722.1687275607040402574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=OxHEAA9k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b52bf6e659so21849195ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275606; x=1689867606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cLP2ab70gmuIdvvYyIEahp4/ioRluVANLCDJIPY05c=;
        b=OxHEAA9kzOCSRS/uc0nbfFeWq3Z8ZGAzF9k/EC/WqL/IfaYzSEYLezXboz1EsEcBf5
         o7K2q1RVqh8eGfYeRiu7kiWbqZlPwR+jzagHonYhMLKza3gPfokkiQXpOmy2bogD3nd6
         AH6BEqIh/4DY9lkP3GXLDpMkM6yfdfUAm9jxe2p6qk2IQ0D0A5OS649AHA+qS83j3bMp
         54ulE4NNFQaTNY4RNn0LBgiY3OneX5onq/siG5HouqYkSBmy/ZIrOew6UTUckNrYUXiJ
         THMK4xhEtuSs2y3/8QyxBj8u2uuz3COAxa5wFvq/Gl6KXCfCsvozRUN/GiCPOuGpZv1U
         11Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275606; x=1689867606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cLP2ab70gmuIdvvYyIEahp4/ioRluVANLCDJIPY05c=;
        b=UcCAX31CTZxs0y3apEcLZFGwn8bkhr3dE2RRZBXDhjXyZ/j1MrtlCAzRDhdQCe8BCH
         PAdYL+2I/cNt14qIL2n9jtX8iVEPDfFi7/36XPR/aFTWDQjCbVgszI2kHlqMO76/xLq/
         Th4XtZOG/Ps75C9T16fgbrTYimmrgMyTC/SJRZj5O3ChWVjZL3F4MSF1Y0qF6oE4iwpv
         WBLMyugGeqCO6MqPm0JuVN5pY0xhTq1FzTUgGx6Ii9r4ioO/ex9JsPXWcMiGnYF966Ut
         ccpl2cF3fFuMjXj2O1pLYgv5PI+8PmIFYxD6z1OyhNryG4ph+z9ytZ4gF+aWE7jfrBAj
         8LLg==
X-Gm-Message-State: AC+VfDyhqb30o/iVUd3an7GFaAg0G9leTV8/wE/8VGY83EfQvUMGOJUY
	ZNPjjbsQywwKMZRbMe04IUCxCwGMWsJ2grD1eh8=
X-Google-Smtp-Source: ACHHUZ71gaLzQ8nJdTVMcTPANMDgcvhGvkxeIGrC3xmsO+hHuWAsYWt9BZso/I31pbJyMo9BRLO2tA==
X-Received: by 2002:a17:902:900c:b0:1b1:76c2:296a with SMTP id a12-20020a170902900c00b001b176c2296amr6433327plp.60.1687275606114;
        Tue, 20 Jun 2023 08:40:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.40.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:40:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] kernel: don't force PAHOLE=false
Date: Tue, 20 Jun 2023 05:37:24 -1000
Message-Id: <44b75c7442b05a2fedcc0d73982566c2bef84357.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687274724.git.steve@sakoman.com>
References: <cover.1687274724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183148

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3d5422b09e..fc48737869 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -232,7 +232,7 @@ KERNEL_EXTRA_ARGS ?= ""
 
 EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
-EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false'
+EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-- 
2.34.1


