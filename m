Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88038C83F3E
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.24810.1753041910162761830
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d2GdfUGX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235e1d710d8so39454445ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041909; x=1753646709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGyNGvVUNfE9DxdruAQPiMu1LOCQ/mx90uL94uqIRes=;
        b=d2GdfUGX/J4hdHiKGXA4E7uxNVEZNaLYNsomfhkBaPWz9SxQQ+DyAICJrc1/z41Tya
         VaMtNDKtzidZ3BaogJ5lP6SJzAY1xUmjgBWd/LPsMigmvkE8sxoWroXfFzUTBnKCKy4b
         v1D/SBVaRq7fi3TCyFM4GAkOrH3yer8nEDOMPwLbLmDByd3MlJvTr1WReoA7J5Ym2Jbr
         ZYxa2NS8YLR8eeynVVFM8aGS1ds1SdVZS6wwBNgQKxqF3Cy08MUrEp/O8A9aFx6a2Czd
         +nMslN1zIou44Xrsi97mg0BktePqW89kBkrQBU89zApu15w5fUb1APav7tcqgqyoo723
         poIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041909; x=1753646709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGyNGvVUNfE9DxdruAQPiMu1LOCQ/mx90uL94uqIRes=;
        b=JTu3lPd+TIfMOatwvkfIO59RN0dtnOu19HnTOvfwRJucdJGFa4PGjNf+cEHIMXjHxZ
         LfO9S3ecn8ELutvzLEkgwJ8h4GHxoN6QMyDD5pGmEHMZiihuNmNuy/Zb0kMg5CdT8Ewk
         HOWLh+dnwV9PInRbZ5CCh5x5t2gRhjc1gx/Rum3mAf7uReCjDkmxzEePe9bbyQy0ETW2
         B8GZx4XNuKWRdYfyNsFzrIBnCZ1HhtLZynOgobLuMug+DhOTiPZPax5vJ+QlvZpQ4Ux6
         trwz4oKgF45COLfZD7VJcbb1c9dBbBWmLVRN4w8Yvqv290qoTfqPVio5Dup28PpIh9dd
         SPLg==
X-Gm-Message-State: AOJu0Yx+SN5Tcca4pyn2+tL1xO8IMPsmo/9ppXIACRhJUfoy5QAznM/d
	5MGiwtWlUBE+UB8hgp9Pj9GzY3KRpH4SReYqtvBp8vOKORzZGr/ddhzJC9EwZwLOeqI8k+XbxB7
	pkTsg0E8=
X-Gm-Gg: ASbGnctilariVi9NmYe2UhRVqtGL5dOUr4qWPCMGVzlxhwv8g8Q1PSqFMbxM2rQc6IZ
	O44X9x93beadvknnWOU4YLHKk0znh/y7ZOKjj1evw/IV1m9EV5AIU5RAD3uhbugYMjQCebRJTQY
	1reQmRZxXjqOocVHEPFdofflBtF0F00UJb++OjnglE1W9xfXPC5VPZsNgfttiVV9YcQVamIMMnA
	YP2RDrigCU9WB8TmFWnW9U1PkHC9peHWUuYq9BsArwcHJ2pPj6xAwnl1ZCIK3GWZdm2xnp0LFcg
	kMa9nVVCKNEJQPXZ9Ctfhm211F/pCVQlrQntHl60np8G9E7BvXnECHiQs3CnPR1e9vYl1oanyex
	U2WNmT06zr8MEvg==
X-Google-Smtp-Source: AGHT+IFz1ZHs96m0bF80mZhkt7hvyMDkOcPRvNRNLAWK3WCAfpgdS2I0WJRXAJ+zkSrolwnaudBNLg==
X-Received: by 2002:a17:903:18c:b0:235:f1e4:3383 with SMTP id d9443c01a7336-23e302812c8mr192173005ad.7.1753041909355;
        Sun, 20 Jul 2025 13:05:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.05.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/12] linux-yocto/6.12: riscv tune fragments
Date: Sun, 20 Jul 2025 13:04:43 -0700
Message-ID: <d63109567ccbefe027233f4ef82c3e49787ae205.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220631

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Mark Hatle
    Email: mark.hatle@amd.com
    Subject: arch/riscv/tunes: Implement RISC-V ISA selection
    Date: Wed, 18 Jun 2025 18:20:08 -0500

    You need to first clear (risc-isa-clear) the defaults, and then apply the
    ISA components starting with the base ISA and extensions (riscv-isa-...).

    Only ISA extensions available in TUNE_FEATURES are currently
    implemented.

    Signed-off-by: Mark Hatle <mark.hatle@amd.com>
    Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2080c8f215ca71d526c39a87d3307e4c65476a39)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 5f6a563ee5..7c3769e6d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "d7a7983928e6846c682771f9671d958e4789d691"
-SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
+SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 6152ebfaa7..2d5cfd7f78 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
+SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 29532a03cc..6c3d3fff55 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
 SRCREV_machine:qemux86-64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
 SRCREV_machine:qemumips64 ?= "2fd393fbc1b2f8e809b07f4ffb73a4611a569c3d"
 SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
+SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


