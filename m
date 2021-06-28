Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.5075.1624841091949310209
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 17:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: christophm30@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id nd37so26671097ejc.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 17:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IIJfSLpHIWFDXCXHqC5AyTGlL2jGPaRNO+huMytEIzk=;
        b=MG3tTtJI6y9u5za4RAAwO8OXOcOKVQoeBHZR/S7+8jOapJQwZXSfvhKynD7JL/t/+8
         ufrR/V62nxwgdaJzWmF4QpTUEv3nh8MRqfLTG164owOUEC2sFP3YjzdaxQDRFMr8IGWm
         fwFqwi6YcvHiwyY1CIOaX+c1ORA4iTbkga6DcgIVVNs5bVPdIJGQWERrWZq98uXRTzgL
         MGp1xx3XQIgxj1v8EJ4q1WbA5duM991qtv8GrHcpNLeems9sk5NgPA6u0ZF/+yB7AuRm
         AZ0p+TYvzPuEHhGHu1o3C1fEq39TVWC504kDBThTZI6OPKaWemFIe1ilcFROdafFk5u2
         KYGw==
X-Gm-Message-State: AOAM532y2GazEB+Yk5urTsoCT/ZbGLpQhWrlmpmaWF0MheEOh4JXlJJZ
	pK1jIhfTj1E9YX7on6CIH53OhvAuqEOPGQ==
X-Google-Smtp-Source: ABdhPJwkp7TSHvB78HUAW5FWfLpIADo7M8GN1bWcKqUX7jcANtCPMgZnWmDClYGUguY7L+ALkuVlYQ==
X-Received: by 2002:a17:906:b254:: with SMTP id ce20mr21826050ejb.480.1624841090103;
        Sun, 27 Jun 2021 17:44:50 -0700 (PDT)
Return-Path: <christophm30@gmail.com>
Received: from t14s.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id h14sm2661860ejl.118.2021.06.27.17.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 17:44:49 -0700 (PDT)
From: christophm30@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Christoph Muellner <cmuellner@linux.com>
Subject: [PATCH] ldconfig-native: Add RISC-V support
Date: Mon, 28 Jun 2021 02:44:46 +0200
Message-Id: <20210628004446.2045624-1-cmuellner@linux.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current version of ldconfig does not support RISC-V.
Let's add a patch, that adds the required constant definitions
(from upstream glibc) and the necessary case statements.

Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 .../add-riscv-support.patch                   | 79 +++++++++++++++++++
 .../glibc/ldconfig-native_2.12.1.bb           |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/add-riscv-support.patch

diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-riscv-support.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-riscv-support.patch
new file mode 100644
index 0000000000..fc41aee264
--- /dev/null
+++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-riscv-support.patch
@@ -0,0 +1,79 @@
+From fd50228cc213d2d87f5e3cf1f123acb3fda9b04e Mon Sep 17 00:00:00 2001
+From: Christoph Muellner <cmuellner@linux.com>
+Date: Mon, 28 Jun 2021 00:34:12 +0200
+Subject: [PATCH] ldconfig: Add RISC-V support
+
+ldconfig-native does not support RISC-V at the moment.
+Let's pull the reqired constants from upstream and add
+the required parsing code.
+
+Upstream-Status: Backport
+
+Signed-off-by: Christoph Muellner <cmuellner@linux.com>
+---
+ cache.c      |  6 ++++++
+ ldconfig.h   |  2 ++
+ readelflib.c | 10 ++++++++++
+ 3 files changed, 18 insertions(+)
+
+diff --git a/cache.c b/cache.c
+index c4f5411..a3b9e70 100644
+--- a/cache.c
++++ b/cache.c
+@@ -125,6 +125,12 @@ print_entry (const char *lib, int flag, unsigned int osversion,
+     case FLAG_AARCH64_LIB64:
+       fputs (",AArch64", stdout);
+       break;
++    case FLAG_RISCV_FLOAT_ABI_SOFT:
++      fputs (",soft-float", stdout);
++      break;
++    case FLAG_RISCV_FLOAT_ABI_DOUBLE:
++      fputs (",double-float", stdout);
++      break;
+     case 0:
+       break;
+     default:
+diff --git a/ldconfig.h b/ldconfig.h
+index 6a8a750..2e5e379 100644
+--- a/ldconfig.h
++++ b/ldconfig.h
+@@ -38,6 +38,8 @@
+ #define FLAG_ARM_LIBHF			0x0900
+ #define FLAG_AARCH64_LIB64		0x0a00
+ #define FLAG_ARM_LIBSF			0x0b00
++#define FLAG_RISCV_FLOAT_ABI_SOFT	0x0f00
++#define FLAG_RISCV_FLOAT_ABI_DOUBLE	0x1000
+ 
+ /* Name of auxiliary cache.  */
+ #define _PATH_LDCONFIG_AUX_CACHE "/var/cache/ldconfig/aux-cache"
+diff --git a/readelflib.c b/readelflib.c
+index 9ec0a54..a01e1ce 100644
+--- a/readelflib.c
++++ b/readelflib.c
+@@ -33,6 +33,10 @@
+ #define EM_AARCH64	183		/* ARM AARCH64 */
+ #endif
+ 
++#ifndef EM_RISCV
++#define EM_RISCV	243		/* RISC-V */
++#endif
++
+ #undef check_ptr
+ #define check_ptr(ptr)						\
+ do								\
+@@ -331,6 +335,12 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
+       /* see sysdeps/unix/sysv/linux/arm/readelflib.c */
+       *flag |= FLAG_AARCH64_LIB64|FLAG_ELF_LIBC6;
+       break;
++    case EM_RISCV:
++      /* RISC-V libraries are always libc.so.6+. */
++      /* NOTE: This does not correctly handle soft-float binaries */
++      /* see sysdeps/unix/sysv/linux/riscv/readelflib.c */
++      *flag |= FLAG_RISCV_FLOAT_ABI_DOUBLE|FLAG_ELF_LIBC6;
++      break;
+     default:
+       error(0, 0, "%s is a 64-bit ELF for unknown machine %lx\n",
+             file_name, (long)elf_header->e_machine);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
index 919d11417d..fd1630b73b 100644
--- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://endian-ness_handling_fix.patch \
            file://add-64-bit-flag-for-ELF64-entries.patch \
            file://no-aux-cache.patch \
+           file://add-riscv-support.patch \
 "
 
 PR = "r2"
-- 
2.31.1

