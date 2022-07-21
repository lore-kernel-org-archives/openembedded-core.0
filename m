Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C22C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 03:32:52 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.2108.1658374364722466714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 20:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TQg3qRtf;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id m7so453481qkk.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 20:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ESMy4R4wUkJyltUUyT0EQZneAfgwCOJ4k5Ci5/E3EvM=;
        b=TQg3qRtfAGZPo0/jv7UkiHzCKsVKOhbszPRa3+J0k0S9heRbeypX9c2IcKkP9dpdqz
         qLWT8l7DNJr9cjH/kmhfCMiay8XAdNXTZJp759H3vhA+cRx3vdpkCZNkPbn1gIvDOSMp
         bN9TbBCcp+TvyyzrXnC7dPKa+dzlFTtHeGpmsRqR/G4Zn7bo+DwhefeLxOINNKifhKES
         PwUaFsyvaS/igUGSW66FbmyCTLhSOinXD+PF/C/K6sTqsyUcgYFzl7MvMNL268i/tW1y
         XDHpmZIOa55DNYzNHFgQkzUtGAWkleh0f97Is0WS4hbDO0V81dv2beGKeaDOx3/+gKiR
         kuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ESMy4R4wUkJyltUUyT0EQZneAfgwCOJ4k5Ci5/E3EvM=;
        b=MeYHp750ftCJDkeRptK1U6weqll7aJA8dK0TbTWtR6uC410YJsOAPhaT0ADct+OEx+
         COzdulL+PJf5q4sHGK26k/QBN6kCv4iqDXEQ+W9E13IZ6XwmQL3xh8vW8GtWm1RfBq+O
         2mNiazZqgP8l+dwgsyV3Dj1vDZc9OrnLvu7dZsE+fYkwqCRvm9abrYKMYBeUc+HM4cjL
         3bYfoQOq+7AwkX65Zg0xhmiKbG1I0YmsjxCbV3bzbq2biUXdk2fdzMFMsW4ZfQ8MR3NZ
         9qGbcdJRICAFINkwiGDvNJY1HIGK3WbIez4+Nb6O+P4k8IGPj2Koh/Eq573r1WRktVVV
         o6zg==
X-Gm-Message-State: AJIora8QmgFzzELvRHgp1mL6P3uNIV18Hy8jWx/JCwplHJ5DdrlksanZ
	uQA6Kj93q90V2doGJ2jXyjI=
X-Google-Smtp-Source: 
 AGRyM1t/7kPWNWEqNwabi/Nac3HPHjlj014YKdXCFUQR2nBm3X+c4yb8beQzWSpEecirSXNdVzgBWQ==
X-Received: by 2002:a05:620a:4502:b0:6b4:6c2f:e7b7 with SMTP id
 t2-20020a05620a450200b006b46c2fe7b7mr26719887qkp.11.1658374363708;
        Wed, 20 Jul 2022 20:32:43 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c8-20020a05620a268800b006b5c061844fsm622393qkp.49.2022.07.20.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 20:32:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2][dunfell] linux-yocto-rt/5.4: fixup -rt build breakage
Date: Wed, 20 Jul 2022 23:32:39 -0400
Message-Id: <20220721033239.32571-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220721033239.32571-1-bruce.ashfield@gmail.com>
References: <20220721033239.32571-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 03:32:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168380

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    cc478e363cc3 rt: fixup random and irq/manage merge issues

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 5bc1993cf2..fe75aee4da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "086bb7f7d2b47d654922e5cc526cc6274b28e319"
+SRCREV_machine ?= "cc478e363cc35064b58a871a4cc535aa973c5891"
 SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


