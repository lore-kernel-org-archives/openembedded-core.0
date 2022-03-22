Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF3CC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:08 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.13115.1647969607253125254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X/BCGVwr;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id s11so14997012qtc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+8VJO8gW+nCCzE7fTc1T2wQsJDsWKCm+Qn4nVSPiaZQ=;
        b=X/BCGVwrDUkENzC07QNH0G9VB+ZfUrPCJHY+5s6eVEdCvRaLz77lUmqnvmbIv5+ODe
         z40WGIliRn9QB4iSaVJZeXha64JwYy6f+eL+STKaGnWszoSjf/i7ztZcZQd1mDyG/xa8
         oYpNpIWunpzbTJ92es7z9uUpw20IIphv3/ZUWgQ9/Ga/1O4oDvFSqGyUhdj5awwywC4+
         KViUfHAZv6XYqmDwVgceWAPDjX3x3H9nvmqDH5NZg3DeaKIlZTGjfWjhsbAfvtvbtoOQ
         /EKzoDW5PZkFhY8OSz1o/U2khWR/dCmr8ev5DXi3BSTz+XWeGG27HV3fiHRdXiNO5kBV
         gtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+8VJO8gW+nCCzE7fTc1T2wQsJDsWKCm+Qn4nVSPiaZQ=;
        b=fj9X5zqxPU2eawR8eO9JuZcWc4swt1odUBfdyoyzzZuteVlEDBJKqjhqNIiwMxp8v4
         vEh70okLOfODX18mTuiFfbC9QaKJGU9a83BpU4NKqpTZzlZcibYM5JP//wJdmFgfbQ+j
         /wW+aC9hTeVjDbVUaUfprKRyzkaJMx4EXCgD0JQifbu06SIGtI0ey7hD0VLH/hDq14ux
         XlgC5X+QaIBEsYot82mGDS6h4ytOXLIqGdT1NrYfoceW9GgYIu+9H8yp1OxK4tdAfJ6u
         vxjIYYWT+G8OmUj5dX8+hF3Euj0wIaSwncxJW2WuxxLmWL70GgFMUznjTl8IH0cskWRu
         USAA==
X-Gm-Message-State: AOAM531M8XTgzUVR7rXx9tJxWBgfEEcIdYDEmIdN41mzTapLcPOEZCuX
	S6lxlQvMIJgEtFs1dhgVE8E=
X-Google-Smtp-Source: 
 ABdhPJx1w+b+eoLMP6XMUD4tVQLQB+OmJqRomeUkte4YD+xT53QD5Bx+pxgPMJQ27jO9Giktnz8wLg==
X-Received: by 2002:a05:622a:1a0d:b0:2e2:26f4:1aa with SMTP id
 f13-20020a05622a1a0d00b002e226f401aamr2326212qtb.86.1647969606210;
        Tue, 22 Mar 2022 10:20:06 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] linux-yocto/5.10: cfg/debug: add configs for kcsan
Date: Tue, 22 Mar 2022 13:19:53 -0400
Message-Id: 
 <5e2763df2476e9c6eb9bed59d03eb1705048ae59.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1647969481.git.bruce.ashfield@gmail.com>
References: <cover.1647969481.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163561

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    b56db30a7c5 cfg/debug: add scc for syzkaller fuzzing
    c4494ad7f23 features/tun: add configs for Universal TUN/TAP device driver support
    148948c3829 features/bluetooth: add configs for Bluetooth Virtual HCI device driver
    824a7ba4dda features/usb: add configs for USB raw gadget
    0bd038864a5 features/usb: add configs for dummy HCD
    e8c765f559f features/ieee802154: add configs for mac802154 hwsim
    99aea8bc07b features/mac80211: add configs for mac80211 hwsim
    c7bf42227e3 cfg/debug: add configs for fault injection debugfs
    ae48b977f61 cfg/debug: add configs for kcsan

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 5852730422..88fb3b4113 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e0d87d9831a6e0df20a370adc9aba0d032d91661"
-SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
+SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 48e5a4f871..f1c2bc33e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
 SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
-SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
+SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0a80790636..87a7d5e3ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine:qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine:qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
 SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
+SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.19.1


