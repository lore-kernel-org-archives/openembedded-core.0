Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87FAC61DF5
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:28 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.18445.1700657122868198193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I9NjESkF;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so9207761a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657121; x=1701261921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlBhm5GF0q5Wo0sPb/2QT6eSIvU3iKhNBT1zDDhZ3OQ=;
        b=I9NjESkFDxnexxYsHnQJ7EFNiJeeXT3GZck+hty2cBpbMgv4S4e2jMFiV76bcdIk3I
         aL0lDXzQ1iaJbO0dJJ71vzcbx5Z/0ofTcgEZTE+2bF6JXAYjsopYh1eFWm7YZyi3N9RY
         q6Q5Hky0DpEDz4L+GDpPSQhNDU9P56xpILuWZiPk9Y7FF0U2rZVrRbaSES4tSknB4w68
         irQ0sP62ck2rZPytwdJs7aiYBFZV4iGnj0jFLxHslof+i8DvwA4UCw0AAljPiXuRwbgE
         5inKmSnw2TWWBdGyAUHY2LRDkZVtfG69zDcix56umlli2oJuVRd0xPY173unJwrlWFJ5
         HTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657121; x=1701261921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlBhm5GF0q5Wo0sPb/2QT6eSIvU3iKhNBT1zDDhZ3OQ=;
        b=muNtRkCOSNytajdOt9JXIH+IoHaddxpI1I0nXcccwylUT+eLvcDZMKNzhzQv4z0ZtA
         cIN8fvVN4Cu3MJFiDhb9NkJFVY+4I0C+9c4v4IS/vaH1On0Vt5Y/wyzfr/cu2VU//BRR
         ASILQoQrKw5QsejEoOpgqqdRKzwyixI2EBhb/xoxpqXJG8ydZ+PB4gwE0ty7w3ezlfC0
         1TSb2yiyMpj7xo2JWkt8OkIrZep4TNlmkYfjsuO6uq4JVA5WhRRhCLlcnLEQqSJjSCfF
         yqR/RpfV+Ojy4ObjeszRN/FYCuvRSrKfXwxN4pGot6hLSP49gEGMbaR9C82sOwx4E4da
         FpxQ==
X-Gm-Message-State: AOJu0YwOFw6VEf2FEI65EjLWXPR6+RUQXC0Vfkch1fxFqRw52SXdvICK
	cnOG7MywQE2WUXUzAoifSNqN46iNuCk=
X-Google-Smtp-Source: AGHT+IEaeWkKnuWRMR4sTtJ7cv4+ptjCAQV34jv2ER5Pk/PIo59xC8fiw7rpPozB29RxmnBtx/aivQ==
X-Received: by 2002:a17:907:597:b0:9c7:4d98:981f with SMTP id vw23-20020a170907059700b009c74d98981fmr1196691ejb.33.1700657121265;
        Wed, 22 Nov 2023 04:45:21 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r7-20020a170906280700b009cc1e8ed7c5sm6559331ejc.133.2023.11.22.04.45.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/21] oeqa: fitimage: respect KERNEL_FIT_NAME
Date: Wed, 22 Nov 2023 13:44:47 +0100
Message-ID: <bb1a0aa20102e619da267e0caf9fa0de621dbb0f.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191094

* avoid couple of get_bb_var calls and use get_bb_vars instead

* use KERNEL_FIT_LINK_NAME instead of assuming it's MACHINE as e.g.:
  machine = get_bb_var('MACHINE')
  fitimage_its_path = os.path.join(deploy_dir_image,
     "fitImage-its-%s-%s-%s" % (image_type, machine, machine))

* be aware that KERNEL_FIT_LINK_NAME can still be set to empty
  and then this oeqa check would fail again, because this hardlink:

  ln -vf $deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_LINK_NAME}"

  wouldn't be created and also with KERNEL_FIT_LINK_NAME the
  PKGV in kernel recipe looks differently in the final kernel
  artifact and KERNEL_FIT_LINK_NAME e.g.:

  AssertionError: False is not true:
  tmp/deploy/images/beaglebone-yocto/fitImage-its-core-image-minimal-initramfs-beaglebone-yocto-beaglebone-yocto--6.1.20+git-r0-20230318024804 image tree source doesn't exist

  because it's actually named with SRCPV expanded:
  tmp/deploy/images/beaglebone-yocto/fitImage-its-core-image-minimal-initramfs-beaglebone-yocto-beaglebone-yocto--6.1.20+git0+29ec3dc6f4_423e199669-r0-20230318024804

  Use KERNEL_FIT_NAME instead of KERNEL_FIT_LINK_NAME but then we would
  need to add .its extension to expected filenames as well, but in previous
  commit I've added KERNEL_FIT_ITS_EXT variable and used it for links as well.
  But this doesn't apply for u-boot-its* files which don't use any extension.

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 98 ++++++++++++------------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 9383d0c4db..170df1bea2 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -5,7 +5,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars
 import os
 import re
 
@@ -46,12 +46,12 @@ FIT_DESC = "A model description"
         # fitImage is created as part of linux recipe
         image = "virtual/kernel"
         bitbake(image)
-        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'INITRAMFS_IMAGE_NAME', 'KERNEL_FIT_LINK_NAME'], image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'INITRAMFS_IMAGE_NAME', 'KERNEL_FIT_NAME', 'KERNEL_FIT_ITS_EXT', 'KERNEL_FIT_BIN_EXT'], image)
 
         fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-            "fitImage-its-%s-%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_LINK_NAME']))
+            "fitImage-its-%s%s%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_NAME'], bb_vars['KERNEL_FIT_ITS_EXT']))
         fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-            "fitImage-%s-%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_LINK_NAME']))
+            "fitImage-%s%s%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_NAME'], bb_vars['KERNEL_FIT_BIN_EXT']))
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
@@ -126,12 +126,12 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         # fitImage is created as part of linux recipe
         image = "virtual/kernel"
         bitbake(image)
-        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'KERNEL_FIT_LINK_NAME'], image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'KERNEL_FIT_NAME', 'KERNEL_FIT_ITS_EXT', 'KERNEL_FIT_BIN_EXT'], image)
 
         fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-            "fitImage-its-%s" % (bb_vars['KERNEL_FIT_LINK_NAME']))
+            "fitImage-its%s%s" % (bb_vars['KERNEL_FIT_NAME'], bb_vars['KERNEL_FIT_ITS_EXT']))
         fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-            "fitImage-%s.bin" % (bb_vars['KERNEL_FIT_LINK_NAME']))
+            "fitImage%s%s" % (bb_vars['KERNEL_FIT_NAME'], bb_vars['KERNEL_FIT_BIN_EXT']))
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
@@ -278,14 +278,14 @@ FIT_SIGN_INDIVIDUAL = "1"
         self.write_config(config)
 
         # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
+        image = "virtual/bootloader"
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'KERNEL_FIT_NAME'], image)
 
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
+        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "u-boot-its%s" % (bb_vars['KERNEL_FIT_NAME']))
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "u-boot-fitImage%s" % (bb_vars['KERNEL_FIT_NAME']))
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
@@ -363,14 +363,14 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
         self.write_config(config)
 
         # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
+        image = "virtual/bootloader"
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'KERNEL_FIT_NAME'], image)
 
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
+        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "u-boot-its%s" % (bb_vars['KERNEL_FIT_NAME']))
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "u-boot-fitImage%s" % (bb_vars['KERNEL_FIT_NAME']))
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
@@ -454,15 +454,14 @@ UBOOT_FIT_HASH_ALG = "sha256"
         self.write_config(config)
 
         # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
+        image = "virtual/bootloader"
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'KERNEL_FIT_NAME'], image)
 
-        image_type = "core-image-minimal"
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
+        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "u-boot-its%s" % (bb_vars['KERNEL_FIT_NAME']))
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "u-boot-fitImage%s" % (bb_vars['KERNEL_FIT_NAME']))
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
@@ -609,15 +608,14 @@ FIT_SIGN_INDIVIDUAL = "1"
         self.write_config(config)
 
         # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
+        image = "virtual/bootloader"
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'KERNEL_FIT_NAME'], image)
 
-        image_type = "core-image-minimal"
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
+        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "u-boot-its%s" % (bb_vars['KERNEL_FIT_NAME']))
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "u-boot-fitImage%s" % (bb_vars['KERNEL_FIT_NAME']))
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
@@ -753,26 +751,26 @@ FIT_HASH_ALG = "sha256"
         self.write_config(config)
 
         # fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
+        image = "virtual/kernel"
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'INITRAMFS_IMAGE_NAME', 'KERNEL_FIT_NAME', 'KERNEL_FIT_ITS_EXT', 'KERNEL_FIT_BIN_EXT'], image)
 
-        image_type = get_bb_var('INITRAMFS_IMAGE')
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-                    "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
-        fitimage_path = os.path.join(deploy_dir_image,"fitImage")
+        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "fitImage-its-%s%s%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_NAME'], bb_vars['KERNEL_FIT_ITS_EXT']))
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "fitImage")
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
         self.assertTrue(os.path.exists(fitimage_path),
             "%s FIT image doesn't exist" % (fitimage_path))
 
-        kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
-        kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
-        kernel_type = str(get_bb_var('UBOOT_MKIMAGE_KERNEL_TYPE'))
-        kernel_compression = str(get_bb_var('FIT_KERNEL_COMP_ALG'))
-        uboot_arch = str(get_bb_var('UBOOT_ARCH'))
-        fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
+        bb_vars = get_bb_vars(['UBOOT_LOADADDRESS', 'UBOOT_ENTRYPOINT', 'UBOOT_MKIMAGE_KERNEL_TYPE', 'FIT_KERNEL_COMP_ALG', 'UBOOT_ARCH', 'FIT_HASH_ALG'], image)
+        kernel_load = str(bb_vars['UBOOT_LOADADDRESS'])
+        kernel_entry = str(bb_vars['UBOOT_ENTRYPOINT'])
+        kernel_type = str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE'])
+        kernel_compression = str(bb_vars['FIT_KERNEL_COMP_ALG'])
+        uboot_arch = str(bb_vars['UBOOT_ARCH'])
+        fit_hash_alg = str(bb_vars['FIT_HASH_ALG'])
 
         its_file = open(fitimage_its_path)
 
-- 
2.43.0


