Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F260CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 05:51:29 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.web10.1698.1760593887321919735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 22:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D/VraNGp;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63bbf5f77daso387195d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 22:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760593886; x=1761198686; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHA/uijdO4N3I055/loYv33UTNIdKrfn1B6GZ7WKTRc=;
        b=D/VraNGpObJ0Y5j27HTul5ttJNzX2l6GWnmkH1rSCHTQHUfNpfdkIq0oNwXHfQDFL8
         ixg83L4UtcF1uE16+X2fqNOz/nbBs1tiLDAIf4e/Y2MegbXjhYfqgQN93RjZbnfi3n4O
         Y2wv9H3jyQGvw6yhLJ4qliLPN/D9c56oJ6zDU0bd/KWF6IWUrJaDe97RvCmGLxSRjzLk
         Imb6qLPO3LZNIitaQnPdixQwGDPgteRm1lQYw6Esa5UAOeJC5+EEW6b0E9eZ5ykePW8D
         PdclDtwz+JBlK6Vzs36QN4aYDBN05u4xQxEZj/32HHSS1xFYCNmcFCWWPfIdLCgwx9eP
         zEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593886; x=1761198686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHA/uijdO4N3I055/loYv33UTNIdKrfn1B6GZ7WKTRc=;
        b=nazMtKXo9jobIrWC0WYXw+Wgw5ypJLomIDv9oaV0D7Bkehy1dNBZPLR+9qAONSro1B
         J5SLjB7C7unYeLCozyDz02Kh4roi0C/6Coy97GlmObcOJItV2p6LEbuZvLnLZTPNgS3Y
         PnBBXXmwQlcDiPlw2Zh7dciGhcJthC2tYgMdGCWe05nyVcqoUQ/nsJJzAA4kU+8Gnu8s
         q49NFhq1M5/5rPuxxOAVb4p9VwMU46YPsILSbKl7d6G5SuaCjtXwZxQyu+LFNt1xQtMO
         /nH2l647gp4C5R0JL2jGIMVtXQO27ic5AMZO0Y1a+XRQuh960cwjlzAWH5iUwc0ejv6o
         R29g==
X-Gm-Message-State: AOJu0YyI+pViMoSzgsi5bcfr4uKlxu7lAT8ZoKv7OORtrg7B7RjeIuIv
	OylVRQ64Z3DoRiTpnK/nRt3sUKIacVqRn1p+DsjMHI+gRB0w2NSJTNPJ3zyFj442EX9t4qPvUBP
	HCKjckfarRa+A+9667TodoAdnRqPShyz/9D9w
X-Gm-Gg: ASbGncuvFrDfLshFgbfZMlMuPX6EzeXk0aiGrVQmmmD4t4qL++JM46V2o6jC/yEsVsH
	Vy/t63YcdwWQtHNbZZtsTGEOLuJb3gEd7AdSwOi0PcLFKMEhy0muPLK+A7MAJTOvZNRSu5X443z
	UJdgv4TRH0xKqyrL/vYY2aZxrjI7VxteSGoEfafy8at73RaAck6mvVidy/OazG7+HgVW8K+9GhX
	dqy8L+wceJz+LqhE9IXG4dSYiSwGu3UxsIU+Eq0C2s7DDHIjBporj/sPBn/dKL4xIV9LEaQ3IMM
	0jEmdpLVcWjBEfwoTek27/yjQPQG3TSOorJ2SqxxofzSc21jnOHvZfTr0gXe
X-Google-Smtp-Source: AGHT+IEw/fNMv0ybVwbf8wPHhGbzqwhH1O0rBtjA1dESOxKmQxEWMcmdxuDpqb8aQWkx36OLWDzAVH8TzVxnKB8jMIY=
X-Received: by 2002:a05:690e:11c9:b0:63e:c66:42c2 with SMTP id
 956f58d0204a3-63e0c664518mr1109253d50.4.1760593886146; Wed, 15 Oct 2025
 22:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251016051102.1664140-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251016051102.1664140-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Oct 2025 22:50:59 -0700
X-Gm-Features: AS18NWB5yqxckvPai9LsDOaq7M85ujRk4v6z8TDkbD7_hPL5eHhHe9SjP7qsU4s
Message-ID: <CAMKF1sqdqQ939YGa9YMVKo+0ySimaoHyA01x70rzJ+sf2n4dFQ@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] llvm: Upgrade 20.1.0 -> 20.1.8
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 05:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224946

lgtm

On Wed, Oct 15, 2025 at 10:11=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Brings following bugfixes on top of 20.1.0
>
> 87f0227cb601 (HEAD, tag: llvmorg-20.1.8, origin/release/20.x) [InstCombin=
e] Avoid folding `select(umin(X, Y), X)` with min/max values in false arm (=
#143020)
> df43f93388b7 [PhaseOrdering] Add test for #139050 (NFC)
> 25bcf1145fd7 [RISCV] Fix assertion failure when using -fstack-clash-prote=
ction (#135248)
> 6fb913d3e2ec [RelLookupTableConverter] Drop unnamed_addr for GVs in entri=
es to avoid generating GOTPCREL relocations (#146068)
> 0c9f909b7976 [AArch64][SME] Fix restoring callee-saves from FP with hazar=
d padding (#143371)
> fa792cd4c630 [AsmPrinter] Always emit global equivalents if there is non-=
global uses (#145648)
> ce455b382c08 [objcopy][MachO] Revert special handling of encryptable bina=
ries (#144058)
> 0de59a293f7a [X86] Ignore NSW when DstSVT is i32 (#131755)
> 9af763f038f7 [gtest] Fix building on OpenBSD/sparc64 (#145225)
> 1daceb20611f [LoongArch] Pass OptLevel to LoongArchDAGToDAGISel correctly
> b21155f97a0a [LoongArch] Precommit test case to show bug in LoongArchISel=
DagToDag
> da18fb9f04ce [LoongArch] Fix xvshuf instructions lowering (#145868)
> 65ce78f338cf [LoongArch] Pre-commit test for fixing xvshuf instructions. =
NFC
> 5532d5b745e4 [AArch64] Ensure the LR is preserved if we must call __arm_g=
et_current_vg (#145760)
> 5ac3ce819688 [WebAssembly] Fix inline assembly with vector types (#146574=
)
> b83658b7e2c8 Bump version to 20.1.8
> 6146a88f6049 (tag: llvmorg-20.1.7) [LoongArch] Fix '-mno-lsx' option not =
disabling LASX feature (#143821)
> 9ba132be8eea [clan-reply] Backport PTU error recovery to 20.x
> 199e02a36433 Disable clangd/test/module_dependencies.test on Windows
> 02aec86e4d0d [clangd] [Modules] Fix to correctly handle module dependenci=
es (#142828)
> c4f257cb74b5 [llvm-rc] Allow ALT on non-virtkey accelerators (#143374)
> 6fa0cdf3720b release/20.x: [clang] Don't evaluate the initializer of cons=
texpr-unknown parameters. (#142498)
> 337beb73abfe [libc++] Add _LIBCPP_NO_UNIQUE_ADDRESS to flat_{,multi}map::=
value_compare (#137594)
> b8e10ca59b6a [libc++] Fix check for _LIBCPP_HAS_NO_WIDE_CHARACTERS in fea=
tures.py (#131675)
> 2da24c36c7df [libcxx] Provide locale conversions to tests through lit sub=
stitution (#105651)
> 253e9321c8b6 [release/20.x] Update release notes for SystemZ changes (#14=
0060)
> acf86c5c4dbe [CVP] Keep `ReachableCaseCount` in sync with range of condit=
ion (#142302)
> 2481e590eec7 [AArch64][SME] Fix accessing the emergency spill slot with h=
azard padding (#142190)
> 22a3e6b19409 release/20.x: [AArch64] Handle XAR with v1i64 operand types =
(#141754)
> e5dd4f129454 [clangd] Guard against trivial FunctionProtoTypeLoc when cre=
ating inlay hints (#143087)
> f6532710ace8 [clang-format] Correctly annotate token-pasted function decl=
 names (#142337)
> e0586e278f96 [RelLookupTableConverter] Drop unnamed_addr to avoid generat=
ing GOTPCREL relocations (#142304)
> 7759bb57c243 [clang] Serialization: support hashing null template argumen=
ts
> 7cf14539b644 Bump version to 20.1.7
> 47addd4540b4 (tag: llvmorg-20.1.6) [libclc] Include isnan implementation =
for SPIR-V targets
> 4b6e5a286653 [clang-format] Handle Java text blocks (#141334)
> 0e1ef696f1fe [Driver] Fix _XOPEN_SOURCE definition on Solaris (#137141)
> 5d99a97583e1 [MachO] Improve bounds check (#141083)
> aa804fd3e624 [sanitizer_common] Remove interceptors for deprecated struct=
 termio (#137403)
> 53393e26d5f4 [LoongArch] Prevent R0/R1 allocation for rj operand of [G]CS=
RXCHG (#140862)
> 6fcb1c127b40 [LoongArch] Fix assertion failure for annotate tablejump (#1=
40907)
> 15ec590e389b release/20.x: [clang-format] Fix the indent of StartOfName a=
fter AttributeMacro (#140361)
> 802f4f75372e [clang-format] Handle raw string literals containing JSON co=
de (#140666)
> 9b0832508ede [SDAG] Ensure load is included in output chain of sincos exp=
ansion (#140525)
> 8a36b8e3ab46 [clang][analyzer] Handle CXXParenInitListExpr alongside Init=
ListExpr
> 070cf62530ea [Clang] Demote mixed enumeration arithmetic error to a warni=
ng (#131811)
> a169f5ca4e4f Correct position of CFI Instruction for Pointer Authenticati=
on"
> 5befd1fb3c97 [Clang][AST] Fix HandleLValueBase to deal with references (#=
140105)
> e3d2c00ccee4 [LLD][COFF] Allow -arm64xsameaddress in ARM64EC directives (=
#139631)
> 85e06a761483 [LoongArch] Fix fp_to_uint/fp_to_sint conversion errors for =
lasx (#137129)
> ff2e8f93f609 Fix test pfalse-v4i1.ll added in #138712 to require asserts.
> 1e4d39e07757 Bump version to 20.1.6
> 7b09d7b44638 (tag: llvmorg-20.1.5) [analyzer] Workaround for slowdown spi=
kes (unintended scope increase) (#136720)
> a708fb737a78 [RISCV] Allow `Zicsr`/`Zifencei` to duplicate with `g` (#136=
842)
> 1c0368417f55 [clang][analysis] Fix flaky clang/test/Analysis/live-stmts.c=
pp test (2nd attempt) (#127406)
> 0439d1d36312 [Clang] Fix handling of reference types in tryEvaluateBuilti=
nObjectSize (#138247)
> 74ed1ac61104 [sanitizer_common] Fix build on ppc64+musl (#120036)
> 2d079b96a5fb release/20.x: [clang-format] Fix a crash on formatting missi=
ng r_paren/r_brace (#138230)
> 2cacf46f35c8 [X86][TargetLowering] Avoid deleting temporary nodes in `get=
NegatedExpression` (#139029)
> f233430d977b [AArch64] Fix feature list for FUJITSU-MONAKA processor (#13=
9212)
> 41c36d940804 [clang] Fix unused variable warning in MS mangler from const=
ant matrix patch
> 72ad9be1e337 [Clang][MicrosoftMangle] Implement mangling for ConstantMatr=
ixType (#134930)
> 0019b7d0ae0b [wasm-ld] Refactor WasmSym from static globals to per-link c=
ontext (#134970)
> b7b834e2a20e [RTSan][Darwin] Adjust OSSpinLock/_os_nospin_lock intercepto=
r and tests (#132867)
> f811c7df0a10 [rtsan][Apple] Add interceptor for _os_nospin_lock_lock (#13=
1034)
> 4370072022e5 [clang] Forward TPL of NestedNameSpecifier
> d34d5296095b Support z17 processor name and scheduler description
> a7166c373946 release/20.x: [clang-format] RemoveParentheses shouldn't rem=
ove empty parentheses (#138229)
> 5429418cb064 [clang] Add support for Debian 14 Forky and Debian 15 Duke (=
#138460)
> be087ab35970 [libc++] Re-introduce _LIBCPP_DISABLE_AVAILABILITY (#134158)
> 2b34040173f7 [clang-repl] Fix destructor for interpreter for the cuda neg=
ation case (#138091)
> ae97a56d363f [Hexagon] Add missing patterns to select PFALSE and PTRUE (#=
138712)
> 2386c377db4f [BasicAA] Gracefully handle large LocationSize (#138528)
> 961ce35e2957 [OpenMP] Add pre sm_70 load hack back in (#138589)
> 009f3c10d1c1 [LLD][COFF] Don't dllimport from static libraries (#134443)
> 70eed33971d9 [InstCombine] Do not combine shuffle+bitcast if the bitcast =
is eliminable. (#135769)
> 6ddf2e5d10f8 [clang-tidy] Do not pass any file when listing checks in run=
_clang_ti=E2=80=A6 (#137286)
> 8272e451613d [flang] Exempt construct entities from SAVE check for PURE (=
#131383)
> 069ef671e0ab [AArch64][SME] Allow spills of ZT0 around SME ABI routines a=
gain (#136726)
> a38e1ae2041d [AArch64][SME2] Don't preserve ZT0 around SME ABI routines (=
#132722)
> be4097b6ee57 Fix crash lowering stack guard on OpenBSD/aarch64. (#125416)
> aecbb2364a7c [Clang] Fix the trailing comma regression (#136273)
> ebfae55af454 Bump version to 20.1.5
> ec28b8f9cc7f (tag: llvmorg-20.1.4) [libcxx] [test] Extend mingw workaroun=
ds for armv7/aarch64 too (#136419)
> 8c2dc1b5aa7f [clang-repl] Implement LoadDynamicLibrary for clang-repl was=
m use cases (#133037)
> 02afcbf63fee [SystemZ] Fix compile time regression in adjustInliningThres=
hold(). (#137527)
> c877757659e8 [clang-repl] : Fix clang-repl crash with --cuda flag (#13640=
4)
> f4779c389868 [InstCombine] Preserve signbit semantics of NaN with fold to=
 fabs (#136648)
> 57a31e183dc8 [InstCombine] Do not fold logical is_finite test (#136851)
> 1cf8c7797d2b [GlobalOpt] Do not promote malloc if there are atomic loads/=
stores (#137158)
> 24805c2e0817 [lldb] Use correct path for lldb-server executable (#131519)
> 182e8b7f8a71 [clang-format] Correctly annotate kw_operator in using decls=
 (#136545)
> 425d1aad294f [RISCV] Handle scalarized reductions in getArithmeticReducti=
onCost
> 2d7ad98ec0a8 [clang][analyzer] Fix error path of builtin overflow (#13634=
5)
> e7ae5532bc27 [clang-format] Fix mismatched break in BlockIndent (#124998)
> 8f288eb619db [lldb][test] Adjust TestTargetReadInstructionsFlavor skipIfs
> d76ec6a75d39 [lldb] Fix  SBTarget::ReadInstruction  with flavor (#134626)
> 62072e7f877e [clang][AST] Handle implicit first argument in CallExpr::get=
BeginLoc()
> 581772ed077e [LoongArch] Don't crash on instruction prefetch intrinsics (=
#135760)
> 89adc2d4f93b [HEXAGON] Fix corner cases for hwloops pass (#135439)
> 78f6719ca9b5 [GlobalMerge][PPC] Don't merge globals in llvm.metadata sect=
ion (#131801)
> ab0074fe306f Bump version to 20.1.4
> 923a5c4f83d2 (tag: llvmorg-20.1.3) Revert "[ARM][ConstantIslands] Correct=
 MinNoSplitDisp calculation (#114590)"
> 86f5891c5986 [llvm][Hexagon] Promote operand v2i1 to v2i32 (#135409)
> d55c3c20520a [libc++] Fix misplaced _LIBCPP_POP_MACROS (#134874)
> 9420327ad768 [Clang] Fix a lambda pattern comparison mismatch after ecc7e=
6ce4 (#133863)
> 4da7285e636e Silence -Wcast-function-type warnings on idiomatic Windows c=
ode (#135660)
> c5109be53b7e [LV] Disable epilogue vectorization for FindLastIV if start =
is poison.
> 91a3f14d9497 [LV] Add tests with FindLastIV and epilogue vectorization.
> 2131242240f7 [LLVM][MemCpyOpt] Unify alias tags if we optimize allocas (#=
129537)
> 86c98536380b [libc++] Fix deployment targets that were incorrectly bumped=
 (#134278)
> dfd6f123362a [libc++] Guard additional headers with _LIBCPP_HAS_LOCALIZAT=
ION (#131921)
> dc9d4f9a7008 [lldb] Respect LaunchInfo::SetExecutable in ProcessLauncherP=
osixFork (#133093)
> 9c7d72869876 [LoongArch] Move fix-tle-le-sym-type test to test/MC. NFC (#=
133839)
> 0c30835a63db [X86][AVX10] Remove VAES and VPCLMULQDQ feature from AVX10.1=
 (#135489)
> 2e0966408283 [X86] Backport saturate-convert intrinsics renaming & YMM ro=
unding intrinsics removal in AVX10.2
> 0dd4235473d4 [SCEV] Use ashr to adjust constant multipliers (#135534)
> a141e58685fd [llvm][CodeGen] avoid repeated interval calculation in windo=
w scheduler (#132352)
> d88cd35023b4 [llvm][CodeGen] Fix the empty interval issue in Window Sched=
uler (#129204)
> 73d1e8598eda [CodeGen] Avoid repeated hash lookups (NFC) (#130237)
> 7034995f1029 [clang] Handle Binary StingLiteral kind in one more place (#=
132201)
> 2e7710eaffdd [clang] Introduce "binary" StringLiteral for #embed data (#1=
27629)
> e0db588f3db4 [IR] Fix assertion error in User new/delete edge case (#1299=
14)
> d5bb7b866e59 Avoid a race condition in opt-viewer/optrecord (#131214)
> d15fef4209f1 [IndVarSimplify] Handle the case where both operands are the=
 same when widening IV (#135207)
> 91647ae0dffe [X86][SSE] Don't emit SSE2 load instructions in SSE1-only mo=
de (#134547)
> d05543ed0796 [clang-format] Keep the space between `not` and a unary oper=
ator (#135035)
> 81220e68a496 [fatlto] Add coroutine passes when using FatLTO with ThinLTO=
 (#134434)
> edb54a7821fe Release/20.x: [clang-format] Set C11 instead of C17 for LK_C
> 4181e829d1db [LLDB][LoongArch] Fix build errors about NT_LOONGARCH_HW_{BR=
EAK,WATCH} (#126020)
> 7436329bfee9 Revert "[clang] [ARM] Explicitly enable NEON for Windows/Dar=
win targets (#122095)"
> a0c8959cc880 [X86] When expanding LCMPXCHG16B_SAVE_RBX, substitute RBX in=
 base (#134109)
> a8b5fe017a5e [libc++] Add missing release note for LLVM 20 about zip_view=
 (#134144)
> 41aefdbebe64 cuda clang: Fix argument order for __reduce_max_sync (#13288=
1)
> 19c2e1c12d47 [clang-tidy] Fix broken HeaderFilterRegex when read from con=
fig file (#133582)
> ac31db0463c0 [Sanitizers][Darwin][Test] XFAIL malloc_zone.cpp
> 53141e4e3c65 [clang] Do not infer lifetimebound for functions with void r=
eturn type (#131997)
> cf7bb13f0c7f [TailDuplicator] Determine if computed gotos using `blockadd=
ress` (#132536)
> 656289ffa0a6 Bump version to 20.1.3 (#134187)
> 58df0ef89dd6 (tag: llvmorg-20.1.2) Define LLVM_ABI and CLANG_ABI for __EM=
SCRIPTEN__ builds (#131578)
> e256eda15377 [LoongArch][MC] Add relocation support for fld fst [x]vld [x=
]vst
> ba00d9f641e9 [LoongArch] Pre-commit test for #133225
> f07f96873aa8 Backport/20.x: [LoongArch] Fix the type of tls-le symbols
> e7406753caf3 [PATCH] [clang][modules] Fix serialization and de-serializat=
ion of PCH module file refs  (#105994) (#132802)
> 2f6c5807ca7e [workflows] Add missing -y option to apt-get for abi tests (=
#133337)
> bc65196c0919 update test due to https://github.com/llvm/llvm-project/pull=
/126880 not being backported
> d6d1dbf22181 [ARM] Speedups for CombineBaseUpdate. (#129725)
> 5ba194972878 [MC,COFF] .safeseh: avoid changeSection (#132624)
> 943b43250b55 release/20.x: [clang][docs] Move -Wnontrivial-memcall to add=
ed flags. (#132367)
> 44a6f6abbdb6 [libcxx] [test] Fix restoring LLVM_DIR and Clang_DIR (#13283=
8)
> c1c4d7191d70 [clang-format] Allow `Language: Cpp` for C files (#133033)
> 2406e0d4467a Revert "[MC] Explicitly mark MCSymbol for MO_ExternalSymbol"=
 (#133291)
> 3d5f5ef6b784 workflows: Add missing apt-get update to abi tests (#133264)
> d1f5a9f66ee2 [hexagon] Bump the default version to v68 (#132304)
> 90cc9ca8bcb2 [Hexagon] Set the default compilation target to V68 (#125239=
)
> 3e2801eb634e [PowerPC] Support conversion between f16 and f128 (#130158)
> d60baf3d4786 [HEXAGON] Fix semantics of ordered FP compares (#131089)
> 1a76c29a9ba8 [hexagon] Enable --eh-frame-hdr (#130225)
> ecde8c235e5e [clang] fix matching of nested template template parameters
> c86df914dee1 release/20.x: [Clang] Fix various bugs in alias CTAD transfo=
rm
> f7b6f23c6bb7 [llvm-dlltool] Add a missing dependency
> a311bc81d957 [llvm-dlltool] Implement the --identify option (#127465)
> 6034661369c4 [LoongArch] Pre-commit test for fixing tls-le symbol type
> 95763651e25c [HEXAGON] Add support to lower "FREEZE a half(f16)" instruct=
ion on Hexagon and fix the isel-buildvector-v2f16.ll assertion (#130977)
> e0e8071815c7 [hexagon] Prevent alignment search beyond a label (#130631)
> 2198410a8a8a [compiler-rt][Darwin][x86] Fix instrprof-darwin-exports test=
 (#131425)
> 0383020b6c1a [llvm] Fix crash when complex deinterleaving operates on an =
unrolled loop (#129735)
> dc7b743515d3 [AArch64] Fix SVE scalar fcopysign lowering without neon. (#=
129787)
> fcd0ad23f668 [AArch64] Add test for scalar copysign. NFC
> 66825a89b8e0 [LLD] [COFF] Add a few more mingw libs to skip autoexports f=
or (#132289)
> 9710e9963455 [X86][AVX10.2] Include changes for COMX and VGETEXP from rev=
. 2 (#132824)
> 3f957cc67cff Bump version to 20.1.2 (#132293)
> 424c2d9b7e4d (tag: llvmorg-20.1.1) [libcxx] Add a missing include for __b=
it_iterator (#127015)
> 2cc53628fbe8 [SCEV] Check whether the start is non-zero in `ScalarEvoluti=
on::howFarToZero` (#131522)
> 0619bbcbbd86 [BPF] Add default cpu change in ReleaseNotes (#131691)
> 2dc152fb40db fix abi (again)
> 2044b18af046 fix abi
> e3f0ce3ef803 [Clang] Do not emit nodiscard warnings for the base expr of =
static member access (#131450)
> 0ceb4efefeaa [CUDA][HIP] fix virtual dtor host/device attr (#128926)
> 1058e693f090 [libc++][test] Skip a `is_virtual_base_of` test for apple-cl=
ang-17 (#131438)
> 1f9d00524b8c [libc++] Forward-proof some tests for AppleClang 17
> 1515c4ac202d [LAA] Consider accessed addrspace when mapping underlying ob=
j to access. (#129087)
> 1cfbb9f33436 Backport/20.x: [Clang] Fix an incorrect assumption on getTem=
platedDecl()
> 0fcfeacd8b99 [BPF] Fix BitCast Assertion with NonZero AddrSpace
> 0b23d98dceaa Reduce memory usage in AST parent map generation by lazily c=
hecking if nodes have been seen (#129934)
> 073ae08864b4  AMDGPU: Fix broken broken negative test for gfx950 assemble=
r (#129667) (#129686)
> cb50aaf8a11b [llvm-objcopy] Apply encryptable offset to first segment, no=
t section (#130517)
> 63e63f306128 [Clang] Fix an integer overflow issue in computing CTAD's pa=
rameter depth (#128704)
> b09b05b8e7c3 [MemCpyOpt] Fix clobber check in fca2memcpy optimization
> 64ae6413559e [SystemZ]  Move disabling of arg verification to before isFu=
llyInternal(). (#130693)
> 548d057ebcfa [VectorCombine] scalarizeLoadExtract - don't create scalar l=
oads if any extract is waiting to be erased (#129375)
> 7c154dad4d15 [Clang] Fix GPU intrinsic helpers incorrectly sign extending=
 (#129560)
> 946780474f3b [libc++][test] extend XFAIL clauses to cover Amazon Linux to=
o (#129377)
> f09bcfbdc90b [LoongArch] Relax the restrictions of inlineasm operand modi=
fier 'u' and 'w' (#129864)
> f62b50e0e8f1 [ValueTracking] Skip incoming values that are the same as th=
e phi in `isGuaranteedNotToBeUndefOrPoison` (#130111)
> 50343e517992 [HEXAGON] Fix hvx-isel for extract_subvector op (#129672)
> 0412f708c380 [TailDuplicator] Do not restrict the computed gotos (#114990=
)
> 72c4a3f419f4 [clang][test] Don't require specific alignment in test case =
(#130589)
> fbb2a7e74d91 [clang] Reject constexpr-unknown values as constant expressi=
ons more consistently (#129952)
> 9010db1b84ef [Clang] Treat constexpr-unknown value as invalid in `Evaluat=
eAsInitializer` (#128409)
> 32ce5b043c2b [AArch64] Fix BE popcount casts. (#129879)
> 05be3ca72e39 [AArch64] Add BE test coverage for popcount. NFC
> 0e96713a3b29 [ValueTracking] Bail out on x86_fp80 when computing fpclass =
with knownbits (#130477)
> 0fda7e633255 [X86][AVX10.2] Fix unexpected larger scope (#130767)
> f7a4e3a4d45d [clang-format] Don't remove parentheses separated from ellip=
sis by comma (#130471)
> 1d4d84c89be6 [AArch64] Don't try to custom lower fp16 selects with nofp (=
#129492)
> 0064565bce3f [DAGCombiner] Don't ignore N2's undef elements in `foldVSele=
ctOfConstants` (#129272)
> 54c90e4cdf2f [lldb] Fix manual CURSES_LIBRARIES tinfo finding (#128245)
> 712d3c7f0944 [lldb] Add terminfo dependency for ncurses support (#126810)
> 6525b151fe77 [Hexagon] Handle Call Operand vxi1 in Hexagon Backend (#1280=
27)
> dcc378e862de [libc++] Guard <codecvt> contents on _LIBCPP_HAS_LOCALIZATIO=
N (#129112)
> 0f5e7e86e38e [SystemZ] Add header guard macros to vecintrin.h (#129170)
> 5b552d780ae8 [LV][VPlan] Prevent calculate cost for skiped instructions i=
n precomputeCosts(). (#127966)
> 20adce87104c [libc++][ci] Update the Windows toolchains to Clang 19 (#129=
232)
> 0e537474ea59 Bump version to 20.1.1 (#130806)
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-devtools/llvm/{llvm_20.1.0.bb =3D> llvm_20.1.8.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/llvm/{llvm_20.1.0.bb =3D> llvm_20.1.8.bb} (=
98%)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-dev=
tools/llvm/llvm_20.1.8.bb
> similarity index 98%
> rename from meta/recipes-devtools/llvm/llvm_20.1.0.bb
> rename to meta/recipes-devtools/llvm/llvm_20.1.8.bb
> index 7ffc6ec1cb..22b054553d 100644
> --- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
> +++ b/meta/recipes-devtools/llvm/llvm_20.1.8.bb
> @@ -27,7 +27,7 @@ SRC_URI =3D "https://github.com/llvm/llvm-project/relea=
ses/download/llvmorg-${PV}/
>             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as=
-we.patch;striplevel=3D2 \
>             file://llvm-config \
>             "
> -SRC_URI[sha256sum] =3D "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e4429=
3d7ee9a7f62aad9a"
> +SRC_URI[sha256sum] =3D "6898f963c8e938981e6c4a302e83ec5beb4630147c731118=
3cf61069af16333d"
>  UPSTREAM_CHECK_URI =3D "https://github.com/llvm/llvm-project"
>  UPSTREAM_CHECK_REGEX =3D "llvmorg-(?P<pver>\d+(\.\d+)+)"
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224945): https://lists.openembedded.org/g/openembedde=
d-core/message/224945
> Mute This Topic: https://lists.openembedded.org/mt/115784802/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

