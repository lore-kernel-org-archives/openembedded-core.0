Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25996EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.16721.1690487059517397833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=GiORgzY9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b8ad8383faso11087235ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487058; x=1691091858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTp4MSwT70rNfInmMxEu2YPMi8qNqs55pVaoCguj2V0=;
        b=GiORgzY9nRBeqzY26cjG9HW18vprXKZcPYd/ui4otGbB3wp2cdalIiT475f16YFL4y
         Tt1Hbna9VzjHqtYzKyLurbirbWf5IUmAFq+FO+T3rISYrE/vl1k7Gro0DDdOPT2bqazy
         m03agpUo4R685/djOYcvzDm2BR2RK5MSHm6H/nldSwPhoZGeMHfSuPD7YtZPHKH6bRbK
         NMOd5hATSeqJrItpz4QLr0/B89V/jZsx27DPvU3Mb6qijopaqn3IL76k3xXIcaP4YLz0
         Jihd9hcor8qtlTFTVgLGOUlyBAnocXHAD6NyGzw5QxMoOeQRvt4L/xXln4mU4jZv8k3i
         L9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487058; x=1691091858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTp4MSwT70rNfInmMxEu2YPMi8qNqs55pVaoCguj2V0=;
        b=lmaseXIybVR3jmbcqlD5lsYDEHxSgCNZa/AePzi7fhl5O1ESmyxuyaG8A5nxHlxYU+
         hnRWie5qhpgCA9sywD/XS7+SmWI/YBLd7BNsCjH58+MYwYD8LUEARf1yJ1pttOLhhhdY
         XNMURqugNcoU+DsYzRwT6dSbhczIHR8A8xYKGncBAvEwfSPmoSOGujP60Wp//TcFZHTu
         3cWyuQ07RerCvdkYZzUIe86eJw4UEr3PfA3j6uf5Qs3EwH2ZEW/vZRYE8y4cQRfkX6dB
         RZrmbARGiEMInjxLNzJVR6tW0pxJJUB8CyQavIQSwiA965qG+HrZj+8PABLfiTycpPbr
         AQhA==
X-Gm-Message-State: ABy/qLbXE/2SC95HThXdR/z8b9DXZXThQNQt3xTEEw3izcf7XJgJscYb
	lEMJztB4sZ+jxJ64H5KvP8TKVjnVhJvlI+PS4Ak=
X-Google-Smtp-Source: APBJJlFvwKa1Rt/69oFNWi+JJ7gkAuxFPhK43UVmkGQXEMkABu8BG+mPK2tL2uPxim6LprxGV1ojhg==
X-Received: by 2002:a17:903:1252:b0:1bb:961e:dfbc with SMTP id u18-20020a170903125200b001bb961edfbcmr371803plh.20.1690487058715;
        Thu, 27 Jul 2023 12:44:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/27] uboot-extlinux-config.bbclass: fix old override syntax in comment
Date: Thu, 27 Jul 2023 09:43:31 -1000
Message-Id: <0bbafc8b4d0c401a2af7c4b80e86d3e3fe01bed5.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184988

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The comment specifies how to use the variables but uses the older and
now unsupported override syntax. Let's update to match the newer syntax.

Cc: Quentin Schulz <foss+yocto@0leil.net>
(From OE-Core rev: 0a381eea4d50ff1c6e7c7d0d4df62eb581454b48)

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb64f3fed29b9532e6ddc9a2ba0283d373622d87)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-extlinux-config.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index 86a7d30ca0..653e583663 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -33,11 +33,11 @@
 # UBOOT_EXTLINUX_DEFAULT_LABEL ??= "Linux Default"
 # UBOOT_EXTLINUX_TIMEOUT ??= "30"
 #
-# UBOOT_EXTLINUX_KERNEL_IMAGE_default ??= "../zImage"
-# UBOOT_EXTLINUX_MENU_DESCRIPTION_default ??= "Linux Default"
+# UBOOT_EXTLINUX_KERNEL_IMAGE:default ??= "../zImage"
+# UBOOT_EXTLINUX_MENU_DESCRIPTION:default ??= "Linux Default"
 #
-# UBOOT_EXTLINUX_KERNEL_IMAGE_fallback ??= "../zImage-fallback"
-# UBOOT_EXTLINUX_MENU_DESCRIPTION_fallback ??= "Linux Fallback"
+# UBOOT_EXTLINUX_KERNEL_IMAGE:fallback ??= "../zImage-fallback"
+# UBOOT_EXTLINUX_MENU_DESCRIPTION:fallback ??= "Linux Fallback"
 #
 # Results:
 #
-- 
2.34.1


