Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6E2C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:22 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.7256.1668810550361349599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GpQC3s1q;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id g10so4452716qkl.6
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfCwF639eIRcl/C5xI1tMQsqhE2KIIFgN0qIZQ/d4VU=;
        b=GpQC3s1qQNeFO6UDu557HkBCJp1af3HUO4z+dGDNVjRw3xbazE0a7EF4ptQEtmw7zc
         7fnYfCr/Bj7KI454fBF5Drh5K32Dc2buzRBEB8dl0Tb+4duwULExp132CfsRN7mbq+9U
         V9w+z8EBfLUmf4ay/swtPWGKuOxrHPdP+Q7+SGeDvXRpLoqJKYRkVJTPNDeBtRr3DDjL
         8axLEDHQp3uyEcftIKsvDkgW58Kn0Er5GZr3TQ4QYWoSQQqqTHeYul54RZpQ9hF6r1xR
         t5suxKEB2Tk4wrOvKbPS1OeTOP00jTMDHbCh1sCQ7OKpSonCbd1eA55BoWfvX6h9OThl
         c6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfCwF639eIRcl/C5xI1tMQsqhE2KIIFgN0qIZQ/d4VU=;
        b=p065T8c7A+cqq8onEtq6O1tXC6EmdpzfrwcIrAcnqNcc/Gas69VlcYpRi0V4e1UUzm
         tYeJUrwKmY6zUJjBIQAQTSYiGni+jAgSNVClfYRFz1G72JBkgNa7EXB6z1W09wroBovV
         9NQKzV6MNgJcFSAjM9bHt6J+21ALzFRj3TVTbbdM6WHneL8bpfoYEc8BhSzrKQ/zR+70
         TcRTl/LC6BwWi4VZeZbCN0SIw3t6LGZoq7tJ+MpBUEG0LXvELnyfgW6OyElLwKHcECVz
         bCRwJErOqBZgDThNZohwjtZ4jxN9qpR/RWXo62m4w6HGRyEUNJFPvUWrK4DKy19o3Inj
         Oifw==
X-Gm-Message-State: ANoB5pnNCm3aHrFmtKrnoA8cnT0xwXQdoxX0Tnw5So/unZSYXXVQ043W
	vEhigJD9kEv3bwenU5D4T1XU38ym2Th8Lg==
X-Google-Smtp-Source: AA0mqf5smdbKHHhKOEqov9DufvcRyMT75o3pAtA7uA5S9nsOsiUPXp48SPJZT5I6C3t4jMKNPWkfrA==
X-Received: by 2002:a05:620a:1fa:b0:6ee:24d5:b8fc with SMTP id x26-20020a05620a01fa00b006ee24d5b8fcmr7762296qkn.336.1668810557825;
        Fri, 18 Nov 2022 14:29:17 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/15] linux-yocto/5.19: fix elfutils run-backtrace-native-core ptest failure
Date: Fri, 18 Nov 2022 17:28:59 -0500
Message-Id: <da08feb6e6d0531d660c78605140c0e549800550.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173509

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The following commit was integrated into the 5.19.15 -stable series and
breaks the elfutils backtrace ptests.

 don't use __kernel_write() on kmap_local_page()

It could be that other commits are also required in -stable, but a
revert is the easiest way to deal with the regression. We can revisit
newer kernel's (where the commit is also present) if they also start
to fail the test.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 5c316dbaf3..de087eabd4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2bd6711a4dcc49e51ae68152ed0b40384e291554"
+SRCREV_machine ?= "7883e2f6464fb14e4652769c0294b2eef8075f5f"
 SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 27fa6d9867..20ee864401 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
 SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 44bb02b9c1..8d891fe01c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "dfb2a8b83c0e37732dd930330132b692409f7321"
-SRCREV_machine:qemuarm64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemumips ?= "b0e7e098c3fc9f2309e74137de4b8a5fcbaa2779"
-SRCREV_machine:qemuppc ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemuriscv64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemuriscv32 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemux86 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemux86-64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemumips64 ?= "20d5adcd760ffdc90b4e5babb85a07b9d6ff3113"
-SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemuarm ?= "dee954e39057710f00e5b3ea23514d01f3a4d940"
+SRCREV_machine:qemuarm64 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemumips ?= "fe2b95c83e022371019027da3dd068ab33576d3f"
+SRCREV_machine:qemuppc ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemuriscv64 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemuriscv32 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemux86 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemux86-64 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemumips64 ?= "a5f29b9c64f2b3b47f74fee38f298d8a6b17a8b3"
+SRCREV_machine ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
 SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


