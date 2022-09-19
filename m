Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90492C6FA86
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:28:48 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web08.20603.1663597727847806713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OsofI0S4;
 spf=pass (domain: gmail.com, ip: 209.85.219.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id y9so21934691qvo.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+y+z3FNNKkIVOMbA97DKlf2xjMH2qY5wFeDBC0zFl2k=;
        b=OsofI0S4pGenDzkKeo+tRGUpVh7YWVLEuxFaZuY76YYbYCSyGsNS6rDanS5ggp+ppM
         BAH3/NCPB24jOFk+eQubt1C3NkUDuCeS8M6xi9ma202jTo3lYLkePHl3+M7sP62qT1KX
         Wv0A4wnRlTl9d0l4X7ZWy9asG5zDnjmiwuyFYwpbXHUgQn9pofcOwDoHBfoykW5Ab0aL
         K9TZaaRqv2F88dBnWriHylwbmmYsenqI6jAs2R2ejaosPQ39itPmhyoEO2eNcXDMw+7+
         m/zrPAFsuO4D0ipxL5HVuGzOwHG61b4rshoNztS9t9BwgdupftEZ7kj4tvHHui4s8u1n
         4Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+y+z3FNNKkIVOMbA97DKlf2xjMH2qY5wFeDBC0zFl2k=;
        b=YNaeH4QPs5boDqiaaTP5KnOtzpMFu1a+GUkHb7p0xNdWelJXP659Jj0FD+4cLf7Iyz
         1Lul60eTRZzJD997CP26/raSC6cLNQfb1HZpoEc82GEBOL/GrVdY9ZEU/49A0wVe/lE7
         Mjcdb/kwRv53AuPdjg/XTAbg61cboMK8L/33qwsijNMpb//ir7Yk/MWsXfIH3PI4xip+
         YLKFdMhS5NJOAidg/1Bl0VkScLCspFIuAx7+2gvYAa7q5FacTDmTZnZFzsC+QQCYSN+a
         bNGjTU4B7trpQbohXhhUCr61lagzSk4hK5w1DbrVWA3dCtf3fxDvHWN7Al1ulYJ923tV
         eYRA==
X-Gm-Message-State: ACrzQf1nBFCReOmtltEEwkpPS4rFFaxnK2XPEEapFBC1MM52Iqnaqj0L
	CoUAmE/7FOS9fewdbkrgdnQ=
X-Google-Smtp-Source: 
 AMsMyM5H+jxd6dQMuqEFbfHRHEF8NRqLMo0fmMZyM+SBLJRgPlOAl114Tj+b1KF2WNVvOEliREX2Eg==
X-Received: by 2002:a05:6214:1cc5:b0:498:5d76:69f with SMTP id
 g5-20020a0562141cc500b004985d76069fmr15458883qvd.33.1663597726857;
        Mon, 19 Sep 2022 07:28:46 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006cbc40f4b36sm13362226qkp.39.2022.09.19.07.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:28:46 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto: Enable mdio for qemu
Date: Mon, 19 Sep 2022 10:28:31 -0400
Message-Id: 
 <92e8ad2c645b7847d6cee97257ca00bf6a9eb0ca.1663597409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1663597409.git.bruce.ashfield@gmail.com>
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170869

From: Khem Raj <raj.khem@gmail.com>

There are package like mdio-netlink in meta-oe which need this feature
to be available, it has started to fail with 5.19

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 528e000012..c28cf309c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
 SRCREV_machine:qemux86-64 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
 SRCREV_machine:qemumips64 ?= "afd431bd55805b5a980774ebf30b5d8aa4da492e"
 SRCREV_machine ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
-SRCREV_meta ?= "ddb7fe05a2e7050ff604639a0dd53a862902b949"
+SRCREV_meta ?= "3f097510e2c93bc7d9ae84231737bd6228386475"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -56,7 +56,7 @@ COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qe
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-- 
2.19.1


