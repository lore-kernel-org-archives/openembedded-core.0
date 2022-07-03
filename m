Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3E3C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:37:35 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.64317.1656877052585849186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=v017Y+xa;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 9so7114512pgd.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a/gUiPecixbe+DKvm9t6FUd3/OsIRMbEFxaVlPeNniU=;
        b=v017Y+xafgVuqkQJwmFbWqsISZwpRGgwiRlhEZX8e4AZpk3A7htvYDJEESfwpEYIeU
         1C63NyCWDh9LF3nJ4t5WSYtAKP3VLhM5DZEey+IVk3NWnTpPDfqpUbpeC7uSi1tynBmg
         dmkOFl0d0vv5ZnHbS5lz0hQUizdrT/S6lAElPQS2+DhmuGLP3ie2UAffVMQl0qY0hJB2
         bmaTNo0kruQJm7A1ofFYgr4YwV0imGCFXpxK5wHs9UaZJobNPGMD6KWdsOZ391MH445t
         09KxeN7ZJ39Y2xBqsZrdXpNJ9IInE2QaXDVG5ZJZU1UBVbEfEsTAD4ZYpH/bbSBRKDLB
         yvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a/gUiPecixbe+DKvm9t6FUd3/OsIRMbEFxaVlPeNniU=;
        b=pxzv4Ehca4KUQ1NVIA9vWDvzIfkfB72FvAQtacZ/JzN2L+RmThXap3l/ZSOUzotpDh
         QGoBi320jXN48nml4cv73m8knzojXFHm54ODdHpGFljTYxd4Ad0zneRwFII4qXMRXzco
         VeZVgglCGqpDZDiArhYr6LVxxcM7wKoiJpM2NkllpxfVbuBXLed4DUL/ytruDh5U1vho
         COoJYMWkINWED8RPuoMKVB0z4BeoDkUYdbYn7rSx6VEwxblNW0CESttbyGTdgTsVq7Bs
         QedqN+X+PQAreVN+PNrr5+FxwZ8j1cvZKvX/ahY9dXMgiMuPMpcKASLOXOx1DwzNie1S
         hsXQ==
X-Gm-Message-State: AJIora9AbG3adjGYghcQQGpKbRjVMmblJds3nQ4z+pJesDYTixwF+wuk
	Cnc4iQoRqg5y+ipAysW9qYJXINOllTMl2GDu
X-Google-Smtp-Source: 
 AGRyM1vE4+6Oru6BZj2faJfL+kw8UBrSTb5sSwlk/Lj7u6PYK4QqjsFbBNd2P7+erp08MEafNTzELg==
X-Received: by 2002:a65:6c0a:0:b0:3fa:c20c:cbe7 with SMTP id
 y10-20020a656c0a000000b003fac20ccbe7mr22231183pgu.611.1656877051536;
        Sun, 03 Jul 2022 12:37:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:37:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/30] kernel-uboot.bbclass: Use
 vmlinux.initramfs when INITRAMFS_IMAGE_BUNDLE set
Date: Sun,  3 Jul 2022 09:35:50 -1000
Message-Id: 
 <3f8a49c4f276c65ccec149e3dc2e06d74c3c5a80.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:37:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167575

From: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>

vmlinux file doesnot have the initramfs image when INITRAMFS_IMAGE_BUNDLE was set.
Use vmlinux.initramfs in uboot_prep_kimage when INITRAMFS_IMAGE_BUNDLE set
based on the implementation in kernel.bbclass do_bundle_initramfs function,
https://github.com/openembedded/openembedded-core/blob/master/meta/classes/kernel.bbclass#L316-L317
to be able to use proper linux.bin file in creation of fitImage.

Signed-off-by: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit e0a4e45e067d9fdb67a7d223aea463f259469035)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-uboot.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 2daa068298..2facade818 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -15,6 +15,12 @@ uboot_prep_kimage() {
 		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
+		# Use vmlinux.initramfs for linux.bin when INITRAMFS_IMAGE_BUNDLE set
+		# As per the implementation in kernel.bbclass.
+		# See do_bundle_initramfs function
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ] && [ -e vmlinux.initramfs ]; then
+			vmlinux_path="vmlinux.initramfs"
+		fi
 		linux_suffix="${FIT_KERNEL_COMP_ALG_EXTENSION}"
 		linux_comp="${FIT_KERNEL_COMP_ALG}"
 	fi
-- 
2.25.1


