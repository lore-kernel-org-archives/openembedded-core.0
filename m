Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642DBC7EE2E
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:49:18 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.2520.1685558950993031997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JdrCpjGG;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6262be06e41so952006d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558950; x=1688150950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LAgpyFX9nmahD8JoPI+TEbnEqck8Hc30DtSkIQiZfQ=;
        b=JdrCpjGGg9OFvO7cJb5YFPf65zFZXvHAWyH6MvWFCnkzIGD0JJNXbATYLyQ+JjlY6P
         r+uQlyrTr95flSFwvs1k0EzdmR9EvpmnbMDgLu2dJjoNzY7hm71+groXERxCp4ZYHQR9
         kBITOSGM/HImg/WvDzzHVCD/n+AGgQVTkEJ3/KfS5ZGLXe+TRH40A6ZQLLH3kydiE3nf
         Hv7AkedZbzFMVX60hlB1KsoTn8DkJMUj7Mje1DdJO055VBpAaLHbOEqcWXSNJ1s0ONFh
         lbLuX/wd+ysuYp1XCh++IGnlgBlzMn66IedfVxg184O+UP4oKZGBOcPtZfSdr0TM/aH1
         wYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558950; x=1688150950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LAgpyFX9nmahD8JoPI+TEbnEqck8Hc30DtSkIQiZfQ=;
        b=QFr2M+UKo/8FI81naUn8czl4IcUQ1W2A6JOmE6txZ+aaL/HrLizWv+3gGdfRTtJ3V3
         +Exnmv1RlW/hShRgD4+9vmhLbqm98bjA6OC17FfYmb2R1m+R0sZIuQKN4yXxZ3z0QreY
         FLtIPpLlMxCUZdgB+wES6Syp1RvsmAD7H91hkt/gYZ60NNonTXjCeeChKJ++uNLQ/7I3
         KDnCmqGfNpLdbBfem0HJ/5FOiwAJw1rMANkpCs1r1yGWPVPaK4F4k2jM/li0ZZYq4OwA
         pmzUDml7XfLJ3rX8FJVNZehJASByubXbYff+cCoCJ1ibU2aaV/3n0ebtFxPyEvHxi205
         4dRg==
X-Gm-Message-State: AC+VfDzvyS6S6gLZdtNuUZpNuCLaqwMdrFAU2MXHnHSmukYkpZrr9ZkW
	OWtMONRdMDnEPTlxCEyS43+2YfCPf8q/Pw==
X-Google-Smtp-Source: ACHHUZ5Ubi5sAqqot1XQdmzXSoq8GaJqdblCtvO/tyloFBOFVBl1JK9D8pe463DrZSjwUcf+sXC3cA==
X-Received: by 2002:a05:6214:2389:b0:5b5:9c2:8c29 with SMTP id fw9-20020a056214238900b005b509c28c29mr7404279qvb.12.1685558949959;
        Wed, 31 May 2023 11:49:09 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e16-20020a0cf750000000b006257e64474asm3926645qvo.113.2023.05.31.11.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:49:09 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto: move build / debug dependencies to .inc
Date: Wed, 31 May 2023 14:48:58 -0400
Message-Id: <1cf98743e9d0e70fad6a2881c37f7aa39fe2c895.1685558432.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685558432.git.bruce.ashfield@gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182029

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When the architecture and debug specific build and runtime dependencies
were introduced, they were only applicable to "newer" kernel versions
and were enabled in the version specific recipes.

These are now common dependencies, so we can avoid the duplication and
move them to a common location.

We also change the adhoc nature of the existing elfutils definition,
as it is now detected by the kernel build and we no longer need the
work around to the native sysroot.

Finally, we change the undocumented KERNEL_DEBUG_OPTIONS to KERNEL_DEBUG
and use it to conditionally enable features that need extended support
(and support sometimes out of oe-core).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc    | 10 ++++++++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb |  4 ----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 934591ff1c..04a8105e17 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -59,8 +59,14 @@ do_install:append(){
 # enable kernel-sample for oeqa/runtime/cases's ksample.py test
 KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 
-KERNEL_DEBUG_OPTIONS ?= "stack"
-KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
+KERNEL_DEBUG ?= ""
+# These used to be version specific, but are now common dependencies.  New
+# tools / dependencies will continue to be added in version specific recipes.
+DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64" ], "elfutils-native", "", d)}'
+DEPENDS += "openssl-native util-linux-native"
+DEPENDS += "gmp-native libmpc-native"
+DEPENDS += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native", "", d)}'
+EXTRA_OEMAKE += '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "PAHOLE=false", d)}'
 
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 7600f45522..7e7edf82c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -46,10 +46,6 @@ SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "6.1.27"
 
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-DEPENDS += "gmp-native libmpc-native"
-
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-- 
2.34.1


