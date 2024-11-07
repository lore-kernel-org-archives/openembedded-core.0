Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D8FD5AE47
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:40 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.63127.1730946573253576736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fnC7s0aQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6cbe3e99680so2574446d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946572; x=1731551372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHj/BzytnyqQDX8cN14kO9NJb8OUOz644VG7JBH/4+s=;
        b=fnC7s0aQiswPrR9xxD79Da/359Bb75fbf7iY+Erf0Xy7kBPDQ0MsIEwUtNG0vW30Wt
         BDEOs2Jt2sTS8fG0t4s61VYgahd4WXr44zw0gK/Pwiw0lRpEO74F85bp1aAEGMgGwNEe
         K4/rfCr/461iwzU3YAZeqZUebD368ICoCHHTNbwtAIE65DA5msVpTgb+hK04xpESL/YB
         KGD0HT1b3tmkbaOM6H1dofxRkXU9jJuLBHKef04jUljOVZJrknR3XcSqc3hRmqJjR+Ur
         jL9SMIIB4yXU1KIhTZ7NnLLVo589zCvimsqIejLtHgUaaBIq2AiuGD7xVDbbVlB2DJ2O
         gu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946572; x=1731551372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHj/BzytnyqQDX8cN14kO9NJb8OUOz644VG7JBH/4+s=;
        b=heqLFkdyCgk0CH0qIpGOzXRQ/9cFrX1gV9qp5c2AgAjULTzjurJksPi8kLKnCjl6/r
         RmqWXwKWaig0/b2BX0wk3ntOQOw6iiQlCJVkfFZ2DqZvSqXPJxpu9HqnihfsvNZjJl0a
         JwPAFNK4jXNCskVjqZGpRS+GniUCCqm5YrtYfft9obP1CzA5ipS8TytWy/Q5wA0yqjfF
         6SHXostv7ZK6UsN55U/8+wSTSIOyzthiqlLn6mC5LAryuszyxBOxyI8VmDhYnWYj66Xm
         2pf8T9zyRLLO1Hu09o5zNYqVQE9iZAWyKYzx3Mlmg4bARb0JYz2XpFBID4ElSbIh2DcZ
         57KQ==
X-Gm-Message-State: AOJu0YxlaOq08uNulbuMcfXSnj9OFBUeqgHRWaYcVd5nn/pjbts1Ye91
	fTshI4Prz3SdP/Fs+KaZMyewtzEYr4h4jrHrjtiTxZOhQGu6SBh0OBAbXWfb
X-Google-Smtp-Source: AGHT+IEhC43undpugGyKtHHDaHKidcJGShroRJPec1cNUraY/SmN3J/vZJIlIeFVerB6jlp0aO2ggg==
X-Received: by 2002:a05:6214:4408:b0:6cc:1dd9:290 with SMTP id 6a1803df08f44-6d18584d51fmr605742626d6.40.1730946572236;
        Wed, 06 Nov 2024 18:29:32 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:31 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/12] linux-yocto/6.6: genericarm64.cfg: enable CONFIG_DMA_CMA
Date: Wed,  6 Nov 2024 21:29:13 -0500
Message-Id: <174ddc02343991f0b8725d42b20aff2eaeaa089e.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1730946087.git.bruce.ashfield@gmail.com>
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206812

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: enable CONFIG_DMA_CMA
    Date: Thu, 24 Oct 2024 08:49:29 +0300

    It's needed for graphics on AMD KV260.

    Cc: Bill Mills <bill.mills@linaro.org>
    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index fa4a8f564e..b663804e17 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "0dc843fc43271230499a7e5c39e7a22eb1dbd2b9"
-SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
+SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index d913e09212..0faf40ef2d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
+SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 9feaec24c4..db06c05c38 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
 SRCREV_machine:qemux86-64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
 SRCREV_machine:qemumips64 ?= "b15f0ede8d222c8fe745a21e830166a7a8da2f1f"
 SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
+SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


