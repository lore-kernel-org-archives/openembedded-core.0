Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631F8C41513
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 14:59:27 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.746.1716476363236340478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 07:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BABUMjHK;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f472d550cbso3282071b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716476362; x=1717081162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUtOEjd3gIC8ARANVjwa0BcyYyCVvFmRpj/V2LmkZWU=;
        b=BABUMjHK7lExGpujPUz+KVXb7LXAnbejHJUXGHu9TaPSQmWgpixU6aqvHRWWtF6sP/
         bl3oilivbF1aNi+2iTHD9x6vP8dfZd1iRH8oUwXKZ2DXasphME2RHs58NxyuNuES2rXG
         nNSSGeq/Ep5Uz67Dvva/C0vKOEkQT7TIiyDZ9Pr6+TPC54yRnPlXa1tA51OymxAMCgop
         rFtzRhimnRTwkbf3g7SjjJxzqQ8y4f1HwJVakuYZfO4L3sfFulOpipJpUz6qIg3Cu6mM
         eG+l5nF0pPgp3EK86pYQxKKc7QJpIb3LZ1uFyFTtu9dDkAxLT1JMIp63GG2ZyzEY/6p3
         7IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716476362; x=1717081162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUtOEjd3gIC8ARANVjwa0BcyYyCVvFmRpj/V2LmkZWU=;
        b=OS42aGIRyHe0oaxVg4XPMsG5wnnuE/D5v93ASt8tXOyjscghXd8MFpwYW3i2txNDgG
         503hB0H9Av2bIEkl6hM/mpt5s/XJ7AYLYG1jPer9vw3ZF0qInAtJTC731Lu0VjADZvfm
         nWKMADBjN7jAAEikoMQoqzwVejeOUeaYb2fx4IgtotSbv4qc4zCPpJpWn0S0Y4E3V8T2
         KJHm1MpMHvT7/z3b7C8D7D9OG3zYpUuWFos188tSTEO503QKt1bkAljoK4YJlY/vXPmQ
         BKd6piQDpyJoOaL7kUtdf7UophRDM2f/bHUR9tfZEtk97YvGDR5tU+M7gtkBaxgcqecV
         eksA==
X-Gm-Message-State: AOJu0YyWMV+wLelECwsM9VJuX7hPJNAaijy2T2cm7ZO9DG1NmxFXL33o
	tGTwM/7M6z8XZKBkxi6CHTD8jtpKIeW1IJONNqaeY2pqAdEEylim5nENorgTL9w=
X-Google-Smtp-Source: AGHT+IGIAJ+sFqPf2RjrGqxceR9IfTccNDJ2iMVCV1bK9hndEoapE/OWHp4opZWfF+nrcNsjft2kbA==
X-Received: by 2002:a05:6a00:1912:b0:6ed:de30:9e43 with SMTP id d2e1a72fcca58-6f6d61e1b44mr6671370b3a.32.1716476362315;
        Thu, 23 May 2024 07:59:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2aa017dsm24850591b3a.96.2024.05.23.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 07:59:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] kexec-tools: Fix build with GCC-14 on musl
Date: Thu, 23 May 2024 07:59:17 -0700
Message-ID: <20240523145918.3026627-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 14:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199806

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


