Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBA4D711B0
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:03 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2022.1766089376880157971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LfWtzFM5;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2627269d5so114212185a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089376; x=1766694176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSkBY0V+yQrgWy1Y8irPr+rhA9oKjByPrE3AunL5lbQ=;
        b=LfWtzFM512gP4JXHpK0eNNZQxr5WE00qbaROyjWVuqFkHdHCRFMhSSbv09IW3hdAqH
         bgdiRIX30oyVk1AItlCXPNDLuMfateRCDQseruI6GTj24Xohi3yKlHTO4K3HrwRK1obx
         bFnAfpXwSKzxSHvJwvVMlU0vz4Ktd/N6PFQap6gexAu4I5yzkS6pqY8B45yl/551k7BJ
         /HqIcwGwfOiratZWKn2nsHHN4RPvyzJOk7+K++JqK+ZInrw18VmjU2JdZqaBgu+SrfPl
         2r3O8dOZchTbeN4yE1nzJJwYZyp7o4TqHwYjDkyK6uyJBx3bt2vj1eSmZl8vZ+5gEVY6
         49Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089376; x=1766694176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSkBY0V+yQrgWy1Y8irPr+rhA9oKjByPrE3AunL5lbQ=;
        b=uvQVXSgN87uIpd1atLDl7XZysy4Xwhr0TutFjPkkNRv144XGyl6TF+oCP1/WQacrgO
         9OWCKBYdz3MmWPZtXb/tdfCifmHKstl8yyhteUDBV8vV1rNzYM6qQcPapiqNv/DGuB5B
         bpUig1uyPEr7xW1H6N1zr5IoRtAhFRVnEyXtNE3R+Grp9pSFUcV9SlpMSwczJB8AWqpi
         iJfaiiaAiBIUMkU/2qTlZBj4sxXnkVBLqj9qNwsZkabGgaBrODh1rOnCIKsX6cd6/TLL
         gZgALI/pFJIzOgYtpQcKWxYZQaw1nSzRkoQLxLWQeb0i66FXrvROEhBZL5vSsheqnCbW
         w+QQ==
X-Gm-Message-State: AOJu0YwRM9FJy9fI3BV+tNOG7fBqMIoVauGnaXWVMv3TteoVMJaHLiK9
	9psTMXQUJMEvf6e0SOOUG+iHUtFN/qO7WMYCLzc+Pxiuc2GdRFGNoS9q/5GIPBw9c0U=
X-Gm-Gg: AY/fxX7q/akifhkRNYySjPCSduikwBUKNUVETcWRGZ2961CdIK0gEXpxC8lhQ2DS7p/
	aHRfz9KpItYPyVnTHdZs7GzNeFq0OSGBOjPvhbPeVpHfYtQIVeiBFDALWWUMx/24G1W9e9XqZwr
	4J0pcL5hNf78EmeQounY66+10PaphvD+BvU4AH8svbqXHCczqSY8CHUmKcThGH4BCkxQtu8NxI6
	Nd9E71C/8XPGkrAWdFbf5MVlqaCVHIllCte8k1IY/YWuzYATKXDfjVzJ8x0Su0xA8JPQOrZmPea
	o3tCjft2McdBv98HxwZSUtILS9GSZisfc4wuKyhQ5jnSQzSHQDe4IBYoEpO3pglMDvw4ww2Jmuv
	bH8l5WuVQMcyelIj02bxevDHZUZCeVlmSK0TJGqkY49B2qB4q0vXYg3SMcwGRDu7Q87VSg0wmsK
	TeT6aMAXDTTUEq0WuxdylYc9XFS4peBPRfLs5qD/lYK6x2K3XNR9Hu24ecnp9wxLmXl3iAUOjqs
	nexoPtFXYmBY1s=
X-Google-Smtp-Source: AGHT+IFeq/e4uytcwV/07cIn3b02K/VwlxLY+Gh9BjnEflKg8xjTvsZ1YzCxE0qG/I6AzCQRqlS+sg==
X-Received: by 2002:a05:620a:1995:b0:8b2:f1f7:b867 with SMTP id af79cd13be357-8c08f653cf5mr156512885a.11.1766089375774;
        Thu, 18 Dec 2025 12:22:55 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:54 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [06/15][openembedded-core] linux-yocto/6.16: rust kernel configs
Date: Thu, 18 Dec 2025 15:22:31 -0500
Message-Id: <20251218202248.70476-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228149

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
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index d1f7e76501..1230e4e805 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "c31e0cb82247b36842209614bb72af9127ef2471"
-SRCREV_meta ?= "9e0a3e81b40db2b35e060ef001b3902a6a0996ac"
+SRCREV_meta ?= "12553099281a0d3ffbcf5860aedaa1062c8ffc78"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index ef904adad4..ffa15b0c1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
-SRCREV_meta ?= "9e0a3e81b40db2b35e060ef001b3902a6a0996ac"
+SRCREV_meta ?= "12553099281a0d3ffbcf5860aedaa1062c8ffc78"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 2188c7fed2..408f14b451 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -22,14 +22,14 @@ SRCREV_machine:qemuarm ?= "cdb5121dcb8fbde2d7616011e8e84623914d17a4"
 SRCREV_machine:qemuarm64 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
 SRCREV_machine:qemuloongarch64 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_machine:qemuppc ?= "c80bee672268c633df8e4e37bfe6b0eda2a32f8d"
 SRCREV_machine:qemuriscv64 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
 SRCREV_machine:qemuriscv32 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
 SRCREV_machine:qemux86 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
 SRCREV_machine:qemux86-64 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
-SRCREV_meta ?= "9e0a3e81b40db2b35e060ef001b3902a6a0996ac"
+SRCREV_meta ?= "12553099281a0d3ffbcf5860aedaa1062c8ffc78"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


