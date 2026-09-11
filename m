Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC83C88E58
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:24:16 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40728.1789136652150261815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rqMPrbbX;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-86cba60d4f2so5626017b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 07:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789136651; cv=none;
        d=google.com; s=arc-20260327;
        b=DGqd7DN3k6Db2GzEmR/ivGIpE5ywGMp410mtq7xBQLsZtVCHvAe3yg+/jhvTzZ7Ffm
         yLiQ1pld8RPc7rCaXV3J0ApjvKKKk6W4+TZ2m1SMeSlHO8+3x0GgpBnMe5nHxbYCw9pp
         WIZ9TznEbidzl/X1UUaax9joh/H2l7ENPFK4wHWwhJu2+suvKOSom/zyFEl1TzwpJ91u
         53BRWsOnM/3vf7H3B+Skc207V/hbHHwlGRzfqOZ4rL6rnGMjv+3YhJPom9ACjJanZs8k
         mDaxbyX3+Tw5ru6G/2uJOkmnhIV94tKUvjWpClqP6a4ZdV749qC648dwF9pxZEkpXZ26
         1cKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o7H1l+CHBvDvjC04Srvfwl7mXLeAo5wCSJ3n98zKJAI=;
        fh=tPTLy+NF4WA0EV9K+p86106rly+eIt4tGPKFl9gwNIU=;
        b=kDsAVGTIFiFu+s/sPTo2imcYBnnTZk845HQR3v9eVUo0zwBBzcQ7vuW/M/WUALZCGv
         cgRnKlxWcnMDtbcN95BMrBFaBNNzjOgBWyUbDtDncCpRitHTgHDOvbC/AY0eHCrZ4a92
         Xp8u6zBTiECannXmbeiFOU750O3ZWQP2U2GkBiPKf9QGoKWvQ1aj9syzkbRnpsKTMeK8
         o2E42X4GPZoh4fCTXx2sMMITKtHRmrYC+4hiKj4S3G6tR1cKWqTd4/Ruvjs/ONUR0iMW
         5Ju1C6llM/77n9GsvuH0J6s+1Afuyju5BQ4T6ElHKI860M3q1rgIl4A5DgBJOwYq0q0T
         MLKg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136651; x=1789741451; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7H1l+CHBvDvjC04Srvfwl7mXLeAo5wCSJ3n98zKJAI=;
        b=rqMPrbbX2jfmUldKeLP5LKWK6RnOopzAHvLdzd+4p5sHz8oCdmVyZXVAmCTZuZWbC3
         nxM9DY6/Xhrtkn0C1M82ZO8vin30thD0X21Tf0BhF6rkYF/FIE5fpMl2vPD3b57+nOyE
         IBBX/G8ZEn9FWVyhpMrqfk/0DaE2z7KR7dMU+aZbXm4avM05G5AhtfLlz0f/TenuWK7k
         jI9xa5fLX/ihKzyvOHzJLqlDaSqu4N1R2PCoLJgu8YEhhQlZJC+1LAZAlgxwhHLZ/ugq
         o9WoPQmCJ8DVmCYYaAg2z7qODeoDHRZvgX0I3/GRmJLu+sh1XhctaaR/X1+ZfnVeOUMA
         Ycww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136651; x=1789741451;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o7H1l+CHBvDvjC04Srvfwl7mXLeAo5wCSJ3n98zKJAI=;
        b=QOMbtB/mMrCJ1XFGLMA5/0aI8N3Iz2A/iVzSQQ0QaWB7oso4zSf5BAmYUVmrM5glA9
         KhdFas0RRSVRfkh/MApmteF3uvz2bRfTF+Wg3DKArgJxXARc6nFKh86l7jtOPPcURg3w
         UglxWp/JWaStdsHUVr+JoA3OeVrKDjeIyGuRcdJ5tNF1a0PcAVAlo+S/GT4VrG2jyoS/
         DkQWh2Xb7iWvQgvq2vEdBMduou4lw4Adfr9Pg5vPqWkwueb831JBzZXlxVAZ9omUL9cw
         kENOs3dAr5tddoCPe2mo4AtQvHhJJ85FccAyfZyFrGNskUJ4Bp0FrOBl1cWSG0emXUTP
         8SZg==
X-Gm-Message-State: AFuF++lA9l8XlLsEq9mcJKWFV7LiKczgxotPo4AL+J6cPUqe96IGIOWG
	AdycjE3gGLjW+8vO/lVIgSWTLsvWcSzXjYp2L6xzPzifHPAumC+HsMhciAhQXZ6b8MkxNT2wd0l
	wLMq+/KBfxTDGZV4g2adRQpGFXaz8FfI=
X-Gm-Gg: AYBFou1hKiCWledmj3GbmpWvtUTj3SrZl86gvyevlxkqqOeEUG8LQFWFsUhgiRqjx71
	XmrTztkyZWsbEkIJueJ81YOPn5mFeN08FKbj4g1TeGrnPVdfW0bk8f1kw6F+L+ggYvAWHvU7bYu
	qlcvOPrhm6l+jKKjiDEzPADWYO4Ktg5t3kF1Qc3jpj0mpeSXdP5d4PiMd1xY8IAbfGL4Jyw6uoM
	jayNnAnVvQH2u5K1ddHgWn/mDMnJ6iF2NZXKLZpHxdaZN85BUdeobJPwfgXK21n3dp3BCcGGyu9
	Y1w1RE8suzxzpC4+FIT8bf76vOzMzyAgHhcRjHZs3NkRqeLiMcxbcvWROQQyBBzUwrhTZsE7LoV
	S26xLhhWXlUzNBU+4DdHmWvH4Ain/Spz6KGlxtdT0PeEeChNd/EVGupYk2FvGqJmEZBvI9GoxPm
	ufLGlREVMDPzuDn33RjgCyI+EcerbhVLDB9djWWjrQvihZM8ksr61RfCZV5Rtq0GLPKU37HsWgF
	7ob29totN86cc7OUxwK7KCu
X-Received: by 2002:a05:690c:e3ec:b0:873:17c9:b054 with SMTP id
 00721157ae682-884af359f3cmr16252017b3.21.1789136650888; Fri, 11 Sep 2026
 07:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260911115237.1538030-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260911115237.1538030-1-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Sep 2026 07:23:44 -0700
X-Gm-Features: AcwNN1UJ02J3LjfTQfmP2PYtfTbYRnHhroUhKL4kPkff48sJ2oNXrdSp7QxWqMU
Message-ID: <CAMKF1spNu7fOAhpa=XXZLZ7OmZTwMs2+0MrDgJpY7QsdSh7dyQ@mail.gmail.com>
Subject: Re: [PATCH] clang/llvm: Upgrade to 23.1.1 release
To: sunilkumar.dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, sundeep.kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="00000000000087ead0065b35d610"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 14:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245655

--00000000000087ead0065b35d610
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM

On Fri, Sep 11, 2026 at 4:53=E2=80=AFAM <sunilkumar.dora@windriver.com> wro=
te:

> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> https://discourse.llvm.org/t/llvm-23-1-1-released/91760
>
> Drop 0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch and
> mark the musl ssp_nonshared driver patch as a backport: both fixes
> are included in this release.
>
> Brings following fixes:
> 81e03602463b [lldb] Fix SBStructuredData::GetStringValue method (#216875)
> f1cdfbeb84e9 [X86] Fix NaN handling in minimumnum/maximumnum zero fixup
> (#217420)
> b8028f7bf85d Revert "Reland "[Clang] Enable -Wunused-template under -Wall=
"
> (#208001)" (#218638)
> 2c7b58a3bbb1 Use static_pointer_cast to do SyntheticChildrenSP ->
> ScriptedSyntheticChildrenSP (#216181)
> 024b86e93451 If the address of the isa_pointer is returned as an error
> don't ask if it is a tagged pointer (#213163)
> 2bda8f5daeab [AArch64] Use SDValue to pass to vectorToScalarBitmask.
> (#218717)
> ad389cbb46c8 workflows/release-binaries.yml: Only dump the wix logs on
> failure (#218810)
> 8956179fa43c [WebAssembly] Avoid same-block dominance walks in RegStackif=
y
> (NFCI) (#218369)
> 21cd7726af6f Bump version to 23.1.1
> 910bfcd7324d [VectorCombine] Fix foldBitcastOfVPLoad reordering loads
> (#218336)
> f54a7b77711f [LoongArch] Fix selection of BRCOND with constant conditions
> (#216027)
> 490d4ed19d16 [GlobalISel] Fix inverted libcall status check in
> createFCMPLibcall (#219242)
> d81f5d210b38 [SLP]Fix narrow-tree gate width and extract miscount
> 4dea21e892d7 [SLP]Extend GEP pointer-chain cost to casts and non-root
> external uses
> aedf7d6749aa [X86] LowerAVXCONCAT_VECTORS - fix some clang-format
> messiness. NFC. (#218504)
> 55a6a0bcd3d3 [X86] LowerAVXCONCAT_VECTORS - collect all subvector operand=
s
> before ReplaceAllUsesWith call (#218381)
> b085518fcd06 Revert "Revert "workflows/release-binaries: Disable flang on
> Darwin (#164667)"" (#218978)
> e86c19d77c9d [Clang] Fix -Wunused-parameter for implicit coroutine uses
> (#217518)
> fce01560cee8 [SelectionDAG] Preserve CTTZ_ELTS lane count during expansio=
n
> (#217982)
> b201342bdc31 [clang-format] Harden star and amp annotation (#212856)
> 5f58ba54af5e [lldb][API] Fix SBEnvironment crash when Set is called with =
a
> nullptr. (#218906)
> cefac32eb6ab [DWARFLinker] Walk each shared subtree's dependencies once
> (#218072)
> fdf0409c656c [WebAssembly] Avoid scanning unrelated debug values (NFCI)
> (#218378)
> 01efbea98550 [sanitizer] Skip hanging tests on FreeBSD (#216703)
> 03cbe93e71fc [fuzzer] Restrict merge-sigusr.test to Linux (#216702)
> f39930bce62d [libc] Fix sockatmark test (#210655)
> 99cfc877e40b [C++20] [Modules] Handling merging predefined decls from std
> (#219151)
> ab544f643b09 workflows/release-binaries: Smaller WiX installer on Windows
> (#219858)
> 687ecdc1254c Add option to format a whole file using git-clang-format
> (#204336)
> 5340f7cc8814 [git-clang-format] Don't format the line preceding a deletio=
n
> (#215946)
> 8e1810950d0a [LoongArch] Add omitted LASX patterns for vector extend
> (#219351)
> 91d740bac953 release/23.x: Backport '[Clang] Fix C++26 fold expression
> normalization of PackIndexingExpr'
> 47bafb752202 [SPARC] Preserve inline asm relocation modifiers (#219971)
> 2244faf2c16c [WebAssembly] Add funclet bundle to thread local wrapper
> calls (#213826)
> 4a09f2722a56 [SCCP] Fix missing worklist push for recursive calls that
> update lattice values (#219826)
> 6b358fb914ee [win/asan] GetInstructionSize: Add some more instructions.
> (#214707)
> 1943eaf4faa3 [clang][Sema] Check exported default constructors in nested
> classes (#214275)
> bf9e7e8d773b [clang][Driver] Link libssp_nonshared.a on musl with stack
> protector (#219828)
> 5089f145193d [SPARC] Parse unary complement immediates (#219970)
> ce68f2870320 [OpenMP][libomp] Fix dist barrier arrival synchronization
> (#213845)
> 7d23f0d618e1 [ORC] Fix malformed Mach-O `__unwind_info` tables (#217781)
> 8820e75cdd42 [clang-repl] Stop interpreter init on action failure (#21714=
7)
> 99b7b38c1b98 [clang-tidy] Fix false positives in
> readability-trailing-comma for designated initializers (#215934)
> 9beff35f67c1 [AArch64] Use NoSchedPred for SME instructions in C1
> scheduling models.
> f603629d9ec7 [lldb] Fix SBAPI breakage in SBFrame::GetValueForVariablePat=
h
> (#218565)
> 5f27b704b2fc [SelectionDAG] Avoid irregular INSERT_SUBVECTOR when widenin=
g
> CTTZ_ELTS (#218019)
> 9f658ca5d2ff [libc] Disable float16 on 32-bit x86 without SSE2 (#219675)
> 13259bad3b48   [clang-format] Keep empty Java interface/record body on on=
e
> line (#219910)
> 4f7718b2d0f8 [flang-rt][test] Fix Exceptions.cpp compilation on FreeBSD
> (#219709)
> d1e3b265a499 [Mips] Select GPR register class based on requested type siz=
e
> (#220012)
> a53c3e52ed56 [MIPS] Fix GP-relative selection after select/add combine
> (#215414)
> d27393c2493c [flang-rt] Fix runtime/environment.cpp compilation on FreeBS=
D
> (#219705)
> 80062a22dc03 [Mips] Use ELF binding when expanding PIC la (#217566)
> 6dfe1677ab8d [SLP]Fix crash in canBuildSplitNode on struct-typed scalars
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  2 +-
>  ...tools.cpp-Add-lssp_nonshared-on-musl.patch |  2 +-
>  ...e-float16-on-32-bit-x86-without-SSE2.patch | 36 -------------------
>  meta/recipes-devtools/clang/common-clang.inc  |  2 +-
>  meta/recipes-devtools/clang/common.inc        |  3 +-
>  5 files changed, 4 insertions(+), 41 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86=
-without-SSE2.patch
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 40d62042bd..9b24d79a31 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce
> Ashfield <bruce.ashfield@gmail.co
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-23.1.0 =3D "Khem Raj <
> raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-23.1.1 =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org
> >"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git
> a/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> index 1ba19bb4cd..efb90dc3fa 100644
> ---
> a/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> +++
> b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> @@ -7,7 +7,7 @@ musl driver will need to add ssp_nonshared for
> stack_check_local
>  on the linker cmdline when using stack protector commands on
>  compiler cmdline
>
> -Upstream-Status: Pending
> +Upstream-Status: Backport [
> https://github.com/llvm/llvm-project/commit/bf9e7e8d773b]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   clang/lib/Driver/ToolChains/Gnu.cpp | 6 ++++++
> diff --git
> a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x=
86-without-SSE2.patch
> b/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x=
86-without-SSE2.patch
> deleted file mode 100644
> index df35636055..0000000000
> ---
> a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x=
86-without-SSE2.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From: Sunil Dora <sunilkumar.dora@windriver.com>
> -Date: Fri, 29 Aug 2026 13:55:00 +0530
> -Subject: [PATCH] libc: Disable float16 on 32-bit x86 without SSE2
> -
> -GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 even though
> -_Float16 is only usable on x86-32 with SSE2 enabled. The float16
> -detection in float16-macros.h keys on that macro, so the shared f16
> -math headers are compiled on plain i686 and every use of _Float16
> -fails:
> -
> -  libc/src/__support/FPUtil/BasicOperations.h:63:67:
> -      error: SSE register return with SSE2 disabled
> -  libc/src/__support/math/acosf16.h:73:14:
> -      error: invalid conversion from type '_Float16' without option
> '-msse2'
> -
> -Since llvm/lib/Support/APFloat.cpp started including shared/math.h,
> -this breaks the LLVM build itself for 32-bit x86 baselines older than
> -SSE2 (e.g. -march=3Dpentiumpro), as used by Yocto/OpenEmbedded multilib.
> -
> -Require SSE2 on 32-bit x86 in the guard, matching the existing
> -exclusions for 32-bit Arm and RISC-V. Targets with SSE2 are unaffected.
> -
> -Upstream-Status: Backport [
> https://github.com/llvm/llvm-project/commit/05da143c63d333420b99eab198e1a=
89c97480929
> ]
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> ---- a/libc/include/llvm-libc-macros/float16-macros.h   2026-08-29
> 13:55:04.771442947 +0530
> -+++ b/libc/include/llvm-libc-macros/float16-macros.h   2026-08-29
> 13:55:04.773991812 +0530
> -@@ -15,7 +15,7 @@
> -     (!defined(__GNUC__) || __GNUC__ >=3D 13 ||
>        \
> -      (defined(__clang__) && __clang_major__ >=3D 12)) &&
>        \
> -     !defined(__arm__) && !defined(_M_ARM) && !defined(__riscv) &&
>       \
> --    !defined(_WIN32)
> -+    !defined(_WIN32) && (!defined(__i386__) || defined(__SSE2__))
> - #define LIBC_TYPES_HAS_FLOAT16
> -
> - // TODO: This would no longer be required if HdrGen let us guard functi=
on
> diff --git a/meta/recipes-devtools/clang/common-clang.inc
> b/meta/recipes-devtools/clang/common-clang.inc
> index 5d571e5fce..912fb80277 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
>
>  MAJOR_VER =3D "23"
>  MINOR_VER =3D "1"
> -PATCH_VER =3D "0"
> +PATCH_VER =3D "1"
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> diff --git a/meta/recipes-devtools/clang/common.inc
> b/meta/recipes-devtools/clang/common.inc
> index 0ca6951ff4..87e7d90a45 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,7 +17,7 @@ BASEURI ?=3D
> "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
>  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] =3D
> "ab1f0e3ec52448c33e8782eaf0422504b87c7b016b22514653ee0d8fcee479ff"
> +SRC_URI[sha256sum] =3D
> "ebe9be46fe8756d58c5b198ffad0fa2a766257add81a4dc52179bfacc7888ee6"
>
>  SRC_URI =3D "\
>      ${BASEURI} \
> @@ -55,7 +55,6 @@ SRC_URI =3D "\
>
>  file://0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
>
>  file://0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
>      file://0034-guard-clang-tools-extra-test.patch \
> -    file://0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch \
>  "
>  # Fallback to no-PIE if not set
>  GCCPIE ??=3D ""
> --
> 2.43.0
>
>

--00000000000087ead0065b35d610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 11, 2026 at 4:53=E2=
=80=AFAM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com">sunilkumar.do=
ra@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@wind=
river.com" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
<br>
<a href=3D"https://discourse.llvm.org/t/llvm-23-1-1-released/91760" rel=3D"=
noreferrer" target=3D"_blank">https://discourse.llvm.org/t/llvm-23-1-1-rele=
ased/91760</a><br>
<br>
Drop 0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch and<br>
mark the musl ssp_nonshared driver patch as a backport: both fixes<br>
are included in this release.<br>
<br>
Brings following fixes:<br>
81e03602463b [lldb] Fix SBStructuredData::GetStringValue method (#216875)<b=
r>
f1cdfbeb84e9 [X86] Fix NaN handling in minimumnum/maximumnum zero fixup (#2=
17420)<br>
b8028f7bf85d Revert &quot;Reland &quot;[Clang] Enable -Wunused-template und=
er -Wall&quot; (#208001)&quot; (#218638)<br>
2c7b58a3bbb1 Use static_pointer_cast to do SyntheticChildrenSP -&gt; Script=
edSyntheticChildrenSP (#216181)<br>
024b86e93451 If the address of the isa_pointer is returned as an error don&=
#39;t ask if it is a tagged pointer (#213163)<br>
2bda8f5daeab [AArch64] Use SDValue to pass to vectorToScalarBitmask. (#2187=
17)<br>
ad389cbb46c8 workflows/release-binaries.yml: Only dump the wix logs on fail=
ure (#218810)<br>
8956179fa43c [WebAssembly] Avoid same-block dominance walks in RegStackify =
(NFCI) (#218369)<br>
21cd7726af6f Bump version to 23.1.1<br>
910bfcd7324d [VectorCombine] Fix foldBitcastOfVPLoad reordering loads (#218=
336)<br>
f54a7b77711f [LoongArch] Fix selection of BRCOND with constant conditions (=
#216027)<br>
490d4ed19d16 [GlobalISel] Fix inverted libcall status check in createFCMPLi=
bcall (#219242)<br>
d81f5d210b38 [SLP]Fix narrow-tree gate width and extract miscount<br>
4dea21e892d7 [SLP]Extend GEP pointer-chain cost to casts and non-root exter=
nal uses<br>
aedf7d6749aa [X86] LowerAVXCONCAT_VECTORS - fix some clang-format messiness=
. NFC. (#218504)<br>
55a6a0bcd3d3 [X86] LowerAVXCONCAT_VECTORS - collect all subvector operands =
before ReplaceAllUsesWith call (#218381)<br>
b085518fcd06 Revert &quot;Revert &quot;workflows/release-binaries: Disable =
flang on Darwin (#164667)&quot;&quot; (#218978)<br>
e86c19d77c9d [Clang] Fix -Wunused-parameter for implicit coroutine uses (#2=
17518)<br>
fce01560cee8 [SelectionDAG] Preserve CTTZ_ELTS lane count during expansion =
(#217982)<br>
b201342bdc31 [clang-format] Harden star and amp annotation (#212856)<br>
5f58ba54af5e [lldb][API] Fix SBEnvironment crash when Set is called with a =
nullptr. (#218906)<br>
cefac32eb6ab [DWARFLinker] Walk each shared subtree&#39;s dependencies once=
 (#218072)<br>
fdf0409c656c [WebAssembly] Avoid scanning unrelated debug values (NFCI) (#2=
18378)<br>
01efbea98550 [sanitizer] Skip hanging tests on FreeBSD (#216703)<br>
03cbe93e71fc [fuzzer] Restrict merge-sigusr.test to Linux (#216702)<br>
f39930bce62d [libc] Fix sockatmark test (#210655)<br>
99cfc877e40b [C++20] [Modules] Handling merging predefined decls from std (=
#219151)<br>
ab544f643b09 workflows/release-binaries: Smaller WiX installer on Windows (=
#219858)<br>
687ecdc1254c Add option to format a whole file using git-clang-format (#204=
336)<br>
5340f7cc8814 [git-clang-format] Don&#39;t format the line preceding a delet=
ion (#215946)<br>
8e1810950d0a [LoongArch] Add omitted LASX patterns for vector extend (#2193=
51)<br>
91d740bac953 release/23.x: Backport &#39;[Clang] Fix C++26 fold expression =
normalization of PackIndexingExpr&#39;<br>
47bafb752202 [SPARC] Preserve inline asm relocation modifiers (#219971)<br>
2244faf2c16c [WebAssembly] Add funclet bundle to thread local wrapper calls=
 (#213826)<br>
4a09f2722a56 [SCCP] Fix missing worklist push for recursive calls that upda=
te lattice values (#219826)<br>
6b358fb914ee [win/asan] GetInstructionSize: Add some more instructions. (#2=
14707)<br>
1943eaf4faa3 [clang][Sema] Check exported default constructors in nested cl=
asses (#214275)<br>
bf9e7e8d773b [clang][Driver] Link libssp_nonshared.a on musl with stack pro=
tector (#219828)<br>
5089f145193d [SPARC] Parse unary complement immediates (#219970)<br>
ce68f2870320 [OpenMP][libomp] Fix dist barrier arrival synchronization (#21=
3845)<br>
7d23f0d618e1 [ORC] Fix malformed Mach-O `__unwind_info` tables (#217781)<br=
>
8820e75cdd42 [clang-repl] Stop interpreter init on action failure (#217147)=
<br>
99b7b38c1b98 [clang-tidy] Fix false positives in readability-trailing-comma=
 for designated initializers (#215934)<br>
9beff35f67c1 [AArch64] Use NoSchedPred for SME instructions in C1 schedulin=
g models.<br>
f603629d9ec7 [lldb] Fix SBAPI breakage in SBFrame::GetValueForVariablePath =
(#218565)<br>
5f27b704b2fc [SelectionDAG] Avoid irregular INSERT_SUBVECTOR when widening =
CTTZ_ELTS (#218019)<br>
9f658ca5d2ff [libc] Disable float16 on 32-bit x86 without SSE2 (#219675)<br=
>
13259bad3b48=C2=A0 =C2=A0[clang-format] Keep empty Java interface/record bo=
dy on one line (#219910)<br>
4f7718b2d0f8 [flang-rt][test] Fix Exceptions.cpp compilation on FreeBSD (#2=
19709)<br>
d1e3b265a499 [Mips] Select GPR register class based on requested type size =
(#220012)<br>
a53c3e52ed56 [MIPS] Fix GP-relative selection after select/add combine (#21=
5414)<br>
d27393c2493c [flang-rt] Fix runtime/environment.cpp compilation on FreeBSD =
(#219705)<br>
80062a22dc03 [Mips] Use ELF binding when expanding PIC la (#217566)<br>
6dfe1677ab8d [SLP]Fix crash in canBuildSplitNode on struct-typed scalars<br=
>
<br>
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
=C2=A0...tools.cpp-Add-lssp_nonshared-on-musl.patch |=C2=A0 2 +-<br>
=C2=A0...e-float16-on-32-bit-x86-without-SSE2.patch | 36 ------------------=
-<br>
=C2=A0meta/recipes-devtools/clang/common-clang.inc=C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 3 +-<br>
=C2=A05 files changed, 4 insertions(+), 41 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/clang/clang/0035-libc-Disabl=
e-float16-on-32-bit-x86-without-SSE2.patch<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 40d62042bd..9b24d79a31 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D &quot;Bruce A=
shfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co" target=3D"_blank">br=
uce.ashfield@gmail.co</a><br>
=C2=A0RECIPE_MAINTAINER:pn-lld =3D &quot;Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-lldb =3D &quot;Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-llvm =3D &quot;Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-llvm-project-source-23.1.0 =3D &quot;Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-llvm-project-source-23.1.1 =3D &quot;Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D &quot;Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-log4cplus =3D &quot;Unassigned &lt;<a href=3D"ma=
ilto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject=
.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-logrotate =3D &quot;Yi Zhao &lt;<a href=3D"mailt=
o:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&qu=
ot;<br>
diff --git a/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-=
Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0004-c=
lang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch<br>
index 1ba19bb4cd..efb90dc3fa 100644<br>
--- a/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lss=
p_nonshared-on-musl.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lss=
p_nonshared-on-musl.patch<br>
@@ -7,7 +7,7 @@ musl driver will need to add ssp_nonshared for stack_check_=
local<br>
=C2=A0on the linker cmdline when using stack protector commands on<br>
=C2=A0compiler cmdline<br>
<br>
-Upstream-Status: Pending<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/llvm/llvm-project=
/commit/bf9e7e8d773b" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/llvm/llvm-project/commit/bf9e7e8d773b</a>]<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 clang/lib/Driver/ToolChains/Gnu.cpp | 6 ++++++<br>
diff --git a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on=
-32-bit-x86-without-SSE2.patch b/meta/recipes-devtools/clang/clang/0035-lib=
c-Disable-float16-on-32-bit-x86-without-SSE2.patch<br>
deleted file mode 100644<br>
index df35636055..0000000000<br>
--- a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit=
-x86-without-SSE2.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" targ=
et=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
-Date: Fri, 29 Aug 2026 13:55:00 +0530<br>
-Subject: [PATCH] libc: Disable float16 on 32-bit x86 without SSE2<br>
-<br>
-GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 even though<br>
-_Float16 is only usable on x86-32 with SSE2 enabled. The float16<br>
-detection in float16-macros.h keys on that macro, so the shared f16<br>
-math headers are compiled on plain i686 and every use of _Float16<br>
-fails:<br>
-<br>
-=C2=A0 libc/src/__support/FPUtil/BasicOperations.h:63:67:<br>
-=C2=A0 =C2=A0 =C2=A0 error: SSE register return with SSE2 disabled<br>
-=C2=A0 libc/src/__support/math/acosf16.h:73:14:<br>
-=C2=A0 =C2=A0 =C2=A0 error: invalid conversion from type &#39;_Float16&#39=
; without option &#39;-msse2&#39;<br>
-<br>
-Since llvm/lib/Support/APFloat.cpp started including shared/math.h,<br>
-this breaks the LLVM build itself for 32-bit x86 baselines older than<br>
-SSE2 (e.g. -march=3Dpentiumpro), as used by Yocto/OpenEmbedded multilib.<b=
r>
-<br>
-Require SSE2 on 32-bit x86 in the guard, matching the existing<br>
-exclusions for 32-bit Arm and RISC-V. Targets with SSE2 are unaffected.<br=
>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/llvm/llvm-project=
/commit/05da143c63d333420b99eab198e1a89c97480929" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/llvm/llvm-project/commit/05da143c63d333420b9=
9eab198e1a89c97480929</a>]<br>
-Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.=
com" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
----<br>
---- a/libc/include/llvm-libc-macros/float16-macros.h=C2=A0 =C2=A02026-08-2=
9 13:55:04.771442947 +0530<br>
-+++ b/libc/include/llvm-libc-macros/float16-macros.h=C2=A0 =C2=A02026-08-2=
9 13:55:04.773991812 +0530<br>
-@@ -15,7 +15,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0(!defined(__GNUC__) || __GNUC__ &gt;=3D 13 ||=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 (defined(__clang__) &amp;&amp; __clang_major__ &gt;=
=3D 12)) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0!defined(__arm__) &amp;&amp; !defined(_M_ARM) &amp;&am=
p; !defined(__riscv) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
--=C2=A0 =C2=A0 !defined(_WIN32)<br>
-+=C2=A0 =C2=A0 !defined(_WIN32) &amp;&amp; (!defined(__i386__) || defined(=
__SSE2__))<br>
- #define LIBC_TYPES_HAS_FLOAT16<br>
- <br>
- // TODO: This would no longer be required if HdrGen let us guard function=
<br>
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-de=
vtools/clang/common-clang.inc<br>
index 5d571e5fce..912fb80277 100644<br>
--- a/meta/recipes-devtools/clang/common-clang.inc<br>
+++ b/meta/recipes-devtools/clang/common-clang.inc<br>
@@ -5,7 +5,7 @@ LLVM_HTTP ?=3D &quot;<a href=3D"https://github.com/llvm" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/llvm</a>&quot;<br>
<br>
=C2=A0MAJOR_VER =3D &quot;23&quot;<br>
=C2=A0MINOR_VER =3D &quot;1&quot;<br>
-PATCH_VER =3D &quot;0&quot;<br>
+PATCH_VER =3D &quot;1&quot;<br>
=C2=A0# could be &#39;rcX&#39; or &#39;git&#39; or empty ( for release )<br=
>
=C2=A0VER_SUFFIX =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc<br>
index 0ca6951ff4..87e7d90a45 100644<br>
--- a/meta/recipes-devtools/clang/common.inc<br>
+++ b/meta/recipes-devtools/clang/common.inc<br>
@@ -17,7 +17,7 @@ BASEURI ?=3D &quot;${LLVM_HTTP}/llvm-project/releases/dow=
nload/llvmorg-${PV}${VER_SUFFI<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${LLVM_HTTP}/llvm-project/releases/&quot=
;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/llvmorg-?(?P&lt;pver&gt;\=
d+(\.\d+)+)&quot;<br>
=C2=A0SOURCEDIR ?=3D &quot;llvm-project-${PV}${VER_SUFFIX}.src&quot;<br>
-SRC_URI[sha256sum] =3D &quot;ab1f0e3ec52448c33e8782eaf0422504b87c7b016b225=
14653ee0d8fcee479ff&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ebe9be46fe8756d58c5b198ffad0fa2a766257add81a4=
dc52179bfacc7888ee6&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${BASEURI} \<br>
@@ -55,7 +55,6 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0032-llvm-libgcc-Fix-symlink-path-for-libcc-when=
-LLVM_ENA.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0033-Consolidate-and-fix-sysroot-based-compiler-=
rt-search.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0034-guard-clang-tools-extra-test.patch \<br>
-=C2=A0 =C2=A0 file://0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.=
patch \<br>
=C2=A0&quot;<br>
=C2=A0# Fallback to no-PIE if not set<br>
=C2=A0GCCPIE ??=3D &quot;&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--00000000000087ead0065b35d610--

