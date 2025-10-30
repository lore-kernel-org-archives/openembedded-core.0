Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0171CCF9F8
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:38 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.3235.1761844356616524853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NaCbFzO+;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8a9b1cb735bso128442385a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844356; x=1762449156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjmj3mAqwQR/D3bw/2JDe/mi96dkEBbK8MhKB5YGJzI=;
        b=NaCbFzO+MJB2Q4vze0tAwug5cA6RIz+US4dUvm/U+URdzw7Pc4ZcPaOWiaysv1D32s
         4PUBZEibgf5NbFnOymJLuMvj01EhlITi3jLr/3jn9s1KonbtCX8y1Sy/q6c+Pr0fxZ2s
         pfTq0gS7IJ7lzsYy1RHMP6g46ezgJHmO9vrWn1PL+NnF4xddRrWNWnA8FhEOJNWh4+hw
         fNTpipjt+Gm8UZNCv9mUAPLpjESQOt83PTmFU3yTT6hJrN/XJXIyHgylmF5b/s8k3UMd
         1b86ZhYiNrzp2pOGyYWWD5oTVEf2syOfK/8TB2Qfl0ojFxelXmMhvnZcoXDiPZ11rGjL
         oy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844356; x=1762449156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vjmj3mAqwQR/D3bw/2JDe/mi96dkEBbK8MhKB5YGJzI=;
        b=nWCk9apCOc2bHFYKXhJJCTCHYh3THNGRVkUU+Cf0epkqx4UouyXSi7xApwPwLKru15
         EQmy40IGI+5PXwnDKCunDXOf4VELdNSQP7jeCkl2T7yk1xavXqdVQmbCXNcPJ2TapVwG
         nSRtpGDDwaaOnN/ycdHBq5InBpBjXx7lJxLU8eeCO5r251PDeFN7GZFSNQJ0XjdUpoKX
         XvvJLOHUMZkp7XWbMg+6GbCuhq1D/3mC/2uNbWQGExiYQ6+1vQ7V4NlmxqhcsRevvtJR
         /aCtU+9qnflAMH041KgeoshZnNiagA5ZzptRwunqOvQWMrE+Tjvh9nCl++zvoQ8q0HMK
         QnOw==
X-Gm-Message-State: AOJu0YxNwhE5xQtre+9hHsbdW2TF7d9M073b/Oe6p9FJ9zXfFLje4YBC
	/ops9yNJOWUFHjg7ckKaYE40ikJGJSp+CRXnIGsgKV+AORVHkJaGyFDyIraMLDUMjZE=
X-Gm-Gg: ASbGncuj/AAoRYd7jH0oC78Y55cNPQQA5Old88RTdjbtHLfkX/ltK0h/VUW7rb349Lr
	HD0CzYvnQHuuWCKZmO02nlPCO7kUt7gMYpgo/nNMthSv+wgF6o8t02w943WdWM0GQ7eE6S8VGOX
	BT8mta5LUBMQVRZkGhfQOZpq1jLVe5mCpTnPleEKfr8T+g3Y7/ENme97F+pSAHBlw0mUwSsvNj2
	WYX1cq3LO7uzV5PXrkqB5Dg5aLE2kEBGxpggbP3Fvvtn6BwV/8lmDm96yz+0Gy0HqjnFgvXIClY
	Nm00B7lWKPhp4LXi1p0A/4NqYEzwhjPj5hKOFkeRVXSU0E3WGaUzw+F6+uae9WKmzvhVIycTom1
	u4TRGrozuSR9sw1C/M1v8FNFSLhgw2z1TY3kqaGeMzOvvxIGGXFxTuOGdd2K9F8G96ToK1utyeC
	p9jlHvacY/Ko84DzkVJr6W0lY+O6Jf6hXWdtSqUMzr1MuJdH94UR461/XxJdIO6JAvghfPETKKE
	Y997UeagjKq1mo=
X-Google-Smtp-Source: AGHT+IFXdwuAgvmflz7Whnhiy3BSjkykfClVDoZ9Zhqjnh6ZX5ED6g7EGbEXAOW4ugEP/5Wp5xDApg==
X-Received: by 2002:a05:620a:44d4:b0:892:2a43:448 with SMTP id af79cd13be357-8ab99a766c2mr25769885a.38.1761844355402;
        Thu, 30 Oct 2025 10:12:35 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/14] linux-yocto/6.17: fix qemuarm config audit warning
Date: Thu, 30 Oct 2025 13:12:16 -0400
Message-Id: <069e89c4a9d0978eeae14780f1e47a4de8284ece.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225504

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


