Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D2CCCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 15:41:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20957.1760542894312247710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 08:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A9FB1688
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:41:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A5C233F738
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:41:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] clang: remove obsolete patch
Date: Wed, 15 Oct 2025 16:41:28 +0100
Message-ID: <20251015154128.119639-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015154128.119639-1-ross.burton@arm.com>
References: <20251015154128.119639-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 15:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224898

This musl-related fix to TargetLibraryInfo has been obsolete since LLVM
version 5.0 as it was fixed in a different way:

commit d21529fa0df71327aab230786e345b2071f4ac4f
Author: David L. Jones <dlj@google.com>
Date:   Mon Jan 23 23:16:46 2017 +0000

    [Analysis] Add LibFunc_ prefix to enums in TargetLibraryInfo. (NFC)

    Summary:
    The LibFunc::Func enum holds enumerators named for libc functions.
    Unfortunately, there are real situations, including libc implementati=
ons, where
    function names are actually macros (musl uses "#define fopen64 fopen"=
, for
    example; any other transitively visible macro would have similar effe=
cts).

    Strictly speaking, a conforming C++ Standard Library should provide a=
ny such
    macros as functions instead (via <cstdio>). However, there are some "=
library"
    functions which are not part of the standard, and thus not subject to=
 this
    rule (fopen64, for example). So, in order to be both portable and con=
sistent,
    the enum should not use the bare function names.

    The old enum naming used a namespace LibFunc and an enum Func, with b=
are
    enumerators. This patch changes LibFunc to be an enum with enumerator=
s prefixed
    with "LibFFunc_". (Unfortunately, a scoped enum is not sufficient to =
override
    macros.)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ryInfo-Undefine-libc-functions-if-th.patch | 90 -------------------
 meta/recipes-devtools/clang/common.inc        |  1 -
 2 files changed, 91 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0004-llvm-TargetLib=
raryInfo-Undefine-libc-functions-if-th.patch

diff --git a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInf=
o-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/clang/clang=
/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
deleted file mode 100644
index 88d1c542222..00000000000
--- a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undef=
ine-libc-functions-if-th.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 04afd5f5cb10ccb899022a6c72ca2f2378eca409 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 21 May 2016 00:33:20 +0000
-Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if the=
y are
- macros
-
-musl defines some functions as macros and not inline functions
-if this is the case then make sure to undefine them
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../llvm/Analysis/TargetLibraryInfo.def       | 22 ++++++++++++++++++-
- 1 file changed, 21 insertions(+), 1 deletion(-)
-
-diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def b/llvm/inc=
lude/llvm/Analysis/TargetLibraryInfo.def
-index 014988299d37..ea77dae66482 100644
---- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
-+++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
-@@ -1467,6 +1467,9 @@ TLI_DEFINE_STRING_INTERNAL("fopen")
- TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
-=20
- /// FILE *fopen64(const char *filename, const char *opentype)
-+#ifdef fopen64
-+#undef fopen64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(fopen64)
- TLI_DEFINE_STRING_INTERNAL("fopen64")
- TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
-@@ -1545,7 +1548,9 @@ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Long, Int)
- TLI_DEFINE_ENUM_INTERNAL(fseeko)
- TLI_DEFINE_STRING_INTERNAL("fseeko")
- TLI_DEFINE_SIG_INTERNAL(Int, Ptr, IntX, Int)
--
-+#ifdef fseeko64
-+#undef fseeko64
-+#endif
- /// int fseeko64(FILE *stream, off64_t offset, int whence)
- TLI_DEFINE_ENUM_INTERNAL(fseeko64)
- TLI_DEFINE_STRING_INTERNAL("fseeko64")
-@@ -1562,6 +1567,9 @@ TLI_DEFINE_STRING_INTERNAL("fstat")
- TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
-=20
- /// int fstat64(int filedes, struct stat64 *buf)
-+#ifdef fstat64
-+#undef fstat64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(fstat64)
- TLI_DEFINE_STRING_INTERNAL("fstat64")
- TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
-@@ -1587,6 +1595,9 @@ TLI_DEFINE_STRING_INTERNAL("ftello")
- TLI_DEFINE_SIG_INTERNAL(IntPlus, Ptr)
-=20
- /// off64_t ftello64(FILE *stream)
-+#ifdef ftello64
-+#undef ftello64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(ftello64)
- TLI_DEFINE_STRING_INTERNAL("ftello64")
- TLI_DEFINE_SIG_INTERNAL(Int64, Ptr)
-@@ -1827,6 +1838,9 @@ TLI_DEFINE_STRING_INTERNAL("lstat")
- TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
-=20
- /// int lstat64(const char *path, struct stat64 *buf);
-+#ifdef lstat64
-+#undef lstat64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(lstat64)
- TLI_DEFINE_STRING_INTERNAL("lstat64")
- TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
-@@ -2339,6 +2353,9 @@ TLI_DEFINE_STRING_INTERNAL("stat")
- TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
-=20
- /// int stat64(const char *path, struct stat64 *buf);
-+#ifdef stat64
-+#undef stat64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(stat64)
- TLI_DEFINE_STRING_INTERNAL("stat64")
- TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
-@@ -2564,6 +2581,9 @@ TLI_DEFINE_STRING_INTERNAL("tmpfile")
- TLI_DEFINE_SIG_INTERNAL(Ptr)
-=20
- /// FILE *tmpfile64(void)
-+#ifdef tmpfile64
-+#undef tmpfile64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
- TLI_DEFINE_STRING_INTERNAL("tmpfile64")
- TLI_DEFINE_SIG_INTERNAL(Ptr)
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index b7adc653404..8a7ac575543 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -24,7 +24,6 @@ SRC_URI =3D "\
     file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.pat=
ch \
     file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
     file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.pat=
ch \
-    file://0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.pat=
ch \
     file://0005-llvm-allow-env-override-of-exe-and-libdir-path.patch \
     file://0006-clang-driver-Check-sysroot-for-ldso-path.patch \
     file://0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch =
\
--=20
2.43.0


