Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4751C44526
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2626.1784364804724703418
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x1yH3NvY;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f6edffd06so93208f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364802; x=1784969602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0BgPU1f9tOybp45+vnOAxXVtDbebQAco8nU2Z+jzos0=;
        b=x1yH3NvYuuF7xkXNx7fnwgpBM1T9Mtw/30YFu0JGLIOiau6lVDd6OaWTNMxZkX4imu
         fNCATQpTb6jOd/C8bBHGRuEYKr+GAqb+eYzyDA7gcCH386sIw2Nwk6rQAY7QJVh5ZOu3
         m6u6KyX9S2WZOm+JTV97KINSJrbs6dJYWgQdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364802; x=1784969602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0BgPU1f9tOybp45+vnOAxXVtDbebQAco8nU2Z+jzos0=;
        b=m2WgOYng0XuT0Ed/RWqU22QtMatJF/fdgeAK4abAXPnJoCH0in/kDkrSBWo6ny76he
         0CimQq4KNNn/qFNAt4Ep5biyqK4zBlbEMPtUHMlZ3KMA7eKNFTnD6kq6i5PG8/NFaZ7O
         /0YIj/HFF28SAdH2XsZk7qEHPtSOVQP5i7sP9P8Xfqn7+mxPRnBzK9bgA1Pi/j6eJne+
         9WHaWvurzZEA6JWbYOw+tMdP7bC4RI0gCWzrhg/TDdapaPrLpVSbX+oZnExPrJaYq3Mq
         VeRuRRbOMETbSGLsuSHvxzwnkrveEu7rU/+eRB5kuS34ZY9LDbhFr+fd7/uzV5/Q4+RJ
         caPA==
X-Gm-Message-State: AOJu0Yy2QhZB1Ekl6CEUSeaX3HyA5kgix7DSq4g5IXXDGcLm2R5R3GpG
	ALcgMinx1DGnxEU4o3fJoo8yrJveF+HXFun6E54jdEv9Rg231Ukglj5mZFJoYEegEZOWRsBt13y
	mlEvs6vc=
X-Gm-Gg: AfdE7cnVMstlLV0mm555GfAA8as8H5i49YYtr9HhLIgFyf+DfPRMd+0lRNe6s9E4RtD
	0tSfNJr6Zdy1Nsa+vKXWJo3maNeBn1nKL4eI7xM2kvBfdDJx3l/e1o5FliLED4wazoqWyCyqaLm
	UNcXEy5xRk/oczcm5R2kkmVC7gfzqHlFggodVPncfXzQ90e9Q2RnPqZJ+UXc2p7xK8h5ZRVTYzZ
	3zSP9RU1hEMkI/xZJ2hs3qW7fYx+gwB7hWj5Nii+xc/I3yz476DBd3HDAqLsDLkTMKKSi9jWFOj
	0ywEKxue7Kyw4FLdTKtcxfjURoc8QY/UNvJWOaOjOjKT2iA6z/aehAGoQ1IJgIwKDr+Z7/MW5m4
	/uHQyoFtf/VnCn32UTS31d2cKYtq6LjVMrixErWec2ns9mCmXc0WBo1Gxr3Du1HCRVm5q1r1QXX
	9wfx9lST9XCCsg23UOleyO0yjygs06/KzPZbXpCOQ/ab4YYLPz6A8M/8Juvi6TqNqsPyY3uARmN
	MODrNY=
X-Received: by 2002:a05:600c:4c2a:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-4954a51fc5fmr50498605e9.36.1784364802419;
        Sat, 18 Jul 2026 01:53:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/17] kernel-fit-image: Add KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
Date: Sat, 18 Jul 2026 10:52:44 +0200
Message-ID: <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241242

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
index 448a88ccb11..cfe43a5a306 100644
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

