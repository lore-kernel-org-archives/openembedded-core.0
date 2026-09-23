Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FDEC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 03:40:48 +0000 (UTC)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3913.1790134838596035392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 20:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YlCZ7jgK;
 spf=pass (domain: gmail.com, ip: 74.125.227.12, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4fffc0so258972e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 20:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134837; x=1790739637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5sgbPfsjGYls+S7gvBaeEbg0l0hYifjyaF6rG+JA+64=;
        b=YlCZ7jgKWHgVbXnuCksqawmgH2Nb2XEnWH4SBn3K74wG3a77HhjfPackbKn55U4cjy
         XIjA484irVlEJKJgyvPrzIVnja42ypcvzixaeg2Mga9Q80IJQrO5Kz14h2SUmHyjH4mV
         FNOJByaMbYpNviJx0Opt51hd2oDZTdbpXnpMikigui+OPeC1ad/BLw8fnuwOobgjpnoD
         tLTq8Qbj+gVE8lMigDWLrxOekm2JOqAYVRAdvKp3l9B+mdOtRKp2WXkLqe8YAc/7qebH
         nUSd285jx0Iyow32zF4lLPg0lL0Q/tk6wepuJHjdDqrbcNOc+Q5GHbKn8UMoIbZLH6jX
         ZqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134837; x=1790739637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5sgbPfsjGYls+S7gvBaeEbg0l0hYifjyaF6rG+JA+64=;
        b=uhtsoO+gJr7n4h1/1NvwzXQ/dvNdF1tKKf80n3f2NBK2jITjNcsULThWMSHRoUApVy
         RLiuM16Vq3OqZRTuSwx2yrE6WfICGcWT14m43P5Xh1oQsrUTR0lUOg293tNxPpEVOppM
         jIqcTSYOsLaYqK8o66WUQIwwnwkU30gRpssHYrhL05H2PQ+LCw8qc8lMexs9cmDXBHul
         g2Mw/iDLnPJyreXr4qF340F4fmXrYbOXaQ0UVRothjnivZnyR5cjtcuJW8IezziwxlZg
         c+SrT8GWtFyUBAv1MVGdNEZIiv28ZmfdG5perBSK2rfxy3Y2r3nsz5o6kNj0FSe9NrSF
         vhbw==
X-Gm-Message-State: AFuF++lDIdjPZ0piD2SOcjzUIK5aFDDIw7zbEBl3J6970QJlUf8l34sZ
	LyEuON5chxYcaZJddXyuAK2CYiQwpW+YI1GhMg2W7775wMVhbaAqa59U7iNQMWXpWXI=
X-Gm-Gg: AYBFou1p5sjhaSZ4g9m/UtyRmsoyL3/Y0TMFjjTdTILmVuwn0M0kNClfYlvZUWnol2D
	lg9tDuSyOUaUyDiKDhVzmyTWdGXlYCyoVO+Llfbf2FeutntPvyBVqoI5A9Nxt9sK11fKNtGy8ud
	EG35uIUpD6up08x2swo6mHB8+sdXjn4XkvqLlXUn4fRbVl9tSXWnmULETw68u1ulCzCFgAJnDQS
	3qgO3z3XzcN7qSfREtPV0lhMd9+5MjHC5ZuDGCaPxNCUxjLwweW/bLCYWYQK+WEiGdJjodLWxjJ
	/B2RCJgmdq7FIOVwcWxtxv5EaE2qixw5Spmcrfp0asenQI/hJxQB5QiFXVSQmdLqhqWsRtTkxrV
	XLITQVYE9LEIHhTX3+UiI89oLwFwb8M3VW2arz/oyO5wzDd8oPW4NbUV46QShEJTkxqngh0DWR5
	CnWUkQOXMAO/xe/F0O/Cgb9ZONxwOraGBhqbrYEepR2joYOfZrks1WRWcbuuEGoOA9eBIuB+fB7
	A+VJpphueVHUmyttdItmw0U7J/LwAmMGyu22yata0Zv7sKg7MJzT9qUSb/1OnH0zSq29AbYVv49
	c3nh/QFS6B+PyBww1DbGofvK2YILngLrL0zLAuWBU324dlyAzcS4DAI+RzYpBQ4cL7Ae3kknSvx
	O7yDAhmULTpDLklc=
X-Received: by 2002:a05:6102:b07:b0:7a8:1b8b:6d04 with SMTP id ada2fe7eead31-7ac1acd94a9mr1303417137.2.1790134837135;
        Tue, 22 Sep 2026 20:40:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm1767655e0c.13.2026.09.22.20.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:40:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/6.18: fix kernel reproducibility issues
Date: Tue, 22 Sep 2026 23:40:33 -0400
Message-ID: <20260923034034.729674-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 03:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246432

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
---
 .../linux/linux-yocto-rt_6.18.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.18.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 31a0294070..03487e9f4a 100644
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
index 1b7575be0c..d2bd34732f 100644
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
index 055a2d39dd..3008f1751f 100644
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
-- 
2.43.0


