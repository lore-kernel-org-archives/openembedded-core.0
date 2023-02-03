Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B963FC05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 22:54:22 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.25829.1675464859057095708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 14:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VxJab953;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id pj3so6478925pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 14:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XERFoA93PXSYXM5kreXaVkwmc+Nb63HKF11s92UjCZg=;
        b=VxJab953wAyHKLSsITjAm1vOJulZsgQ/1D/iQsrJcBbrvsz/YeqhSw/ciXVXPR6Lzv
         IgVfXf7c0/BDcn0KsMJY5P7x6y636asPNFpzBYi9lrCT6O5TTsm9z/5jjcHT3BXyQMmE
         P9WzhcJycFURriwTp50EAVXC15YHsJGgxl4l+VZSF5EDZFMyjsd3gTFvEz5TWUTax3zi
         XRPN6J5nNqOWyzwItwpfA/DA6wIUOv/nWeAugJ8GfkEeJG6LWxeUklk73WLAO1xtiuKw
         mTGLU4O2zgctH0W7Pjh785RxKPOybxGYS6ElEjyQKUeN6IccwV5RZFqnHXrEVzaUw7dV
         WahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XERFoA93PXSYXM5kreXaVkwmc+Nb63HKF11s92UjCZg=;
        b=2KL3ZtylEXEia+Ftiz333f4oZhZh08s2/bf1Je4lDHxQDCnMUfZZwpVqP/kb61qMj0
         bvqK+lWYdWFGRRlCTKi9NRf12jYXJGlgUAhnRiSHsVi6tAdU/prs6MvMtBm0TuwFkmbq
         UXDoXpRR2mSoVvnTJZhYYk2cmDnZzBX8ieGK4/RFbSpj8s0AhRR4Hwoqp29VlxZxwKly
         mk4jAyK2H0UeInqsHgweY36D6eSw2Wvgda6MKLtMKZOEuepxo3MLk3hdCus1ZWTsFO/9
         eYZq3Zk5aBHasMHJte+ilygOgvM5IwPZ3AVt2k3gwu3B7sJ9StkVBi7T2cBEnWRbce4a
         ftUw==
X-Gm-Message-State: AO0yUKWDLa1wJMuWfB/3ykXlP/NobdkwWAyaYDhy32/Q9zXCw54OMdNc
	gmj6yRg+4eCeABT94gGitSDVemnIUAU=
X-Google-Smtp-Source: AK7set+A58g6TIaAdeNJNXKIRggMD2lZd72CirGxWLu+i5K5z+hlUbJwNuJ9C0gF3vf0ArTyF6Q5ow==
X-Received: by 2002:a17:902:dac9:b0:198:f1d0:f9fd with SMTP id q9-20020a170902dac900b00198f1d0f9fdmr194174plx.27.1675464857275;
        Fri, 03 Feb 2023 14:54:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id g1-20020a170902fe0100b00198ef93d556sm217692plj.147.2023.02.03.14.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 14:54:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Upgrade to 2.37 release
Date: Fri,  3 Feb 2023 14:54:13 -0800
Message-Id: <20230203225414.698990-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 22:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176755

Details are here [1] and summary of changes is here [2]

[1] https://sourceware.org/glibc/wiki/Release/2.37
[2] https://sourceware.org/pipermail/libc-announce/2023/000035.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...2.36.bb => cross-localedef-native_2.37.bb} |   4 +-
 meta/recipes-core/glibc/glibc-common.inc      |   2 +-
 ...bc-locale_2.36.bb => glibc-locale_2.37.bb} |   0
 ...bc-mtrace_2.36.bb => glibc-mtrace_2.37.bb} |   0
 ...-scripts_2.36.bb => glibc-scripts_2.37.bb} |   0
 ...libc-tests_2.36.bb => glibc-tests_2.37.bb} |   0
 ...tsuite_2.36.bb => glibc-testsuite_2.37.bb} |   0
 meta/recipes-core/glibc/glibc-version.inc     |   6 +-
 ...fortify-symbol-for-64-bit-time_t-BZ-.patch | 528 ------------------
 ...dd-hardlink-resolver-from-util-linux.patch |   2 +-
 ...-fix-ups-hardlink-to-make-it-compile.patch |   2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |   4 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |   4 +-
 ...Raise-the-size-of-arrays-containing-.patch |  39 +-
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |   4 +-
 ...Make-relocatable-install-for-locales.patch |  10 +-
 ...Fall-back-to-faccessat-on-faccess2-r.patch |   4 +-
 ...the-path-sets-wrong-config-variables.patch |   6 +-
 ...ss-building-and-testing-instructions.patch |   2 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |   4 +-
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |   4 +-
 ...port-cross-locale-generation-support.patch |  24 +-
 ...-archive-uses-a-hard-coded-locale-pa.patch |   4 +-
 ...aybe-uninitialized-errors-with-Os-BZ.patch |  53 --
 ...o-not-ask-compiler-for-finding-arch.patch} |   2 +-
 ...RE_KNOWN_INTERPRETER_NAMES-to-known-.patch |  29 -
 ...-the-header-between-arm-and-aarch64.patch} |  24 +-
 ...-printf-builtin-in-nscd-init-script.patch} |   2 +-
 ...gure.ac-Set-libc_cv_rootsbindir-onl.patch} |   2 +-
 ...ll-interpreter-overridable-in-tzsel.patch} |  10 +-
 ...se-bin-sh-default-shell-interpreter.patch} |   2 +-
 ...-failed-in-unprivileged-process-BZ-.patch} |   4 +-
 ...uild-time-paths-in-the-output-binar.patch} |   6 +-
 .../glibc/glibc/0025-startup-Force-O2.patch   |  28 -
 .../glibc/{glibc_2.36.bb => glibc_2.37.bb}    |  20 +-
 36 files changed, 101 insertions(+), 736 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.36.bb => cross-localedef-native_2.37.bb} (94%)
 rename meta/recipes-core/glibc/{glibc-locale_2.36.bb => glibc-locale_2.37.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.36.bb => glibc-mtrace_2.37.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.36.bb => glibc-scripts_2.37.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-tests_2.36.bb => glibc-tests_2.37.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.36.bb => glibc-testsuite_2.37.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-Linux-Add-ppoll-fortify-symbol-for-64-bit-time_t-BZ-.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
 rename meta/recipes-core/glibc/glibc/{0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch => 0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch} (96%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
 rename meta/recipes-core/glibc/glibc/{0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch => 0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch} (72%)
 rename meta/recipes-core/glibc/glibc/{0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch => 0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch => 0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch => 0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch} (84%)
 rename meta/recipes-core/glibc/glibc/{0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch => 0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch => 0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch => 0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch} (88%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch
 rename meta/recipes-core/glibc/{glibc_2.36.bb => glibc_2.37.bb} (85%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 7cd0b004e9..9236f8bf37 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "12.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.40%"
 GDBVERSION ?= "12.%"
-GLIBCVERSION ?= "2.36"
+GLIBCVERSION ?= "2.37"
 LINUXLIBCVERSION ?= "6.1%"
 QEMUVERSION ?= "7.2%"
 GOVERSION ?= "1.19%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.36.bb b/meta/recipes-core/glibc/cross-localedef-native_2.37.bb
similarity index 94%
rename from meta/recipes-core/glibc/cross-localedef-native_2.36.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.37.bb
index f4ea76380e..e7261a644b 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.36.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.37.bb
@@ -30,8 +30,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0012-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0013-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
-           file://0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
+           file://0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
+           file://0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index fba172d968..a1a0a5feb1 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 #
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
-PV = "2.36"
+PV = "2.37"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.36.bb b/meta/recipes-core/glibc/glibc-locale_2.37.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.36.bb
rename to meta/recipes-core/glibc/glibc-locale_2.37.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.36.bb b/meta/recipes-core/glibc/glibc-mtrace_2.37.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.36.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.37.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.36.bb b/meta/recipes-core/glibc/glibc-scripts_2.37.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.36.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.37.bb
diff --git a/meta/recipes-core/glibc/glibc-tests_2.36.bb b/meta/recipes-core/glibc/glibc-tests_2.37.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-tests_2.36.bb
rename to meta/recipes-core/glibc/glibc-tests_2.37.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.36.bb b/meta/recipes-core/glibc/glibc-testsuite_2.37.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.36.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.37.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index bd125ec401..bf6a8c9bd4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
-SRCBRANCH ?= "release/2.36/master"
-PV = "2.36"
-SRCREV_glibc ?= "c399271c10bd00714504e8d4dfbec8aebf996dd4"
+SRCBRANCH ?= "release/2.37/master"
+PV = "2.37"
+SRCREV_glibc ?= "a704fd9a133bfb10510e18702f48a6a9c88dbbd5"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0001-Linux-Add-ppoll-fortify-symbol-for-64-bit-time_t-BZ-.patch b/meta/recipes-core/glibc/glibc/0001-Linux-Add-ppoll-fortify-symbol-for-64-bit-time_t-BZ-.patch
deleted file mode 100644
index 678dc2af2c..0000000000
--- a/meta/recipes-core/glibc/glibc/0001-Linux-Add-ppoll-fortify-symbol-for-64-bit-time_t-BZ-.patch
+++ /dev/null
@@ -1,528 +0,0 @@
-From 69318192d16adc7d57adcd69fbbb1e3e107b2783 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Fri, 4 Nov 2022 16:02:52 -0300
-Subject: [PATCH] Linux: Add ppoll fortify symbol for 64 bit time_t (BZ# 29746)
-
-Similar to ppoll, the poll.h header needs to redirect the poll call
-to a proper fortified ppoll with 64 bit time_t support.
-
-The implementation is straightforward, just need to add a similar
-check as __poll_chk and call the 64 bit time_t ppoll version.  The
-debug fortify tests are also extended to cover 64 bit time_t for
-affected ABIs.
-
-Unfortunately it requires an aditional symbol, which makes backport
-tricky.  One possibility is to add a static inline version if compiler
-supports is and call abort instead of __chk_fail, so fortified version
-will call __poll64 in the end.
-
-Another possibility is to just remove the fortify support for
-_TIME_BITS=64.
-
-Checked on i686-linux-gnu.
-
-Upstream-Status: Backport
-
-Signed-off-by: Ola Nilsson <olani@axis.com>
----
- debug/Makefile                                | 41 ++++++++++++------
- include/sys/poll.h                            |  5 ++-
- io/bits/poll2.h                               | 25 +++++++++++
- sysdeps/unix/sysv/linux/Versions              |  5 +++
- sysdeps/unix/sysv/linux/arm/be/libc.abilist   |  1 +
- sysdeps/unix/sysv/linux/arm/le/libc.abilist   |  1 +
- sysdeps/unix/sysv/linux/csky/libc.abilist     |  1 +
- sysdeps/unix/sysv/linux/hppa/libc.abilist     |  1 +
- sysdeps/unix/sysv/linux/i386/libc.abilist     |  1 +
- .../sysv/linux/m68k/coldfire/libc.abilist     |  1 +
- .../unix/sysv/linux/m68k/m680x0/libc.abilist  |  1 +
- .../sysv/linux/microblaze/be/libc.abilist     |  1 +
- .../sysv/linux/microblaze/le/libc.abilist     |  1 +
- .../sysv/linux/mips/mips32/fpu/libc.abilist   |  1 +
- .../sysv/linux/mips/mips32/nofpu/libc.abilist |  1 +
- .../sysv/linux/mips/mips64/n32/libc.abilist   |  1 +
- sysdeps/unix/sysv/linux/nios2/libc.abilist    |  1 +
- .../linux/powerpc/powerpc32/fpu/libc.abilist  |  1 +
- .../powerpc/powerpc32/nofpu/libc.abilist      |  1 +
- sysdeps/unix/sysv/linux/ppoll.c               |  3 +-
- sysdeps/unix/sysv/linux/ppoll_chk.c           | 42 +++++++++++++++++++
- .../unix/sysv/linux/s390/s390-32/libc.abilist |  1 +
- sysdeps/unix/sysv/linux/sh/be/libc.abilist    |  1 +
- sysdeps/unix/sysv/linux/sh/le/libc.abilist    |  1 +
- .../sysv/linux/sparc/sparc32/libc.abilist     |  1 +
- 25 files changed, 125 insertions(+), 15 deletions(-)
- create mode 100644 sysdeps/unix/sysv/linux/ppoll_chk.c
-
-diff --git a/debug/Makefile b/debug/Makefile
-index 456b349c4d..075a135a2b 100644
---- a/debug/Makefile
-+++ b/debug/Makefile
-@@ -120,8 +120,10 @@ CPPFLAGS-tst-read-chk-cancel.c += -D_FORTIFY_SOURCE=2
- # CFLAGS for the file.
- 
- tests-all-chk = tst-fortify
--tests-c-chk =
--tests-cc-chk =
-+tests-c-def-chk =
-+tests-cc-def-chk =
-+tests-c-time64-chk =
-+tests-cc-time64-chk =
- 
- CFLAGS-tst-fortify.c += -Wno-format -Wno-deprecated-declarations -Wno-error
- 
-@@ -130,11 +132,11 @@ define cflags-default
- endef
- 
- define cflags-lfs
--CFLAGS-tst-fortify-$(1)-lfs-$(2).$(1) += -D_FILE_OFFSET_BITS=64
-+CFLAGS-tst-fortify-$(1)-lfs-$(2)-$(3).$(1) += -D_FILE_OFFSET_BITS=64
- endef
- 
- define cflags-nongnu
--CFLAGS-tst-fortify-$(1)-nongnu-$(2).$(1) += -D_LARGEFILE64_SOURCE=1
-+CFLAGS-tst-fortify-$(1)-nongnu-$(2)-$(3).$(1) += -D_LARGEFILE64_SOURCE=1
- endef
- 
- src-chk-nongnu = \#undef _GNU_SOURCE
-@@ -145,12 +147,12 @@ src-chk-nongnu = \#undef _GNU_SOURCE
- # And they also generate warnings from warning attributes, which
- # cannot be disabled via pragmas, so require -Wno-error to be used.
- define gen-chk-test
--tests-$(1)-chk += tst-fortify-$(1)-$(2)-$(3)
--CFLAGS-tst-fortify-$(1)-$(2)-$(3).$(1) += -D_FORTIFY_SOURCE=$(3) -Wno-format \
-+tests-$(1)-$(4)-chk += tst-fortify-$(1)-$(2)-$(3)-$(4)
-+CFLAGS-tst-fortify-$(1)-$(2)-$(3)-$(4).$(1) += -D_FORTIFY_SOURCE=$(3) -Wno-format \
- 					  -Wno-deprecated-declarations \
- 					  -Wno-error
--$(eval $(call cflags-$(2),$(1),$(3)))
--$(objpfx)tst-fortify-$(1)-$(2)-$(3).$(1): tst-fortify.c Makefile
-+$(eval $(call cflags-$(2),$(1),$(3),$(4)))
-+$(objpfx)tst-fortify-$(1)-$(2)-$(3)-$(4).$(1): tst-fortify.c Makefile
- 	( echo "/* Autogenerated from Makefile.  */"; \
- 	  echo "$(src-chk-$(2))"; \
- 	  echo "#include \"tst-fortify.c\"" ) > $$@.tmp
-@@ -159,19 +161,29 @@ endef
- 
- chk-extensions = c cc
- chk-types = default lfs nongnu
-+# 64 bit time_t implies LFS.
-+chk-types-time64 = default nongnu
- chk-levels = 1 2 3
- 
- $(foreach e,$(chk-extensions), \
-   $(foreach t,$(chk-types), \
-     $(foreach l,$(chk-levels), \
--      $(eval $(call gen-chk-test,$(e),$(t),$(l))))))
-+      $(eval $(call gen-chk-test,$(e),$(t),$(l),def)))))
- 
--tests-all-chk += $(tests-c-chk) $(tests-cc-chk)
-+tests-all-chk += $(tests-c-def-chk) $(tests-cc-def-chk)
-+
-+$(foreach e,$(chk-extensions), \
-+  $(foreach t,$(chk-types-time64), \
-+    $(foreach l,$(chk-levels), \
-+      $(eval $(call gen-chk-test,$(e),$(t),$(l),time64)))))
-+
-+tests-all-time64-chk += $(tests-c-time64-chk) $(tests-cc-time64-chk)
- 
- define link-cc
- LDLIBS-$(1) = -lstdc++
- endef
--$(foreach t,$(tests-cc-chk), $(eval $(call link-cc,$(t))))
-+$(foreach t,$(tests-cc-def-chk), $(eval $(call link-cc,$(t))))
-+$(foreach t,$(tests-cc-time64-chk), $(eval $(call link-cc,$(t))))
- 
- # backtrace_symbols only works if we link with -rdynamic.  backtrace
- # requires unwind tables on most architectures.
-@@ -201,6 +213,10 @@ tests = backtrace-tst \
- 	tst-realpath-chk \
- 	$(tests-all-chk)
- 
-+tests-time64 += \
-+	$(tests-all-time64-chk) \
-+	# tests-time64
-+
- ifeq ($(have-ssp),yes)
- tests += tst-ssp-1
- endif
-@@ -210,7 +226,7 @@ tests += tst-read-chk-cancel
- endif
- 
- ifeq (,$(CXX))
--tests-unsupported = $(tests-cc-chk)
-+tests-unsupported = $(tests-cc-def-chk) $(test-cc-time64-chk)
- endif
- 
- extra-libs = libpcprofile
-@@ -235,6 +251,7 @@ define chk-gen-locales
- $(objpfx)$(1).out: $(gen-locales)
- endef
- $(foreach t, $(tests-all-chk), $(eval $(call chk-gen-locales,$(t))))
-+$(foreach t, $(tests-all-time64-chk), $(eval $(call chk-gen-locales,$(t))))
- endif
- 
- sLIBdir := $(shell echo $(slibdir) | sed 's,lib\(\|64\)$$,\\\\$$LIB,')
-diff --git a/include/sys/poll.h b/include/sys/poll.h
-index f904e21f89..228704fe79 100644
---- a/include/sys/poll.h
-+++ b/include/sys/poll.h
-@@ -2,13 +2,16 @@
- # include <io/sys/poll.h>
- 
- #ifndef _ISOMAC
-+#include <include/struct___timespec64.h>
-+
- extern int __poll (struct pollfd *__fds, unsigned long int __nfds,
- 		   int __timeout);
- libc_hidden_proto (__poll)
- libc_hidden_proto (ppoll)
- 
- # if __TIMESIZE == 64
--#  define __ppoll64 __ppoll
-+#  define __ppoll64 ppoll
-+#  define __ppoll64_chk __ppoll_chk
- # else
- # include <time.h>
- # include <signal.h>
-diff --git a/io/bits/poll2.h b/io/bits/poll2.h
-index 3679d8451a..90f5574969 100644
---- a/io/bits/poll2.h
-+++ b/io/bits/poll2.h
-@@ -43,6 +43,30 @@ poll (struct pollfd *__fds, nfds_t __nfds, int __timeout)
- 
- 
- #ifdef __USE_GNU
-+# ifdef __USE_TIME_BITS64
-+extern int __REDIRECT (__ppoll64_alias, (struct pollfd *__fds, nfds_t __nfds,
-+				       const struct timespec *__timeout,
-+				       const __sigset_t *__ss), __ppoll64);
-+extern int __ppoll64_chk (struct pollfd *__fds, nfds_t __nfds,
-+			  const struct timespec *__timeout,
-+			  const __sigset_t *__ss, __SIZE_TYPE__ __fdslen)
-+    __attr_access ((__write_only__, 1, 2));
-+extern int __REDIRECT (__ppoll64_chk_warn, (struct pollfd *__fds, nfds_t __n,
-+					    const struct timespec *__timeout,
-+					    const __sigset_t *__ss,
-+					    __SIZE_TYPE__ __fdslen),
-+		       __ppoll64_chk)
-+  __warnattr ("ppoll called with fds buffer too small file nfds entries");
-+
-+__fortify_function __fortified_attr_access (__write_only__, 1, 2) int
-+ppoll (struct pollfd *__fds, nfds_t __nfds, const struct timespec *__timeout,
-+       const __sigset_t *__ss)
-+{
-+  return __glibc_fortify (ppoll64, __nfds, sizeof (*__fds),
-+			  __glibc_objsize (__fds),
-+			  __fds, __nfds, __timeout, __ss);
-+}
-+# else
- extern int __REDIRECT (__ppoll_alias, (struct pollfd *__fds, nfds_t __nfds,
- 				       const struct timespec *__timeout,
- 				       const __sigset_t *__ss), ppoll);
-@@ -65,6 +89,7 @@ ppoll (struct pollfd *__fds, nfds_t __nfds, const struct timespec *__timeout,
- 			  __glibc_objsize (__fds),
- 			  __fds, __nfds, __timeout, __ss);
- }
-+# endif
- #endif
- 
- __END_DECLS
-diff --git a/sysdeps/unix/sysv/linux/Versions b/sysdeps/unix/sysv/linux/Versions
-index 65d2ceda2c..ca6eb1a49e 100644
---- a/sysdeps/unix/sysv/linux/Versions
-+++ b/sysdeps/unix/sysv/linux/Versions
-@@ -313,6 +313,11 @@ libc {
-     process_madvise;
-     process_mrelease;
-   }
-+  GLIBC_2.37 {
-+%ifdef TIME64_NON_DEFAULT
-+    __ppoll64_chk;
-+%endif
-+  }
-   GLIBC_PRIVATE {
-     # functions used in other libraries
-     __syscall_rt_sigqueueinfo;
-diff --git a/sysdeps/unix/sysv/linux/arm/be/libc.abilist b/sysdeps/unix/sysv/linux/arm/be/libc.abilist
-index e0668a80cf..f28402fe03 100644
---- a/sysdeps/unix/sysv/linux/arm/be/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/arm/be/libc.abilist
-@@ -513,6 +513,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 _Exit F
- GLIBC_2.4 _IO_2_1_stderr_ D 0xa0
- GLIBC_2.4 _IO_2_1_stdin_ D 0xa0
-diff --git a/sysdeps/unix/sysv/linux/arm/le/libc.abilist b/sysdeps/unix/sysv/linux/arm/le/libc.abilist
-index d28e7c60b7..e2f56880ed 100644
---- a/sysdeps/unix/sysv/linux/arm/le/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/arm/le/libc.abilist
-@@ -510,6 +510,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 _Exit F
- GLIBC_2.4 _IO_2_1_stderr_ D 0xa0
- GLIBC_2.4 _IO_2_1_stdin_ D 0xa0
-diff --git a/sysdeps/unix/sysv/linux/csky/libc.abilist b/sysdeps/unix/sysv/linux/csky/libc.abilist
-index 922b05062f..319d92356e 100644
---- a/sysdeps/unix/sysv/linux/csky/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/csky/libc.abilist
-@@ -2669,3 +2669,4 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
-diff --git a/sysdeps/unix/sysv/linux/hppa/libc.abilist b/sysdeps/unix/sysv/linux/hppa/libc.abilist
-index 412144f94c..6450e17ebe 100644
---- a/sysdeps/unix/sysv/linux/hppa/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/hppa/libc.abilist
-@@ -2618,6 +2618,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 __confstr_chk F
- GLIBC_2.4 __fgets_chk F
- GLIBC_2.4 __fgets_unlocked_chk F
-diff --git a/sysdeps/unix/sysv/linux/i386/libc.abilist b/sysdeps/unix/sysv/linux/i386/libc.abilist
-index 134393900a..0a24ec9afd 100644
---- a/sysdeps/unix/sysv/linux/i386/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/i386/libc.abilist
-@@ -2802,6 +2802,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 __confstr_chk F
- GLIBC_2.4 __fgets_chk F
- GLIBC_2.4 __fgets_unlocked_chk F
-diff --git a/sysdeps/unix/sysv/linux/m68k/coldfire/libc.abilist b/sysdeps/unix/sysv/linux/m68k/coldfire/libc.abilist
-index 0604029c68..16243a7a92 100644
---- a/sysdeps/unix/sysv/linux/m68k/coldfire/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/m68k/coldfire/libc.abilist
-@@ -514,6 +514,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 _Exit F
- GLIBC_2.4 _IO_2_1_stderr_ D 0x98
- GLIBC_2.4 _IO_2_1_stdin_ D 0x98
-diff --git a/sysdeps/unix/sysv/linux/m68k/m680x0/libc.abilist b/sysdeps/unix/sysv/linux/m68k/m680x0/libc.abilist
-index af2be5c80d..564a553b27 100644
---- a/sysdeps/unix/sysv/linux/m68k/m680x0/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/m68k/m680x0/libc.abilist
-@@ -2745,6 +2745,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 __confstr_chk F
- GLIBC_2.4 __fgets_chk F
- GLIBC_2.4 __fgets_unlocked_chk F
-diff --git a/sysdeps/unix/sysv/linux/microblaze/be/libc.abilist b/sysdeps/unix/sysv/linux/microblaze/be/libc.abilist
-index e090b8d48f..e850f47b21 100644
---- a/sysdeps/unix/sysv/linux/microblaze/be/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/microblaze/be/libc.abilist
-@@ -2718,3 +2718,4 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
-diff --git a/sysdeps/unix/sysv/linux/microblaze/le/libc.abilist b/sysdeps/unix/sysv/linux/microblaze/le/libc.abilist
-index 8c5b2db243..37178c503f 100644
---- a/sysdeps/unix/sysv/linux/microblaze/le/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/microblaze/le/libc.abilist
-@@ -2715,3 +2715,4 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
-diff --git a/sysdeps/unix/sysv/linux/mips/mips32/fpu/libc.abilist b/sysdeps/unix/sysv/linux/mips/mips32/fpu/libc.abilist
-index 68847134a2..3b30b31466 100644
---- a/sysdeps/unix/sysv/linux/mips/mips32/fpu/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/mips/mips32/fpu/libc.abilist
-@@ -2710,6 +2710,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 __confstr_chk F
- GLIBC_2.4 __fgets_chk F
- GLIBC_2.4 __fgets_unlocked_chk F
-diff --git a/sysdeps/unix/sysv/linux/mips/mips32/nofpu/libc.abilist b/sysdeps/unix/sysv/linux/mips/mips32/nofpu/libc.abilist
-index daa44e64fa..0e358570a2 100644
---- a/sysdeps/unix/sysv/linux/mips/mips32/nofpu/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/mips/mips32/nofpu/libc.abilist
-@@ -2708,6 +2708,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 __confstr_chk F
- GLIBC_2.4 __fgets_chk F
- GLIBC_2.4 __fgets_unlocked_chk F
-diff --git a/sysdeps/unix/sysv/linux/mips/mips64/n32/libc.abilist b/sysdeps/unix/sysv/linux/mips/mips64/n32/libc.abilist
-index 6169188c96..59c598b98f 100644
---- a/sysdeps/unix/sysv/linux/mips/mips64/n32/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/mips/mips64/n32/libc.abilist
-@@ -2716,6 +2716,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 __confstr_chk F
- GLIBC_2.4 __fgets_chk F
- GLIBC_2.4 __fgets_unlocked_chk F
-diff --git a/sysdeps/unix/sysv/linux/nios2/libc.abilist b/sysdeps/unix/sysv/linux/nios2/libc.abilist
-index 58e9b486b0..463e01ab84 100644
---- a/sysdeps/unix/sysv/linux/nios2/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/nios2/libc.abilist
-@@ -2757,3 +2757,4 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
-diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu/libc.abilist b/sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu/libc.abilist
-index 8c9ca32cbe..405d40d11c 100644
---- a/sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu/libc.abilist
-@@ -2772,6 +2772,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 _IO_fprintf F
- GLIBC_2.4 _IO_printf F
- GLIBC_2.4 _IO_sprintf F
-diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/libc.abilist b/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/libc.abilist
-index 08a6604aab..ce89602b93 100644
---- a/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/libc.abilist
-@@ -2805,6 +2805,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 _IO_fprintf F
- GLIBC_2.4 _IO_printf F
- GLIBC_2.4 _IO_sprintf F
-diff --git a/sysdeps/unix/sysv/linux/ppoll.c b/sysdeps/unix/sysv/linux/ppoll.c
-index 1105e29b00..2e173b931d 100644
---- a/sysdeps/unix/sysv/linux/ppoll.c
-+++ b/sysdeps/unix/sysv/linux/ppoll.c
-@@ -67,7 +67,7 @@ __ppoll64 (struct pollfd *fds, nfds_t nfds, const struct __timespec64 *timeout,
- libc_hidden_def (__ppoll64)
- 
- int
--__ppoll (struct pollfd *fds, nfds_t nfds, const struct timespec *timeout,
-+ppoll (struct pollfd *fds, nfds_t nfds, const struct timespec *timeout,
-          const sigset_t *sigmask)
- {
-   struct __timespec64 ts64;
-@@ -77,5 +77,4 @@ __ppoll (struct pollfd *fds, nfds_t nfds, const struct timespec *timeout,
-   return __ppoll64 (fds, nfds, timeout ? &ts64 : NULL, sigmask);
- }
- #endif
--strong_alias (__ppoll, ppoll)
- libc_hidden_def (ppoll)
-diff --git a/sysdeps/unix/sysv/linux/ppoll_chk.c b/sysdeps/unix/sysv/linux/ppoll_chk.c
-new file mode 100644
-index 0000000000..65c4b56671
---- /dev/null
-+++ b/sysdeps/unix/sysv/linux/ppoll_chk.c
-@@ -0,0 +1,42 @@
-+/* Fortify ppoll implementation.  Linux version.
-+   Copyright (C) 2022 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <poll.h>
-+
-+int
-+__ppoll64_chk (struct pollfd *fds, nfds_t nfds,
-+	       const struct __timespec64 *tmo, const __sigset_t *ss,
-+	       __SIZE_TYPE__ fdslen)
-+{
-+  if (fdslen / sizeof (*fds) < nfds)
-+    __chk_fail ();
-+
-+  return __ppoll64 (fds, nfds, tmo, ss);
-+}
-+
-+#if __TIMESIZE != 64
-+int
-+__ppoll_chk (struct pollfd *fds, nfds_t nfds, const struct timespec *tmo,
-+	     const __sigset_t *ss, __SIZE_TYPE__ fdslen)
-+{
-+  if (fdslen / sizeof (*fds) < nfds)
-+    __chk_fail ();
-+
-+  return ppoll (fds, nfds, tmo, ss);
-+}
-+#endif
-diff --git a/sysdeps/unix/sysv/linux/s390/s390-32/libc.abilist b/sysdeps/unix/sysv/linux/s390/s390-32/libc.abilist
-index 009f22931e..5ca051a9eb 100644
---- a/sysdeps/unix/sysv/linux/s390/s390-32/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/s390/s390-32/libc.abilist
-@@ -2770,6 +2770,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 _IO_fprintf F
- GLIBC_2.4 _IO_printf F
- GLIBC_2.4 _IO_sprintf F
-diff --git a/sysdeps/unix/sysv/linux/sh/be/libc.abilist b/sysdeps/unix/sysv/linux/sh/be/libc.abilist
-index afb5bc37b1..5b48168ec6 100644
---- a/sysdeps/unix/sysv/linux/sh/be/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/sh/be/libc.abilist
-@@ -2625,6 +2625,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 __confstr_chk F
- GLIBC_2.4 __fgets_chk F
- GLIBC_2.4 __fgets_unlocked_chk F
-diff --git a/sysdeps/unix/sysv/linux/sh/le/libc.abilist b/sysdeps/unix/sysv/linux/sh/le/libc.abilist
-index 2b53a3cf92..c42b39cea8 100644
---- a/sysdeps/unix/sysv/linux/sh/le/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/sh/le/libc.abilist
-@@ -2622,6 +2622,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 __confstr_chk F
- GLIBC_2.4 __fgets_chk F
- GLIBC_2.4 __fgets_unlocked_chk F
-diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/libc.abilist b/sysdeps/unix/sysv/linux/sparc/sparc32/libc.abilist
-index 43b9844a99..5a0a662dee 100644
---- a/sysdeps/unix/sysv/linux/sparc/sparc32/libc.abilist
-+++ b/sysdeps/unix/sysv/linux/sparc/sparc32/libc.abilist
-@@ -2765,6 +2765,7 @@ GLIBC_2.36 pidfd_open F
- GLIBC_2.36 pidfd_send_signal F
- GLIBC_2.36 process_madvise F
- GLIBC_2.36 process_mrelease F
-+GLIBC_2.37 __ppoll64_chk F
- GLIBC_2.4 _IO_fprintf F
- GLIBC_2.4 _IO_printf F
- GLIBC_2.4 _IO_sprintf F
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index dfbd700c5f..0e2bbbc6a2 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,4 +1,4 @@
-From c6dca721df6dd8c39ffe16e61623516bd8742d39 Mon Sep 17 00:00:00 2001
+From 604a78e86ca374278fc5f3ce11b0abe1ff096b7e Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
 Subject: [PATCH] localedef: Add hardlink resolver from util-linux
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 57f1a36455..0fd8a0d57d 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,4 +1,4 @@
-From 3e391efa9b179ae886dd0942202bd2a6698e2679 Mon Sep 17 00:00:00 2001
+From 85d14ae38fb9e7b46bb4b8f5f041e39a605ed81e Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
 Subject: [PATCH] localedef: fix-ups hardlink to make it compile
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 4eb23bd0e5..c6f1455ee1 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From a74ac72e6a25121c99f3875cf0245a435729e897 Mon Sep 17 00:00:00 2001
+From d1b745b6e4c6a755cceb92329227efce1547d5fc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
@@ -30,7 +30,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 1ad0868dad..c5e235d918 100644
+index fcb39a78d4..cde9fc2358 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -2109,6 +2109,14 @@ _dl_map_object (struct link_map *loader, const char *name,
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 7eaf70b780..8256a56245 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From d2f16ab250dbb93ae21e9e9286ddf696141db735 Mon Sep 17 00:00:00 2001
+From 3789e9ae4c208b2d97169a95cf3b1767e73b3856 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index c5e235d918..ce3cbfa3c4 100644
+index cde9fc2358..e514bdcc21 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -1809,7 +1809,19 @@ open_path (const char *name, size_t namelen, int mode,
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 1fb76202c5..2899c0b845 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From 2d41508ed1059df2df9994d35d870be2005f575f Mon Sep 17 00:00:00 2001
+From 66e971a785aae80ba838a2604c679db70cbb8b3b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
@@ -19,14 +19,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  elf/dl-load.c              | 4 ++--
  elf/dl-usage.c             | 6 ++++--
  elf/interp.c               | 2 +-
- elf/ldconfig.c             | 3 +++
+ elf/ldconfig.c             | 2 ++
  elf/rtld.c                 | 1 +
  iconv/gconv_conf.c         | 2 +-
  sysdeps/generic/dl-cache.h | 4 ----
- 8 files changed, 16 insertions(+), 10 deletions(-)
+ 8 files changed, 15 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 8bbf110d02..c02a95d9b5 100644
+index 07c054b11a..0fa36548b0 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
 @@ -352,6 +352,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
@@ -41,7 +41,7 @@ index 8bbf110d02..c02a95d9b5 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index ce3cbfa3c4..e116db24a1 100644
+index e514bdcc21..c43747a3a8 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -117,8 +117,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
@@ -56,7 +56,7 @@ index ce3cbfa3c4..e116db24a1 100644
    SYSTEM_DIRS_LEN
  };
 diff --git a/elf/dl-usage.c b/elf/dl-usage.c
-index 98d8c98948..77ca98cbf9 100644
+index 53535c1583..3ba7d9d200 100644
 --- a/elf/dl-usage.c
 +++ b/elf/dl-usage.c
 @@ -25,6 +25,8 @@
@@ -68,7 +68,7 @@ index 98d8c98948..77ca98cbf9 100644
  void
  _dl_usage (const char *argv0, const char *wrong_option)
  {
-@@ -244,7 +246,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
+@@ -184,7 +186,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
    --list                list all dependencies and how they are resolved\n\
    --verify              verify that given object really is a dynamically linked\n\
                          object we can handle\n\
@@ -77,7 +77,7 @@ index 98d8c98948..77ca98cbf9 100644
    --library-path PATH   use given PATH instead of content of the environment\n\
                          variable LD_LIBRARY_PATH\n\
    --glibc-hwcaps-prepend LIST\n\
-@@ -267,7 +269,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
+@@ -207,7 +209,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
  \n\
  This program interpreter self-identifies as: " RTLD "\n\
  ",
@@ -85,9 +85,9 @@ index 98d8c98948..77ca98cbf9 100644
 +              argv0, LD_SO_CACHE);
    print_search_path_for_help (state);
    print_hwcaps_subdirectories (state);
-   print_legacy_hwcap_directories ();
+   _exit (EXIT_SUCCESS);
 diff --git a/elf/interp.c b/elf/interp.c
-index d82af036d1..9d282b2769 100644
+index ae21ae0cb3..b168e6da66 100644
 --- a/elf/interp.c
 +++ b/elf/interp.c
 @@ -18,5 +18,5 @@
@@ -98,24 +98,23 @@ index d82af036d1..9d282b2769 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 9394ac6438..7f66b1a460 100644
+index 166dccb528..8dda23c92c 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
-@@ -176,6 +176,9 @@ static struct argp argp =
+@@ -150,6 +150,8 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
  
-+
 +extern const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache")));
 +
- /* Check if string corresponds to an important hardware capability or
-    a platform.  */
- static int
+ /* Handle program arguments.  */
+ static error_t
+ parse_opt (int key, char *arg, struct argp_state *state)
 diff --git a/elf/rtld.c b/elf/rtld.c
-index cbbaf4a331..d2d27a0127 100644
+index b8467f37cf..be7bd08bc3 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -189,6 +189,7 @@ dso_name_valid_for_suid (const char *p)
+@@ -190,6 +190,7 @@ dso_name_valid_for_suid (const char *p)
      }
    return *p != '\0';
  }
@@ -124,7 +123,7 @@ index cbbaf4a331..d2d27a0127 100644
  static void
  audit_list_init (struct audit_list *list)
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index f069e28323..6288f715ba 100644
+index 21165a558a..3dd67b0ea2 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
 @@ -35,7 +35,7 @@
@@ -137,7 +136,7 @@ index f069e28323..6288f715ba 100644
  /* Type to represent search path.  */
  struct path_elem
 diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index 93d4bea930..5249176441 100644
+index bd39ff7fb7..38f9e2ad57 100644
 --- a/sysdeps/generic/dl-cache.h
 +++ b/sysdeps/generic/dl-cache.h
 @@ -34,10 +34,6 @@
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index c66bcf80c0..b0e3dbfa8a 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,4 +1,4 @@
-From 946d1cadf0bb54216409e8e0eb09be3e96044dbf Mon Sep 17 00:00:00 2001
+From a9795b9aadcbc04ad0404badf722acb83ef0ab7b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
 Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/sysdeps/x86/atomic-machine.h b/sysdeps/x86/atomic-machine.h
-index f24f1c71ed..574487ca54 100644
+index 95663099e4..4d81efc51a 100644
 --- a/sysdeps/x86/atomic-machine.h
 +++ b/sysdeps/x86/atomic-machine.h
 @@ -26,19 +26,14 @@
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index dc24c0240e..2dac1f1061 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,4 +1,4 @@
-From ce4e796fa8bd2df962cf7a0e4bc69ab6181e4ebf Mon Sep 17 00:00:00 2001
+From 68e5df9a7750d7db2323824b1342483e9ecdddd4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
 Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 8 insertions(+), 7 deletions(-)
 
 diff --git a/locale/findlocale.c b/locale/findlocale.c
-index fc433b61d8..d6f030f13c 100644
+index 1b7034348b..939d4fd613 100644
 --- a/locale/findlocale.c
 +++ b/locale/findlocale.c
 @@ -55,7 +55,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
@@ -41,7 +41,7 @@ index fc433b61d8..d6f030f13c 100644
    else
      /* We really have to load some data.  First see whether the name is
 diff --git a/locale/loadarchive.c b/locale/loadarchive.c
-index fcc4913319..62cae8c6c0 100644
+index 454bbc7eda..f904158182 100644
 --- a/locale/loadarchive.c
 +++ b/locale/loadarchive.c
 @@ -42,7 +42,7 @@
@@ -54,7 +54,7 @@ index fcc4913319..62cae8c6c0 100644
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index fd43033a19..3dc26272a0 100644
+index 66cad7a83b..b7b856f77f 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -347,7 +347,7 @@ _nl_lookup_word (locale_t l, int category, int item)
@@ -67,7 +67,7 @@ index fd43033a19..3dc26272a0 100644
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
 diff --git a/locale/programs/locale.c b/locale/programs/locale.c
-index 1b51b50d68..87c9049444 100644
+index 1d1a9b2f00..d9ed395b39 100644
 --- a/locale/programs/locale.c
 +++ b/locale/programs/locale.c
 @@ -631,6 +631,7 @@ nameentcmp (const void *a, const void *b)
diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
index 4d080726f8..7a8fe34815 100644
--- a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
+++ b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
@@ -1,4 +1,4 @@
-From 95508f06f13604ed96f28d18eb1670ea1ed02063 Mon Sep 17 00:00:00 2001
+From 18fc01c620311d9744a38d9a4a75dbe07b5d9225 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Mar 2021 14:48:56 -0800
 Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on faccess2 returns
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/sysdeps/unix/sysv/linux/faccessat.c b/sysdeps/unix/sysv/linux/faccessat.c
-index 1378bb2db8..19f2044172 100644
+index 0ccbd778b5..9df1a0fe12 100644
 --- a/sysdeps/unix/sysv/linux/faccessat.c
 +++ b/sysdeps/unix/sysv/linux/faccessat.c
 @@ -30,7 +30,11 @@ __faccessat (int fd, const char *file, int mode, int flag)
diff --git a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
index 6b80ad3e64..cf3b35f8d0 100644
--- a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From 07655aaa14f9d1f3a521caadde2936067ce84b07 Mon Sep 17 00:00:00 2001
+From c7419991ebca369d727cc2f4489fed91fd5bb83f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  12 files changed, 28 insertions(+), 28 deletions(-)
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index bf972122b1..f9397b8d6e 100644
+index 2130f6b8f8..7b7e3bbcf1 100644
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
 @@ -152,12 +152,12 @@ else
@@ -48,7 +48,7 @@ index bf972122b1..f9397b8d6e 100644
  else
    libc_cv_aarch64_be=no
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 51253d9802..ba36a0e8b4 100644
+index 85c6f76508..8ecd15d273 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
 @@ -13,8 +13,8 @@ AC_DEFINE(SUPPORT_STATIC_PIE)
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
index ba8696d654..df6a659e5e 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,4 +1,4 @@
-From 9373891f13f3550f9b3f896c34ac152efd369ca9 Mon Sep 17 00:00:00 2001
+From b5535340fb24bdae121286a79d759ecb3a464afd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
 Subject: [PATCH] eglibc: Cross building and testing instructions
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
index 1f6ff1f1fa..57828dd488 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From 7f2fd574646cb5ecbbc09372a2d8580ab72ec158 Mon Sep 17 00:00:00 2001
+From 1aa07d35422f4628437a515a256fdf230192891f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 179dd478ff..55cfb740bf 100644
+index 224c792185..6da151f5db 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 399e14faf4..b2e30a60c8 100644
--- a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,4 +1,4 @@
-From 9f1803a2f91d59a9478ca4d8d93e1de5c62671e5 Mon Sep 17 00:00:00 2001
+From 47db0543da748fa7c355599b90b5016032e9deed Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
 Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
@@ -33,7 +33,7 @@ index 9c734ff755..974e33b4b1 100644
      # a*
      alphasort64;
 diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
-index c5e3a7a365..35120031c4 100644
+index 9d85ff99a0..6bda921ca3 100644
 --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
 +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
 @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
index 7d891557bf..46df87430b 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From 2c6449014151a4bcd4b253b2acc920f0b3d6b13f Mon Sep 17 00:00:00 2001
+From fc0f96b182cd32037326545625356c88feb5c27a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index eb55750496..b0461ac4b9 100644
+index d7036b0855..ed795e2710 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -26,7 +26,8 @@ headers		= langinfo.h locale.h bits/locale.h \
@@ -89,7 +89,7 @@ index 0000000000..538f3f5edb
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 3dc26272a0..b667d32c23 100644
+index b7b856f77f..5e87ff336d 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -246,7 +246,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
@@ -102,7 +102,7 @@ index 3dc26272a0..b667d32c23 100644
  # define NL_CURRENT_INDIRECT	1
  #endif
 diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
-index 396a0d76c0..91f4a765ee 100644
+index 9582f2d167..8f9f3f582c 100644
 --- a/locale/programs/charmap-dir.c
 +++ b/locale/programs/charmap-dir.c
 @@ -18,7 +18,9 @@
@@ -148,7 +148,7 @@ index 396a0d76c0..91f4a765ee 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index 992814491d..da4dde4663 100644
+index 2c9f540bf1..c937cfd2ab 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
 @@ -352,7 +352,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
@@ -197,7 +197,7 @@ index 992814491d..da4dde4663 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index c6749dbd82..ac99777925 100644
+index d285b72611..4bf01fa3db 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
 @@ -914,7 +914,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
@@ -279,7 +279,7 @@ index c6749dbd82..ac99777925 100644
  	      srunp = srunp->next;
  	    }
 diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
-index b58fecfcee..a4d70e0780 100644
+index a590b013b3..5ed4fa0f59 100644
 --- a/locale/programs/ld-time.c
 +++ b/locale/programs/ld-time.c
 @@ -219,8 +219,10 @@ No definition for %s category found"), "LC_TIME");
@@ -348,7 +348,7 @@ index b58fecfcee..a4d70e0780 100644
  
  
 diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
-index 0460074a0c..31a7151f66 100644
+index f8c49ac06f..ddda006037 100644
 --- a/locale/programs/linereader.c
 +++ b/locale/programs/linereader.c
 @@ -776,7 +776,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
@@ -361,7 +361,7 @@ index 0460074a0c..31a7151f66 100644
    lr_buffer_init (&lrb);
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index 35a092a111..94712bf114 100644
+index 1b751bb7be..c255e2b436 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
 @@ -108,6 +108,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
@@ -407,7 +407,7 @@ index 35a092a111..94712bf114 100644
        force_output = 1;
        break;
 diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
-index 8fa74dce60..8d5aca6d9e 100644
+index e3eef59295..711d6fbea0 100644
 --- a/locale/programs/locfile.c
 +++ b/locale/programs/locfile.c
 @@ -543,6 +543,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
@@ -430,7 +430,7 @@ index 8fa74dce60..8d5aca6d9e 100644
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
-index 57b2211e2f..e9498c6c7e 100644
+index 5caf5c348f..76856a32c2 100644
 --- a/locale/programs/locfile.h
 +++ b/locale/programs/locfile.h
 @@ -70,6 +70,8 @@ extern void write_all_categories (struct localedef_t *definitions,
@@ -519,7 +519,7 @@ index 57b2211e2f..e9498c6c7e 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index 56c14d8533..6aac00503e 100644
+index dd73fa4248..da3e17774e 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -63,35 +63,6 @@ static char *const _nl_current_used[] =
diff --git a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index c47025af3b..3bf4fa45a0 100644
--- a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,4 +1,4 @@
-From 8ebf6708ba54147b44f5638b93f123fd55d4c37e Mon Sep 17 00:00:00 2001
+From 8e38bf52f1b71700a491cd1bd5ac5cf1ec7d097b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
 Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index eeb2fa6ffe..15274b0191 100644
+index 87d2d9b1b2..36f5852949 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
 @@ -339,12 +339,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
diff --git a/meta/recipes-core/glibc/glibc/0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
deleted file mode 100644
index 933fa0eb3f..0000000000
--- a/meta/recipes-core/glibc/glibc/0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From bd2b87eaa2e99310f5439df95bea12a48dc978bf Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Mon, 17 Dec 2018 21:36:18 +0000
-Subject: [PATCH] locale: prevent maybe-uninitialized errors with -Os [BZ
- #19444]
-
-Fixes following error when building for aarch64 with -Os:
-| In file included from strcoll_l.c:43:
-| strcoll_l.c: In function '__strcoll_l':
-| ../locale/weight.h:31:26: error: 'seq2.back_us' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    int_fast32_t i = table[*(*cpp)++];
-|                           ^~~~~~~~~
-| strcoll_l.c:304:18: note: 'seq2.back_us' was declared here
-|    coll_seq seq1, seq2;
-|                   ^~~~
-| In file included from strcoll_l.c:43:
-| ../locale/weight.h:31:26: error: 'seq1.back_us' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    int_fast32_t i = table[*(*cpp)++];
-|                           ^~~~~~~~~
-| strcoll_l.c:304:12: note: 'seq1.back_us' was declared here
-|    coll_seq seq1, seq2;
-|             ^~~~
-
-        Partial fix for [BZ #19444]
-        * locale/weight.h: Fix build with -Os.
-
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/1014766]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- locale/weight.h | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/locale/weight.h b/locale/weight.h
-index 8be2d220f8..4a4d5aa6b2 100644
---- a/locale/weight.h
-+++ b/locale/weight.h
-@@ -27,7 +27,14 @@ findidx (const int32_t *table,
- 	 const unsigned char *extra,
- 	 const unsigned char **cpp, size_t len)
- {
-+  /* With GCC 8 when compiling with -Os the compiler warns that
-+     seq1.back_us and seq2.back_us might be used uninitialized.
-+     This uninitialized use is impossible for the same reason
-+     as described in comments in locale/weightwc.h.  */
-+  DIAG_PUSH_NEEDS_COMMENT;
-+  DIAG_IGNORE_Os_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
-   int32_t i = table[*(*cpp)++];
-+  DIAG_POP_NEEDS_COMMENT;
-   const unsigned char *cp;
-   const unsigned char *usrc;
- 
diff --git a/meta/recipes-core/glibc/glibc/0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch
rename to meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
index cb6f7dc3d0..af7140e4da 100644
--- a/meta/recipes-core/glibc/glibc/0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch
+++ b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
@@ -1,4 +1,4 @@
-From 93c5b86fae5e42e148e5182466eb0ac26298159c Mon Sep 17 00:00:00 2001
+From 666905d40b483b28ffa2a5fa7170a40475ff1003 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Aug 2020 14:31:16 -0700
 Subject: [PATCH] powerpc: Do not ask compiler for finding arch
diff --git a/meta/recipes-core/glibc/glibc/0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
deleted file mode 100644
index f45951ae2c..0000000000
--- a/meta/recipes-core/glibc/glibc/0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 58dd1336c1c32716f4f0938bf18f2ddfbe9305ca Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Mar 2015 00:11:22 +0000
-Subject: [PATCH] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known names
-
-This bolts in a hook for OE to pass its own version of interpreter
-names into glibc especially for multilib case, where it differs from any
-other distros
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- elf/readlib.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/elf/readlib.c b/elf/readlib.c
-index ed42fbd48e..777f6c80be 100644
---- a/elf/readlib.c
-+++ b/elf/readlib.c
-@@ -49,6 +49,7 @@ static struct known_names interpreters[] =
- #ifdef SYSDEP_KNOWN_INTERPRETER_NAMES
-   SYSDEP_KNOWN_INTERPRETER_NAMES
- #endif
-+  OECORE_KNOWN_INTERPRETER_NAMES
- };
- 
- static struct known_names known_libs[] =
diff --git a/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
similarity index 72%
rename from meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
rename to meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 996471a520..9ed89c93da 100644
--- a/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,4 +1,4 @@
-From e2dba281429384cc22a73a58eaf79459e64be266 Mon Sep 17 00:00:00 2001
+From 80dbf6f21c12b1c60bfab9a64798d4f1ea242efb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
 Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
@@ -11,13 +11,13 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h          | 8 ++++++--
- sysdeps/{aarch64 => arm}/bits/wordsize.h | 8 ++++++--
- 2 files changed, 12 insertions(+), 4 deletions(-)
- copy sysdeps/{aarch64 => arm}/bits/wordsize.h (85%)
+ sysdeps/aarch64/bits/wordsize.h          |  8 ++++++--
+ sysdeps/{aarch64 => arm}/bits/wordsize.h | 10 +++++++---
+ 2 files changed, 13 insertions(+), 5 deletions(-)
+ copy sysdeps/{aarch64 => arm}/bits/wordsize.h (80%)
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index 4635431f0e..5ef0ed21f3 100644
+index 04d4be9519..63876a7830 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
 @@ -17,12 +17,16 @@
@@ -40,12 +40,20 @@ index 4635431f0e..5ef0ed21f3 100644
  
  #define __WORDSIZE_TIME64_COMPAT32	0
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
-similarity index 85%
+similarity index 80%
 copy from sysdeps/aarch64/bits/wordsize.h
 copy to sysdeps/arm/bits/wordsize.h
-index 4635431f0e..5ef0ed21f3 100644
+index 04d4be9519..5ef0ed21f3 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/arm/bits/wordsize.h
+@@ -1,6 +1,6 @@
+ /* Determine the wordsize from the preprocessor defines.
+ 
+-   Copyright (C) 2016-2023 Free Software Foundation, Inc.
++   Copyright (C) 2016-2022 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
 @@ -17,12 +17,16 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
diff --git a/meta/recipes-core/glibc/glibc/0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
rename to meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
index 5181cfec61..2e5c60a002 100644
--- a/meta/recipes-core/glibc/glibc/0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
@@ -1,4 +1,4 @@
-From 97a71e1dd07ba6721464150b03fd67823b6271e2 Mon Sep 17 00:00:00 2001
+From 561f67dda72ba806120e3ffadd8b85dcf02a90a6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
 Subject: [PATCH] Replace echo with printf builtin in nscd init script
diff --git a/meta/recipes-core/glibc/glibc/0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
similarity index 94%
rename from meta/recipes-core/glibc/glibc/0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
rename to meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
index 396f33216d..33585ee337 100644
--- a/meta/recipes-core/glibc/glibc/0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
+++ b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
@@ -1,4 +1,4 @@
-From 3b5b6079512af8af50d0a43d4c1c218f5ba1b302 Mon Sep 17 00:00:00 2001
+From 5b408839318b81cc2713956c87f19eddb009f677 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
 Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir only if its
diff --git a/meta/recipes-core/glibc/glibc/0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
similarity index 84%
rename from meta/recipes-core/glibc/glibc/0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
rename to meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
index 2f4e92dffa..f6e0cec983 100644
--- a/meta/recipes-core/glibc/glibc/0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
+++ b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
@@ -1,4 +1,4 @@
-From 8d5ff7357354394b958321204b75e3855781aefe Mon Sep 17 00:00:00 2001
+From 27d3ec9df3157966819e4369e571769ed9e8604c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Dec 2021 15:14:42 -0800
 Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/Makeconfig b/Makeconfig
-index ba70321af1..4b643768d9 100644
+index 2fda4af5f7..87777942f3 100644
 --- a/Makeconfig
 +++ b/Makeconfig
-@@ -293,6 +293,15 @@ ifndef sysincludedir
+@@ -309,6 +309,15 @@ ifndef sysincludedir
  sysincludedir = /usr/include
  endif
  
@@ -34,10 +34,10 @@ index ba70321af1..4b643768d9 100644
  # Commands to install files.
  ifndef INSTALL_DATA
 diff --git a/timezone/Makefile b/timezone/Makefile
-index a789c22d26..3e69409a94 100644
+index 0306c0bca9..4dfdcebdb7 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
-@@ -134,6 +134,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
+@@ -136,6 +136,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
  	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
  	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
  	    -e '/REPORT_BUGS_TO=/s|=.*|="$(REPORT_BUGS_TO)"|' \
diff --git a/meta/recipes-core/glibc/glibc/0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
rename to meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
index c409327f95..ee50a8148c 100644
--- a/meta/recipes-core/glibc/glibc/0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
+++ b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
@@ -1,4 +1,4 @@
-From ba1365f19ccc8378f2fcff892721187537479884 Mon Sep 17 00:00:00 2001
+From d8c8500b619231c23ef6a151821555786c0d2966 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Dec 2021 21:47:53 -0800
 Subject: [PATCH] tzselect.ksh: Use /bin/sh default shell interpreter
diff --git a/meta/recipes-core/glibc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
rename to meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
index 7b0965f6bd..4838643911 100644
--- a/meta/recipes-core/glibc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
+++ b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
@@ -1,4 +1,4 @@
-From ffbb37732807e180b14a21d1bf79ad5038252c02 Mon Sep 17 00:00:00 2001
+From 30d209d26918e48e34f34658923c42f269d27ee1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 29 Aug 2021 20:49:16 +0800
 Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
@@ -72,7 +72,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
-index a71effcbd3..a0569113aa 100644
+index a8611772a2..c75b063370 100644
 --- a/sysdeps/unix/sysv/linux/clone-internal.c
 +++ b/sysdeps/unix/sysv/linux/clone-internal.c
 @@ -52,7 +52,7 @@ __clone_internal (struct clone_args *cl_args,
diff --git a/meta/recipes-core/glibc/glibc/0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
similarity index 88%
rename from meta/recipes-core/glibc/glibc/0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
rename to meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
index 7983d1f6a7..789d36cacb 100644
--- a/meta/recipes-core/glibc/glibc/0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
@@ -1,4 +1,4 @@
-From f873e25e29684cbbf7b141d9c6ee725268505c29 Mon Sep 17 00:00:00 2001
+From b672a35f7d9e25baa83f3fd854a51bc1ad49756a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 24 Jul 2022 07:07:29 -0700
 Subject: [PATCH] Avoid hardcoded build time paths in the output binaries
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/support/Makefile b/support/Makefile
-index 9b50eac117..4c24d9f61a 100644
+index b29b7eb505..ae42e6e7e9 100644
 --- a/support/Makefile
 +++ b/support/Makefile
-@@ -218,9 +218,9 @@ libsupport-inhibit-o += .o
+@@ -219,9 +219,9 @@ libsupport-inhibit-o += .o
  endif
  
  CFLAGS-support_paths.c = \
diff --git a/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch b/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch
deleted file mode 100644
index 1f3426295a..0000000000
--- a/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5e635e5dc7d1b21a78f38109d4f43a03bec865c8 Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Sun, 7 Aug 2022 12:51:48 +0200
-Subject: [PATCH] startup: Force -O2
-
-Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=29249]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- sysdeps/unix/sysv/linux/startup.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/startup.h
-index 39859b404a..e1fc1b682d 100644
---- a/sysdeps/unix/sysv/linux/startup.h
-+++ b/sysdeps/unix/sysv/linux/startup.h
-@@ -21,6 +21,11 @@
- #else
- # include <sysdep.h>
- 
-+# if !defined __OPTIMIZE__ || __OPTIMIZE__ < 2
-+/* Force to fold strlen.  */
-+#  pragma GCC optimize(2)
-+# endif
-+
- /* Avoid a run-time invocation of strlen.  */
- #define _startup_fatal(message)                                         \
-   do                                                                    \
diff --git a/meta/recipes-core/glibc/glibc_2.36.bb b/meta/recipes-core/glibc/glibc_2.37.bb
similarity index 85%
rename from meta/recipes-core/glibc/glibc_2.36.bb
rename to meta/recipes-core/glibc/glibc_2.37.bb
index 3010f783ac..f299a3004a 100644
--- a/meta/recipes-core/glibc/glibc_2.36.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -43,18 +43,14 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0012-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0013-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-           file://0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
-           file://0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
-           file://0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
-           file://0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
-           file://0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
-           file://0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
-           file://0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
-           file://0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
-           file://0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
-           file://0025-startup-Force-O2.patch \
-           file://0001-Linux-Add-ppoll-fortify-symbol-for-64-bit-time_t-BZ-.patch \
+           file://0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
+           file://0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
+           file://0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
+           file://0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
+           file://0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
+           file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
+           file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.1


