Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CD9C001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 14:24:17 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.89519.1691591054502165083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 07:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PtGR7Ugk;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-407ff54164dso45103451cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691591053; x=1692195853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8p9zK78c3clWkRZMiMjtDIOoezQr0ZNBrTef3bwzG2s=;
        b=PtGR7UgkOzTY474rTcC8nlrTqUZfxOe3m/LJ+UXIRHggDIFfNqwU42EEet7ZJEurvy
         qAtgQVdGAYV25AQ1G/RCKkeQTyrOmx9tBeHHNM7xvwL8mqVOA37YgP/VU5gXy8WRWzxF
         0+R5X6lRGc35e6sP0VB8W6JsIqKWkEvzu8fyYKkTSUsR+iIMsNi5nxUSGSggeSzJ1I4S
         e47OHWiMfajVmnHaKNegusx0aR8XyQwbHrv052ztcgmHBO1FC8w+kbzen+Nt9perLJzH
         0MK3JR7djJhf3c+lh5Pu6wffhgeQ8GHg7iHhgeWsqsKqcQUeHAz0VpZvCrEqCsHQ/Rhx
         Hmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691591053; x=1692195853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p9zK78c3clWkRZMiMjtDIOoezQr0ZNBrTef3bwzG2s=;
        b=SJnuIn1NSxlFzmKRiiQ24EMYiS+5n3MapMVZCAY5pCeOKuM6GIPHGVK87IH0s1CoQy
         Oxk26cRE3zw1hzGcDIa5IIGll1N8iAWLzscoCvmqS73XhXX79venPkB3pBFKTovctjWN
         cwEuHtRQJbY8psm1sVcvJTYwasxGTiJXI+TJp8KGBljsvQoQaDp0+AxEHeqEwKrUyjrl
         GXjYRDe+Tg+ZWY6vFPTg/SYjeulpjwP8X5unkEtG5UNWG5npt/DxtfT9zRSyHjBKKy5k
         bZIs5u8ayoBEyGESgsANngVo+sJOjl9BEpCVovdEULpPOO+/6xUvVqlfAKkHOjoCr3+0
         ckKw==
X-Gm-Message-State: AOJu0YyyDFJG6wAuDCnfcQoYPCFJs7MVqJk71OzFWYe4h2r7+kpc9PFU
	eBDdASoYX1Cc6zGO9/hmsPU=
X-Google-Smtp-Source: AGHT+IGZynk59qFTEHNSGxpoV2/MByqXmsbqmYVg9Z6hdZXQJyDCWiPRIq9fA4d7u7KIrZ78t3h0Wg==
X-Received: by 2002:ac8:5a8b:0:b0:403:3af1:367a with SMTP id c11-20020ac85a8b000000b004033af1367amr3591503qtc.2.1691591053481;
        Wed, 09 Aug 2023 07:24:13 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id v8-20020ac87488000000b0040fd6dfeca9sm4067793qtq.68.2023.08.09.07.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 07:24:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-tiny/6.4: fix HID configuration warning
Date: Wed,  9 Aug 2023 10:24:10 -0400
Message-Id: <20230809142410.3666541-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 14:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185704

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    88ed9ec4909 qemuarm(a15): fix HID warnings in -tiny

During the update to 6.4, qemuarm was missed when updating the HID
configuration to avoid the following warning:

   WARNING: linux-yocto-tiny-6.4.9+gitAUTOINC+8dc4f68eb8_72bad8cd75-r0
   do_kernel_configcheck: [kernel config]: specified values did not make it
   into the kernel's final configuration:

       [NOTE]: 'CONFIG_USB_HID' last val (y) and .config val (n) do not match
       [INFO]: CONFIG_USB_HID : n
       [INFO]: raw config text:

           config USB_HID
                   tristate "USB HID transport layer"
                   default y
                   select HID
                   depends on USB && INPUT && USB && HID_SUPPORT
                   help
                     Say Y here if you want to connect USB keyboards,
                     mice, joysticks, graphic tablets, or any other HID based devices
                     to your computer via USB, as well as Uninterruptible Power Supply
                     (UPS) and monitor control devices.

                     You can't use this driver and the HIDBP (Boot Protocol) keyboard
                     and mouse drivers at the same time. More information is available:
                     <file:Documentation/input/input.rst>.

                     If unsure, say Y.

                     To compile this driver as a module, choose M here: the
                     module will be called usbhid.

           Config 'USB_HID' has the following Direct dependencies (USB_HID=n):
                   USB(=y) && INPUT(=y) && HID_SUPPORT(=n)
           Parent dependencies are:
                USB [y] HID_SUPPORT [n] INPUT [y]
       [INFO]: config 'CONFIG_USB_HID' was set, but it wasn't assignable, check (parent) dependencies

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Apply this to the end of all my current 6.4 -stable and config patches
to remove the qemuarm config audit warning.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 8cc39faf9c..2f051844d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "121d700ad4b877fab9238a92356ad32506ef70d5"
-SRCREV_meta ?= "8dc4f68eb852784a5bc82d30768ac3276c890754"
+SRCREV_meta ?= "88ed9ec49099d69f9546d21137191fd747d06ec4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 834d07be48..64dfb3a379 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_meta ?= "8dc4f68eb852784a5bc82d30768ac3276c890754"
+SRCREV_meta ?= "88ed9ec49099d69f9546d21137191fd747d06ec4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 4deb7bc537..4b853122b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
 SRCREV_machine:qemux86-64 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
 SRCREV_machine:qemumips64 ?= "47d7881e76d678cc9dc034f0acdd1bc416fa05bb"
 SRCREV_machine ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_meta ?= "8dc4f68eb852784a5bc82d30768ac3276c890754"
+SRCREV_meta ?= "88ed9ec49099d69f9546d21137191fd747d06ec4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


