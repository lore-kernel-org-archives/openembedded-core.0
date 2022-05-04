Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5421C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:50:18 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.412.1651675814665502430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 07:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c7ObumU8;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 126so1088484qkm.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YIWujSe2fj/dNX2jfc9XK5vqBL95RG5AzMRaUjQEboI=;
        b=c7ObumU8XYSToyKDoP7QHjlabsRMmWKdHA9+TN6gVPXsc1FFvKjEsdtnIj9y6MPwM0
         5KyvDnvMpZwR57g0X0OdHFst3v8N+b7q8m5tTlyVsITfGEeDJyE8DVjKzQiYCggL0PBz
         9LFgldF6GeIbfZDivD5cezhumBAETRjiYpPNqLEMZkNphZXQhwgGzEfzgX3FJoG5zxwH
         tXUtpRPGnXW2760ib43Vu2kGoA4ezFNOQkDY8aSXDp06rrf8cFFKOyqqoHTtyAffYLkt
         WfApLqXFCTNUSP79TQHFoHjgbWI70ACBauVZPtB/tozdEEc+xItxSswZxDLTx2HmktUt
         wClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YIWujSe2fj/dNX2jfc9XK5vqBL95RG5AzMRaUjQEboI=;
        b=gfHCa0XZ6U21IV6zY8aJ2WFIO6xkAIwUJsMnoIi+kyKoppkYpHEPlP95eaqRpC/b2E
         /xj9cjJyOVWA+g7BIweV4X6i2yRiNBL98w1YlI0BG3ciXVCK6YIXHTmXMwjEnc1Eqk+A
         lmrtsAG/QSU/B4244QbQ79Pu03pyq4tPqZ3T3LXtjeLTTNdgtIzKysxO0hVA+BaehdYy
         7nif2zgC8IsNI46G4RyBU62M7fiieJP6exfHF2/01rh2UNh1cztNAvrY7AMrZ5Z73/kb
         FYHMhaLhPAm5Vn6n71oBV/cDJSVu2eetJCYNhFTzlItq/IyoDsGvbG34tGRJ5qw10CIg
         v5mg==
X-Gm-Message-State: AOAM532bMNUq9lPQLejgmhHnAliIBlA6x4yYgGg5kH9X1CQ6DDmplvOk
	AAhaUfLdy1TtB52PJKFRlk5yYqu1PTY=
X-Google-Smtp-Source: 
 ABdhPJyNowh07yMahPgccFIXANAebPZMuqhfwluJOHVmmtDyNZHKGBHMSOpzpua3g46tl4SkXKWfCQ==
X-Received: by 2002:a05:620a:4306:b0:67b:32f1:99c4 with SMTP id
 u6-20020a05620a430600b0067b32f199c4mr15862890qko.776.1651675813414;
        Wed, 04 May 2022 07:50:13 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca.
 [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id
 q25-20020ac84519000000b002f39b99f6c7sm7907438qtn.97.2022.05.04.07.50.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 07:50:12 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] DISTRO_FEATURES: remove uclibc remnants
Date: Wed,  4 May 2022 10:50:04 -0400
Message-Id: <20220504145004.27768-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 14:50:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165222

"argp" was used to tweak a uclibc feature. With uclibc's removal, this
option to DISTRO_FEATURES is no longer required/used.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 meta/conf/local.conf.sample.extended            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 3edba1b6d0..9f4617be01 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -16,7 +16,7 @@ DISTRO_FEATURES_DEFAULT:remove:riscv32 = "seccomp"
 # seccomp is not yet ported to ARC
 DISTRO_FEATURES_DEFAULT:remove:arc = "seccomp"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 68f3a966cd..d24616c764 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -35,7 +35,7 @@
 #DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
 # If you want to get an image based on directfb without x11, Please copy this variable to build/conf/local.conf
-#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
+#DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
 
 # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
 # packages at build time using qemu-native. Disabling it (by setting it to 0)
-- 
2.36.0.rc2.17.g4027e30c53


