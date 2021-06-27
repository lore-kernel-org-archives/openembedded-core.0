Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.3987.1624833129551900627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 15:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XMaNY6ef;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id w17so7112608edd.10
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 15:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SZ1CXqFBzAXJo9BzLsaQBBiYEwjZwxK8EgCmhfIGPok=;
        b=XMaNY6efJCYzeOhTuxsERlqzdM9ws5q0c4hvxzvu1lMcxZbMrgShiXzEflB/VPjNv3
         G3msK+NRl35IccXFSggngxhSMcl5HJtJfWKsPu6Mm6ys3p3y0ZV9xzmnC20eMppuC8nB
         I0fS9h4GUG4al8g94MwzEQJjPzI4Ur5Vug2bJVqKritgQN4S1kCUaJcBtUnuool/JKRL
         V2uXN4t4SrIrO/JcKtXtqs0JMOVBGeAuqSwfDdj/QrAbjUwRBr1mCOy1OMLJ7tq0xtHm
         d+wZAx3ZIBlu/Ebq5RdGdngfU8IxiXf8EMcqZ8lm3X2D85wp1v7ghKCFFLxH/Udl6yKU
         unGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SZ1CXqFBzAXJo9BzLsaQBBiYEwjZwxK8EgCmhfIGPok=;
        b=XUQvS/lHoUwmkl4wvmgeMxzrfgSdsFVYmEow0Ef1V9q6GYeAyuzKg8UShM2LzZMYZ/
         Yb6/gTCvUHlDpqG2RxzWSo1m+L1tFScRGXVswtxkBG2BKfwercGyrXxNshmOP9VR/naA
         MTKtXPKxz1hH0QIv/EIQ+Sf4pMU51UiK0f9lH9kRtaJaPmO+QK3KazMu3XAiRVeWe/Nl
         sWasXzJEY0LG9Owyu+PjCseUHNyHRVmkotJXWInFae+KO39eFA23/EJrA7iNfkEsSXte
         cU4vh60m0oazqMs8/IekG32+V0g6e4f5sU9BLoJds3Z37QRQDjxwyVD9XBRAZGeU36RG
         oRpQ==
X-Gm-Message-State: AOAM532ws3E1EzdinWtoNMaxXNySE+0kNh4LmdRDuI54jk6Avx+JiE1N
	T4QS4dmnxosQHGl8fBLddaymY1C53pzy5cqO
X-Google-Smtp-Source: ABdhPJyeOJYJmr2xAsF2Y4WOJtX+QMu1Fp1pG0g740RysFQEw2AXUOg0dqfuFUJMyEw0IjfNdv9CJQ==
X-Received: by 2002:a05:6402:51:: with SMTP id f17mr28519117edu.359.1624833128197;
        Sun, 27 Jun 2021 15:32:08 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.googlemail.com with ESMTPSA id du7sm8258432edb.1.2021.06.27.15.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 15:32:08 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][gatesgarth][PATCH 2/2] kernel-devicetree: Fix interaction when packaging disabled
Date: Mon, 28 Jun 2021 00:32:06 +0200
Message-Id: <20210627223206.11267-2-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210627223206.11267-1-andrea.adami@gmail.com>
References: <20210627223206.11267-1-andrea.adami@gmail.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Backport of commit d6b114c from master.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-devicetree.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 81dda8003f..3c5def1041 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -1,8 +1,11 @@
 # Support for device tree generation
-PACKAGES_append = " \
-    ${KERNEL_PACKAGE_NAME}-devicetree \
-    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
-"
+python () {
+    if not bb.data.inherits_class('nopackages', d):
+        d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
+        if d.getVar('KERNEL_DEVICETREE_BUNDLE') == '1':
+            d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
+}
+
 FILES_${KERNEL_PACKAGE_NAME}-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
 FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
-- 
2.17.1

