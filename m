Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBE9C25B7E
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:46 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.61051.1716212025839827582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T+mM1Hy+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f693fb0ab6so508458b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212025; x=1716816825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jdMLHUhpR3mNuGvSs8mznyuyTZ+Bqz+deWIwKfKvpg=;
        b=T+mM1Hy+DPHF2fSt/xOyliAs3RCKjMnoL5Rc0yR9kxHQTq92us6QNZQpWWKKTmobiq
         hAzVHhNEqI+3e+NuwusjBLO8sBBBRnbNG+qJ+CEwhd0rvsV2a1/bOVpwBNKSW4WNUCZA
         WS44+RV0p4v/A4PlvTjSBnr6X1CzndQmbV2QpJaMXpAnsmHTZNwcBBRSr6UsF8e1JbBX
         j1F9PqQZmGNq7xDQXdjw40Avtr6TCcGXg+V5n0jkpWtgycdqFjcattZw+Qka94IiI6Nl
         J592kGN+3HkljBUdoAJbwJnHkFnpkc6r5FwNOMdwlSXuwww196mEdI33LiJTg7GaH5XW
         Fsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212025; x=1716816825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jdMLHUhpR3mNuGvSs8mznyuyTZ+Bqz+deWIwKfKvpg=;
        b=gvd+0d/itOvCTsMwMOGnvu+RqiI4DzR2E+dAQrkWic8kMFchSdqJQgvipFXC/Let15
         MQyG4Z9tDdT9szl4Q4aBlGCs2KIoSh6uW0ZI0Qw0klxG853+i2Bx41+UuwSmJYpf2EKg
         y0sGKRho7diEZBVVsLI5mScNYOHrDcPE2ewW72JZYNK+5hCfheY1zadPpJwdP7J68DJe
         IHaUwr8HFjknNr8u3stmmieaX6EEqqQVufdk5hyWa+vkbvq7pkpZHteUeoDM3G4ixH6k
         m7UDzshZOKGYNnjEdOQrSomOMJH+qQxn4W3Kf7fMYYp0p1tmhX5Ll2WrgPNzJGYYkFpH
         DUeQ==
X-Gm-Message-State: AOJu0YyiZqn0sXn0jRqBNjHvqe7o08r+0HUhB99G70EtYUd2fzQFH3ri
	/vfF7wSslGcPSqRwTyy/HRT+7nklygk/CQPR7gLabETBxcpCuBuXpr4WwBZ3LJXWXy9zXGC4Cjr
	t
X-Google-Smtp-Source: AGHT+IH86hXPjgn8ZkiVvRKfLla6RBbakKlKuJZpn4pwl/iwXywO+ndgc9Q3bwGMt5LZtg+eO2mn0A==
X-Received: by 2002:a05:6a00:cc3:b0:6f3:ecdc:2248 with SMTP id d2e1a72fcca58-6f4e036b640mr30968882b3a.27.1716212025033;
        Mon, 20 May 2024 06:33:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/21] glibc: Update to latest on stable 2.39 branch
Date: Mon, 20 May 2024 06:33:16 -0700
Message-Id: <7f3e6019a902eb3dcee3798e9ea0f94865d51c7f.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199576

From: Peter Marko <peter.marko@siemens.com>

Adresses CVE-2024-2961

Remove backported patch included in hash update.

Changes:
31da30f23c iconv: ISO-2022-CN-EXT: fix out-of-bound writes when writing escape sequence (CVE-2024-2961)
423099a032 x86_64: Exclude SSE, AVX and FMA4 variants in libm multiarch
04df8652eb Apply the Makefile sorting fix
edb9a76e30 powerpc: Fix ld.so address determination for PCREL mode (bug 31640)
7b92f46f04 x86-64: Simplify minimum ISA check ifdef conditional with if
9883f4304c x86-64: Don't use SSE resolvers for ISA level 3 or above
9d92452c70 AArch64: Check kernel version for SVE ifuncs
395a89f61e aarch64: fix check for SVE support in assembler
b0e0a07018 aarch64/fpu: Sync libmvec routines from 2.39 and before with AOR
31c7d69af5 i386: Use generic memrchr in libc (bug 31316)
5d070d12b3 x86: Expand the comment on when REP STOSB is used on memset
6484a92698 x86: Do not prefer ERMS for memset on Zen3+
aa4249266e x86: Fix Zen3/Zen4 ERMS selection (BZ 30994)
5a461f2949 Add tst-gnu2-tls2mod1 to test-internal-extras
aded2fc004 elf: Enable TLS descriptor tests on aarch64
a8ba52bde5 arm: Update _dl_tlsdesc_dynamic to preserve caller-saved registers (BZ 31372)
15aebdbada Ignore undefined symbols for -mtls-dialect=gnu2
354cabcb26 x86-64: Allocate state buffer space for RDI, RSI and RBX
853e915fdd x86-64: Update _dl_tlsdesc_dynamic to preserve AMX registers
a364304718 x86: Update _dl_tlsdesc_dynamic to preserve caller-saved registers
7fc8242bf8 x86-64: Save APX registers in ld.so trampoline
983f34a125 LoongArch: Correct {__ieee754, _}_scalb -> {__ieee754, _}_scalbf
aad45c8ac3 powerpc: Placeholder and infrastructure/build support to add Power11 related changes.
ee7f4c54e1 powerpc: Add HWCAP3/HWCAP4 data to TCB for Power Architecture.
71fcdba577 linux: Use rseq area unconditionally in sched_getcpu (bug 31479)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8b0124782510389bdc376fab645a0920b3fb94c8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 ...e-Pass-mcpu-along-with-march-to-dete.patch | 62 -------------------
 ...ss.patch => 0023-qemu-stale-process.patch} |  0
 meta/recipes-core/glibc/glibc_2.39.bb         |  7 ++-
 4 files changed, 6 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
 rename meta/recipes-core/glibc/glibc/{0024-qemu-stale-process.patch => 0023-qemu-stale-process.patch} (100%)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 618a574566..4fc6986ffc 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "1b9c1a0047fb26a65a9b2a7b8cd977243f7d353c"
+SRCREV_glibc ?= "31da30f23cddd36db29d5b6a1c7619361b271fb4"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
deleted file mode 100644
index f6523c5498..0000000000
--- a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 73c26018ed0ecd9c807bb363cc2c2ab4aca66a82 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <szabolcs.nagy@arm.com>
-Date: Wed, 13 Mar 2024 14:34:14 +0000
-Subject: [PATCH] aarch64: fix check for SVE support in assembler
-
-Due to GCC bug 110901 -mcpu can override -march setting when compiling
-asm code and thus a compiler targetting a specific cpu can fail the
-configure check even when binutils gas supports SVE.
-
-The workaround is that explicit .arch directive overrides both -mcpu
-and -march, and since that's what the actual SVE memcpy uses the
-configure check should use that too even if the GCC issue is fixed
-independently.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=73c26018ed0ecd9c807bb363cc2c2ab4aca66a82]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Florian Weimer <fweimer@redhat.com>
----
- sysdeps/aarch64/configure    | 5 +++--
- sysdeps/aarch64/configure.ac | 5 +++--
- 2 files changed, 6 insertions(+), 4 deletions(-)
- mode change 100644 => 100755 sysdeps/aarch64/configure
-
-diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-old mode 100644
-new mode 100755
-index ca57edce47..9606137e8d
---- a/sysdeps/aarch64/configure
-+++ b/sysdeps/aarch64/configure
-@@ -325,9 +325,10 @@ then :
-   printf %s "(cached) " >&6
- else $as_nop
-   cat > conftest.s <<\EOF
--        ptrue p0.b
-+	.arch armv8.2-a+sve
-+	ptrue p0.b
- EOF
--if { ac_try='${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&5'
-+if { ac_try='${CC-cc} -c conftest.s 1>&5'
-   { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
-   (eval $ac_try) 2>&5
-   ac_status=$?
-diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 27874eceb4..56d12d661d 100644
---- a/sysdeps/aarch64/configure.ac
-+++ b/sysdeps/aarch64/configure.ac
-@@ -90,9 +90,10 @@ LIBC_CONFIG_VAR([aarch64-variant-pcs], [$libc_cv_aarch64_variant_pcs])
- # Check if asm support armv8.2-a+sve
- AC_CACHE_CHECK([for SVE support in assembler], [libc_cv_aarch64_sve_asm], [dnl
- cat > conftest.s <<\EOF
--        ptrue p0.b
-+	.arch armv8.2-a+sve
-+	ptrue p0.b
- EOF
--if AC_TRY_COMMAND(${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&AS_MESSAGE_LOG_FD); then
-+if AC_TRY_COMMAND(${CC-cc} -c conftest.s 1>&AS_MESSAGE_LOG_FD); then
-   libc_cv_aarch64_sve_asm=yes
- else
-   libc_cv_aarch64_sve_asm=no
--- 
-2.44.0
-
diff --git a/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch b/meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch
similarity index 100%
rename from meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
rename to meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 9122472689..988e43c014 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -16,6 +16,10 @@ CVE_STATUS[CVE-2019-1010025] = "disputed: \
 Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow \
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961"
+CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
+
 DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""
@@ -48,8 +52,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
-           file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
-           file://0024-qemu-stale-process.patch \
+           file://0023-qemu-stale-process.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1


