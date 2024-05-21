Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08344C25B78
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 15:12:26 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.22266.1716304343335654305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 08:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y1Gxusti;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f453d2c5a1so1588720b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716304342; x=1716909142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUtOEjd3gIC8ARANVjwa0BcyYyCVvFmRpj/V2LmkZWU=;
        b=Y1GxustihDXew+YVDiaO09LB0MeqdxV2oCyvrUXKVS+b/44UwwKbzxAJnFoC/HAZ4l
         jng8rpucu7Qz+3hX3TUAlbG45GNpPZ62LwZOB1fAcQxUtMhbzOVLI13Qdm6eWXKExe1T
         CSFmfk+EFNfcT6oHQVczB2Gls7t2yOyH934sX+Wo4kuwogl86w1HjvgtjTs/x/cAi3MH
         wnNBtZX7GDQuTaF46DDVMRN4l60KrNh8kQ3nHwqf4dGfLLeGBK/zwrlWxyCeHgqU+uQb
         g63im2wsckrSuGkNdPeGPFyjdEwK6vPwAsIoMP3Rmz7QiuGH8mY5d6aaP6zUpbZUP2+J
         l8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716304342; x=1716909142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUtOEjd3gIC8ARANVjwa0BcyYyCVvFmRpj/V2LmkZWU=;
        b=LGZ21aQvZgLLoirfujix5lnXsbgZ+1cHntGCTfih0bkkvo+hXp2TfQVmiP1lnwPLBe
         u3BS4pQktd6c+wD1CZj4j91nY0Oe4i0SoVEQD7maCaNskhCgiymGNCQciqWAXOyJTi+Y
         qaXpNLfUwWhNYD5IplYWnDTIJzF4a04qibGlyI/fqXJw8CUQsf67d5keml1jVh6azgVl
         3oz6ukNUWxo6MjzjDLrkyhWJMLeYUBBxqlOPRs2bdhHvcOimbD8LdUUuwgUOSnVO8Z2I
         ljqvBnVJPqBFKKtKZeIttR8fXpZf8hCUJDKCVApJ7j3oxaxqsIoQoJPXXo5ni1sUm0sa
         K5Gw==
X-Gm-Message-State: AOJu0YxjOWArTo0JCN2OLXGf2mjS0uj2Ul+sPmzUYeXVlrEFmmmQwCTR
	66cztahPMqa2bIdRczyD6Pa+tqsrh+fZX7nhE5dDC6onDrDF05TJOssEIsvBDNs=
X-Google-Smtp-Source: AGHT+IGj6/wg1jYBpcjqW6ZDy0wPq4c6muYVnMwFdtOwW+nUoDvNCptauyaeroIDlB4HS4Gmz/ziOw==
X-Received: by 2002:a05:6a00:174c:b0:6f3:1be8:ab68 with SMTP id d2e1a72fcca58-6f4e0328d21mr42838611b3a.32.1716304342353;
        Tue, 21 May 2024 08:12:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2aa01dasm21441031b3a.92.2024.05.21.08.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 08:12:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] kexec-tools: Fix build with GCC-14 on musl
Date: Tue, 21 May 2024 08:12:18 -0700
Message-ID: <20240521151219.3169986-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 15:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199646

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


