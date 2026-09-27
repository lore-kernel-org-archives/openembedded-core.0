Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA11EC98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:44:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33595.1790495041665035539
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lvkVOgwO;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-488885c3844so555012f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495040; x=1791099840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+sG5nRZk3pCIl/yle+TyxluPh/3N/xw+nJXJF405Cp4=;
        b=lvkVOgwO9EndLoXuc6Ux8neVLQY0Posl78+Q1yxLiGCJIR7zYJ5CF/4B0C+5v4x6gZ
         JR7npzTdv3uZ98Zj7ZIpa2UUyo+nBzYfXmxF7S7/RmNoA7W7JU+L8abA0i054L2HG8DL
         oRiEhdTw7F9rG4qWuMSC+J+Q2t+Saw7MJ3LKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495040; x=1791099840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+sG5nRZk3pCIl/yle+TyxluPh/3N/xw+nJXJF405Cp4=;
        b=2TGRvSgHy4uallNNifo4iqhk2vV2wqRhTRvzQeBqUTux5rlBnjxdJMOY2yWZe3EZgs
         Yt0uuUyIYxVUJs2ZqdprPxoTWSdKxRypN6cyU7x+RZHTws4cpaU0K+V06lBT8qmIJfRe
         rBzXjkAj7JxHl+p0z+fl5o3cX3LpEmqbm6YTc4W/Zpoxm8i/OmV/+H11kYvYJ7VdhfbK
         W3HOJ03pW69pnJ0m/eEspyh1ljNx4CAhS0ZlHjU1VQC/gtKAf3H75pNtKZu52++Hqbfh
         rWObBje6XvpXoqJwRIqff2Prma2uFA9yWsFCjAbN7ffx4m0zPaW6QWzAFW5bVz+w2YKV
         tN2g==
X-Gm-Message-State: AFq9FYJMfK7Jb4I3QUbc16hI2nGZkpSNmkJVejPLYTcro5rHySFd74p1
	0P0CxkB/xuZycNkMgsA5JYNgkOQ5i9XluPX7/kf2XLz2jGSbpFcntDRUa1egnbPLPBtE75oPe3l
	TOccK2/8=
X-Gm-Gg: AYBFou3hKkQxEGlL+JSyA6DmwUtJ+4pfihznW+nMvx/rYpDAXAIYtpfv5QaxoGw5OOw
	FEmCpkJqP6tn2+WROwMpHcu5YjgmYtEgTHNwN18u1nO7j6l9JgLb69emmIDwInsRME7q3DPg/wr
	oIjWDdLXvGB+SDppNLuC2MAmkMT3Wr0uPgDKzLXD8gPuk6uMFSbMEiPJ8heAV4CfAz8idWwyVst
	F1jOTc4mqz8lU9DUSScDmSDhxbQie0HBkht8szruY37ieYZpl3PKDXqaM+iS/9YO6yV3f32f+Ev
	V1kRsiyjiN4b0YE91rNPSd2zwcCXhM3tZTpodLnl+iOIXjR7OUsmhYeAqpjxdH6J/NIzqXc0hBC
	FnHdGt0RIQ+z8otxWjy9a5nKGw9On5vJnLoW+Vi/M+sZtIQSeI0gd3O0LEJQUbCe+AxX3tAUPmE
	loViRkWUkTsuiiVSQeoAxYeMUm2dykM6u0fytE4KULufNX2pWqnb4bKxbAEDbDL5S2EnbakGedn
	QuzuPBf5n1ah6ZcvxPgXWPcw50VUIFCM0+SCRwCNFvzkvl+e2M2NZQyEsfg4XBVblgF8VjBsw==
X-Received: by 2002:a05:6000:2893:b0:485:8226:c69e with SMTP id ffacd0b85a97d-4887170dbf7mr19881845f8f.29.1790495039894;
        Sun, 27 Sep 2026 00:43:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/28] linux-yocto/6.18: fix kernel reproducibility issues
Date: Sun, 27 Sep 2026 09:43:19 +0200
Message-ID: <40993b0c42411caa5df71a75739b569fdffe981f.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246677

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: x86/Kconfig.cpu: pin CC_HAS_MARCH_NATIVE off for reproducible builds
    Date: Tue, 22 Sep 2026 21:50:19 -0400

    CONFIG_CC_HAS_MARCH_NATIVE is a def_bool computed from
    $(cc-option, -march=native), i.e. it is probed from the build-host
    compiler. In cross builds the result varies by build host: the kernel's
    own comment already notes "This flag might not be available in
    cross-compilers" So it is captured differently across otherwise
    identical builds and breaks kernel package reproducibility:

      .config / auto.conf:  CONFIG_CC_HAS_MARCH_NATIVE=y   (host A) vs absent (host B)
      autoconf.h:           #define CONFIG_CC_HAS_MARCH_NATIVE 1
      .config:              # CONFIG_X86_NATIVE_CPU is not set
      rustc_cfg:            --cfg=CONFIG_CC_HAS_MARCH_NATIVE

    With CONFIG_IKCONFIG=y the .config is gzip-embedded into the kernel
    (kernel_config_data), so the difference also propagates into
    vmlinux/bzImage/kernel-dbg (the blob shifts kernel_config_data_end and
    every symbol after it), failing reproducibility across the whole kernel
    package set. Not just the config text files, which is why a post-package
    filter is not sufficient.

    CC_HAS_MARCH_NATIVE protects only X86_NATIVE_CPU ("build and optimize
    for local/native CPU"), which is never enabled in these builds and
    is not something we should do in a distributed/reproducible
    kernel. Pin the symbol off so the captured config is deterministic
    regardless of build host. On-target 'make scripts prepare' uses
    this same patched Kconfig, so it recomputes the same value and
    needs no reconfiguration.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 72473a0e03ef236072299b3fbf4efb555009a198)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.18.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 31a0294070e..03487e9f4a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c191bb993af1f71ef139504fcce530a9ba167a0d"
-SRCREV_meta ?= "9e9d8b1f9128b07d938b8b7d5921aeb3ddf907a1"
+SRCREV_machine ?= "a23529ae3d1aa70979a3399f370638f3086587e3"
+SRCREV_meta ?= "2184786cc3deed04926e1cca6c320ed9314da9da"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 1b7575be0cd..d2bd34732f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
-SRCREV_meta ?= "9e9d8b1f9128b07d938b8b7d5921aeb3ddf907a1"
+SRCREV_machine ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
+SRCREV_meta ?= "2184786cc3deed04926e1cca6c320ed9314da9da"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 055a2d39ddb..3008f1751f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "4932d76684b2bc2cbf8dc6e0e46ada17ad020c71"
-SRCREV_machine:qemuarm64 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
-SRCREV_machine:qemuloongarch64 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
+SRCREV_machine:qemuarm ?= "49ec63d52f864d8cece5c6caa6be446362478003"
+SRCREV_machine:qemuarm64 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
+SRCREV_machine:qemuloongarch64 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
-SRCREV_machine:qemuriscv64 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
-SRCREV_machine:qemuriscv32 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
-SRCREV_machine:qemux86 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
-SRCREV_machine:qemux86-64 ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
+SRCREV_machine:qemuppc ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
+SRCREV_machine:qemuriscv64 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
+SRCREV_machine:qemuriscv32 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
+SRCREV_machine:qemux86 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
+SRCREV_machine:qemux86-64 ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "08edce0ecd6a36020447f51f11329b6641d3c0e2"
-SRCREV_meta ?= "9e9d8b1f9128b07d938b8b7d5921aeb3ddf907a1"
+SRCREV_machine ?= "364c4b44ab2dcc7dfff16076522b62827bcb0e7d"
+SRCREV_meta ?= "2184786cc3deed04926e1cca6c320ed9314da9da"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same

