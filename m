Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69610C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:52 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.15557.1704990463129329245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S9FVwvo8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cdfed46372so4291309a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990462; x=1705595262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lv8emVTqxjsH+0BDzsgJzMe8yZQlEkISakx1mBjTa4Y=;
        b=S9FVwvo8Yp2AxyaS3IAuew3I4oYPZkAzEtZC0jMCimRDkZDbATejgaBKfd03xbTgYI
         IC/kHi4i/uJfZK2tOI4E633v2LBkbZw5oLYrLiEswCwFemp7zyINJ5ZA8HH/0YSRrfdS
         /ox8OtTkwYLfFnmdVaD2WhJnkAKy+CmjHtaI5S0q0QgC+6ysmDC9DT43oYsTXc7nzFLr
         Me/9kTEIjTDHgUd2rp3brwRFy/nVCd5wi0RpaTwi3lm71cQQswAgBDEiI8FJeSazsYI0
         3omliRgEChnexKeuwTgGXIu8hlp+QBL6Hp0fS9YRyfO/uOMRw0nl4ineXgn45wn+qnPq
         qreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990462; x=1705595262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lv8emVTqxjsH+0BDzsgJzMe8yZQlEkISakx1mBjTa4Y=;
        b=Cm0rKJ3xXmK3yeeGflZbSTvukwxqB8MJPK9A09HUAuze75II9Iz5x0Ns+2SFClFKiQ
         mu4ibDt0Z8RDhYZ20LXnPfwbe8JPfamqsRgvwEb8/SFzNra4n+JneieelPALx0NuNhhS
         huGd96/7rFjKngUOJeeMrscRorApvUy+CTa5jA5le696R4GCmGsQPv/hLPITKKMj+IZI
         Ia3xz1hixNHd0POeZ3nFoZvmkHVAQv/8/zpk4ZqeG0enGCXRq0JfFyY57e4dE0vDFjID
         +u4f9P9ozUy2X6LszmBKDal6oXKUyzX2c3ln6f/ya0BMiKysb5QeP9MoUCRpMNtPKjMP
         OImg==
X-Gm-Message-State: AOJu0YzSCbjXk4waeyPu0SckOdN0q5QLROlHKP+dGSJrefn58IsAKT0x
	VXhMA2y1IdtqHArU5xR3/oDWSgXp634UeFRgMWT9LvoXOaw24Q==
X-Google-Smtp-Source: AGHT+IGMTN17DiR3W5RX0rEAdrxTZC+oU0wbpepqG1UiiuytbEtQmQzREjSx11wi+EkM11oFbxlR7A==
X-Received: by 2002:a05:6a20:4d8f:b0:19a:5106:788a with SMTP id gj15-20020a056a204d8f00b0019a5106788amr73008pzb.54.1704990461873;
        Thu, 11 Jan 2024 08:27:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/12] linux-firmware: Change bnx2 packaging
Date: Thu, 11 Jan 2024 06:27:19 -1000
Message-Id: <49ca6eb5ef93bf90c682ea06c83db147aed250fa.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193554

From: Jason Andryuk <jandryuk@gmail.com>

The bnx2 module uses both the mips and rv2p files, so package them all
together.  Remove -mips from the package name, but add an RPROVIDES for
compatibility.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 46f2b7b3bebc7efdb4199cdfe386dc16c049d8d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20231030.bb      | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index b849c086b6..a1229e4827 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -340,7 +340,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ice-license ${PN}-ice \
              ${PN}-ice-enhanced-license ${PN}-ice-enhanced \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
-             ${PN}-bnx2-mips \
+             ${PN}-bnx2 \
              ${PN}-liquidio \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
@@ -1087,18 +1087,22 @@ RDEPENDS:${PN}-bcm4356-pcie += "${PN}-cypress-license"
 LICENSE:${PN}-bcm4373 = "Firmware-cypress"
 RDEPENDS:${PN}-bcm4373 += "${PN}-cypress-license"
 
-# For Broadcom bnx2-mips
+# For Broadcom bnx2
 #
 # which is a separate case to the other Broadcom firmwares since its
 # license is contained in the shared WHENCE file.
 
-LICENSE:${PN}-bnx2-mips = "WHENCE"
+LICENSE:${PN}-bnx2 = "WHENCE"
 LICENSE:${PN}-whence-license = "WHENCE"
 
-FILES:${PN}-bnx2-mips = "${nonarch_base_libdir}/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
+FILES:${PN}-bnx2 = " \
+    ${nonarch_base_libdir}/firmware/bnx2/bnx2-mips*.fw \
+    ${nonarch_base_libdir}/firmware/bnx2/bnx2-rv2p*.fw \
+"
 FILES:${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 
-RDEPENDS:${PN}-bnx2-mips += "${PN}-whence-license"
+RDEPENDS:${PN}-bnx2 += "${PN}-whence-license"
+RPROVIDES:${PN}-bnx2 = "${PN}-bnx2-mips"
 
 # For cirrus
 LICENSE:${PN}-cirrus = "Firmware-cirrus"
-- 
2.34.1


