Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FCFD711B6
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:13 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2031.1766089387782936422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mGOa58cO;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a35a00506so14786576d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089387; x=1766694187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpctCm3t+IbqB6MW985bV/zkXuL1FoMf3YVMmpHUmjg=;
        b=mGOa58cOESKBIHK1NbGWkNeLIhtxgFHyQeXqhwHOI21Ko4vft/VdXbJSSkbjcsX0wx
         ShmX/gnT1eCTy5n78wNKZFYQPyQce5ycsE98NWhlQCVJAFc2N+MPOuFABExNbMypyl5U
         4MqZv07MQFqyXy4E2RqQllPQ4ryKsxmMwNzG3qJzcFLAALxKRNHPxLXG25bY0c1oGV6e
         P0szy7Ai1XxCYB3fGVOhtmA9PgeRSIr780D/Lf5W5P3i03biwshCYHYqxEB+g/4cRPpo
         tA2HjUnTW1nD1YvyTGvaZ7gPcbNSPXkW4nMPiJZDSx79oTkUZ5pJlawBZkEc3bDsy3+e
         dlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089387; x=1766694187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RpctCm3t+IbqB6MW985bV/zkXuL1FoMf3YVMmpHUmjg=;
        b=Mro4M+B+mdJu3/NOypnMxuCMC3saix+mGyMqIKXzHtkWDvHdYUwihGMAHLuIFJI2SU
         deyvkdr627xWeJNhqyQU7kNhJYBYqdZhOgjDPivkzlxRocMy9joxfjeZA4lbL9ADECqR
         l/LgQx68VcX9ImVlmjhY35uBfgc+aNbaog/XuNm0m0/C++dzukFwxKvulUxexx/Gd34d
         UoCelJ2xvk/C33KDeOcyjx63+HFDcl5a1MnCeKh7K9mFYKki5dRH5ErIMj7l0/l3Ql7h
         l/7Uk/s85tk0mPaIhhC3Mx+mzFtgx5ktk2/0xpmPSG8MAyFOntOUYVRNxlGomXL+/53L
         GKUQ==
X-Gm-Message-State: AOJu0YzbRJuxbfidJdlSHZwa/kHlkV9CwKwaxaD/JfS61ApAtZTZYzR0
	4fALwq28mNM9HesGL60Glv1UFLQB1cquY9mEs3C/KwBpQnYvsafswii5
X-Gm-Gg: AY/fxX6ybvEr0y4s5fAjZTBUvWihFptY6OTQVGQgaCUsYoVV49tMp7a1IHk/cnGGjly
	6U3n0l0Pw90rRwcOKTTTiBJz96MpPCKR40dUn12c9EkVlgJoQJ1egAMAvduU0fbQTjAlv/xFoQx
	j5+wmwtgezWcFGIxqqnl0Ugb3ThxTMNo9mk6ESAiSDAsSoCDRJdrbwuuo7yr4P8elpd6q54nTbx
	MyWlLffaPvCKAwicB1cBIHOmB/c2RSSKGvCt/M1S7zFzokucJR/ghIUOjA2FAdkmkbufi4qxo4o
	SxisPkk4gYbJdrs9rg5ZofZTCKTe4vSUPAlnrZ3AUmTBurBvayQCb5KpyKHUmc/bFnm7IKxjIIA
	sjuuESCvqTI8wgNctx+snWBIJPyTwSyMhgf15WarLGsKut917NH7uVRfsAC1g5Po5lPUh7Y/sdB
	DdPkJIqXSEctX1zbjVwIhvRe0lrP9BZsYX4RqsyVGop8oRahlvRCQtYlhcCATHDxLeZfEGSS16C
	7CJBWzkOcJqZaG0y6fZw3e3tg==
X-Google-Smtp-Source: AGHT+IFA7D22+ECD0E5A9CqhZN3WqE9GGPYHFq80A9txCOkyYMGzGgwwjV0hRWUZvDNnfcSwI3Pzqw==
X-Received: by 2002:a05:6214:3910:b0:888:850e:f3d5 with SMTP id 6a1803df08f44-88d81663addmr18623746d6.4.1766089386719;
        Thu, 18 Dec 2025 12:23:06 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:05 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [13/15][openembedded-core] linux-yocto/6.18: rust kernel configs
Date: Thu, 18 Dec 2025 15:22:38 -0500
Message-Id: <20251218202248.70476-13-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228156

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/3 [
    Author: Harish Sadineni
    Email: Harish.Sadineni@windriver.com
    Subject: features/kernel-rust: Add feature to enable Rust kernel support
    Date: Thu, 11 Dec 2025 04:42:31 -0800

    Add a new kernel feature that enables Rust support in the kernel. This
    introduces kernel-rust.cfg to set Rust-related Kconfig options and
    kernel-rust.scc to define the feature metadata.

    The feature enables:
      - CONFIG_RUST
      - CONFIG_RUST_OVERFLOW_CHECKS
      - CONFIG_RUST_BUILD_ASSERT_ALLOW

    Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/3 [
    Author: Harish Sadineni
    Email: Harish.Sadineni@windriver.com
    Subject: kernel-sample: Add Rust sample configuration files
    Date: Thu, 11 Dec 2025 04:42:32 -0800

    Extend the existing kernel-sample feature by adding support for the Rust
    sample modules provided by the kernel. This adds a new kernel-rust-sample.cfg
    and corresponding .scc entry alongside the existing kernel-samples.cfg.

    The new configuration enables:
      - CONFIG_SAMPLES_RUST
      - CONFIG_SAMPLE_RUST_MINIMAL
      - CONFIG_SAMPLE_RUST_PRINT
      - CONFIG_SAMPLE_RUST_HOSTPROGS

    Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/3 [
    Author: Harish Sadineni
    Email: Harish.Sadineni@windriver.com
    Subject: debug: Add kernel Rust debug feature
    Date: Thu, 11 Dec 2025 04:42:33 -0800

    Add a new debug feature to enable Rust-related kernel debugging support.
    This introduces debug-kernel-rust.scc along with its associated Kconfig
    file debug-kernel-rust.cfg.

    Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index d7d6bf9864..8121baf143 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "e42d20aa0fa5148ff2db5606563b96d1f216c4d2"
-SRCREV_meta ?= "88a21543c51263713794e3ebb9faa5dd1d92af19"
+SRCREV_meta ?= "f224983ee724c8eb616ae63eb3dc2aac9752c07b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 4ad42ed3e9..a21a74f7b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
-SRCREV_meta ?= "88a21543c51263713794e3ebb9faa5dd1d92af19"
+SRCREV_meta ?= "f224983ee724c8eb616ae63eb3dc2aac9752c07b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 7090eb6f20..114556bcec 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
 SRCREV_machine:qemux86-64 ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
-SRCREV_meta ?= "88a21543c51263713794e3ebb9faa5dd1d92af19"
+SRCREV_meta ?= "f224983ee724c8eb616ae63eb3dc2aac9752c07b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


