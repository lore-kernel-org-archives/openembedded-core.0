Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE22C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 15:18:50 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.15890.1714749526298480727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 08:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jSShgzGI;
 spf=pass (domain: linaro.org, ip: 209.85.160.179, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-43abc28f73fso17316971cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714749525; x=1715354325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=293ZbvOdHNEKuVJxUKqtzd7AQxkMfpTHKedzkbXIUGc=;
        b=jSShgzGIX7vhr+KFtxyKzRG0Hcqq0V1RvxzGegJkGBodFSxp3720paf+HsT9TTUArT
         dCEjuXnpO4+Ohbs0M5QaM6buf5vrwNGxg1w8kzojex95f7O1O6BapEGxBXa2BbGWNDvq
         Qzh94Ee+LsuzlJCMgbv8A7Cy4kizw66YFrpZIlnKMWpsBFuji5EoQqyUd8u8x8SLboaY
         ECLL91HogkD93cCzvCYK8BIyUA2JLS8/YZAyRkG/fnAOotTtrfJC1Loo6nyu76nv54Qi
         PZM3SuX8gtrIt7GepttGGbbOEj4OxYqrRM4n5bc2QsPhKXdMtlMN0PrienlahSFEEziD
         LCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714749525; x=1715354325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=293ZbvOdHNEKuVJxUKqtzd7AQxkMfpTHKedzkbXIUGc=;
        b=H4kc7qNn4LusDxUUyONSf4wjNsat8NI3fyTz1rh8IpbJR4MMAVpqfjQluKJuwGddTu
         ID7vTbrzO5aku2JVc2CxankmS9xLGmqkVe6Cbqy3/Rjx1Ef83E89dfbvfRQOUv4uTxJ8
         ApzAiWSxMgXl37Voyqi4iTJVuxLUBHsEfeFhRxj/V/jmF6bwNVot1B4LuNPMuaTQU2Yy
         SDF4Ccx6+mgwhHji0D2iAM/tBa242ZbAKa9ZIIeK8muAksJIQ3kuc6ueNVemfMuZJ1ZH
         nCCPxUq0q/OA/smQo/mmIK69YCW2yR5K2ZX9u78ja9kJUvdvJsxmKqAAW3yDbW7HxDvC
         LGXQ==
X-Gm-Message-State: AOJu0YwO9kbFO9ayMxdqTL0lefBrnFBCRoJHIFgGMjsWuBlTckNRM7n7
	DL8no4JvPCh1FoIIuyMyBicPvVqI9tJcFH3f44nC3jrs7l2dpcs1HgAfSC9fXSk0EsCgojCKeQJ
	J
X-Google-Smtp-Source: AGHT+IHYwsgBJvhXgTwzE/glC2ySd4yLPLkJ/FSMJE3G7uxHbx7a6+lFp7u2nDvApM/2T2F8gCdmUw==
X-Received: by 2002:ac8:59c4:0:b0:43b:4bc:6606 with SMTP id f4-20020ac859c4000000b0043b04bc6606mr2408659qtf.24.1714749525390;
        Fri, 03 May 2024 08:18:45 -0700 (PDT)
Received: from maple.home ([76.69.90.99])
        by smtp.gmail.com with ESMTPSA id ga18-20020a05622a591200b00432bb012607sm1659670qtb.47.2024.05.03.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:18:45 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: sean.anderson@seco.com,
	jamin_lin@aspeedtech.com,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] uboot-sign: fix loop in do_uboot_assemble_fitimage
Date: Fri,  3 May 2024 11:18:27 -0400
Message-Id: <20240503151827.1387077-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 15:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199004

When using multiple u-boot configurations in UBOOT_CONFIG, the helper
function uboot_assemble_fitimage_helper() was not called with all
combinations of type & binary, due to a copy-n-paste indexing error.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 7a0b8047e4..c8e097f2f2 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -367,7 +367,7 @@ do_uboot_assemble_fitimage() {
 			done
 
 			for binary in ${UBOOT_BINARIES}; do
-				k=$(expr $j + 1);
+				k=$(expr $k + 1);
 				if [ $k -eq $i ]; then
 					break;
 				fi
-- 
2.25.1


