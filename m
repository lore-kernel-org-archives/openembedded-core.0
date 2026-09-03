Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B67DC624D6
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 23:47:10 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2951.1788479227341967422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 16:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RQhBCxmn;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-855de2d0d4dso5332867b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 16:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788479226; cv=none;
        d=google.com; s=arc-20260327;
        b=hsdEh05a3naaDpZaWKIrfsdlt3NT3WXkExlUwIx9x8xx4FVwbIqz94fKdw5pXKcG5x
         +LJ2tFsk1bxaNQaVa4bTWx2gq8cw6Gv5yssgqaM9mjiDwh61dmuZ5HSR3agkmT1EqvCS
         d/Im9X9o6eqbx3rQ37tPSYDkiOSLntZvpuksMLgWsQEiIsWrz0V8qYwf7anhPBZPzgSG
         SLEYn4iV6GfmI4UD8gaB8ROOR/hgHf9jHfXqkfzMNC+mZQahsGFc7VVXdOhOOyqBx0d0
         d7JG4wqSxlV9u4TTl8jH+Z1K+KcPRfz30nCgnQRFrvgLZKLztkeXkVr2FKTQlriLPmcl
         /ooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bi5bzLo+0gwW7dcmzgRM6pNtaE++Fun/U05TjfTOAhA=;
        fh=aFV7J8ngdfO0qf/7Exvg31KDr2OGL+G2lw9KMbsH+8g=;
        b=Baw5LxPKt/ZPQFaTEC+7YonH3CQ3AkVk6rSr/IpYTKkutWxkOLnUMrs1mFCeb/n2rN
         bLMowW/ffT69jJM0tH0NaAX3uTsgYn0kxESzapgeCfbrtd2+P9XGfhfB7bGvc7XLUps2
         t8yP3MlqDhI0sdW9K5Z+ZB43QAzFhE4z9xEmEsLcwFAt4Iv47+Ar86lxzKPh/rwsG8sR
         +DXWcULGP0UxOXK7mZ47xVQ2mBsP529atGAFL0u7aZUFsDfy5nIIXujt5bPWLqOip+ad
         JfdePtEt9XunogwruXIhaefNPpZQ8ZB6cba0E/PVsBNFg9XZczd5ApywiIhQwcAenQKf
         ff/g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788479226; x=1789084026; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bi5bzLo+0gwW7dcmzgRM6pNtaE++Fun/U05TjfTOAhA=;
        b=RQhBCxmnvbwK5gaiQI/+9wRTvtC9A1qzO+Na1DXWvwtPY7wj4khQFZi4lldogQOg0x
         tmkYhIhixJEkKGaH+pI3tbD3EISnd19y2J1OiDzQVrtYG3zrAk2OM36XsMmRkgMz9PGB
         TnLgmP1+gaUZAuN82mZB3rL2BURrU/zmE/U0sZDn93wnfBFg4iCYQY4eI/9Jzvc3H8PF
         i1BFXbQ0ZR30r34atJODxgZG7XaKEHb76oh+JOnJ5l7cr6AgQMw4YePf9lyVGCW2D0Bd
         L5Rklii75uj3P4CGsjHEcxYv7MKNxEf2HxCxFpr5E4yE9sKclFYOB+GfW3bnqQS0MoMt
         Vi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479226; x=1789084026;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bi5bzLo+0gwW7dcmzgRM6pNtaE++Fun/U05TjfTOAhA=;
        b=NHXESg/Te3wFHrTz4L4ii9BF3n6u4BryETZPsnebtvWJHhP7Qj9yP2hYwfeimdeo4m
         RNBNTgY6sIMR1bmnjc3QSWxQvu2kkYyCuLoRhk9id8ogzCvbCMslymGIsUxCobj3H8c1
         0T4wVOfOF7kNb+cmEkEhhN3ruhSMJq3AFv/NwNUS8l60i6CMbslv586fxZ7Bi5ayR7VN
         66nz4OelXWQyCrSogd42e3kQNrCyVyS9bHl3Eigp0Yx/i3skHtBddfkmkAxSWFn+H7dh
         y7Oz6+d6WOLjV6YjPF2wsZqLjES6XiORQVBHgtuzo3Gu0iIpnqquAmzluGlfjpTVyYKd
         7wDA==
X-Gm-Message-State: AFuF++meWnWvifCcLQRg7t4xMD/AgIFlA5/tw9HTJyPulZevqtz9fOz3
	OR4Z0Oug0MUe1Cmu2bfcuyC5BMV84DPyF8WYhAI4jtuDMfyoq7sFrA97tnDRyGgnrWRAD+ToYr1
	0FAorWJTZGjwA7L2QtSqj4IocuTZ5F+g=
X-Gm-Gg: AYBFou07hTLHJwB6oZyL2WY0aBqB/Ccg/eEjgmkLTGcz7a53Za8fUiRcZUHyX6J5Qia
	m2UPlsIeEix9Xpr095jGYJgjzjLi61m+Bn7vduNRSicb0k1HawaPsSgNECdsotunwTiCNJdeFN+
	jXCUqwC/tTrsazAKfflqo4VTOeuA2Og7PWo4f36uMNWiUzT6ezlTFScgqdqAhnB9J2m/sCRKz3Q
	frvRzW7edMcoCgEuwftpqnPdYifnRk0DbrC5ThYehvr2AauvLPqIThyr8N6OKimxwcZI6FmBUme
	hkKLm+FpKcsjdCfQ062p/jtYTTwycNxQw6n7gLyDdf6cIcmVNoLAaQ0ySlArDzmbvovMpHakHr+
	PlOn46Uf7RL1Fa4HBseLLQaNfvNClvR567BJUPYTPISxjlYNcyofYmxRI4TkBcJ4A8BoCHZPBi9
	CqX95cyVAVx/FgkxBEVl+p8AlgQ8tItGRCEsWaR61yWBkU9ggSWS6NoQPVcDXRYA6aLaAN3grFV
	7RPXrN6wTFveQ==
X-Received: by 2002:a05:690c:d91:b0:848:e4b6:d2d3 with SMTP id
 00721157ae682-8719bf0d5f6mr5248997b3.6.1788479226069; Thu, 03 Sep 2026
 16:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
 <CAMKF1soQRjHMiJnndyuEGrjf_VqB5fg4TjekEMgAe5cZLz8t0A@mail.gmail.com>
 <cd27e5c8-3846-4e35-bde3-643a1b753c69@windriver.com> <CAMKF1sq0eQY8h3G3BMo7osHQRYvD159Rb9ucN=twWxWKE3OJDA@mail.gmail.com>
In-Reply-To: <CAMKF1sq0eQY8h3G3BMo7osHQRYvD159Rb9ucN=twWxWKE3OJDA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Sep 2026 16:46:39 -0700
X-Gm-Features: AcwNN1Xj7sbZyvnCQhh3u030LVCNtTfSwOygHhoFkt3Tm_HvcK0L0YZNtZPL9aU
Message-ID: <CAMKF1som_-0Mhpym4hztGRGd+o8PtoOJv+WDCSc-YaAdwEgZ8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/11] clang/llvm: Upgrade to 23.1.0
To: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"deepesh.vatharaj@windriver.com" <deepesh.vatharaj@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000f54692065a9cc4dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 23:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245051

--000000000000f54692065a9cc4dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

clang 23 is getting into an infinite loop compiling dovecot.

On Wed, Sep 2, 2026 at 6:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Mon, Aug 31, 2026 at 9:59=E2=80=AFPM Dora, Sunil Kumar <
> SunilKumar.Dora@windriver.com> wrote:
>
>> On 8/31/2026 1:23 AM, Khem Raj via lists.openembedded.org wrote:
>>
>> *CAUTION: This email comes from a non Wind River email account!*
>> Do not click links or open attachments unless you recognize the sender
>> and know the content is safe.
>> Looks pretty good to me. I have few feedback comments, not a merge
>> blocker but good to consider for future ease of porting.
>>
>> Thanks Khem.
>>
>> Quick update on the upstream side since the series went out.
>>
>> The clang half of the ssp_nonshared patch (0004 in the stack) was *merge=
d
>> *into llvm main yesterday, commit fd974c429301
>> <https://github.com/llvm/llvm-project/commit/fd974c4293015388337e2f66f81=
7a23e5873389f>,
>> reviewed by
>> MaskRay (Original PR #219828
>> <https://github.com/llvm/llvm-project/pull/219828> ). A backport to
>> release/23.x is open as PR #220136
>> <https://github.com/llvm/llvm-project/pull/220136>.
>> If that lands I will flip 0004 to Upstream-Status: Backport, and at the
>> next upgrade the patch goes away entirely.
>>
>
> Thanks for following up on these patches, its really long time that we
> clear this debt.
>
>
>>
>> The gcc half is on gcc-patches
>> <https://gcc.gnu.org/pipermail/gcc-patches/2026-August/729351.html> as
>> v2 with bugzilla PR 127138
>> <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D127138>. Sam James
>> mentioned Gentoo has carried the same fix downstream for years.
>>
>
> yes, I know, again same, it will be nicer to get this list down as well.
> Somethings are due to how OE has customized stuff so it will
> be hard to get rid of but anything that gets upstreamed is a bonus.
>
>
>>
>> Thanks,
>> Sunil Dora
>>
>>
>> On Sun, Aug 30, 2026 at 5:59=E2=80=AFAM <sunilkumar.dora@windriver.com> =
wrote:
>>
>>> From: Sunil Dora <sunilkumar.dora@windriver.com>
>>>
>>> This upgrades clang/llvm from 22.1.8 to 23.1.0 and fixes the fallout
>>> found while testing the result.
>>>
>>> The carried LLVM patch stack goes from 41 to 35: seven dropped
>>> because 23.1.0 already contains the fix or the code they patched no
>>> longer exists, three reworked for LLVM 23, and one added for a 32-bit
>>> x86 build break, already merged in llvm-project.
>>>
>>> Please apply with git am --keep-cr: patch 8 fixes an ovmf file that
>>> uses CRLF line endings, and plain git am corrupts the patch.
>>>
>>> I have also reported the underlying bugs upstream:
>>>   llvm float16 fix, merged:
>>>     https://github.com/llvm/llvm-project/pull/219675
>>>   ovmf fix, sent to edk2:
>>>     https://github.com/tianocore/edk2/pull/13038
>>>   pango warning, the root cause is in GLib, reported to both:
>>>     https://gitlab.gnome.org/GNOME/glib/-/issues/4038
>>>     https://gitlab.gnome.org/GNOME/pango/-/issues/900
>>>   vulkan-samples warning, which is a real bug in their code:
>>>     https://github.com/KhronosGroup/Vulkan-Samples/issues/1570
>>>
>>> Tested: oe-selftest clang suites on qemuarm, qemuarm64, qemux86,
>>> qemux86-64 and qemuriscv64 on the autobuilder, musl images on qemux86
>>> and qemuarm64, a qemux86 world build with TOOLCHAIN=3Dclang, 32-bit
>>> multilib, and core-image-minimal testimage runs.
>>>
>>> Deepesh Varatharajan (2):
>>>   rust: Fix build and oe-selftest failures with LLVM 23
>>>   clang/llvm: Ignore tests fail with clang/llvm 23 upgrade
>>>
>>> Sunil Dora (9):
>>>   clang/llvm: Upgrade to 23.1.0 release
>>>   spirv-llvm-translator: Upgrade to 23.1.0
>>>   openmp: Build via the LLVM runtimes entry point
>>>   rust: Do not pass the removed x86 amx-tf32 feature to LLVM 23
>>>   clang: Disable clangd's decision-forest completion model on powerpc
>>>   pango: Don't turn clang 23's -Wunused-but-set-global into an error
>>>   ovmf: Fix memcpy alias prototype for clang 23
>>>   vulkan-samples: Don't turn clang 23's -Wdangling-gsl into an error
>>>   gettext: Export a fully-flagged Objective-C compiler
>>>
>>>  meta/conf/distro/include/maintainers.inc      |   2 +-
>>>  meta/lib/oeqa/selftest/cases/clang.py         |  10 +
>>>  meta/lib/oeqa/selftest/cases/rust.py          |   1 +
>>>  ...t-env.in-do-not-add-C-CXX-parameters.patch |  17 +-
>>>  meta/recipes-core/gettext/gettext_1.0.bb      |   5 +
>>>  ...sicLib-fix-memcpy-alias-prototype-fo.patch |  35 +
>>>  meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
>>>  ...ify-cross-compilation.-Don-t-use-na.patch} |   6 +-
>>>  ...ibunwind-headers-when-LIBCXXABI_LIBU.patch |  60 --
>>>  ...-support-a-new-embedded-linux-target.patch | 309 --------
>>>  ...env-override-of-exe-and-libdir-path.patch} |   4 +-
>>>  ...-driver-Check-sysroot-for-ldso-path.patch} |  14 +-
>>>  ...ools.cpp-Add-lssp_nonshared-on-musl.patch} |   6 +-
>>>  ...5-clang-Prepend-trailing-to-sysroot.patch} |  10 +-
>>>  ...fine-releative-gcc-installation-dir.patch} |  10 +-
>>>  ...d-and-ldl-along-with-lunwind-for-st.patch} |  10 +-
>>>  ...-Check-for-atomic-double-intrinsics.patch} |   4 +-
>>>  ...ure-for-packages-using-find_package.patch} |  20 +-
>>>  ...e-dir-location-for-cross-toolchains.patch} |   4 +-
>>>  ...dyld-prefix-when-checking-sysroot-f.patch} |  18 +-
>>>  ...clang-Use-python3-in-python-scripts.patch} |   6 +-
>>>  ...-anchor-for-adding-OE-distro-vendor.patch} |  37 +-
>>>  ...ple-for-non-debian-multiarch-linux-.patch} |   9 +-
>>>  ...ibunwind-Added-unw_backtrace-method.patch} |   8 +-
>>>  ...016-lldb-Link-with-libatomic-on-x86.patch} |   4 +-
>>>  ...ot-use-backtrace-APIs-on-non-glibc-l.patch |  68 --
>>>  ...mpiler-rt-Enable-__int128-for-ppc32.patch} |  26 +-
>>>  ...t-use-cmake-infra-to-detect-libzstd.patch} |   8 +-
>>>  ...-Fix-stat-struct-s-size-for-O32-ABI.patch} |   6 +-
>>>  ...cpp-ARMLibDirs-search-also-in-lib32.patch} |  10 +-
>>>  ...-OE-specific-ABI-triple-for-N32-ABI.patch} |  63 +-
>>>  ...nwind.pc.in-and-llvm-config-scripts.patch} |  12 +-
>>>  ...pect-LLVM_LIBDIR_SUFFIX-like-other-.patch} |  17 +-
>>>  ...o-not-pass-target-to-clang-compiler.patch} |   4 +-
>>>  ...-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
>>>  ...ve-LLVM_LDFLAGS-from-ldflags-output.patch} |   4 +-
>>>  ...de-sync_fetch_and_-for-any-pre-ARMv.patch} |   6 +-
>>>  ...de-uptr-sptr-typedefs-on-Mips-Linux.patch} |   8 +-
>>>  ...-headers-in-the-debug-info-when-bui.patch} |   6 +-
>>>  ..._HAVE_OPT_VIEWER_MODULES-externally.patch} |   6 +-
>>>  ...ang-tblgen-if-it-is-actually-needed.patch} |   8 +-
>>>  ...ymlink-path-for-libcc-when-LLVM_ENA.patch} |   8 +-
>>>  ...ix-sysroot-based-compiler-rt-search.patch} |  15 +-
>>>  ...> 0034-guard-clang-tools-extra-test.patch} |  47 +-
>>>  ...ng-block-when-searching-for-noreturn.patch |  41 --
>>>  ...e-float16-on-32-bit-x86-without-SSE2.patch |  36 +
>>>  ...UNKNOWN-elements-of-OffloadArch-enum.patch | 274 --------
>>>  ...e-__gnu_unwind_frame-in-cxa_personal.patch |  33 -
>>>  ...te-exit-fold-candidates-in-determini.patch |  71 --
>>>  meta/recipes-devtools/clang/clang_git.bb      |   4 +
>>>  meta/recipes-devtools/clang/common-clang.inc  |   4 +-
>>>  meta/recipes-devtools/clang/common.inc        |  78 +--
>>>  meta/recipes-devtools/clang/openmp_git.bb     |   5 +-
>>>  ...ommits-from-rust-Fix-selftest-llvm23.patch | 661 ++++++++++++++++++
>>>  ...llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch |  38 +
>>>  meta/recipes-devtools/rust/rust-source.inc    |   2 +
>>>  ...ror-on-clang-s-unused-but-set-global.patch |  28 +
>>>  meta/recipes-graphics/pango/pango_1.58.0.bb   |   1 +
>>>  ...1.5.bb =3D> spirv-llvm-translator_23.1.0.bb} |   6 +-
>>>  .../vulkan/vulkan-samples_git.bb              |   4 +-
>>>  60 files changed, 1109 insertions(+), 1113 deletions(-)
>>>  create mode 100644
>>> meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-IntrinsicLib-fix-memcpy-alia=
s-prototype-fo.patch
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0003-compiler-rt-Simplify-cross-comp=
ilation.-Don-t-use-na.patch
>>> =3D> 0001-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch} (=
90%)
>>>  delete mode 100644
>>> meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-when-LIBCXXABI_LIBU.patch
>>>  delete mode 100644
>>> meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedd=
ed-linux-target.patch
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0004-llvm-allow-env-override-of-exe-=
and-libdir-path.patch
>>> =3D> 0002-llvm-allow-env-override-of-exe-and-libdir-path.patch} (96%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0005-clang-driver-Check-sysroot-for-=
ldso-path.patch
>>> =3D> 0003-clang-driver-Check-sysroot-for-ldso-path.patch} (87%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0006-clang-Driver-tools.cpp-Add-lssp=
_nonshared-on-musl.patch
>>> =3D> 0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch} (86%=
)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0007-clang-Prepend-trailing-to-sysro=
ot.patch
>>> =3D> 0005-clang-Prepend-trailing-to-sysroot.patch} (81%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0009-clang-Define-releative-gcc-inst=
allation-dir.patch
>>> =3D> 0006-clang-Define-releative-gcc-installation-dir.patch} (94%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0010-clang-Add-lpthread-and-ldl-alon=
g-with-lunwind-for-st.patch
>>> =3D> 0007-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch} (=
86%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0011-Check-for-atomic-double-intrins=
ics.patch
>>> =3D> 0008-Check-for-atomic-double-intrinsics.patch} (91%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0012-cmake-Fix-configure-for-package=
s-using-find_package.patch
>>> =3D> 0009-cmake-Fix-configure-for-packages-using-find_package.patch} (8=
9%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0013-clang-Fix-resource-dir-location=
-for-cross-toolchains.patch
>>> =3D> 0010-clang-Fix-resource-dir-location-for-cross-toolchains.patch} (=
95%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0014-clang-driver-Add-dyld-prefix-wh=
en-checking-sysroot-f.patch
>>> =3D> 0011-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch} (=
88%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0015-clang-Use-python3-in-python-scr=
ipts.patch
>>> =3D> 0012-clang-Use-python3-in-python-scripts.patch} (90%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0016-llvm-clang-Insert-anchor-for-ad=
ding-OE-distro-vendor.patch
>>> =3D> 0013-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch} (=
91%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0018-clang-Fix-x86-triple-for-non-de=
bian-multiarch-linux-.patch
>>> =3D> 0014-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch} (=
86%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0019-libunwind-Added-unw_backtrace-m=
ethod.patch
>>> =3D> 0015-libunwind-Added-unw_backtrace-method.patch} (89%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0020-lldb-Link-with-libatomic-on-x86=
.patch
>>> =3D> 0016-lldb-Link-with-libatomic-on-x86.patch} (92%)
>>>  delete mode 100644
>>> meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtrace=
-APIs-on-non-glibc-l.patch
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0021-compiler-rt-Enable-__int128-for=
-ppc32.patch
>>> =3D> 0017-compiler-rt-Enable-__int128-for-ppc32.patch} (77%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0022-llvm-Do-not-use-cmake-infra-to-=
detect-libzstd.patch
>>> =3D> 0018-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch} (91%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0023-compiler-rt-Fix-stat-struct-s-s=
ize-for-O32-ABI.patch
>>> =3D> 0019-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch} (91%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0024-ToolChains-Gnu.cpp-ARMLibDirs-s=
earch-also-in-lib32.patch
>>> =3D> 0020-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch} (98=
%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0025-clang-llvm-Add-OE-specific-ABI-=
triple-for-N32-ABI.patch
>>> =3D> 0021-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch} (60%=
)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0026-llvm-Add-libunwind.pc.in-and-ll=
vm-config-scripts.patch
>>> =3D> 0022-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch} (84%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0027-scan-build-py-respect-LLVM_LIBD=
IR_SUFFIX-like-other-.patch
>>> =3D> 0023-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch} (=
90%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0028-compiler-rt-Do-not-pass-target-=
to-clang-compiler.patch
>>> =3D> 0024-compiler-rt-Do-not-pass-target-to-clang-compiler.patch} (91%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0029-AsmMatcherEmitter-sort-ClassInf=
o-lists-by-name-as-we.patch
>>> =3D> 0025-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch} (=
92%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0030-llvm-config-remove-LLVM_LDFLAGS=
-from-ldflags-output.patch
>>> =3D> 0026-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch} (9=
2%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0031-compiler-rt-Exclude-sync_fetch_=
and_-for-any-pre-ARMv.patch
>>> =3D> 0027-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch} (=
95%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0032-compiler-rt-Hardcode-uptr-sptr-=
typedefs-on-Mips-Linu.patch
>>> =3D> 0028-Hardcode-uptr-sptr-typedefs-on-Mips-Linux.patch} (86%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0034-Revert-libc-Remap-headers-in-th=
e-debug-info-when-bui.patch
>>> =3D> 0029-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch} (=
89%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0036-Don-t-expose-LLVM_HAVE_OPT_VIEW=
ER_MODULES-externally.patch
>>> =3D> 0030-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch} (=
86%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0037-clang-Only-build-clang-tblgen-i=
f-it-is-actually-need.patch
>>> =3D> 0031-Only-build-clang-tblgen-if-it-is-actually-needed.patch} (81%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0038-llvm-libgcc-Fix-symlink-path-fo=
r-libcc-when-LLVM_ENA.patch
>>> =3D> 0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch} (=
93%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0041-Consolidate-and-fix-sysroot-bas=
ed-compiler-rt-search.patch
>>> =3D> 0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch} (=
91%)
>>>  rename
>>> meta/recipes-devtools/clang/clang/{0042-guard-clang-tools-extra-test.pa=
tch
>>> =3D> 0034-guard-clang-tools-extra-test.patch} (83%)
>>>  delete mode 100644
>>> meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-se=
arching-for-noreturn.patch
>>>  create mode 100644
>>> meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x=
86-without-SSE2.patch
>>>  delete mode 100644
>>> meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elemen=
ts-of-OffloadArch-enum.patch
>>>  delete mode 100644
>>> meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_f=
rame-in-cxa_personal.patch
>>>  delete mode 100644
>>> meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit-fold-can=
didates-in-determini.patch
>>>  create mode 100644
>>> meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-se=
lftest-llvm23.patch
>>>  create mode 100644
>>> meta/recipes-devtools/rust/files/0005-rustc_codegen_llvm-Do-not-pass-am=
x-tf32-to-LLVM-23.patch
>>>  create mode 100644
>>> meta/recipes-graphics/pango/pango/0001-meson-don-t-error-on-clang-s-unu=
sed-but-set-global.patch
>>>  rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.1.5.bb =3D=
>
>>> spirv-llvm-translator_23.1.0.bb} (87%)
>>>
>>> --
>>> 2.43.0
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#244697): https://lists.openembedded.org/g/openembedd=
ed-core/message/244697
>> Mute This Topic: https://lists.openembedded.org/mt/120998127/8968818
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [S=
unilKumar.Dora@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>>
>>

--000000000000f54692065a9cc4dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">clang=C2=A023 is getting into an infinite loop compiling d=
ovecot.=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 2, 2026 at 6:10=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Aug 31, 2026 at 9:59=E2=80=AFPM Dora=
, Sunil Kumar &lt;<a href=3D"mailto:SunilKumar.Dora@windriver.com" target=
=3D"_blank">SunilKumar.Dora@windriver.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><u></u>




<div>
<div>On 8/31/2026 1:23 AM, Khem Raj via <a href=3D"http://lists.openembedde=
d.org" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
</div>
<blockquote type=3D"cite">
<strong></strong>
<div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:rgb(25=
2,252,3)"><strong><u></u><span style=3D"font-size:11pt;color:rgb(0,0,0)">CA=
UTION: This email comes from a non Wind River email account!</span><u></u><=
/strong><br>
<u></u><span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click links o=
r open attachments unless you recognize the sender and know the content is =
safe.</span><br>
<u></u></div>
<div>
<div dir=3D"ltr">Looks pretty good to me. I have few feedback comments, not=
 a merge blocker but good to consider for future ease of porting.</div>
</div>
</blockquote>
Thanks Khem.<br>
<br>
Quick update on the upstream side since the series went out.<br>
<br>
The clang half of the ssp_nonshared patch (0004 in the stack) was <b>merged=
 </b>into llvm main yesterday, commit
<a href=3D"https://github.com/llvm/llvm-project/commit/fd974c4293015388337e=
2f66f817a23e5873389f" target=3D"_blank">
fd974c429301</a>, reviewed by<br>
MaskRay (Original <a href=3D"https://github.com/llvm/llvm-project/pull/2198=
28" target=3D"_blank">
PR #219828</a> ). A backport to release/23.x is open as <a href=3D"https://=
github.com/llvm/llvm-project/pull/220136" target=3D"_blank">
PR #220136</a>.=C2=A0<br>
If that lands I will flip 0004 to Upstream-Status: Backport, and at the nex=
t upgrade the patch goes away entirely.<br></div></blockquote><div><br></di=
v><div>Thanks for following=C2=A0up on these patches, its really long time =
that we clear this debt.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div>
<br>
The gcc half is on <a href=3D"https://gcc.gnu.org/pipermail/gcc-patches/202=
6-August/729351.html" target=3D"_blank">
gcc-patches</a> as v2 with bugzilla <a href=3D"https://gcc.gnu.org/bugzilla=
/show_bug.cgi?id=3D127138" target=3D"_blank">
PR 127138</a>. Sam James mentioned Gentoo has carried the same fix downstre=
am for years.<br></div></blockquote><div><br></div><div>yes, I know, again =
same, it will be nicer to get this list down as well. Somethings are due to=
 how OE has customized stuff so it will</div><div>be hard to get rid of but=
 anything that gets upstreamed is a bonus.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div>
<br>
Thanks,<br>
Sunil Dora
<blockquote type=3D"cite">
<div><br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 30, 2026 at 5:59=E2=80=AF=
AM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" target=3D"_blank">s=
unilkumar.dora@windriver.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" targe=
t=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
<br>
This upgrades clang/llvm from 22.1.8 to 23.1.0 and fixes the fallout<br>
found while testing the result.<br>
<br>
The carried LLVM patch stack goes from 41 to 35: seven dropped<br>
because 23.1.0 already contains the fix or the code they patched no<br>
longer exists, three reworked for LLVM 23, and one added for a 32-bit<br>
x86 build break, already merged in llvm-project.<br>
<br>
Please apply with git am --keep-cr: patch 8 fixes an ovmf file that<br>
uses CRLF line endings, and plain git am corrupts the patch.<br>
<br>
I have also reported the underlying bugs upstream:<br>
=C2=A0 llvm float16 fix, merged:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/llvm/llvm-project/pull/219675" =
rel=3D"noreferrer" target=3D"_blank">
https://github.com/llvm/llvm-project/pull/219675</a><br>
=C2=A0 ovmf fix, sent to edk2:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/tianocore/edk2/pull/13038" rel=
=3D"noreferrer" target=3D"_blank">
https://github.com/tianocore/edk2/pull/13038</a><br>
=C2=A0 pango warning, the root cause is in GLib, reported to both:<br>
=C2=A0 =C2=A0 <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/issues/4038"=
 rel=3D"noreferrer" target=3D"_blank">
https://gitlab.gnome.org/GNOME/glib/-/issues/4038</a><br>
=C2=A0 =C2=A0 <a href=3D"https://gitlab.gnome.org/GNOME/pango/-/issues/900"=
 rel=3D"noreferrer" target=3D"_blank">
https://gitlab.gnome.org/GNOME/pango/-/issues/900</a><br>
=C2=A0 vulkan-samples warning, which is a real bug in their code:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/KhronosGroup/Vulkan-Samples/iss=
ues/1570" rel=3D"noreferrer" target=3D"_blank">
https://github.com/KhronosGroup/Vulkan-Samples/issues/1570</a><br>
<br>
Tested: oe-selftest clang suites on qemuarm, qemuarm64, qemux86,<br>
qemux86-64 and qemuriscv64 on the autobuilder, musl images on qemux86<br>
and qemuarm64, a qemux86 world build with TOOLCHAIN=3Dclang, 32-bit<br>
multilib, and core-image-minimal testimage runs.<br>
<br>
Deepesh Varatharajan (2):<br>
=C2=A0 rust: Fix build and oe-selftest failures with LLVM 23<br>
=C2=A0 clang/llvm: Ignore tests fail with clang/llvm 23 upgrade<br>
<br>
Sunil Dora (9):<br>
=C2=A0 clang/llvm: Upgrade to 23.1.0 release<br>
=C2=A0 spirv-llvm-translator: Upgrade to 23.1.0<br>
=C2=A0 openmp: Build via the LLVM runtimes entry point<br>
=C2=A0 rust: Do not pass the removed x86 amx-tf32 feature to LLVM 23<br>
=C2=A0 clang: Disable clangd&#39;s decision-forest completion model on powe=
rpc<br>
=C2=A0 pango: Don&#39;t turn clang 23&#39;s -Wunused-but-set-global into an=
 error<br>
=C2=A0 ovmf: Fix memcpy alias prototype for clang 23<br>
=C2=A0 vulkan-samples: Don&#39;t turn clang 23&#39;s -Wdangling-gsl into an=
 error<br>
=C2=A0 gettext: Export a fully-flagged Objective-C compiler<br>
<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/clang.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 10 +<br>
=C2=A0meta/lib/oeqa/selftest/cases/rust.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...t-env.in-do-not-add-C-CXX-parameters.patch |=C2=A0 17 +-<br>
=C2=A0meta/recipes-core/gettext/<a href=3D"http://gettext_1.0.bb" rel=3D"no=
referrer" target=3D"_blank">gettext_1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A05 +<br>
=C2=A0...sicLib-fix-memcpy-alias-prototype-fo.patch |=C2=A0 35 +<br>
=C2=A0meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...ify-cross-compilation.-Don-t-use-na.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0...ibunwind-headers-when-LIBCXXABI_LIBU.patch |=C2=A0 60 --<br>
=C2=A0...-support-a-new-embedded-linux-target.patch | 309 --------<br>
=C2=A0...env-override-of-exe-and-libdir-path.patch} |=C2=A0 =C2=A04 +-<br>
=C2=A0...-driver-Check-sysroot-for-ldso-path.patch} |=C2=A0 14 +-<br>
=C2=A0...ools.cpp-Add-lssp_nonshared-on-musl.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0...5-clang-Prepend-trailing-to-sysroot.patch} |=C2=A0 10 +-<br>
=C2=A0...fine-releative-gcc-installation-dir.patch} |=C2=A0 10 +-<br>
=C2=A0...d-and-ldl-along-with-lunwind-for-st.patch} |=C2=A0 10 +-<br>
=C2=A0...-Check-for-atomic-double-intrinsics.patch} |=C2=A0 =C2=A04 +-<br>
=C2=A0...ure-for-packages-using-find_package.patch} |=C2=A0 20 +-<br>
=C2=A0...e-dir-location-for-cross-toolchains.patch} |=C2=A0 =C2=A04 +-<br>
=C2=A0...dyld-prefix-when-checking-sysroot-f.patch} |=C2=A0 18 +-<br>
=C2=A0...clang-Use-python3-in-python-scripts.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0...-anchor-for-adding-OE-distro-vendor.patch} |=C2=A0 37 +-<br>
=C2=A0...ple-for-non-debian-multiarch-linux-.patch} |=C2=A0 =C2=A09 +-<br>
=C2=A0...ibunwind-Added-unw_backtrace-method.patch} |=C2=A0 =C2=A08 +-<br>
=C2=A0...016-lldb-Link-with-libatomic-on-x86.patch} |=C2=A0 =C2=A04 +-<br>
=C2=A0...ot-use-backtrace-APIs-on-non-glibc-l.patch |=C2=A0 68 --<br>
=C2=A0...mpiler-rt-Enable-__int128-for-ppc32.patch} |=C2=A0 26 +-<br>
=C2=A0...t-use-cmake-infra-to-detect-libzstd.patch} |=C2=A0 =C2=A08 +-<br>
=C2=A0...-Fix-stat-struct-s-size-for-O32-ABI.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0...cpp-ARMLibDirs-search-also-in-lib32.patch} |=C2=A0 10 +-<br>
=C2=A0...-OE-specific-ABI-triple-for-N32-ABI.patch} |=C2=A0 63 +-<br>
=C2=A0...nwind.pc.in-and-llvm-config-scripts.patch} |=C2=A0 12 +-<br>
=C2=A0...pect-LLVM_LIBDIR_SUFFIX-like-other-.patch} |=C2=A0 17 +-<br>
=C2=A0...o-not-pass-target-to-clang-compiler.patch} |=C2=A0 =C2=A04 +-<br>
=C2=A0...-sort-ClassInfo-lists-by-name-as-we.patch} |=C2=A0 =C2=A04 +-<br>
=C2=A0...ve-LLVM_LDFLAGS-from-ldflags-output.patch} |=C2=A0 =C2=A04 +-<br>
=C2=A0...de-sync_fetch_and_-for-any-pre-ARMv.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0...de-uptr-sptr-typedefs-on-Mips-Linux.patch} |=C2=A0 =C2=A08 +-<br>
=C2=A0...-headers-in-the-debug-info-when-bui.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0..._HAVE_OPT_VIEWER_MODULES-externally.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0...ang-tblgen-if-it-is-actually-needed.patch} |=C2=A0 =C2=A08 +-<br>
=C2=A0...ymlink-path-for-libcc-when-LLVM_ENA.patch} |=C2=A0 =C2=A08 +-<br>
=C2=A0...ix-sysroot-based-compiler-rt-search.patch} |=C2=A0 15 +-<br>
=C2=A0...&gt; 0034-guard-clang-tools-extra-test.patch} |=C2=A0 47 +-<br>
=C2=A0...ng-block-when-searching-for-noreturn.patch |=C2=A0 41 --<br>
=C2=A0...e-float16-on-32-bit-x86-without-SSE2.patch |=C2=A0 36 +<br>
=C2=A0...UNKNOWN-elements-of-OffloadArch-enum.patch | 274 --------<br>
=C2=A0...e-__gnu_unwind_frame-in-cxa_personal.patch |=C2=A0 33 -<br>
=C2=A0...te-exit-fold-candidates-in-determini.patch |=C2=A0 71 --<br>
=C2=A0meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb" rel=3D"no=
referrer" target=3D"_blank">clang_git.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +<br>
=C2=A0meta/recipes-devtools/clang/common-clang.inc=C2=A0 |=C2=A0 =C2=A04 +-=
<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 78 +--<br>
=C2=A0meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">openmp_git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +-<br>
=C2=A0...ommits-from-rust-Fix-selftest-llvm23.patch | 661 +++++++++++++++++=
+<br>
=C2=A0...llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch |=C2=A0 38 +<br>
=C2=A0meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0...ror-on-clang-s-unused-but-set-global.patch |=C2=A0 28 +<br>
=C2=A0meta/recipes-graphics/pango/<a href=3D"http://pango_1.58.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pango_1.58.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0...<a href=3D"http://1.5.bb" rel=3D"noreferrer" target=3D"_blank">1.5=
.bb</a> =3D&gt;
<a href=3D"http://spirv-llvm-translator_23.1.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">
spirv-llvm-translator_23.1.0.bb</a>} |=C2=A0 =C2=A06 +-<br>
=C2=A0.../vulkan/<a href=3D"http://vulkan-samples_git.bb" rel=3D"noreferrer=
" target=3D"_blank">vulkan-samples_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A060 files changed, 1109 insertions(+), 1113 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-Intrins=
icLib-fix-memcpy-alias-prototype-fo.patch<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0003-compiler-rt-Simplify-c=
ross-compilation.-Don-t-use-na.patch =3D&gt; 0001-compiler-rt-Simplify-cros=
s-compilation.-Don-t-use-na.patch} (90%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/clang/clang/0001-libcxxabi-F=
ind-libunwind-headers-when-LIBCXXABI_LIBU.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/clang/clang/0002-compiler-rt=
-support-a-new-embedded-linux-target.patch<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0004-llvm-allow-env-overrid=
e-of-exe-and-libdir-path.patch =3D&gt; 0002-llvm-allow-env-override-of-exe-=
and-libdir-path.patch} (96%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0005-clang-driver-Check-sys=
root-for-ldso-path.patch =3D&gt; 0003-clang-driver-Check-sysroot-for-ldso-p=
ath.patch} (87%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0006-clang-Driver-tools.cpp=
-Add-lssp_nonshared-on-musl.patch =3D&gt; 0004-clang-Driver-tools.cpp-Add-l=
ssp_nonshared-on-musl.patch} (86%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0007-clang-Prepend-trailing=
-to-sysroot.patch =3D&gt; 0005-clang-Prepend-trailing-to-sysroot.patch} (81=
%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0009-clang-Define-releative=
-gcc-installation-dir.patch =3D&gt; 0006-clang-Define-releative-gcc-install=
ation-dir.patch} (94%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0010-clang-Add-lpthread-and=
-ldl-along-with-lunwind-for-st.patch =3D&gt; 0007-clang-Add-lpthread-and-ld=
l-along-with-lunwind-for-st.patch} (86%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0011-Check-for-atomic-doubl=
e-intrinsics.patch =3D&gt; 0008-Check-for-atomic-double-intrinsics.patch} (=
91%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0012-cmake-Fix-configure-fo=
r-packages-using-find_package.patch =3D&gt; 0009-cmake-Fix-configure-for-pa=
ckages-using-find_package.patch} (89%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0013-clang-Fix-resource-dir=
-location-for-cross-toolchains.patch =3D&gt; 0010-clang-Fix-resource-dir-lo=
cation-for-cross-toolchains.patch} (95%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0014-clang-driver-Add-dyld-=
prefix-when-checking-sysroot-f.patch =3D&gt; 0011-clang-driver-Add-dyld-pre=
fix-when-checking-sysroot-f.patch} (88%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0015-clang-Use-python3-in-p=
ython-scripts.patch =3D&gt; 0012-clang-Use-python3-in-python-scripts.patch}=
 (90%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0016-llvm-clang-Insert-anch=
or-for-adding-OE-distro-vendor.patch =3D&gt; 0013-llvm-clang-Insert-anchor-=
for-adding-OE-distro-vendor.patch} (91%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0018-clang-Fix-x86-triple-f=
or-non-debian-multiarch-linux-.patch =3D&gt; 0014-clang-Fix-x86-triple-for-=
non-debian-multiarch-linux-.patch} (86%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0019-libunwind-Added-unw_ba=
cktrace-method.patch =3D&gt; 0015-libunwind-Added-unw_backtrace-method.patc=
h} (89%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0020-lldb-Link-with-libatom=
ic-on-x86.patch =3D&gt; 0016-lldb-Link-with-libatomic-on-x86.patch} (92%)<b=
r>
=C2=A0delete mode 100644 meta/recipes-devtools/clang/clang/0017-compiler-rt=
-Do-not-use-backtrace-APIs-on-non-glibc-l.patch<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0021-compiler-rt-Enable-__i=
nt128-for-ppc32.patch =3D&gt; 0017-compiler-rt-Enable-__int128-for-ppc32.pa=
tch} (77%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0022-llvm-Do-not-use-cmake-=
infra-to-detect-libzstd.patch =3D&gt; 0018-llvm-Do-not-use-cmake-infra-to-d=
etect-libzstd.patch} (91%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0023-compiler-rt-Fix-stat-s=
truct-s-size-for-O32-ABI.patch =3D&gt; 0019-compiler-rt-Fix-stat-struct-s-s=
ize-for-O32-ABI.patch} (91%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0024-ToolChains-Gnu.cpp-ARM=
LibDirs-search-also-in-lib32.patch =3D&gt; 0020-ToolChains-Gnu.cpp-ARMLibDi=
rs-search-also-in-lib32.patch} (98%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0025-clang-llvm-Add-OE-spec=
ific-ABI-triple-for-N32-ABI.patch =3D&gt; 0021-clang-llvm-Add-OE-specific-A=
BI-triple-for-N32-ABI.patch} (60%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0026-llvm-Add-libunwind.pc.=
in-and-llvm-config-scripts.patch =3D&gt; 0022-llvm-Add-libunwind.pc.in-and-=
llvm-config-scripts.patch} (84%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0027-scan-build-py-respect-=
LLVM_LIBDIR_SUFFIX-like-other-.patch =3D&gt; 0023-scan-build-py-respect-LLV=
M_LIBDIR_SUFFIX-like-other-.patch} (90%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0028-compiler-rt-Do-not-pas=
s-target-to-clang-compiler.patch =3D&gt; 0024-compiler-rt-Do-not-pass-targe=
t-to-clang-compiler.patch} (91%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0029-AsmMatcherEmitter-sort=
-ClassInfo-lists-by-name-as-we.patch =3D&gt; 0025-AsmMatcherEmitter-sort-Cl=
assInfo-lists-by-name-as-we.patch} (92%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0030-llvm-config-remove-LLV=
M_LDFLAGS-from-ldflags-output.patch =3D&gt; 0026-llvm-config-remove-LLVM_LD=
FLAGS-from-ldflags-output.patch} (92%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0031-compiler-rt-Exclude-sy=
nc_fetch_and_-for-any-pre-ARMv.patch =3D&gt; 0027-compiler-rt-Exclude-sync_=
fetch_and_-for-any-pre-ARMv.patch} (95%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0032-compiler-rt-Hardcode-u=
ptr-sptr-typedefs-on-Mips-Linu.patch =3D&gt; 0028-Hardcode-uptr-sptr-typede=
fs-on-Mips-Linux.patch} (86%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0034-Revert-libc-Remap-head=
ers-in-the-debug-info-when-bui.patch =3D&gt; 0029-Revert-libc-Remap-headers=
-in-the-debug-info-when-bui.patch} (89%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0036-Don-t-expose-LLVM_HAVE=
_OPT_VIEWER_MODULES-externally.patch =3D&gt; 0030-Don-t-expose-LLVM_HAVE_OP=
T_VIEWER_MODULES-externally.patch} (86%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0037-clang-Only-build-clang=
-tblgen-if-it-is-actually-need.patch =3D&gt; 0031-Only-build-clang-tblgen-i=
f-it-is-actually-needed.patch} (81%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0038-llvm-libgcc-Fix-symlin=
k-path-for-libcc-when-LLVM_ENA.patch =3D&gt; 0032-llvm-libgcc-Fix-symlink-p=
ath-for-libcc-when-LLVM_ENA.patch} (93%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0041-Consolidate-and-fix-sy=
sroot-based-compiler-rt-search.patch =3D&gt; 0033-Consolidate-and-fix-sysro=
ot-based-compiler-rt-search.patch} (91%)<br>
=C2=A0rename meta/recipes-devtools/clang/clang/{0042-guard-clang-tools-extr=
a-test.patch =3D&gt; 0034-guard-clang-tools-extra-test.patch} (83%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/clang/clang/0035-Prevent-rev=
isiting-block-when-searching-for-noreturn.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0035-libc-Disabl=
e-float16-on-32-bit-x86-without-SSE2.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/clang/clang/0039-Rename-UNUS=
ED-and-UNKNOWN-elements-of-OffloadArch-enum.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/clang/clang/0040-libcxxabi-d=
eclare-__gnu_unwind_frame-in-cxa_personal.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/clang/clang/0043-LoopUnroll-=
Iterate-exit-fold-candidates-in-determini.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0004-Backport-com=
mits-from-rust-Fix-selftest-llvm23.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0005-rustc_codege=
n_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/pango/pango/0001-meson-don-t=
-error-on-clang-s-unused-but-set-global.patch<br>
=C2=A0rename meta/recipes-graphics/spir/{<a href=3D"http://spirv-llvm-trans=
lator_22.1.5.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator=
_22.1.5.bb</a> =3D&gt;
<a href=3D"http://spirv-llvm-translator_23.1.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">
spirv-llvm-translator_23.1.0.bb</a>} (87%)<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote>
</div>
</div>
<br>
<fieldset></fieldset>
<pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#244697): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/244697" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/244697</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120998127/896=
8818" target=3D"_blank">https://lists.openembedded.org/mt/120998127/8968818=
</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core=
/unsub</a> [<a href=3D"mailto:SunilKumar.Dora@windriver.com" target=3D"_bla=
nk">SunilKumar.Dora@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
</blockquote>
<p><br>
</p>
</div>

</blockquote></div></div>
</blockquote></div>

--000000000000f54692065a9cc4dd--

