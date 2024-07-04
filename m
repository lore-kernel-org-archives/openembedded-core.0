Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909E7C38150
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:33 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.4923.1720077030339246222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BMMA3Fiq;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e829086f3so301720e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077028; x=1720681828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfjLd9FOVW2I6/6onHXMMhtC4OhIUoegSNhesRzxprQ=;
        b=BMMA3FiqO3tWZoWlZXU5hKTzNBi30NbyE8f64NaR6GwCM2rO9vDKWxnxWTnxgjA6Jw
         x/BOlZ8+GklCBNtI8+mtGhWEZkBh1UjznXQs3XNJGK7eyo5ecRKdYs28olX0pfUGLQUj
         0SDQ3quIP2c+MVqAhAFjMrvYhIpGYl41pKZdesTiE017ddiHc3XAvHWhvPjme6b82sxW
         lK4tRFd80sU09fLy3+JVsvro5PGBn4M16zMQxd1DCurJlf93+aqTOK2BLBfANqoY8fIT
         NtrjUNGa/UWct6p3oxWxhnZXPDjJJK/C0WwlWabtLb2mgFDiOBLrLlPyck8LC7S3B/RM
         Gwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077028; x=1720681828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfjLd9FOVW2I6/6onHXMMhtC4OhIUoegSNhesRzxprQ=;
        b=p31Mfwg01V6hduiWLFGzXZ+A0D/qOzg9CD3tRW59g/dt0WNdxtkE4sL9r8CfLTAjiK
         Bke0JJpfR3yhFZvZ2xnvTlI5K7B28EFBTqJEfZzbyCUIAUy9muENIyfSvOLlTF6KrdNK
         iGIILr6mzHl8O+pW4ui/hESy0g4busA3D03a5fh89HpmCORmho0NmPgIIybjRt4Z1xbW
         jDK8pHTkSMKAPIoGv4rEewHCnCxbwbvM6kqvq+hDUGoOl72NOr4aMMclU9+xdFlx/ipM
         xD+Wl8O4kRTLopYe78MTFsmtcflhEb5yY5yMiPpuzD20BKtsh0sYhg/bKrsSinLM2ic4
         ZDEA==
X-Gm-Message-State: AOJu0YyWQV62d2srrHQoCMQCzJXbCghaxb5B5rKMASt8ZVySb4561vJA
	aRBK936qjTXaXqXmCCKISjQAEsddAGpguoiPS7EOS8DYJ/Vs+biJzC4ltg==
X-Google-Smtp-Source: AGHT+IGfaqYya2qtoijE5UWpXgvo58NBd+z3kvgKNwBckEGrcZFN38VnwTrL0oLusOWhU6awUqYKIw==
X-Received: by 2002:ac2:5dc1:0:b0:52e:9480:9e71 with SMTP id 2adb3069b0e04-52ea0632d66mr463488e87.28.1720077028133;
        Thu, 04 Jul 2024 00:10:28 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:27 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 13/14] image: depends do_deploy_fitimage_unbundled
Date: Thu,  4 Jul 2024 09:09:49 +0200
Message-ID: <20240704071013.2982700-14-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201518

From: Adrian Freihofer <adrian.freihofer@siemens.com>

If a fitImage kernel with unbundled initramfs is built the final deploy
task is now do_deploy_fitimage_unbundled.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/image.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 28be6c63623..02a7952bcf9 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -142,7 +142,17 @@ do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 # This follows many common usecases and user expectations.
 # But if you are building an image which doesn't need the kernel image at all,
 # you can unset this variable manually.
-KERNEL_DEPLOY_DEPEND ?= "virtual/kernel:do_deploy"
+def get_kernel_do_deploy(d):
+    kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
+    kerneltype = d.getVar('KERNEL_IMAGETYPE') or ""
+    fitimage = kerneltype == 'fitImage' or 'fitImage' in kerneltypes.split()
+    initramfs_image = d.getVar('INITRAMFS_IMAGE') or ""
+    bundled = d.getVar('INITRAMFS_IMAGE_BUNDLE') == '1'
+    if fitimage and initramfs_image and not bundled:
+        return "virtual/kernel:do_deploy_fitimage_unbundled"
+    return "virtual/kernel:do_deploy"
+
+KERNEL_DEPLOY_DEPEND ?= "${@get_kernel_do_deploy(d)}"
 do_build[depends] += "${KERNEL_DEPLOY_DEPEND}"
 
 
-- 
2.45.2


