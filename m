Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404F4C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 04:36:45 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.5626.1715834196571528989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 21:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I8db+9x7;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2b387e2e355so5684985a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 21:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715834195; x=1716438995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUtOEjd3gIC8ARANVjwa0BcyYyCVvFmRpj/V2LmkZWU=;
        b=I8db+9x7OWokPVvaJRrVZ9wl4RubSFQJRCtqz0COwGn+fWV/1cTtm2LP3Wzf4cj0dw
         JElABXTCGCNfgVBh8sAwSm3mrZkaukKCTxCBW32sB60OgHQ+1weMl0eJJmw3ghvvrz8i
         4kWGXZF9fvTCFY1K1x/U3T5D3LhCyVfgryl65RV0Xh044ghc4Uqp3CN/v5nQ60kG8yYQ
         kYBNRL1p5MnSfCduZlnlgjrsH54ox4+RgsK4h6d0pd47Z33aSr6gJRF9RvNotLF06hgl
         E0DpR24BpBKsgtKIthSbXaDsgkOlxpwyi+GpVygMAOTqbhuCGunDzDVF00idjqC3FoDt
         WdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715834195; x=1716438995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUtOEjd3gIC8ARANVjwa0BcyYyCVvFmRpj/V2LmkZWU=;
        b=WASn0RjOIdGpWQ4qCZAtHBgfs1pBue7mAk1LSFwd/yNcC8veUvpQN2NZNsqNPCcCIH
         i3KVeIIKzenpEGKziOR4HlPftwJWblCK3TNuw17R1bQ1qjE2i1prxBl5TPtu+Nqdd5jJ
         +xAqhSlbYRhEnATZ10rj0hbkXeANx8y4L1r6TLRnvyiTtZgYU/9FcycepgqIHb6c1Kx3
         A2VHEYv6xoX8DXNPQaopKieHq9mhiKUtsCdDuEYvNohkaitmEhgXNX+78nxgPOBwp79a
         Etu/pCbs4JfQ0IoNu5WAVHtxAhJEJlAGkCm43Hnh49ZNT5zG7qyb54YTIQn+Ffchc5n9
         xixw==
X-Gm-Message-State: AOJu0YyjN2HXRLKhuvraB2HMRN3ZYGohCkfZSsb13mw3eevonwNr6CZd
	bvdhKTQ6oYvN8alPJ7wWsV1auSkk6NCgYP2Cpgm9Mb7XPU0/rycuMFBQXFSnHPc=
X-Google-Smtp-Source: AGHT+IFOF7QcR11Stf+cPFwIWdB5zadLpsjZRcBDwV/regokTgqV4wLMUhSprYuHZLVs5/yEJ/bfcw==
X-Received: by 2002:a17:90a:b38e:b0:2b1:82f5:278c with SMTP id 98e67ed59e1d1-2b6cc4502f4mr20712993a91.8.1715834195409;
        Wed, 15 May 2024 21:36:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6fff])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ea6ab8sm14545884a91.55.2024.05.15.21.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 21:36:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] kexec-tools: Fix build with GCC-14 on musl
Date: Wed, 15 May 2024 21:36:32 -0700
Message-ID: <20240516043632.4049196-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199436

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...linux-setup.c-Use-POSIX-basename-API.patch | 54 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.28.bb               |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
new file mode 100644
index 00000000000..e223f45998c
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
@@ -0,0 +1,54 @@
+From 32c8ffa7ace6f1b7e63f9ddffab00b00c36a7b57 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 May 2024 21:18:08 -0700
+Subject: [PATCH] x86-linux-setup.c: Use POSIX basename API
+
+Musl C library only supports POSIX basename function. while glibc has
+both GNU extention as well as POSIX basename implemented. Switch to
+using posix version, so it can work across musl and glibc
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18/GCC-14 flags the absense of prototype as error.
+therefore include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/kexec/2024-May/030034.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec/arch/i386/x86-linux-setup.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
+index 9a281dc..73251b9 100644
+--- a/kexec/arch/i386/x86-linux-setup.c
++++ b/kexec/arch/i386/x86-linux-setup.c
+@@ -14,6 +14,7 @@
+  *
+  */
+ #define _GNU_SOURCE
++#include <libgen.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -329,12 +330,14 @@ static int add_edd_entry(struct x86_linux_param_header *real_mode,
+ 	memset(edd_info, 0, sizeof(struct edd_info));
+ 
+ 	/* extract the device number */
+-	if (sscanf(basename(sysfs_name), "int13_dev%hhx", &devnum) != 1) {
++	char* sysfs_name_copy = strdup(sysfs_name);
++	if (sscanf(basename(sysfs_name_copy), "int13_dev%hhx", &devnum) != 1) {
+ 		fprintf(stderr, "Invalid format of int13_dev dir "
+-				"entry: %s\n", basename(sysfs_name));
++				"entry: %s\n", basename(sysfs_name_copy));
++		free(sysfs_name_copy);
+ 		return -1;
+ 	}
+-
++	free(sysfs_name_copy);
+ 	/* if there's a MBR signature, then add it */
+ 	if (file_scanf(sysfs_name, "mbr_signature", "0x%x", &mbr_sig) == 1) {
+ 		real_mode->edd_mbr_sig_buffer[*current_mbr] = mbr_sig;
+-- 
+2.45.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
index c39fff834d0..b60c51df4a1 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0005-Disable-PIE-during-link.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            file://Fix-building-on-x86_64-with-binutils-2.41.patch \
+           file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch \
            "
 
 SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
-- 
2.45.1


