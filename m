Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF444C04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 14:35:10 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.17412.1664116506735125752
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 07:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jnfTBuij;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso6013757wma.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ELFeIFKxk3mukGBm5bFmidx7Xm/w5xrjxFAo5pOmoV4=;
        b=jnfTBuijuqPI+NeC/b9XBfvnqDDEdRP7amH5ftnjCzxHVGfxaGflgpKtlznejOKQAi
         ZS7GMcFB0GeCBdbFkGeMIa/NNHnxduN506DKUU4L2Jsid8NR4BcpoASfiOjdU7buylUr
         H9Ak8+TN1zz/e13NPWi6xSn05AnUtyRkYH3hCzXR/U8+IqjyVQemtympkMqE+D7zMfpA
         duw9rk0cZdmaSXWNVE7yS1cNUL2BfyWZnHdqkxm/OvDvujgJO/Et30z6uhxMBIanF38r
         wW2eExVEMIMtIqmHnkfHChH+dhfKfVzdyxLJpPcRA21JhYWBN0kqcmDSRBTBAtF5lbYD
         CpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ELFeIFKxk3mukGBm5bFmidx7Xm/w5xrjxFAo5pOmoV4=;
        b=IVGRRo5tK1TWEYEm9aer9XTdBJ6Hn1gfQkk3psjYIv9WrefMsZbvnQR+VMJY2R9KNh
         Tt5f3TA1nyUrYS5YlaZ7glzuJekqh+Yli5UpEClzoV8vMyrgNMmjY3wxPTYHCpT4bPk8
         mD6QUHX+Cedfz4svuF4O8K03u68UA2dqQNGpZLDlMNCboH5X9DfHnT/cx+Vse6E9TeqC
         xVZWhCRAVnaLgStPyEwkYVlxMzoygtjLEuIHqAIKtVkrhDUkD4q+SV/NNIezMccWpE/5
         SwlPjCrTiHSuI5LEJUZsRQ/2O3f6HW2LQL6oS89hiulm5llxf4TRuoBoI38wywBG3NIy
         Fyrg==
X-Gm-Message-State: ACrzQf3HCv5rGDCzQB4xD87abugIwD/q0nSoXVxOnliCddaRdx04BHLE
	qNskW+gS8puzeJfNGxY3sd6ZOsih9Xg=
X-Google-Smtp-Source: 
 AMsMyM4FgObz6VAOvpqNRN0esVU31DTFv2DuQPkTnKyXybFx10GqLrbfKsfQMVoVdn5mblfSZhItFQ==
X-Received: by 2002:a05:600c:4e11:b0:3b4:91fd:d0c with SMTP id
 b17-20020a05600c4e1100b003b491fd0d0cmr12161277wmq.71.1664116504724;
        Sun, 25 Sep 2022 07:35:04 -0700 (PDT)
Received: from localhost.localdomain (ip-109-40-242-105.web.vodafone.de.
 [109.40.242.105])
        by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003b4868eb71bsm9097373wmq.25.2022.09.25.07.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 07:35:04 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH 1/2] iproute2: Unset CLEANBROKEN
Date: Sun, 25 Sep 2022 14:34:40 +0000
Message-Id: <20220925143441.38925-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 14:35:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171010

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index b1bcc1434c..c292b95e36 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -13,8 +13,6 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 inherit update-alternatives bash-completion pkgconfig
 
-CLEANBROKEN = "1"
-
 PACKAGECONFIG ??= "tipc elf devlink"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 PACKAGECONFIG[elf] = ",,elfutils,"
-- 
2.17.1


