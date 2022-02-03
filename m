Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265E3C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:12 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.2839.1643917870943633188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZHP7hZCs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id h23so3127220pgk.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bfJGUstaah8rXcXBMTvnSd+za9eta5uZfW8LioNAy54=;
        b=ZHP7hZCsmFLEtJclkBMMOvM3fXWJy6l+5MphSDDRujdNigMogxA25+YVRuKMNrhZNZ
         epPIdo6PjFOeq7Vv3VyvTPx24PKe4RrHxqFwb0nx1f5E3UlI7gxnFam5AfCIHqwOluuY
         T1IUFmWcaa2pM1cR26cDo7HUELVmy0ZC8gcEt1AYzobv7gMhfh91KEI3aIDNOWoHVI6i
         Cs+mhYeHn1Xzc7gfX3T/Fc02cb6Y+pbnUjSQSpG2pd2R57mQ084Lyw7Bse6uH4FjhHLh
         GIFQsFgWLAIc3ZN69R9KkXsA6+ccQYh26ez/Gao3wp+mnkuDAAACA1Csl85QgTHAifUx
         RtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bfJGUstaah8rXcXBMTvnSd+za9eta5uZfW8LioNAy54=;
        b=M/yGt5jRVggpTLCClbaxySGUm5D1YESOE8gzeJZ0qJvvnvhjFTg6Lmp9YqmLplcqxQ
         RiX400Gy18gRZxPIlllhZNmAQ82/LukdNr3zHOHhKCn9kyzqFzcCKyh4MawRlOryVAZq
         KHFr6alPM1NQfVzYMRTaEbSJYPHlBb4QhDqpOAoxVL1b/PkGnQzT5jaksIikKMo+Q83x
         q9gWD8OsajEPd2Ksq83kWrdxpKwt6TUqvkLeyvN3mMkTic+X7JEonR76oVIlWKARZ9q1
         GmileGKRs0NS3+ZlY0tlYlywZ56kQ86/xmT3r3vzYlHhstr8zz/iCSUPmeXtL0PxWeoy
         E43A==
X-Gm-Message-State: AOAM533Iz1Auk9XOr3Gq2aWH/cTXnHcLbl3VMzdMf4BfzmBKIcMnWfrd
	lgjdA9uYHvjgWFRLxxUJA7TVRBBPt0vWl8hJ
X-Google-Smtp-Source: 
 ABdhPJxHOdvtRDersW4Zj/RC48QHQlFZ7cDMF4ST6SmIDwBDG1M+Nn0M1W/Azy99iUZOIyKkWI/s8g==
X-Received: by 2002:a63:af08:: with SMTP id w8mr29887065pge.1.1643917869842;
        Thu, 03 Feb 2022 11:51:09 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/20] grub: add a fix for CVE-2020-25647
Date: Thu,  3 Feb 2022 09:50:28 -1000
Message-Id: 
 <de2ebd49331ae22f6cc92bb9cb0376a34bf58cb9.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161299

From: Marta Rybczynska <rybczynska@gmail.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


