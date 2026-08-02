Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A52C55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21333.1785666544360618050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N7HcpfkO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so5836435e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666542; x=1786271342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zEYQ8jFeAM7ja+Z+jwW70nX4VmsbeT+wVpdNupbxLY0=;
        b=N7HcpfkOxqrbMtHPfDsUX25RlrVzJAswEDgzUdTq1cJUPfVj3V/lVeYxhTxIwEcJiP
         JJFKWEKQe6619edIt3HZGuqTPh2m/x5CY9t6WNCgFgIz6LchKqDsjzRw3Ip4xfi7Y244
         kekt+02/P4dWV1JHtiIfm9e/ItlmNKV79Ac8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666542; x=1786271342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zEYQ8jFeAM7ja+Z+jwW70nX4VmsbeT+wVpdNupbxLY0=;
        b=OW7M8zdoS4zwQt1BlZnrn055lgZtEYpXpsZrHJ5yldU+wtcTXZKbVOTEg9DdhlAH4Q
         N/ByZFpN/cX3sIy94D/yrKH1eawRvHHwJlwYdfA5SDcy7bk9yy6pl8gfhLCNWBMtbtY0
         OOjNCuLNxfnRko6KzhFBSuR5N0xwbxMaXakRTlaTcN/7eZD6FTVptNozE3otXjJN1h9t
         fOHmKYBKImbP28n8T3n655TrPKUSOm56iI3Bv5KaOYYUF+2IzMC9Gj9rSrpGACgxqrCh
         Nzy1/R18h+CEyTo3bRoCOqDew/JK6HuvJlbOxYz+5stThKrBNXwAlOb9c9ypM2Lz9OB2
         MYTg==
X-Gm-Message-State: AOJu0YxgbqPXXnE5/xHfv0pd7v8JWXoZ8qAg6+6IJJFBBBEke1kaJVXD
	YlmhRVgLk31z5dkTsyZSbcOpVaST4ONrWp7NuADOlHgQ9uduIQ6KfPb8T2VTyPEjMW65rXjY3dD
	vF6NJZgY=
X-Gm-Gg: AR+sD115osyG2y0BD31V34DA35+LSXNLvSFaYCm1GTmd/Cnpi8DUMzS9UMENMDGsB4t
	p73lVjq8SQo66/IgTya3Hq2IJ0ydiKEIYXoTUeSOTj2Ya27nL5/oFzRhJiIWF9FtS89cg8Mdfmi
	l3PmdgWAGHy8uuzzA0xDR5EOkw/rrBq+Hqshj8i9gm5nbsnJJZpFOVaDi3jZ3RJR9cK977yvvmx
	GNedrCVU4Y+uctLb+9Ugel26HzJyBqJ7pFqjHzyev/V0duMUCh2Uz3NHLuuzZy6cgITKT5NZbnL
	ZFFrVEvj7W6Co3dzHSCf4O/R61NuMrij5XhSHzRCMUolXVq8v6LUCcu58+bSYaUhPZ6dB/QMcTm
	HvIUrfvHhPMT/whWQLk780VUrOONyTxZcrFNZYZTHhswM4u+eaGfxdddhP65Mcrf1Nzo2qdNDIY
	atEvtNadn+yM2sz499vyP/h1JqkLJFu9G3q8V++suTcbmfrIN+KiY9NsW790sHY4sS//cZRCAH+
	wQgV4o/lSbSEh1sgA==
X-Received: by 2002:a05:600c:c490:b0:495:5858:8101 with SMTP id 5b1f17b1804b1-4980c6788d4mr105703125e9.15.1785666542559;
        Sun, 02 Aug 2026 03:29:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/25] kernel-arch: Simplify KERNEL_ARCH variable usage
Date: Sun,  2 Aug 2026 11:28:35 +0100
Message-ID: <20260802102854.3952760-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242531

As far as I can tell, the HOST_*_KERNEL_ARCH variables only exist so we can
have "HOST" alongside the other host variables.

The BSPs would all use the TARGET_xxx syntax and as far as I know, nobody
uses HOST any differently.

Simplfy the code by dropping the intermediate variables which have been
there since the code was introduced in c49f967384ccbfe131bbb33ee518014f3fc4b38f.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-arch.bbclass | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index b00341c2180..fd6bce11460 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -13,34 +13,30 @@ export UBOOT_ARCH = "${@oe.kernel.map_uboot_arch(d)}"
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.
 TARGET_CC_KERNEL_ARCH ?= ""
-HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
 TARGET_LD_KERNEL_ARCH ?= ""
-HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 TARGET_AR_KERNEL_ARCH ?= ""
-HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
-HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
-KERNEL_CC:toolchain-gcc = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
+KERNEL_CC:toolchain-gcc = "${CCACHE}${HOST_PREFIX}gcc ${TARGET_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
  -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
  -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
-KERNEL_LD:toolchain-gcc = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR:toolchain-gcc = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-KERNEL_OBJCOPY:toolchain-gcc = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_LD:toolchain-gcc = "${HOST_PREFIX}ld.bfd ${TARGET_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-gcc = "${HOST_PREFIX}ar ${TARGET_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-gcc = "${HOST_PREFIX}objcopy ${TARGET_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
 KERNEL_STRIP:toolchain-gcc = "${HOST_PREFIX}strip"
 
 
-KERNEL_CC:toolchain-clang = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH} \
+KERNEL_CC:toolchain-clang = "${CCACHE}clang ${TARGET_CC_KERNEL_ARCH} \
  ${DEBUG_PREFIX_MAP} \
  -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
  -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
-KERNEL_LD:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', 'ld.lld', '${HOST_PREFIX}ld.bfd', d)} ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
-KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_LD:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', 'ld.lld', '${HOST_PREFIX}ld.bfd', d)} ${TARGET_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-clang = "llvm-ar ${TARGET_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${TARGET_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP:toolchain-clang = "llvm-strip"
 KERNEL_TOOLCHAIN ?= "gcc"
 TOOLCHAIN = "${KERNEL_TOOLCHAIN}"

