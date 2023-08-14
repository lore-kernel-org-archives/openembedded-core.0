Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702E6C04A94
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 04:59:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.101170.1691989168067097502
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 21:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=D8apbzse;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bc6535027aso34186785ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691989167; x=1692593967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZM/1gXEt6mi2j4jP43gFyoU5k0AwAxRXF6SOWrlnq4=;
        b=D8apbzse5AMpX3w6hwV7EzFaESms8myyggI+4y8ozHiyxPRapeXQ/ulROvidIw4Bad
         LCq0iZ2zMyL8N41e9x2Zl8om7Po/jDnWzuHRMwC5gjHFuIkSeLU1MMsQwcBprDnInam5
         4vDmie9YUWrtWYt/i5ArHWiV5ipQeWHPOMboXcWHv9sGCBmil1IjyqWb1MUdzD/43Lzw
         RB6K3xmGc1VQ3MBjlNvlvBcXdAp7t9DVXNJNSyjXCCLOCwyubsFF4nv/f/crs+UEe6Jz
         RIzSIB9acFAQSqx6UWhesTgAudTk2EUzjows+qDKdVTEprcaDc+kT8eRfvW3mc9bB/ae
         9DLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691989167; x=1692593967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZM/1gXEt6mi2j4jP43gFyoU5k0AwAxRXF6SOWrlnq4=;
        b=Lm/MUx6kW0Dizrf7k87by/+4ObvBFC+KpefkNcmEf5OmB5c+fZdQSUvzh/0Ill6zx2
         Wk3M58YyKYXFpmKWeMoPLYtvLUP25yaK9vqhqOnEbmamMFBVlzhNWUIXY+ThqtejNx3c
         6a54/pVG4jqokg2IHh8VFUi5BEABNjUcw8xUSo+YQGk9V2w902R4TGSNyY5vrAb3Ybfe
         2utb5jC1OYJNovgdR2TXNFLUPDW9Y1h/55F/cCvkBBfYiVpHiG6IfWB9h8GnHs52EJYA
         rl6GMPVKKket0D+Xj/+pdvMoMqe0xNNUpJWavJq8pYeAVf9x86aDqDh9FoT3eKwRa4U5
         tebQ==
X-Gm-Message-State: AOJu0Yzb6IYeQFUCU2kq1HhsD3yCx6diABZDq3HsTmmEzyWleOikpaSZ
	zh3ZJjJM04N5DZp29l6G+q4h4pTjxtu6LA==
X-Google-Smtp-Source: AGHT+IElel6QV0GuUz9mT2+JKp1RYrRs5VElRh0ThVPwQETGVZhgwa6WCS5w0dYa4kZDV4351x212w==
X-Received: by 2002:a17:902:d507:b0:1b8:b5f8:c485 with SMTP id b7-20020a170902d50700b001b8b5f8c485mr10879268plg.50.1691989167245;
        Sun, 13 Aug 2023 21:59:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ec8c00b001b1a2c14a4asm8242336plg.38.2023.08.13.21.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:59:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 4/5] glibc: Fix SVE detection on aarch64
Date: Sun, 13 Aug 2023 21:59:20 -0700
Message-ID: <20230814045921.720515-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814045921.720515-1-raj.khem@gmail.com>
References: <20230814045921.720515-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 04:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185920

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Implemented new
v3: Rebase

 ...e-Pass-mcpu-along-with-march-to-dete.patch | 56 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.38.bb         |  2 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
new file mode 100644
index 00000000000..7be9fc981d6
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
@@ -0,0 +1,56 @@
+From d836f008a96aa9b2e88c7b394bfc110542e57176 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Aug 2023 09:34:50 -0700
+Subject: [PATCH] aarch64/configure: Pass -mcpu along with -march to detect sve
+ support
+
+SVE support logic in configure is rightly passing -march=<arch>+sve to
+compiler to override whatever user might have passed via environment,
+however GCC does not do as intended when -mcpu is part of environment
+compiler flags, then it overrides the -march computed from -mcpu and
+igonores other -march values so this test fails for lot of aarch64
+machines which pass -mcpu that does not support sve. This is seemingly a
+bug in GCC [1], until that is fixed we preempt -mcpu along with -march
+in the configure test itself. It does not change functionality and yet
+lets us through the GCC inconsistency.
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110901
+
+Upstream-Status: Inappropriate [Workaround for a GCC issue]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/aarch64/configure    | 2 +-
+ sysdeps/aarch64/configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
+index 5e91fab023..39dddc66d4 100644
+--- a/sysdeps/aarch64/configure
++++ b/sysdeps/aarch64/configure
+@@ -327,7 +327,7 @@ else $as_nop
+   cat > conftest.s <<\EOF
+         ptrue p0.b
+ EOF
+-if { ac_try='${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&5'
++if { ac_try='${CC-cc} -c -mcpu=generic+sve -march=armv8.2-a+sve conftest.s 1>&5'
+   { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
+index 8a708f2ef4..b6a146d2be 100644
+--- a/sysdeps/aarch64/configure.ac
++++ b/sysdeps/aarch64/configure.ac
+@@ -92,7 +92,7 @@ AC_CACHE_CHECK([for SVE support in assembler], [libc_cv_aarch64_sve_asm], [dnl
+ cat > conftest.s <<\EOF
+         ptrue p0.b
+ EOF
+-if AC_TRY_COMMAND(${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&AS_MESSAGE_LOG_FD); then
++if AC_TRY_COMMAND(${CC-cc} -c -mcpu=generic+sve -march=armv8.2-a+sve conftest.s 1>&AS_MESSAGE_LOG_FD); then
+   libc_cv_aarch64_sve_asm=yes
+ else
+   libc_cv_aarch64_sve_asm=no
+-- 
+2.41.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index c02730bcb58..32ccb888f0f 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -50,6 +50,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
+           file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
@@ -86,6 +87,7 @@ EXTRA_OECONF:append:x86 = " ${@bb.utils.contains_any('TUNE_FEATURES', 'i586 c3',
 EXTRA_OECONF:append:x86-64 = " --enable-cet"
 
 PACKAGECONFIG ??= "nscd memory-tagging"
+
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
 PACKAGECONFIG[memory-tagging] = "--enable-memory-tagging,--disable-memory-tagging"
 
-- 
2.41.0


