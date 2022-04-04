Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C875C636FC
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:46 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.36819.1649085565119475963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OhgRdmeB;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id bp39so7952816qtb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEop/xfldWD6sQjjx/V7vPpqzRssg6SZQ6oPvKCTX8M=;
        b=OhgRdmeBbmMnc1yLaMLyCh1eUouEZoeip0lDMxGJVgW0OSk8cSQE8lghnRW9vq0Xtb
         9iqDJpR7QXaO3zbIccedhlw68wshZIHrk4YfWucGZFQZlcNMMLQQNNZOVdYV4SAgtMnu
         uYws4HVipuMtrPhcgqq++MNqL4Xpcjv63IUvNS8Nkp5m6hBbIrACXmxi6NstTplR4njM
         OQC92+iqqOZbwO+U7fM4n2Aa9XNrquNPJ/YMnod6SLlORcAJZCgd5Net60JBrFNsjT7K
         dkz6dNb/kR+M9zwr9q2Rjrri+h3WbYbTPl0I7P184VOc/J4AtInCFtwoMSnx/hrdhOrx
         if/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PEop/xfldWD6sQjjx/V7vPpqzRssg6SZQ6oPvKCTX8M=;
        b=5PCoj/288/J9zAvKhyIqcddE7S5MBz27ZMvS90P6sckbQx8d/Zwfmkjf01fPr8A42J
         LcE/D7rx2o+zfVeh9umzejLjt809670wF1/5daRlg3zkTGUwOFAwi1SgLk+Wo52dUaTV
         sez9LmFc6Trs6xQu2xQ/i0FzqX00a7L8s6fXlYgbnePK7lCL0KHVZz1GwXTqb/qip8ON
         Vs/ET7J9cZnyakOrX79lkMsK9fIHQcoHKO8Qq275aeK+EBJHPUHewxdfZzxOkxtN2l9X
         bZt6AUl4rNKPy48Rh5Pw0YN3VB6qJfFB64xX0qVcF7FFGkJAhJtkQpKWLLyNbKeLs/AT
         zl1Q==
X-Gm-Message-State: AOAM532r7FpJT3GQh8iTuarvldHjsnDGvgjCraKcjgcBZJbdjqkee1FF
	ZhOU2LknNY0Iz5fXs7yfDvU=
X-Google-Smtp-Source: 
 ABdhPJwdcWtpmh2J79eZmgsT0rfCtyNMIblEEQQsv4kBvPV30xPLtoYP3E6jpDxcrtHD8i4J+8WKgg==
X-Received: by 2002:ac8:5890:0:b0:2e2:fdb9:da5 with SMTP id
 t16-20020ac85890000000b002e2fdb90da5mr511773qta.288.1649085564088;
        Mon, 04 Apr 2022 08:19:24 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c3-20020ac87d83000000b002e1d1b3df15sm8969772qtd.44.2022.04.04.08.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 08:19:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto-rt/5.15: aufs: compile fix
Date: Mon,  4 Apr 2022 11:19:14 -0400
Message-Id: 
 <19240d225188fe04c9d6ace170f066ca64ab94e9.1649085436.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649085436.git.bruce.ashfield@gmail.com>
References: <cover.1649085436.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163999

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.15:

    29d051cc421a aufs: update compile fix for v5.15+ preempt-rt kernels

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 4efe51ec6b..73a720d348 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2982a893fea6919a3ffd1fb6d600fb8cfe8c58b4"
+SRCREV_machine ?= "29d051cc421a76432897019edc33edae35b16e39"
 SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


