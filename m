Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E86C4332F
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:25:23 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web09.1751.1646443522946764526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d8YWXcOj;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id x62so5259614vkg.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KWBR2Q5WVCWnmj43Y4F0w91FmBmPYWZM6aqdiU67Vy0=;
        b=d8YWXcOj9Eh7LD8APBk7kV49u6xkRiQE9pscgnxSCwOOiDz5/pMKI0/LIoQGD4GdDQ
         Hps/v3St8Nuj0X+XoCUKzFcDTbYUXKrxJtl5/VcrxVQoXsx6ttlic/R2U6fQuHo+AAxq
         y/kwEVatS+BlXEW8GpjzYtvytTmCO3Pbpi57VhPeskz9iTL2qORektJiY4X3SGC7EG/U
         plOGxUSjpejT7XHETptBQaS/mTW2fYnaVPGS4etZFpWMzXrPwx5sXpnbWz3wyB5Cd7mW
         4s4OVDrNlokQnSDVyrQMCTnmNT6kALWrgVo+dlF3trUGuGXDo1FQSpSDM9y7WfnQ/0cU
         OIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KWBR2Q5WVCWnmj43Y4F0w91FmBmPYWZM6aqdiU67Vy0=;
        b=w2e2dp3beBhAILZVbq6PlCFxQdfgyfKpge/3PQ1GS9+U2e+U8iFKBaFX3DU2ttbrVa
         5AgS+G+TYJDRuVSw/dmx3eqe44VxMLKo6a1GhbY/Qnnhzj+UhZuqVYG4dni47XhEnBtQ
         ws6iUcKKgSjVFqyxva50vTCRO50yKu4OXExSHIYrn0rnaThd7ROTWpufiyF5LKedeanu
         0aqUwDXqVIrXpo1yL0oOb0rgU6Vm3eRrC77t/FEXrWcw0MrFhvcQ7P1b8/yUeGrFw5DL
         zanlKaVPr+8QxKZFEWabDCsFwuXtalIXOTEIu/1DJpRMjs7+gjxNEBrtpfIFw8J28R3o
         +LbA==
X-Gm-Message-State: AOAM533TlrDSOFnD7w7wfLTeRpNZQWcx0fx17Jw5k8cuQFjBqakR5Gp6
	0aTDEPUdj2tXi0TyI3CZEE19qPpbEVz3YA==
X-Google-Smtp-Source: 
 ABdhPJyNXs1kymR8DNy8nnL+30l81bDJc29yFJx3DA36WwMRAHrIDRxf/F/my7SCa08jdBj0lwXOQg==
X-Received: by 2002:a05:6122:d93:b0:331:4fb0:7162 with SMTP id
 bc19-20020a0561220d9300b003314fb07162mr651014vkb.4.1646443522048;
        Fri, 04 Mar 2022 17:25:22 -0800 (PST)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q9-20020ab02649000000b0034a4433fe82sm1053934uao.36.2022.03.04.17.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:25:21 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/5.10: features/zram: remove
 CONFIG_ZRAM_DEF_COMP
Date: Fri,  4 Mar 2022 20:25:10 -0500
Message-Id: 
 <17059b12171ceb23e686be2b6cc98114fecbc95f.1646443420.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1646443420.git.bruce.ashfield@gmail.com>
References: <cover.1646443420.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:25:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162767

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    7a012dfacdc features/zram: remove CONFIG_ZRAM_DEF_COMP

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 8a8a7eabe9..5f512016b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e5b266bc6b15dc8852649b7d2a31395195dc7b3a"
-SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
+SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index bf7662eed3..7a7a13e031 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "9a8497a8761a22b3086cab63d18698024a69a410"
 SRCREV_machine ?= "317635e1feaecfd8aa29bc94d8d03ba873190414"
-SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
+SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index ecb2d03949..130e3286ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
 SRCREV_machine:qemux86-64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
 SRCREV_machine:qemumips64 ?= "ae7887fe8d4da06d2d0d0a5071d09155899de26c"
 SRCREV_machine ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
-SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
+SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.19.1


