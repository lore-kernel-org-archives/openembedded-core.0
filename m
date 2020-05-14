Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.6607.1589432609689248210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 22:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O//nTgUo;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id b190so793285pfg.6
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 22:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d0CfAwfTkKj6r1IBSBT/edm/VdOwgQVTISCcVN2C+oY=;
        b=O//nTgUoj4L9uq27uNeAXaMcOjmXIxOXvsFfJcypa8itwg6RR6j5TIUT0XDGzKTilR
         XaByKMibXZOmhRfG9OjNaq9N0ED0j2gb0NBVA9Ur1g3Yq0KEtFgScrIQXwaAqjdFnZyO
         TB7d4H0Ki24lVrWrD81YQA6omj96bgrTT5M0Xqi5jirhx9hJ6j1t6ogTKwXult8+78Ch
         qAW0zcXTzgX8smSwA1iXAaME9e9AnKmXh4kTCvy3m2/iLIpCStcDCu7hb5guIBpsddXB
         dNG3Sm9ytfE4CYpcAuvKn8bYV/zm5lLfaQ/7VdHfivVgWaIdSprSKUdMII7rhtmM8Zgu
         jtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d0CfAwfTkKj6r1IBSBT/edm/VdOwgQVTISCcVN2C+oY=;
        b=p9iyBw+7KYv18Plo5GCkenujyPkSuaofTc5T6FWtEHLbjTmt6kqNk8re7BlTsvcwHi
         ywzWrzv4cSIjBbWnMBv5H248+qGFhp9sg0HYdS0Ik07Ld1iwI3dTIdBklY8oFt9rC2XC
         Ut7XLblmcTpm6mYRYn4enfp7bj83R7fKnsQMB9/ezqZQk5D1X+L6leu2jDrlGX4jClB0
         VKaHcBfbsWj6Rg+wi2d/WLyW1IfKhcq1QVinhfO3usMk7c+W1kUN2Hv01OZycRvO7ZpE
         a8HAjdrDdH81KeVry4oxznMGVlQlBVzV7gOv/iegBVJ8t15PjzW074sWYA2Cf8Sx+0Cb
         iK/A==
X-Gm-Message-State: AOAM533Uu44Gepw6DH4wMMTPMcM7P44MmS88CUgr9W5QnaMXqK89KFqP
	6E1yUkurn/R8sIoLAjwuB9UNYXei98s=
X-Google-Smtp-Source: ABdhPJzWWpNZvl2LKu68pfFjkoaqlZAivxZPBbw0NGmLoC7Rek2t7Ulze4ZxlpgH82vkeClsZjg56g==
X-Received: by 2002:a63:f809:: with SMTP id n9mr2555722pgh.355.1589432608793;
        Wed, 13 May 2020 22:03:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id z7sm1067649pff.47.2020.05.13.22.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:03:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] gcc: Do not set -march for arm64 for libatomic
Date: Wed, 13 May 2020 22:03:19 -0700
Message-Id: <20200514050321.1292228-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514050321.1292228-1-raj.khem@gmail.com>
References: <20200514050321.1292228-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libatomic has mind of its own when it comes to setting -march for arm64
which conflicts with -mcpu option we pass from environment in some cases
since we always pass -march/-mcpu in OE, its safe to remove this option

mcpu removal from cortex-a55 is no longer needed since the option
conflict is now removed from libatomic instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-10.1.inc        |  1 +
 ...omic-Do-not-enforce-march-on-aarch64.patch | 42 +++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  4 --
 3 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/0039-libatomic-Do-not-enforce-march-on-aarch64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devtools/gcc/gcc-10.1.inc
index 245f0a6fdb..82b5a20a42 100644
--- a/meta/recipes-devtools/gcc/gcc-10.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
@@ -66,6 +66,7 @@ SRC_URI = "\
            file://0036-Enable-CET-in-cross-compiler-if-possible.patch \
            file://0037-mingw32-Enable-operation_not_supported.patch \
            file://0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch \
+           file://0039-libatomic-Do-not-enforce-march-on-aarch64.patch \
 "
 SRC_URI[sha256sum] = "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"
 
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0039-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc-10.1/0039-libatomic-Do-not-enforce-march-on-aarch64.patch
new file mode 100644
index 0000000000..fecb562f51
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0039-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -0,0 +1,42 @@
+From 411fc85c14bb14b07c0db807c55d25ce3f3e507f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 May 2020 15:10:38 -0700
+Subject: [PATCH] libatomic: Do not enforce march on aarch64
+
+OE passes the right options via gcc compiler cmdline via TUNE_CCARGS
+this can conflict between -mcpu settings and -march setting here, since
+-mcpu will translate into an appropriate -march, lets depend on that
+instead of setting it explicitly
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libatomic/Makefile.am | 1 -
+ libatomic/Makefile.in | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
+index 133fbbca77e..ac1ca645876 100644
+--- a/libatomic/Makefile.am
++++ b/libatomic/Makefile.am
+@@ -125,7 +125,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix _$(s)_.lo,$(SIZEOBJS)))
+ ## On a target-specific basis, include alternates to be selected by IFUNC.
+ if HAVE_IFUNC
+ if ARCH_AARCH64_LINUX
+-IFUNC_OPTIONS	     = -march=armv8-a+lse
+ libatomic_la_LIBADD += $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS)))
+ endif
+ if ARCH_ARM_LINUX
+diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
+index a51807e95c9..97df2d7ff03 100644
+--- a/libatomic/Makefile.in
++++ b/libatomic/Makefile.in
+@@ -431,7 +431,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
+ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
+ 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
+ 	$(am__append_3) $(am__append_4)
+-@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv8-a+lse
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
+ @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
+ @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 38c1672876..e12c74613f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -18,10 +18,6 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
 EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 
-# cortex-a55 is ARMv8.2-a based but libatomic explicitly asks for -march=armv8.1-a
-# which caused -march conflicts in gcc
-TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc -mcpu=cortex-a55 -mcpu=cortex-a55+crc+crypto"
-
 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
-- 
2.26.2

