Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DB0C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 09:21:17 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.10250.1643188875850036673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 01:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QQCaYs0z;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: rybczynska@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a8so37404620ejc.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 01:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EF40MvjBdMdcAC+NFc1dmJwuX37/AgkdwoXkrsWUmxg=;
        b=QQCaYs0zZZWsf8YJTJdy76B6ywxPSE/vIH8QGdkp+uE+u2SHIlgGFiUmKom/w0KESC
         mZX00LBD9QgYGWGRlndlVLC32OTaSGvP7Ds8jjX5rx3ts/jr/yAhay5kJCT75QrmAb9P
         xUHlekvtRHgLi4CSZKtxjWd6fnd9+QFqh9jd9k7j17V/0wWHmPECPmIVU2FtQkXcuZSN
         QME3yfLKyWjVvUSsDdGG4Z6qNXQYSp75Z5gL63yRUYGU5bsqhlG8cdx78zG9HaY5zp8N
         uC7f7lwf0h6RIkb412pZgefFtrN1q7XVqvhbDBSx3ye0o+FLQDjYxXAv2K3uRuOVB0to
         J3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EF40MvjBdMdcAC+NFc1dmJwuX37/AgkdwoXkrsWUmxg=;
        b=e77+oh9tMhUrXyM8COj1dvdWOVhf7+S5S1LnFFOh6P02JLlQsOILtuW5VtGKS+t50a
         VxUO6sttcKv3Bkh7UXSj1HcUmK8q+zouaojaz+7jl1gnXWaZJLkID4YBSNPrVxiNESrk
         r2ti8HDxV3sFQIH2f7lrSPuyKJQJLmyFj3yCLqXHLgYowBlXyEl1OLibnuNBRzs8gY51
         auo1AkohGEW+i8KlBqrs/K+OJW7vJ6L3E2eE19Uy1VLxJ6zDOi7krAa9clFquSEIOBMC
         4Q1vK2bygRx2gDfO+hzAalCQfsFDuWsRiY2z0DBAODnVu2j7jKavtJ8Mg+RqgDi+MkJz
         v2iw==
X-Gm-Message-State: AOAM530uRNWwcE2IWBxOm2IJg73d7XeXgC72q6pRX+H+E06cXIZq4JQl
	zzkmKuv9Xs2wXJBi/MgYKKmzKbLsvug=
X-Google-Smtp-Source: 
 ABdhPJyRUlshM5U86bC6oDxvKvsRmOy7D/B2Ap4OuLyxYrqtRb2gyPywmr1hHm0AKB/U/xNK75+WWQ==
X-Received: by 2002:a17:906:7705:: with SMTP id
 q5mr19099571ejm.34.1643188874223;
        Wed, 26 Jan 2022 01:21:14 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.46])
        by smtp.gmail.com with ESMTPSA id
 j2sm7165750ejc.223.2022.01.26.01.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 01:21:13 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [dunfell][OE-core][PATCH 2/2] grub: add a fix for CVE-2020-25647
Date: Wed, 26 Jan 2022 10:20:44 +0100
Message-Id: <20220126092044.2206160-2-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220126092044.2206160-1-rybczynska@gmail.com>
References: <20220126092044.2206160-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 09:21:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160964

Fix a grub issue with incorrect values from an usb device. From the official
description from NVD [1]:

  During USB device initialization, descriptors are read with very little
  bounds checking and assumes the USB device is providing sane values.
  If properly exploited, an attacker could trigger memory corruption leading
  to arbitrary code execution allowing a bypass of the Secure Boot mechanism.

This patch is a part of a bigger security collection for grub [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2020-25647
[2] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 .../grub/files/CVE-2020-25647.patch           | 119 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25647.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2020-25647.patch b/meta/recipes-bsp/grub/files/CVE-2020-25647.patch
new file mode 100644
index 0000000000..cb77fd4772
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-25647.patch
@@ -0,0 +1,119 @@
+From 128c16a682034263eb519c89bc0934eeb6fa8cfa Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Fri, 11 Dec 2020 19:19:21 +0100
+Subject: [PATCH] usb: Avoid possible out-of-bound accesses caused by malicious
+ devices
+
+The maximum number of configurations and interfaces are fixed but there is
+no out-of-bound checking to prevent a malicious USB device to report large
+values for these and cause accesses outside the arrays' memory.
+
+Fixes: CVE-2020-25647
+
+Reported-by: Joseph Tartaro <joseph.tartaro@ioactive.com>
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=128c16a682034263eb519c89bc0934eeb6fa8cfa]
+CVE: CVE-2020-25647
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/bus/usb/usb.c | 15 ++++++++++++---
+ include/grub/usb.h      | 10 +++++++---
+ 2 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/grub-core/bus/usb/usb.c b/grub-core/bus/usb/usb.c
+index 8da5e4c74..7cb3cc230 100644
+--- a/grub-core/bus/usb/usb.c
++++ b/grub-core/bus/usb/usb.c
+@@ -75,6 +75,9 @@ grub_usb_controller_iterate (grub_usb_controller_iterate_hook_t hook,
+ grub_usb_err_t
+ grub_usb_clear_halt (grub_usb_device_t dev, int endpoint)
+ {
++  if (endpoint >= GRUB_USB_MAX_TOGGLE)
++    return GRUB_USB_ERR_BADDEVICE;
++
+   dev->toggle[endpoint] = 0;
+   return grub_usb_control_msg (dev, (GRUB_USB_REQTYPE_OUT
+ 				     | GRUB_USB_REQTYPE_STANDARD
+@@ -134,10 +137,10 @@ grub_usb_device_initialize (grub_usb_device_t dev)
+     return err;
+   descdev = &dev->descdev;
+ 
+-  for (i = 0; i < 8; i++)
++  for (i = 0; i < GRUB_USB_MAX_CONF; i++)
+     dev->config[i].descconf = NULL;
+ 
+-  if (descdev->configcnt == 0)
++  if (descdev->configcnt == 0 || descdev->configcnt > GRUB_USB_MAX_CONF)
+     {
+       err = GRUB_USB_ERR_BADDEVICE;
+       goto fail;
+@@ -172,6 +175,12 @@ grub_usb_device_initialize (grub_usb_device_t dev)
+       /* Skip the configuration descriptor.  */
+       pos = dev->config[i].descconf->length;
+ 
++      if (dev->config[i].descconf->numif > GRUB_USB_MAX_IF)
++        {
++          err = GRUB_USB_ERR_BADDEVICE;
++          goto fail;
++        }
++
+       /* Read all interfaces.  */
+       for (currif = 0; currif < dev->config[i].descconf->numif; currif++)
+ 	{
+@@ -217,7 +226,7 @@ grub_usb_device_initialize (grub_usb_device_t dev)
+ 
+  fail:
+ 
+-  for (i = 0; i < 8; i++)
++  for (i = 0; i < GRUB_USB_MAX_CONF; i++)
+     grub_free (dev->config[i].descconf);
+ 
+   return err;
+diff --git a/include/grub/usb.h b/include/grub/usb.h
+index 512ae1dd0..6475c552f 100644
+--- a/include/grub/usb.h
++++ b/include/grub/usb.h
+@@ -23,6 +23,10 @@
+ #include <grub/usbdesc.h>
+ #include <grub/usbtrans.h>
+ 
++#define GRUB_USB_MAX_CONF    8
++#define GRUB_USB_MAX_IF      32
++#define GRUB_USB_MAX_TOGGLE  256
++
+ typedef struct grub_usb_device *grub_usb_device_t;
+ typedef struct grub_usb_controller *grub_usb_controller_t;
+ typedef struct grub_usb_controller_dev *grub_usb_controller_dev_t;
+@@ -167,7 +171,7 @@ struct grub_usb_configuration
+   struct grub_usb_desc_config *descconf;
+ 
+   /* Interfaces associated to this configuration.  */
+-  struct grub_usb_interface interf[32];
++  struct grub_usb_interface interf[GRUB_USB_MAX_IF];
+ };
+ 
+ struct grub_usb_hub_port
+@@ -191,7 +195,7 @@ struct grub_usb_device
+   struct grub_usb_controller controller;
+ 
+   /* Device configurations (after opening the device).  */
+-  struct grub_usb_configuration config[8];
++  struct grub_usb_configuration config[GRUB_USB_MAX_CONF];
+ 
+   /* Device address.  */
+   int addr;
+@@ -203,7 +207,7 @@ struct grub_usb_device
+   int initialized;
+ 
+   /* Data toggle values (used for bulk transfers only).  */
+-  int toggle[256];
++  int toggle[GRUB_USB_MAX_TOGGLE];
+ 
+   /* Used by libusb wrapper.  Schedulded for removal. */
+   void *data;
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 6a17940afb..9b20e1c09b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -46,6 +46,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2020-27779_6.patch \
            file://CVE-2020-27779_7.patch \
            file://CVE-2020-25632.patch \
+           file://CVE-2020-25647.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


