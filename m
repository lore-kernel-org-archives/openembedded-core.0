Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A7BC61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 20:50:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32362.1787691005108999087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 13:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VH6e0kSH;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so1462855e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787691003; x=1788295803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQe+XyYeIqynn3tmbu4xipYLPKPeG9Nn9qDbJtasgM0=;
        b=VH6e0kSHj5cuFJz59kX75SJ9WGoi4rP5rnY+pSrooeIohpb8jeTCMBE1RhuzLyPV3k
         rxPGfjzy6DG8csLyLY0cfqyTkjunp3FwLXiSZRKX2dres8o5jXGDN+MXCl9Qf4sL9UJg
         wavk3C7dpnP3wcaB+domcoEphAuKf5hdwYGpWvyW8GTgLzq4Es85hy/iqvIJiA6YXDIT
         FbAhwvuyfTPLLxAxCLSMD676DwurIAUGxiRyNcpjRciwHTpolUg2ZPmxK4yWcVJtuyJY
         r2wxo5iGamgFmTpglyWCdRSJ5EI7JSnl/RqKA+Ujfas2W+1GlAxfB6vRTR4QheXZaIkR
         FY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691003; x=1788295803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vQe+XyYeIqynn3tmbu4xipYLPKPeG9Nn9qDbJtasgM0=;
        b=Do9VwBXMwGY113QVbFUdFfcVEbNt0K0L0hRatPu3nxL/ExyYNH1g/KKpSyaRYzuOgU
         G83G0bLZS4wW0l697B/h1R0uZR43uAop1SCRrt73qLDWniGCmwEjKhXvcLSHIWZ3bDF8
         OnfBYdd7ekc6OIMhlOmdIPQb0IjYYzzn+FOX98qjz/Lh3CFFxyDOUkqhFwVXB2hJwHOv
         Py1HkR8Sk0odu+0wzVRy0IeRTqxLDjum8xDy31iR0R+lXvnTs54K0638iP4KmZJi7NUg
         F9HNWiQGydNCzn76xSzPDVIR3HMSQdzt4jsMH2Nno74IKnVlqFx7SWyc1nKldeZJXish
         VV1w==
X-Gm-Message-State: AFuF++mMFfpQ+P7quehY8/H+JIJcKDY30QEP5czLwFbHnzKySWvX34bf
	SfIrTSMKRK3N9ny6o/QGp7G5Sn7qYUlZ3BgD6bPdUnR3b1J1pPDy3Txmxqkk6pe4dhQ=
X-Gm-Gg: AR+sD12ncqRgwLP7uyHVp2codCtEOoYoM9zlEkmieujmRUPQtjl0wSn9Q7CJYl6RspH
	TLd+pcZQDtyWzMK1uazDt/Dpk4s8espzrJKKnQwNqU4pJHBzUPz6yoeTIk7dJPuclPa/XLuyNUd
	GD/v0XdOaE3yynDtABXELWYwnukk1HpYsmXo2EklZaUeremvMWFnU1CHB5oXj/tJPVSik5bgNCQ
	H2foOSUDs2w16pm9I04NcU3mG5AEBTB5O/1cvcMlymWfTnW8Jn1lJtd78Hz4hT2hJuOxZ0lmFIp
	aq1dRnH/ypcakRpX8Vf/Fi8EVgEh2IcB/6QLr3e2ZkO2HocAqq3mbIhsxcMyoxJ9iv3Mk8t7Ifl
	SfyXstIqFJLCDqEO5HGgvmLn/nOOn5bCye8n4qlxTbnsyE6eMqIsKUiJ8O9ODq5FITMkHqD1z8Y
	s2gErenrIK5Y2IVFWl+dhjzWZkBODsPvpB0OLlHOftdIcgcCpzL1ncX3pvueijW/F38vuKjx5iS
	gV8o6OcdsjEodMPEa7HSlhQd7H603qYiXbPO15tw7yOJ4XiMIZ+liw+iX3b3MBWDXofowWTSYcE
	JII9IGdifdGM
X-Received: by 2002:a05:600c:3b13:b0:499:a760:722f with SMTP id 5b1f17b1804b1-499dc72515fmr13713355e9.13.1787691003277;
        Tue, 25 Aug 2026 13:50:03 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca98095sm4507845e9.5.2026.08.25.13.50.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 13:50:02 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v5 1/5] kernel-module-split.bbclass: add get_ext_mod function for module signing
Date: Tue, 25 Aug 2026 22:49:26 +0200
Message-ID: <20260825204931.17628-2-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260825204931.17628-1-anis.bougrine10@gmail.com>
References: <20260825204931.17628-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244275

Fixes [YOCTO #12927]

Out-of-tree module Makefiles invoke the kernel Makefile by appending
the M= (the module directory) variable to the MAKEFLAGS.
However, they usually do not provide a modules_sign target. Therefore,
the kernel modules_sign target has to be invoked manually after retrieving
M= variable from package source code Makefile.

This function retrieves the M= variable from an external module Makefile.

Reported-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
 .../kernel-module-split.bbclass               | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index ab2f0d1c37..bde7cd02dd 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -42,6 +42,27 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
 KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
 KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
+def get_ext_mod(d):
+    """
+    Extract the resolved Kbuild M= variable from an out of tree module Makefile variable database.
+    """
+    import re
+    import bb.process
+
+    try:
+        output = bb.process.run(
+            "make -C %s --dry-run --print-data-base" % d.getVar("B")
+        )[0]
+    except bb.process.ExecutionError:
+        return d.getVar("S")
+
+    for line in output.splitlines():
+        m = re.match(r'^M\s*=\s*(.*)$', line)
+        if m:
+            return m.group(1).strip()
+
+    return d.getVar("S")
+
 python split_kernel_module_packages () {
     import re
 
-- 
2.50.1 (Apple Git-155)


