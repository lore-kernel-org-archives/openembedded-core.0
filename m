Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546D1C46467
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.36627.1649085566463219267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SRp5Bcpo;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id h196so7855285qke.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGv6Rx8Y2ZhxR/+BHHr6UONg9rgOZPyvQ/L9Ken/v54=;
        b=SRp5BcpoDiCk0h2lX1GsNlF6ztks1S53uAaft5Bg8g1enyBXuEqevB1yR16sczJ/nW
         PevCj/3y/0JBFSP8k0w2tO8Cc3OuU7b0VfJ65a2TDUKln3udOV7htS/ewcZCDfZA2n5I
         QCUqq0A0vZ+c1fbgrGhrIcwzRmIYKLvtd8XL4Ytm9s0yt6k4gMbPkpauxOMEV37P8Ggu
         +W7T4I42dVrN204CnXPTbjBtDi/dRd04QYLr2Ip/XTfsdmKEqYlZw+H/praoVVd+IKbo
         1jQkQbfZDFGkw9lvKvFFZQ63l0EyTXy4acHvZadmle1E7CZ/4+dnZqVBeL+NG7ubeD0U
         Gp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGv6Rx8Y2ZhxR/+BHHr6UONg9rgOZPyvQ/L9Ken/v54=;
        b=E3qg0D6fo/TSNELkxrM63BO00HXcFcF14PCtHp/309rjq8UE6KNOPaMSSY2PZGD3g8
         9+saF1O1xCZrxSgdyOhvhnRc0MYgD2RLfIs1FECcp8byXyQcVp4B1tJbIuJv7UGYGoV8
         ImYkMicsyeImYlf9F8EUTWBkHbdPtpIr5gICrS1cAI9WYnJEzq+Ngy0X1FwZj7IjpOid
         +S20t0854t5/w9XvUFnl0kMHZBkZENDkugGPjDnFKk6jPb2/XL/zpdKMdwwGZsG8237k
         Fki8/LTR2auLdQihq8EO6HTWhiLyUtig3as5sto46Z1V83IViyX0PPOuvrI2jdl9vv8D
         O3uw==
X-Gm-Message-State: AOAM532ztObrVWHm/nKBIrjO5JWMTkBSGLkqV7n2C6szZFNv+p0QAVpJ
	LIku+B1JXJv6DJwtwbhZBoM17Dr838ot/g==
X-Google-Smtp-Source: 
 ABdhPJyRC3kmvcKyIyRTIA3S6ml19EkesHV+Hv4tZPzczDkC1sNx0RMlelz55PT4QdV3unMjy7GVeQ==
X-Received: by 2002:a37:6153:0:b0:67b:1bf7:69b with SMTP id
 v80-20020a376153000000b0067b1bf7069bmr197936qkb.27.1649085565490;
        Mon, 04 Apr 2022 08:19:25 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c3-20020ac87d83000000b002e1d1b3df15sm8969772qtd.44.2022.04.04.08.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 08:19:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.15: features/security: Move x86_64 configs
 to separate file
Date: Mon,  4 Apr 2022 11:19:15 -0400
Message-Id: 
 <d33fc5157b584b60177b4928d4883d9e86377d7c.1649085436.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649085436.git.bruce.ashfield@gmail.com>
References: <cover.1649085436.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    63e25b57177 features/security: Move x86_64 configs to separate file

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 73a720d348..87ccfc1f45 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "29d051cc421a76432897019edc33edae35b16e39"
-SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
+SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d5b301b4d5..d8ce5dc518 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "cc9e92e826af229b841fcaf8c645e638a86eba43"
 SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
-SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
+SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b936257aa7..54157fd245 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
 SRCREV_machine:qemux86-64 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
 SRCREV_machine:qemumips64 ?= "a4805fe749c9c56d18a60b5378674760ef0e85ed"
 SRCREV_machine ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
-SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
+SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


