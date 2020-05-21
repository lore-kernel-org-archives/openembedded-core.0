Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.9446.1590077759973982789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 09:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aoJ83OmC;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id n18so3547194pfa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZbfDmjGNXxWki3boPof8tGRfxuPB94PRKJs3k6WV4mY=;
        b=aoJ83OmCc1MkDYV/JBP33OSPXww2Ls7rx2iY88sEOHJKK2hQR3CaXg/WsYGS5Tgj/e
         8k1/82npJkSWkcYL2u04pxPI73ZuKLwxIOLdwbOvLSWvVbxCCY8ClE0ociNjDpB511Ho
         RdjmXjjb6z4ItS1AaO/5GkAUhPaMFlfHG7LtrlsxvzY5G/JZ0dzJpS3LJAOLgpZuR0u2
         qfCPkgBOD1gM9Sb8Rh/YPBjVjemK6f2vTtqCAxKINXyVXGrodLWKYZnOAj/LLVxcZqyH
         XWaFLJEKowImEpR6WKIIuVW1TFMEmj9l6m8Sx2bPb27/JRjN71DtS4n62TdHSITHTsh5
         X7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZbfDmjGNXxWki3boPof8tGRfxuPB94PRKJs3k6WV4mY=;
        b=uEOE58cgQM2N3327zk5sYZ3J27LVOdBB98n1LFFG81W0spaiBJW5/qPXKf7PgpxNpu
         w0WRqPB3/CcE0fNQjzMVs82tnI1U3GtwPY2B4qK7ES4RmF8WGOxS7K0DkKj8EdwnW/Pz
         BleliOTfpP0pBU2dNBEP/OroPLlvb8yjhMaUR/8+JGp0+GCRe92yO+luy8UBUVdnZrxM
         qbNc3YcEJjQbTu1Mtsdn4EWJrfSkVXSl63mc0T82pWKxqz1fjmeT8NSVSeo/PuqMavAy
         YmLgCLqNeZ8Uqip5E8Zj/3z7bACg2SlIAPsoDBUAhnrfB0YqdXVsTHGN0DlogKSZxc3V
         3nDw==
X-Gm-Message-State: AOAM533HLx29B7+jUz8GnMr6Ql2d6p+r1GbO08BIACg63GPyw1R2JNMt
	+B+FzuM2ukmiml98qjU898ciM5WehmQ=
X-Google-Smtp-Source: ABdhPJy/nwhJKjkFsBzFvqgarNK8DYPyXwO6AShEGKyNKNPAKgDFcyUyHUcHD3Sj24Vj2Hw1X4RH/g==
X-Received: by 2002:a62:6dc3:: with SMTP id i186mr9550898pfc.273.1590077759051;
        Thu, 21 May 2020 09:15:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r24sm3636427pgm.25.2020.05.21.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:15:58 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][ 09/10] gcc: Do not set -march for arm64 for libatomic
Date: Thu, 21 May 2020 09:15:42 -0700
Message-Id: <20200521161543.3273063-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521161543.3273063-1-raj.khem@gmail.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libatomic has mind of its own when it comes to setting -march for arm64
which conflicts with -mcpu option we pass from environment in some cases
since we always pass -march/-mcpu in OE, its safe to remove this option

mcpu removal from cortex-a55 is no longer needed since the option
conflict is now removed from libatomic instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
 ...omic-Do-not-enforce-march-on-aarch64.patch | 42 +++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  4 --
 3 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0039-libatomic-Do-not-enforce-march-on-aarch64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index b0411078d3..c9eab911d3 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -67,6 +67,7 @@ SRC_URI = "\
            file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
            file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
+           file://0039-libatomic-Do-not-enforce-march-on-aarch64.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0039-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc-9.3/0039-libatomic-Do-not-enforce-march-on-aarch64.patch
new file mode 100644
index 0000000000..fecb562f51
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0039-libatomic-Do-not-enforce-march-on-aarch64.patch
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
index d9a4e483cc..ace706dbf4 100644
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

