Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EC2C7619A
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.18080.1678709759521615330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LvN7S8nO;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id j11so47845967edq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ycQ2HUyoiiLKSMarD7UHyDMX5t5B9d2d15K+0m7BJA=;
        b=LvN7S8nOwgalL0Q74VOEDjY0Zb1DF3jeB97n/byvfcG0Ngq7R3SZVeM9YB4acgrtMa
         DGNoiAB7dhz5b4/7Ux2lsqnxRMZCx7Su4dlTnhXfQXzQO/zZkPB5SYvehXxwREInL7rO
         4j8ymyP6YVPb67ftpnA8af7bExcs0y+qxX7LQ3UYLbbCSady0idp5G38T2tubE5/4H3g
         uTkzj3oAvjU+VkF821f+B7wJsK+DL1wo4Roz8xNjg/EBKvRpcKok5iaYGHMucAgvniDy
         H0NTBJ7Snj8trxWe0ETYtjPt3o9XRxoYsKDTlamfFlddlRHOc+cX17GP5uOmef6Voa67
         L58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ycQ2HUyoiiLKSMarD7UHyDMX5t5B9d2d15K+0m7BJA=;
        b=br6TQY9QMpNhS+GXQ9g/uwRQLf2i4BMlEMJcPupHKjh69bgEOr1Y8531D6kYa1aGPB
         VEiz+uhoXQqTFKR0SdrJRf7XSuHY3lvsuw69YAEMecczSmoIjWXAVtHfO5fchCvBHdbr
         irPnDk/tPnP2rfME5lW7AG9SoQ5E3snkBoKHeMGa5WExlY9w6fbnfCDPMZGhuj9Zs9s1
         RfAiAddSRHajiJtttpL4uqFhFHPlJeCFKvR90btzpY44zBTGF081EO7Tm8n04F4kn0ph
         jxlGZIgEmX4ZzL+asyYoKQRZjtw+N8Z8pF+tpGdR6zru3KbtlY4xIjceyFy09tjPGgc/
         AVUA==
X-Gm-Message-State: AO0yUKVj3xlV4qFxJZPgGQX+pRAHJk4wR/aA8ynkJZLilqhxctH6Sbxy
	fBvm+EeONE1PADGXTzK801qaW5s5q1E=
X-Google-Smtp-Source: AK7set+7onMxJztN9llUaK+I0EleU5098rnkZg3xaDUGmkE24UZXoaD+++MlsabB6q6yYWwgeG7x3w==
X-Received: by 2002:a17:906:1643:b0:871:dd2:4af0 with SMTP id n3-20020a170906164300b008710dd24af0mr35785004ejd.26.1678709758082;
        Mon, 13 Mar 2023 05:15:58 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id vo11-20020a170907a80b00b008b17de9d1f2sm3399253ejc.15.2023.03.13.05.15.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/14] selftest: fitimage.py: respect INITRAMFS_IMAGE_NAME and KERNEL_FIT_LINK_NAME
Date: Mon, 13 Mar 2023 13:15:35 +0100
Message-Id: <6a87e08d2b541553ef7bb93b2afbd0a28e4177ea.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178440

* use these variables instead of assuming:
  "fitImage-its-%s-%s-%s" % (image_type, machine, machine)
  notice that these files have no extension and the -machine suffix
  is duplicated (once from core-image-minimal and once from
  kernel-fitimage.bbclass:kernel_do_deploy:append
  through KERNEL_FIT_LINK_NAME which is MACHINE by default:

  KERNEL_FIT_NAME ?= "${KERNEL_ARTIFACT_NAME}"
  KERNEL_FIT_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"

  KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
  KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 34 +++++++++++-------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 1570d54dfb..7bc171e02d 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -5,7 +5,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import os
 import re
 
@@ -42,15 +42,14 @@ FIT_DESC = "A model description"
         self.write_config(config)
 
         # fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
+        image = "virtual/kernel"
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'INITRAMFS_IMAGE_NAME', 'KERNEL_FIT_LINK_NAME'], image)
 
-        image_type = "core-image-minimal"
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "fitImage-%s-%s-%s" % (image_type, machine, machine))
+        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "fitImage-its-%s-%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_LINK_NAME']))
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "fitImage-%s-%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_LINK_NAME']))
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
@@ -123,15 +122,14 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         self.write_config(config)
 
         # fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
-
-        image_type = "core-image-minimal"
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "fitImage-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "fitImage-%s.bin" % (machine,))
+        image = "virtual/kernel"
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'KERNEL_FIT_LINK_NAME'], image)
+
+        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "fitImage-its-%s" % (bb_vars['KERNEL_FIT_LINK_NAME']))
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+            "fitImage-%s.bin" % (bb_vars['KERNEL_FIT_LINK_NAME']))
 
         self.assertTrue(os.path.exists(fitimage_its_path),
             "%s image tree source doesn't exist" % (fitimage_its_path))
-- 
2.39.2


