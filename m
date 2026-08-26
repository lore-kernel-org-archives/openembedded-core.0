Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9A7C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:23:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7738.1787732614431165489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sG0ifiDL;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4998e0916faso2698065e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732612; x=1788337412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQe+XyYeIqynn3tmbu4xipYLPKPeG9Nn9qDbJtasgM0=;
        b=sG0ifiDLsm5glQEag27G8P+3xNf7esb1qoKIgwmUFxSBxhFl5XB5NXmGCsP1c+LweJ
         nDiFdTQ40oxYZizP0Rs6Ip9WjONgk3AuRwYSfcRK2hrHnNKgE373thAPHRCgLAT8Uqd/
         Ki5wj3YbjKYLx5zT0jfu9s2yPPZAm+1FheUi1flBg3L5QZ1VnG8pP5+pbWn0onE3QRdu
         WbWyZD/RIIufZ487g6LCbekpRtdfwJ47g1jbU3WRAC9Y9Qt5SZkJuP4PQeiSAgcNpfGk
         19/X3XQKqVhIJOuWRF783q2Hmy50S2ncBaz5LZ3enthNL8yvv775iJXdOIDBUMkLkOhI
         eXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732612; x=1788337412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vQe+XyYeIqynn3tmbu4xipYLPKPeG9Nn9qDbJtasgM0=;
        b=LY+AGvK4eBmlgpsuvwas7xR1UW7/pQoYqny0CbHvj+9An64PuUWVkwYqnmqDTaygAf
         /0zrVrr1k3F37W/EfyfWhRsZBH/m395WvfkTYk706cy5EcWLVYqPkAwctLMHe1fuWEaz
         PynZGDLYAWrpHGh3+yIX4Y/DPNqNkLm7////edRbd2OpMoKTcGavZhJ6HGNbFL+Xex07
         eQRWxW8zY/0SFK6PYD/2GF3nFq7JewJeuK7vt0gF7RAVUemUdfInJUQ9aWhtEjArnEIy
         YxTF/SXBLh9BlN4kmJo8Nqb/A0JhI0LLU5apI9JHfWMA1jZx/hsx1dFlibDbRwQCfeF8
         d3aA==
X-Gm-Message-State: AFuF++mK1begESiNTMBODOhVlrnAEbR2xaY/OZm/pGAW2j/RrhsjvOSO
	ppunCV+aJExIbIz+DX5xuHmYoZizvT/B7yZILYl6xawT5g59+9GKavEhU3RYGLskj0Q=
X-Gm-Gg: AR+sD10Gw+ogzzxFc/ALSja6sB6MaaYV02pM713rSIv7E1IKlv3oUPxJuBTonEnGrea
	OUxIz7WCsUh6akt2jdgor0Rg9qIMzISkQ4eS52UvCTYm8LtF5dSpTnb6NiarJI4Hip50AvkIcgt
	U/ryGNqXbuw7M2MBmNCkN6eWY5Z+q3cV14Vu1MVIjUOKlnHzyuSnEKX+iPbrns+AtNh/lOJ+HXk
	AMaMV1cNvjQdzi7wuC+P3EQ24xoqyjgvN++8Sy7sts4VOsuhkSRWJdEPeFoyayEV9fWRzHZ4TBq
	u6hFK9gonENtJ3d5T1YJBinKO3ckQ+8vx0G4Z5uPstQ0RMvab24damOsK9DhfDrIRRqNPhW4QC3
	JsD4EHm2ON0jYTdx8Lol+4xRR5TvCGfAHBrhr6oMI500AK9kF69hF57kSU/ZexfB/6QSteFjIfc
	fnT4NFdlbZtj2xLKCiLpa5OYRGJLFvgqUbIMboy/dlXZYYAutnog7vzv3WmDrLWthPpaCpILwAk
	hthW1VaBhciMc0wnsZMKCW5n1/fKjNFNQvfhnjVU5QYF3R/+NCHiaclxIPxv8IyqkbJ2guR6w/b
	1l4IdozoUMg=
X-Received: by 2002:a05:600c:3b13:b0:499:a760:722f with SMTP id 5b1f17b1804b1-499dc72515fmr39681425e9.13.1787732612222;
        Wed, 26 Aug 2026 01:23:32 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8b84esm17933655e9.1.2026.08.26.01.23.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 01:23:32 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	antonin.godard@bootlin.com,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v6 1/5] kernel-module-split.bbclass: add get_ext_mod function for module signing
Date: Wed, 26 Aug 2026 10:23:17 +0200
Message-ID: <20260826082321.22104-2-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826082321.22104-1-anis.bougrine10@gmail.com>
References: <20260826082321.22104-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244360

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


