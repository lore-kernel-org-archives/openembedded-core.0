Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50350D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5032.1768910966222231428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E+zjqRE3;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-432d2670932so4177373f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910964; x=1769515764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TmxnCY+uv1HH1UjkTtuTo8cdB4lEi6OOGqCQWqqTJc=;
        b=E+zjqRE3+9+xiLoRjlCQt5JfAQKE7phrrlvs/ebi0D84s55TJlxXvYHfovlHIKTnjb
         7QuIkOMZDqoki88E9/NkqGOXIeNT3QpkifJt79W5SDPVBEKsy2mQLe++/uAQ/Wt1yhxV
         kxUh4LDpBZcU1svAR0rHnBleIlp4q3ypsFjQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910964; x=1769515764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TmxnCY+uv1HH1UjkTtuTo8cdB4lEi6OOGqCQWqqTJc=;
        b=BL+yaNH13v6BfrGtEwLnHKkgf7uzqbeJXdx/+PS7KAQPUld3X902ZXCb+WRKtWhGHv
         BP+Ul669hhOEew6m2HjBrezvfg64qLso3gnCpwjv0S0ohZzddFzhFdU5CTuHo9BxOH+a
         Cd8qCmWjy7Z6yRb+Wpv281XANbz8LL9TU/g8l5B7M12TfPecRO4H+mhXs6ZykVBvEv6/
         W6s4PqXN2d/Jt5JiGCt9CdekXeD9KHVvuNNmPNzeiu08AdqQFyPJlWZ9eGkOT9bpTu1H
         jYtdj+qHTzGJPuvpXFeRITglG48seLIScHS6rWKhd6rY7QXcs6FWdz5PCMd35j6GieZu
         cs7w==
X-Gm-Message-State: AOJu0YzIi9yMFv6RZ6lqw9bR8EUCveqkvbZU4CpFt2TzsSpyB5Q8FWUA
	q7+8o8Dos/tn4xqEVPMf5XcYWA0spXLkUqMAPXuU4hyQ7vYCDhDbxWQZKlZY8CoJbol7nAb3sXv
	2DS0S
X-Gm-Gg: AZuq6aKF3RPdiMUysV1iOKp5SeyfLBqgc4zhbOl+BLbFEu5f0RbIBJ+xRGZZD6sAY3B
	OHYdH3KMpT+WbZAN2KvYF6xpiEE7BwiPks1YqvHI5BPFvHZwMqEJL5tQT50geps7QbTUYUqvMGY
	CgZx4jk1SZjkLO0wPjZj5EBOg6rQkpg8gaq3Q/OMZFibhDXVpceLm6wkXMmxG9zOjz4Wtul3sUX
	RvmprFycsedv4QArf2mmBIFhR3/uLDMs5CznTlretkrTPpD8DzIoKa7KiASy9OkzvmBctDpC/bh
	YuT76OXwN6k8EtUKRrpnIiTTzhQRkDJT2VdffSapuSz77A53itN9l7iGKdsT6ipP/NhVRr8G4jF
	ukF3PYodgipxZfy5s1MAEY4pb44uVCXP7Q+Qiz2LaBgkWSLJkZ4m1aX/hrvDxLL3PfwZu68Vrgy
	8g5cYI48adHcMxcPIih/zAlZVzd7kYP7G+qBf/hY8SD6OoZjudP0RKMCsjlfcYMtkmPvrVzl/Oy
	J5hGUk2qBMBwOVS+eHVfA==
X-Received: by 2002:a05:6000:40cb:b0:432:a9db:f9a2 with SMTP id ffacd0b85a97d-43569bc48a9mr21061686f8f.41.1768910964297;
        Tue, 20 Jan 2026 04:09:24 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/22] pseudo: Upgrade to version 1.9.1
Date: Tue, 20 Jan 2026 13:08:31 +0100
Message-ID: <d324c4417ca8a7dcd59060d7ccec4551144fc371.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229695

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This brings in:
 * nftw, nftw64: add wrapper
 * ftw, nftw, ftw64, nftw64: add tests
 * Move ftw and ftw64 to calling ntfw and nftw64
 * makewrappers: Introduce 'array' support
 * pseudo_util.c: Avoid warning when we intentionally discard const
 * pseudo_client.c: Fix warning
 * yocto-older-glibc-symbols.path: Add as a reference patch
 * pseudo/pseudo_client: Add wrapper functions to operate correctly with glibc 2.38 onwards
 * configure: Prune PIE flags
 * test/test-parallel-rename.sh: Add parallel rename test
 * test/test-parallel-symlinks.sh: Add parallel symlink test
 * ports/linux/guts: Add .gitignore to ignore generated files

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 994e508b2a0ede8b5cc4fe39444cf25dc9a53faf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-configure-Prune-PIE-flags.patch      | 44 -------------
 .../pseudo/files/glibc238.patch               | 65 -------------------
 .../pseudo/files/older-glibc-symbols.patch    |  4 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  4 +-
 4 files changed, 3 insertions(+), 114 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/glibc238.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch b/meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch
deleted file mode 100644
index 43504eaab9..0000000000
--- a/meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b5545c08e6c674c49aef14b47a56a3e92df4d2a7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 17 Feb 2016 07:36:34 +0000
-Subject: [pseudo][PATCH] configure: Prune PIE flags
-
-LDFLAGS are not taken from environment and CFLAGS is used for LDFLAGS
-however when using security options -fpie and -pie options are coming
-as part of ARCH_FLAGS and they get into LDFLAGS of shared objects as
-well so we end up with conflicting options -shared -pie, which gold
-rejects outright and bfd linker lets the one appearning last in cmdline
-take effect. This create quite a unpleasant situation in OE when
-security flags are enabled and gold or not-gold options are used
-it errors out but errors are not same.
-
-Anyway, with this patch we filter pie options from ARCH_FLAGS
-ouright and take control of generating PIC objects
-
-Helps with errors like
-
-| /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: pseudo_client.o: relocation R_X86_64_PC32 against symbol `pseudo_util_debug_flags' can not be used when making a shared object; recompile with -fPIC
-| /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: final link failed: Bad value
-| collect2: error: ld returned 1 exit status
-| make: *** [lib/pseudo/lib64/libpseudo.so] Error 1
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- configure | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure b/configure
-index e5ef9ce..83b0890 100755
---- a/configure
-+++ b/configure
-@@ -339,3 +339,5 @@ sed -e '
-   s,@ARCH@,'"$opt_arch"',g
-   s,@BITS@,'"$opt_bits"',g
- ' < Makefile.in > Makefile
-+
-+sed -i -e 's/\-[f]*pie//g' Makefile
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
deleted file mode 100644
index dfb5c283f6..0000000000
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-glibc 2.38 would include  __isoc23_strtol and similar symbols. This is trggerd by
-_GNU_SOURCE but we have to set that for other definitions. Therefore play with defines
-to turn this off within pseudo_wrappers.c. Elsewhere we can switch to _DEFAULT_SOURCE
-rather than _GNU_SOURCE.
-
-Upstream-Status: Pending
-
-Index: git/pseudo_wrappers.c
-===================================================================
---- git.orig/pseudo_wrappers.c
-+++ git/pseudo_wrappers.c
-@@ -6,6 +6,18 @@
-  * SPDX-License-Identifier: LGPL-2.1-only
-  *
-  */
-+/* glibc 2.38 would include  __isoc23_strtol and similar symbols. This is trggerd by
-+ * _GNU_SOURCE but we have to set that for other definitions. Therefore play with defines
-+ * to turn this off.
-+ */
-+#include <features.h>
-+#undef __GLIBC_USE_ISOC2X
-+#undef __GLIBC_USE_C2X_STRTOL
-+#define __GLIBC_USE_C2X_STRTOL 0
-+#undef __GLIBC_USE_ISOC23
-+#undef __GLIBC_USE_C23_STRTOL
-+#define __GLIBC_USE_C23_STRTOL 0
-+
- #include <assert.h>
- #include <stdlib.h>
- #include <limits.h>
-Index: git/pseudo_util.c
-===================================================================
---- git.orig/pseudo_util.c
-+++ git/pseudo_util.c
-@@ -8,6 +8,17 @@
-  */
- /* we need access to RTLD_NEXT for a horrible workaround */
- #define _GNU_SOURCE
-+/* glibc 2.38 would include  __isoc23_strtol and similar symbols. This is trggerd by
-+ * _GNU_SOURCE but we have to set that for other definitions. Therefore play with defines
-+ * to turn this off.
-+ */
-+#include <features.h>
-+#undef __GLIBC_USE_ISOC2X
-+#undef __GLIBC_USE_C2X_STRTOL
-+#define __GLIBC_USE_C2X_STRTOL 0
-+#undef __GLIBC_USE_ISOC23
-+#undef __GLIBC_USE_C23_STRTOL
-+#define __GLIBC_USE_C23_STRTOL 0
- 
- #include <ctype.h>
- #include <errno.h>
-Index: git/pseudo_client.c
-===================================================================
---- git.orig/pseudo_client.c
-+++ git/pseudo_client.c
-@@ -6,7 +6,7 @@
-  * SPDX-License-Identifier: LGPL-2.1-only
-  *
-  */
--#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <stdio.h>
- #include <signal.h>
diff --git a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
index c453b5f735..f42b32b8d9 100644
--- a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
+++ b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
@@ -28,10 +28,10 @@ diff --git a/Makefile.in b/Makefile.in
 @@ -120,7 +120,7 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o | $(BIN)
  libpseudo: $(LIBPSEUDO)
  
- $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS) | $(LIB)
+ $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o $(SHOBJS) | $(LIB)
 -	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
 +	$(CC) $(CFLAGS)  -Lprebuilt/$(shell uname -m)-linux/lib/ $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
- 		pseudo_client.o pseudo_ipc.o \
+ 		pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o \
  		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
  
 diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 87c62e0678..5e2a8bf328 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,8 +1,6 @@
 require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
-           file://0001-configure-Prune-PIE-flags.patch \
-           file://glibc238.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -14,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "28dcefb809ce95db997811b5662f0b893b9923e0"
+SRCREV = "3fac97341f0f8270ca28a91098d0a58ca306a6bd"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 

