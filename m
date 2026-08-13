Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714BBC5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:44 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21797.1786634558038614723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r8cuZPcT;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-472326ca506so1445161f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634556; x=1787239356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JKnPzLmNbYYd3vk9YlZgalVqAFQ2rrMccLfAYMxrjdg=;
        b=r8cuZPcTBjqJXw9AffLW92abyhkUlwjvKZZAxUgO6g504N++1+N+kCYva1qp1RGp/H
         aO2WGaFj60w2sKzm+w8FI9i+acfjyWO35+k5bJe9zA9bGYvxZQy+6ly7vX0/pL/xK71B
         cdDCR/adi2Y2u9ShzUfwsR0l9EX91nYsGLq60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634556; x=1787239356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JKnPzLmNbYYd3vk9YlZgalVqAFQ2rrMccLfAYMxrjdg=;
        b=ArXy7Mc/rnBcIcHTI8/EONOAQDTDTFsIsBz/HdNMl6NrGAZqXUZ2745ZgzwCivrA5Y
         6Td33BAgJvdt+ML+1VwaFyygmCO5XK0Pmw0YyY/HV9yQFhu8mKOffsQ+6s2OzIwkcUNn
         elKGcG33gg8Wenf/P25PLiyUxO2PfFbmbp1rINDFy2t6yu4ucI92PUxsypkZlzFB6yNB
         zGkik4rLJHRnUGaanmOTVVzZ0n3d/Cn/cKyTB3PIcdc/o1xbNGDIwEWdiyOKN1jPFI01
         LWyDwA/I2K/r8zszF4zlw93rop8GYanqVvKprO/rMb5pmnMuedONfbzlmZGSKU8Jbos/
         OQXA==
X-Gm-Message-State: AOJu0YxjBXekdjEHnGSj9rHoL5OaF1RKt38HKFVQWgKCIl959lmpvcRP
	+qQ0WFyZuOI+UKI5zfe8dxZgNEzKJ94qKBlM9GWa5Z+3+2qx4P8xbIPOdqSoMGuRNLmZ3664o8x
	AdwZYdCLQYg==
X-Gm-Gg: AR+sD11pXFJN5+sflVIibJmA7DPTBxA1wPiOBxD+YpSC2iZ8xcd0jKcHGzCDvra4X1M
	OuyMUOKu+/d4kT1xvkCaGkiGr2Gkp/KJiookqVXZTOpUHRguCppGWVZRWO/uc+Eivdmuqaqxie0
	arOnZ9JLGslf7APxylzzC8IoJUfQjHII6Nba0LfT/LQtRkuXgytuWx5JehMSqhyOe6PL7pCzRFi
	EWqyaNH4aVvCVtYe4SJsPxOt5V8g28D9RKbVAjEetnuIEfL/vYAPLdQgDjzrgZx5rFivYSGXdCr
	BPywtlPBqe0stQ7tj3bIL+rSIoVZmQTahV/ZPRNTFgzWul7pa0Uf9sizDIuity4M3uW9VSfU00h
	EsWWb0tzEimYAX+9hvxhPfgOaqihVvrkRqDfYQA2GBkQtpdsN+O/E3lvzy4IvcBQiCQCTnBNqhy
	zHnIPVAF4HQ7CEGVIWXWLNX1FvMnwFtLnBijhIQijogAq/spP4NCwkzPTR87id36qsuziZrIEVZ
	Y0uDAyNo0h6EYCbRt9qPFax39400cf2+wXZFaxVp4FaEckLNnJEze1NF4UnNJBqCZDkBUmk/+qq
	Xn/nRNS1nuStWOk+IfilFkUDDL9ssyeMyyjb50jTW7NrLZxT3JY=
X-Received: by 2002:a05:6000:29cf:b0:47f:e760:e5b9 with SMTP id ffacd0b85a97d-48159ee4b01mr7399904f8f.18.1786634556117;
        Thu, 13 Aug 2026 08:22:36 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:35 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/17] kernel-fit-image: Add KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
Date: Thu, 13 Aug 2026 17:22:06 +0200
Message-ID: <538dc59ec4ca7a698af170f7dd1fd6b87656fe03.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243373

From: Ryan Eatmon <reatmon@ti.com>

When specifying a FIT_CONF_DEFAULT_DTB for a machine, you have to
exactly align the name with what will be in the fitImage file or you
will get a build error.  If you also turn on KERNEL_DTBVENDORED then you
must also specify the vendor directory as part of the dtb name that you
want for the default, but you must manually do the same mapping that the
kernel-fit-image class is doing when it generates the fit-image.its file.

This patch just adds the same logic to figure out the value for the
requested default dtb and eliminate the need to understand the internal
mapping of the class.  It should make specifying the value more
intuitive.  The same value that you put in the KERNEL_DEVICETREE can be
used in the FIT_CONF_DEFAULT_DTB and the new code will correctly honor
the KERNEL_DTBVENDORED setting.

Before:

  KERNEL_DEVICETREE = "
    ti/k3-am62p5-sk.dtb \
    ... \
  "
  FIT_CONF_DEFAULT_DTB = "ti_k3-am62p5-sk.dtb"

After:

  KERNEL_DEVICETREE = "
    ti/k3-am62p5-sk.dtb \
    ... \
  "
  FIT_CONF_DEFAULT_DTB = "ti/k3-am62p5-sk.dtb"

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3bceb2dabeee13c0a80ddd74ea7ae991606d6772)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 21 +++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 448a88ccb1..cfe43a5a30 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -55,6 +55,13 @@ FIT_KERNEL_SIGN_ENABLE ?= "${UBOOT_SIGN_ENABLE}"
 FIT_KERNEL_SIGN_KEYNAME ?= "${UBOOT_SIGN_KEYNAME}"
 FIT_KERNEL_SIGN_KEYDIR ?= "${UBOOT_SIGN_KEYDIR}"
 
+def apply_dtbvendored(d,dtb):
+    if d.getVar('KERNEL_DTBVENDORED') != "1":
+        mapped_name = os.path.basename(dtb)
+    else:
+        mapped_name = dtb.replace('/', '_')
+    return mapped_name
+
 python do_compile() {
     import shutil
     import oe.fitimage
@@ -97,10 +104,7 @@ python do_compile() {
             # With vendored DTs, use the DT name as listed in KERNEL_DEVICETREE
             # and replace any path separators with underscores, this behaves the
             # same way as KERNEL_DTBVENDORED = "1" did in OE 5.0 and older.
-            if d.getVar('KERNEL_DTBVENDORED') != "1":
-                conf_name = dtb_name
-            else:
-                conf_name = dtb.replace('/', '_')
+            conf_name = apply_dtbvendored(d, dtb)
 
             # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETREE directory
             if external_kernel_devicetree:
@@ -195,8 +199,15 @@ python do_compile() {
                                                  loadable_loadaddress,
                                                  loadable_entrypoint)
 
+    # Figure out if we have a default dtb and if we need to honor the
+    # KERNEL_DTBVENDORED variable to tweak the name to match what will be
+    # in the fitImage.
+    default_dtb = d.getVar("FIT_CONF_DEFAULT_DTB")
+    if default_dtb:
+        default_dtb = apply_dtbvendored(d, default_dtb)
+
     # Generate the configuration section
-    root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB"), d.getVar("FIT_CONF_MAPPINGS"))
+    root_node.fitimage_emit_section_config(default_dtb, d.getVar("FIT_CONF_MAPPINGS"))
 
     # Write the its file
     root_node.write_its_file(itsfile)

