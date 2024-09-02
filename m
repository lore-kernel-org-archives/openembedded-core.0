Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306AECA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 20:32:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.8362.1725309135577121878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 13:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YxIsYvSm;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso38333445e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 13:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725309134; x=1725913934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwgeIikcoG8umDLIz3yONNQyPRfLfkDrOSxK9KsF110=;
        b=YxIsYvSmjsO1XAebgEQvDZUEd6II6QgMdjRjkJwsjzLOCOBdVVY/4awWGItuMRUZy9
         fH3aLv7p1TNtWS8HkIOC9kn5+ZgzpcQ3K+Z6di3RKIMmIMXnbIMGelBxVMhUSb759JyR
         rQEGLFNEodNr0CFbNsIKDwjPGQaAxzvpyglUWZ2/5D99JkGmW/T9gAwnj9f4fHM0e6Pr
         t7doelPYPQeUvDKqt/y3Z690PJj3EOgMJVZStqVMrg2RDecwrzKjEzSG812j2QOw/6tW
         RuRfMJJH3Fzk110Gjb5NEcXeTaY4JMScPGSuaomW23XXd+k9q24VcAsVqpyBbHbNmQpU
         OBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725309134; x=1725913934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwgeIikcoG8umDLIz3yONNQyPRfLfkDrOSxK9KsF110=;
        b=KvlpeqfzKtGJsrSg3dVo2g1w7TfNpQiFt5MGOjlVEA8wD7+T9f9T8U9RxJi0m2gkBT
         43ukx7IfEZGE7R9uckh42W8pSsFtnN+6V2zCHPzY2jys9Tpi4bWZFeYXEA20RldHlwjh
         InF797EPetQcSKng4qb9jvaAgzWPtxcAj3NFUEa8vn/LImiBxKuuMZDdl/W8VXKni5+H
         3VotWCA6dMCEN3vv6cQkwULS8rIYKXVvX/GCxqX6+mzFbABzNLBtircD+7EEbUCbXRmL
         6Y3ZOiBboynwidgwVV1YmPMNUtIEb3twR9FnsQAvfgIkRA00Yd4e1ARZ7ryAV6nIibGe
         64FA==
X-Gm-Message-State: AOJu0Ywu3CiFNDEMX8N7Pho2Yts9Mlr5dJnluKaEYGU1bAh/8wKwoZ3m
	BjFB16xWhFL9p5+XZXAwpAbH97Va+V7pwTIw3NFK4TaR0zHGyGsjS0knkA==
X-Google-Smtp-Source: AGHT+IGPsilnlmCrkwcjQFqnF2MOYolamLHqG9+icxGIEmA0Ky2Jy61f6mUNsbOokGEP0c5734i1qA==
X-Received: by 2002:a05:600c:511d:b0:426:5ee3:728b with SMTP id 5b1f17b1804b1-42c82f53210mr35446115e9.13.1725309133171;
        Mon, 02 Sep 2024 13:32:13 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbc8de253sm96537205e9.0.2024.09.02.13.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 13:32:12 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/3] uboot-config: fix devtool modify with kernel-fitimage
Date: Mon,  2 Sep 2024 22:31:52 +0200
Message-ID: <20240902203154.265515-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 20:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204111

From: Adrian Freihofer <adrian.freihofer@siemens.com>

How to reproduce:
- UBOOT_CONFIG must be used. With UBOOT_MACHINE it works fine.
  A simple example based on oe-core is to modify the
  beaglebone-yocto.conf file like this:
  -UBOOT_MACHINE = "am335x_evm_defconfig"
  +UBOOT_CONFIG = "foo"
  +UBOOT_CONFIG[foo] = "am335x_evm_defconfig"
- A build configuration which inherits the kernel-fitimage.bbclass is
  needed. For example:
  MACHINE = "beaglebone-yocto"
  KERNEL_IMAGETYPE = "Image"
  KERNEL_IMAGETYPES += " fitImage "
  KERNEL_CLASSES = " kernel-fitimage "

devtool modify linux-yocto
devtool build linux-yocto
...
| cp: cannot stat '.../linux-yocto-6.6.21+git/am335x_evm_defconfig/.config':
  No such file or directory
| WARNING: .../linux-yocto/6.6.21+git/temp/run.do_configure.2081673:172 exit 1
  from 'cp .../linux-yocto-6.6.21+git/am335x_evm_defconfig/.config
  .../build/workspace/sources/linux-yocto/.config.baseline'

The reason for this problem is that the uboot-config.bbclass sets the
variable KCONFIG_CONFIG_ROOTDIR to a path that makes sense for u-boot,
but not for other recipes. However, the kernel-fitimage.bbclasse, for
example, inherits the uboot-config.bbclass, which brings the
u-boot-specific path into the kernel build context.

This change removes the uboot-specific KCONFIG_CONFIG_ROOTDIR path from
recipes other than u-boot itself.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/uboot-config.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index e55fc38b7c7..09001997d3d 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -101,9 +101,9 @@ python () {
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
     ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
+    PN = d.getVar("PN")
 
     if not ubootmachine and not ubootconfig:
-        PN = d.getVar("PN")
         FILE = os.path.basename(d.getVar("FILE"))
         bb.debug(1, "To build %s, see %s for instructions on \
                  setting up your machine config" % (PN, FILE))
@@ -140,9 +140,12 @@ python () {
             if not found:
                 raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %s has no match in %s." % (ubootconfig, ubootconfigflags.keys()))
 
-            if len(ubootconfig) == 1:
-                d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
-            else:
-                # Disable menuconfig for multiple configs
-                d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
+            # This recipe might be inherited e.g. by the kernel recipe via kernel-fitimage.bbclass
+            # Ensure the uboot specific menuconfig settings do not leak into other recipes
+            if 'u-boot' in PN:
+                if len(ubootconfig) == 1:
+                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
+                else:
+                    # Disable menuconfig for multiple configs
+                    d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
 }
-- 
2.46.0


