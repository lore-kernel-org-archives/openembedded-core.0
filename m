Return-Path: <xmdy61@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A34C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 11:39:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.19071.1693913935999061986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 04:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UFtvap4i;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: xmdy61@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68becf931d0so1395230b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 04:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693913935; x=1694518735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dAH/m6rx3IWgcjA4HQDVsK3DpovmaryIJF4PRQdcel8=;
        b=UFtvap4iachVX5+/M0/0/GpapYdEUdGVxTAX5+CmLcqVc7csE3fg9tT2P5Dcngapmr
         IbtsbDomlijKssaViJB4Z2WWA/SNUcf4YBUIop1ABQUq62r7zA1JoX0kHSBvjuLZkfFS
         sQN8xlaS35jQEADuzDz7jTOahYyjoZzgKc/QfLWCOWy1t1dWbBJWYKIWlvoBOObN9o4M
         SURx7UznKJSbvpW1XdVbw4hTZzbit6bUDNsyhO4EYseIrnUeUbK7QlwPAGE3IeVJy6yV
         bjXYOa+qjUDWTsIz5uNQbHZd0s/F2JWJakYlJA63URwIRVREMQAXjlHs9feSF5Hki6Ts
         TEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693913935; x=1694518735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAH/m6rx3IWgcjA4HQDVsK3DpovmaryIJF4PRQdcel8=;
        b=lhQ9ozY/ksuw1MwkO8+Y/g3LEnoM7PhFrd+Rj40uytyoGL1bxTOnvVJqA91zA96LDW
         e9FrWZXYKmsoMluOdlMZN0bkoA9Eon4UJDN+Ks8MxiswB0zVhUQ4ahUWC49/QSMvqX45
         eCQfBdEg6lgXnrh7IwEDYupOEk7LK/EpBakAdpLXZKrxf96tLmfYr8rMsKQl71UZCwcG
         a43EQrYo9lpSPkTnpiOT7bU5sU2Lm/0vo3eIDUa3tkbkt4hMoR8coLN6dDcbHadHM5Wv
         EuAfzvGPg8czOKwgziTxQZdO46ypg9pB3cEEmKCHo/VRBMnXhyc1hclbmuNLhvWi1rem
         sa/A==
X-Gm-Message-State: AOJu0YwuB/yU7EDflmOTPHDP6wkba34xZN35M3BLBUsM5K4DZagbBUXw
	+CwZx2BYp69MHA2CaAVaE70J8OHqPZrb9UbN
X-Google-Smtp-Source: AGHT+IFgsyJTH/EMjTulUL7/XWzio0J4yePWOqwfxeU+pRtKV8W7kS4SfmeTH5L+cL3/uz134RPZlw==
X-Received: by 2002:a05:6a20:9499:b0:14c:1db8:5c5 with SMTP id hs25-20020a056a20949900b0014c1db805c5mr9391684pzb.27.1693913935063;
        Tue, 05 Sep 2023 04:38:55 -0700 (PDT)
Received: from localhost.localdomain ([112.20.109.102])
        by smtp.gmail.com with ESMTPSA id u5-20020a62ed05000000b006889348ba6asm8837180pfh.81.2023.09.05.04.38.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:38:54 -0700 (PDT)
From: Zang Ruochen <xmdy61@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] [OE-core][PATCH] tcf-agent: Disable non-building features on loongarch64
Date: Tue,  5 Sep 2023 19:38:51 +0800
Message-Id: <20230905113851.18549-1-xmdy61@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 11:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187207

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 4d2ca5f1b0..59b9d7de78 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -49,6 +49,7 @@ CFLAGS:append:powerpc64 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:powerpc64le = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:riscv64 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:riscv32 = " ${LCL_STOP_SERVICES}"
+CFLAGS:append:loongarch64 = " ${LCL_STOP_SERVICES}"
 
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
-- 
2.20.1


