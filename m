Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBD0C4452B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2520.1784364803708720577
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YlMeG5ZF;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49553515a8bso1946955e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364802; x=1784969602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qRLgL9tEJxiXNtnPrlQHGB/PD4DyhOT4KkzFLe+ZsR8=;
        b=YlMeG5ZFoHDk35wJt7HNwMpJQSsY4mmXr1CusbQr8+VuvlCsKDb9QvGLU+PaV6oDes
         9m4abIuh3PdknBsftRzN4OkzbATlqRvNE08KKkChE7pxd2hYRT6iDzruA2ASRnt7jLt8
         agzXyD4fpUEKkucNUbjOMpBoXs4DHJ3XGkA4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364802; x=1784969602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qRLgL9tEJxiXNtnPrlQHGB/PD4DyhOT4KkzFLe+ZsR8=;
        b=jv8xXRYiVz3Ou156ewG1dj8mFUJm4ciSWuzK6JXiolM0cl/7OaksAHyt8ZPx9NNc7P
         j7sWrv0KwkLUrEhT0EQO1RAmWi3hUVUOFVmwnYDrnGQTkH2Ao2lAnd2ep6ihpHSqWpvA
         xV5Lru7w1OwJoJHoj8gte3aZ2e4aQpgTUwVwJ2P9cg84u2Zwh7uLA7t+wDSafHWSl9yP
         EOccJOJDUv/wKbicMGYsS+pNDUlMRvKJH3uvG0deG2FVhBJFF9uwxVUL+p7qgwU/pol3
         YhtPkF1LUQtzYBDcCyrcjZf+2IPy82trXguoJBurYAcBzOfZWp0ESPLHabXGndGo9kXe
         gHwQ==
X-Gm-Message-State: AOJu0YzKXOZkf1zSLIfo1kRtT9vxibG88b582xsMQBwZYHvDyG3GK4HG
	dUtHoliFbjtU8jzPb0k3qe7fQikLem1NhS5BgFQbCbALbxf0I/BjabJoLGEnEPaYSU/UMwGNy4B
	8oBWTmng=
X-Gm-Gg: AfdE7ckJO7gJYW2JZ6KBeCzzvBeEneaX1wgn4tY5h+pCPG28+v1gI8uF4Wue4mWhIoz
	RNBjmc0zcOZDkPbSwjv+Nl3NN4r4SFdEvHe1ZQyhqrm7k19NttGIpNfTnq0QEMY6X4HmRmtA7NO
	Sfbs8fr4jPmBcLSyearFpYRM0gPOC/DMR1Rwl4u6qMSv3d8YdqDTdMqeSYWwYyFyXkcJ8uW7YT1
	2/Lq8bPQT8WYECFO6br+vNcDxhZ9SzyosdpCA1eSYfYwdBO6c2OgHaZ30nMsgmFBZ49Vrt+43pw
	yT+VmGkCuqtiIeomlRr+Q/8zGxGr4OqR/GPFflO4n46BAPv8pwDZfStO45lonUa4020aC2F12so
	TSApjb+muSswDNxn2AX95gvUIYokeio35WDMZbim7feLcCLs7gUvbNITuBD4qHIKYyn9g0YZuDI
	kAHPftMnXVVO0vbzTBVccbJHgI1ZzC+BaJJosxPFzbt+2yYREPPVV+wCcYt7YsaA98AKc/jMaDx
	0MKa69wzZMLg4wkK42BV/gevkQx
X-Received: by 2002:a05:600c:19cc:b0:493:b877:fbc with SMTP id 5b1f17b1804b1-4954a402fcdmr71971275e9.21.1784364801927;
        Sat, 18 Jul 2026 01:53:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/17] kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"
Date: Sat, 18 Jul 2026 10:52:43 +0200
Message-ID: <91bfdb4f96ef17defe00f914885b3d9f9f1b654f.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241241

From: Marek Vasut <marek.vasut@mailbox.org>

In the case KERNEL_DTBVENDORED = "1" , the fitImage configuration
subnode names used to contain the vendor prefix in OE 5.0 , e.g.:
"
$ mkimage  -l fitImage
...
 Configuration 0 (conf-freescale_imx8mn-board.dtb)
                       ^^^^^^^^^^
...
"

With OE 6.0 this is no longer the case and KERNEL_DTBVENDORED = "1"
and KERNEL_DTBVENDORED = "0" behave exactly the same way:
"
$ mkimage  -l fitImage
...
 Configuration 0 (conf-imx8mn-board.dtb)
...
"

Users depend on the correct configuration subnode names as those
are used in the U-Boot "bootm" command when booting fitImages.

Fix this by converting each entry in the KERNEL_DEVICETREE list
into the configuration subnode name by replacing all of its path
separators with underscores.

Fixes: 05d0c7342d76 ("kernel-fit-image.bbclass: add a new FIT image implementation")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4297b94c3728cd2e320d75b68c508e12ab127719)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index ae8f3c66883..448a88ccb11 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -94,6 +94,13 @@ python do_compile() {
         for dtb in kernel_devicetree.split():
             # In deploy_dir the DTBs are without sub-directories also with KERNEL_DTBVENDORED = "1"
             dtb_name = os.path.basename(dtb)
+            # With vendored DTs, use the DT name as listed in KERNEL_DEVICETREE
+            # and replace any path separators with underscores, this behaves the
+            # same way as KERNEL_DTBVENDORED = "1" did in OE 5.0 and older.
+            if d.getVar('KERNEL_DTBVENDORED') != "1":
+                conf_name = dtb_name
+            else:
+                conf_name = dtb.replace('/', '_')
 
             # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETREE directory
             if external_kernel_devicetree:
@@ -103,7 +110,7 @@ python do_compile() {
 
             # Copy the dtb or dtbo file into the FIT image assembly directory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
-            root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
+            root_node.fitimage_emit_section_dtb(conf_name, dtb_name,
                 d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
 
     if external_kernel_devicetree:

