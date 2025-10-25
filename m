Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3176CCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 04:06:54 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.11.1761365207908573683
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 21:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fxq+qkyX;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-87be45cba29so25230336d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 21:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761365207; x=1761970007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5ozwQPPK+AR8K1rsUN86xsCfAUjLVRbXRO/h71oD3k=;
        b=fxq+qkyXbWGiArguMk9Qpu7adDUGdbbcFSt5tRO/jVvKWNJY53tdkGNvEW85a8QoZk
         bCSdhcC/FhJAn1YUW3p52Wnqj3BYm2DHPQlQqaQlEZOkeu57q3dRQ+wyysYg+9LQ35Xf
         2jsFsx3GAxaxCq89q32m5C6m2+zPuVj5PMheDBtK/y2c4FLkegoQH/qQ+m48u/1fJhNX
         atiG0PYJX2pw9DkZ+FBxo0+2FhgMAu/vfHv1+NIrfoFN8rAkWh5xyJFCh2+ROiYNNg1w
         h3G1H2G69J0j55Jkjsyom//PIbnPT8kks5oh1eH5saOPdzg/2b/FUgdSkJ/g6mowsrgQ
         8JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761365207; x=1761970007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5ozwQPPK+AR8K1rsUN86xsCfAUjLVRbXRO/h71oD3k=;
        b=JsOz19hmeU8kAJpW3wgTRe9SG46VWSQCsocuUkKrKQgIpR0hrnd6L01G2yB4tpxhDn
         D7Sr26maJ0p21G9S+Q/IgVlrORcGSR5E9ZBr63XmhoYoODqJCMnTB5PS2kit3szaymj7
         Ew3vXj9T691KbJKjAdX8CBacZ2v7e7CwlniC/n/rrRH4bmxPsUgHIGqSz8OjNhzbAApF
         kEjm41QzxdahLJeFtHi6luK9z5L+qBzDBFEDPt2dbdB88e2IfUzomWXvJJ5BuVsn/eAp
         KtYfrDcRmyfY8J0NlawGKlFX9CV0tgLbXiIoi52tH2SUYRnrR52Vmbadkl78OK/GLzVk
         Hw3w==
X-Gm-Message-State: AOJu0Ywu06uJxtalNvIAQ++cqeFW6UbKi6ZNQYnDliNEbcdpelWMILr0
	tMhASl71ldC3NAeyNGgDHvIZs6eUfTHaqAwzgWWX5VLaDP4Td8eTZYRZ
X-Gm-Gg: ASbGncs/IDh1Ijfp+12zaBIxnvT+hsglPK22DLvA4UXEqDKgS/OW94aVZtMOnnNCb6N
	KeWiM8+HdDtDLjY3Tgu5zdJCkerYTH15oYlWSHef5ceyS+WhjRi/MUX95P0d4oL/2joi3j9Dps4
	oOZAbxtgpkXaXnjlz6FUQ6TzXQjxolOEo8R55gYmc8pIJmOBkEWCAgQ8/KXCJiD6t/rwbzKherc
	KCFVlz64wWmrXAcIwuOeG7B7flJE+IBjg1CeLwiIyOFHoEkf+Q4K+xGW5BC5kRB1i0QckRpZxid
	zq/ePSAClIIOeGK8pm5B+YPaFaBggOIFVvYFWDZUGd6sx80YSfMrbg+lDoFi8sHJBOMgda+U42H
	8E5xIrbvsUKMg16VdesLxIoMVU/SDTdEpatTc5XLqdHzRIBZLQvxehcmc5QQf2vq1Jyq7OeEV1m
	kzVho34KDsPjnIGZxul9QPmo3I+95e1fHjt6TkDEVHmRq3vHGzKK53CJo0Dp0qiDL7bmrVR2dK0
	Nbfrep/cP4jGxc=
X-Google-Smtp-Source: AGHT+IETP0bNyQU5HVpqAkJn4b5Z0ZiL8S0vcSDwQzzBWR4n+q/8f0zwVmxCnZJ0DZUDfRIcAkCGQw==
X-Received: by 2002:a05:6214:d44:b0:87d:ca27:ac14 with SMTP id 6a1803df08f44-87dca27c324mr360345686d6.39.1761365206787;
        Fri, 24 Oct 2025 21:06:46 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48ce478sm6999536d6.12.2025.10.24.21.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:06:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.17: fix qemuarm config audit warning
Date: Sat, 25 Oct 2025 00:06:44 -0400
Message-Id: <20251025040644.1288154-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 04:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225305

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: qemuarm: fix configuration audit warnings
    Date: Sat, 25 Oct 2025 00:03:25 -0400

    We drop options that were removed by this kernel commit:

    commit 70cb6ca58fddb02e269fe743ba75d53d577b5b1c
    Author: Eric Biggers <ebiggers@kernel.org>
    Date:   Sat Jul 12 16:22:58 2025 -0700

        lib/crypto: arm/sha1: Migrate optimized code into library

        Instead of exposing the arm-optimized SHA-1 code via arm-specific
        crypto_shash algorithms, instead just implement the sha1_blocks()
        library function.  This is much simpler, it makes the SHA-1 library
        functions be arm-optimized, and it fixes the longstanding issue where
        the arm-optimized SHA-1 code was disabled by default.  SHA-1 still
        remains available through crypto_shash, but individual architectures no
        longer need to handle it.

        To match sha1_blocks(), change the type of the nblocks parameter of the
        assembly functions from int to size_t.  The assembly functions actually
        already treated it as size_t.

        Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
        Link: https://lore.kernel.org/r/20250712232329.818226-8-ebiggers@kernel.org
        Signed-off-by: Eric Biggers <ebiggers@kernel.org>

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Apply this on top of my 6.17 series to fix a config warning for
qemuarm.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.17.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index a8dd6bfb2b..5af16f9b61 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "268abc460d21fe8510bc8a521f3ea887f2bbeef0"
-SRCREV_meta ?= "07eb16989b3f0b4fdfd433e602d70d0e0538495a"
+SRCREV_meta ?= "8f5d87f8cae63175d9a7d6b8791864df15b327ec"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index 989b114769..81a24b6bc9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_meta ?= "07eb16989b3f0b4fdfd433e602d70d0e0538495a"
+SRCREV_meta ?= "8f5d87f8cae63175d9a7d6b8791864df15b327ec"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 399dfa171b..2180f0f36f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
 SRCREV_machine:qemux86-64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_meta ?= "07eb16989b3f0b4fdfd433e602d70d0e0538495a"
+SRCREV_meta ?= "8f5d87f8cae63175d9a7d6b8791864df15b327ec"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


