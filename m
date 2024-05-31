Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17509C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 20:56:52 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.24219.1717189001653828694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 13:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gaQ/bQb/;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-62a08099115so24163507b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 13:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717189001; x=1717793801; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOFQX8r9WjZZ4MnTp5q9thMuUO1KtXSkOyywAdBdKZA=;
        b=gaQ/bQb/oe8G7R0G68DIAaxzpG7rDx5IUtPikkLsmjpc4YtIJwgNNXW5MR0CcCNaCn
         cv7ItkbTap2rK5FYhvExyAooYydQ/w7dVPxM58e7idCdK0M4w85bkZUVBAXOASDuha0m
         /aBQJryllXtdmLrfE9eWTJLp+k9G4Tt/i1PGDLqu62TmXA3Wjh+EvFqGdjQyfaKIJFw4
         gwwT4B3pCb49hx9MBO7QcEOypIUuZ07arjZZG1Rp63HXoVC2jyjZw3SGzaZ0Nz9YdWQ0
         S4IE2+DWG6LwZNpZGIleuTvqYbQkZFb79iMmc5BANaaIwznh7DIZ6fFIxSfKCwSEA/t/
         CXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717189001; x=1717793801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOFQX8r9WjZZ4MnTp5q9thMuUO1KtXSkOyywAdBdKZA=;
        b=hrUC4zRmUsJJroNU/MGKUlH8V8lFRA7FdPaPSaBT8y9+A8Xsx/eEnqYspA8kguEfJr
         RSybZhHRGsaYbflYKjHAI4oz8aH2q8a/fqTjMOFxaR3Qa3BSqM9rdSpS1JgCDfBUUxAT
         B0Kz1L08mYZTptAScIoUzgnIqMcEkNqrJqhgKsFIgmCTNE3GHiHtP1b/y/hf3A3mG6xh
         8We8WJtn5fZ2pViBvo8WUwYaWQTw3xaiCgAJTacNF22Kvm5GDgaWfE4lCVLkBxgx6MKy
         aGnoPVz7OUkkHRJBAKO6I4Qrc60UaORgOeFZT3bSWlTbF9Z5LBn329XJa/wjhintJ9pC
         CFew==
X-Gm-Message-State: AOJu0YyaHeatl1QVQbQD/YM1/HJZJAITu9/g0GfVNDNh33GOCqVIfRY+
	N16kV6NjSnzP3ZvROKSIjIVJa8xEg/PTFq8E+p3ou+t3dIyUVRAYzplG+oNvdcb7EBLElVjEkMz
	rJpEl1Or9+2q4pjbCELprXwE2jDfymsjpDixW4g==
X-Google-Smtp-Source: AGHT+IF9i6edUB85XOlX+3jgAfWTFYKTNY/ziCNmvEwmt9mdX+AmuAyfLXM4uw7TDdIJHoVIojkH74nILpz1aoGDCBs=
X-Received: by 2002:a05:690c:255:b0:627:ddf1:1497 with SMTP id
 00721157ae682-62c797e404amr28400057b3.45.1717188999271; Fri, 31 May 2024
 13:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240529151343.3983689-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240529151343.3983689-1-Deepthi.Hemraj@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 31 May 2024 13:56:27 -0700
Message-ID: <CAOSpxdYkzoUVSh_Zco34Bb-YS=bgY-H7GE96Kef0K8ntYM_SoA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] gcc : upgrade to v13.3
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Richard.Purdie@linuxfoundation.org, Naveen.Gowda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 20:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200083

I'm getting build errors in my autobuilder testing, an example:

https://errors.yoctoproject.org/Errors/Details/784684/

If you'd like to look at others, here is the a-full link:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6992

I stopped the build early since there were so many failures.

Also, as a side note, when you bump the gcc version you should also
update the version number for gcc-source in
meta/conf/distro/include/maintainers.inc, otherwise there will be a
warning for a missing maintainer when you build gcc.

Thanks,

Steve

On Wed, May 29, 2024 at 8:14=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> gcc stable version upgraded from v13.2 to v13.3
>
> For changes in v13.3 see: https://gcc.gnu.org/onlinedocs/gcc-13.3.0/gcc/
>
> Below is the bug fix list for v13.3
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&list_id=3D=
429106&resolution=3DFIXED&target_milestone=3D13.3
>
> There are a total 173 bugs are fixed in this release, below is the list o=
f bugs fixed
> For miscompiled with -O2 -mavx -fno-vect-cost-model since r14-6822
> ICE: in edge_before_returns_twice_call, at gimple-iterator.cc:981
> Vector: Runtime mismatch at -O2 with -fwrapv since r13-7988-g82919cf4cb23=
21
> many erratic errors starting with r13-8433-g1277f69b9b0206
> wrong code with -Oz -fno-dce -fno-forward-propagate -flive-range-shrinkag=
e -fweb since r13-1826
> internal compiler error: in get_expr_operand in ifcvt with Variable lengt=
h arrays and bitfields inside a struct
> gcc.dg/analyzer/file-CWE-1341-example.c fails on power 9 BE
> -Wanalyzer-deref-before-check false positives seen in Linux kernel due to=
 check in macros
> ICE: in deref_rvalue, at analyzer/region-model.cc:2780 with -fanalyzer -f=
analyzer-call-summaries
> Wrong optimization of fabs at -O1
> address sanitize and returns_twice causes an ICE
> forwprop -fwrapv miscompilation
> wrong code with -O -fno-tree-coalesce-vars since r13-1907
> wrong code at -O1 and above on x86_64-linux-gnu since r13-990
> wrong code generated for Emacs/Gnulib strftime (regression from 13.2)
> ICE in modify_call, at ipa-param-manipulation.cc:656
> LTO miscompilation of ceph on aarch64 and x86_64
> ICE on conversion to reference in aggregate initialization
> ICE: SIGSEGV in get_template_info (pt.cc:378) or tree_check (tree.h:3611)
> unsigned char no longer aliases anything under -std=3Dc2x
> ICE on P2266/C++23 `decltype(throw x)` where x is move-eligible parameter
> Empty constexpr object constructor erronously claims out of range access
> ICE when instantiating function template with template template parameter=
 with 2 or more auto parameters with a dependent member template,
> ICE in tsubst, at cp/pt.cc:16135
> internal compiler error: in const_unop, at fold-const.cc:1884
> Wrong code at -O2/3 on x86_64-linux-gnu since GCC-13 since r12-1653-gcb44=
8ade74d
> ICE on valid code at -O3 on x86_64-linux-gnu: in gimple_phi_arg_def_from_=
edge, at gimple.h:4699
> Wrong code at -Os on x86_64-linux-gnu since r13-3281-g6cc3394507
> internal compiler error: in expand_MASK_CALL, at internal-fn.cc:4529
> middle-end Missed vectorization: failed to vectorize simple reduction max=
 since GCC-13
> csmith: differences from -O2 to -O3 since r13-1268-g8c99e307b20c50
> Miscompilation: A possible miscompilation in GCC 13 and 14 with option -O=
s
> Wrong code with -O3 -march=3Drv64gcv on riscv or `-O3 -march=3Darmv9-a` f=
or aarch64
> Miscompile with -march=3Drv64gcv -O3 on riscv
> ICE during SLP pass with gfortran-13 -O3 -mcpu=3Dneoverse-v2
> RISC-V rv64gcv ICE: in vectorizable_load, at tree-vect-stmts.cc
> wrong code at -O1 on x86_64-linux-gnu (the generated code hangs)
> ICE: tree check: expected class 'type', have 'exceptional' (error_mark) i=
n useless_type_conversion_p,
> at gimple-expr.cc:85 with -O2 -fno-vect-cost-model since r14-9316
> GCC 13 x86_32 miscompilation of Whirlpool hash function
> ICE when building xorg-server with -fsanitize=3Dundefined
> error: unable to find a register to spill compiling GCDAProfiling.c since=
 r13-5092-g4e0b504f26f78f
> gcc generates invalid AVX-512 code
> g++ crashes with a segmentation fault while compiling a large const std::=
vector of std::string since r13-6566-ge0324e2629e25a90
> Wrong code for avx512ne2ps2bf16_maskz intrinsics since gcc13
> Wrong code at -O3 on x86_64-linux-gnu since r13-455-g1fe04c497d
> Wrong behavior for signbit of negative zero when optimizing
> Compiler time hog in the vectorizer with `-O3 -fno-tree-vrp`
> ICE: in vectorizable_nonlinear_induction, at tree-vect-loop.cc with bit f=
ields
> Miscompilation with -O1 -funswitch-loops -fno-strict-overflow
> GCC crashes on an example of CTAD for alias templates
> Missed optimization: RESTRICT missing for optional arguments
> Associating entity does not have target attribute if selector has pointer=
 attribute in associate block
> is_contiguous considers unlimited polymorphic dummy always as contiguous
> Codegen regression of large GCC vector extensions when enabling SVE
> ICE on RISCV (-mcpu=3Dthead-c906) when building glibc in dwarf2out_frame_=
debug_cfa_offset
> ICE with -fanalyzer on zero-sized array
> Unwarranted -Wanalyzer-va-arg-type-mismatch warning
> -Wanalyzer-deref-before-check false positives seen in Linux kernel due to=
 inlining
> -Wanalyzer-out-of-bounds false positives seen on Linux kernel with certai=
n unions
> deferred constant wrongly rejected
> infinite loop with multiple limited with clauses
> internal error on function call returning extension of limited interface
> segmentation fault during delay slot scheduling
> Assignment of value-initialized iterators differs from value-initializati=
on
> assert failure with _GLIBCXX_DEBUG and empty range of singular iterators =
passed to std:: algorithm
> Failing tests on x86_64-linux-gnu
> Bootstrap failure building SeqFile.lo
> gdc -O2 -mavx generates misaligned vmovdqa instruction
> assume create spurious load for volatile variable
> optional<T> o; o =3D {x}; wants to use explicit optional(U) constructor s=
ince r13-6765-ga226590fefb35ed6
> boost iterator_interface fails concept check starting in gcc-13
> Modification of a member overlapping with a member in the constructor is =
incorrectly rejected in constant evaluation since r13-160-g967cdbe6629653
> Array bounds of variable templates are not correctly deduced from initial=
izers since GCC13 inside a decltype/sizeof
> ICE with nested redefinition of enum
> Child I/O does not propage iostat
> [RISC-V RVV] Wrong SEW set for mixed-size intrinsics
> Truncated error messages with -std=3Dc++23 and -std=3Dc++26
> RISCV libatomic LR.aq/SC.rl pair insufficient for SEQ_CST
> ICE: tree check: expected function_type or method_type, have ggc_freed in=
 aarch64_resolve_overloaded_memtag,
> at config/aarch64/aarch64-builtins.cc:3349
> [RISC-V] Segment fault if compiled with -static -pg
> wrong code for some fp comparisons (after r13-4620-g4d9db4bdd458)
> ICE: in common_handle_option, at opts.cc:3356 with -fno-multiflags
> Address of template parameter object is not a valid template argument
> decltype of non-type template-parameter shouldn't be const
> Explicit template instantiation does not work when there are multiple par=
tial template specialization using concepts
> ICE: in unify, at cp/pt.cc:25226 with floating-point NTTPs
> GCC fails to parse dependent type in concept through partial specializati=
on
> multidimensional subscript operator inside requires is broken
> ICE with type aliases and depedent value
> g++ rejects-valid template argument of class type containing an lvalue re=
ference
> Incorrect result of requires-expression in case of function call ambiguit=
y and `operator<=3D>`
> The dot in the floating-point alternative form has wrong position
> std::format("{:%EEC %OOd}", std::chrono::system_clock::now()) should be r=
ejected
> Should chrono formatters always use std::time_put for locale's representa=
tion?
> Copy list initialisation of a vector<bool> raises a warning with -O2
> std::format("{:f}",2e304) invokes undefined behaviour
> format out of bounds read on format string "{0:{0}"
> std::format_to(int*, ...) fails to compile because of _S_make_span
> std::variant & optional GDB representation is too verbose
> format out of bounds read on format("{:05L}",-1.f)
> clang / c++23 missing 'typename' prior to dependent type name 'iterator_t=
raits<_It>::iterator_category'
> `format_to_n` returns wrong value
> Incorrect ADL in std::to_array in GCC 11/12/13
> __cpp_lib_format should be 202110, not 202106
> subrange modifies a const size object
> _Normalize does not consider char_type for the basic_string_view case
> [std::format] Broken non-SFINAE-friendly `set_debug_format()` for `const =
char *` formatter
> Unguarded use of __is_convertible built-in
> Using std::format with float or double based std::chrono::time_point caus=
es error: no match for 'operator<<'
> Incorrect results for std::format("{:#.3g}", flt)
> FAIL: 29_atomics/atomic/lock_free_aliases.cc -std=3Dgnu++20 (test for exc=
ess errors)
> 1Wrong exception specifiers for LFTSv3 scope guard destructors
> std::format applying grouping to nan's and inf's
> compilation error: std::basic_stracktrace::max_size()
> Wrong warning array subscript [0] is outside array bounds
> Inaccurate GCC documentation about -Wtsan and -Wxor-used-as-pow warnings
> Aarch64 accepts but ignores target("+sm4") unless ARMv8.2-A is enabled
> Truncation of deferred-length string when passing as optional
> experimental/net/socket/socket_base.cc fails on arm-eabi (r12-137)
> internal error with Aggregate aspect on array type
> new test case gcc.dg/vect/bb-slp-layout-19.c fails
> runtime error with -O1 -Wall
> 13.1.0 cc1plus stack smashing crash with C array of complex structs
> Missed Dead Code Elimination at -Os when using __builtin_unreachable sinc=
e r13-6945-g429a7a88438
> -fimplicit-constexpr leads to extremely slow and memory intensive compila=
tion
> System error message should ideally use strerror_r over strerror
> ICE in patch_jump_insn, at cfgrtl.cc:1295 - avr/xmega
> internal compiler error: in expand_expr_real_1, at expr.cc:1089
> gcc_assert is hit at gcc-13.2.0/libgcc/unwind-dw2-fde.c#L291 with some sp=
ecial library
> format out of bounds read on invalid format string "{:{}."
> illegal pointer arithmetic invoked by std::format("L{:65536}",1)
> ICE: RTL check: expected code 'const_int', have 'reg' in riscv_print_oper=
and, at config/riscv/riscv.cc:4394 during build
> Malformed manifest does not allow to run gcc on Windows XP (Accessing a c=
orrupted shared library) since r13-6552-gd11e088210a551
> Segmentation fault when compiling large static data structure
> EVRP compile-time hog compiling risc-v insn-opinit.cc
> gcc_assert is hit at libgcc/unwind-dw2-fde.c#L291
> optional<T>::reset emits inefficient code when T is trivially-destructibl=
e
> Inconsistent Bitwise AND Operation Result between int and long long int
> mips -march=3Dnative detection broken with gcc 13+ since r13-3178-g66c48b=
e23e0fa5
> RISC-V: movcc no longer used for coremark crc functions with -mtune=3Dsif=
ive-7-series
> constexpr error from accessing inactive union member in basic_string afte=
r move assignment
> error: there is no applicable operator "*" for a string type
> AVR: ATA5795 in wrong multilib set
> condition variables timed wait does a lot of spurious wakeups on Win32 th=
reading implementation
> [avr-tiny] Sets up a stack-frame even for trivial code
> wrong code for c23 fully anonymous arg lists on arm
> ASSOCIATED intrinsic does not recognize a pointer variable the second tim=
e it is used
> Incorrectly set pointer remapping with array pointer argument to CONTIGUO=
US dummy
> Bad handling of optional, allocatable character argument
> Load of null pointer when passing absent assumed-shape array argument for=
 an optional dummy argument
> ICE in simplify_intrinsic_op, at fortran/expr.cc:1305
> TYPE(*) dummy argument to generate an unused hidden argument
> Fortran array of derived type with a pointer to function with dimensional=
 arguments fails
> gfc_replace_expr: double free detected ?
> overloaded unary operator called twice
> internal error on call with parameter of predicated subtype
> internal error on anonymous access type equality
> avr: Wrong SRAM start for ATmega3208 and ATmega3209
> ICE in cp_gimplify_expr, at cp/cp-gimplify.cc:752 since r13-3175-g6ffbf87=
ca66f4ed9
> ICE(segfault) in gfc_expression_rank() from gfc_op_rank_conformable()
> Segmentation fault after finalization of a temporary variable
> Fix for PR37336 triggers an ICE in gfc_format_decoder while constructing =
a vtab
> ice in gimplify_expr, at gimplify.cc:18658 with finalization
> ice in gfc_trans_pointer_assignment, at fortran/trans-expr.cc:10524
> ICE with elemental finalizer
> -nodevicelib not working for devices -mmcu=3Davr...
> Internal compiler error (segmentation fault) in gfc_expression_rank
> Fix for PR87477 rejects valid code with a bogus error about pointer assig=
nment,
> causes an ICE since r13-7761-gd6997a5aab7aaa325946a6283bfee8ac2bd9f
> ICE allocate statement with source=3Dcmp%re and z an array
> Section attribute ignored with address space
> avr: attribute address not working with -fdata-sections -fno-common
> AVR: internal compiler error. Unknown mode: const_double:DF
> [avr] Speed up udivmodqi4
>
> Removed CVE-2023-4039.patch and 0026-aarch64-Fix-loose-ldpstp-check-PR111=
411.patch
> because its been taken to gcc-13.3 with below commits 71a2aa2127283f450c6=
23d3604dbcabe0e14a8d4,
> 4bb1ae3c13ce4fb72129229de66f5ffbcd45fe4c respectively.
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  .../gcc/{gcc-13.2.inc =3D> gcc-13.3.inc}        |   12 +-
>  ...ian_13.2.bb =3D> gcc-cross-canadian_13.3.bb} |    0
>  .../{gcc-cross_13.2.bb =3D> gcc-cross_13.3.bb}  |    0
>  ...-crosssdk_13.2.bb =3D> gcc-crosssdk_13.3.bb} |    0
>  ...cc-runtime_13.2.bb =3D> gcc-runtime_13.3.bb} |    0
>  ...itizers_13.2.bb =3D> gcc-sanitizers_13.3.bb} |    0
>  ...{gcc-source_13.2.bb =3D> gcc-source_13.3.bb} |    0
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |    8 +-
>  ...s-fix-v4bx-to-linker-to-support-EABI.patch |    3 +-
>  ...ch64-Fix-loose-ldpstp-check-PR111411.patch |  117 -
>  .../gcc/gcc/CVE-2023-4039.patch               | 3093 -----------------
>  .../gcc/{gcc_13.2.bb =3D> gcc_13.3.bb}          |    0
>  ...initial_13.2.bb =3D> libgcc-initial_13.3.bb} |    0
>  .../gcc/{libgcc_13.2.bb =3D> libgcc_13.3.bb}    |    0
>  ...ibgfortran_13.2.bb =3D> libgfortran_13.3.bb} |    0
>  15 files changed, 13 insertions(+), 3220 deletions(-)
>  rename meta/recipes-devtools/gcc/{gcc-13.2.inc =3D> gcc-13.3.inc} (91%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_13.2.bb =3D> gcc-cr=
oss-canadian_13.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross_13.2.bb =3D> gcc-cross_13.3.=
bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_13.2.bb =3D> gcc-crosssdk=
_13.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-runtime_13.2.bb =3D> gcc-runtime_1=
3.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_13.2.bb =3D> gcc-saniti=
zers_13.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-source_13.2.bb =3D> gcc-source_13.=
3.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-=
ldpstp-check-PR111411.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
>  rename meta/recipes-devtools/gcc/{gcc_13.2.bb =3D> gcc_13.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc-initial_13.2.bb =3D> libgcc-ini=
tial_13.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc_13.2.bb =3D> libgcc_13.3.bb} (1=
00%)
>  rename meta/recipes-devtools/gcc/{libgfortran_13.2.bb =3D> libgfortran_1=
3.3.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-13.3.inc
> similarity index 91%
> rename from meta/recipes-devtools/gcc/gcc-13.2.inc
> rename to meta/recipes-devtools/gcc/gcc-13.3.inc
> index 603377a49a..38497241c2 100644
> --- a/meta/recipes-devtools/gcc/gcc-13.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-13.3.inc
> @@ -2,11 +2,11 @@ require gcc-common.inc
>
>  # Third digit in PV should be incremented after a minor release
>
> -PV =3D "13.2.0"
> +PV =3D "13.3.0"
>
>  # BINV should be incremented to a revision after a minor gcc release
>
> -BINV =3D "13.2.0"
> +BINV =3D "13.3.0"
>
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>
> @@ -46,9 +46,9 @@ SRC_URI =3D "${BASEURI} \
>             file://0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-=
avo.patch \
>             file://0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-=
B.patch \
>             file://0006-cpp-honor-sysroot.patch \
> -           file://0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LI=
NKE.patch \
> +          file://0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LIN=
KE.patch \
>             file://0008-libtool.patch \
> -           file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI=
.patch \
> +          file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.=
patch \
>             file://0010-Use-the-multilib-config-files-from-B-instead-of-u=
sin.patch \
>             file://0011-aarch64-Fix-include-paths-when-S-B.patch \
>             file://0012-Avoid-using-libdir-from-.la-which-usually-points-=
to-.patch \
> @@ -65,11 +65,9 @@ SRC_URI =3D "${BASEURI} \
>             file://0023-Fix-install-path-of-linux64.h.patch \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
> -           file://CVE-2023-4039.patch \
> -           file://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch \
>             file://0027-Fix-gcc-vect-module-testcases.patch \
>  "
> -SRC_URI[sha256sum] =3D "e275e76442a6067341a27f04c5c6b83d8613144004c04135=
28863dc6b5c743da"
> +SRC_URI[sha256sum] =3D "0845e9621c9543a13f484e94584a49ffc0129970e9914624=
235fc1d061a0c083"
>
>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
>  B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_13.2.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_13.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_13.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_13.2.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_13.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_13.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_13.2.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_13.2.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_13.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_13.2.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_13.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_13.2.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_13.2.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_13.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_13.2.bb b/meta/recipes-=
devtools/gcc/gcc-source_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_13.2.bb
> rename to meta/recipes-devtools/gcc/gcc-source_13.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINK=
ER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Defi=
ne-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index 079142c540..7e9ad75637 100644
> --- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
> @@ -165,16 +165,20 @@ diff --git a/gcc/config/loongarch/gnu-user.h b/gcc/=
config/loongarch/gnu-user.h
>  index aecaa02a199..62f88f7f9a2 100644
>  --- a/gcc/config/loongarch/gnu-user.h
>  +++ b/gcc/config/loongarch/gnu-user.h
> -@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.  If not see
> +@@ -31,7 +31,7 @@
>
>   #undef GLIBC_DYNAMIC_LINKER
>   #define GLIBC_DYNAMIC_LINKER \
>  -  "/lib" ABI_GRLEN_SPEC "/ld-linux-loongarch-" ABI_SPEC ".so.1"
>  +  SYSTEMLIBS_DIR "ld-linux-loongarch-" ABI_SPEC ".so.1"
>
> + #define MUSL_ABI_SPEC \
> +   "%{mabi=3Dlp64d:}" \
> +@@ -40,7 +40,7 @@
> +
>   #undef MUSL_DYNAMIC_LINKER
>   #define MUSL_DYNAMIC_LINKER \
> --  "/lib" ABI_GRLEN_SPEC "/ld-musl-loongarch-" ABI_SPEC ".so.1"
> +-  "/lib/ld-musl-loongarch" ABI_GRLEN_SPEC MUSL_ABI_SPEC ".so.1"
>  +  SYSTEMLIBS_DIR "ld-musl-loongarch-" ABI_SPEC ".so.1"
>
>   #undef GNU_USER_TARGET_LINK_SPEC
> diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-t=
o-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-arm=
v4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> index 86542bd146..cca5f4de0e 100644
> --- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linke=
r-to-support-EABI.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linke=
r-to-support-EABI.patch
> @@ -21,8 +21,9 @@ diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/a=
rm/linux-eabi.h
>  index dce7f59eeea..27402c629c6 100644
>  --- a/gcc/config/arm/linux-eabi.h
>  +++ b/gcc/config/arm/linux-eabi.h
> -@@ -88,10 +88,14 @@
> +@@ -88,10 +88,15 @@
>   #define MUSL_DYNAMIC_LINKER \
> ++  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard:hf}%{mf=
dpic:-fdpic}.so.1"
>     SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dha=
rd:hf}%{mfdpic:-fdpic}.so.1"
>
>  +/* For armv4 we pass --fix-v4bx to linker to support EABI */
> diff --git a/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-=
check-PR111411.patch b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose=
-ldpstp-check-PR111411.patch
> deleted file mode 100644
> index a408a98698..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-P=
R111411.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -From adb60dc78e0da4877747f32347cee339364775be Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Fri, 15 Sep 2023 09:19:14 +0100
> -Subject: [PATCH] aarch64: Fix loose ldpstp check [PR111411]
> -
> -aarch64_operands_ok_for_ldpstp contained the code:
> -
> -  /* One of the memory accesses must be a mempair operand.
> -     If it is not the first one, they need to be swapped by the
> -     peephole.  */
> -  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
> -       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
> -    return false;
> -
> -But the requirement isn't just that one of the accesses must be a
> -valid mempair operand.  It's that the lower access must be, since
> -that's the access that will be used for the instruction operand.
> -
> -gcc/
> -       PR target/111411
> -       * config/aarch64/aarch64.cc (aarch64_operands_ok_for_ldpstp): Req=
uire
> -       the lower memory access to a mem-pair operand.
> -
> -gcc/testsuite/
> -       PR target/111411
> -       * gcc.dg/rtl/aarch64/pr111411.c: New test.
> -
> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D2d38f45bcca62ca0c7afef4b579f82c5c2a01610]
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ----
> - gcc/config/aarch64/aarch64.cc               |  8 ++-
> - gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c | 57 +++++++++++++++++++++
> - 2 files changed, 60 insertions(+), 5 deletions(-)
> - create mode 100644 gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 6118a3354ac..9b1f791ca8b 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -26154,11 +26154,9 @@ aarch64_operands_ok_for_ldpstp (rtx *operands, =
bool load,
> -   gcc_assert (known_eq (GET_MODE_SIZE (GET_MODE (mem_1)),
> -                       GET_MODE_SIZE (GET_MODE (mem_2))));
> -
> --  /* One of the memory accesses must be a mempair operand.
> --     If it is not the first one, they need to be swapped by the
> --     peephole.  */
> --  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
> --       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
> -+  /* The lower memory access must be a mem-pair operand.  */
> -+  rtx lower_mem =3D reversed ? mem_2 : mem_1;
> -+  if (!aarch64_mem_pair_operand (lower_mem, GET_MODE (lower_mem)))
> -     return false;
> -
> -   if (REG_P (reg_1) && FP_REGNUM_P (REGNO (reg_1)))
> -diff --git a/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c b/gcc/testsuite=
/gcc.dg/rtl/aarch64/pr111411.c
> -new file mode 100644
> -index 00000000000..ad07e9c6c89
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
> -@@ -0,0 +1,57 @@
> -+/* { dg-do compile { target aarch64*-*-* } } */
> -+/* { dg-require-effective-target lp64 } */
> -+/* { dg-options "-O -fdisable-rtl-postreload -fpeephole2 -fno-schedule-=
fusion" } */
> -+
> -+extern int data[];
> -+
> -+void __RTL (startwith ("ira")) foo (void *ptr)
> -+{
> -+  (function "foo"
> -+    (param "ptr"
> -+      (DECL_RTL (reg/v:DI <0> [ ptr ]))
> -+      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
> -+    ) ;; param "ptr"
> -+    (insn-chain
> -+      (block 2
> -+      (edge-from entry (flags "FALLTHRU"))
> -+      (cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
> -+      (insn 4 (set (reg:DI <0>) (reg:DI x0)))
> -+      (insn 5 (set (reg:DI <1>)
> -+                   (plus:DI (reg:DI <0>) (const_int 768))))
> -+      (insn 6 (set (mem:SI (plus:DI (reg:DI <0>)
> -+                                    (const_int 508)) [1 &data+508 S4 A4=
])
> -+                   (const_int 0)))
> -+      (insn 7 (set (mem:SI (plus:DI (reg:DI <1>)
> -+                                    (const_int -256)) [1 &data+512 S4 A=
4])
> -+                   (const_int 0)))
> -+      (edge-to exit (flags "FALLTHRU"))
> -+      ) ;; block 2
> -+    ) ;; insn-chain
> -+  ) ;; function
> -+}
> -+
> -+void __RTL (startwith ("ira")) bar (void *ptr)
> -+{
> -+  (function "bar"
> -+    (param "ptr"
> -+      (DECL_RTL (reg/v:DI <0> [ ptr ]))
> -+      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
> -+    ) ;; param "ptr"
> -+    (insn-chain
> -+      (block 2
> -+      (edge-from entry (flags "FALLTHRU"))
> -+      (cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
> -+      (insn 4 (set (reg:DI <0>) (reg:DI x0)))
> -+      (insn 5 (set (reg:DI <1>)
> -+                   (plus:DI (reg:DI <0>) (const_int 768))))
> -+      (insn 6 (set (mem:SI (plus:DI (reg:DI <1>)
> -+                                    (const_int -256)) [1 &data+512 S4 A=
4])
> -+                   (const_int 0)))
> -+      (insn 7 (set (mem:SI (plus:DI (reg:DI <0>)
> -+                                    (const_int 508)) [1 &data+508 S4 A4=
])
> -+                   (const_int 0)))
> -+      (edge-to exit (flags "FALLTHRU"))
> -+      ) ;; block 2
> -+    ) ;; insn-chain
> -+  ) ;; function
> -+}
> diff --git a/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch b/meta/rec=
ipes-devtools/gcc/gcc/CVE-2023-4039.patch
> deleted file mode 100644
> index 81b5067c33..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
> +++ /dev/null
> @@ -1,3093 +0,0 @@
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Subject: [PATCH 00/19] aarch64: Fix -fstack-protector issue
> -Date: Tue, 12 Sep 2023 16:25:10 +0100
> -
> -This series of patches fixes deficiencies in GCC's -fstack-protector
> -implementation for AArch64 when using dynamically allocated stack space.
> -This is CVE-2023-4039.  See:
> -
> -https://developer.arm.com/Arm%20Security%20Center/GCC%20Stack%20Protecto=
r%20Vulnerability%20AArch64
> -https://github.com/metaredteam/external-disclosures/security/advisories/=
GHSA-x7ch-h5rf-w2mf
> -
> -for more details.
> -
> -The fix is to put the saved registers above the locals area when
> --fstack-protector is used.
> -
> -The series also fixes a stack-clash problem that I found while working
> -on the CVE.  In unpatched sources, the stack-clash problem would only
> -trigger for unrealistic numbers of arguments (8K 64-bit arguments, or an
> -equivalent).  But it would be a more significant issue with the new
> --fstack-protector frame layout.  It's therefore important that both
> -problems are fixed together.
> -
> -Some reorganisation of the code seemed necessary to fix the problems in =
a
> -cleanish way.  The series is therefore quite long, but only a handful of
> -patches should have any effect on code generation.
> -
> -See the individual patches for a detailed description.
> -
> -Tested on aarch64-linux-gnu. Pushed to trunk and to all active branches.
> -I've also pushed backports to GCC 7+ to vendors/ARM/heads/CVE-2023-4039.
> -
> -CVE: CVE-2023-4039
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -
> -From 71a2aa2127283f450c623d3604dbcabe0e14a8d4 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:12 +0100
> -Subject: [PATCH 01/19] aarch64: Use local frame vars in shrink-wrapping =
code
> -
> -aarch64_layout_frame uses a shorthand for referring to
> -cfun->machine->frame:
> -
> -  aarch64_frame &frame =3D cfun->machine->frame;
> -
> -This patch does the same for some other heavy users of the structure.
> -No functional change intended.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_save_callee_saves): Use
> -       a local shorthand for cfun->machine->frame.
> -       (aarch64_restore_callee_saves, aarch64_get_separate_components):
> -       (aarch64_process_components): Likewise.
> -       (aarch64_allocate_and_probe_stack_space): Likewise.
> -       (aarch64_expand_prologue, aarch64_expand_epilogue): Likewise.
> -       (aarch64_layout_frame): Use existing shorthand for one more case.
> ----
> - gcc/config/aarch64/aarch64.cc | 123 ++++++++++++++++++----------------
> - 1 file changed, 64 insertions(+), 59 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 822a2b49a46..5d473d161d9 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8612,7 +8612,7 @@ aarch64_layout_frame (void)
> -   frame.is_scs_enabled
> -     =3D (!crtl->calls_eh_return
> -        && sanitize_flags_p (SANITIZE_SHADOW_CALL_STACK)
> --       && known_ge (cfun->machine->frame.reg_offset[LR_REGNUM], 0));
> -+       && known_ge (frame.reg_offset[LR_REGNUM], 0));
> -
> -   /* When shadow call stack is enabled, the scs_pop in the epilogue wil=
l
> -      restore x30, and we don't need to pop x30 again in the traditional
> -@@ -9078,6 +9078,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> -                          unsigned start, unsigned limit, bool skip_wb,
> -                          bool hard_fp_valid_p)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   rtx_insn *insn;
> -   unsigned regno;
> -   unsigned regno2;
> -@@ -9092,8 +9093,8 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> -       bool frame_related_p =3D aarch64_emit_cfi_for_reg_p (regno);
> -
> -       if (skip_wb
> --        && (regno =3D=3D cfun->machine->frame.wb_push_candidate1
> --            || regno =3D=3D cfun->machine->frame.wb_push_candidate2))
> -+        && (regno =3D=3D frame.wb_push_candidate1
> -+            || regno =3D=3D frame.wb_push_candidate2))
> -       continue;
> -
> -       if (cfun->machine->reg_is_wrapped_separately[regno])
> -@@ -9101,7 +9102,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D start_offset + cfun->machine->frame.reg_offset[regno];
> -+      offset =3D start_offset + frame.reg_offset[regno];
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       poly_int64 sp_offset =3D offset;
> -
> -@@ -9114,7 +9115,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> -       {
> -         gcc_assert (known_eq (start_offset, 0));
> -         poly_int64 fp_offset
> --          =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> -+          =3D frame.below_hard_fp_saved_regs_size;
> -         if (hard_fp_valid_p)
> -           base_rtx =3D hard_frame_pointer_rtx;
> -         else
> -@@ -9136,8 +9137,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> -         && (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) <=
=3D limit
> -         && !cfun->machine->reg_is_wrapped_separately[regno2]
> -         && known_eq (GET_MODE_SIZE (mode),
> --                     cfun->machine->frame.reg_offset[regno2]
> --                     - cfun->machine->frame.reg_offset[regno]))
> -+                     frame.reg_offset[regno2] - frame.reg_offset[regno]=
))
> -       {
> -         rtx reg2 =3D gen_rtx_REG (mode, regno2);
> -         rtx mem2;
> -@@ -9187,6 +9187,7 @@ static void
> - aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start,
> -                             unsigned limit, bool skip_wb, rtx *cfi_ops)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   unsigned regno;
> -   unsigned regno2;
> -   poly_int64 offset;
> -@@ -9203,13 +9204,13 @@ aarch64_restore_callee_saves (poly_int64 start_o=
ffset, unsigned start,
> -       rtx reg, mem;
> -
> -       if (skip_wb
> --        && (regno =3D=3D cfun->machine->frame.wb_pop_candidate1
> --            || regno =3D=3D cfun->machine->frame.wb_pop_candidate2))
> -+        && (regno =3D=3D frame.wb_pop_candidate1
> -+            || regno =3D=3D frame.wb_pop_candidate2))
> -       continue;
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D start_offset + cfun->machine->frame.reg_offset[regno];
> -+      offset =3D start_offset + frame.reg_offset[regno];
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> -       aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
> -@@ -9220,8 +9221,7 @@ aarch64_restore_callee_saves (poly_int64 start_off=
set, unsigned start,
> -         && (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) <=
=3D limit
> -         && !cfun->machine->reg_is_wrapped_separately[regno2]
> -         && known_eq (GET_MODE_SIZE (mode),
> --                     cfun->machine->frame.reg_offset[regno2]
> --                     - cfun->machine->frame.reg_offset[regno]))
> -+                     frame.reg_offset[regno2] - frame.reg_offset[regno]=
))
> -       {
> -         rtx reg2 =3D gen_rtx_REG (mode, regno2);
> -         rtx mem2;
> -@@ -9326,6 +9326,7 @@ offset_12bit_unsigned_scaled_p (machine_mode mode,=
 poly_int64 offset)
> - static sbitmap
> - aarch64_get_separate_components (void)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   sbitmap components =3D sbitmap_alloc (LAST_SAVED_REGNUM + 1);
> -   bitmap_clear (components);
> -
> -@@ -9342,18 +9343,18 @@ aarch64_get_separate_components (void)
> -       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> -         continue;
> -
> --      poly_int64 offset =3D cfun->machine->frame.reg_offset[regno];
> -+      poly_int64 offset =3D frame.reg_offset[regno];
> -
> -       /* If the register is saved in the first SVE save slot, we use
> -          it as a stack probe for -fstack-clash-protection.  */
> -       if (flag_stack_clash_protection
> --          && maybe_ne (cfun->machine->frame.below_hard_fp_saved_regs_si=
ze, 0)
> -+          && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
> -           && known_eq (offset, 0))
> -         continue;
> -
> -       /* Get the offset relative to the register we'll use.  */
> -       if (frame_pointer_needed)
> --        offset -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> -+        offset -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> -         offset +=3D crtl->outgoing_args_size;
> -
> -@@ -9372,11 +9373,11 @@ aarch64_get_separate_components (void)
> -   /* If the spare predicate register used by big-endian SVE code
> -      is call-preserved, it must be saved in the main prologue
> -      before any saves that use it.  */
> --  if (cfun->machine->frame.spare_pred_reg !=3D INVALID_REGNUM)
> --    bitmap_clear_bit (components, cfun->machine->frame.spare_pred_reg);
> -+  if (frame.spare_pred_reg !=3D INVALID_REGNUM)
> -+    bitmap_clear_bit (components, frame.spare_pred_reg);
> -
> --  unsigned reg1 =3D cfun->machine->frame.wb_push_candidate1;
> --  unsigned reg2 =3D cfun->machine->frame.wb_push_candidate2;
> -+  unsigned reg1 =3D frame.wb_push_candidate1;
> -+  unsigned reg2 =3D frame.wb_push_candidate2;
> -   /* If registers have been chosen to be stored/restored with
> -      writeback don't interfere with them to avoid having to output expl=
icit
> -      stack adjustment instructions.  */
> -@@ -9485,6 +9486,7 @@ aarch64_get_next_set_bit (sbitmap bmp, unsigned in=
t start)
> - static void
> - aarch64_process_components (sbitmap components, bool prologue_p)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   rtx ptr_reg =3D gen_rtx_REG (Pmode, frame_pointer_needed
> -                            ? HARD_FRAME_POINTER_REGNUM
> -                            : STACK_POINTER_REGNUM);
> -@@ -9499,9 +9501,9 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -
> -       rtx reg =3D gen_rtx_REG (mode, regno);
> --      poly_int64 offset =3D cfun->machine->frame.reg_offset[regno];
> -+      poly_int64 offset =3D frame.reg_offset[regno];
> -       if (frame_pointer_needed)
> --      offset -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> -+      offset -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> -       offset +=3D crtl->outgoing_args_size;
> -
> -@@ -9526,14 +9528,14 @@ aarch64_process_components (sbitmap components, =
bool prologue_p)
> -         break;
> -       }
> -
> --      poly_int64 offset2 =3D cfun->machine->frame.reg_offset[regno2];
> -+      poly_int64 offset2 =3D frame.reg_offset[regno2];
> -       /* The next register is not of the same class or its offset is no=
t
> -        mergeable with the current one into a pair.  */
> -       if (aarch64_sve_mode_p (mode)
> -         || !satisfies_constraint_Ump (mem)
> -         || GP_REGNUM_P (regno) !=3D GP_REGNUM_P (regno2)
> -         || (crtl->abi->id () =3D=3D ARM_PCS_SIMD && FP_REGNUM_P (regno)=
)
> --        || maybe_ne ((offset2 - cfun->machine->frame.reg_offset[regno])=
,
> -+        || maybe_ne ((offset2 - frame.reg_offset[regno]),
> -                      GET_MODE_SIZE (mode)))
> -       {
> -         insn =3D emit_insn (set);
> -@@ -9555,7 +9557,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
> -       /* REGNO2 can be saved/restored in a pair with REGNO.  */
> -       rtx reg2 =3D gen_rtx_REG (mode, regno2);
> -       if (frame_pointer_needed)
> --      offset2 -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> -+      offset2 -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> -       offset2 +=3D crtl->outgoing_args_size;
> -       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
> -@@ -9650,6 +9652,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
> -                                       bool frame_related_p,
> -                                       bool final_adjustment_p)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   HOST_WIDE_INT guard_size
> -     =3D 1 << param_stack_clash_protection_guard_size;
> -   HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUARD;
> -@@ -9670,25 +9673,25 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
> -        register as a probe.  We can't assume that LR was saved at posit=
ion 0
> -        though, so treat any space below it as unprobed.  */
> -   if (final_adjustment_p
> --      && known_eq (cfun->machine->frame.below_hard_fp_saved_regs_size, =
0))
> -+      && known_eq (frame.below_hard_fp_saved_regs_size, 0))
> -     {
> --      poly_int64 lr_offset =3D cfun->machine->frame.reg_offset[LR_REGNU=
M];
> -+      poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM];
> -       if (known_ge (lr_offset, 0))
> -       min_probe_threshold -=3D lr_offset.to_constant ();
> -       else
> -       gcc_assert (!flag_stack_clash_protection || known_eq (poly_size, =
0));
> -     }
> -
> --  poly_int64 frame_size =3D cfun->machine->frame.frame_size;
> -+  poly_int64 frame_size =3D frame.frame_size;
> -
> -   /* We should always have a positive probe threshold.  */
> -   gcc_assert (min_probe_threshold > 0);
> -
> -   if (flag_stack_clash_protection && !final_adjustment_p)
> -     {
> --      poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust=
;
> --      poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_=
adjust;
> --      poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
> -+      poly_int64 initial_adjust =3D frame.initial_adjust;
> -+      poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -+      poly_int64 final_adjust =3D frame.final_adjust;
> -
> -       if (known_eq (frame_size, 0))
> -       {
> -@@ -9977,17 +9980,18 @@ aarch64_epilogue_uses (int regno)
> - void
> - aarch64_expand_prologue (void)
> - {
> --  poly_int64 frame_size =3D cfun->machine->frame.frame_size;
> --  poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust;
> --  HOST_WIDE_INT callee_adjust =3D cfun->machine->frame.callee_adjust;
> --  poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
> --  poly_int64 callee_offset =3D cfun->machine->frame.callee_offset;
> --  poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_adju=
st;
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -+  poly_int64 frame_size =3D frame.frame_size;
> -+  poly_int64 initial_adjust =3D frame.initial_adjust;
> -+  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -+  poly_int64 final_adjust =3D frame.final_adjust;
> -+  poly_int64 callee_offset =3D frame.callee_offset;
> -+  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -   poly_int64 below_hard_fp_saved_regs_size
> --    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> --  unsigned reg1 =3D cfun->machine->frame.wb_push_candidate1;
> --  unsigned reg2 =3D cfun->machine->frame.wb_push_candidate2;
> --  bool emit_frame_chain =3D cfun->machine->frame.emit_frame_chain;
> -+    =3D frame.below_hard_fp_saved_regs_size;
> -+  unsigned reg1 =3D frame.wb_push_candidate1;
> -+  unsigned reg2 =3D frame.wb_push_candidate2;
> -+  bool emit_frame_chain =3D frame.emit_frame_chain;
> -   rtx_insn *insn;
> -
> -   if (flag_stack_clash_protection && known_eq (callee_adjust, 0))
> -@@ -10018,7 +10022,7 @@ aarch64_expand_prologue (void)
> -     }
> -
> -   /* Push return address to shadow call stack.  */
> --  if (cfun->machine->frame.is_scs_enabled)
> -+  if (frame.is_scs_enabled)
> -     emit_insn (gen_scs_push ());
> -
> -   if (flag_stack_usage_info)
> -@@ -10057,7 +10061,7 @@ aarch64_expand_prologue (void)
> -
> -   /* The offset of the frame chain record (if any) from the current SP.=
  */
> -   poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> --                           - cfun->machine->frame.hard_fp_offset);
> -+                           - frame.hard_fp_offset);
> -   gcc_assert (known_ge (chain_offset, 0));
> -
> -   /* The offset of the bottom of the save area from the current SP.  */
> -@@ -10160,16 +10164,17 @@ aarch64_use_return_insn_p (void)
> - void
> - aarch64_expand_epilogue (bool for_sibcall)
> - {
> --  poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust;
> --  HOST_WIDE_INT callee_adjust =3D cfun->machine->frame.callee_adjust;
> --  poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
> --  poly_int64 callee_offset =3D cfun->machine->frame.callee_offset;
> --  poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_adju=
st;
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -+  poly_int64 initial_adjust =3D frame.initial_adjust;
> -+  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -+  poly_int64 final_adjust =3D frame.final_adjust;
> -+  poly_int64 callee_offset =3D frame.callee_offset;
> -+  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -   poly_int64 below_hard_fp_saved_regs_size
> --    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> --  unsigned reg1 =3D cfun->machine->frame.wb_pop_candidate1;
> --  unsigned reg2 =3D cfun->machine->frame.wb_pop_candidate2;
> --  unsigned int last_gpr =3D (cfun->machine->frame.is_scs_enabled
> -+    =3D frame.below_hard_fp_saved_regs_size;
> -+  unsigned reg1 =3D frame.wb_pop_candidate1;
> -+  unsigned reg2 =3D frame.wb_pop_candidate2;
> -+  unsigned int last_gpr =3D (frame.is_scs_enabled
> -                          ? R29_REGNUM : R30_REGNUM);
> -   rtx cfi_ops =3D NULL;
> -   rtx_insn *insn;
> -@@ -10203,7 +10208,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> -   /* We need to add memory barrier to prevent read from deallocated sta=
ck.  */
> -   bool need_barrier_p
> -     =3D maybe_ne (get_frame_size ()
> --              + cfun->machine->frame.saved_varargs_size, 0);
> -+              + frame.saved_varargs_size, 0);
> -
> -   /* Emit a barrier to prevent loads from a deallocated stack.  */
> -   if (maybe_gt (final_adjust, crtl->outgoing_args_size)
> -@@ -10284,7 +10289,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> -     }
> -
> -   /* Pop return address from shadow call stack.  */
> --  if (cfun->machine->frame.is_scs_enabled)
> -+  if (frame.is_scs_enabled)
> -     {
> -       machine_mode mode =3D aarch64_reg_save_mode (R30_REGNUM);
> -       rtx reg =3D gen_rtx_REG (mode, R30_REGNUM);
> -@@ -12740,24 +12745,24 @@ aarch64_can_eliminate (const int from ATTRIBUT=
E_UNUSED, const int to)
> - poly_int64
> - aarch64_initial_elimination_offset (unsigned from, unsigned to)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -+
> -   if (to =3D=3D HARD_FRAME_POINTER_REGNUM)
> -     {
> -       if (from =3D=3D ARG_POINTER_REGNUM)
> --      return cfun->machine->frame.hard_fp_offset;
> -+      return frame.hard_fp_offset;
> -
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --      return cfun->machine->frame.hard_fp_offset
> --             - cfun->machine->frame.locals_offset;
> -+      return frame.hard_fp_offset - frame.locals_offset;
> -     }
> -
> -   if (to =3D=3D STACK_POINTER_REGNUM)
> -     {
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --        return cfun->machine->frame.frame_size
> --               - cfun->machine->frame.locals_offset;
> -+      return frame.frame_size - frame.locals_offset;
> -     }
> -
> --  return cfun->machine->frame.frame_size;
> -+  return frame.frame_size;
> - }
> -
> -
> ---
> -2.34.1
> -
> -
> -From 89a9fa287706c5011f61926eaf65e7b996b963a3 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:12 +0100
> -Subject: [PATCH 02/19] aarch64: Avoid a use of callee_offset
> -
> -When we emit the frame chain, i.e. when we reach Here in this statement
> -of aarch64_expand_prologue:
> -
> -  if (emit_frame_chain)
> -    {
> -      // Here
> -      ...
> -    }
> -
> -the stack is in one of two states:
> -
> -- We've allocated up to the frame chain, but no more.
> -
> -- We've allocated the whole frame, and the frame chain is within easy
> -  reach of the new SP.
> -
> -The offset of the frame chain from the current SP is available
> -in aarch64_frame as callee_offset.  It is also available as the
> -chain_offset local variable, where the latter is calculated from other
> -data.  (However, chain_offset is not always equal to callee_offset when
> -!emit_frame_chain, so chain_offset isn't redundant.)
> -
> -In c600df9a4060da3c6121ff4d0b93f179eafd69d1 I switched to using
> -chain_offset for the initialisation of the hard frame pointer:
> -
> -       aarch64_add_offset (Pmode, hard_frame_pointer_rtx,
> --                         stack_pointer_rtx, callee_offset,
> -+                         stack_pointer_rtx, chain_offset,
> -                          tmp1_rtx, tmp0_rtx, frame_pointer_needed);
> -
> -But the later REG_CFA_ADJUST_CFA handling still used callee_offset.
> -
> -I think the difference is harmless, but it's more logical for the
> -CFA note to be in sync, and it's more convenient for later patches
> -if it uses chain_offset.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_expand_prologue): Use
> -       chain_offset rather than callee_offset.
> ----
> - gcc/config/aarch64/aarch64.cc | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 5d473d161d9..4f233c95140 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -9985,7 +9985,6 @@ aarch64_expand_prologue (void)
> -   poly_int64 initial_adjust =3D frame.initial_adjust;
> -   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -   poly_int64 final_adjust =3D frame.final_adjust;
> --  poly_int64 callee_offset =3D frame.callee_offset;
> -   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -   poly_int64 below_hard_fp_saved_regs_size
> -     =3D frame.below_hard_fp_saved_regs_size;
> -@@ -10098,8 +10097,7 @@ aarch64_expand_prologue (void)
> -            implicit.  */
> -         if (!find_reg_note (insn, REG_CFA_ADJUST_CFA, NULL_RTX))
> -           {
> --            rtx src =3D plus_constant (Pmode, stack_pointer_rtx,
> --                                     callee_offset);
> -+            rtx src =3D plus_constant (Pmode, stack_pointer_rtx, chain_=
offset);
> -             add_reg_note (insn, REG_CFA_ADJUST_CFA,
> -                           gen_rtx_SET (hard_frame_pointer_rtx, src));
> -           }
> ---
> -2.34.1
> -
> -
> -From b36a2a78040722dab6124366c5d6baf8eaf80aef Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:13 +0100
> -Subject: [PATCH 03/19] aarch64: Explicitly handle frames with no saved
> - registers
> -
> -If a frame has no saved registers, it can be allocated in one go.
> -There is no need to treat the areas below and above the saved
> -registers as separate.
> -
> -And if we allocate the frame in one go, it should be allocated
> -as the initial_adjust rather than the final_adjust.  This allows the
> -frame size to grow to guard_size - guard_used_by_caller before a stack
> -probe is needed.  (A frame with no register saves is necessarily a
> -leaf frame.)
> -
> -This is a no-op as thing stand, since a leaf function will have
> -no outgoing arguments, and so all the frame will be above where
> -the saved registers normally go.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Explicitly
> -       allocate the frame in one go if there are no saved registers.
> ----
> - gcc/config/aarch64/aarch64.cc | 8 +++++---
> - 1 file changed, 5 insertions(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 4f233c95140..37643041ffb 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8639,9 +8639,11 @@ aarch64_layout_frame (void)
> -
> -   HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_offset;
> -   HOST_WIDE_INT const_saved_regs_size;
> --  if (frame.frame_size.is_constant (&const_size)
> --      && const_size < max_push_offset
> --      && known_eq (frame.hard_fp_offset, const_size))
> -+  if (known_eq (frame.saved_regs_size, 0))
> -+    frame.initial_adjust =3D frame.frame_size;
> -+  else if (frame.frame_size.is_constant (&const_size)
> -+         && const_size < max_push_offset
> -+         && known_eq (frame.hard_fp_offset, const_size))
> -     {
> -       /* Simple, small frame with no outgoing arguments:
> -
> ---
> -2.34.1
> -
> -
> -From ada2ab0093596be707f23a3466ac82cff59fcffe Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:13 +0100
> -Subject: [PATCH 04/19] aarch64: Add bytes_below_saved_regs to frame info
> -
> -The frame layout code currently hard-codes the assumption that
> -the number of bytes below the saved registers is equal to the
> -size of the outgoing arguments.  This patch abstracts that
> -value into a new field of aarch64_frame.
> -
> -gcc/
> -       * config/aarch64/aarch64.h (aarch64_frame::bytes_below_saved_regs=
): New
> -       field.
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Initialize it=
,
> -       and use it instead of crtl->outgoing_args_size.
> -       (aarch64_get_separate_components): Use bytes_below_saved_regs ins=
tead
> -       of outgoing_args_size.
> -       (aarch64_process_components): Likewise.
> ----
> - gcc/config/aarch64/aarch64.cc | 71 ++++++++++++++++++-----------------
> - gcc/config/aarch64/aarch64.h  |  5 +++
> - 2 files changed, 41 insertions(+), 35 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 37643041ffb..dacc2b0e4dd 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8478,6 +8478,8 @@ aarch64_layout_frame (void)
> -   gcc_assert (crtl->is_leaf
> -             || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRE=
D));
> -
> -+  frame.bytes_below_saved_regs =3D crtl->outgoing_args_size;
> -+
> -   /* Now assign stack slots for the registers.  Start with the predicat=
e
> -      registers, since predicate LDR and STR have a relatively small
> -      offset range.  These saves happen below the hard frame pointer.  *=
/
> -@@ -8582,18 +8584,18 @@ aarch64_layout_frame (void)
> -
> -   poly_int64 varargs_and_saved_regs_size =3D offset + frame.saved_varar=
gs_size;
> -
> --  poly_int64 above_outgoing_args
> -+  poly_int64 saved_regs_and_above
> -     =3D aligned_upper_bound (varargs_and_saved_regs_size
> -                          + get_frame_size (),
> -                          STACK_BOUNDARY / BITS_PER_UNIT);
> -
> -   frame.hard_fp_offset
> --    =3D above_outgoing_args - frame.below_hard_fp_saved_regs_size;
> -+    =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
> -
> -   /* Both these values are already aligned.  */
> --  gcc_assert (multiple_p (crtl->outgoing_args_size,
> -+  gcc_assert (multiple_p (frame.bytes_below_saved_regs,
> -                         STACK_BOUNDARY / BITS_PER_UNIT));
> --  frame.frame_size =3D above_outgoing_args + crtl->outgoing_args_size;
> -+  frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved_r=
egs;
> -
> -   frame.locals_offset =3D frame.saved_varargs_size;
> -
> -@@ -8637,7 +8639,7 @@ aarch64_layout_frame (void)
> -   else if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)
> -     max_push_offset =3D 256;
> -
> --  HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_offset;
> -+  HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;
> -   HOST_WIDE_INT const_saved_regs_size;
> -   if (known_eq (frame.saved_regs_size, 0))
> -     frame.initial_adjust =3D frame.frame_size;
> -@@ -8645,31 +8647,31 @@ aarch64_layout_frame (void)
> -          && const_size < max_push_offset
> -          && known_eq (frame.hard_fp_offset, const_size))
> -     {
> --      /* Simple, small frame with no outgoing arguments:
> -+      /* Simple, small frame with no data below the saved registers.
> -
> -        stp reg1, reg2, [sp, -frame_size]!
> -        stp reg3, reg4, [sp, 16]  */
> -       frame.callee_adjust =3D const_size;
> -     }
> --  else if (crtl->outgoing_args_size.is_constant (&const_outgoing_args_s=
ize)
> -+  else if (frame.bytes_below_saved_regs.is_constant (&const_below_saved=
_regs)
> -          && frame.saved_regs_size.is_constant (&const_saved_regs_size)
> --         && const_outgoing_args_size + const_saved_regs_size < 512
> --         /* We could handle this case even with outgoing args, provided
> --            that the number of args left us with valid offsets for all
> --            predicate and vector save slots.  It's such a rare case tha=
t
> --            it hardly seems worth the effort though.  */
> --         && (!saves_below_hard_fp_p || const_outgoing_args_size =3D=3D =
0)
> -+         && const_below_saved_regs + const_saved_regs_size < 512
> -+         /* We could handle this case even with data below the saved
> -+            registers, provided that that data left us with valid offse=
ts
> -+            for all predicate and vector save slots.  It's such a rare
> -+            case that it hardly seems worth the effort though.  */
> -+         && (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D 0)
> -          && !(cfun->calls_alloca
> -               && frame.hard_fp_offset.is_constant (&const_fp_offset)
> -               && const_fp_offset < max_push_offset))
> -     {
> --      /* Frame with small outgoing arguments:
> -+      /* Frame with small area below the saved registers:
> -
> -        sub sp, sp, frame_size
> --       stp reg1, reg2, [sp, outgoing_args_size]
> --       stp reg3, reg4, [sp, outgoing_args_size + 16]  */
> -+       stp reg1, reg2, [sp, bytes_below_saved_regs]
> -+       stp reg3, reg4, [sp, bytes_below_saved_regs + 16]  */
> -       frame.initial_adjust =3D frame.frame_size;
> --      frame.callee_offset =3D const_outgoing_args_size;
> -+      frame.callee_offset =3D const_below_saved_regs;
> -     }
> -   else if (saves_below_hard_fp_p
> -          && known_eq (frame.saved_regs_size,
> -@@ -8679,30 +8681,29 @@ aarch64_layout_frame (void)
> -
> -        sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
> -        save SVE registers relative to SP
> --       sub sp, sp, outgoing_args_size  */
> -+       sub sp, sp, bytes_below_saved_regs  */
> -       frame.initial_adjust =3D (frame.hard_fp_offset
> -                             + frame.below_hard_fp_saved_regs_size);
> --      frame.final_adjust =3D crtl->outgoing_args_size;
> -+      frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -   else if (frame.hard_fp_offset.is_constant (&const_fp_offset)
> -          && const_fp_offset < max_push_offset)
> -     {
> --      /* Frame with large outgoing arguments or SVE saves, but with
> --       a small local area:
> -+      /* Frame with large area below the saved registers, or with SVE s=
aves,
> -+       but with a small area above:
> -
> -        stp reg1, reg2, [sp, -hard_fp_offset]!
> -        stp reg3, reg4, [sp, 16]
> -        [sub sp, sp, below_hard_fp_saved_regs_size]
> -        [save SVE registers relative to SP]
> --       sub sp, sp, outgoing_args_size  */
> -+       sub sp, sp, bytes_below_saved_regs  */
> -       frame.callee_adjust =3D const_fp_offset;
> -       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> --      frame.final_adjust =3D crtl->outgoing_args_size;
> -+      frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -   else
> -     {
> --      /* Frame with large local area and outgoing arguments or SVE save=
s,
> --       using frame pointer:
> -+      /* General case:
> -
> -        sub sp, sp, hard_fp_offset
> -        stp x29, x30, [sp, 0]
> -@@ -8710,10 +8711,10 @@ aarch64_layout_frame (void)
> -        stp reg3, reg4, [sp, 16]
> -        [sub sp, sp, below_hard_fp_saved_regs_size]
> -        [save SVE registers relative to SP]
> --       sub sp, sp, outgoing_args_size  */
> -+       sub sp, sp, bytes_below_saved_regs  */
> -       frame.initial_adjust =3D frame.hard_fp_offset;
> -       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> --      frame.final_adjust =3D crtl->outgoing_args_size;
> -+      frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -
> -   /* Make sure the individual adjustments add up to the full frame size=
.  */
> -@@ -9358,7 +9359,7 @@ aarch64_get_separate_components (void)
> -       if (frame_pointer_needed)
> -         offset -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> --        offset +=3D crtl->outgoing_args_size;
> -+        offset +=3D frame.bytes_below_saved_regs;
> -
> -       /* Check that we can access the stack slot of the register with o=
ne
> -          direct load with no adjustments needed.  */
> -@@ -9507,7 +9508,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
> -       if (frame_pointer_needed)
> -       offset -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> --      offset +=3D crtl->outgoing_args_size;
> -+      offset +=3D frame.bytes_below_saved_regs;
> -
> -       rtx addr =3D plus_constant (Pmode, ptr_reg, offset);
> -       rtx mem =3D gen_frame_mem (mode, addr);
> -@@ -9561,7 +9562,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
> -       if (frame_pointer_needed)
> -       offset2 -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> --      offset2 +=3D crtl->outgoing_args_size;
> -+      offset2 +=3D frame.bytes_below_saved_regs;
> -       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
> -       rtx mem2 =3D gen_frame_mem (mode, addr2);
> -       rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, reg2)
> -@@ -9635,10 +9636,10 @@ aarch64_stack_clash_protection_alloca_probe_rang=
e (void)
> -    registers.  If POLY_SIZE is not large enough to require a probe this=
 function
> -    will only adjust the stack.  When allocating the stack space
> -    FRAME_RELATED_P is then used to indicate if the allocation is frame =
related.
> --   FINAL_ADJUSTMENT_P indicates whether we are allocating the outgoing
> --   arguments.  If we are then we ensure that any allocation larger than=
 the ABI
> --   defined buffer needs a probe so that the invariant of having a 1KB b=
uffer is
> --   maintained.
> -+   FINAL_ADJUSTMENT_P indicates whether we are allocating the area belo=
w
> -+   the saved registers.  If we are then we ensure that any allocation
> -+   larger than the ABI defined buffer needs a probe so that the
> -+   invariant of having a 1KB buffer is maintained.
> -
> -    We emit barriers after each stack adjustment to prevent optimization=
s from
> -    breaking the invariant that we never drop the stack more than a page=
.  This
> -@@ -9847,7 +9848,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
> -   /* Handle any residuals.  Residuals of at least MIN_PROBE_THRESHOLD h=
ave to
> -      be probed.  This maintains the requirement that each page is probe=
d at
> -      least once.  For initial probing we probe only if the allocation i=
s
> --     more than GUARD_SIZE - buffer, and for the outgoing arguments we p=
robe
> -+     more than GUARD_SIZE - buffer, and below the saved registers we pr=
obe
> -      if the amount is larger than buffer.  GUARD_SIZE - buffer + buffer=
 =3D=3D
> -      GUARD_SIZE.  This works that for any allocation that is large enou=
gh to
> -      trigger a probe here, we'll have at least one, and if they're not =
large
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> -index 73b09e20508..0b6faa3ddf1 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -777,6 +777,11 @@ struct GTY (()) aarch64_frame
> -   /* The size of the callee-save registers with a slot in REG_OFFSET.  =
*/
> -   poly_int64 saved_regs_size;
> -
> -+  /* The number of bytes between the bottom of the static frame (the bo=
ttom
> -+     of the outgoing arguments) and the bottom of the register save are=
a.
> -+     This value is always a multiple of STACK_BOUNDARY.  */
> -+  poly_int64 bytes_below_saved_regs;
> -+
> -   /* The size of the callee-save registers with a slot in REG_OFFSET th=
at
> -      are saved below the hard frame pointer.  */
> -   poly_int64 below_hard_fp_saved_regs_size;
> ---
> -2.34.1
> -
> -
> -From 82f6b3e1b596ef0f4e3ac3bb9c6e88fb4458f402 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:14 +0100
> -Subject: [PATCH 05/19] aarch64: Add bytes_below_hard_fp to frame info
> -
> -Following on from the previous bytes_below_saved_regs patch, this one
> -records the number of bytes that are below the hard frame pointer.
> -This eventually replaces below_hard_fp_saved_regs_size.
> -
> -If a frame pointer is not needed, the epilogue adds final_adjust
> -to the stack pointer before restoring registers:
> -
> -     aarch64_add_sp (tmp1_rtx, tmp0_rtx, final_adjust, true);
> -
> -Therefore, if the epilogue needs to restore the stack pointer from
> -the hard frame pointer, the directly corresponding offset is:
> -
> -     -bytes_below_hard_fp + final_adjust
> -
> -i.e. go from the hard frame pointer to the bottom of the frame,
> -then add the same amount as if we were using the stack pointer
> -from the outset.
> -
> -gcc/
> -       * config/aarch64/aarch64.h (aarch64_frame::bytes_below_hard_fp): =
New
> -       field.
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Initialize it=
.
> -       (aarch64_expand_epilogue): Use it instead of
> -       below_hard_fp_saved_regs_size.
> ----
> - gcc/config/aarch64/aarch64.cc | 6 +++---
> - gcc/config/aarch64/aarch64.h  | 5 +++++
> - 2 files changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index dacc2b0e4dd..a3f7aabcc59 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8530,6 +8530,7 @@ aarch64_layout_frame (void)
> -      of the callee save area.  */
> -   bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);
> -   frame.below_hard_fp_saved_regs_size =3D offset;
> -+  frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_regs;
> -   if (frame.emit_frame_chain)
> -     {
> -       /* FP and LR are placed in the linkage record.  */
> -@@ -10171,8 +10172,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> -   poly_int64 final_adjust =3D frame.final_adjust;
> -   poly_int64 callee_offset =3D frame.callee_offset;
> -   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> --  poly_int64 below_hard_fp_saved_regs_size
> --    =3D frame.below_hard_fp_saved_regs_size;
> -+  poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;
> -   unsigned reg1 =3D frame.wb_pop_candidate1;
> -   unsigned reg2 =3D frame.wb_pop_candidate2;
> -   unsigned int last_gpr =3D (frame.is_scs_enabled
> -@@ -10230,7 +10230,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> -        is restored on the instruction doing the writeback.  */
> -     aarch64_add_offset (Pmode, stack_pointer_rtx,
> -                       hard_frame_pointer_rtx,
> --                      -callee_offset - below_hard_fp_saved_regs_size,
> -+                      -bytes_below_hard_fp + final_adjust,
> -                       tmp1_rtx, tmp0_rtx, callee_adjust =3D=3D 0);
> -   else
> -      /* The case where we need to re-use the register here is very rare=
, so
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> -index 0b6faa3ddf1..4263d29d29d 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -786,6 +786,11 @@ struct GTY (()) aarch64_frame
> -      are saved below the hard frame pointer.  */
> -   poly_int64 below_hard_fp_saved_regs_size;
> -
> -+  /* The number of bytes between the bottom of the static frame (the bo=
ttom
> -+     of the outgoing arguments) and the hard frame pointer.  This value=
 is
> -+     always a multiple of STACK_BOUNDARY.  */
> -+  poly_int64 bytes_below_hard_fp;
> -+
> -   /* Offset from the base of the frame (incomming SP) to the
> -      top of the locals area.  This value is always a multiple of
> -      STACK_BOUNDARY.  */
> ---
> -2.34.1
> -
> -
> -From 86fa43e9fe4a8bf954f2919f07cbe3646d1d1df3 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:14 +0100
> -Subject: [PATCH 06/19] aarch64: Tweak aarch64_save/restore_callee_saves
> -
> -aarch64_save_callee_saves and aarch64_restore_callee_saves took
> -a parameter called start_offset that gives the offset of the
> -bottom of the saved register area from the current stack pointer.
> -However, it's more convenient for later patches if we use the
> -bottom of the entire frame as the reference point, rather than
> -the bottom of the saved registers.
> -
> -Doing that removes the need for the callee_offset field.
> -Other than that, this is not a win on its own.  It only really
> -makes sense in combination with the follow-on patches.
> -
> -gcc/
> -       * config/aarch64/aarch64.h (aarch64_frame::callee_offset): Delete=
.
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Remove
> -       callee_offset handling.
> -       (aarch64_save_callee_saves): Replace the start_offset parameter
> -       with a bytes_below_sp parameter.
> -       (aarch64_restore_callee_saves): Likewise.
> -       (aarch64_expand_prologue): Update accordingly.
> -       (aarch64_expand_epilogue): Likewise.
> ----
> - gcc/config/aarch64/aarch64.cc | 56 +++++++++++++++++------------------
> - gcc/config/aarch64/aarch64.h  |  4 ---
> - 2 files changed, 28 insertions(+), 32 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index a3f7aabcc59..46ae5cf7673 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8604,7 +8604,6 @@ aarch64_layout_frame (void)
> -   frame.final_adjust =3D 0;
> -   frame.callee_adjust =3D 0;
> -   frame.sve_callee_adjust =3D 0;
> --  frame.callee_offset =3D 0;
> -
> -   frame.wb_pop_candidate1 =3D frame.wb_push_candidate1;
> -   frame.wb_pop_candidate2 =3D frame.wb_push_candidate2;
> -@@ -8672,7 +8671,6 @@ aarch64_layout_frame (void)
> -        stp reg1, reg2, [sp, bytes_below_saved_regs]
> -        stp reg3, reg4, [sp, bytes_below_saved_regs + 16]  */
> -       frame.initial_adjust =3D frame.frame_size;
> --      frame.callee_offset =3D const_below_saved_regs;
> -     }
> -   else if (saves_below_hard_fp_p
> -          && known_eq (frame.saved_regs_size,
> -@@ -9073,12 +9071,13 @@ aarch64_add_cfa_expression (rtx_insn *insn, rtx =
reg,
> - }
> -
> - /* Emit code to save the callee-saved registers from register number ST=
ART
> --   to LIMIT to the stack at the location starting at offset START_OFFSE=
T,
> --   skipping any write-back candidates if SKIP_WB is true.  HARD_FP_VALI=
D_P
> --   is true if the hard frame pointer has been set up.  */
> -+   to LIMIT to the stack.  The stack pointer is currently BYTES_BELOW_S=
P
> -+   bytes above the bottom of the static frame.  Skip any write-back
> -+   candidates if SKIP_WB is true.  HARD_FP_VALID_P is true if the hard
> -+   frame pointer has been set up.  */
> -
> - static void
> --aarch64_save_callee_saves (poly_int64 start_offset,
> -+aarch64_save_callee_saves (poly_int64 bytes_below_sp,
> -                          unsigned start, unsigned limit, bool skip_wb,
> -                          bool hard_fp_valid_p)
> - {
> -@@ -9106,7 +9105,9 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D start_offset + frame.reg_offset[regno];
> -+      offset =3D (frame.reg_offset[regno]
> -+              + frame.bytes_below_saved_regs
> -+              - bytes_below_sp);
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       poly_int64 sp_offset =3D offset;
> -
> -@@ -9117,9 +9118,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> -       else if (GP_REGNUM_P (regno)
> -              && (!offset.is_constant (&const_offset) || const_offset >=
=3D 512))
> -       {
> --        gcc_assert (known_eq (start_offset, 0));
> --        poly_int64 fp_offset
> --          =3D frame.below_hard_fp_saved_regs_size;
> -+        poly_int64 fp_offset =3D frame.bytes_below_hard_fp - bytes_belo=
w_sp;
> -         if (hard_fp_valid_p)
> -           base_rtx =3D hard_frame_pointer_rtx;
> -         else
> -@@ -9183,12 +9182,13 @@ aarch64_save_callee_saves (poly_int64 start_offs=
et,
> - }
> -
> - /* Emit code to restore the callee registers from register number START
> --   up to and including LIMIT.  Restore from the stack offset START_OFFS=
ET,
> --   skipping any write-back candidates if SKIP_WB is true.  Write the
> --   appropriate REG_CFA_RESTORE notes into CFI_OPS.  */
> -+   up to and including LIMIT.  The stack pointer is currently BYTES_BEL=
OW_SP
> -+   bytes above the bottom of the static frame.  Skip any write-back
> -+   candidates if SKIP_WB is true.  Write the appropriate REG_CFA_RESTOR=
E
> -+   notes into CFI_OPS.  */
> -
> - static void
> --aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start,
> -+aarch64_restore_callee_saves (poly_int64 bytes_below_sp, unsigned start=
,
> -                             unsigned limit, bool skip_wb, rtx *cfi_ops)
> - {
> -   aarch64_frame &frame =3D cfun->machine->frame;
> -@@ -9214,7 +9214,9 @@ aarch64_restore_callee_saves (poly_int64 start_off=
set, unsigned start,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D start_offset + frame.reg_offset[regno];
> -+      offset =3D (frame.reg_offset[regno]
> -+              + frame.bytes_below_saved_regs
> -+              - bytes_below_sp);
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> -       aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
> -@@ -9990,8 +9992,6 @@ aarch64_expand_prologue (void)
> -   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -   poly_int64 final_adjust =3D frame.final_adjust;
> -   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> --  poly_int64 below_hard_fp_saved_regs_size
> --    =3D frame.below_hard_fp_saved_regs_size;
> -   unsigned reg1 =3D frame.wb_push_candidate1;
> -   unsigned reg2 =3D frame.wb_push_candidate2;
> -   bool emit_frame_chain =3D frame.emit_frame_chain;
> -@@ -10067,8 +10067,8 @@ aarch64_expand_prologue (void)
> -                            - frame.hard_fp_offset);
> -   gcc_assert (known_ge (chain_offset, 0));
> -
> --  /* The offset of the bottom of the save area from the current SP.  */
> --  poly_int64 saved_regs_offset =3D chain_offset - below_hard_fp_saved_r=
egs_size;
> -+  /* The offset of the current SP from the bottom of the static frame. =
 */
> -+  poly_int64 bytes_below_sp =3D frame_size - initial_adjust - callee_ad=
just;
> -
> -   if (emit_frame_chain)
> -     {
> -@@ -10076,7 +10076,7 @@ aarch64_expand_prologue (void)
> -       {
> -         reg1 =3D R29_REGNUM;
> -         reg2 =3D R30_REGNUM;
> --        aarch64_save_callee_saves (saved_regs_offset, reg1, reg2,
> -+        aarch64_save_callee_saves (bytes_below_sp, reg1, reg2,
> -                                    false, false);
> -       }
> -       else
> -@@ -10116,7 +10116,7 @@ aarch64_expand_prologue (void)
> -       emit_insn (gen_stack_tie (stack_pointer_rtx, hard_frame_pointer_r=
tx));
> -     }
> -
> --  aarch64_save_callee_saves (saved_regs_offset, R0_REGNUM, R30_REGNUM,
> -+  aarch64_save_callee_saves (bytes_below_sp, R0_REGNUM, R30_REGNUM,
> -                            callee_adjust !=3D 0 || emit_frame_chain,
> -                            emit_frame_chain);
> -   if (maybe_ne (sve_callee_adjust, 0))
> -@@ -10126,16 +10126,17 @@ aarch64_expand_prologue (void)
> -       aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx,
> -                                             sve_callee_adjust,
> -                                             !frame_pointer_needed, fals=
e);
> --      saved_regs_offset +=3D sve_callee_adjust;
> -+      bytes_below_sp -=3D sve_callee_adjust;
> -     }
> --  aarch64_save_callee_saves (saved_regs_offset, P0_REGNUM, P15_REGNUM,
> -+  aarch64_save_callee_saves (bytes_below_sp, P0_REGNUM, P15_REGNUM,
> -                            false, emit_frame_chain);
> --  aarch64_save_callee_saves (saved_regs_offset, V0_REGNUM, V31_REGNUM,
> -+  aarch64_save_callee_saves (bytes_below_sp, V0_REGNUM, V31_REGNUM,
> -                            callee_adjust !=3D 0 || emit_frame_chain,
> -                            emit_frame_chain);
> -
> -   /* We may need to probe the final adjustment if it is larger than the=
 guard
> -      that is assumed by the called.  */
> -+  gcc_assert (known_eq (bytes_below_sp, final_adjust));
> -   aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx, final_adj=
ust,
> -                                         !frame_pointer_needed, true);
> - }
> -@@ -10170,7 +10171,6 @@ aarch64_expand_epilogue (bool for_sibcall)
> -   poly_int64 initial_adjust =3D frame.initial_adjust;
> -   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -   poly_int64 final_adjust =3D frame.final_adjust;
> --  poly_int64 callee_offset =3D frame.callee_offset;
> -   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -   poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;
> -   unsigned reg1 =3D frame.wb_pop_candidate1;
> -@@ -10240,9 +10240,9 @@ aarch64_expand_epilogue (bool for_sibcall)
> -
> -   /* Restore the vector registers before the predicate registers,
> -      so that we can use P4 as a temporary for big-endian SVE frames.  *=
/
> --  aarch64_restore_callee_saves (callee_offset, V0_REGNUM, V31_REGNUM,
> -+  aarch64_restore_callee_saves (final_adjust, V0_REGNUM, V31_REGNUM,
> -                               callee_adjust !=3D 0, &cfi_ops);
> --  aarch64_restore_callee_saves (callee_offset, P0_REGNUM, P15_REGNUM,
> -+  aarch64_restore_callee_saves (final_adjust, P0_REGNUM, P15_REGNUM,
> -                               false, &cfi_ops);
> -   if (maybe_ne (sve_callee_adjust, 0))
> -     aarch64_add_sp (NULL_RTX, NULL_RTX, sve_callee_adjust, true);
> -@@ -10250,7 +10250,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> -   /* When shadow call stack is enabled, the scs_pop in the epilogue wil=
l
> -      restore x30, we don't need to restore x30 again in the traditional
> -      way.  */
> --  aarch64_restore_callee_saves (callee_offset - sve_callee_adjust,
> -+  aarch64_restore_callee_saves (final_adjust + sve_callee_adjust,
> -                               R0_REGNUM, last_gpr,
> -                               callee_adjust !=3D 0, &cfi_ops);
> -
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> -index 4263d29d29d..fd820b1be4e 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -813,10 +813,6 @@ struct GTY (()) aarch64_frame
> -      It is zero when no push is used.  */
> -   HOST_WIDE_INT callee_adjust;
> -
> --  /* The offset from SP to the callee-save registers after initial_adju=
st.
> --     It may be non-zero if no push is used (ie. callee_adjust =3D=3D 0)=
.  */
> --  poly_int64 callee_offset;
> --
> -   /* The size of the stack adjustment before saving or after restoring
> -      SVE registers.  */
> -   poly_int64 sve_callee_adjust;
> ---
> -2.34.1
> -
> -
> -From 8ae9181426f2700c2e5a2909487fa630e6fa406b Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:15 +0100
> -Subject: [PATCH 07/19] aarch64: Only calculate chain_offset if there is =
a
> - chain
> -
> -After previous patches, it is no longer necessary to calculate
> -a chain_offset in cases where there is no chain record.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_expand_prologue): Move the
> -       calculation of chain_offset into the emit_frame_chain block.
> ----
> - gcc/config/aarch64/aarch64.cc | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 46ae5cf7673..0e9b9717c08 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -10062,16 +10062,16 @@ aarch64_expand_prologue (void)
> -   if (callee_adjust !=3D 0)
> -     aarch64_push_regs (reg1, reg2, callee_adjust);
> -
> --  /* The offset of the frame chain record (if any) from the current SP.=
  */
> --  poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> --                           - frame.hard_fp_offset);
> --  gcc_assert (known_ge (chain_offset, 0));
> --
> -   /* The offset of the current SP from the bottom of the static frame. =
 */
> -   poly_int64 bytes_below_sp =3D frame_size - initial_adjust - callee_ad=
just;
> -
> -   if (emit_frame_chain)
> -     {
> -+      /* The offset of the frame chain record (if any) from the current=
 SP.  */
> -+      poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> -+                               - frame.hard_fp_offset);
> -+      gcc_assert (known_ge (chain_offset, 0));
> -+
> -       if (callee_adjust =3D=3D 0)
> -       {
> -         reg1 =3D R29_REGNUM;
> ---
> -2.34.1
> -
> -
> -From 375794feb614cee1f41b710b9cc1b6f25da6c1cb Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:15 +0100
> -Subject: [PATCH 08/19] aarch64: Rename locals_offset to bytes_above_loca=
ls
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -locals_offset was described as:
> -
> -  /* Offset from the base of the frame (incomming SP) to the
> -     top of the locals area.  This value is always a multiple of
> -     STACK_BOUNDARY.  */
> -
> -This is implicitly an =E2=80=9Cupside down=E2=80=9D view of the frame: t=
he incoming
> -SP is at offset 0, and anything N bytes below the incoming SP is at
> -offset N (rather than -N).
> -
> -However, reg_offset instead uses a =E2=80=9Cright way up=E2=80=9D view; =
that is,
> -it views offsets in address terms.  Something above X is at a
> -positive offset from X and something below X is at a negative
> -offset from X.
> -
> -Also, even on FRAME_GROWS_DOWNWARD targets like AArch64,
> -target-independent code views offsets in address terms too:
> -locals are allocated at negative offsets to virtual_stack_vars.
> -
> -It seems confusing to have *_offset fields of the same structure
> -using different polarities like this.  This patch tries to avoid
> -that by renaming locals_offset to bytes_above_locals.
> -
> -gcc/
> -       * config/aarch64/aarch64.h (aarch64_frame::locals_offset): Rename=
 to...
> -       (aarch64_frame::bytes_above_locals): ...this.
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame)
> -       (aarch64_initial_elimination_offset): Update accordingly.
> ----
> - gcc/config/aarch64/aarch64.cc | 6 +++---
> - gcc/config/aarch64/aarch64.h  | 6 +++---
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 0e9b9717c08..0a22f91520e 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8598,7 +8598,7 @@ aarch64_layout_frame (void)
> -                         STACK_BOUNDARY / BITS_PER_UNIT));
> -   frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved_r=
egs;
> -
> --  frame.locals_offset =3D frame.saved_varargs_size;
> -+  frame.bytes_above_locals =3D frame.saved_varargs_size;
> -
> -   frame.initial_adjust =3D 0;
> -   frame.final_adjust =3D 0;
> -@@ -12754,13 +12754,13 @@ aarch64_initial_elimination_offset (unsigned f=
rom, unsigned to)
> -       return frame.hard_fp_offset;
> -
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --      return frame.hard_fp_offset - frame.locals_offset;
> -+      return frame.hard_fp_offset - frame.bytes_above_locals;
> -     }
> -
> -   if (to =3D=3D STACK_POINTER_REGNUM)
> -     {
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --      return frame.frame_size - frame.locals_offset;
> -+      return frame.frame_size - frame.bytes_above_locals;
> -     }
> -
> -   return frame.frame_size;
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> -index fd820b1be4e..7ae12d13e2b 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -791,10 +791,10 @@ struct GTY (()) aarch64_frame
> -      always a multiple of STACK_BOUNDARY.  */
> -   poly_int64 bytes_below_hard_fp;
> -
> --  /* Offset from the base of the frame (incomming SP) to the
> --     top of the locals area.  This value is always a multiple of
> -+  /* The number of bytes between the top of the locals area and the top
> -+     of the frame (the incomming SP).  This value is always a multiple =
of
> -      STACK_BOUNDARY.  */
> --  poly_int64 locals_offset;
> -+  poly_int64 bytes_above_locals;
> -
> -   /* Offset from the base of the frame (incomming SP) to the
> -      hard_frame_pointer.  This value is always a multiple of
> ---
> -2.34.1
> -
> -
> -From 1a9ea1c45c75615ffbfabe652b3598a1d7be2168 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:16 +0100
> -Subject: [PATCH 09/19] aarch64: Rename hard_fp_offset to bytes_above_har=
d_fp
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Similarly to the previous locals_offset patch, hard_fp_offset
> -was described as:
> -
> -  /* Offset from the base of the frame (incomming SP) to the
> -     hard_frame_pointer.  This value is always a multiple of
> -     STACK_BOUNDARY.  */
> -  poly_int64 hard_fp_offset;
> -
> -which again took an =E2=80=9Cupside-down=E2=80=9D view: higher offsets m=
eant lower
> -addresses.  This patch renames the field to bytes_above_hard_fp instead.
> -
> -gcc/
> -       * config/aarch64/aarch64.h (aarch64_frame::hard_fp_offset): Renam=
e
> -       to...
> -       (aarch64_frame::bytes_above_hard_fp): ...this.
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame)
> -       (aarch64_expand_prologue): Update accordingly.
> -       (aarch64_initial_elimination_offset): Likewise.
> ----
> - gcc/config/aarch64/aarch64.cc | 26 +++++++++++++-------------
> - gcc/config/aarch64/aarch64.h  |  6 +++---
> - 2 files changed, 16 insertions(+), 16 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 0a22f91520e..95499ae49ba 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8590,7 +8590,7 @@ aarch64_layout_frame (void)
> -                          + get_frame_size (),
> -                          STACK_BOUNDARY / BITS_PER_UNIT);
> -
> --  frame.hard_fp_offset
> -+  frame.bytes_above_hard_fp
> -     =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
> -
> -   /* Both these values are already aligned.  */
> -@@ -8639,13 +8639,13 @@ aarch64_layout_frame (void)
> -   else if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)
> -     max_push_offset =3D 256;
> -
> --  HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;
> -+  HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
> -   HOST_WIDE_INT const_saved_regs_size;
> -   if (known_eq (frame.saved_regs_size, 0))
> -     frame.initial_adjust =3D frame.frame_size;
> -   else if (frame.frame_size.is_constant (&const_size)
> -          && const_size < max_push_offset
> --         && known_eq (frame.hard_fp_offset, const_size))
> -+         && known_eq (frame.bytes_above_hard_fp, const_size))
> -     {
> -       /* Simple, small frame with no data below the saved registers.
> -
> -@@ -8662,8 +8662,8 @@ aarch64_layout_frame (void)
> -             case that it hardly seems worth the effort though.  */
> -          && (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D 0)
> -          && !(cfun->calls_alloca
> --              && frame.hard_fp_offset.is_constant (&const_fp_offset)
> --              && const_fp_offset < max_push_offset))
> -+              && frame.bytes_above_hard_fp.is_constant (&const_above_fp=
)
> -+              && const_above_fp < max_push_offset))
> -     {
> -       /* Frame with small area below the saved registers:
> -
> -@@ -8681,12 +8681,12 @@ aarch64_layout_frame (void)
> -        sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
> -        save SVE registers relative to SP
> -        sub sp, sp, bytes_below_saved_regs  */
> --      frame.initial_adjust =3D (frame.hard_fp_offset
> -+      frame.initial_adjust =3D (frame.bytes_above_hard_fp
> -                             + frame.below_hard_fp_saved_regs_size);
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> --  else if (frame.hard_fp_offset.is_constant (&const_fp_offset)
> --         && const_fp_offset < max_push_offset)
> -+  else if (frame.bytes_above_hard_fp.is_constant (&const_above_fp)
> -+         && const_above_fp < max_push_offset)
> -     {
> -       /* Frame with large area below the saved registers, or with SVE s=
aves,
> -        but with a small area above:
> -@@ -8696,7 +8696,7 @@ aarch64_layout_frame (void)
> -        [sub sp, sp, below_hard_fp_saved_regs_size]
> -        [save SVE registers relative to SP]
> -        sub sp, sp, bytes_below_saved_regs  */
> --      frame.callee_adjust =3D const_fp_offset;
> -+      frame.callee_adjust =3D const_above_fp;
> -       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -@@ -8711,7 +8711,7 @@ aarch64_layout_frame (void)
> -        [sub sp, sp, below_hard_fp_saved_regs_size]
> -        [save SVE registers relative to SP]
> -        sub sp, sp, bytes_below_saved_regs  */
> --      frame.initial_adjust =3D frame.hard_fp_offset;
> -+      frame.initial_adjust =3D frame.bytes_above_hard_fp;
> -       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -@@ -10069,7 +10069,7 @@ aarch64_expand_prologue (void)
> -     {
> -       /* The offset of the frame chain record (if any) from the current=
 SP.  */
> -       poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> --                               - frame.hard_fp_offset);
> -+                               - frame.bytes_above_hard_fp);
> -       gcc_assert (known_ge (chain_offset, 0));
> -
> -       if (callee_adjust =3D=3D 0)
> -@@ -12751,10 +12751,10 @@ aarch64_initial_elimination_offset (unsigned f=
rom, unsigned to)
> -   if (to =3D=3D HARD_FRAME_POINTER_REGNUM)
> -     {
> -       if (from =3D=3D ARG_POINTER_REGNUM)
> --      return frame.hard_fp_offset;
> -+      return frame.bytes_above_hard_fp;
> -
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --      return frame.hard_fp_offset - frame.bytes_above_locals;
> -+      return frame.bytes_above_hard_fp - frame.bytes_above_locals;
> -     }
> -
> -   if (to =3D=3D STACK_POINTER_REGNUM)
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> -index 7ae12d13e2b..3808f49e9ca 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -796,10 +796,10 @@ struct GTY (()) aarch64_frame
> -      STACK_BOUNDARY.  */
> -   poly_int64 bytes_above_locals;
> -
> --  /* Offset from the base of the frame (incomming SP) to the
> --     hard_frame_pointer.  This value is always a multiple of
> -+  /* The number of bytes between the hard_frame_pointer and the top of
> -+     the frame (the incomming SP).  This value is always a multiple of
> -      STACK_BOUNDARY.  */
> --  poly_int64 hard_fp_offset;
> -+  poly_int64 bytes_above_hard_fp;
> -
> -   /* The size of the frame.  This value is the offset from base of the
> -      frame (incomming SP) to the stack_pointer.  This value is always
> ---
> -2.34.1
> -
> -
> -From d202ce1ecf60a36a3e1009917dd76109248ce9be Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:16 +0100
> -Subject: [PATCH 10/19] aarch64: Tweak frame_size comment
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -This patch fixes another case in which a value was described with
> -an =E2=80=9Cupside-down=E2=80=9D view.
> -
> -gcc/
> -       * config/aarch64/aarch64.h (aarch64_frame::frame_size): Tweak com=
ment.
> ----
> - gcc/config/aarch64/aarch64.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> -index 3808f49e9ca..108a5731b0d 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -801,8 +801,8 @@ struct GTY (()) aarch64_frame
> -      STACK_BOUNDARY.  */
> -   poly_int64 bytes_above_hard_fp;
> -
> --  /* The size of the frame.  This value is the offset from base of the
> --     frame (incomming SP) to the stack_pointer.  This value is always
> -+  /* The size of the frame, i.e. the number of bytes between the bottom
> -+     of the outgoing arguments and the incoming SP.  This value is alwa=
ys
> -      a multiple of STACK_BOUNDARY.  */
> -   poly_int64 frame_size;
> -
> ---
> -2.34.1
> -
> -
> -From f2b585375205b0a1802d79c682ba33766ecd1f0f Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:17 +0100
> -Subject: [PATCH 11/19] aarch64: Measure reg_offset from the bottom of th=
e
> - frame
> -
> -reg_offset was measured from the bottom of the saved register area.
> -This made perfect sense with the original layout, since the bottom
> -of the saved register area was also the hard frame pointer address.
> -It became slightly less obvious with SVE, since we save SVE
> -registers below the hard frame pointer, but it still made sense.
> -
> -However, if we want to allow different frame layouts, it's more
> -convenient and obvious to measure reg_offset from the bottom of
> -the frame.  After previous patches, it's also a slight simplification
> -in its own right.
> -
> -gcc/
> -       * config/aarch64/aarch64.h (aarch64_frame): Add comment above
> -       reg_offset.
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Walk offsets
> -       from the bottom of the frame, rather than the bottom of the saved
> -       register area.  Measure reg_offset from the bottom of the frame
> -       rather than the bottom of the saved register area.
> -       (aarch64_save_callee_saves): Update accordingly.
> -       (aarch64_restore_callee_saves): Likewise.
> -       (aarch64_get_separate_components): Likewise.
> -       (aarch64_process_components): Likewise.
> ----
> - gcc/config/aarch64/aarch64.cc | 53 ++++++++++++++++-------------------
> - gcc/config/aarch64/aarch64.h  |  3 ++
> - 2 files changed, 27 insertions(+), 29 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 95499ae49ba..af99807ef8a 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8400,7 +8400,6 @@ aarch64_needs_frame_chain (void)
> - static void
> - aarch64_layout_frame (void)
> - {
> --  poly_int64 offset =3D 0;
> -   int regno, last_fp_reg =3D INVALID_REGNUM;
> -   machine_mode vector_save_mode =3D aarch64_reg_save_mode (V8_REGNUM);
> -   poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mode);
> -@@ -8478,7 +8477,9 @@ aarch64_layout_frame (void)
> -   gcc_assert (crtl->is_leaf
> -             || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRE=
D));
> -
> --  frame.bytes_below_saved_regs =3D crtl->outgoing_args_size;
> -+  poly_int64 offset =3D crtl->outgoing_args_size;
> -+  gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -+  frame.bytes_below_saved_regs =3D offset;
> -
> -   /* Now assign stack slots for the registers.  Start with the predicat=
e
> -      registers, since predicate LDR and STR have a relatively small
> -@@ -8490,7 +8491,8 @@ aarch64_layout_frame (void)
> -       offset +=3D BYTES_PER_SVE_PRED;
> -       }
> -
> --  if (maybe_ne (offset, 0))
> -+  poly_int64 saved_prs_size =3D offset - frame.bytes_below_saved_regs;
> -+  if (maybe_ne (saved_prs_size, 0))
> -     {
> -       /* If we have any vector registers to save above the predicate re=
gisters,
> -        the offset of the vector register save slots need to be a multip=
le
> -@@ -8508,10 +8510,10 @@ aarch64_layout_frame (void)
> -       offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER=
_UNIT);
> -       else
> -       {
> --        if (known_le (offset, vector_save_size))
> --          offset =3D vector_save_size;
> --        else if (known_le (offset, vector_save_size * 2))
> --          offset =3D vector_save_size * 2;
> -+        if (known_le (saved_prs_size, vector_save_size))
> -+          offset =3D frame.bytes_below_saved_regs + vector_save_size;
> -+        else if (known_le (saved_prs_size, vector_save_size * 2))
> -+          offset =3D frame.bytes_below_saved_regs + vector_save_size * =
2;
> -         else
> -           gcc_unreachable ();
> -       }
> -@@ -8528,9 +8530,10 @@ aarch64_layout_frame (void)
> -
> -   /* OFFSET is now the offset of the hard frame pointer from the bottom
> -      of the callee save area.  */
> --  bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);
> --  frame.below_hard_fp_saved_regs_size =3D offset;
> --  frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_regs;
> -+  frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_sa=
ved_regs;
> -+  bool saves_below_hard_fp_p
> -+    =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> -+  frame.bytes_below_hard_fp =3D offset;
> -   if (frame.emit_frame_chain)
> -     {
> -       /* FP and LR are placed in the linkage record.  */
> -@@ -8581,9 +8584,10 @@ aarch64_layout_frame (void)
> -
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> -
> --  frame.saved_regs_size =3D offset;
> -+  frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> -
> --  poly_int64 varargs_and_saved_regs_size =3D offset + frame.saved_varar=
gs_size;
> -+  poly_int64 varargs_and_saved_regs_size
> -+    =3D frame.saved_regs_size + frame.saved_varargs_size;
> -
> -   poly_int64 saved_regs_and_above
> -     =3D aligned_upper_bound (varargs_and_saved_regs_size
> -@@ -9105,9 +9109,7 @@ aarch64_save_callee_saves (poly_int64 bytes_below_=
sp,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D (frame.reg_offset[regno]
> --              + frame.bytes_below_saved_regs
> --              - bytes_below_sp);
> -+      offset =3D frame.reg_offset[regno] - bytes_below_sp;
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       poly_int64 sp_offset =3D offset;
> -
> -@@ -9214,9 +9216,7 @@ aarch64_restore_callee_saves (poly_int64 bytes_bel=
ow_sp, unsigned start,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D (frame.reg_offset[regno]
> --              + frame.bytes_below_saved_regs
> --              - bytes_below_sp);
> -+      offset =3D frame.reg_offset[regno] - bytes_below_sp;
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> -       aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
> -@@ -9355,14 +9355,12 @@ aarch64_get_separate_components (void)
> -          it as a stack probe for -fstack-clash-protection.  */
> -       if (flag_stack_clash_protection
> -           && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
> --          && known_eq (offset, 0))
> -+          && known_eq (offset, frame.bytes_below_saved_regs))
> -         continue;
> -
> -       /* Get the offset relative to the register we'll use.  */
> -       if (frame_pointer_needed)
> --        offset -=3D frame.below_hard_fp_saved_regs_size;
> --      else
> --        offset +=3D frame.bytes_below_saved_regs;
> -+        offset -=3D frame.bytes_below_hard_fp;
> -
> -       /* Check that we can access the stack slot of the register with o=
ne
> -          direct load with no adjustments needed.  */
> -@@ -9509,9 +9507,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
> -       rtx reg =3D gen_rtx_REG (mode, regno);
> -       poly_int64 offset =3D frame.reg_offset[regno];
> -       if (frame_pointer_needed)
> --      offset -=3D frame.below_hard_fp_saved_regs_size;
> --      else
> --      offset +=3D frame.bytes_below_saved_regs;
> -+      offset -=3D frame.bytes_below_hard_fp;
> -
> -       rtx addr =3D plus_constant (Pmode, ptr_reg, offset);
> -       rtx mem =3D gen_frame_mem (mode, addr);
> -@@ -9563,9 +9559,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
> -       /* REGNO2 can be saved/restored in a pair with REGNO.  */
> -       rtx reg2 =3D gen_rtx_REG (mode, regno2);
> -       if (frame_pointer_needed)
> --      offset2 -=3D frame.below_hard_fp_saved_regs_size;
> --      else
> --      offset2 +=3D frame.bytes_below_saved_regs;
> -+      offset2 -=3D frame.bytes_below_hard_fp;
> -       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
> -       rtx mem2 =3D gen_frame_mem (mode, addr2);
> -       rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, reg2)
> -@@ -9681,7 +9675,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
> -   if (final_adjustment_p
> -       && known_eq (frame.below_hard_fp_saved_regs_size, 0))
> -     {
> --      poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM];
> -+      poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM]
> -+                            - frame.bytes_below_saved_regs);
> -       if (known_ge (lr_offset, 0))
> -       min_probe_threshold -=3D lr_offset.to_constant ();
> -       else
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> -index 108a5731b0d..c8becb098c8 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -766,6 +766,9 @@ extern enum aarch64_processor aarch64_tune;
> - #ifdef HAVE_POLY_INT_H
> - struct GTY (()) aarch64_frame
> - {
> -+  /* The offset from the bottom of the static frame (the bottom of the
> -+     outgoing arguments) of each register save slot, or -2 if no save i=
s
> -+     needed.  */
> -   poly_int64 reg_offset[LAST_SAVED_REGNUM + 1];
> -
> -   /* The number of extra stack bytes taken up by register varargs.
> ---
> -2.34.1
> -
> -
> -From 79faabda181d0d9fd29a3cf5726ba65bdee945b5 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:17 +0100
> -Subject: [PATCH 12/19] aarch64: Simplify top of frame allocation
> -
> -After previous patches, it no longer really makes sense to allocate
> -the top of the frame in terms of varargs_and_saved_regs_size and
> -saved_regs_and_above.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Simplify
> -       the allocation of the top of the frame.
> ----
> - gcc/config/aarch64/aarch64.cc | 23 ++++++++---------------
> - 1 file changed, 8 insertions(+), 15 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index af99807ef8a..31b00094c2a 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8586,23 +8586,16 @@ aarch64_layout_frame (void)
> -
> -   frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> -
> --  poly_int64 varargs_and_saved_regs_size
> --    =3D frame.saved_regs_size + frame.saved_varargs_size;
> --
> --  poly_int64 saved_regs_and_above
> --    =3D aligned_upper_bound (varargs_and_saved_regs_size
> --                         + get_frame_size (),
> --                         STACK_BOUNDARY / BITS_PER_UNIT);
> --
> --  frame.bytes_above_hard_fp
> --    =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
> -+  offset +=3D get_frame_size ();
> -+  offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> -+  auto top_of_locals =3D offset;
> -
> --  /* Both these values are already aligned.  */
> --  gcc_assert (multiple_p (frame.bytes_below_saved_regs,
> --                        STACK_BOUNDARY / BITS_PER_UNIT));
> --  frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved_r=
egs;
> -+  offset +=3D frame.saved_varargs_size;
> -+  gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -+  frame.frame_size =3D offset;
> -
> --  frame.bytes_above_locals =3D frame.saved_varargs_size;
> -+  frame.bytes_above_hard_fp =3D frame.frame_size - frame.bytes_below_ha=
rd_fp;
> -+  frame.bytes_above_locals =3D frame.frame_size - top_of_locals;
> -
> -   frame.initial_adjust =3D 0;
> -   frame.final_adjust =3D 0;
> ---
> -2.34.1
> -
> -
> -From 4e62049e403b141e6f916176160dac8cbd65fe47 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:18 +0100
> -Subject: [PATCH 13/19] aarch64: Minor initial adjustment tweak
> -
> -This patch just changes a calculation of initial_adjust
> -to one that makes it slightly more obvious that the total
> -adjustment is frame.frame_size.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Tweak
> -       calculation of initial_adjust for frames in which all saves
> -       are SVE saves.
> ----
> - gcc/config/aarch64/aarch64.cc | 5 ++---
> - 1 file changed, 2 insertions(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 31b00094c2a..1aa79da0673 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8675,11 +8675,10 @@ aarch64_layout_frame (void)
> -     {
> -       /* Frame in which all saves are SVE saves:
> -
> --       sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
> -+       sub sp, sp, frame_size - bytes_below_saved_regs
> -        save SVE registers relative to SP
> -        sub sp, sp, bytes_below_saved_regs  */
> --      frame.initial_adjust =3D (frame.bytes_above_hard_fp
> --                            + frame.below_hard_fp_saved_regs_size);
> -+      frame.initial_adjust =3D frame.frame_size - frame.bytes_below_sav=
ed_regs;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -   else if (frame.bytes_above_hard_fp.is_constant (&const_above_fp)
> ---
> -2.34.1
> -
> -
> -From aaa1a0a5912d9e5d571e5f1c6f09ceac99544ab5 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:18 +0100
> -Subject: [PATCH 14/19] aarch64: Tweak stack clash boundary condition
> -
> -The AArch64 ABI says that, when stack clash protection is used,
> -there can be a maximum of 1KiB of unprobed space at sp on entry
> -to a function.  Therefore, we need to probe when allocating
> ->=3D guard_size - 1KiB of data (>=3D rather than >).  This is what
> -GCC does.
> -
> -If an allocation is exactly guard_size bytes, it is enough to allocate
> -those bytes and probe once at offset 1024.  It isn't possible to use a
> -single probe at any other offset: higher would conmplicate later code,
> -by leaving more unprobed space than usual, while lower would risk
> -leaving an entire page unprobed.  For simplicity, the code probes all
> -allocations at offset 1024.
> -
> -Some register saves also act as probes.  If we need to allocate
> -more space below the last such register save probe, we need to
> -probe the allocation if it is > 1KiB.  Again, this allocation is
> -then sometimes (but not always) probed at offset 1024.  This sort of
> -allocation is currently only used for outgoing arguments, which are
> -rarely this big.
> -
> -However, the code also probed if this final outgoing-arguments
> -allocation was =3D=3D 1KiB, rather than just > 1KiB.  This isn't
> -necessary, since the register save then probes at offset 1024
> -as required.  Continuing to probe allocations of exactly 1KiB
> -would complicate later patches.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_allocate_and_probe_stack_spa=
ce):
> -       Don't probe final allocations that are exactly 1KiB in size (afte=
r
> -       unprobed space above the final allocation has been deducted).
> -
> -gcc/testsuite/
> -       * gcc.target/aarch64/stack-check-prologue-17.c: New test.
> ----
> - gcc/config/aarch64/aarch64.cc                 |  4 +-
> - .../aarch64/stack-check-prologue-17.c         | 55 +++++++++++++++++++
> - 2 files changed, 58 insertions(+), 1 deletion(-)
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologu=
e-17.c
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 1aa79da0673..5cad847977a 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -9648,9 +9648,11 @@ aarch64_allocate_and_probe_stack_space (rtx temp1=
, rtx temp2,
> -   HOST_WIDE_INT guard_size
> -     =3D 1 << param_stack_clash_protection_guard_size;
> -   HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUARD;
> -+  HOST_WIDE_INT byte_sp_alignment =3D STACK_BOUNDARY / BITS_PER_UNIT;
> -+  gcc_assert (multiple_p (poly_size, byte_sp_alignment));
> -   HOST_WIDE_INT min_probe_threshold
> -     =3D (final_adjustment_p
> --       ? guard_used_by_caller
> -+       ? guard_used_by_caller + byte_sp_alignment
> -        : guard_size - guard_used_by_caller);
> -   /* When doing the final adjustment for the outgoing arguments, take i=
nto
> -      account any unprobed space there is above the current SP.  There a=
re
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -new file mode 100644
> -index 00000000000..0d8a25d73a2
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -@@ -0,0 +1,55 @@
> -+/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer --pa=
ram stack-clash-protection-guard-size=3D12" } */
> -+/* { dg-final { check-function-bodies "**" "" } } */
> -+
> -+void f(int, ...);
> -+void g();
> -+
> -+/*
> -+** test1:
> -+**    ...
> -+**    str     x30, \[sp\]
> -+**    sub     sp, sp, #1024
> -+**    cbnz    w0, .*
> -+**    bl      g
> -+**    ...
> -+*/
> -+int test1(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test2:
> -+**    ...
> -+**    str     x30, \[sp\]
> -+**    sub     sp, sp, #1040
> -+**    str     xzr, \[sp\]
> -+**    cbnz    w0, .*
> -+**    bl      g
> -+**    ...
> -+*/
> -+int test2(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> ---
> -2.34.1
> -
> -
> -From 8433953434a7b58c0923140d39eb3c5988c1d097 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:19 +0100
> -Subject: [PATCH 15/19] aarch64: Put LR save probe in first 16 bytes
> -
> --fstack-clash-protection uses the save of LR as a probe for the next
> -allocation.  The next allocation could be:
> -
> -* another part of the static frame, e.g. when allocating SVE save slots
> -  or outgoing arguments
> -
> -* an alloca in the same function
> -
> -* an allocation made by a callee function
> -
> -However, when -fomit-frame-pointer is used, the LR save slot is placed
> -above the other GPR save slots.  It could therefore be up to 80 bytes
> -above the base of the GPR save area (which is also the hard fp address).
> -
> -aarch64_allocate_and_probe_stack_space took this into account when
> -deciding how much subsequent space could be allocated without needing
> -a probe.  However, it interacted badly with:
> -
> -      /* If doing a small final adjustment, we always probe at offset 0.
> -        This is done to avoid issues when LR is not at position 0 or whe=
n
> -        the final adjustment is smaller than the probing offset.  */
> -      else if (final_adjustment_p && rounded_size =3D=3D 0)
> -       residual_probe_offset =3D 0;
> -
> -which forces any allocation that is smaller than the guard page size
> -to be probed at offset 0 rather than the usual offset 1024.  It was
> -therefore possible to construct cases in which we had:
> -
> -* a probe using LR at SP + 80 bytes (or some other value >=3D 16)
> -* an allocation of the guard page size - 16 bytes
> -* a probe at SP + 0
> -
> -which allocates guard page size + 64 consecutive unprobed bytes.
> -
> -This patch requires the LR probe to be in the first 16 bytes of the
> -save area when stack clash protection is active.  Doing it
> -unconditionally would cause code-quality regressions.
> -
> -Putting LR before other registers prevents push/pop allocation
> -when shadow call stacks are enabled, since LR is restored
> -separately from the other callee-saved registers.
> -
> -The new comment doesn't say that the probe register is required
> -to be LR, since a later patch removes that restriction.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Ensure that
> -       the LR save slot is in the first 16 bytes of the register save ar=
ea.
> -       Only form STP/LDP push/pop candidates if both registers are valid=
.
> -       (aarch64_allocate_and_probe_stack_space): Remove workaround for
> -       when LR was not in the first 16 bytes.
> -
> -gcc/testsuite/
> -       * gcc.target/aarch64/stack-check-prologue-18.c: New test.
> -       * gcc.target/aarch64/stack-check-prologue-19.c: Likewise.
> -       * gcc.target/aarch64/stack-check-prologue-20.c: Likewise.
> ----
> - gcc/config/aarch64/aarch64.cc                 |  72 ++++++-------
> - .../aarch64/stack-check-prologue-18.c         | 100 ++++++++++++++++++
> - .../aarch64/stack-check-prologue-19.c         | 100 ++++++++++++++++++
> - .../aarch64/stack-check-prologue-20.c         |   3 +
> - 4 files changed, 233 insertions(+), 42 deletions(-)
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologu=
e-18.c
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologu=
e-19.c
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologu=
e-20.c
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 5cad847977a..a765f92329d 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8534,26 +8534,34 @@ aarch64_layout_frame (void)
> -   bool saves_below_hard_fp_p
> -     =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> -   frame.bytes_below_hard_fp =3D offset;
> -+
> -+  auto allocate_gpr_slot =3D [&](unsigned int regno)
> -+    {
> -+      frame.reg_offset[regno] =3D offset;
> -+      if (frame.wb_push_candidate1 =3D=3D INVALID_REGNUM)
> -+      frame.wb_push_candidate1 =3D regno;
> -+      else if (frame.wb_push_candidate2 =3D=3D INVALID_REGNUM)
> -+      frame.wb_push_candidate2 =3D regno;
> -+      offset +=3D UNITS_PER_WORD;
> -+    };
> -+
> -   if (frame.emit_frame_chain)
> -     {
> -       /* FP and LR are placed in the linkage record.  */
> --      frame.reg_offset[R29_REGNUM] =3D offset;
> --      frame.wb_push_candidate1 =3D R29_REGNUM;
> --      frame.reg_offset[R30_REGNUM] =3D offset + UNITS_PER_WORD;
> --      frame.wb_push_candidate2 =3D R30_REGNUM;
> --      offset +=3D 2 * UNITS_PER_WORD;
> -+      allocate_gpr_slot (R29_REGNUM);
> -+      allocate_gpr_slot (R30_REGNUM);
> -     }
> -+  else if (flag_stack_clash_protection
> -+         && known_eq (frame.reg_offset[R30_REGNUM], SLOT_REQUIRED))
> -+    /* Put the LR save slot first, since it makes a good choice of prob=
e
> -+       for stack clash purposes.  The idea is that the link register us=
ually
> -+       has to be saved before a call anyway, and so we lose little by
> -+       stopping it from being individually shrink-wrapped.  */
> -+    allocate_gpr_slot (R30_REGNUM);
> -
> -   for (regno =3D R0_REGNUM; regno <=3D R30_REGNUM; regno++)
> -     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> --      {
> --      frame.reg_offset[regno] =3D offset;
> --      if (frame.wb_push_candidate1 =3D=3D INVALID_REGNUM)
> --        frame.wb_push_candidate1 =3D regno;
> --      else if (frame.wb_push_candidate2 =3D=3D INVALID_REGNUM)
> --        frame.wb_push_candidate2 =3D regno;
> --      offset +=3D UNITS_PER_WORD;
> --      }
> -+      allocate_gpr_slot (regno);
> -
> -   poly_int64 max_int_offset =3D offset;
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> -@@ -8631,10 +8639,13 @@ aarch64_layout_frame (void)
> -      max_push_offset to 0, because no registers are popped at this time=
,
> -      so callee_adjust cannot be adjusted.  */
> -   HOST_WIDE_INT max_push_offset =3D 0;
> --  if (frame.wb_pop_candidate2 !=3D INVALID_REGNUM)
> --    max_push_offset =3D 512;
> --  else if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)
> --    max_push_offset =3D 256;
> -+  if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)
> -+    {
> -+      if (frame.wb_pop_candidate2 !=3D INVALID_REGNUM)
> -+      max_push_offset =3D 512;
> -+      else
> -+      max_push_offset =3D 256;
> -+    }
> -
> -   HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
> -   HOST_WIDE_INT const_saved_regs_size;
> -@@ -9654,29 +9665,6 @@ aarch64_allocate_and_probe_stack_space (rtx temp1=
, rtx temp2,
> -     =3D (final_adjustment_p
> -        ? guard_used_by_caller + byte_sp_alignment
> -        : guard_size - guard_used_by_caller);
> --  /* When doing the final adjustment for the outgoing arguments, take i=
nto
> --     account any unprobed space there is above the current SP.  There a=
re
> --     two cases:
> --
> --     - When saving SVE registers below the hard frame pointer, we force
> --       the lowest save to take place in the prologue before doing the f=
inal
> --       adjustment (i.e. we don't allow the save to be shrink-wrapped).
> --       This acts as a probe at SP, so there is no unprobed space.
> --
> --     - When there are no SVE register saves, we use the store of the li=
nk
> --       register as a probe.  We can't assume that LR was saved at posit=
ion 0
> --       though, so treat any space below it as unprobed.  */
> --  if (final_adjustment_p
> --      && known_eq (frame.below_hard_fp_saved_regs_size, 0))
> --    {
> --      poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM]
> --                            - frame.bytes_below_saved_regs);
> --      if (known_ge (lr_offset, 0))
> --      min_probe_threshold -=3D lr_offset.to_constant ();
> --      else
> --      gcc_assert (!flag_stack_clash_protection || known_eq (poly_size, =
0));
> --    }
> --
> -   poly_int64 frame_size =3D frame.frame_size;
> -
> -   /* We should always have a positive probe threshold.  */
> -@@ -9856,8 +9844,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
> -       if (final_adjustment_p && rounded_size !=3D 0)
> -       min_probe_threshold =3D 0;
> -       /* If doing a small final adjustment, we always probe at offset 0=
.
> --       This is done to avoid issues when LR is not at position 0 or whe=
n
> --       the final adjustment is smaller than the probing offset.  */
> -+       This is done to avoid issues when the final adjustment is smalle=
r
> -+       than the probing offset.  */
> -       else if (final_adjustment_p && rounded_size =3D=3D 0)
> -       residual_probe_offset =3D 0;
> -
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -new file mode 100644
> -index 00000000000..82447d20fff
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -@@ -0,0 +1,100 @@
> -+/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer --pa=
ram stack-clash-protection-guard-size=3D12" } */
> -+/* { dg-final { check-function-bodies "**" "" } } */
> -+
> -+void f(int, ...);
> -+void g();
> -+
> -+/*
> -+** test1:
> -+**    ...
> -+**    str     x30, \[sp\]
> -+**    sub     sp, sp, #4064
> -+**    str     xzr, \[sp\]
> -+**    cbnz    w0, .*
> -+**    bl      g
> -+**    ...
> -+**    str     x26, \[sp, #?4128\]
> -+**    ...
> -+*/
> -+int test1(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      asm volatile ("" :::
> -+                  "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26=
");
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test2:
> -+**    ...
> -+**    str     x30, \[sp\]
> -+**    sub     sp, sp, #1040
> -+**    str     xzr, \[sp\]
> -+**    cbnz    w0, .*
> -+**    bl      g
> -+**    ...
> -+*/
> -+int test2(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      asm volatile ("" :::
> -+                  "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26=
");
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test3:
> -+**    ...
> -+**    str     x30, \[sp\]
> -+**    sub     sp, sp, #1024
> -+**    cbnz    w0, .*
> -+**    bl      g
> -+**    ...
> -+*/
> -+int test3(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      asm volatile ("" :::
> -+                  "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26=
");
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> -new file mode 100644
> -index 00000000000..73ac3e4e4eb
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> -@@ -0,0 +1,100 @@
> -+/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer --pa=
ram stack-clash-protection-guard-size=3D12 -fsanitize=3Dshadow-call-stack -=
ffixed-x18" } */
> -+/* { dg-final { check-function-bodies "**" "" } } */
> -+
> -+void f(int, ...);
> -+void g();
> -+
> -+/*
> -+** test1:
> -+**    ...
> -+**    str     x30, \[sp\]
> -+**    sub     sp, sp, #4064
> -+**    str     xzr, \[sp\]
> -+**    cbnz    w0, .*
> -+**    bl      g
> -+**    ...
> -+**    str     x26, \[sp, #?4128\]
> -+**    ...
> -+*/
> -+int test1(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      asm volatile ("" :::
> -+                  "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26=
");
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test2:
> -+**    ...
> -+**    str     x30, \[sp\]
> -+**    sub     sp, sp, #1040
> -+**    str     xzr, \[sp\]
> -+**    cbnz    w0, .*
> -+**    bl      g
> -+**    ...
> -+*/
> -+int test2(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      asm volatile ("" :::
> -+                  "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26=
");
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test3:
> -+**    ...
> -+**    str     x30, \[sp\]
> -+**    sub     sp, sp, #1024
> -+**    cbnz    w0, .*
> -+**    bl      g
> -+**    ...
> -+*/
> -+int test3(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      asm volatile ("" :::
> -+                  "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26=
");
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c
> -new file mode 100644
> -index 00000000000..690aae8dfd5
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c
> -@@ -0,0 +1,3 @@
> -+/* { dg-options "-O2 -fstack-protector-all -fstack-clash-protection -fo=
mit-frame-pointer --param stack-clash-protection-guard-size=3D12 -fsanitize=
=3Dshadow-call-stack -ffixed-x18" } */
> -+
> -+#include "stack-check-prologue-19.c"
> ---
> -2.34.1
> -
> -
> -From eea1759073e09dd1aefbc9a881601ab1eebfdd18 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:19 +0100
> -Subject: [PATCH 16/19] aarch64: Simplify probe of final frame allocation
> -
> -Previous patches ensured that the final frame allocation only needs
> -a probe when the size is strictly greater than 1KiB.  It's therefore
> -safe to use the normal 1024 probe offset in all cases.
> -
> -The main motivation for doing this is to simplify the code and
> -remove the number of special cases.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_allocate_and_probe_stack_spa=
ce):
> -       Always probe the residual allocation at offset 1024, asserting
> -       that that is in range.
> -
> -gcc/testsuite/
> -       * gcc.target/aarch64/stack-check-prologue-17.c: Expect the probe
> -       to be at offset 1024 rather than offset 0.
> -       * gcc.target/aarch64/stack-check-prologue-18.c: Likewise.
> -       * gcc.target/aarch64/stack-check-prologue-19.c: Likewise.
> ----
> - gcc/config/aarch64/aarch64.cc                        | 12 ++++--------
> - .../gcc.target/aarch64/stack-check-prologue-17.c     |  2 +-
> - .../gcc.target/aarch64/stack-check-prologue-18.c     |  4 ++--
> - .../gcc.target/aarch64/stack-check-prologue-19.c     |  4 ++--
> - 4 files changed, 9 insertions(+), 13 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index a765f92329d..37809a306f7 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -9838,16 +9838,12 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
> -      are still safe.  */
> -   if (residual)
> -     {
> --      HOST_WIDE_INT residual_probe_offset =3D guard_used_by_caller;
> -+      gcc_assert (guard_used_by_caller + byte_sp_alignment <=3D size);
> -+
> -       /* If we're doing final adjustments, and we've done any full page
> -        allocations then any residual needs to be probed.  */
> -       if (final_adjustment_p && rounded_size !=3D 0)
> -       min_probe_threshold =3D 0;
> --      /* If doing a small final adjustment, we always probe at offset 0=
.
> --       This is done to avoid issues when the final adjustment is smalle=
r
> --       than the probing offset.  */
> --      else if (final_adjustment_p && rounded_size =3D=3D 0)
> --      residual_probe_offset =3D 0;
> -
> -       aarch64_sub_sp (temp1, temp2, residual, frame_related_p);
> -       if (residual >=3D min_probe_threshold)
> -@@ -9858,8 +9854,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
> -                    HOST_WIDE_INT_PRINT_DEC " bytes, probing will be req=
uired."
> -                    "\n", residual);
> -
> --          emit_stack_probe (plus_constant (Pmode, stack_pointer_rtx,
> --                                           residual_probe_offset));
> -+        emit_stack_probe (plus_constant (Pmode, stack_pointer_rtx,
> -+                                         guard_used_by_caller));
> -         emit_insn (gen_blockage ());
> -       }
> -     }
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -index 0d8a25d73a2..f0ec1389771 100644
> ---- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -@@ -33,7 +33,7 @@ int test1(int z) {
> - **    ...
> - **    str     x30, \[sp\]
> - **    sub     sp, sp, #1040
> --**    str     xzr, \[sp\]
> -+**    str     xzr, \[sp, #?1024\]
> - **    cbnz    w0, .*
> - **    bl      g
> - **    ...
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -index 82447d20fff..6383bec5ebc 100644
> ---- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -@@ -9,7 +9,7 @@ void g();
> - **    ...
> - **    str     x30, \[sp\]
> - **    sub     sp, sp, #4064
> --**    str     xzr, \[sp\]
> -+**    str     xzr, \[sp, #?1024\]
> - **    cbnz    w0, .*
> - **    bl      g
> - **    ...
> -@@ -50,7 +50,7 @@ int test1(int z) {
> - **    ...
> - **    str     x30, \[sp\]
> - **    sub     sp, sp, #1040
> --**    str     xzr, \[sp\]
> -+**    str     xzr, \[sp, #?1024\]
> - **    cbnz    w0, .*
> - **    bl      g
> - **    ...
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> -index 73ac3e4e4eb..562039b5e9b 100644
> ---- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> -@@ -9,7 +9,7 @@ void g();
> - **    ...
> - **    str     x30, \[sp\]
> - **    sub     sp, sp, #4064
> --**    str     xzr, \[sp\]
> -+**    str     xzr, \[sp, #?1024\]
> - **    cbnz    w0, .*
> - **    bl      g
> - **    ...
> -@@ -50,7 +50,7 @@ int test1(int z) {
> - **    ...
> - **    str     x30, \[sp\]
> - **    sub     sp, sp, #1040
> --**    str     xzr, \[sp\]
> -+**    str     xzr, \[sp, #?1024\]
> - **    cbnz    w0, .*
> - **    bl      g
> - **    ...
> ---
> -2.34.1
> -
> -
> -From 96d85187c3b9c9a7efc2fd698c3d452e80d8aa47 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:20 +0100
> -Subject: [PATCH 17/19] aarch64: Explicitly record probe registers in fra=
me
> - info
> -
> -The stack frame is currently divided into three areas:
> -
> -A: the area above the hard frame pointer
> -B: the SVE saves below the hard frame pointer
> -C: the outgoing arguments
> -
> -If the stack frame is allocated in one chunk, the allocation needs a
> -probe if the frame size is >=3D guard_size - 1KiB.  In addition, if the
> -function is not a leaf function, it must probe an address no more than
> -1KiB above the outgoing SP.  We ensured the second condition by
> -
> -(1) using single-chunk allocations for non-leaf functions only if
> -    the link register save slot is within 512 bytes of the bottom
> -    of the frame; and
> -
> -(2) using the link register save as a probe (meaning, for instance,
> -    that it can't be individually shrink wrapped)
> -
> -If instead the stack is allocated in multiple chunks, then:
> -
> -* an allocation involving only the outgoing arguments (C above) requires
> -  a probe if the allocation size is > 1KiB
> -
> -* any other allocation requires a probe if the allocation size
> -  is >=3D guard_size - 1KiB
> -
> -* second and subsequent allocations require the previous allocation
> -  to probe at the bottom of the allocated area, regardless of the size
> -  of that previous allocation
> -
> -The final point means that, unlike for single allocations,
> -it can be necessary to have both a non-SVE register probe and
> -an SVE register probe.  For example:
> -
> -* allocate A, probe using a non-SVE register save
> -* allocate B, probe using an SVE register save
> -* allocate C
> -
> -The non-SVE register used in this case was again the link register.
> -It was previously used even if the link register save slot was some
> -bytes above the bottom of the non-SVE register saves, but an earlier
> -patch avoided that by putting the link register save slot first.
> -
> -As a belt-and-braces fix, this patch explicitly records which
> -probe registers we're using and allows the non-SVE probe to be
> -whichever register comes first (as for SVE).
> -
> -The patch also avoids unnecessary probes in sve/pcs/stack_clash_3.c.
> -
> -gcc/
> -       * config/aarch64/aarch64.h (aarch64_frame::sve_save_and_probe)
> -       (aarch64_frame::hard_fp_save_and_probe): New fields.
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Initialize th=
em.
> -       Rather than asserting that a leaf function saves LR, instead asse=
rt
> -       that a leaf function saves something.
> -       (aarch64_get_separate_components): Prevent the chosen probe
> -       registers from being individually shrink-wrapped.
> -       (aarch64_allocate_and_probe_stack_space): Remove workaround for
> -       probe registers that aren't at the bottom of the previous allocat=
ion.
> -
> -gcc/testsuite/
> -       * gcc.target/aarch64/sve/pcs/stack_clash_3.c: Avoid redundant pro=
bes.
> ----
> - gcc/config/aarch64/aarch64.cc                 | 68 +++++++++++++++----
> - gcc/config/aarch64/aarch64.h                  |  8 +++
> - .../aarch64/sve/pcs/stack_clash_3.c           |  6 +-
> - 3 files changed, 64 insertions(+), 18 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 37809a306f7..6c59c39a639 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8471,15 +8471,11 @@ aarch64_layout_frame (void)
> -       && !crtl->abi->clobbers_full_reg_p (regno))
> -       frame.reg_offset[regno] =3D SLOT_REQUIRED;
> -
> --  /* With stack-clash, LR must be saved in non-leaf functions.  The sav=
ing of
> --     LR counts as an implicit probe which allows us to maintain the inv=
ariant
> --     described in the comment at expand_prologue.  */
> --  gcc_assert (crtl->is_leaf
> --            || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRE=
D));
> -
> -   poly_int64 offset =3D crtl->outgoing_args_size;
> -   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -   frame.bytes_below_saved_regs =3D offset;
> -+  frame.sve_save_and_probe =3D INVALID_REGNUM;
> -
> -   /* Now assign stack slots for the registers.  Start with the predicat=
e
> -      registers, since predicate LDR and STR have a relatively small
> -@@ -8487,6 +8483,8 @@ aarch64_layout_frame (void)
> -   for (regno =3D P0_REGNUM; regno <=3D P15_REGNUM; regno++)
> -     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> -       {
> -+      if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)
> -+        frame.sve_save_and_probe =3D regno;
> -       frame.reg_offset[regno] =3D offset;
> -       offset +=3D BYTES_PER_SVE_PRED;
> -       }
> -@@ -8524,6 +8522,8 @@ aarch64_layout_frame (void)
> -     for (regno =3D V0_REGNUM; regno <=3D V31_REGNUM; regno++)
> -       if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> -       {
> -+        if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)
> -+          frame.sve_save_and_probe =3D regno;
> -         frame.reg_offset[regno] =3D offset;
> -         offset +=3D vector_save_size;
> -       }
> -@@ -8533,10 +8533,18 @@ aarch64_layout_frame (void)
> -   frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_sa=
ved_regs;
> -   bool saves_below_hard_fp_p
> -     =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> -+  gcc_assert (!saves_below_hard_fp_p
> -+            || (frame.sve_save_and_probe !=3D INVALID_REGNUM
> -+                && known_eq (frame.reg_offset[frame.sve_save_and_probe]=
,
> -+                             frame.bytes_below_saved_regs)));
> -+
> -   frame.bytes_below_hard_fp =3D offset;
> -+  frame.hard_fp_save_and_probe =3D INVALID_REGNUM;
> -
> -   auto allocate_gpr_slot =3D [&](unsigned int regno)
> -     {
> -+      if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGNUM)
> -+      frame.hard_fp_save_and_probe =3D regno;
> -       frame.reg_offset[regno] =3D offset;
> -       if (frame.wb_push_candidate1 =3D=3D INVALID_REGNUM)
> -       frame.wb_push_candidate1 =3D regno;
> -@@ -8570,6 +8578,8 @@ aarch64_layout_frame (void)
> -   for (regno =3D V0_REGNUM; regno <=3D V31_REGNUM; regno++)
> -     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> -       {
> -+      if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGNUM)
> -+        frame.hard_fp_save_and_probe =3D regno;
> -       /* If there is an alignment gap between integer and fp callee-sav=
es,
> -          allocate the last fp register to it if possible.  */
> -       if (regno =3D=3D last_fp_reg
> -@@ -8593,6 +8603,17 @@ aarch64_layout_frame (void)
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> -
> -   frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> -+  gcc_assert (known_eq (frame.saved_regs_size,
> -+                      frame.below_hard_fp_saved_regs_size)
> -+            || (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM
> -+                && known_eq (frame.reg_offset[frame.hard_fp_save_and_pr=
obe],
> -+                             frame.bytes_below_hard_fp)));
> -+
> -+  /* With stack-clash, a register must be saved in non-leaf functions.
> -+     The saving of the bottommost register counts as an implicit probe,
> -+     which allows us to maintain the invariant described in the comment
> -+     at expand_prologue.  */
> -+  gcc_assert (crtl->is_leaf || maybe_ne (frame.saved_regs_size, 0));
> -
> -   offset +=3D get_frame_size ();
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> -@@ -8723,6 +8744,25 @@ aarch64_layout_frame (void)
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -
> -+  /* The frame is allocated in pieces, with each non-final piece
> -+     including a register save at offset 0 that acts as a probe for
> -+     the following piece.  In addition, the save of the bottommost regi=
ster
> -+     acts as a probe for callees and allocas.  Roll back any probes tha=
t
> -+     aren't needed.
> -+
> -+     A probe isn't needed if it is associated with the final allocation
> -+     (including callees and allocas) that happens before the epilogue i=
s
> -+     executed.  */
> -+  if (crtl->is_leaf
> -+      && !cfun->calls_alloca
> -+      && known_eq (frame.final_adjust, 0))
> -+    {
> -+      if (maybe_ne (frame.sve_callee_adjust, 0))
> -+      frame.sve_save_and_probe =3D INVALID_REGNUM;
> -+      else
> -+      frame.hard_fp_save_and_probe =3D INVALID_REGNUM;
> -+    }
> -+
> -   /* Make sure the individual adjustments add up to the full frame size=
.  */
> -   gcc_assert (known_eq (frame.initial_adjust
> -                       + frame.callee_adjust
> -@@ -9354,13 +9394,6 @@ aarch64_get_separate_components (void)
> -
> -       poly_int64 offset =3D frame.reg_offset[regno];
> -
> --      /* If the register is saved in the first SVE save slot, we use
> --         it as a stack probe for -fstack-clash-protection.  */
> --      if (flag_stack_clash_protection
> --          && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
> --          && known_eq (offset, frame.bytes_below_saved_regs))
> --        continue;
> --
> -       /* Get the offset relative to the register we'll use.  */
> -       if (frame_pointer_needed)
> -         offset -=3D frame.bytes_below_hard_fp;
> -@@ -9395,6 +9428,13 @@ aarch64_get_separate_components (void)
> -
> -   bitmap_clear_bit (components, LR_REGNUM);
> -   bitmap_clear_bit (components, SP_REGNUM);
> -+  if (flag_stack_clash_protection)
> -+    {
> -+      if (frame.sve_save_and_probe !=3D INVALID_REGNUM)
> -+      bitmap_clear_bit (components, frame.sve_save_and_probe);
> -+      if (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM)
> -+      bitmap_clear_bit (components, frame.hard_fp_save_and_probe);
> -+    }
> -
> -   return components;
> - }
> -@@ -9931,8 +9971,8 @@ aarch64_epilogue_uses (int regno)
> -    When probing is needed, we emit a probe at the start of the prologue
> -    and every PARAM_STACK_CLASH_PROTECTION_GUARD_SIZE bytes thereafter.
> -
> --   We have to track how much space has been allocated and the only stor=
es
> --   to the stack we track as implicit probes are the FP/LR stores.
> -+   We can also use register saves as probes.  These are stored in
> -+   sve_save_and_probe and hard_fp_save_and_probe.
> -
> -    For outgoing arguments we probe if the size is larger than 1KB, such=
 that
> -    the ABI specified buffer is maintained for the next callee.
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> -index c8becb098c8..fbfb73545ba 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -863,6 +863,14 @@ struct GTY (()) aarch64_frame
> -      This is the register they should use.  */
> -   unsigned spare_pred_reg;
> -
> -+  /* An SVE register that is saved below the hard frame pointer and tha=
t acts
> -+     as a probe for later allocations, or INVALID_REGNUM if none.  */
> -+  unsigned sve_save_and_probe;
> -+
> -+  /* A register that is saved at the hard frame pointer and that acts
> -+     as a probe for later allocations, or INVALID_REGNUM if none.  */
> -+  unsigned hard_fp_save_and_probe;
> -+
> -   bool laid_out;
> -
> -   /* True if shadow call stack should be enabled for the current functi=
on.  */
> -diff --git a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c b/=
gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> -index 3e01ec36c3a..3530a0d504b 100644
> ---- a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> -+++ b/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> -@@ -11,11 +11,10 @@
> - **    mov     x11, sp
> - **    ...
> - **    sub     sp, sp, x13
> --**    str     p4, \[sp\]
> - **    cbz     w0, [^\n]*
> -+**    str     p4, \[sp\]
> - **    ...
> - **    ptrue   p0\.b, all
> --**    ldr     p4, \[sp\]
> - **    addvl   sp, sp, #1
> - **    ldr     x24, \[sp\], 32
> - **    ret
> -@@ -39,13 +38,12 @@ test_1 (int n)
> - **    mov     x11, sp
> - **    ...
> - **    sub     sp, sp, x13
> --**    str     p4, \[sp\]
> - **    cbz     w0, [^\n]*
> -+**    str     p4, \[sp\]
> - **    str     p5, \[sp, #1, mul vl\]
> - **    str     p6, \[sp, #2, mul vl\]
> - **    ...
> - **    ptrue   p0\.b, all
> --**    ldr     p4, \[sp\]
> - **    addvl   sp, sp, #1
> - **    ldr     x24, \[sp\], 32
> - **    ret
> ---
> -2.34.1
> -
> -
> -From 56df065080950bb30dda9c260f71be54269bdda5 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:20 +0100
> -Subject: [PATCH 18/19] aarch64: Remove below_hard_fp_saved_regs_size
> -
> -After previous patches, it's no longer necessary to store
> -saved_regs_size and below_hard_fp_saved_regs_size in the frame info.
> -All measurements instead use the top or bottom of the frame as
> -reference points.
> -
> -gcc/
> -       * config/aarch64/aarch64.h (aarch64_frame::saved_regs_size)
> -       (aarch64_frame::below_hard_fp_saved_regs_size): Delete.
> -       * config/aarch64/aarch64.cc (aarch64_layout_frame): Update accord=
ingly.
> ----
> - gcc/config/aarch64/aarch64.cc | 45 ++++++++++++++++-------------------
> - gcc/config/aarch64/aarch64.h  |  7 ------
> - 2 files changed, 21 insertions(+), 31 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index 6c59c39a639..b95e805a8cc 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8530,9 +8530,8 @@ aarch64_layout_frame (void)
> -
> -   /* OFFSET is now the offset of the hard frame pointer from the bottom
> -      of the callee save area.  */
> --  frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_sa=
ved_regs;
> --  bool saves_below_hard_fp_p
> --    =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> -+  auto below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_sav=
ed_regs;
> -+  bool saves_below_hard_fp_p =3D maybe_ne (below_hard_fp_saved_regs_siz=
e, 0);
> -   gcc_assert (!saves_below_hard_fp_p
> -             || (frame.sve_save_and_probe !=3D INVALID_REGNUM
> -                 && known_eq (frame.reg_offset[frame.sve_save_and_probe]=
,
> -@@ -8602,9 +8601,8 @@ aarch64_layout_frame (void)
> -
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> -
> --  frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> --  gcc_assert (known_eq (frame.saved_regs_size,
> --                      frame.below_hard_fp_saved_regs_size)
> -+  auto saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> -+  gcc_assert (known_eq (saved_regs_size, below_hard_fp_saved_regs_size)
> -             || (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM
> -                 && known_eq (frame.reg_offset[frame.hard_fp_save_and_pr=
obe],
> -                              frame.bytes_below_hard_fp)));
> -@@ -8613,7 +8611,7 @@ aarch64_layout_frame (void)
> -      The saving of the bottommost register counts as an implicit probe,
> -      which allows us to maintain the invariant described in the comment
> -      at expand_prologue.  */
> --  gcc_assert (crtl->is_leaf || maybe_ne (frame.saved_regs_size, 0));
> -+  gcc_assert (crtl->is_leaf || maybe_ne (saved_regs_size, 0));
> -
> -   offset +=3D get_frame_size ();
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> -@@ -8670,7 +8668,7 @@ aarch64_layout_frame (void)
> -
> -   HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
> -   HOST_WIDE_INT const_saved_regs_size;
> --  if (known_eq (frame.saved_regs_size, 0))
> -+  if (known_eq (saved_regs_size, 0))
> -     frame.initial_adjust =3D frame.frame_size;
> -   else if (frame.frame_size.is_constant (&const_size)
> -          && const_size < max_push_offset
> -@@ -8683,7 +8681,7 @@ aarch64_layout_frame (void)
> -       frame.callee_adjust =3D const_size;
> -     }
> -   else if (frame.bytes_below_saved_regs.is_constant (&const_below_saved=
_regs)
> --         && frame.saved_regs_size.is_constant (&const_saved_regs_size)
> -+         && saved_regs_size.is_constant (&const_saved_regs_size)
> -          && const_below_saved_regs + const_saved_regs_size < 512
> -          /* We could handle this case even with data below the saved
> -             registers, provided that that data left us with valid offse=
ts
> -@@ -8702,8 +8700,7 @@ aarch64_layout_frame (void)
> -       frame.initial_adjust =3D frame.frame_size;
> -     }
> -   else if (saves_below_hard_fp_p
> --         && known_eq (frame.saved_regs_size,
> --                      frame.below_hard_fp_saved_regs_size))
> -+         && known_eq (saved_regs_size, below_hard_fp_saved_regs_size))
> -     {
> -       /* Frame in which all saves are SVE saves:
> -
> -@@ -8725,7 +8722,7 @@ aarch64_layout_frame (void)
> -        [save SVE registers relative to SP]
> -        sub sp, sp, bytes_below_saved_regs  */
> -       frame.callee_adjust =3D const_above_fp;
> --      frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> -+      frame.sve_callee_adjust =3D below_hard_fp_saved_regs_size;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -   else
> -@@ -8740,7 +8737,7 @@ aarch64_layout_frame (void)
> -        [save SVE registers relative to SP]
> -        sub sp, sp, bytes_below_saved_regs  */
> -       frame.initial_adjust =3D frame.bytes_above_hard_fp;
> --      frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> -+      frame.sve_callee_adjust =3D below_hard_fp_saved_regs_size;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -
> -@@ -9936,17 +9933,17 @@ aarch64_epilogue_uses (int regno)
> -       |  local variables              | <-- frame_pointer_rtx
> -       |                               |
> -       +-------------------------------+
> --      |  padding                      | \
> --      +-------------------------------+  |
> --      |  callee-saved registers       |  | frame.saved_regs_size
> --      +-------------------------------+  |
> --      |  LR'                          |  |
> --      +-------------------------------+  |
> --      |  FP'                          |  |
> --      +-------------------------------+  |<- hard_frame_pointer_rtx (al=
igned)
> --      |  SVE vector registers         |  | \
> --      +-------------------------------+  |  | below_hard_fp_saved_regs_=
size
> --      |  SVE predicate registers      | /  /
> -+      |  padding                      |
> -+      +-------------------------------+
> -+      |  callee-saved registers       |
> -+      +-------------------------------+
> -+      |  LR'                          |
> -+      +-------------------------------+
> -+      |  FP'                          |
> -+      +-------------------------------+ <-- hard_frame_pointer_rtx (ali=
gned)
> -+      |  SVE vector registers         |
> -+      +-------------------------------+
> -+      |  SVE predicate registers      |
> -       +-------------------------------+
> -       |  dynamic allocation           |
> -       +-------------------------------+
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> -index fbfb73545ba..cfeaf4657ab 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -777,18 +777,11 @@ struct GTY (()) aarch64_frame
> -      STACK_BOUNDARY.  */
> -   HOST_WIDE_INT saved_varargs_size;
> -
> --  /* The size of the callee-save registers with a slot in REG_OFFSET.  =
*/
> --  poly_int64 saved_regs_size;
> --
> -   /* The number of bytes between the bottom of the static frame (the bo=
ttom
> -      of the outgoing arguments) and the bottom of the register save are=
a.
> -      This value is always a multiple of STACK_BOUNDARY.  */
> -   poly_int64 bytes_below_saved_regs;
> -
> --  /* The size of the callee-save registers with a slot in REG_OFFSET th=
at
> --     are saved below the hard frame pointer.  */
> --  poly_int64 below_hard_fp_saved_regs_size;
> --
> -   /* The number of bytes between the bottom of the static frame (the bo=
ttom
> -      of the outgoing arguments) and the hard frame pointer.  This value=
 is
> -      always a multiple of STACK_BOUNDARY.  */
> ---
> -2.34.1
> -
> -
> -From b96e66fd4ef3e36983969fb8cdd1956f551a074b Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford <richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:07:21 +0100
> -Subject: [PATCH 19/19] aarch64: Make stack smash canary protect saved
> - registers
> -
> -AArch64 normally puts the saved registers near the bottom of the frame,
> -immediately above any dynamic allocations.  But this means that a
> -stack-smash attack on those dynamic allocations could overwrite the
> -saved registers without needing to reach as far as the stack smash
> -canary.
> -
> -The same thing could also happen for variable-sized arguments that are
> -passed by value, since those are allocated before a call and popped on
> -return.
> -
> -This patch avoids that by putting the locals (and thus the canary) below
> -the saved registers when stack smash protection is active.
> -
> -The patch fixes CVE-2023-4039.
> -
> -gcc/
> -       * config/aarch64/aarch64.cc (aarch64_save_regs_above_locals_p):
> -       New function.
> -       (aarch64_layout_frame): Use it to decide whether locals should
> -       go above or below the saved registers.
> -       (aarch64_expand_prologue): Update stack layout comment.
> -       Emit a stack tie after the final adjustment.
> -
> -gcc/testsuite/
> -       * gcc.target/aarch64/stack-protector-8.c: New test.
> -       * gcc.target/aarch64/stack-protector-9.c: Likewise.
> ----
> - gcc/config/aarch64/aarch64.cc                 | 46 +++++++--
> - .../gcc.target/aarch64/stack-protector-8.c    | 95 +++++++++++++++++++
> - .../gcc.target/aarch64/stack-protector-9.c    | 33 +++++++
> - 3 files changed, 168 insertions(+), 6 deletions(-)
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-8.c
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-9.c
> -
> -diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> -index b95e805a8cc..389c0e29353 100644
> ---- a/gcc/config/aarch64/aarch64.cc
> -+++ b/gcc/config/aarch64/aarch64.cc
> -@@ -8394,6 +8394,20 @@ aarch64_needs_frame_chain (void)
> -   return aarch64_use_frame_pointer;
> - }
> -
> -+/* Return true if the current function should save registers above
> -+   the locals area, rather than below it.  */
> -+
> -+static bool
> -+aarch64_save_regs_above_locals_p ()
> -+{
> -+  /* When using stack smash protection, make sure that the canary slot
> -+     comes between the locals and the saved registers.  Otherwise,
> -+     it would be possible for a carefully sized smash attack to change
> -+     the saved registers (particularly LR and FP) without reaching the
> -+     canary.  */
> -+  return crtl->stack_protect_guard;
> -+}
> -+
> - /* Mark the registers that need to be saved by the callee and calculate
> -    the size of the callee-saved registers area and frame record (both F=
P
> -    and LR may be omitted).  */
> -@@ -8405,6 +8419,7 @@ aarch64_layout_frame (void)
> -   poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mode);
> -   bool frame_related_fp_reg_p =3D false;
> -   aarch64_frame &frame =3D cfun->machine->frame;
> -+  poly_int64 top_of_locals =3D -1;
> -
> -   frame.emit_frame_chain =3D aarch64_needs_frame_chain ();
> -
> -@@ -8471,9 +8486,16 @@ aarch64_layout_frame (void)
> -       && !crtl->abi->clobbers_full_reg_p (regno))
> -       frame.reg_offset[regno] =3D SLOT_REQUIRED;
> -
> -+  bool regs_at_top_p =3D aarch64_save_regs_above_locals_p ();
> -
> -   poly_int64 offset =3D crtl->outgoing_args_size;
> -   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -+  if (regs_at_top_p)
> -+    {
> -+      offset +=3D get_frame_size ();
> -+      offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER=
_UNIT);
> -+      top_of_locals =3D offset;
> -+    }
> -   frame.bytes_below_saved_regs =3D offset;
> -   frame.sve_save_and_probe =3D INVALID_REGNUM;
> -
> -@@ -8613,15 +8635,18 @@ aarch64_layout_frame (void)
> -      at expand_prologue.  */
> -   gcc_assert (crtl->is_leaf || maybe_ne (saved_regs_size, 0));
> -
> --  offset +=3D get_frame_size ();
> --  offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> --  auto top_of_locals =3D offset;
> --
> -+  if (!regs_at_top_p)
> -+    {
> -+      offset +=3D get_frame_size ();
> -+      offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER=
_UNIT);
> -+      top_of_locals =3D offset;
> -+    }
> -   offset +=3D frame.saved_varargs_size;
> -   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -   frame.frame_size =3D offset;
> -
> -   frame.bytes_above_hard_fp =3D frame.frame_size - frame.bytes_below_ha=
rd_fp;
> -+  gcc_assert (known_ge (top_of_locals, 0));
> -   frame.bytes_above_locals =3D frame.frame_size - top_of_locals;
> -
> -   frame.initial_adjust =3D 0;
> -@@ -9930,10 +9955,10 @@ aarch64_epilogue_uses (int regno)
> -       |  for register varargs         |
> -       |                               |
> -       +-------------------------------+
> --      |  local variables              | <-- frame_pointer_rtx
> -+      |  local variables (1)          | <-- frame_pointer_rtx
> -       |                               |
> -       +-------------------------------+
> --      |  padding                      |
> -+      |  padding (1)                  |
> -       +-------------------------------+
> -       |  callee-saved registers       |
> -       +-------------------------------+
> -@@ -9945,6 +9970,10 @@ aarch64_epilogue_uses (int regno)
> -       +-------------------------------+
> -       |  SVE predicate registers      |
> -       +-------------------------------+
> -+      |  local variables (2)          |
> -+      +-------------------------------+
> -+      |  padding (2)                  |
> -+      +-------------------------------+
> -       |  dynamic allocation           |
> -       +-------------------------------+
> -       |  padding                      |
> -@@ -9954,6 +9983,9 @@ aarch64_epilogue_uses (int regno)
> -       +-------------------------------+
> -       |                               | <-- stack_pointer_rtx (aligned)
> -
> -+   The regions marked (1) and (2) are mutually exclusive.  (2) is used
> -+   when aarch64_save_regs_above_locals_p is true.
> -+
> -    Dynamic stack allocations via alloca() decrease stack_pointer_rtx
> -    but leave frame_pointer_rtx and hard_frame_pointer_rtx
> -    unchanged.
> -@@ -10149,6 +10181,8 @@ aarch64_expand_prologue (void)
> -   gcc_assert (known_eq (bytes_below_sp, final_adjust));
> -   aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx, final_adj=
ust,
> -                                         !frame_pointer_needed, true);
> -+  if (emit_frame_chain && maybe_ne (final_adjust, 0))
> -+    emit_insn (gen_stack_tie (stack_pointer_rtx, hard_frame_pointer_rtx=
));
> - }
> -
> - /* Return TRUE if we can use a simple_return insn.
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c b/gcc/=
testsuite/gcc.target/aarch64/stack-protector-8.c
> -new file mode 100644
> -index 00000000000..e71d820e365
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c
> -@@ -0,0 +1,95 @@
> -+/* { dg-options " -O -fstack-protector-strong -mstack-protector-guard=
=3Dsysreg -mstack-protector-guard-reg=3Dtpidr2_el0 -mstack-protector-guard-=
offset=3D16" } */
> -+/* { dg-final { check-function-bodies "**" "" } } */
> -+
> -+void g(void *);
> -+__SVBool_t *h(void *);
> -+
> -+/*
> -+** test1:
> -+**    sub     sp, sp, #288
> -+**    stp     x29, x30, \[sp, #?272\]
> -+**    add     x29, sp, #?272
> -+**    mrs     (x[0-9]+), tpidr2_el0
> -+**    ldr     (x[0-9]+), \[\1, #?16\]
> -+**    str     \2, \[sp, #?264\]
> -+**    mov     \2, #?0
> -+**    add     x0, sp, #?8
> -+**    bl      g
> -+**    ...
> -+**    mrs     .*
> -+**    ...
> -+**    bne     .*
> -+**    ...
> -+**    ldp     x29, x30, \[sp, #?272\]
> -+**    add     sp, sp, #?288
> -+**    ret
> -+**    bl      __stack_chk_fail
> -+*/
> -+int test1() {
> -+  int y[0x40];
> -+  g(y);
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test2:
> -+**    stp     x29, x30, \[sp, #?-16\]!
> -+**    mov     x29, sp
> -+**    sub     sp, sp, #1040
> -+**    mrs     (x[0-9]+), tpidr2_el0
> -+**    ldr     (x[0-9]+), \[\1, #?16\]
> -+**    str     \2, \[sp, #?1032\]
> -+**    mov     \2, #?0
> -+**    add     x0, sp, #?8
> -+**    bl      g
> -+**    ...
> -+**    mrs     .*
> -+**    ...
> -+**    bne     .*
> -+**    ...
> -+**    add     sp, sp, #?1040
> -+**    ldp     x29, x30, \[sp\], #?16
> -+**    ret
> -+**    bl      __stack_chk_fail
> -+*/
> -+int test2() {
> -+  int y[0x100];
> -+  g(y);
> -+  return 1;
> -+}
> -+
> -+#pragma GCC target "+sve"
> -+
> -+/*
> -+** test3:
> -+**    stp     x29, x30, \[sp, #?-16\]!
> -+**    mov     x29, sp
> -+**    addvl   sp, sp, #-18
> -+**    ...
> -+**    str     p4, \[sp\]
> -+**    ...
> -+**    sub     sp, sp, #272
> -+**    mrs     (x[0-9]+), tpidr2_el0
> -+**    ldr     (x[0-9]+), \[\1, #?16\]
> -+**    str     \2, \[sp, #?264\]
> -+**    mov     \2, #?0
> -+**    add     x0, sp, #?8
> -+**    bl      h
> -+**    ...
> -+**    mrs     .*
> -+**    ...
> -+**    bne     .*
> -+**    ...
> -+**    add     sp, sp, #?272
> -+**    ...
> -+**    ldr     p4, \[sp\]
> -+**    ...
> -+**    addvl   sp, sp, #18
> -+**    ldp     x29, x30, \[sp\], #?16
> -+**    ret
> -+**    bl      __stack_chk_fail
> -+*/
> -+__SVBool_t test3() {
> -+  int y[0x40];
> -+  return *h(y);
> -+}
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c b/gcc/=
testsuite/gcc.target/aarch64/stack-protector-9.c
> -new file mode 100644
> -index 00000000000..58f322aa480
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c
> -@@ -0,0 +1,33 @@
> -+/* { dg-options "-O2 -mcpu=3Dneoverse-v1 -fstack-protector-all" } */
> -+/* { dg-final { check-function-bodies "**" "" } } */
> -+
> -+/*
> -+** main:
> -+**    ...
> -+**    stp     x29, x30, \[sp, #?-[0-9]+\]!
> -+**    ...
> -+**    sub     sp, sp, #[0-9]+
> -+**    ...
> -+**    str     x[0-9]+, \[x29, #?-8\]
> -+**    ...
> -+*/
> -+int f(const char *);
> -+void g(void *);
> -+int main(int argc, char* argv[])
> -+{
> -+  int a;
> -+  int b;
> -+  char c[2+f(argv[1])];
> -+  int d[0x100];
> -+  char y;
> -+
> -+  y=3D42; a=3D4; b=3D10;
> -+  c[0] =3D 'h'; c[1] =3D '\0';
> -+
> -+  c[f(argv[2])] =3D '\0';
> -+
> -+  __builtin_printf("%d %d\n%s\n", a, b, c);
> -+  g(d);
> -+
> -+  return 0;
> -+}
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc_13.2.bb b/meta/recipes-devtool=
s/gcc/gcc_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_13.2.bb
> rename to meta/recipes-devtools/gcc/gcc_13.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_13.2.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_13.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_13.2.bb b/meta/recipes-devt=
ools/gcc/libgcc_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_13.2.bb
> rename to meta/recipes-devtools/gcc/libgcc_13.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_13.2.bb b/meta/recipes=
-devtools/gcc/libgfortran_13.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_13.2.bb
> rename to meta/recipes-devtools/gcc/libgfortran_13.3.bb
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200007): https://lists.openembedded.org/g/openembedde=
d-core/message/200007
> Mute This Topic: https://lists.openembedded.org/mt/106370704/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

