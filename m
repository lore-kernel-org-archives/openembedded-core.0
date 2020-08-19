Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.87400.1597843487055992250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 06:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uveSpUIN;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id x12so17726047qtp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 06:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NNADj0JfvBxMzXCvwbUQo0SJrIi71fUZTszL4gadsCs=;
        b=uveSpUINyv0WTcnNgeGdmkyP5UgkHyGPdw6Cmm8+gpHTuKSFflcfkLCGiTJIiGv1LQ
         wk6OP892tNUjEI3kJD2bqngAiu5HYgciIH8s7sh/zL1brQrUzQtwJsYo0aJlHIFUjaHC
         rvYMEElXR4qQeBAHzkbi2PDf9dGRVZ4GJnRptXnGJRIdeL6BlXJ2dWF6yOw8ouyFStIW
         /0mq70i/tLPleBbXMl9QyyWT/lTvoLalRQVwAAim+U2damKuVKZvT987iMx8343wGfww
         19W9A5rlNw7kDqeTFqrgHF5WEn1BXU6nv9msBESvaGuVVOqGft1+BkyydgrqZ0/h9Z5e
         ElLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NNADj0JfvBxMzXCvwbUQo0SJrIi71fUZTszL4gadsCs=;
        b=LfZWs/um+M0BEQeOc6pbEe3yIgXO6c2ACSM5JKlMOY/ENb/mq3hHY7/uTMTaiiQ7xD
         rNVT555it6cgnpkFcAqiUeQEkIoemRw+50SGaWkp0eqLQW+BdA0VZINx1VY0TrK5/a5Y
         ejoIwMEhKLESpi6Ur1NfdR3Ko+CQVp1Eh8QatGtnxiTyCPxPepoDoBThtHuVfSn2/UO1
         5zAdcBM1a7wG5TxfCEgJ6a1NTLHH9m+L+lptU9KojyEPWic9nz6zMp+GAaBy2KySQ27l
         h3kRtyDUuQmSKET921NYd7EZdw/aLZf64zkZFm8PoyVRBM1xmzsGiPLnp0M89rVj1dNN
         hfEA==
X-Gm-Message-State: AOAM532NE5Hm+aTHMeWgczhiuqZmsI8bnEhNCqhTMP9lbsJ79Suuooh8
	kfZyUDkOjJPKQuPM5uFL9XXI/BJ2fYCfA6BT
X-Google-Smtp-Source: ABdhPJwaeYwImsalb7fDp65Qe5YtAfvfuZ+up91yoImoxB0Db9s2O+YGq7deblVvgbuvlN1Pw5wHbQ==
X-Received: by 2002:aed:364a:: with SMTP id e68mr21849957qtb.260.1597843486109;
        Wed, 19 Aug 2020 06:24:46 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t93sm26873088qtd.97.2020.08.19.06.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 06:24:45 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] libc-headers: update to v5.8
Date: Wed, 19 Aug 2020 09:24:39 -0400
Message-Id: <2b3cbb8479c1db3c212c01eb3a0c699d9613dd11.1597843173.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597843173.git.bruce.ashfield@gmail.com>
References: <cover.1597843173.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the libc-headers to v5.8. Adjustments to the recipe
include:

The license checksum. Needs to be updated to account for kernel
commit 74835c7db0322b [COPYING: state that all contributions really are
covered by this file].

And the ARM multilib headers need to check the version to adjust for
kernel commit: 541ad0150ca4 [arm: Remove 32bit KVM host support]. We
don't want to break potential other libc-header users, so we check
the version and continue to install the file if the version is less
than v5.8

One patch is refreshed to remove fuzz when building musl.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc      |  2 +-
 .../linux-libc-headers/linux-libc-headers.inc    | 16 ++++++++++++++--
 ...de-linux-stddef.h-in-swab.h-uapi-header.patch | 10 ++++------
 ...-headers_5.4.bb => linux-libc-headers_5.8.bb} |  6 ++++--
 4 files changed, 23 insertions(+), 11 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.4.bb => linux-libc-headers_5.8.bb} (71%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d5e0e9ebbb..4f29d00e99 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.35%"
 GDBVERSION ?= "9.%"
 GLIBCVERSION ?= "2.32"
-LINUXLIBCVERSION ?= "5.4%"
+LINUXLIBCVERSION ?= "5.8%"
 QEMUVERSION ?= "5.1%"
 GOVERSION ?= "1.14%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 20139a8497..b1cb553c75 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -30,7 +30,7 @@ LICENSE = "GPLv2"
 #
 # -- RP
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LIC_FILES_CHKSUM ?= "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 RECIPE_NO_UPDATE_REASON = "Recipe is updated through a separate process"
 
@@ -46,6 +46,9 @@ python __anonymous () {
         d.setVar("HEADER_FETCH_VER", "2.6")
 }
 
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2).split('.')[0]}"
+MIN_VER = "${@oe.utils.trim_version("${PV}", 2).split('.')[1]}"
+
 inherit kernel-arch pkgconfig multilib_header
 
 KORG_ARCHIVE_COMPRESSION ?= "xz"
@@ -83,7 +86,16 @@ do_install_append_armeb () {
 }
 
 do_install_armmultilib () {
-	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
+	if [ ${MAJ_VER} -gt 5 ]; then
+		ARM_KVM_HEADER=""
+	else
+		if [ ${MAJ_VER} -eq 5 ] && [ ${MIN_VER} -ge 8 ]; then
+			ARM_KVM_HEADER=""
+		else
+			ARM_KVM_HEADER="asm/kvm.h"
+		fi
+	fi
+	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h $ARM_KVM_HEADER asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
 	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
 }
 
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
index 9d17daa70f..5b7c1b6e21 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
@@ -1,4 +1,4 @@
-From 9708dc74d9f49488d669e070982f6224a888d61a Mon Sep 17 00:00:00 2001
+From dc221138c809125dc1bbff8506c70cb7bd846368 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Sep 2018 17:08:58 -0700
 Subject: [PATCH] include linux/stddef.h in swab.h uapi header
@@ -23,12 +23,13 @@ Cc: Philippe Ombredanne <pombredanne@nexb.com>
 Cc: Kate Stewart <kstewart@linuxfoundation.org>
 Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 Cc: Thomas Gleixner <tglx@linutronix.de>
+
 ---
  include/uapi/linux/swab.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
-index 23cd84868cc3..acddbe50a20d 100644
+index 7272f85d6..2912fe463 100644
 --- a/include/uapi/linux/swab.h
 +++ b/include/uapi/linux/swab.h
 @@ -3,6 +3,7 @@
@@ -37,8 +38,5 @@ index 23cd84868cc3..acddbe50a20d 100644
  #include <linux/types.h>
 +#include <linux/stddef.h>
  #include <linux/compiler.h>
+ #include <asm/bitsperlong.h>
  #include <asm/swab.h>
- 
--- 
-2.19.0
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb
similarity index 71%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb
index 8a12103ee5..d76a8a36f8 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb
@@ -12,5 +12,7 @@ SRC_URI_append = "\
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
 "
 
-SRC_URI[md5sum] = "ce9b2d974d27408a61c53a30d3f98fb9"
-SRC_URI[sha256sum] = "bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+SRC_URI[md5sum] = "0e5c4c15266218ef26c50fac0016095b"
+SRC_URI[sha256sum] = "e7f75186aa0642114af8f19d99559937300ca27acaf7451b36d4f9b0f85cf1f5"
-- 
2.19.1

