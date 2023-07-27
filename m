Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A08CC001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.8979.1690468592454740635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=W2da/U4b;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99bcc0adab4so140839766b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468591; x=1691073391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dQYskZSqGwZOKiPJy3B7SRitfe0uvIoO8nDvI5qU3c=;
        b=W2da/U4b0J31uUD7W4bpC4fIlkk+mYHndeWDOAH5STWf0q64Iz/xhvI5hCc5cQ1U9j
         3vqgpVPoH5RZtz7l2TOZM0V8gk13rhyK+9y4lyYCRyPOeGFfbSqMOPAx7eTlIjl7nEXb
         UxW3RwovpFongl10oVcOcHxTkMhXp8eoSoICdnZcZ3eOY1s49XjwusqWUUaSuZ015WRQ
         v8HgSxTuxpD9dyH3ZwEsRbakYngTPOhixysGTx9XOGDiSety8m85C+ukZQcNCv2JL83Y
         6v0rUnr6Jag8KnnCyVYCYQ2wGsDaPB78CthrsRjfVYfyv5gTQelAvAUEagSDE9nTNbji
         ij8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468591; x=1691073391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dQYskZSqGwZOKiPJy3B7SRitfe0uvIoO8nDvI5qU3c=;
        b=WU3cqNssXeT5q8Ute0D61vbNakYArOn/TmFT4DKoOmKIigbcd9pG/JztGY9oFFZ5Uj
         sz/PrIgNMQVB185RRGLOcloFtq8b0bMdZ4F9R/y770FqimXf2+NSA0zVjlb/1HCKp1Lp
         f21POSIsB4q1fZreOjJKmNddla9WbUPxbLNK8AYWw9VSSqLrdyQjsHZHgNb+lUbGjwrY
         pWJgGaBeaBFu/oFZEqEswekJtCaqMwMo/hQbJidpWfim2Q1vDtBJtuseh6ARrInuh1Uo
         JW1sPQSjyTzxBw7AoCcYwbyIe5r7zKqMzHb2l64r3BFUbF+lPMsHhIQv1v9WOEKkQexS
         Mh9g==
X-Gm-Message-State: ABy/qLY7MyxIITFoa5A7oLrgDXgYHtA0PS5pkeJIbS4T9q1xH7djEa8A
	VnJMCKtDnY2fD+FNDpTCPtLnsaBDTaw=
X-Google-Smtp-Source: APBJJlEiGfa6ZAFqapCh6vNO16WzjX4U7Bwp/LSVTQUJZ2OvYez1j4WqVyZv9mAfmtFF4SQrHwyIaQ==
X-Received: by 2002:a17:906:64c1:b0:994:8e9:67fe with SMTP id p1-20020a17090664c100b0099408e967femr2112936ejn.35.1690468590568;
        Thu, 27 Jul 2023 07:36:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/21] meta: add missing summaries for image recipes
Date: Thu, 27 Jul 2023 16:36:07 +0200
Message-Id: <20230727143627.3718496-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184941

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb        | 1 +
 meta/recipes-core/images/core-image-tiny-initramfs.bb           | 1 +
 meta/recipes-core/ovmf/ovmf-shell-image.bb                      | 2 +-
 meta/recipes-extended/images/core-image-full-cmdline.bb         | 2 +-
 .../images/core-image-testcontroller-initramfs.bb               | 2 +-
 meta/recipes-extended/images/core-image-testcontroller.bb       | 2 +-
 meta/recipes-sato/images/core-image-sato.bb                     | 1 +
 7 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 0b51187d516..1c08c7fec62 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -1,4 +1,5 @@
 # Simple initramfs image. Mostly used for live images.
+SUMMARY = "Small image capable of booting a device."
 DESCRIPTION = "Small image capable of booting a device. The kernel includes \
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
 first 'init' program more efficiently."
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index a1883de0ebe..96b56a2f59b 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -1,4 +1,5 @@
 # Simple initramfs image artifact generation for tiny images.
+SUMMARY = "Tiny image capable of booting a device."
 DESCRIPTION = "Tiny image capable of booting a device. The kernel includes \
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
 first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
diff --git a/meta/recipes-core/ovmf/ovmf-shell-image.bb b/meta/recipes-core/ovmf/ovmf-shell-image.bb
index 50c4517da39..4d7958eb5fa 100644
--- a/meta/recipes-core/ovmf/ovmf-shell-image.bb
+++ b/meta/recipes-core/ovmf/ovmf-shell-image.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "boot image with UEFI shell and tools"
+SUMMARY = "boot image with UEFI shell and tools"
 COMPATIBLE_HOST:class-target='(i.86|x86_64).*'
 
 # For this image recipe, only the wic format with a
diff --git a/meta/recipes-extended/images/core-image-full-cmdline.bb b/meta/recipes-extended/images/core-image-full-cmdline.bb
index 4d69073d9dc..4e1cf58d55b 100644
--- a/meta/recipes-extended/images/core-image-full-cmdline.bb
+++ b/meta/recipes-extended/images/core-image-full-cmdline.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A console-only image with more full-featured Linux system \
+SUMMARY = "A console-only image with more full-featured Linux system \
 functionality installed."
 
 IMAGE_FEATURES += "splash ssh-server-openssh"
diff --git a/meta/recipes-extended/images/core-image-testcontroller-initramfs.bb b/meta/recipes-extended/images/core-image-testcontroller-initramfs.bb
index 2bc035a538d..a5b3d10205c 100644
--- a/meta/recipes-extended/images/core-image-testcontroller-initramfs.bb
+++ b/meta/recipes-extended/images/core-image-testcontroller-initramfs.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Small image capable of booting a device with custom install scripts, \
+SUMMARY = "Small image capable of booting a device with custom install scripts, \
 adding a second rootfs, used for testing."
 
 # use -testfs live-install scripts
diff --git a/meta/recipes-extended/images/core-image-testcontroller.bb b/meta/recipes-extended/images/core-image-testcontroller.bb
index 20edbd5630c..ff79bde0c5d 100644
--- a/meta/recipes-extended/images/core-image-testcontroller.bb
+++ b/meta/recipes-extended/images/core-image-testcontroller.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A test controller image to be deployed on a target useful for testing other images using the OEQA runtime tests"
+SUMMARY = "A test controller image to be deployed on a target useful for testing other images using the OEQA runtime tests"
 
 IMAGE_FEATURES += "ssh-server-openssh package-management"
 
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index e63a229d125..9200ae54401 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Image with Sato, a mobile environment and visual style for mobile devices."
 DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
 mobile devices. The image supports X11 with a Sato theme, Pimlico \
 applications, and contains terminal, editor, and file manager."
-- 
2.30.2


