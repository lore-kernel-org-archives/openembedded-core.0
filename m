Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3057CCA487
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.51640.1658306692472670656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MR2nf8cp;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id os14so31833782ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PzIpkFNQ+3olpxsAann52hIKGBfrir63r73eNOrNrO0=;
        b=MR2nf8cpRisTLDKZTiDmXWwoUwZCjMwlpA9jPZLUUupQgzaxdlJGAM1WGITAV7b/X5
         g9T9vUvWSms0mgMQ2KhZ6wWisC43AzP2Nin6SLWPW3fUHSrIF4SPCRg0jlbNrOSHKAld
         U+r5sxsUdyK1Zp7HwdvrWM4EFRGIkD4b+paBha9oQ3xo1MtOVYRdPZp6zmm3soF25Aln
         GUzv1Hf1G7mh96CwyGyoNPXY1+LY2Q8ke6CWQjlxqt9LOBH5imkN5PQec1Dj8fk30eRo
         Pwcl00EqInz/Dk/m0zLCMsCEMsYtxcIIjg79G/Fk1InYVjvXwtTudFj6nkNGPmjfrlKS
         Y9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PzIpkFNQ+3olpxsAann52hIKGBfrir63r73eNOrNrO0=;
        b=M+0UIGPh/djuNMbGu7PW7vSpLVIBPe+SZVGKHDB9u8RbwCZHclhCBoA+l7NPLvwBEb
         Ml7ntH4nbYzqLAeHrJcsF6dpqSSvBpnoV630jOEqdCOzCxW49Bc7WVdYX2zq+ADryNT7
         +0C/5fMiwhToShUixhKbJNpPzEEBIm+S7Z8PM3/qDHBWbVJZTefcWIkyF2o7LzqnXuTT
         6wc/gO9FBaRS4MXxMVHE2PrQjaz4DLpf7WU/blwhjg/2mgb2sdVWiEjePULtJC3G6pgL
         MvqQVOmV+h2+aTEg2sas+pMQzaKtzFkh4Y6ur/JK10U0p4l3W7RrC6emSTocYNH6OHp6
         B4qA==
X-Gm-Message-State: AJIora9z1HKDPUb0F7h+b2E99/PHeG6K9UjzDBMf1jJnJUbOkB8eC/iH
	ugKzm0TP2XwORexk9ZGiznMsDpbrxys=
X-Google-Smtp-Source: 
 AGRyM1s+PcvNifBvmd6nxQ3QgwtfTFWJsLPtVv5+YoLbPwnUvESbUHXpS71Nr0JiFFkLvBBO6+EB9g==
X-Received: by 2002:a17:907:2bf1:b0:72b:5cc3:79cf with SMTP id
 gv49-20020a1709072bf100b0072b5cc379cfmr10233943ejc.382.1658306699139;
        Wed, 20 Jul 2022 01:44:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/51] xf86-input-keyboard: remove the recipe
Date: Wed, 20 Jul 2022 10:44:01 +0200
Message-Id: <20220720084442.2940187-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168304

It has been superseded by libinput/evdev on Linux, and upstream specifically
errors out on Linux in latest release:
https://github.com/freedesktop/xorg-xf86-input-keyboard/commit/7e366936d7b7d6c3b4d9c1554908ad20eef74a27

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../conf/distro/include/poky-floating-revisions.inc |  2 --
 meta/conf/distro/include/maintainers.inc            |  1 -
 .../xorg-driver/xf86-input-keyboard_1.9.0.bb        | 13 -------------
 3 files changed, 16 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb

diff --git a/meta-poky/conf/distro/include/poky-floating-revisions.inc b/meta-poky/conf/distro/include/poky-floating-revisions.inc
index 6f473de88c..0cc4e005b9 100644
--- a/meta-poky/conf/distro/include/poky-floating-revisions.inc
+++ b/meta-poky/conf/distro/include/poky-floating-revisions.inc
@@ -43,8 +43,6 @@ SRCREV:pn-xf86-input-evdev = "${AUTOREV}"
 #PREFERRED_VERSION_xf86-input-evdev ?= "2.0.4"
 SRCREV:pn-xf86-input-mouse = "${AUTOREV}"
 #PREFERRED_VERSION_xf86-input-mouse ?= "1.3.0+git%"
-SRCREV:pn-xf86-input-keyboard = "${AUTOREV}"
-#PREFERRED_VERSION_xf86-input-keyboard ?= "1.3.1+git%"
 SRCREV:pn-xf86-input-synaptics = "${AUTOREV}"
 #PREFERRED_VERSION_xf86-input-synaptics ?= "0.15.2+git%"
 
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ac1a1ea1a7..e20275c674 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -841,7 +841,6 @@ RECIPE_MAINTAINER:pn-xdpyinfo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xev = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xeyes = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-evdev = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xf86-input-keyboard = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-libinput = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-mouse = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-synaptics = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
deleted file mode 100644
index 1896fff9f9..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- keyboard input driver"
-
-DESCRIPTION = "keyboard is an Xorg input driver for keyboards. The \
-driver supports the standard OS-provided keyboard interface.  The driver \
-functions as a keyboard input device, and may be used as the X server's \
-core keyboard."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
-
-SRC_URI[md5sum] = "a3a3f0dd32361dcdbd406e894dafe090"
-SRC_URI[sha256sum] = "f7c900f21752683402992b288d5a2826de7a6c0c0abac2aadd7e8a409e170388"
-- 
2.30.2


