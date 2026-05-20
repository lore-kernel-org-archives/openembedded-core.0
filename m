Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B6DCD4F3D
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 17:55:22 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18605.1779299717317818458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 10:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eGkq9+Y8;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-651c5d525f6so5390973d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779299716; cv=none;
        d=google.com; s=arc-20240605;
        b=OMjh95L6SGTwxHlwQ7O6u//E/ws39rtujZwpZokYyQz7eNS1UuQ5Vh5k/uJ8/gXyyL
         U+4g4K5gF+meDceRNLTjfRB4pqilyz7kN4dlCfH0ub9fw0AMyu2tm8MveWNrvizwp6MJ
         T1uA1ZmVtTI3Ss4vfGnC0bETJGGk5/J890RR7I7Y6bH7aAIBu/t0Jk+acg28SIpF1RXh
         Li7fZuSXvlB1bmFWkjzq23GfDxtD24VreP061MASmkPTyCVKHq6cZebwgVwrZy1gga3/
         Xid5nwqpEFAmrkh//JXnmOCh7LXuF3vPYNM4dUttMKmdAIWvC3vecFcNPzOsCEySQV2j
         tjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9rVj9lrlV1ft9m7Iyl8FGeFUD3epsXOmf3GMjrmUGeg=;
        fh=IxoGjcWU7dpzMxs2ynXk4slucyTA8Dtz0cgRBkM/BW4=;
        b=RC5ll0KD/eLEEgFkukU6Mq8C5qmLn5JTDJGvAyrTHib0n3gy+e9uPsJ5E3fbyYY4I4
         gOGwrcxc/me+9+7fsnfGaByZx8HgEklTZjFXwNZrhiaaCKJdoolqBD8oMjuQHJbtLUPy
         UGRg73oT02OavmieQWWxtHLiEmBn27JONHOcVa6biC9J6U4Do4zLGLUz+knkxIJKLMZ6
         lyhWjaozHsptmEPxKTA6KHD8BVvvCKUhdExFKVRKEMEWjh5F2dD0ooZodSnLa4fnP6TF
         1oqOz919tqBrYtBbB1WOEoWlWX1B8d4wyxUvuOkrDahR8pYlB8rL0t6fmmevcWOoQ5Wu
         nW0g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779299716; x=1779904516; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9rVj9lrlV1ft9m7Iyl8FGeFUD3epsXOmf3GMjrmUGeg=;
        b=eGkq9+Y8bYb4vpWrohj73LyZTca3EDElHQOI2lnJYg/unto90M7RfrX8hCsVKa4c9O
         WsAMWhl3s9o+hw//cVreKRp2fZn6w4Ef2eQwbcCdhfTOprWp/0IQVJIaSReo2XaEqgQH
         +AIvf+BX9YF7AaOX6nee1BFxeHEc0Sl68xz56OPEKJqJqTTYLe+igKmD0jch1x46MTU5
         liyxw1J033r0wQtk1mPwraZUJsEW70jkclJ94YCOt7FZSJ83JoIbJGGevTu5MmCYPcd1
         MhSLMXPtJtS8h5qNlEkiYy772Cgb5h66tMid7tnhhe3f37PRPttxI3EGdbokE7WfGyyL
         sHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779299716; x=1779904516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rVj9lrlV1ft9m7Iyl8FGeFUD3epsXOmf3GMjrmUGeg=;
        b=sgBTp0gsIuRYVkb26NOanSIjQUnHtv12QgQ4hBQ8xZrCN9Eij1t4gnzc4is9Gmtkv/
         wERaol9Xmb22OsPj9SgHOEIGdu6MCHBY9ja1ktYfFHvroAAQ6dv4UuItyz9HvrWZFmTm
         OWpZ2abqkqehAVCXS5csomN1t3kLLpuvnqV/MukIDiQu+xNfDt8l9nhJV9smXfAf+sO4
         VtDXTMN/EOp0ll1GwFgonZYsNu4js2Pect7NUNJ36Qv/eIPGxgh2G9/Tlb24m9kLYy+r
         6rPgxmu5P84YCPB8uK/tQ/HeE5E9+RJZfxD5Gs2RQg4SqqEtfFJmHJG/ek11AeC/mcD5
         wlSA==
X-Gm-Message-State: AOJu0Yzx2fMfyyyKLl/q6jAeFav8Asiy801iQb3ud10oQ1jSr8W05I+e
	x313kzCLkQH2NKDSHyPFDps0GOiLNVRqGv+fxuohbQP93zZEHI4pXgziCEiyxRLLC3qri1657sg
	Vbf/oFYg/LDXom99p2nd7vMNLnu6OqoE=
X-Gm-Gg: Acq92OGA/qKu9ZjL6AZJq7QW4xwQC7nsXr9ajKdHzWoP7UiCXeERxjZ8BDDuibnpLVs
	TnS+zpDy1PijehQ3jFWGbo+A//FyrVA2M44RXoSsZ+RcoCwjAaWNlzp11byk9QNZ/ujyIibda/O
	rZs5KWGSkLfkIGFyoyFFvSe89NrcEgpKt1mdZ+S0N/ySczOGdnFAP4nluUrO4fN3EdEPL9BiRox
	p1K1Drnc5gXIbWjXRDHYuofsspGx8TddhRJLpiY0LYCgtVojXbOudTR1hJxRBvda0W7ReC97iAw
	A3IK8y7yTmPPOHioAd4PSyCfjDjI7z6doiSwNf36A8qyB2NuJkysaI7TcbGePoQHEOZ4b55Bvtr
	Yfgy3mFp97xbe0PfZURkhqOZfI7qYpvbfxnwNVaNTgXFZ4kLgRcvHJ2Mvushh4G4NxtWtjsuOYt
	pcRMNGY+d0NqpyhL45Lw==
X-Received: by 2002:a05:690e:1444:b0:657:e42c:f25 with SMTP id
 956f58d0204a3-65e22868596mr24494343d50.49.1779299716106; Wed, 20 May 2026
 10:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260520173450.933044-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260520173450.933044-1-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 May 2026 10:54:48 -0700
X-Gm-Features: AVHnY4IF__5BJTgKVwFo1do11RfH4fYhHnCF7gijNZXKKWw0I38mSAH1DrWJLlE
Message-ID: <CAMKF1spF1AOH253j61ukrn9F9aSCxJC=uc+H1inAR3Of=c1dzg@mail.gmail.com>
Subject: Re: [PATCH v2] clang/llvm: Upgrade to 22.1.5 release
To: sunilkumar.dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000870c0c0652437f5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 17:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237463

--000000000000870c0c0652437f5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 10:35=E2=80=AFAM <sunilkumar.dora@windriver.com> wr=
ote:

> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> Brings following fixes:
>
>   * 5ea218a153f4 [CMake] Add multi-target cross to ARM/AArch64 Linux
> toolchain CMake cache file. (#179598)
>   * 7237429c2edc [AArch64] Fix `shufflevector` miscompilation on
> `aarch64_be` (#193076)
>   * 5e29d8aa0481 Prevent undefined behavior caused by combination of
> branch and load delay slots on MIPS1 (#185427)
>   * c61be37fe844 [clang][CodeView] Prevent the input name from appearing
> in LF_BUILDINFO (#194140)
>   * a4aca5a91cc3 [libunwind] fix build errors on x32 and mips n32 (#19431=
0)
>   * 57370e18b8a9 [Coverage] Fix quadratic propagation in
> RawCoverageMappingReader (#194996)
>   * 932756ad6c64 [X86][FastISel] Restore support for struct returns
> (#194586)
>   * 19f65f31105c [LLD][ELF] Fix performance regression when using linker
> scripts (#194668)
>   * 5c9647b8e680 release/22.x: [WebAssembly] Fix EHPadStack calculation i=
n
> fixCallUnwindMismatches (#194184)
>   * f3ce7a7db0dc [clang] fix crash with c-style casts involving dependent
> member-pointer types (#194696)
>   * 692d49bdb7ad [clang-tidy] Add note about removal of `hicpp` module
>   * ca0698598261 [SystemZ] Enable -fpatchable-function-entry=3DM,N (#1781=
91)
>   * 0d37e79da8db [X86] lowerV4F32Shuffle - don't use INSERTPS if SHUFPS
> will suffice (#186468)
>   * 9b722024f1be [compiler-rt][sanitizer] Remove linux/scc.h (#194116)
>   * 7bf7d99b794d [NFC][AArch64] Allocate AArch64Subtarget on the heap
> instead of stack (#176488)
>   * 98348c38cf17 [C++20] [Modules] Add VisiblePromoted module ownership
> kind (#189903)
>   * a9fb4799dcad [clang] NFC: Add test case for #178324 and mark it as
> fixed (#190490)
>   * f131d162201b [clang] fix error: cannot compile this l-value expressio=
n
> yet (#187755)
>   * 20fd94cf9314 [SLP] Fix a very long loads offset, being stored in
> DenseMap
>   * 267ce6017a57 [lldb] Add EXPORT to lldb-tblgen (#192610)
>   * c4b74e87ca35 Bump version to 22.1.5
>   * 35990504507d [Hexagon] Add missing MIRParser link dependency (#191010=
)
>   * 22ad4d688a72 [Hexagon][MIR] Serialize
> HexagonMachineFunctionInfo::StackAlignBaseReg to MIR (#190003)
>   * a1a9924414aa [Hexagon] Add AP register to liveins when used for frame
> index access (#188942)
>   * 7eb182991920 [Hexagon] Fix use-before-def of AP register in prologue
> CSR spills (#188504)
>   * 74049f6e3a70 [VectorCombine] Fix transitive Uses in
> foldShuffleToIdentity (#188989)
>   * a01a45066dae [NFC][test] Precommit test for pr188989 (#188667)
>   * 9f29c1e3fd8a [X86] Fix missing ByValTemporaries update in CopyViaTemp
> path for musttail calls (#190540)
>   * d46116b2e464 Suppress octal literal diagnostics from system macros
> (#192481)
>   * a5564a033004 [OpenMP][OMPT] Revert `control_tool.c` changes from
> #191429 (#192069)
>   * 3f9b9936be95 [OpenMP][OMPT] Fix `omp_control_tool` before any
> directive (#191429)
>   * d1c9116f8442 [clang-format] Correctly annotate binary stars in braced
> init lists (#186732)
>   * 99031a474bb1 release/22.x: [Clang] Track constraint's SubstIndex only
> if it contains outer parameter packs
>   * 5a1590c14433 [ClangLinkerWrapper] Fix `-v` for newer CMake passing it
> directly (#188883)
>   * c8e984d27b27 [X86] Fix VPMOVPattern folding for extended registers
> (#191760)
>   * 07c19c303387 [compiler-rt] [Darwin] Move macOS ASAN reservation above
> 512G (#191039)
>   * fa56327584fe [22.x][LoongArch] Revert musttail/byval/sret Changes
>   * 10be0a255205 [clang] Allow -Wno-error=3DX to downgrade -pedantic-erro=
rs
> diagnostics to warnings (#184756)
>   * c2aea991dba1 [Hexagon]  Fix O(N^2) compile-time regression in
> HexagonOptAddrMode (#189531)
>   * f444cca96bd5 [AArch64][SME] Preserve ZA in agnostic ZA functions
> without +sme (#190141)
>   * 5d161731998c MIPS/expandAtomicBinOp: Remove tailing kill dead registe=
r
> operands (#186055)
>   * def143a6c624 [clang] fix getReplacedTemplateParameter for function
> template specializations (#189559)
>   * 5b4dd04594bd [pdb] Fix public symbol hashing in
> GSIHashStreamBuilder::finalizeBuckets (#190133)
>   * f42d371a5d72 [WebAssembly] Fix: fixCallUnwindMismatches after
> fixCatchUnwindMismatches (#187484)
>   * e9a36c0cca40 [CodeGen] Preserve big-endian trunc in concat_vectors
> (#190701)
>   * 53c41b3a599f [PowerPC] Optimize bitcast(truncate) patterns using
> vbpermq (#181233)
>   * ab2f55b13bcb [LLD] [COFF] Fix crashes for conflicting exports with
> -export-all-symbols (#190492)
>   * f0593ab291c7 Bump version to 22.1.4
>
>
LGTM


> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc     | 2 +-
>  meta/recipes-devtools/clang/common-clang.inc | 2 +-
>  meta/recipes-devtools/clang/common.inc       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 24c5a9d712..86e8716171 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce
> Ashfield <bruce.ashfield@gmail.co
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-22.1.3 =3D "Khem Raj <
> raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-22.1.5 =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org
> >"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/clang/common-clang.inc
> b/meta/recipes-devtools/clang/common-clang.inc
> index 1b8909eeb5..d6ad546c59 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
>
>  MAJOR_VER =3D "22"
>  MINOR_VER =3D "1"
> -PATCH_VER =3D "3"
> +PATCH_VER =3D "5"
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> diff --git a/meta/recipes-devtools/clang/common.inc
> b/meta/recipes-devtools/clang/common.inc
> index 9d45898c68..9c700eb5fb 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,7 +17,7 @@ BASEURI ?=3D
> "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
>  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] =3D
> "2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd"
> +SRC_URI[sha256sum] =3D
> "7972b87b705a003ce70ab55f9f0fb495d156887cba0eb296d284731139118e2c"
>
>  SRC_URI =3D "\
>      ${BASEURI} \
> --
> 2.49.0
>
>

--000000000000870c0c0652437f5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 20,=
 2026 at 10:35=E2=80=AFAM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om">sunilkumar.dora@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Sunil Dora &lt;<a href=3D"mailto:sun=
ilkumar.dora@windriver.com" target=3D"_blank">sunilkumar.dora@windriver.com=
</a>&gt;<br>
<br>
Brings following fixes:<br>
<br>
=C2=A0 * 5ea218a153f4 [CMake] Add multi-target cross to ARM/AArch64 Linux t=
oolchain CMake cache file. (#179598)<br>
=C2=A0 * 7237429c2edc [AArch64] Fix `shufflevector` miscompilation on `aarc=
h64_be` (#193076)<br>
=C2=A0 * 5e29d8aa0481 Prevent undefined behavior caused by combination of b=
ranch and load delay slots on MIPS1 (#185427)<br>
=C2=A0 * c61be37fe844 [clang][CodeView] Prevent the input name from appeari=
ng in LF_BUILDINFO (#194140)<br>
=C2=A0 * a4aca5a91cc3 [libunwind] fix build errors on x32 and mips n32 (#19=
4310)<br>
=C2=A0 * 57370e18b8a9 [Coverage] Fix quadratic propagation in RawCoverageMa=
ppingReader (#194996)<br>
=C2=A0 * 932756ad6c64 [X86][FastISel] Restore support for struct returns (#=
194586)<br>
=C2=A0 * 19f65f31105c [LLD][ELF] Fix performance regression when using link=
er scripts (#194668)<br>
=C2=A0 * 5c9647b8e680 release/22.x: [WebAssembly] Fix EHPadStack calculatio=
n in fixCallUnwindMismatches (#194184)<br>
=C2=A0 * f3ce7a7db0dc [clang] fix crash with c-style casts involving depend=
ent member-pointer types (#194696)<br>
=C2=A0 * 692d49bdb7ad [clang-tidy] Add note about removal of `hicpp` module=
<br>
=C2=A0 * ca0698598261 [SystemZ] Enable -fpatchable-function-entry=3DM,N (#1=
78191)<br>
=C2=A0 * 0d37e79da8db [X86] lowerV4F32Shuffle - don&#39;t use INSERTPS if S=
HUFPS will suffice (#186468)<br>
=C2=A0 * 9b722024f1be [compiler-rt][sanitizer] Remove linux/scc.h (#194116)=
<br>
=C2=A0 * 7bf7d99b794d [NFC][AArch64] Allocate AArch64Subtarget on the heap =
instead of stack (#176488)<br>
=C2=A0 * 98348c38cf17 [C++20] [Modules] Add VisiblePromoted module ownershi=
p kind (#189903)<br>
=C2=A0 * a9fb4799dcad [clang] NFC: Add test case for #178324 and mark it as=
 fixed (#190490)<br>
=C2=A0 * f131d162201b [clang] fix error: cannot compile this l-value expres=
sion yet (#187755)<br>
=C2=A0 * 20fd94cf9314 [SLP] Fix a very long loads offset, being stored in D=
enseMap<br>
=C2=A0 * 267ce6017a57 [lldb] Add EXPORT to lldb-tblgen (#192610)<br>
=C2=A0 * c4b74e87ca35 Bump version to 22.1.5<br>
=C2=A0 * 35990504507d [Hexagon] Add missing MIRParser link dependency (#191=
010)<br>
=C2=A0 * 22ad4d688a72 [Hexagon][MIR] Serialize HexagonMachineFunctionInfo::=
StackAlignBaseReg to MIR (#190003)<br>
=C2=A0 * a1a9924414aa [Hexagon] Add AP register to liveins when used for fr=
ame index access (#188942)<br>
=C2=A0 * 7eb182991920 [Hexagon] Fix use-before-def of AP register in prolog=
ue CSR spills (#188504)<br>
=C2=A0 * 74049f6e3a70 [VectorCombine] Fix transitive Uses in foldShuffleToI=
dentity (#188989)<br>
=C2=A0 * a01a45066dae [NFC][test] Precommit test for pr188989 (#188667)<br>
=C2=A0 * 9f29c1e3fd8a [X86] Fix missing ByValTemporaries update in CopyViaT=
emp path for musttail calls (#190540)<br>
=C2=A0 * d46116b2e464 Suppress octal literal diagnostics from system macros=
 (#192481)<br>
=C2=A0 * a5564a033004 [OpenMP][OMPT] Revert `control_tool.c` changes from #=
191429 (#192069)<br>
=C2=A0 * 3f9b9936be95 [OpenMP][OMPT] Fix `omp_control_tool` before any dire=
ctive (#191429)<br>
=C2=A0 * d1c9116f8442 [clang-format] Correctly annotate binary stars in bra=
ced init lists (#186732)<br>
=C2=A0 * 99031a474bb1 release/22.x: [Clang] Track constraint&#39;s SubstInd=
ex only if it contains outer parameter packs<br>
=C2=A0 * 5a1590c14433 [ClangLinkerWrapper] Fix `-v` for newer CMake passing=
 it directly (#188883)<br>
=C2=A0 * c8e984d27b27 [X86] Fix VPMOVPattern folding for extended registers=
 (#191760)<br>
=C2=A0 * 07c19c303387 [compiler-rt] [Darwin] Move macOS ASAN reservation ab=
ove 512G (#191039)<br>
=C2=A0 * fa56327584fe [22.x][LoongArch] Revert musttail/byval/sret Changes<=
br>
=C2=A0 * 10be0a255205 [clang] Allow -Wno-error=3DX to downgrade -pedantic-e=
rrors diagnostics to warnings (#184756)<br>
=C2=A0 * c2aea991dba1 [Hexagon]=C2=A0 Fix O(N^2) compile-time regression in=
 HexagonOptAddrMode (#189531)<br>
=C2=A0 * f444cca96bd5 [AArch64][SME] Preserve ZA in agnostic ZA functions w=
ithout +sme (#190141)<br>
=C2=A0 * 5d161731998c MIPS/expandAtomicBinOp: Remove tailing kill dead regi=
ster operands (#186055)<br>
=C2=A0 * def143a6c624 [clang] fix getReplacedTemplateParameter for function=
 template specializations (#189559)<br>
=C2=A0 * 5b4dd04594bd [pdb] Fix public symbol hashing in GSIHashStreamBuild=
er::finalizeBuckets (#190133)<br>
=C2=A0 * f42d371a5d72 [WebAssembly] Fix: fixCallUnwindMismatches after fixC=
atchUnwindMismatches (#187484)<br>
=C2=A0 * e9a36c0cca40 [CodeGen] Preserve big-endian trunc in concat_vectors=
 (#190701)<br>
=C2=A0 * 53c41b3a599f [PowerPC] Optimize bitcast(truncate) patterns using v=
bpermq (#181233)<br>
=C2=A0 * ab2f55b13bcb [LLD] [COFF] Fix crashes for conflicting exports with=
 -export-all-symbols (#190492)<br>
=C2=A0 * f0593ab291c7 Bump version to 22.1.4<br>
<br></blockquote><div><br></div><div>LGTM</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
=C2=A0meta/recipes-devtools/clang/common-clang.inc | 2 +-<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 =
+-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 24c5a9d712..86e8716171 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D &quot;Bruce A=
shfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co" target=3D"_blank">br=
uce.ashfield@gmail.co</a><br>
=C2=A0RECIPE_MAINTAINER:pn-lld =3D &quot;Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-lldb =3D &quot;Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-llvm =3D &quot;Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.3 =3D &quot;Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.5 =3D &quot;Khem Raj &lt;<a =
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
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-de=
vtools/clang/common-clang.inc<br>
index 1b8909eeb5..d6ad546c59 100644<br>
--- a/meta/recipes-devtools/clang/common-clang.inc<br>
+++ b/meta/recipes-devtools/clang/common-clang.inc<br>
@@ -5,7 +5,7 @@ LLVM_HTTP ?=3D &quot;<a href=3D"https://github.com/llvm" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/llvm</a>&quot;<br>
<br>
=C2=A0MAJOR_VER =3D &quot;22&quot;<br>
=C2=A0MINOR_VER =3D &quot;1&quot;<br>
-PATCH_VER =3D &quot;3&quot;<br>
+PATCH_VER =3D &quot;5&quot;<br>
=C2=A0# could be &#39;rcX&#39; or &#39;git&#39; or empty ( for release )<br=
>
=C2=A0VER_SUFFIX =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc<br>
index 9d45898c68..9c700eb5fb 100644<br>
--- a/meta/recipes-devtools/clang/common.inc<br>
+++ b/meta/recipes-devtools/clang/common.inc<br>
@@ -17,7 +17,7 @@ BASEURI ?=3D &quot;${LLVM_HTTP}/llvm-project/releases/dow=
nload/llvmorg-${PV}${VER_SUFFI<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${LLVM_HTTP}/llvm-project/releases/&quot=
;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/llvmorg-?(?P&lt;pver&gt;\=
d+(\.\d+)+)&quot;<br>
=C2=A0SOURCEDIR ?=3D &quot;llvm-project-${PV}${VER_SUFFIX}.src&quot;<br>
-SRC_URI[sha256sum] =3D &quot;2488c33a959eafba1c44f253e5bbe7ac958eb53fa6262=
98a3a5f4b87373767cd&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7972b87b705a003ce70ab55f9f0fb495d156887cba0eb=
296d284731139118e2c&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${BASEURI} \<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--000000000000870c0c0652437f5c--

