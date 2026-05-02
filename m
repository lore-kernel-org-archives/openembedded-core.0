Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E08CD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9530.1777739491816724172
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E60/TYeQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe62837baso1457059f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739490; x=1778344290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IC1Jy//dNkpXqrY+Bj/gogEZtbM1VWE7+AR27FY4jWQ=;
        b=E60/TYeQoen+WzbLkd7cOhSh8gzdelzvKJg9Jk1D88YNl85pJGX6FCwTon6K+u33xo
         CZzzgFBg6+UW7bgeP1P1F6gbOFS1kSxNzT4+yXHxM9A4telpn9ejHxC9n2LHWGpbSgbm
         Vs89ksx/GLPO9IOiBVUiZhDvL8BhXQg/3Plvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739490; x=1778344290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IC1Jy//dNkpXqrY+Bj/gogEZtbM1VWE7+AR27FY4jWQ=;
        b=T7RJMGK2iLrUk+x5+j7RtPotwJjiG7LaHyqTF/pBleooIpHeqSUvPn0i5exJO950oJ
         rS5yjVeeRb2DrUcn5JB3HB4nJCoBDSB+hnwEJK0Sm2DVl/JQLLv4JPSY5WLfMBX7eASI
         DFcPJMKMVzbreXPb+FvaHJRNhnPtOZMWXD4cj/JR4+E1xoL93/gNiEqJ/V7I9CfR2VV3
         f0ZNiVLDIz5AsXBBsCWqGWwLyYOPpNnoVI+iV/zeaTSP731kCC85lJgs1P11tCCOb4Mh
         v7xiUwC9GA88YOxUKYEr0DzU3iHWWNbxEijGDNwpfYIpEH3w6Da355yhAfkrWjwMTL2q
         dZIg==
X-Gm-Message-State: AOJu0Yxjm5kOSu13KzZhQ0YeHHpcqRmXJ+/a1i4KMPJf8qpFsP7fVw1F
	i/VNoZh84w1br5Q8657ylr+bNEIVHt1VceqnPEzeapYVKheRqIN0WfN+YyTiFnAY336GXdwl7Tu
	n08aFCDdGutarXZ8eXJHDD0K+gytiz51RI231DQf7WD+Ig3ze6Two9PThMTr7AP7w6fO7TTd70W
	OM8B2TTF+SeINOSOY=
X-Gm-Gg: AeBDietHeDsR9u2PYsGrWfexYuFjN0AFY4zhAXc3f3JheBY8yk6dQMUu4MqiaEzKsVb
	2pp/LtL7vW55aX1xeN/Y1xpamPE/3Yk1k/J57QTeVwV3CN5LEZeCIFz+LhHsJT8gqVLhDEXmClW
	RcGE2XqdSQnPbiIr7FucBBPOiKPqJq+kvK4n/n7uk0b0d+PxfbLohhO9EzPwdkklfLjDI8THzRJ
	Xno9jm9H9LrEf+z6vCwrmBBmTkbKWpLRMoVmeBrfsaa0JJe/sVx5vL/CqyddITF7RvW+f85l4W6
	Y2eiVJRyutmGq8qDz5lzygNBoRYRF5RJ6pOXcxaVAjIBTGig/LBoOsxDABkIEGeyhE0Z3mFREZ3
	7qO5OSKoTN04AYhlM8LQsd4lpLm2iA/TxtS0/P/QRlBKZPWMH4WkYkxmiRBwb5sr52hfaJ6FzAR
	5XdU0K9VrM99lUDKfdXppVURKph5Cmh2ShuVxvn9s1qUMloaBnmWq4jNGn8JvM8ZQ=
X-Received: by 2002:a05:6000:1a8b:b0:441:1e1e:a050 with SMTP id ffacd0b85a97d-44bb4af9c87mr5691005f8f.16.1777739489728;
        Sat, 02 May 2026 09:31:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 58/62] spirv-llvm-translator: upgrade 22.1.1 -> 22.1.2
Date: Sat,  2 May 2026 17:29:18 +0100
Message-ID: <20260502162929.1377831-58-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236367

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...lvm-translator_22.1.1.bb => spirv-llvm-translator_22.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.1.1.bb => spirv-llvm-translator_22.1.2.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
index b4ec006abc4..2ee9819060d 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_220"
-SRCREV = "114f5ee1cec66fe2ca733c12770c1bc196675d32"
+SRCREV = "f676199fd00f2229fb35006d5124687c0785a01d"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH};tag=v${PV} \
 "

