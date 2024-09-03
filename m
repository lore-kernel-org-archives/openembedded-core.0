Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277CFCD37B1
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 20:48:43 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.34386.1725396516798649916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 13:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUdtq4uk;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so2570334f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 13:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725396515; x=1726001315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXCIA7dVlJzCxXUYDJFMLv51UuyoTQf3h0XeQQ2EdEo=;
        b=VUdtq4uk0A97BkPin0Si8GIQrIEvAB35ziSHr8tTV4Uq57H5/KqYR5wko8azxcUYyR
         qrp+J+FjwMyu3/7RCV+xnjV+LjPCf3XCfLuVe3JKyK9Ck0taYLYzytBmNugla3uzLTa5
         Y+5FV2OS9nz2dE056FmI6xjRADSqjLDaCmUMpMrtzJexAq7jp42whiRTjxhXi+mwKjac
         gAs+HfzgU2EpBq2rjgUTtE3Cr3XodMVcxukLHezxqWTOgRd2KEhtP8RzNgb5t/0rxOba
         WcTPCOFVg/Fk6YPsEC1hdLcnitW23snTE4wVReeoMEHtPzRpxfFnSv/QeUMxCoEXC7yo
         eSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725396515; x=1726001315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXCIA7dVlJzCxXUYDJFMLv51UuyoTQf3h0XeQQ2EdEo=;
        b=kP7HSbS/SwZqEafZzFjglKqU+3++ngCE20Vdi5ShHJM/Fx3sor75TaM+NcuQoDBybS
         hVFeGvYP4rr4x9gnzJFwmoDQDGbBgIYjP7Fydf/Xjt3Jqe3dn7uI1PltG8Nl1ZYhFfpa
         EO0rSh8TJWpN3WUt92Vq11NnuRLI0tmn4oGcfxyKRFxhVQCbQ6R9qpqcwGJa8ntQoS52
         rqqkVspgL0A00xUnzn37u+SIdSA5yT4ZJCkgx6QsAQvJHW8E6Dq44irckGFsVUhDv53n
         PEMki1QTDkgHKA4ZhtZpubOoHWcAU0CBEvEUDfWy+WX6ykdzd2ElBVPeNka4PAtCbyNl
         lvfg==
X-Gm-Message-State: AOJu0YxtgcDYQAYbm8qgczxz601qiKI9Nzd6bYfye0/tlcOY+Auljwf+
	TmWMhXjBzwI+sJCYJEeY1hxl08Ky64IJAKUwaF2CZYY2qi0l/KkpUtgbwg==
X-Google-Smtp-Source: AGHT+IHSzm+eC1JGFlAuxjC2v1fbubJ15k+XEftX+G4GBvTBloHIGezXjNWxKZ+tlolLAZBLMdq9vw==
X-Received: by 2002:a5d:6d05:0:b0:374:c231:a5ea with SMTP id ffacd0b85a97d-374c231ab35mr9818440f8f.5.1725396514240;
        Tue, 03 Sep 2024 13:48:34 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c8a08dafsm7614811f8f.75.2024.09.03.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 13:48:33 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/3] uboot-config: fix devtool modify with kernel-fitimage
Date: Tue,  3 Sep 2024 22:48:29 +0200
Message-ID: <20240903204831.3791997-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 20:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204176

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
 meta/classes-recipe/uboot-config.bbclass | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index e55fc38b7c7..bf21961977c 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -101,12 +101,12 @@ python () {
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
     ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
+    recipename = d.getVar("PN")
 
     if not ubootmachine and not ubootconfig:
-        PN = d.getVar("PN")
         FILE = os.path.basename(d.getVar("FILE"))
         bb.debug(1, "To build %s, see %s for instructions on \
-                 setting up your machine config" % (PN, FILE))
+                 setting up your machine config" % (recipename, FILE))
         raise bb.parse.SkipRecipe("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
 
     if ubootmachine and ubootconfig:
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
+            if 'u-boot' in recipename:
+                if len(ubootconfig) == 1:
+                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
+                else:
+                    # Disable menuconfig for multiple configs
+                    d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
 }
-- 
2.46.0


