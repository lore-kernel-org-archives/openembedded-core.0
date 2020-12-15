Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.8203.1608021304521972983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 00:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=jldu4/I7;
 spf=pass (domain: nathanrossi.com, ip: 209.85.215.193, mailfrom: nathan@nathanrossi.com)
Received: by mail-pg1-f193.google.com with SMTP id k65so4447674pgk.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 00:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=zXth5reNrrshrNbB1/P5nYhyCbObjaH44iAvZwulEBY=;
        b=jldu4/I774/PQsLI5DTJ7t1rTIsYLQ2hdp4dppxzwU6eQ40/+nhs7oPdzOrEfS8wm0
         /dk0Arvo6Ra6owr7Xnb/T31UijwIFe/fjcf3G7na/9D95Q1L7KmkAb3ABg9yut5qJg8w
         W6Hl40MUTz+zqNkTHhGZYbgt9n/nbGsXWrviQ4lRWWo4mecjkWk2mUVn10ilz7w0IxKt
         Ri66EHFOUXT11wocnROKIBowS2Al6cZE6eylEetJgYf4qfW3Yl9XarwabH9RTKA+WYjd
         EhR4o6Z3CVh2RKYussFEIXA4lReDig9XHbg8doMdDsdp8FeA2ACJdcKTzMQNsZmjYVpF
         DJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=zXth5reNrrshrNbB1/P5nYhyCbObjaH44iAvZwulEBY=;
        b=gdHGKXZD0ZoG1iP2xbyQXEEHj048nNlC+rSvDhXB2klxjaalTovXQHbEIZ+bVtv1yP
         fCE9fg+z9Ql34TMl3jHqfJ/m2lZssLPKXbVMXlMBg7LGxvu1061kn+Aatfymp8NQe910
         0amZhW0V1FSXJJS1iPm3Y9PqpkXWUpZ6DtV7wk+Adbuthwsp/eHSwZY/vMQRQprX51Ea
         U7sGEcTvtm3+UkUdARQ1AGi+xRl8SxYRYqp0yNC55tR0zlIhxQs21uMSFuh0ReRInj5G
         BRu1Dj/rrByQ1gIJ/nwdjtax/AyHxt/fcFIxd4trM78Btft//9X0qIpT/PyF4X6V9kOZ
         v64Q==
X-Gm-Message-State: AOAM533KEvdjeFqLAW86xcI62ue0t7Ql8akgaXMEkep6mv2ajW9WDQa0
	GkgRyIqDK/EolcLYrX+aX/GQfw==
X-Google-Smtp-Source: ABdhPJyHOtHuqZ40SxrgxC0aeVAddh1bdIjtNntglZ0RIK3j5BP103cLwAzLw3keR228WxiU4+Dq7A==
X-Received: by 2002:a05:6a00:16c4:b029:198:a95:a2ef with SMTP id l4-20020a056a0016c4b02901980a95a2efmr27364082pfc.43.1608021303902;
        Tue, 15 Dec 2020 00:35:03 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id w4sm21233308pjc.52.2020.12.15.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:35:03 -0800 (PST)
Date: Tue, 15 Dec 2020 08:34:58 +0000
Message-Id: <20201215083458.1360882-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] gcc: Add patch to resolve i*86 tune configuration overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

When compiling gcc-runtime for i686 libatomic, libgomp and libitm are
compiled with additional '-march' and '-mtune' overrides. This typically
does not cause build errors (e.g. core2-32 tune), and results in less
optimally tuned outputs. However with specific TUNE_CCARGS (e.g. has
'-mfpmath=sse' but not '-msse*'), the build errors with conflicting
'-mfpmath' options.

This is caused by gcc-runtime specific configure scripts and Makefile
options that override by adding additional '-march'/'-mtune' args. OE
builds gcc-runtime differently to other build systems, and provides
target specific arch/tune options directly. As such, this change adds a
patch for gcc to remove the specific cases where the args are added.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc             |   1 +
 .../gcc/0001-lib-Remove-i-86-march-overrides.patch | 113 +++++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index e88f2ade6d..1e69c91311 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
            file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
            file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
            file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
+           file://0001-lib-Remove-i-86-march-overrides.patch \
 "
 SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
new file mode 100644
index 0000000000..3f04e121ba
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
@@ -0,0 +1,113 @@
+From 3776789cde95916f95deef48acf9532b0ebf91ae Mon Sep 17 00:00:00 2001
+From: Nathan Rossi <nathan@nathanrossi.com>
+Date: Tue, 15 Dec 2020 11:43:36 +1000
+Subject: [PATCH] lib*: Remove i*86 march overrides
+
+OE does not pass the '--with-arch' option to gccs configure, as such
+some gcc-runtime libraries try to override the value of '-march' and
+'-mtune' which OE already provides. This causes conflicts with other
+i*86 instruction/architecture flags (e.g. -msse* and -mfpmath=*).
+Additionally this caused the following libraries to be built with less
+optimized tune configurations.
+
+Upstream suggests that this should be detecting or otherwise checking if
+the target supports the desired functionality before overriding.
+
+    https://gcc.gnu.org/legacy-ml/gcc-patches/2016-04/msg01344.html
+
+libatomic also overrides the '-march' specifically for IFUNC objects.
+OE already supplies the correct march flag, so remove setting.
+
+Upstream-Status: Inappropriate [OE Specific]
+Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
+---
+ libatomic/Makefile.am   | 1 -
+ libatomic/Makefile.in   | 1 -
+ libatomic/configure.tgt | 9 ---------
+ libgomp/configure.tgt   | 8 --------
+ libitm/configure.tgt    | 9 ---------
+ 5 files changed, 28 deletions(-)
+
+diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
+index ac1ca64587..5aa16e0699 100644
+--- a/libatomic/Makefile.am
++++ b/libatomic/Makefile.am
+@@ -133,7 +133,6 @@ libatomic_la_LIBADD += $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS))
+ libatomic_la_LIBADD += $(addsuffix _8_2_.lo,$(SIZEOBJS))
+ endif
+ if ARCH_I386
+-IFUNC_OPTIONS	     = -march=i586
+ libatomic_la_LIBADD += $(addsuffix _8_1_.lo,$(SIZEOBJS))
+ endif
+ if ARCH_X86_64
+diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
+index 97df2d7ff0..82c511d420 100644
+--- a/libatomic/Makefile.in
++++ b/libatomic/Makefile.in
+@@ -432,7 +432,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
+ 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
+ 	$(am__append_3) $(am__append_4)
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
+-@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
+ @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
+ libatomic_convenience_la_SOURCES = $(libatomic_la_SOURCES)
+ libatomic_convenience_la_LIBADD = $(libatomic_la_LIBADD)
+diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
+index 5dd0926d20..3cc41773c3 100644
+--- a/libatomic/configure.tgt
++++ b/libatomic/configure.tgt
+@@ -82,15 +82,6 @@ case "${target_cpu}" in
+ 	;;
+ 
+   i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
+ 	ARCH=x86
+ 	# ??? Detect when -march=i686 is already enabled.
+ 	try_ifunc=yes
+diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
+index 4790a31e39..46c4c958e6 100644
+--- a/libgomp/configure.tgt
++++ b/libgomp/configure.tgt
+@@ -72,14 +72,6 @@ if test x$enable_linux_futex = xyes; then
+     # Note that bare i386 is not included here.  We need cmpxchg.
+     i[456]86-*-linux*)
+ 	config_path="linux/x86 linux posix"
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	    fi
+-	esac
+ 	;;
+ 
+     # Similar jiggery-pokery for x86_64 multilibs, except here we
+diff --git a/libitm/configure.tgt b/libitm/configure.tgt
+index 04109160e9..3d78ea609d 100644
+--- a/libitm/configure.tgt
++++ b/libitm/configure.tgt
+@@ -59,15 +59,6 @@ case "${target_cpu}" in
+   arm*)		ARCH=arm ;;
+ 
+   i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
+ 	XCFLAGS="${XCFLAGS} -mrtm"
+ 	ARCH=x86
+ 	;;
---
2.29.2
