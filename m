Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20441C61DB9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 19:53:08 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15213.1788119578541888631
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 12:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LAd8r36b;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-836c8bde2dcso27006577b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788119577; cv=none;
        d=google.com; s=arc-20260327;
        b=suHz7lFweSnP8CvzDbpnaoRykyCzWDDxUZKTBZbIx8NRlLEvyD8Z3RsVWrhsVZb+OJ
         AGTR3Fe9NisS8d5Azn/b2F/iD2+gBLfj+0gvtbqxkUG5W2TDFGm68wNfm2IWGJPXlMPz
         A2Rkw2IUIzLg5hbr4X5ynCBsvLqIZPY01e5AfiQCN1vXNEvEjTcvHu3PmKuQ//htmSA5
         hFalUkbNs+cVolP5BO89UoeIceURTvU+hlvv1DVwyIVV5gSQgZfoBkM33EJEb5tUDqrz
         9ZPZ9PFhkerEzFQg0sBzpe0ZzD2I6+7P+Snp1W+DHsx8BVJqJxIB0LmOJ9GL6fjzdql2
         jXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tN3KAxKFnRSwSinY8Ef/2t/dnndEnlya5HlGmkJJFr8=;
        fh=XdtWSdxUWXiIQqTL/jS3pXJKAtdooZTh4SlEz3R75PA=;
        b=s9UCj/0Rh4Jd1luN2dHM2qqLHa+ee0Mo/ChTPrLZh/TYK5UlMcUJouizBO5ZVOfRNK
         8h+RvS4WdD1hSEhtRZaB44/r6I2IuAaFCDx/+zh2WxnssTGLiFpFWGMjsRpsha62kqpU
         yym2fKCEQzNfVKtG1KsodBakRuQQHbNY5pv2PPLnnPEzzot++OCqblqq1WfF2WGQpHWa
         XyalFxtGucfHXWuW6Et9WgEBkADmahtmnfSBdBh0G2MI8/S/es0gi9n9B00iF4/2A6Hs
         qGcn7g7VMQImcDFrsZHz8hyjsv7nVEk5wBf7TqgdbQjMIWkUsoC4VfMYUDOupy1iiPgx
         Gslg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788119577; x=1788724377; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tN3KAxKFnRSwSinY8Ef/2t/dnndEnlya5HlGmkJJFr8=;
        b=LAd8r36b2T+hlm3c6YIeq7CGooVCPtASxJkHtwKEH0wGT+7ROpUnVk6EuDuHgxkXQi
         Gb7VSbzaFwrHEKBhpQT25obhqWuovDClfS9UuAVy6rzQOUUedyXP8rrAeNatY8IMmyxs
         gYhGSexBT3UX4X2NLtU38d0TLw5pt1x73p2KVwY+xxanKGMigqXqZSzYV9kmnTUGGxMl
         fL+FxwGT3mooQgAC+o5UVZY8x0XkmJ0mq23grOc6yDB5z7wO5mK/52rS/eVxUUF2gsJt
         Mg/oALiJzG9umYQLv8C49Mal0gbWbyg1A8OYP6h1QaqsqGDl3/PnrbK2wrdNFbH11qtN
         iziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788119577; x=1788724377;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tN3KAxKFnRSwSinY8Ef/2t/dnndEnlya5HlGmkJJFr8=;
        b=Wy043eCxxY7EAEK+kzoYBH7vXrvFfPg1gc8gnHsEY3Zb6ahlZA4wl7wZuG6aAvM8Mr
         9gRP+g+pduDUAUQllhDM+qQoHwR8e02uRxrTOSZOgTs75R7DLl+a0/SUxU9Ia5WNUozn
         J1NjExmI9Rr7WkOP69OFIt+SBUA1phH5d8YdF+q4bisX4bN3AhtQYuqPYBK+B/zY0n/m
         NlF2JSa8pXqJ+tynWJTfMkKq0aK7bwGGY8ofYH2PJZwpWuXIPLfVFdIsAJ/L9yOv3aXn
         VS3IFOH8jcWEt5W9re8SxTRG9jM/OD1bRnbNFGLBQf5AD4B4jSDZiDOf7I6vSYA5CIhL
         DZCg==
X-Gm-Message-State: AFuF++ma5MByEuNwS3k3eYr+mq9nA5ZMw4l3mxexkhz7TvX4OlXeb/1N
	qS9Q0On/Iz7NoScD4FodjUaFf6sidNwRtb0tEp2EvhtC4ef1ugh/sYjkAEgL64gPmK6nSHUDpKg
	xoxxU3IrdlwqGuvWzCLd+b7iS5Xf2l2o=
X-Gm-Gg: AYBFou0Tjq0rWyQFSzwbau6dcPxd6dMd4tkrl//AEB8AR135qwFz///iLlC4TtIr5j9
	nva2yMHmSExaw+yWxh2bLF2QlpVxF3pmCNVBIiOVEW8qRDPvpbyyKuqXh/jfrGL/VN7/wKdC2Ty
	wXjCQoQafAEeMSEXnQpxLH8pkbMJJ4tMjGyXojrmXRuqJOGf3ZfsYGnWkX4+nvIsUsRwkndOn4z
	FUyrjzN6MXD34OaIKbV9QiHBCOGf+zIY6vhBFvhh5uMO/h72u9CBwgQ79sG3VlWodMfizMQrSAP
	fBymmqu9qdXBomd7BSB6n8NeZbLdPjUw+b+iT+Ao0ZV6tcmqOkLj8HullT0Ig1aAhqGfcxmtZDQ
	uIv+K2BzR5V7Chv3Aa/sWk5yaCWCOz+brTU0UUfwaiEzRfPiHkYAdmrvLNGn1LSUaRTjENWXqDU
	A5b1mQsEyu7ZAf82QibHDp/Ep5ZPz6yks2Tuawq1zJVAbBfkjGWunb4jHI4xzWE/tThBhmU8MnK
	+M6nRhMUdhRbA==
X-Received: by 2002:a05:690c:87:b0:833:968e:c223 with SMTP id
 00721157ae682-85d6b2758e4mr73677727b3.21.1788119572725; Sun, 30 Aug 2026
 12:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com> <20260830125853.1139807-2-sunilkumar.dora@windriver.com>
In-Reply-To: <20260830125853.1139807-2-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Aug 2026 12:53:00 -0700
X-Gm-Features: AcwNN1Vj6JC1Vpoveao7P41sj2xcBOXjqXbajj1u5ZkU871vY7F_HUvCfpaF_qM
Message-ID: <CAMKF1spyZRNJjCNYg0UgqhVkoeRs5MBfBVfhqKdmFpcmBtgK9Q@mail.gmail.com>
Subject: Re: [PATCH 01/11] clang/llvm: Upgrade to 23.1.0 release
To: sunilkumar.dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Content-Type: multipart/alternative; boundary="000000000000f2ca75065a4907cf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 19:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244696

--000000000000f2ca75065a4907cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 5:59=E2=80=AFAM <sunilkumar.dora@windriver.com> wro=
te:

> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> Rebase the OE patch stack from 22.1.8 onto the 23.x release branch.
>
> Dropped, the fix is already in 23.1.0:
>   compiler-rt: do not use backtrace APIs on non-glibc linux
>     https://github.com/llvm/llvm-project/commit/252ad2052409
>   Rename UNUSED and UNKNOWN elements of OffloadArch enum
>     https://github.com/llvm/llvm-project/commit/82f18b02d9fe
>   libcxxabi: declare __gnu_unwind_frame in cxa_personality
>     https://github.com/llvm/llvm-project/commit/8119f1854948
>   LoopUnroll: iterate exit fold candidates in deterministic order
>     https://github.com/llvm/llvm-project/commit/965f9d87adb0
>   Prevent revisiting block when searching for noreturn
>     https://github.com/llvm/llvm-project/commit/330b40e11fd2
>
> Dropped, obsolete:
>   libcxxabi: find libunwind headers when LIBCXXABI_LIBUNWIND_INCLUDES
>     (cmake's find_path now searches the user-supplied path first)
>   compiler-rt: support a new embedded linux target
>     (only added files for the long-removed Makefile build system)
>
> Reworked for the TripleName.def triple string tables added in 23:
>   llvm/clang: insert anchor for adding OE distro vendor
>   clang/llvm: add OE specific ABI triple for N32 ABI
>
> Reworked for the restructured powerpc source lists in compiler-rt:
>   compiler-rt: enable __int128 for ppc32
>
> Newly carried, already merged in LLVM main:
>   libc: disable float16 on 32-bit x86 without SSE2
>     https://github.com/llvm/llvm-project/commit/05da143c63d3
>
> GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 without SSE2,
> so the llvm-libc float16 headers that APFloat.cpp now includes fail
> to build for 32-bit x86 multilib ("SSE register return with SSE2
> disabled") without that last patch.
>
> Release notes: https://releases.llvm.org/23.1.0/docs/ReleaseNotes.html
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   2 +-
>  ...ify-cross-compilation.-Don-t-use-na.patch} |   6 +-
>  ...ibunwind-headers-when-LIBCXXABI_LIBU.patch |  60 ----
>  ...-support-a-new-embedded-linux-target.patch | 309 ------------------
>  ...env-override-of-exe-and-libdir-path.patch} |   4 +-
>  ...-driver-Check-sysroot-for-ldso-path.patch} |  14 +-
>  ...ools.cpp-Add-lssp_nonshared-on-musl.patch} |   6 +-
>  ...5-clang-Prepend-trailing-to-sysroot.patch} |  10 +-
>  ...fine-releative-gcc-installation-dir.patch} |  10 +-
>  ...d-and-ldl-along-with-lunwind-for-st.patch} |  10 +-
>  ...-Check-for-atomic-double-intrinsics.patch} |   4 +-
>  ...ure-for-packages-using-find_package.patch} |  20 +-
>  ...e-dir-location-for-cross-toolchains.patch} |   4 +-
>  ...dyld-prefix-when-checking-sysroot-f.patch} |  18 +-
>  ...clang-Use-python3-in-python-scripts.patch} |   6 +-
>  ...-anchor-for-adding-OE-distro-vendor.patch} |  37 +--
>  ...ple-for-non-debian-multiarch-linux-.patch} |   9 +-
>  ...ibunwind-Added-unw_backtrace-method.patch} |   8 +-
>  ...016-lldb-Link-with-libatomic-on-x86.patch} |   4 +-
>  ...ot-use-backtrace-APIs-on-non-glibc-l.patch |  68 ----
>  ...mpiler-rt-Enable-__int128-for-ppc32.patch} |  26 +-
>  ...t-use-cmake-infra-to-detect-libzstd.patch} |   8 +-
>  ...-Fix-stat-struct-s-size-for-O32-ABI.patch} |   6 +-
>  ...cpp-ARMLibDirs-search-also-in-lib32.patch} |  10 +-
>  ...-OE-specific-ABI-triple-for-N32-ABI.patch} |  63 ++--
>  ...nwind.pc.in-and-llvm-config-scripts.patch} |  12 +-
>  ...pect-LLVM_LIBDIR_SUFFIX-like-other-.patch} |  17 +-
>  ...o-not-pass-target-to-clang-compiler.patch} |   4 +-
>  ...-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
>  ...ve-LLVM_LDFLAGS-from-ldflags-output.patch} |   4 +-
>  ...de-sync_fetch_and_-for-any-pre-ARMv.patch} |   6 +-
>  ...de-uptr-sptr-typedefs-on-Mips-Linux.patch} |   8 +-
>  ...-headers-in-the-debug-info-when-bui.patch} |   6 +-
>  ..._HAVE_OPT_VIEWER_MODULES-externally.patch} |   6 +-
>  ...ang-tblgen-if-it-is-actually-needed.patch} |   8 +-
>  ...ymlink-path-for-libcc-when-LLVM_ENA.patch} |   8 +-
>  ...ix-sysroot-based-compiler-rt-search.patch} |  15 +-
>  ...> 0034-guard-clang-tools-extra-test.patch} |  47 ++-
>  ...ng-block-when-searching-for-noreturn.patch |  41 ---
>  ...e-float16-on-32-bit-x86-without-SSE2.patch |  36 ++
>  ...UNKNOWN-elements-of-OffloadArch-enum.patch | 274 ----------------
>  ...e-__gnu_unwind_frame-in-cxa_personal.patch |  33 --
>  ...te-exit-fold-candidates-in-determini.patch |  71 ----
>  meta/recipes-devtools/clang/common-clang.inc  |   4 +-
>  meta/recipes-devtools/clang/common.inc        |  78 ++---
>  45 files changed, 302 insertions(+), 1102 deletions(-)
>  rename
> meta/recipes-devtools/clang/clang/{0003-compiler-rt-Simplify-cross-compil=
ation.-Don-t-use-na.patch
> =3D> 0001-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch} (90=
%)
>  delete mode 100644
> meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-w=
hen-LIBCXXABI_LIBU.patch
>  delete mode 100644
> meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded=
-linux-target.patch
>  rename
> meta/recipes-devtools/clang/clang/{0004-llvm-allow-env-override-of-exe-an=
d-libdir-path.patch
> =3D> 0002-llvm-allow-env-override-of-exe-and-libdir-path.patch} (96%)
>  rename
> meta/recipes-devtools/clang/clang/{0005-clang-driver-Check-sysroot-for-ld=
so-path.patch
> =3D> 0003-clang-driver-Check-sysroot-for-ldso-path.patch} (87%)
>  rename
> meta/recipes-devtools/clang/clang/{0006-clang-Driver-tools.cpp-Add-lssp_n=
onshared-on-musl.patch
> =3D> 0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch} (86%)
>  rename
> meta/recipes-devtools/clang/clang/{0007-clang-Prepend-trailing-to-sysroot=
.patch
> =3D> 0005-clang-Prepend-trailing-to-sysroot.patch} (81%)
>  rename
> meta/recipes-devtools/clang/clang/{0009-clang-Define-releative-gcc-instal=
lation-dir.patch
> =3D> 0006-clang-Define-releative-gcc-installation-dir.patch} (94%)
>  rename
> meta/recipes-devtools/clang/clang/{0010-clang-Add-lpthread-and-ldl-along-=
with-lunwind-for-st.patch
> =3D> 0007-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch} (86=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0011-Check-for-atomic-double-intrinsic=
s.patch
> =3D> 0008-Check-for-atomic-double-intrinsics.patch} (91%)
>  rename
> meta/recipes-devtools/clang/clang/{0012-cmake-Fix-configure-for-packages-=
using-find_package.patch
> =3D> 0009-cmake-Fix-configure-for-packages-using-find_package.patch} (89%=
)
>  rename
> meta/recipes-devtools/clang/clang/{0013-clang-Fix-resource-dir-location-f=
or-cross-toolchains.patch
> =3D> 0010-clang-Fix-resource-dir-location-for-cross-toolchains.patch} (95=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0014-clang-driver-Add-dyld-prefix-when=
-checking-sysroot-f.patch
> =3D> 0011-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch} (88=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0015-clang-Use-python3-in-python-scrip=
ts.patch
> =3D> 0012-clang-Use-python3-in-python-scripts.patch} (90%)
>  rename
> meta/recipes-devtools/clang/clang/{0016-llvm-clang-Insert-anchor-for-addi=
ng-OE-distro-vendor.patch
> =3D> 0013-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch} (91=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0018-clang-Fix-x86-triple-for-non-debi=
an-multiarch-linux-.patch
> =3D> 0014-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch} (86=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0019-libunwind-Added-unw_backtrace-met=
hod.patch
> =3D> 0015-libunwind-Added-unw_backtrace-method.patch} (89%)
>  rename
> meta/recipes-devtools/clang/clang/{0020-lldb-Link-with-libatomic-on-x86.p=
atch
> =3D> 0016-lldb-Link-with-libatomic-on-x86.patch} (92%)
>  delete mode 100644
> meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtrace-A=
PIs-on-non-glibc-l.patch
>  rename
> meta/recipes-devtools/clang/clang/{0021-compiler-rt-Enable-__int128-for-p=
pc32.patch
> =3D> 0017-compiler-rt-Enable-__int128-for-ppc32.patch} (77%)
>  rename
> meta/recipes-devtools/clang/clang/{0022-llvm-Do-not-use-cmake-infra-to-de=
tect-libzstd.patch
> =3D> 0018-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch} (91%)
>  rename
> meta/recipes-devtools/clang/clang/{0023-compiler-rt-Fix-stat-struct-s-siz=
e-for-O32-ABI.patch
> =3D> 0019-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch} (91%)
>  rename
> meta/recipes-devtools/clang/clang/{0024-ToolChains-Gnu.cpp-ARMLibDirs-sea=
rch-also-in-lib32.patch
> =3D> 0020-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch} (98%)
>  rename
> meta/recipes-devtools/clang/clang/{0025-clang-llvm-Add-OE-specific-ABI-tr=
iple-for-N32-ABI.patch
> =3D> 0021-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch} (60%)
>  rename
> meta/recipes-devtools/clang/clang/{0026-llvm-Add-libunwind.pc.in-and-llvm=
-config-scripts.patch
> =3D> 0022-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch} (84%)
>  rename
> meta/recipes-devtools/clang/clang/{0027-scan-build-py-respect-LLVM_LIBDIR=
_SUFFIX-like-other-.patch
> =3D> 0023-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch} (90=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0028-compiler-rt-Do-not-pass-target-to=
-clang-compiler.patch
> =3D> 0024-compiler-rt-Do-not-pass-target-to-clang-compiler.patch} (91%)
>  rename
> meta/recipes-devtools/clang/clang/{0029-AsmMatcherEmitter-sort-ClassInfo-=
lists-by-name-as-we.patch
> =3D> 0025-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch} (92=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0030-llvm-config-remove-LLVM_LDFLAGS-f=
rom-ldflags-output.patch
> =3D> 0026-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch} (92%=
)
>  rename
> meta/recipes-devtools/clang/clang/{0031-compiler-rt-Exclude-sync_fetch_an=
d_-for-any-pre-ARMv.patch
> =3D> 0027-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch} (95=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0032-compiler-rt-Hardcode-uptr-sptr-ty=
pedefs-on-Mips-Linu.patch
> =3D> 0028-Hardcode-uptr-sptr-typedefs-on-Mips-Linux.patch} (86%)
>  rename
> meta/recipes-devtools/clang/clang/{0034-Revert-libc-Remap-headers-in-the-=
debug-info-when-bui.patch
> =3D> 0029-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch} (89=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER=
_MODULES-externally.patch
> =3D> 0030-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch} (86=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0037-clang-Only-build-clang-tblgen-if-=
it-is-actually-need.patch
> =3D> 0031-Only-build-clang-tblgen-if-it-is-actually-needed.patch} (81%)
>  rename
> meta/recipes-devtools/clang/clang/{0038-llvm-libgcc-Fix-symlink-path-for-=
libcc-when-LLVM_ENA.patch
> =3D> 0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch} (93=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0041-Consolidate-and-fix-sysroot-based=
-compiler-rt-search.patch
> =3D> 0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch} (91=
%)
>  rename
> meta/recipes-devtools/clang/clang/{0042-guard-clang-tools-extra-test.patc=
h
> =3D> 0034-guard-clang-tools-extra-test.patch} (83%)
>  delete mode 100644
> meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-sear=
ching-for-noreturn.patch
>  create mode 100644
> meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86=
-without-SSE2.patch
>  delete mode 100644
> meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elements=
-of-OffloadArch-enum.patch
>  delete mode 100644
> meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_fra=
me-in-cxa_personal.patch
>  delete mode 100644
> meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit-fold-candi=
dates-in-determini.patch
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 2966cddc05..dde6821718 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce
> Ashfield <bruce.ashfield@gmail.co
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-22.1.8 =3D "Khem Raj <
> raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-23.1.0 =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org
> >"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git
> a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compi=
lation.-Don-t-use-na.patch
> b/meta/recipes-devtools/clang/clang/0001-compiler-rt-Simplify-cross-compi=
lation.-Don-t-use-na.patch
> similarity index 90%
> rename from
> meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compila=
tion.-Don-t-use-na.patch
> rename to
> meta/recipes-devtools/clang/clang/0001-compiler-rt-Simplify-cross-compila=
tion.-Don-t-use-na.patch
> index 896bbd11aa..4684fff493 100644
> ---
> a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compi=
lation.-Don-t-use-na.patch
> +++
> b/meta/recipes-devtools/clang/clang/0001-compiler-rt-Simplify-cross-compi=
lation.-Don-t-use-na.patch
> @@ -1,4 +1,4 @@
> -From 16b03fccab20cac13065ab99f36a7f0a77a62b92 Mon Sep 17 00:00:00 2001
> +From 09798ecb4d4c7f1372e7538666bf9c5199f7ab04 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 19 May 2016 23:11:45 -0700
>  Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
> @@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
>  diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt
> -index a92258ae1244..98c4e9a681d5 100644
> +index d720b86..60ac56f 100644
>  --- a/compiler-rt/CMakeLists.txt
>  +++ b/compiler-rt/CMakeLists.txt
> -@@ -109,7 +109,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
> +@@ -125,7 +125,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
>     set(CMAKE_CXX_EXTENSIONS NO)
>
>     if (NOT LLVM_RUNTIMES_BUILD)
> diff --git
> a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-when-LIBCXXABI_LIBU.patch
> b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-when-LIBCXXABI_LIBU.patch
> deleted file mode 100644
> index 43221274bf..0000000000
> ---
> a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-when-LIBCXXABI_LIBU.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 97247b6a1df63a5f930d090a3952876eb67cf6fb Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 27 Aug 2017 10:37:49 -0700
> -Subject: [PATCH] libcxxabi: Find libunwind headers when
> - LIBCXXABI_LIBUNWIND_INCLUDES is set
> -
> -Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake arguments
> -then it ends up not searching the specified dir and unwind.h is not foun=
d
> -especially for ARM targets
> -
> -This patch makes the searching synthesized directories and then set
> -LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libcxxabi/CMakeLists.txt | 15 ++++++++++-----
> - 1 file changed, 10 insertions(+), 5 deletions(-)
> -
> -diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
> -index 2b67c5972339..45d84b404b30 100644
> ---- a/libcxxabi/CMakeLists.txt
> -+++ b/libcxxabi/CMakeLists.txt
> -@@ -476,7 +476,7 @@ set(LIBCXXABI_LIBUNWIND_PATH
> "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
> -     "Specify path to libunwind source." FORCE)
> -
> - if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
> --  find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwind.h
> -+  find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h
> -     PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}
> -           ${LIBCXXABI_LIBUNWIND_PATH}/include
> -           ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBUNWIND_INCLUDES}
> -@@ -487,18 +487,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARC=
H
> MATCHES ARM)
> -     NO_CMAKE_FIND_ROOT_PATH
> -   )
> -
> --  if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL
> "LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL-NOTFOUND")
> --    set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL "")
> -+  if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL
> "LIBCXXABI_LIBUNWIND_INCLUDES-NOTFOUND")
> -+    set(LIBCXXABI_LIBUNWIND_INCLUDES "")
> -   endif()
> - endif()
> -
> --if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}" STREQUAL "")
> --  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}")
> -+if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES}" STREQUAL "")
> -+  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES}")
> - endif()
> -
> - add_custom_target(cxxabi-test-depends
> -   COMMENT "Build dependencies required to run the libc++abi test suite.=
")
> -
> -+set(LIBCXXABI_LIBUNWIND_INCLUDES "${LIBCXXABI_LIBUNWIND_INCLUDES}" CACH=
E
> PATH
> -+    "Specify path to libunwind includes." FORCE)
> -+set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
> -+    "Specify path to libunwind source." FORCE)
> -+
> - # Add source code. This also contains all of the logic for deciding
> linker flags
> - # soname, etc...
> - add_subdirectory(include)
> diff --git
> a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedd=
ed-linux-target.patch
> b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedd=
ed-linux-target.patch
> deleted file mode 100644
> index 5dcad6b0df..0000000000
> ---
> a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedd=
ed-linux-target.patch
> +++ /dev/null
> @@ -1,309 +0,0 @@
> -From eae63772aacba29de729d9af5c52542cd8a043ee Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 19 Apr 2015 15:16:23 -0700
> -Subject: [PATCH] compiler-rt: support a new embedded linux target
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - .../make/platform/clang_linux_embedded.mk     | 286 ++++++++++++++++++
> - .../clang_linux_embedded_test_input.c         |   0
> - 2 files changed, 286 insertions(+)
> - create mode 100644 compiler-rt/make/platform/clang_linux_embedded.mk
> - create mode 100644
> compiler-rt/make/platform/clang_linux_embedded_test_input.c
> -
> -diff --git a/compiler-rt/make/platform/clang_linux_embedded.mk
> b/compiler-rt/make/platform/clang_linux_embedded.mk
> -new file mode 100644
> -index 000000000000..d0a890075a1c
> ---- /dev/null
> -+++ b/compiler-rt/make/platform/clang_linux_embedded.mk
> -@@ -0,0 +1,286 @@
> -+# These are the functions which clang needs when it is targeting a
> previous
> -+# version of the OS. The issue is that the backend may use functions
> which were
> -+# not present in the libgcc that shipped on the platform. In such cases=
,
> we link
> -+# with a version of the library which contains private_extern
> definitions of all
> -+# the extra functions which might be referenced.
> -+
> -+Description :=3D Static runtime libraries for embedded clang/Linux
> -+
> -+# A function that ensures we don't try to build for architectures that =
we
> -+# don't have working toolchains for.
> -+CheckArches =3D \
> -+  $(shell \
> -+    result=3D""; \
> -+    for arch in $(1); do \
> -+      if $(CC) -arch $$arch -c \
> -+        -integrated-as \
> -+        $(ProjSrcRoot)/make/platform/clang_linux_embedded_test_input.c =
\
> -+        -o /dev/null > /dev/null 2> /dev/null; then \
> -+        result=3D"$$result$$arch "; \
> -+      else \
> -+      printf 1>&2 \
> -+        "warning: clang_linux_embedded.mk: dropping arch '$$arch' from
> lib '$(2)'\n"; \
> -+      fi; \
> -+    done; \
> -+    echo $$result)
> -+
> -+XCRun =3D \
> -+  $(shell \
> -+    result=3D`xcrun -find $(1) 2> /dev/null`; \
> -+    if [ "$$?" !=3D "0" ]; then result=3D$(1); fi; \
> -+    echo $$result)
> -+
> -+###
> -+
> -+CC       :=3D $(call XCRun,clang)
> -+AR       :=3D $(call XCRun,ar)
> -+RANLIB   :=3D $(call XCRun,ranlib)
> -+STRIP    :=3D $(call XCRun,strip)
> -+LIPO     :=3D $(call XCRun,lipo)
> -+DSYMUTIL :=3D $(call XCRun,dsymutil)
> -+Configs :=3D
> -+UniversalArchs :=3D
> -+
> -+# Soft-float version of the runtime. No floating-point instructions wil=
l
> be used
> -+# and the ABI (out of necessity) passes floating values in normal
> registers:
> -+# non-VFP variant of the AAPCS.
> -+UniversalArchs.soft_static :=3D $(call CheckArches,arm armv7m armv7em
> armv7,soft_static)
> -+Configs +=3D $(if $(UniversalArchs.soft_static),soft_static)
> -+
> -+# Hard-float version of the runtime. On ARM VFP instructions and
> registers are
> -+# allowed, and floating point values get passed in them. VFP variant of
> the
> -+# AAPCS.
> -+UniversalArchs.hard_static :=3D $(call CheckArches,armv7em armv7 i386
> x86_64,hard_static)
> -+Configs +=3D $(if $(UniversalArchs.hard_static),hard_static)
> -+
> -+UniversalArchs.soft_pic :=3D $(call CheckArches,armv6m armv7m armv7em
> armv7,soft_pic)
> -+Configs +=3D $(if $(UniversalArchs.soft_pic),soft_pic)
> -+
> -+UniversalArchs.hard_pic :=3D $(call CheckArches,armv7em armv7 i386
> x86_64,hard_pic)
> -+Configs +=3D $(if $(UniversalArchs.hard_pic),hard_pic)
> -+
> -+CFLAGS :=3D -Wall -Werror -Oz -fomit-frame-pointer -ffreestanding
> -+
> -+PIC_CFLAGS :=3D -fPIC
> -+STATIC_CFLAGS :=3D -static
> -+
> -+CFLAGS_SOFT :=3D -mfloat-abi=3Dsoft
> -+CFLAGS_HARD :=3D -mfloat-abi=3Dhard
> -+
> -+CFLAGS_I386  :=3D -march=3Dpentium
> -+
> -+CFLAGS.soft_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOFT)
> -+CFLAGS.hard_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HARD)
> -+CFLAGS.soft_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_SOFT)
> -+CFLAGS.hard_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_HARD)
> -+
> -+CFLAGS.soft_static.armv7 :=3D $(CFLAGS.soft_static) $(CFLAGS_ARMV7)
> -+CFLAGS.hard_static.armv7 :=3D $(CFLAGS.hard_static) $(CFLAGS_ARMV7)
> -+CFLAGS.soft_pic.armv7    :=3D $(CFLAGS.soft_pic) $(CFLAGS_ARMV7)
> -+CFLAGS.hard_pic.armv7    :=3D $(CFLAGS.hard_pic) $(CFLAGS_ARMV7)
> -+
> -+# x86 platforms ignore -mfloat-abi options and complain about doing so.
> Despite
> -+# this they're hard-float.
> -+CFLAGS.hard_static.i386   :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_I386=
)
> -+CFLAGS.hard_pic.i386      :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_I386)
> -+CFLAGS.hard_static.x86_64 :=3D $(CFLAGS) $(STATIC_CFLAGS)
> -+CFLAGS.hard_pic.x86_64    :=3D $(CFLAGS) $(PIC_CFLAGS)
> -+
> -+# Functions not wanted:
> -+#   + eprintf is obsolete anyway
> -+#   + *vfp: designed for Thumb1 CPUs with VFPv2
> -+
> -+COMMON_FUNCTIONS :=3D \
> -+      absvdi2 \
> -+      absvsi2 \
> -+      addvdi3 \
> -+      addvsi3 \
> -+      ashldi3 \
> -+      ashrdi3 \
> -+      bswapdi2 \
> -+      bswapsi2 \
> -+      clzdi2 \
> -+      clzsi2 \
> -+      cmpdi2 \
> -+      ctzdi2 \
> -+      ctzsi2 \
> -+      divdc3 \
> -+      divdi3 \
> -+      divsc3 \
> -+      divmodsi4 \
> -+      udivmodsi4 \
> -+      do_global_dtors \
> -+      ffsdi2 \
> -+      fixdfdi \
> -+      fixsfdi \
> -+      fixunsdfdi \
> -+      fixunsdfsi \
> -+      fixunssfdi \
> -+      fixunssfsi \
> -+      floatdidf \
> -+      floatdisf \
> -+      floatundidf \
> -+      floatundisf \
> -+      gcc_bcmp \
> -+      lshrdi3 \
> -+      moddi3 \
> -+      muldc3 \
> -+      muldi3 \
> -+      mulsc3 \
> -+      mulvdi3 \
> -+      mulvsi3 \
> -+      negdi2 \
> -+      negvdi2 \
> -+      negvsi2 \
> -+      paritydi2 \
> -+      paritysi2 \
> -+      popcountdi2 \
> -+      popcountsi2 \
> -+      powidf2 \
> -+      powisf2 \
> -+      subvdi3 \
> -+      subvsi3 \
> -+      ucmpdi2 \
> -+      udiv_w_sdiv \
> -+      udivdi3 \
> -+      udivmoddi4 \
> -+      umoddi3 \
> -+      adddf3 \
> -+      addsf3 \
> -+      cmpdf2 \
> -+      cmpsf2 \
> -+      div0 \
> -+      divdf3 \
> -+      divsf3 \
> -+      divsi3 \
> -+      extendsfdf2 \
> -+      ffssi2 \
> -+      fixdfsi \
> -+      fixsfsi \
> -+      floatsidf \
> -+      floatsisf \
> -+      floatunsidf \
> -+      floatunsisf \
> -+      comparedf2 \
> -+      comparesf2 \
> -+      modsi3 \
> -+      muldf3 \
> -+      mulsf3 \
> -+      negdf2 \
> -+      negsf2 \
> -+      subdf3 \
> -+      subsf3 \
> -+      truncdfsf2 \
> -+      udivsi3 \
> -+      umodsi3 \
> -+      unorddf2 \
> -+      unordsf2
> -+
> -+ARM_FUNCTIONS :=3D \
> -+      aeabi_cdcmpeq \
> -+      aeabi_cdrcmple \
> -+      aeabi_cfcmpeq \
> -+      aeabi_cfrcmple \
> -+      aeabi_dcmpeq \
> -+      aeabi_dcmpge \
> -+      aeabi_dcmpgt \
> -+      aeabi_dcmple \
> -+      aeabi_dcmplt \
> -+      aeabi_drsub \
> -+      aeabi_fcmpeq \
> -+      aeabi_fcmpge \
> -+      aeabi_fcmpgt \
> -+      aeabi_fcmple \
> -+      aeabi_fcmplt \
> -+      aeabi_frsub \
> -+      aeabi_idivmod \
> -+      aeabi_uidivmod \
> -+
> -+# ARM Assembly implementation which requires Thumb2 (i.e. won't work on
> v6M).
> -+THUMB2_FUNCTIONS :=3D \
> -+      switch16 \
> -+      switch32 \
> -+      switch8 \
> -+      switchu8 \
> -+      sync_fetch_and_add_4 \
> -+      sync_fetch_and_sub_4 \
> -+      sync_fetch_and_and_4 \
> -+      sync_fetch_and_or_4 \
> -+      sync_fetch_and_xor_4 \
> -+      sync_fetch_and_nand_4 \
> -+      sync_fetch_and_max_4 \
> -+      sync_fetch_and_umax_4 \
> -+      sync_fetch_and_min_4 \
> -+      sync_fetch_and_umin_4 \
> -+      sync_fetch_and_add_8 \
> -+      sync_fetch_and_sub_8 \
> -+      sync_fetch_and_and_8 \
> -+      sync_fetch_and_or_8 \
> -+      sync_fetch_and_xor_8 \
> -+      sync_fetch_and_nand_8 \
> -+      sync_fetch_and_max_8 \
> -+      sync_fetch_and_umax_8 \
> -+      sync_fetch_and_min_8 \
> -+      sync_fetch_and_umin_8
> -+
> -+I386_FUNCTIONS :=3D  \
> -+      i686.get_pc_thunk.eax \
> -+      i686.get_pc_thunk.ebp \
> -+      i686.get_pc_thunk.ebx \
> -+      i686.get_pc_thunk.ecx \
> -+      i686.get_pc_thunk.edi \
> -+      i686.get_pc_thunk.edx \
> -+      i686.get_pc_thunk.esi
> -+
> -+# FIXME: Currently, compiler-rt is missing implementations for a number
> of the
> -+# functions. Filter them out for now.
> -+MISSING_FUNCTIONS :=3D \
> -+      cmpdf2 cmpsf2 div0 \
> -+      ffssi2 \
> -+      udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \
> -+      bswapsi2 \
> -+      gcc_bcmp \
> -+      do_global_dtors \
> -+      i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get_pc_thunk.ebx=
 \
> -+      i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get_pc_thunk.edx=
 \
> -+      i686.get_pc_thunk.esi \
> -+      aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfrcmple
> aeabi_dcmpeq \
> -+      aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt aeabi_drsub \
> -+      aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmple aeabi_fcmpl=
t
> \
> -+      aeabi_frsub aeabi_idivmod aeabi_uidivmod
> -+
> -+FUNCTIONS_ARMV6M  :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
> -+FUNCTIONS_ARM_ALL :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
> $(THUMB2_FUNCTIONS)
> -+FUNCTIONS_I386    :=3D $(COMMON_FUNCTIONS) $(I386_FUNCTIONS)
> -+FUNCTIONS_X86_64  :=3D $(COMMON_FUNCTIONS)
> -+
> -+FUNCTIONS_ARMV6M :=3D \
> -+      $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M))
> -+FUNCTIONS_ARM_ALL :=3D \
> -+      $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_ALL))
> -+FUNCTIONS_I386 :=3D \
> -+      $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))
> -+FUNCTIONS_X86_64 :=3D \
> -+      $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64))
> -+
> -+FUNCTIONS.soft_static.armv6m :=3D $(FUNCTIONS_ARMV6M)
> -+FUNCTIONS.soft_pic.armv6m    :=3D $(FUNCTIONS_ARMV6M)
> -+
> -+FUNCTIONS.soft_static.armv7m :=3D $(FUNCTIONS_ARM_ALL)
> -+FUNCTIONS.soft_pic.armv7m    :=3D $(FUNCTIONS_ARM_ALL)
> -+
> -+FUNCTIONS.soft_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
> -+FUNCTIONS.hard_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
> -+FUNCTIONS.soft_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
> -+FUNCTIONS.hard_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
> -+
> -+FUNCTIONS.soft_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
> -+FUNCTIONS.hard_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
> -+FUNCTIONS.soft_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
> -+FUNCTIONS.hard_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
> -+
> -+FUNCTIONS.hard_static.i386 :=3D $(FUNCTIONS_I386)
> -+FUNCTIONS.hard_pic.i386    :=3D $(FUNCTIONS_I386)
> -+
> -+FUNCTIONS.hard_static.x86_64 :=3D $(FUNCTIONS_X86_64)
> -+FUNCTIONS.hard_pic.x86_64    :=3D $(FUNCTIONS_X86_64)
> -diff --git a/compiler-rt/make/platform/clang_linux_embedded_test_input.c
> b/compiler-rt/make/platform/clang_linux_embedded_test_input.c
> -new file mode 100644
> -index 000000000000..e69de29bb2d1
> diff --git
> a/meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-a=
nd-libdir-path.patch
> b/meta/recipes-devtools/clang/clang/0002-llvm-allow-env-override-of-exe-a=
nd-libdir-path.patch
> similarity index 96%
> rename from
> meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-and=
-libdir-path.patch
> rename to
> meta/recipes-devtools/clang/clang/0002-llvm-allow-env-override-of-exe-and=
-libdir-path.patch
> index 3c7c274693..583718c6ee 100644
> ---
> a/meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-a=
nd-libdir-path.patch
> +++
> b/meta/recipes-devtools/clang/clang/0002-llvm-allow-env-override-of-exe-a=
nd-libdir-path.patch
> @@ -1,4 +1,4 @@
> -From d13464858866ff3c0026294d6842f74a11a0d625 Mon Sep 17 00:00:00 2001
> +From 9aa64eaa942dad120bc6baaf17d6d859049f9de9 Mon Sep 17 00:00:00 2001
>  From: Martin Kelly <mkelly@xevo.com>
>  Date: Fri, 19 May 2017 00:22:57 -0700
>  Subject: [PATCH] llvm: allow env override of exe and libdir path
> @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 19 insertions(+), 6 deletions(-)
>
>  diff --git a/llvm/tools/llvm-config/llvm-config.cpp
> b/llvm/tools/llvm-config/llvm-config.cpp
> -index 24ea264419af..0a3f51ae2b83 100644
> +index 76aa9f8..64795e9 100644
>  --- a/llvm/tools/llvm-config/llvm-config.cpp
>  +++ b/llvm/tools/llvm-config/llvm-config.cpp
>  @@ -248,6 +248,13 @@ Typical components:\n\
> diff --git
> a/meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysroot-for-l=
dso-path.patch
> b/meta/recipes-devtools/clang/clang/0003-clang-driver-Check-sysroot-for-l=
dso-path.patch
> similarity index 87%
> rename from
> meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysroot-for-lds=
o-path.patch
> rename to
> meta/recipes-devtools/clang/clang/0003-clang-driver-Check-sysroot-for-lds=
o-path.patch
> index e4636d30d1..d68dc94b03 100644
> ---
> a/meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysroot-for-l=
dso-path.patch
> +++
> b/meta/recipes-devtools/clang/clang/0003-clang-driver-Check-sysroot-for-l=
dso-path.patch
> @@ -1,4 +1,4 @@
> -From 7a12ad3232dd6881ca40d94277ca8064a12d9df6 Mon Sep 17 00:00:00 2001
> +From 6d26dbc005701acc1dbbd9e05e8596328a7d58f1 Mon Sep 17 00:00:00 2001
>  From: Dan McGregor <dan.mcgregor@usask.ca>
>  Date: Wed, 26 Apr 2017 20:29:41 -0600
>  Subject: [PATCH] clang: driver: Check sysroot for ldso path
> @@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 21 insertions(+), 1 deletion(-)
>
>  diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> -index d525b417b4ea..1c31901ade74 100644
> +index 8d30a5e..1958c64 100644
>  --- a/clang/lib/Driver/ToolChains/Linux.cpp
>  +++ b/clang/lib/Driver/ToolChains/Linux.cpp
> -@@ -630,8 +630,12 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> +@@ -645,8 +645,12 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
>           Triple.getEnvironment() =3D=3D llvm::Triple::GNUEABIHFT64 ||
>           tools::arm::getARMFloatABI(*this, Args) =3D=3D
> tools::arm::FloatABI::Hard;
>
> @@ -34,7 +34,7 @@ index d525b417b4ea..1c31901ade74 100644
>       break;
>     }
>     case llvm::Triple::loongarch32: {
> -@@ -685,11 +689,19 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> +@@ -700,11 +704,19 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
>       LibDir =3D "lib64";
>       Loader =3D
>           (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" :
> "ld64.so.1";
> @@ -53,8 +53,8 @@ index d525b417b4ea..1c31901ade74 100644
>  +    }
>       break;
>     case llvm::Triple::riscv32:
> -   case llvm::Triple::riscv64: {
> -@@ -707,6 +719,10 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> +   case llvm::Triple::riscv64:
> +@@ -724,6 +736,10 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
>     case llvm::Triple::sparcv9:
>       LibDir =3D "lib64";
>       Loader =3D "ld-linux.so.2";
> @@ -65,7 +65,7 @@ index d525b417b4ea..1c31901ade74 100644
>       break;
>     case llvm::Triple::systemz:
>       LibDir =3D "lib";
> -@@ -721,6 +737,10 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> +@@ -738,6 +754,10 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
>
>       LibDir =3D X32 ? "libx32" : "lib64";
>       Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
> diff --git
> a/meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> similarity index 86%
> rename from
> meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-Add-lssp_no=
nshared-on-musl.patch
> rename to
> meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_no=
nshared-on-musl.patch
> index 0269dece67..1ba19bb4cd 100644
> ---
> a/meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> +++
> b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> @@ -1,4 +1,4 @@
> -From 19b8ca2e1aa536e7d7f7eb379fc4e4d6f1efd07a Mon Sep 17 00:00:00 2001
> +From 64a5c3e2680fb2a04ecba015af8eb5049c4840e1 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 19 May 2016 21:11:06 -0700
>  Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 6 insertions(+)
>
>  diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp
> b/clang/lib/Driver/ToolChains/Gnu.cpp
> -index cb6a9b242421..8f126474b7d1 100644
> +index 24076d8..a7a64fc 100644
>  --- a/clang/lib/Driver/ToolChains/Gnu.cpp
>  +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> -@@ -539,6 +539,12 @@ void
> tools::gnutools::Linker::ConstructJob(Compilation &C, const JobAction &JA=
,
> +@@ -537,6 +537,12 @@ void
> tools::gnutools::Linker::ConstructJob(Compilation &C, const JobAction &JA=
,
>         if (IsIAMCU)
>           CmdArgs.push_back("-lgloss");
>
> diff --git
> a/meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-to-sysroo=
t.patch
> b/meta/recipes-devtools/clang/clang/0005-clang-Prepend-trailing-to-sysroo=
t.patch
> similarity index 81%
> rename from
> meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-to-sysroot.=
patch
> rename to
> meta/recipes-devtools/clang/clang/0005-clang-Prepend-trailing-to-sysroot.=
patch
> index 321de79c78..0de2208a0f 100644
> ---
> a/meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-to-sysroo=
t.patch
> +++
> b/meta/recipes-devtools/clang/clang/0005-clang-Prepend-trailing-to-sysroo=
t.patch
> @@ -1,4 +1,4 @@
> -From 1746960b385afbc9e8e355a3b7c66b43c946451b Mon Sep 17 00:00:00 2001
> +From e6285791435950771c13b442319efdcd6a21d81e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 16 Mar 2017 09:02:13 -0700
>  Subject: [PATCH] clang: Prepend trailing '/' to sysroot
> @@ -25,12 +25,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> -index 1c31901ade74..f7f096c1ac0a 100644
> +index 1958c64..cb2b227 100644
>  --- a/clang/lib/Driver/ToolChains/Linux.cpp
>  +++ b/clang/lib/Driver/ToolChains/Linux.cpp
> -@@ -235,7 +235,7 @@ Linux::Linux(const Driver &D, const llvm::Triple
> &Triple, const ArgList &Args)
> -   Multilibs =3D GCCInstallation.getMultilibs();
> -   SelectedMultilibs.assign({GCCInstallation.getMultilib()});
> +@@ -238,7 +238,7 @@ Linux::Linux(const Driver &D, const llvm::Triple
> &Triple, const ArgList &Args)
> +   loadMultilibsFromYAML(Args, D);
> +
>     llvm::Triple::ArchType Arch =3D Triple.getArch();
>  -  std::string SysRoot =3D computeSysRoot();
>  +  std::string SysRoot =3D computeSysRoot() + "/";
> diff --git
> a/meta/recipes-devtools/clang/clang/0009-clang-Define-releative-gcc-insta=
llation-dir.patch
> b/meta/recipes-devtools/clang/clang/0006-clang-Define-releative-gcc-insta=
llation-dir.patch
> similarity index 94%
> rename from
> meta/recipes-devtools/clang/clang/0009-clang-Define-releative-gcc-install=
ation-dir.patch
> rename to
> meta/recipes-devtools/clang/clang/0006-clang-Define-releative-gcc-install=
ation-dir.patch
> index 38470e9834..427842a07a 100644
> ---
> a/meta/recipes-devtools/clang/clang/0009-clang-Define-releative-gcc-insta=
llation-dir.patch
> +++
> b/meta/recipes-devtools/clang/clang/0006-clang-Define-releative-gcc-insta=
llation-dir.patch
> @@ -1,4 +1,4 @@
> -From bfba4232621e151cfc5dcb16ce5bf661f8c3d8f8 Mon Sep 17 00:00:00 2001
> +From 04e0958fea64ebc9c89c0a6c147e8806a87727bd Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 20 Mar 2021 16:09:16 -0700
>  Subject: [PATCH] clang: Define / releative gcc installation dir
> @@ -61,7 +61,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 14 insertions(+), 8 deletions(-)
>
>  diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp
> b/clang/lib/Driver/ToolChains/Gnu.cpp
> -index 8f126474b7d1..c80980a7fb09 100644
> +index a7a64fc..f44663f 100644
>  --- a/clang/lib/Driver/ToolChains/Gnu.cpp
>  +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
>  @@ -18,6 +18,7 @@
> @@ -72,7 +72,7 @@ index 8f126474b7d1..c80980a7fb09 100644
>   #include "clang/Driver/Driver.h"
>   #include "clang/Driver/MultilibBuilder.h"
>   #include "clang/Driver/Tool.h"
> -@@ -2847,6 +2848,7 @@ void
> Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
> +@@ -2869,6 +2870,7 @@ void
> Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
>       const llvm::Triple &TargetTriple, const ArgList &Args,
>       const std::string &LibDir, StringRef CandidateTriple,
>       bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCrossDirExists) =
{
> @@ -80,7 +80,7 @@ index 8f126474b7d1..c80980a7fb09 100644
>     // Locations relative to the system lib directory where GCC's
> triple-specific
>     // directories might reside.
>     struct GCCLibSuffix {
> -@@ -2858,19 +2860,20 @@ void
> Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
> +@@ -2880,19 +2882,20 @@ void
> Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
>       // Whether this library suffix is relevant for the triple.
>       bool Active;
>     } Suffixes[] =3D {
> @@ -108,7 +108,7 @@ index 8f126474b7d1..c80980a7fb09 100644
>
>     SmallVector<GCCInstallCandidate, 3> Installations;
>     for (auto &Suffix : Suffixes) {
> -@@ -3273,8 +3276,11 @@ Generic_GCC::addLibCxxIncludePaths(const
> llvm::opt::ArgList &DriverArgs,
> +@@ -3297,8 +3300,11 @@ Generic_GCC::addLibCxxIncludePaths(const
> llvm::opt::ArgList &DriverArgs,
>     // incompatible with the NDK libraries.
>     SmallString<128> DriverIncludeDir(getDriver().Dir);
>     llvm::sys::path::append(DriverIncludeDir, "..", "include");
> diff --git
> a/meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-ldl-along=
-with-lunwind-for-st.patch
> b/meta/recipes-devtools/clang/clang/0007-clang-Add-lpthread-and-ldl-along=
-with-lunwind-for-st.patch
> similarity index 86%
> rename from
> meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-ldl-along-w=
ith-lunwind-for-st.patch
> rename to
> meta/recipes-devtools/clang/clang/0007-clang-Add-lpthread-and-ldl-along-w=
ith-lunwind-for-st.patch
> index b338d0f570..e07f004fb4 100644
> ---
> a/meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-ldl-along=
-with-lunwind-for-st.patch
> +++
> b/meta/recipes-devtools/clang/clang/0007-clang-Add-lpthread-and-ldl-along=
-with-lunwind-for-st.patch
> @@ -1,8 +1,8 @@
> -From 03875620d0172a7c07e3cdc607a6877b06a130e9 Mon Sep 17 00:00:00 2001
> +From f64b2adab7e4c515aa1e082054ad4514898e2d5d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 31 Jul 2019 22:51:39 -0700
> -Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for
> static
> - linking
> +Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for
> + static linking
>
>  When doing static liking with --unwindlib=3Dlibunwind -static we encount=
er
>  undefined symbols
> @@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp
> b/clang/lib/Driver/ToolChains/CommonArgs.cpp
> -index 10a1a412eea0..a217897610c3 100644
> +index 08c0695..362e7ca 100644
>  --- a/clang/lib/Driver/ToolChains/CommonArgs.cpp
>  +++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp
> -@@ -2415,6 +2415,8 @@ static void AddUnwindLibrary(const ToolChain &TC,
> const Driver &D,
> +@@ -2484,6 +2484,8 @@ static void AddUnwindLibrary(const ToolChain &TC,
> const Driver &D,
>           CmdArgs.push_back("-lunwind");
>       } else if (LGT =3D=3D LibGccType::StaticLibGcc) {
>         CmdArgs.push_back("-l:libunwind.a");
> diff --git
> a/meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double-intrinsi=
cs.patch
> b/meta/recipes-devtools/clang/clang/0008-Check-for-atomic-double-intrinsi=
cs.patch
> similarity index 91%
> rename from
> meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double-intrinsics=
.patch
> rename to
> meta/recipes-devtools/clang/clang/0008-Check-for-atomic-double-intrinsics=
.patch
> index ba6a5c1510..c9764c70e9 100644
> ---
> a/meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double-intrinsi=
cs.patch
> +++
> b/meta/recipes-devtools/clang/clang/0008-Check-for-atomic-double-intrinsi=
cs.patch
> @@ -1,4 +1,4 @@
> -From ea4326b11976e48dde6d99605ac24df048cd3b10 Mon Sep 17 00:00:00 2001
> +From a4a94de113dce4cf88c05bf0d5628a902ed93ff3 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 18 Nov 2019 17:00:29 -0800
>  Subject: [PATCH] Check for atomic<double> intrinsics
> @@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/llvm/cmake/modules/CheckAtomic.cmake
> b/llvm/cmake/modules/CheckAtomic.cmake
> -index f11cadf39ff6..80a18a92956a 100644
> +index f11cadf..80a18a9 100644
>  --- a/llvm/cmake/modules/CheckAtomic.cmake
>  +++ b/llvm/cmake/modules/CheckAtomic.cmake
>  @@ -30,10 +30,11 @@ function(check_working_cxx_atomics64 varname)
> diff --git
> a/meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for-packages=
-using-find_package.patch
> b/meta/recipes-devtools/clang/clang/0009-cmake-Fix-configure-for-packages=
-using-find_package.patch
> similarity index 89%
> rename from
> meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for-packages-u=
sing-find_package.patch
> rename to
> meta/recipes-devtools/clang/clang/0009-cmake-Fix-configure-for-packages-u=
sing-find_package.patch
> index 946eb1661f..2a3744f225 100644
> ---
> a/meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for-packages=
-using-find_package.patch
> +++
> b/meta/recipes-devtools/clang/clang/0009-cmake-Fix-configure-for-packages=
-using-find_package.patch
> @@ -1,4 +1,4 @@
> -From dc281691e778a61cc14bca4eb187792d2ffb384c Mon Sep 17 00:00:00 2001
> +From d373417d4724071c98f95d17c88cc78e9dc1c241 Mon Sep 17 00:00:00 2001
>  From: Ovidiu Panait <ovidiu.panait@windriver.com>
>  Date: Fri, 31 Jan 2020 10:56:11 +0200
>  Subject: [PATCH] cmake: Fix configure for packages using find_package()
> @@ -31,7 +31,7 @@ Signed-off-by: Ovidiu Panait <
> ovidiu.panait@windriver.com>
>   3 files changed, 2 insertions(+), 15 deletions(-)
>
>  diff --git a/clang/cmake/modules/AddClang.cmake
> b/clang/cmake/modules/AddClang.cmake
> -index 4059fc3e986c..44d43aa8f25b 100644
> +index e2112d7..f51983d 100644
>  --- a/clang/cmake/modules/AddClang.cmake
>  +++ b/clang/cmake/modules/AddClang.cmake
>  @@ -182,7 +182,6 @@ macro(add_clang_tool name)
> @@ -51,10 +51,10 @@ index 4059fc3e986c..44d43aa8f25b 100644
>     endif()
>     set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
>  diff --git a/llvm/cmake/modules/AddLLVM.cmake
> b/llvm/cmake/modules/AddLLVM.cmake
> -index d938214f9d0d..4816f2127e14 100644
> +index a267166..09ff2af 100644
>  --- a/llvm/cmake/modules/AddLLVM.cmake
>  +++ b/llvm/cmake/modules/AddLLVM.cmake
> -@@ -1485,7 +1485,6 @@ macro(llvm_add_tool project name)
> +@@ -1625,7 +1625,6 @@ macro(llvm_add_tool project name)
>         if( LLVM_BUILD_TOOLS )
>           get_target_export_arg(${name} ${project} export_to_llvmexports)
>           install(TARGETS ${name}
> @@ -62,7 +62,7 @@ index d938214f9d0d..4816f2127e14 100644
>                   RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
>                   COMPONENT ${name})
>           if (LLVM_ENABLE_PDB)
> -@@ -1501,10 +1500,8 @@ macro(llvm_add_tool project name)
> +@@ -1641,10 +1640,8 @@ macro(llvm_add_tool project name)
>           endif()
>         endif()
>       endif()
> @@ -75,7 +75,7 @@ index d938214f9d0d..4816f2127e14 100644
>     endif()
>     get_subproject_title(subproject_title)
>     set_target_properties(${name} PROPERTIES FOLDER
> "${subproject_title}/Tools")
> -@@ -1559,7 +1556,6 @@ macro(add_llvm_utility name)
> +@@ -1699,7 +1696,6 @@ macro(add_llvm_utility name)
>       if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
>         get_target_export_arg(${name} LLVM export_to_llvmexports)
>         install(TARGETS ${name}
> @@ -83,7 +83,7 @@ index d938214f9d0d..4816f2127e14 100644
>                 RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
>                 COMPONENT ${name})
>         if (LLVM_ENABLE_PDB)
> -@@ -1573,7 +1569,6 @@ macro(add_llvm_utility name)
> +@@ -1713,7 +1709,6 @@ macro(add_llvm_utility name)
>                                    DEPENDS ${name}
>                                    COMPONENT ${name})
>         endif()
> @@ -92,10 +92,10 @@ index d938214f9d0d..4816f2127e14 100644
>         set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY
> ${name})
>       endif()
>  diff --git a/llvm/cmake/modules/TableGen.cmake
> b/llvm/cmake/modules/TableGen.cmake
> -index 84c03cd6432e..72da60ce3ca1 100644
> +index 397089a..5240962 100644
>  --- a/llvm/cmake/modules/TableGen.cmake
>  +++ b/llvm/cmake/modules/TableGen.cmake
> -@@ -237,12 +237,7 @@ macro(add_tablegen target project)
> +@@ -239,12 +239,7 @@ macro(add_tablegen target project)
>
>     if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
>         (LLVM_BUILD_UTILS OR ${target} IN_LIST
> LLVM_DISTRIBUTION_COMPONENTS))
> @@ -108,7 +108,7 @@ index 84c03cd6432e..72da60ce3ca1 100644
>               COMPONENT ${target}
>               RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
>       if(NOT LLVM_ENABLE_IDE)
> -@@ -253,7 +248,6 @@ macro(add_tablegen target project)
> +@@ -255,7 +250,6 @@ macro(add_tablegen target project)
>     endif()
>     if(ADD_TABLEGEN_EXPORT)
>       string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
> diff --git
> a/meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-location-=
for-cross-toolchains.patch
> b/meta/recipes-devtools/clang/clang/0010-clang-Fix-resource-dir-location-=
for-cross-toolchains.patch
> similarity index 95%
> rename from
> meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-location-fo=
r-cross-toolchains.patch
> rename to
> meta/recipes-devtools/clang/clang/0010-clang-Fix-resource-dir-location-fo=
r-cross-toolchains.patch
> index 72b989c0a2..df6c44bca1 100644
> ---
> a/meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-location-=
for-cross-toolchains.patch
> +++
> b/meta/recipes-devtools/clang/clang/0010-clang-Fix-resource-dir-location-=
for-cross-toolchains.patch
> @@ -1,4 +1,4 @@
> -From 248a51bece02c199d0f84d14fa7e2e2379c592a0 Mon Sep 17 00:00:00 2001
> +From d03df63cfd772452b5b7c8ddb587f576f054b004 Mon Sep 17 00:00:00 2001
>  From: Jim Broadus <jbroadus@xevo.com>
>  Date: Thu, 26 Mar 2020 16:05:53 -0700
>  Subject: [PATCH] clang: Fix resource dir location for cross toolchains
> @@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
>  diff --git a/clang/lib/Options/OptionUtils.cpp
> b/clang/lib/Options/OptionUtils.cpp
> -index e5aefa012f67..7c1b657ce2c1 100644
> +index 77f8955..62bb694 100644
>  --- a/clang/lib/Options/OptionUtils.cpp
>  +++ b/clang/lib/Options/OptionUtils.cpp
>  @@ -213,6 +213,7 @@ std::string clang::GetResourcesPath(StringRef
> BinaryPath) {
> diff --git
> a/meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-prefix-whe=
n-checking-sysroot-f.patch
> b/meta/recipes-devtools/clang/clang/0011-clang-driver-Add-dyld-prefix-whe=
n-checking-sysroot-f.patch
> similarity index 88%
> rename from
> meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-prefix-when-=
checking-sysroot-f.patch
> rename to
> meta/recipes-devtools/clang/clang/0011-clang-driver-Add-dyld-prefix-when-=
checking-sysroot-f.patch
> index 725d10a2a7..29d7a6d6bc 100644
> ---
> a/meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-prefix-whe=
n-checking-sysroot-f.patch
> +++
> b/meta/recipes-devtools/clang/clang/0011-clang-driver-Add-dyld-prefix-whe=
n-checking-sysroot-f.patch
> @@ -1,8 +1,8 @@
> -From b3eea8bcdb792a7b19b879c76eac64f36d1fe012 Mon Sep 17 00:00:00 2001
> +From 75e6420bd7f45f1b60a856d51866e22d83cf55b0 Mon Sep 17 00:00:00 2001
>  From: Oleksandr Ocheretnyi <oocheret@cisco.com>
>  Date: Wed, 15 Apr 2020 00:08:39 +0300
> -Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot fo=
r
> ldso
> - path
> +Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot
> + for ldso path
>
>   * the dyld-prefix shall be taken into account when the default
>     path for the dynamic linker has to be checked.
> @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
>  diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> -index f7f096c1ac0a..7b608a84a66e 100644
> +index cb2b227..c2ac9b6 100644
>  --- a/clang/lib/Driver/ToolChains/Linux.cpp
>  +++ b/clang/lib/Driver/ToolChains/Linux.cpp
> -@@ -632,8 +632,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> +@@ -647,8 +647,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
>
>       Loader =3D HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
>       LibDir =3D "lib32";
> @@ -33,7 +33,7 @@ index f7f096c1ac0a..7b608a84a66e 100644
>           LibDir =3D "lib";
>       }
>       break;
> -@@ -689,8 +689,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> +@@ -704,8 +704,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
>       LibDir =3D "lib64";
>       Loader =3D
>           (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" :
> "ld64.so.1";
> @@ -44,7 +44,7 @@ index f7f096c1ac0a..7b608a84a66e 100644
>           LibDir =3D "lib";
>       }
>       break;
> -@@ -698,8 +698,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> +@@ -713,8 +713,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
>       LibDir =3D "lib64";
>       Loader =3D
>           (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" :
> "ld64.so.2";
> @@ -55,7 +55,7 @@ index f7f096c1ac0a..7b608a84a66e 100644
>           LibDir =3D "lib";
>       }
>       break;
> -@@ -719,8 +719,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> +@@ -736,8 +736,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
>     case llvm::Triple::sparcv9:
>       LibDir =3D "lib64";
>       Loader =3D "ld-linux.so.2";
> @@ -66,7 +66,7 @@ index f7f096c1ac0a..7b608a84a66e 100644
>           LibDir =3D "lib";
>       }
>       break;
> -@@ -737,8 +737,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> +@@ -754,8 +754,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
>
>       LibDir =3D X32 ? "libx32" : "lib64";
>       Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
> diff --git
> a/meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-python-scri=
pts.patch
> b/meta/recipes-devtools/clang/clang/0012-clang-Use-python3-in-python-scri=
pts.patch
> similarity index 90%
> rename from
> meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-python-script=
s.patch
> rename to
> meta/recipes-devtools/clang/clang/0012-clang-Use-python3-in-python-script=
s.patch
> index e29d23cab2..5b0a0b3431 100644
> ---
> a/meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-python-scri=
pts.patch
> +++
> b/meta/recipes-devtools/clang/clang/0012-clang-Use-python3-in-python-scri=
pts.patch
> @@ -1,4 +1,4 @@
> -From 17e1af5e12a01296d2c032a768569d4d8b06505b Mon Sep 17 00:00:00 2001
> +From bc161f33adb168a0a1614d38eb84190c3f690000 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 14 Oct 2020 22:19:57 -0700
>  Subject: [PATCH] clang: Use python3 in python scripts
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git
> a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-al=
l-symbols.py
> b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-al=
l-symbols.py
> -index 49a1b1493264..6158876d15f7 100755
> +index 49a1b14..6158876 100755
>  ---
> a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-al=
l-symbols.py
>  +++
> b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-al=
l-symbols.py
>  @@ -1,4 +1,4 @@
> @@ -24,7 +24,7 @@ index 49a1b1493264..6158876d15f7 100755
>   # =3D- run-find-all-symbols.py - Parallel find-all-symbols runner -*-
> python  -*-=3D#
>   #
>  diff --git a/clang/tools/scan-view/bin/scan-view
> b/clang/tools/scan-view/bin/scan-view
> -index d01aebb4029a..f3375804654d 100755
> +index d01aebb..f337580 100755
>  --- a/clang/tools/scan-view/bin/scan-view
>  +++ b/clang/tools/scan-view/bin/scan-view
>  @@ -1,4 +1,4 @@
> diff --git
> a/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> b/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> similarity index 91%
> rename from
> meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for-addin=
g-OE-distro-vendor.patch
> rename to
> meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-addin=
g-OE-distro-vendor.patch
> index 674a3b264e..aba7488323 100644
> ---
> a/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> +++
> b/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> @@ -1,7 +1,8 @@
> -From 259d8eb2ed82c9248387a3cbb1befee358ecbb8e Mon Sep 17 00:00:00 2001
> +From 12fbb32963d7aad6c0d5a0ca5fc0f536f1a9b4fe Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Mon, 25 Jan 2021 16:14:35 +0800
> -Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor
> names
> +Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor
> + names
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -99,11 +100,11 @@ Signed-off-by: Jo=C3=A3o Marcos Costa <
> joaomarcos.costa@bootlin.com>
>   clang/lib/Driver/Distro.cpp           | 1 +
>   clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
>   clang/lib/Driver/ToolChains/Linux.cpp | 2 ++
> - llvm/lib/TargetParser/Triple.cpp      | 2 +-
> - 5 files changed, 7 insertions(+), 1 deletion(-)
> + llvm/lib/TargetParser/Triple.cpp      | 1 +
> + 5 files changed, 7 insertions(+)
>
>  diff --git a/clang/include/clang/Driver/Distro.h
> b/clang/include/clang/Driver/Distro.h
> -index 0e17b30eb..b449a62dc 100644
> +index aa4b3e1..2d77a2b 100644
>  --- a/clang/include/clang/Driver/Distro.h
>  +++ b/clang/include/clang/Driver/Distro.h
>  @@ -45,6 +45,7 @@ public:
> @@ -114,7 +115,7 @@ index 0e17b30eb..b449a62dc 100644
>       OpenSUSE,
>       UbuntuQuantal,
>       UbuntuRaring,
> -@@ -132,6 +133,7 @@ public:
> +@@ -133,6 +134,7 @@ public:
>
>     bool IsGentoo() const { return DistroVal =3D=3D Gentoo; }
>
> @@ -123,7 +124,7 @@ index 0e17b30eb..b449a62dc 100644
>   };
>
>  diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
> -index df10458d0..61dc127a4 100644
> +index 585497e..3b58ac7 100644
>  --- a/clang/lib/Driver/Distro.cpp
>  +++ b/clang/lib/Driver/Distro.cpp
>  @@ -43,6 +43,7 @@ static Distro::DistroType
> DetectOsRelease(llvm::vfs::FileSystem &VFS) {
> @@ -135,10 +136,10 @@ index df10458d0..61dc127a4 100644
>     return Version;
>   }
>  diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp
> b/clang/lib/Driver/ToolChains/Gnu.cpp
> -index c80980a7f..80fd8058b 100644
> +index f44663f..73ff1f4 100644
>  --- a/clang/lib/Driver/ToolChains/Gnu.cpp
>  +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> -@@ -2370,6 +2370,7 @@ void
> Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
> +@@ -2371,6 +2371,7 @@ void
> Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
>         "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
>         "x86_64-redhat-linux",    "x86_64-suse-linux",
>         "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
> @@ -147,7 +148,7 @@ index c80980a7f..80fd8058b 100644
>     static const char *const X32Triples[] =3D {"x86_64-linux-gnux32",
>                                              "x86_64-pc-linux-gnux32"};
>  diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> -index 7b608a84a..585a86a2d 100644
> +index c2ac9b6..3231f36 100644
>  --- a/clang/lib/Driver/ToolChains/Linux.cpp
>  +++ b/clang/lib/Driver/ToolChains/Linux.cpp
>  @@ -45,6 +45,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
> @@ -167,18 +168,14 @@ index 7b608a84a..585a86a2d 100644
>     case llvm::Triple::aarch64:
>       if (IsAndroid)
>  diff --git a/llvm/lib/TargetParser/Triple.cpp
> b/llvm/lib/TargetParser/Triple.cpp
> -index a4f9dd42c..86b74451e 100644
> +index 356782c..883e654 100644
>  --- a/llvm/lib/TargetParser/Triple.cpp
>  +++ b/llvm/lib/TargetParser/Triple.cpp
> -@@ -702,7 +702,7 @@ static Triple::VendorType parseVendor(StringRef
> VendorName) {
> -       .Case("suse", Triple::SUSE)
> -       .Case("oe", Triple::OpenEmbedded)
> -       .Case("intel", Triple::Intel)
> --      .Case("meta", Triple::Meta)
> -+      .Case("meta", Triple::Meta) //CLANG_EXTRA_OE_VENDORS_CASES
> +@@ -741,6 +741,7 @@ static Triple::VendorType parseVendor(StringRef
> VendorName) {
> + #define TRIPLE_VENDOR(Enum, Name) .Case(Name, Triple::Enum)
> + #define TRIPLE_VENDOR_ALIAS(Enum, AliasName) .Case(AliasName,
> Triple::Enum)
> + #include "llvm/TargetParser/TripleName.def"
> ++      //CLANG_EXTRA_OE_VENDORS_CASES
>         .Default(Triple::UnknownVendor);
>   }
>
> ---
> -2.39.5
> -
> diff --git
> a/meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for-non-deb=
ian-multiarch-linux-.patch
> b/meta/recipes-devtools/clang/clang/0014-clang-Fix-x86-triple-for-non-deb=
ian-multiarch-linux-.patch
> similarity index 86%
> rename from
> meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for-non-debia=
n-multiarch-linux-.patch
> rename to
> meta/recipes-devtools/clang/clang/0014-clang-Fix-x86-triple-for-non-debia=
n-multiarch-linux-.patch
> index 786ff426d3..d54859c338 100644
> ---
> a/meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for-non-deb=
ian-multiarch-linux-.patch
> +++
> b/meta/recipes-devtools/clang/clang/0014-clang-Fix-x86-triple-for-non-deb=
ian-multiarch-linux-.patch
> @@ -1,7 +1,8 @@
> -From 6839ba1413cf09eb14a24eeda44fb02c1c6809e1 Mon Sep 17 00:00:00 2001
> +From 0a569622e3ebdb2ebd1a2a4f9553161c1bd188d8 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 19 May 2021 17:56:03 -0700
> -Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux
> distros
> +Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux
> + distros
>
>  OpenEmbedded does not hardcode mutli-arch like debian therefore ensure
>  that it still uses the proper tuple
> @@ -13,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> -index 4a0adedce09a..9fed904c05c2 100644
> +index 3231f36..41e0017 100644
>  --- a/clang/lib/Driver/ToolChains/Linux.cpp
>  +++ b/clang/lib/Driver/ToolChains/Linux.cpp
> -@@ -227,8 +227,9 @@ Linux::Linux(const Driver &D, const llvm::Triple
> &Triple, const ArgList &Args)
> +@@ -228,8 +228,9 @@ Linux::Linux(const Driver &D, const llvm::Triple
> &Triple, const ArgList &Args)
>       : Generic_ELF(D, Triple, Args) {
>     GCCInstallation.TripleToDebianMultiarch =3D [](const llvm::Triple &T)=
 {
>       StringRef TripleStr =3D T.str();
> diff --git
> a/meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_backtrace-me=
thod.patch
> b/meta/recipes-devtools/clang/clang/0015-libunwind-Added-unw_backtrace-me=
thod.patch
> similarity index 89%
> rename from
> meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_backtrace-meth=
od.patch
> rename to
> meta/recipes-devtools/clang/clang/0015-libunwind-Added-unw_backtrace-meth=
od.patch
> index 0b7966ee57..2beff16173 100644
> ---
> a/meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_backtrace-me=
thod.patch
> +++
> b/meta/recipes-devtools/clang/clang/0015-libunwind-Added-unw_backtrace-me=
thod.patch
> @@ -1,4 +1,4 @@
> -From bf7c0933d65eb811c993ff32fdc6b65f6befc5af Mon Sep 17 00:00:00 2001
> +From 1ab2bd0edf76583f0e430da5ef8a53ca4029455f Mon Sep 17 00:00:00 2001
>  From: Maksim Kita <maksim-kita@yandex-team.ru>
>  Date: Sun, 23 May 2021 10:27:29 +0000
>  Subject: [PATCH] libunwind: Added unw_backtrace method
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 21 insertions(+)
>
>  diff --git a/libunwind/include/libunwind.h b/libunwind/include/libunwind=
.h
> -index 56ca7110274a..60a27f28100b 100644
> +index 6c2dfe5..602cafb 100644
>  --- a/libunwind/include/libunwind.h
>  +++ b/libunwind/include/libunwind.h
>  @@ -235,6 +235,7 @@ extern int unw_is_signal_frame(unw_cursor_t *)
> LIBUNWIND_AVAIL;
> @@ -24,10 +24,10 @@ index 56ca7110274a..60a27f28100b 100644
>   extern unw_addr_space_t unw_local_addr_space;
>
>  diff --git a/libunwind/src/libunwind.cpp b/libunwind/src/libunwind.cpp
> -index 7ffffc2a30c0..ed0b394cb002 100644
> +index 0b9d56e..fbfbd48 100644
>  --- a/libunwind/src/libunwind.cpp
>  +++ b/libunwind/src/libunwind.cpp
> -@@ -531,6 +531,26 @@ int __unw_remove_find_dynamic_unwind_sections(
> +@@ -527,6 +527,26 @@ int __unw_remove_find_dynamic_unwind_sections(
>
>   #endif // __APPLE__
>
> diff --git
> a/meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomic-on-x86.=
patch
> b/meta/recipes-devtools/clang/clang/0016-lldb-Link-with-libatomic-on-x86.=
patch
> similarity index 92%
> rename from
> meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomic-on-x86.pa=
tch
> rename to
> meta/recipes-devtools/clang/clang/0016-lldb-Link-with-libatomic-on-x86.pa=
tch
> index b9f7270f62..45a71fc2ab 100644
> ---
> a/meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomic-on-x86.=
patch
> +++
> b/meta/recipes-devtools/clang/clang/0016-lldb-Link-with-libatomic-on-x86.=
patch
> @@ -1,4 +1,4 @@
> -From 94c6e940ddc44922ee505993549477a0fa7ac50d Mon Sep 17 00:00:00 2001
> +From 765a550228a57f9bf88ea2c284a5aec01c4c220e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 8 Feb 2022 01:31:26 -0800
>  Subject: [PATCH] lldb: Link with libatomic on x86
> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+)
>
>  diff --git a/lldb/source/Utility/CMakeLists.txt
> b/lldb/source/Utility/CMakeLists.txt
> -index 04f1692e53b3..da0a48d9da54 100644
> +index c0d0a42..463c0d7 100644
>  --- a/lldb/source/Utility/CMakeLists.txt
>  +++ b/lldb/source/Utility/CMakeLists.txt
>  @@ -19,6 +19,10 @@ if (CMAKE_SYSTEM_NAME MATCHES "Windows")
> diff --git
> a/meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtrace=
-APIs-on-non-glibc-l.patch
> b/meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtrace=
-APIs-on-non-glibc-l.patch
> deleted file mode 100644
> index 3fa436d526..0000000000
> ---
> a/meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtrace=
-APIs-on-non-glibc-l.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From bc8371eb77cca413ccb4ebf8239c597f7be40006 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 19 May 2021 17:32:13 -0700
> -Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc lin=
ux
> -
> -musl e.g. does not provide backtrace APIs
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - .../lib/gwp_asan/optional/backtrace_linux_libc.cpp  | 13 ++++++++++++-
> - 1 file changed, 12 insertions(+), 1 deletion(-)
> -
> -diff --git a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
> b/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
> -index ea8e72be287d..0344074dd254 100644
> ---- a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
> -+++ b/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
> -@@ -7,7 +7,9 @@
> -
> //=3D=3D=3D--------------------------------------------------------------=
--------=3D=3D=3D//
> -
> - #include <assert.h>
> -+#ifdef __GLIBC__
> - #include <execinfo.h>
> -+#endif
> - #include <stddef.h>
> - #include <stdint.h>
> - #include <stdlib.h>
> -@@ -21,8 +23,11 @@
> - namespace {
> - size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {
> -   static_assert(sizeof(uintptr_t) =3D=3D sizeof(void *), "uintptr_t is =
not
> void*");
> --
> -+#ifdef __GLIBC__
> -   return backtrace(reinterpret_cast<void **>(TraceBuffer), Size);
> -+#else
> -+  return -1;
> -+#endif
> - }
> -
> - // We don't need any custom handling for the Segv backtrace - the libc
> unwinder
> -@@ -30,7 +35,11 @@ size_t Backtrace(uintptr_t *TraceBuffer, size_t Size)=
 {
> - // to avoid the additional frame.
> - GWP_ASAN_ALWAYS_INLINE size_t SegvBacktrace(uintptr_t *TraceBuffer,
> size_t Size,
> -                                             void * /*Context*/) {
> -+#ifdef __GLIBC__
> -   return Backtrace(TraceBuffer, Size);
> -+#else
> -+  return -1;
> -+#endif
> - }
> -
> - static void PrintBacktrace(uintptr_t *Trace, size_t TraceLength,
> -@@ -40,6 +49,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t
> TraceLength,
> -     return;
> -   }
> -
> -+#ifdef __GLIBC__
> -   char **BacktraceSymbols =3D
> -       backtrace_symbols(reinterpret_cast<void **>(Trace), TraceLength);
> -
> -@@ -53,6 +63,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t
> TraceLength,
> -   Printf("\n");
> -   if (BacktraceSymbols)
> -     free(BacktraceSymbols);
> -+#endif
> - }
> - } // anonymous namespace
> -
> diff --git
> a/meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__int128-for-=
ppc32.patch
> b/meta/recipes-devtools/clang/clang/0017-compiler-rt-Enable-__int128-for-=
ppc32.patch
> similarity index 77%
> rename from
> meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__int128-for-pp=
c32.patch
> rename to
> meta/recipes-devtools/clang/clang/0017-compiler-rt-Enable-__int128-for-pp=
c32.patch
> index 89b492b877..12749e8f96 100644
> ---
> a/meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__int128-for-=
ppc32.patch
> +++
> b/meta/recipes-devtools/clang/clang/0017-compiler-rt-Enable-__int128-for-=
ppc32.patch
> @@ -1,4 +1,4 @@
> -From 968515d7aa2d7e4af5f318618c307dbe21538650 Mon Sep 17 00:00:00 2001
> +From 3a7b96edc836c0264206f01f5fc7e0cd1bc6c70c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 9 Mar 2022 16:28:16 -0800
>  Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
> @@ -6,15 +6,15 @@ Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - compiler-rt/lib/builtins/CMakeLists.txt | 13 ++++++-------
> + compiler-rt/lib/builtins/CMakeLists.txt | 17 ++++++-----------
>   compiler-rt/lib/builtins/int_types.h    |  2 +-
> - 2 files changed, 7 insertions(+), 8 deletions(-)
> + 2 files changed, 7 insertions(+), 12 deletions(-)
>
>  diff --git a/compiler-rt/lib/builtins/CMakeLists.txt
> b/compiler-rt/lib/builtins/CMakeLists.txt
> -index c3dbd65998f1..b3a44ea3c3b3 100644
> +index e128fea..eb108d7 100644
>  --- a/compiler-rt/lib/builtins/CMakeLists.txt
>  +++ b/compiler-rt/lib/builtins/CMakeLists.txt
> -@@ -813,11 +813,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
> +@@ -916,11 +916,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
>
>   set(nvptx64_SOURCES ${GENERIC_SOURCES})
>
> @@ -27,7 +27,7 @@ index c3dbd65998f1..b3a44ea3c3b3 100644
>     ppc/divtc3.c
>     ppc/fixtfdi.c
>     ppc/fixunstfdi.c
> -@@ -832,14 +830,15 @@ set(powerpc64_SOURCES
> +@@ -935,11 +933,11 @@ set(powerpc64_SOURCES
>   )
>   # These routines require __int128, which isn't supported on AIX.
>   if (NOT OS_NAME MATCHES "AIX")
> @@ -40,13 +40,23 @@ index c3dbd65998f1..b3a44ea3c3b3 100644
>  +    ${powerpc_SOURCES}
>     )
>   endif()
> + if (OS_NAME MATCHES "AIX")
> +@@ -947,12 +945,9 @@ if (OS_NAME MATCHES "AIX")
> +     ppc/init_ifuncs.c
> +     ${powerpc_SOURCES}
> +   )
> +-  set(powerpc64_SOURCES
> +-    ppc/init_ifuncs.c
> +-    ${powerpc64_SOURCES}
> +-  )
> + endif()
>  -set(powerpc64le_SOURCES ${powerpc64_SOURCES})
>  +set(powerpc64le_SOURCES ${powerpc_SOURCES})
>  +set(powerpc64_SOURCES ${powerpc_SOURCES})
>
>   set(riscv_SOURCES
>     cpu_model/riscv.c
> -@@ -1014,7 +1013,7 @@ else ()
> +@@ -1125,7 +1120,7 @@ else ()
>
>         # For RISCV32 and 32-bit SPARC, we must force enable int128 for
> compiling long
>         # double routines.
> @@ -56,7 +66,7 @@ index c3dbd65998f1..b3a44ea3c3b3 100644
>           list(APPEND BUILTIN_CFLAGS_${arch} -fforce-enable-int128)
>         endif()
>  diff --git a/compiler-rt/lib/builtins/int_types.h
> b/compiler-rt/lib/builtins/int_types.h
> -index 7c7f8cb64aa9..81386f1b99b0 100644
> +index 6411507..754f8ce 100644
>  --- a/compiler-rt/lib/builtins/int_types.h
>  +++ b/compiler-rt/lib/builtins/int_types.h
>  @@ -64,7 +64,7 @@ typedef union {
> diff --git
> a/meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-infra-to-d=
etect-libzstd.patch
> b/meta/recipes-devtools/clang/clang/0018-llvm-Do-not-use-cmake-infra-to-d=
etect-libzstd.patch
> similarity index 91%
> rename from
> meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-infra-to-det=
ect-libzstd.patch
> rename to
> meta/recipes-devtools/clang/clang/0018-llvm-Do-not-use-cmake-infra-to-det=
ect-libzstd.patch
> index cccb1e9885..167cd12431 100644
> ---
> a/meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-infra-to-d=
etect-libzstd.patch
> +++
> b/meta/recipes-devtools/clang/clang/0018-llvm-Do-not-use-cmake-infra-to-d=
etect-libzstd.patch
> @@ -1,4 +1,4 @@
> -From 8c5fc285de0051107aa9b7e2e269aa2667fd16f4 Mon Sep 17 00:00:00 2001
> +From f610b9f158e13a40f0e86f7a171be493f8ca64fe Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 12 Aug 2022 11:50:57 -0700
>  Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd
> @@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/llvm/lib/Support/CMakeLists.txt
> b/llvm/lib/Support/CMakeLists.txt
> -index 099b0e55579b..8c35b8a31457 100644
> +index 1a3fa39..dd11f9a 100644
>  --- a/llvm/lib/Support/CMakeLists.txt
>  +++ b/llvm/lib/Support/CMakeLists.txt
>  @@ -22,7 +22,7 @@ if (HAS_WERROR_GLOBAL_CTORS)
> @@ -42,7 +42,7 @@ index 099b0e55579b..8c35b8a31457 100644
>   endif()
>
>   if( WIN32 )
> -@@ -351,7 +351,7 @@ if(LLVM_ENABLE_ZLIB)
> +@@ -360,7 +360,7 @@ if(LLVM_ENABLE_ZLIB)
>       get_property(zlib_library TARGET ZLIB::ZLIB PROPERTY LOCATION)
>     endif()
>     get_library_name(${zlib_library} zlib_library)
> @@ -51,7 +51,7 @@ index 099b0e55579b..8c35b8a31457 100644
>   endif()
>
>   if(LLVM_ENABLE_ZSTD)
> -@@ -365,7 +365,7 @@ if(LLVM_ENABLE_ZSTD)
> +@@ -374,7 +374,7 @@ if(LLVM_ENABLE_ZSTD)
>     endif()
>     if (zstd_target STREQUAL zstd::libzstd_shared)
>       get_library_name(${zstd_library} zstd_library)
> diff --git
> a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-struct-s-si=
ze-for-O32-ABI.patch
> b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Fix-stat-struct-s-si=
ze-for-O32-ABI.patch
> similarity index 91%
> rename from
> meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-struct-s-size=
-for-O32-ABI.patch
> rename to
> meta/recipes-devtools/clang/clang/0019-compiler-rt-Fix-stat-struct-s-size=
-for-O32-ABI.patch
> index a498c36b84..021f622894 100644
> ---
> a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-struct-s-si=
ze-for-O32-ABI.patch
> +++
> b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Fix-stat-struct-s-si=
ze-for-O32-ABI.patch
> @@ -1,4 +1,4 @@
> -From 4a114f5fcd2ab8870b26ba3df4747fc066933f66 Mon Sep 17 00:00:00 2001
> +From 6917a5e0eb77c0134b59c3cb942292bc5c38e87f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 3 Jan 2023 18:44:34 -0800
>  Subject: [PATCH] compiler-rt: Fix stat struct's size for O32 ABI
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 13 insertions(+)
>
>  diff --git
> a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
> b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
> -index 05ebee49f2ab..89c4dcaf3e3d 100644
> +index 73eb958..b0dcbde 100644
>  --- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
>  +++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
>  @@ -100,6 +100,18 @@ const unsigned struct_kernel_stat64_sz =3D 104;
> @@ -36,7 +36,7 @@ index 05ebee49f2ab..89c4dcaf3e3d 100644
>   const unsigned struct_kernel_stat_sz =3D SANITIZER_ANDROID
>                                              ? FIRST_32_SECOND_64(104, 12=
8)
>   #      if defined(_ABIN32) && _MIPS_SIM =3D=3D _ABIN32
> -@@ -110,6 +122,7 @@ const unsigned struct_kernel_stat_sz =3D
> SANITIZER_ANDROID
> +@@ -116,6 +128,7 @@ const unsigned struct_kernel_stat_sz =3D
> SANITIZER_ANDROID
>                                              : FIRST_32_SECOND_64(160,
> 216);
>   #      endif
>   const unsigned struct_kernel_stat64_sz =3D 104;
> diff --git
> a/meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARMLibDirs-se=
arch-also-in-lib32.patch
> b/meta/recipes-devtools/clang/clang/0020-ToolChains-Gnu.cpp-ARMLibDirs-se=
arch-also-in-lib32.patch
> similarity index 98%
> rename from
> meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARMLibDirs-sear=
ch-also-in-lib32.patch
> rename to
> meta/recipes-devtools/clang/clang/0020-ToolChains-Gnu.cpp-ARMLibDirs-sear=
ch-also-in-lib32.patch
> index 09224af386..19784aef10 100644
> ---
> a/meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARMLibDirs-se=
arch-also-in-lib32.patch
> +++
> b/meta/recipes-devtools/clang/clang/0020-ToolChains-Gnu.cpp-ARMLibDirs-se=
arch-also-in-lib32.patch
> @@ -1,4 +1,4 @@
> -From 27e4b9755ddd3bec16a851cce0df48e909ae6438 Mon Sep 17 00:00:00 2001
> +From 0d7e696f552b1047e89c5114551b6dc902e6f0f1 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Thu, 31 Aug 2023 18:14:47 +0200
>  Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32
> @@ -55,10 +55,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp
> b/clang/lib/Driver/ToolChains/Gnu.cpp
> -index 80fd8058bd98..37cb6cfdf2da 100644
> +index 73ff1f4..6a2b362 100644
>  --- a/clang/lib/Driver/ToolChains/Gnu.cpp
>  +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> -@@ -2346,7 +2346,7 @@ void
> Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
> +@@ -2347,7 +2347,7 @@ void
> Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
>     static const char *const AArch64beLibDirs[] =3D {"/lib"};
>     static const char *const AArch64beTriples[] =3D
> {"aarch64_be-none-linux-gnu"};
>
> @@ -68,10 +68,10 @@ index 80fd8058bd98..37cb6cfdf2da 100644
>     static const char *const ARMHFTriples[] =3D {"arm-linux-gnueabihf",
>
>  "armv7hl-redhat-linux-gnueabi",
>  diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> -index 9fed904c05c2..5bb66c9faa1f 100644
> +index 41e0017..5f8b7fd 100644
>  --- a/clang/lib/Driver/ToolChains/Linux.cpp
>  +++ b/clang/lib/Driver/ToolChains/Linux.cpp
> -@@ -198,6 +198,7 @@ static StringRef getOSLibDir(const llvm::Triple
> &Triple, const ArgList &Args) {
> +@@ -199,6 +199,7 @@ static StringRef getOSLibDir(const llvm::Triple
> &Triple, const ArgList &Args) {
>     // reasoning about oslibdir spellings with the lib dir spellings in t=
he
>     // GCCInstallationDetector, but that is a more significant refactorin=
g.
>     if (Triple.getArch() =3D=3D llvm::Triple::x86 || Triple.isPPC32() ||
> diff --git
> a/meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-specific-ABI-t=
riple-for-N32-ABI.patch
> b/meta/recipes-devtools/clang/clang/0021-clang-llvm-Add-OE-specific-ABI-t=
riple-for-N32-ABI.patch
> similarity index 60%
> rename from
> meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-specific-ABI-tri=
ple-for-N32-ABI.patch
> rename to
> meta/recipes-devtools/clang/clang/0021-clang-llvm-Add-OE-specific-ABI-tri=
ple-for-N32-ABI.patch
> index c93a9ec7e0..6577380978 100644
> ---
> a/meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-specific-ABI-t=
riple-for-N32-ABI.patch
> +++
> b/meta/recipes-devtools/clang/clang/0021-clang-llvm-Add-OE-specific-ABI-t=
riple-for-N32-ABI.patch
> @@ -1,4 +1,4 @@
> -From 7023d17f81a472e72a5739e007b9e7148d105137 Mon Sep 17 00:00:00 2001
> +From 33988376d79f9eca5f54000cdcc558c8dc3d89ba Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 3 Feb 2024 16:47:10 -0800
>  Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI
> @@ -8,16 +8,17 @@ Its gnun32 when using OE
>  Upstream-Status: Inappropriate [OE-Specific]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
> - clang/lib/Driver/ToolChains/Linux.cpp | 4 ++--
> - llvm/lib/TargetParser/Triple.cpp      | 4 +++-
> - 3 files changed, 6 insertions(+), 3 deletions(-)
> + clang/lib/Driver/ToolChains/Gnu.cpp           | 1 +
> + clang/lib/Driver/ToolChains/Linux.cpp         | 4 ++--
> + llvm/include/llvm/TargetParser/TripleName.def | 2 +-
> + llvm/lib/TargetParser/Triple.cpp              | 2 ++
> + 4 files changed, 6 insertions(+), 3 deletions(-)
>
>  diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp
> b/clang/lib/Driver/ToolChains/Gnu.cpp
> -index 37cb6cfdf2da..bcd7d345c25a 100644
> +index 6a2b362..05d1c44 100644
>  --- a/clang/lib/Driver/ToolChains/Gnu.cpp
>  +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> -@@ -2415,6 +2415,7 @@ void
> Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
> +@@ -2416,6 +2416,7 @@ void
> Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
>
>     static const char *const MIPSN32LibDirs[] =3D {"/lib32"};
>     static const char *const MIPSN32Triples[] =3D {"mips64-linux-gnuabin3=
2",
> @@ -26,10 +27,10 @@ index 37cb6cfdf2da..bcd7d345c25a 100644
>     static const char *const MIPSN32ELLibDirs[] =3D {"/lib32"};
>     static const char *const MIPSN32ELTriples[] =3D {
>  diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> -index 5bb66c9faa1f..c6d6e20dbc4d 100644
> +index 5f8b7fd..ac7bd3a 100644
>  --- a/clang/lib/Driver/ToolChains/Linux.cpp
>  +++ b/clang/lib/Driver/ToolChains/Linux.cpp
> -@@ -138,7 +138,7 @@ std::string Linux::getMultiarchTriple(const Driver &=
D,
> +@@ -139,7 +139,7 @@ std::string Linux::getMultiarchTriple(const Driver &=
D,
>       return IsMipsR6 ? "mipsisa32r6el-linux-gnu" : "mipsel-linux-gnu";
>     case llvm::Triple::mips64: {
>       std::string MT =3D std::string(IsMipsR6 ? "mipsisa64r6" : "mips64")=
 +
> @@ -38,7 +39,7 @@ index 5bb66c9faa1f..c6d6e20dbc4d 100644
>       if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
>         return MT;
>       if (D.getVFS().exists(concat(SysRoot, "/lib/mips64-linux-gnu")))
> -@@ -147,7 +147,7 @@ std::string Linux::getMultiarchTriple(const Driver &=
D,
> +@@ -148,7 +148,7 @@ std::string Linux::getMultiarchTriple(const Driver &=
D,
>     }
>     case llvm::Triple::mips64el: {
>       std::string MT =3D std::string(IsMipsR6 ? "mipsisa64r6el" :
> "mips64el") +
> @@ -47,28 +48,32 @@ index 5bb66c9faa1f..c6d6e20dbc4d 100644
>       if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
>         return MT;
>       if (D.getVFS().exists(concat(SysRoot, "/lib/mips64el-linux-gnu")))
> +diff --git a/llvm/include/llvm/TargetParser/TripleName.def
> b/llvm/include/llvm/TargetParser/TripleName.def
> +index bbc03b3..081d8ff 100644
> +--- a/llvm/include/llvm/TargetParser/TripleName.def
> ++++ b/llvm/include/llvm/TargetParser/TripleName.def
> +@@ -102,7 +102,7 @@ TRIPLE_OS(H2, "h2")
> +
> + TRIPLE_ENV(EABIHF, "eabihf")
> + TRIPLE_ENV(EABI, "eabi")
> +-TRIPLE_ENV(GNUABIN32, "gnuabin32")
> ++TRIPLE_ENV(GNUABIN32, "gnun32")
> + TRIPLE_ENV(GNUABI64, "gnuabi64")
> + TRIPLE_ENV(GNUEABIHFT64, "gnueabihft64")
> + TRIPLE_ENV(GNUEABIHF, "gnueabihf")
>  diff --git a/llvm/lib/TargetParser/Triple.cpp
> b/llvm/lib/TargetParser/Triple.cpp
> -index 86b74451ec0d..d94b7d44d11a 100644
> +index 883e654..aa2bb35 100644
>  --- a/llvm/lib/TargetParser/Triple.cpp
>  +++ b/llvm/lib/TargetParser/Triple.cpp
> -@@ -358,7 +358,7 @@ StringRef
> Triple::getEnvironmentTypeName(EnvironmentType Kind) {
> -   case GNU: return "gnu";
> -   case GNUT64: return "gnut64";
> -   case GNUABI64: return "gnuabi64";
> --  case GNUABIN32: return "gnuabin32";
> -+  case GNUABIN32: return "gnun32";
> -   case GNUEABI: return "gnueabi";
> -   case GNUEABIT64: return "gnueabit64";
> -   case GNUEABIHF: return "gnueabihf";
> -@@ -762,6 +762,7 @@ static Triple::EnvironmentType
> parseEnvironment(StringRef EnvironmentName) {
> -       .StartsWith("eabihf", Triple::EABIHF)
> -       .StartsWith("eabi", Triple::EABI)
> -       .StartsWith("gnuabin32", Triple::GNUABIN32)
> -+      .StartsWith("gnun32", Triple::GNUABIN32)
> -       .StartsWith("gnuabi64", Triple::GNUABI64)
> -       .StartsWith("gnueabihft64", Triple::GNUEABIHFT64)
> -       .StartsWith("gnueabihf", Triple::GNUEABIHF)
> -@@ -1087,6 +1088,7 @@ Triple::Triple(std::string &&Str) :
> Data(std::move(Str)) {
> +@@ -755,6 +755,7 @@ static Triple::OSType parseOS(StringRef OSName) {
> +
> + static Triple::EnvironmentType parseEnvironment(StringRef
> EnvironmentName) {
> +   return StringSwitch<Triple::EnvironmentType>(EnvironmentName)
> ++      .StartsWith("gnuabin32", Triple::GNUABIN32)
> + #define TRIPLE_ENV(Enum, Name) .StartsWith(Name, Triple::Enum)
> + #include "llvm/TargetParser/TripleName.def"
> +       .Default(Triple::UnknownEnvironment);
> +@@ -1106,6 +1107,7 @@ Triple::Triple(std::string &&Str) :
> Data(std::move(Str)) {
>         Environment =3D
>             StringSwitch<Triple::EnvironmentType>(Components[0])
>                 .StartsWith("mipsn32", Triple::GNUABIN32)
>

   .def already has an alias mechanism (TRIPLE_VENDOR_ALIAS appears in the
vendor rework) =E2=80=94 if TRIPLE_ENV_ALIAS exists too, using it for gnuab=
in32
would keep the compat spelling in the table itself instead of hand-editing
parseEnvironment, which will rebase more cleanly next


> diff --git
> a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llv=
m-config-scripts.patch
> b/meta/recipes-devtools/clang/clang/0022-llvm-Add-libunwind.pc.in-and-llv=
m-config-scripts.patch
> similarity index 84%
> rename from
> meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-=
config-scripts.patch
> rename to
> meta/recipes-devtools/clang/clang/0022-llvm-Add-libunwind.pc.in-and-llvm-=
config-scripts.patch
> index 72ffdc6c1f..34ba534074 100644
> ---
> a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llv=
m-config-scripts.patch
> +++
> b/meta/recipes-devtools/clang/clang/0022-llvm-Add-libunwind.pc.in-and-llv=
m-config-scripts.patch
> @@ -1,4 +1,4 @@
> -From 17a1a4919c0ff554fc30bbb85a63b9d2a1164324 Mon Sep 17 00:00:00 2001
> +From 9ec97845821ead65ebd8ab26b69d949e10b65338 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 14 May 2024 22:04:43 -0700
>  Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
> @@ -10,15 +10,15 @@ Upstream-Status: Inappropriate [ OE-Specific ]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>  ---
> - libunwind/libunwind.pc.in          |  9 ++++++
> - llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++
> - 2 files changed, 61 insertions(+)
> + libunwind/libunwind.pc.in          |  9 +++++++++
> + llvm/tools/llvm-config/llvm-config | 15 +++++++++++++++
> + 2 files changed, 24 insertions(+)
>   create mode 100644 libunwind/libunwind.pc.in
>   create mode 100644 llvm/tools/llvm-config/llvm-config
>
>  diff --git a/libunwind/libunwind.pc.in b/libunwind/libunwind.pc.in
>  new file mode 100644
> -index 000000000000..a93d676604f9
> +index 0000000..a93d676
>  --- /dev/null
>  +++ b/libunwind/libunwind.pc.in
>  @@ -0,0 +1,9 @@
> @@ -33,7 +33,7 @@ index 000000000000..a93d676604f9
>  +Libs: -lunwind
>  diff --git a/llvm/tools/llvm-config/llvm-config
> b/llvm/tools/llvm-config/llvm-config
>  new file mode 100644
> -index 000000000000..6a0dd54b8eab
> +index 0000000..0578773
>  --- /dev/null
>  +++ b/llvm/tools/llvm-config/llvm-config
>  @@ -0,0 +1,15 @@
> diff --git
> a/meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LLVM_LIBDI=
R_SUFFIX-like-other-.patch
> b/meta/recipes-devtools/clang/clang/0023-scan-build-py-respect-LLVM_LIBDI=
R_SUFFIX-like-other-.patch
> similarity index 90%
> rename from
> meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LLVM_LIBDIR_=
SUFFIX-like-other-.patch
> rename to
> meta/recipes-devtools/clang/clang/0023-scan-build-py-respect-LLVM_LIBDIR_=
SUFFIX-like-other-.patch
> index 934d5adc50..55ad603b7c 100644
> ---
> a/meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LLVM_LIBDI=
R_SUFFIX-like-other-.patch
> +++
> b/meta/recipes-devtools/clang/clang/0023-scan-build-py-respect-LLVM_LIBDI=
R_SUFFIX-like-other-.patch
> @@ -1,7 +1,8 @@
> -From a2171be64a181e0b263fc8ec31a760193651203c Mon Sep 17 00:00:00 2001
> +From b9565c7e6525f3ca20df3171c36698b521a45594 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <martin.jansa@gmail.com>
>  Date: Fri, 13 Sep 2024 13:38:08 +0200
> -Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other
> tools do
> +Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other
> + tools do
>
>  * other libraries are installed in 'lib64' or 'lib32' based on
>    LLVM_LIBDIR_SUFFIX value, but libscanbuild files were always
> @@ -11,13 +12,13 @@ Upstream-Status: Submitted [
> https://github.com/llvm/llvm-project/pull/108549]
>
>  Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>  ---
> - clang/tools/scan-build-py/CMakeLists.txt | 26 ++++++++++++------------
> - 1 file changed, 13 insertions(+), 13 deletions(-)
> + clang/tools/scan-build-py/CMakeLists.txt | 32 ++++++++++++------------
> + 1 file changed, 16 insertions(+), 16 deletions(-)
>
> -Index: llvm-project-22.1.2.src/clang/tools/scan-build-py/CMakeLists.txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- llvm-project-22.1.2.src.orig/clang/tools/scan-build-py/CMakeLists.tx=
t
> -+++ llvm-project-22.1.2.src/clang/tools/scan-build-py/CMakeLists.txt
> +diff --git a/clang/tools/scan-build-py/CMakeLists.txt
> b/clang/tools/scan-build-py/CMakeLists.txt
> +index 84087a9..9647642 100644
> +--- a/clang/tools/scan-build-py/CMakeLists.txt
> ++++ b/clang/tools/scan-build-py/CMakeLists.txt
>  @@ -80,52 +80,52 @@ if(CLANG_INSTALL_SCANBUILDPY)
>     endforeach()
>
> diff --git
> a/meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass-target-t=
o-clang-compiler.patch
> b/meta/recipes-devtools/clang/clang/0024-compiler-rt-Do-not-pass-target-t=
o-clang-compiler.patch
> similarity index 91%
> rename from
> meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass-target-to-=
clang-compiler.patch
> rename to
> meta/recipes-devtools/clang/clang/0024-compiler-rt-Do-not-pass-target-to-=
clang-compiler.patch
> index fe24fe051b..b3fb642742 100644
> ---
> a/meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass-target-t=
o-clang-compiler.patch
> +++
> b/meta/recipes-devtools/clang/clang/0024-compiler-rt-Do-not-pass-target-t=
o-clang-compiler.patch
> @@ -1,4 +1,4 @@
> -From 6b1f360c66b60c4bb639057590a8b2162d3bcf6b Mon Sep 17 00:00:00 2001
> +From f68925e7c31fa4bdd684a4ab44fd1350bb43205b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 13 Mar 2025 00:30:38 -0700
>  Subject: [PATCH] compiler-rt: Do not pass --target to clang compiler
> @@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 deletions(-)
>
>  diff --git a/compiler-rt/lib/fuzzer/CMakeLists.txt
> b/compiler-rt/lib/fuzzer/CMakeLists.txt
> -index a57e2fe46245..2928ed2ab6d5 100644
> +index 2da488d..9af4410 100644
>  --- a/compiler-rt/lib/fuzzer/CMakeLists.txt
>  +++ b/compiler-rt/lib/fuzzer/CMakeLists.txt
>  @@ -140,10 +140,6 @@ if(OS_NAME MATCHES "Android|Linux|Fuchsia" AND
> diff --git
> a/meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-ClassInfo=
-lists-by-name-as-we.patch
> b/meta/recipes-devtools/clang/clang/0025-AsmMatcherEmitter-sort-ClassInfo=
-lists-by-name-as-we.patch
> similarity index 92%
> rename from
> meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-ClassInfo-l=
ists-by-name-as-we.patch
> rename to
> meta/recipes-devtools/clang/clang/0025-AsmMatcherEmitter-sort-ClassInfo-l=
ists-by-name-as-we.patch
> index 413bc3f275..28d0567e15 100644
> ---
> a/meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-ClassInfo=
-lists-by-name-as-we.patch
> +++
> b/meta/recipes-devtools/clang/clang/0025-AsmMatcherEmitter-sort-ClassInfo=
-lists-by-name-as-we.patch
> @@ -1,4 +1,4 @@
> -From 281cd05306cbfa5744e4a1f3ebf5c745324efe7a Mon Sep 17 00:00:00 2001
> +From bf8a65efcdce65143081785b9ed8759d60be1bd4 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 27 Nov 2020 10:11:08 +0000
>  Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
> @@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m
> >
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
>  diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
> b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
> -index e6085af5aa91..b0180638c754 100644
> +index 4af5c85..917aeec 100644
>  --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
>  +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
>  @@ -384,7 +384,10 @@ public:
> diff --git
> a/meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM_LDFLAGS-=
from-ldflags-output.patch
> b/meta/recipes-devtools/clang/clang/0026-llvm-config-remove-LLVM_LDFLAGS-=
from-ldflags-output.patch
> similarity index 92%
> rename from
> meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM_LDFLAGS-fr=
om-ldflags-output.patch
> rename to
> meta/recipes-devtools/clang/clang/0026-llvm-config-remove-LLVM_LDFLAGS-fr=
om-ldflags-output.patch
> index e059748873..7724af8009 100644
> ---
> a/meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM_LDFLAGS-=
from-ldflags-output.patch
> +++
> b/meta/recipes-devtools/clang/clang/0026-llvm-config-remove-LLVM_LDFLAGS-=
from-ldflags-output.patch
> @@ -1,4 +1,4 @@
> -From cbc2595eed96fa7de77162e4c7b99681579d01ef Mon Sep 17 00:00:00 2001
> +From f58186cc6ba2fff4d2e9fb624a904b1c5a4f7733 Mon Sep 17 00:00:00 2001
>  From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>  Date: Wed, 2 Apr 2025 17:05:17 +0300
>  Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
> @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/llvm/tools/llvm-config/llvm-config.cpp
> b/llvm/tools/llvm-config/llvm-config.cpp
> -index 0a3f51ae2b83..5c95a1f3ff24 100644
> +index 64795e9..3e57005 100644
>  --- a/llvm/tools/llvm-config/llvm-config.cpp
>  +++ b/llvm/tools/llvm-config/llvm-config.cpp
>  @@ -576,7 +576,7 @@ int main(int argc, char **argv) {
> diff --git
> a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sync_fetch_a=
nd_-for-any-pre-ARMv.patch
> b/meta/recipes-devtools/clang/clang/0027-compiler-rt-Exclude-sync_fetch_a=
nd_-for-any-pre-ARMv.patch
> similarity index 95%
> rename from
> meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sync_fetch_and=
_-for-any-pre-ARMv.patch
> rename to
> meta/recipes-devtools/clang/clang/0027-compiler-rt-Exclude-sync_fetch_and=
_-for-any-pre-ARMv.patch
> index 52bdeaf9d5..a1847f99f9 100644
> ---
> a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sync_fetch_a=
nd_-for-any-pre-ARMv.patch
> +++
> b/meta/recipes-devtools/clang/clang/0027-compiler-rt-Exclude-sync_fetch_a=
nd_-for-any-pre-ARMv.patch
> @@ -1,4 +1,4 @@
> -From 3a486a17b697c65cdc7d2c17d9e14f2bfc2be911 Mon Sep 17 00:00:00 2001
> +From 9046478db7833765487e66d5a3706b7cb67f1ee2 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 10 May 2025 14:03:12 -0700
>  Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-ARMv6
> @@ -40,10 +40,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 12 insertions(+)
>
>  diff --git a/compiler-rt/lib/builtins/CMakeLists.txt
> b/compiler-rt/lib/builtins/CMakeLists.txt
> -index b3a44ea3c3b3..4a328ab0ca26 100644
> +index eb108d7..4041119 100644
>  --- a/compiler-rt/lib/builtins/CMakeLists.txt
>  +++ b/compiler-rt/lib/builtins/CMakeLists.txt
> -@@ -975,6 +975,18 @@ else ()
> +@@ -1082,6 +1082,18 @@ else ()
>           ${TARGET_${arch}_CFLAGS})
>         list(JOIN CMAKE_REQUIRED_FLAGS " " CMAKE_REQUIRED_FLAGS)
>         message(STATUS "Performing additional configure checks with targe=
t
> flags: ${CMAKE_REQUIRED_FLAGS}")
> diff --git
> a/meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-uptr-sptr-t=
ypedefs-on-Mips-Linu.patch
> b/meta/recipes-devtools/clang/clang/0028-Hardcode-uptr-sptr-typedefs-on-M=
ips-Linux.patch
> similarity index 86%
> rename from
> meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-uptr-sptr-typ=
edefs-on-Mips-Linu.patch
> rename to
> meta/recipes-devtools/clang/clang/0028-Hardcode-uptr-sptr-typedefs-on-Mip=
s-Linux.patch
> index b0aae5457a..d3a9a6c308 100644
> ---
> a/meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-uptr-sptr-t=
ypedefs-on-Mips-Linu.patch
> +++
> b/meta/recipes-devtools/clang/clang/0028-Hardcode-uptr-sptr-typedefs-on-M=
ips-Linux.patch
> @@ -1,7 +1,7 @@
> -From b71c398a1b10b29886c2db2a920f476fec6f7de2 Mon Sep 17 00:00:00 2001
> +From aab77dfb9c2e1a118ffb5bd690f34bf93b6f3f36 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 22 May 2025 21:50:45 -0700
> -Subject: [PATCH] [compiler-rt] Hardcode uptr/sptr typedefs on Mips/Linux
> +Subject: [PATCH] Hardcode uptr/sptr typedefs on Mips/Linux
>
>  Sanitizer build on Mips/Linux faills to build due to assertion errors
>  mismatched definitions. This is due to inconsistent definitions of
> @@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
> b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
> -index c719e2a8ef60..60b997e653c4 100644
> +index c694897..08f6d35 100644
>  --- a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
>  +++ b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
> -@@ -139,7 +139,7 @@
> +@@ -143,7 +143,7 @@
>   namespace __sanitizer {
>
>   #if defined(__UINTPTR_TYPE__)
> diff --git
> a/meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-headers-in-the=
-debug-info-when-bui.patch
> b/meta/recipes-devtools/clang/clang/0029-Revert-libc-Remap-headers-in-the=
-debug-info-when-bui.patch
> similarity index 89%
> rename from
> meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-headers-in-the-d=
ebug-info-when-bui.patch
> rename to
> meta/recipes-devtools/clang/clang/0029-Revert-libc-Remap-headers-in-the-d=
ebug-info-when-bui.patch
> index 57003dcf56..faae71645a 100644
> ---
> a/meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-headers-in-the=
-debug-info-when-bui.patch
> +++
> b/meta/recipes-devtools/clang/clang/0029-Revert-libc-Remap-headers-in-the=
-debug-info-when-bui.patch
> @@ -1,4 +1,4 @@
> -From 9ace97c0c2df52d823c9d5345cca0251bf2ccf16 Mon Sep 17 00:00:00 2001
> +From cffcea54bf4605d958407edb233fffdbe730f4af Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 27 Jul 2025 19:12:13 -0700
>  Subject: [PATCH] Revert "[libc++] Remap headers in the debug info when
> @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 5 deletions(-)
>
>  diff --git a/libcxx/include/CMakeLists.txt b/libcxx/include/CMakeLists.t=
xt
> -index 787cfffa5019..d73bcd852a1e 100644
> +index b40f586..7bd7622 100644
>  --- a/libcxx/include/CMakeLists.txt
>  +++ b/libcxx/include/CMakeLists.txt
> -@@ -1718,11 +1718,6 @@ add_dependencies(cxx-headers generate-cxx-headers=
)
> +@@ -1728,11 +1728,6 @@ add_dependencies(cxx-headers generate-cxx-headers=
)
>   target_include_directories(cxx-headers INTERFACE
> ${LIBCXX_GENERATED_INCLUDE_TARGET_DIR}
>
>  ${LIBCXX_GENERATED_INCLUDE_DIR})
>
> diff --git
> a/meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_OPT_VIEWE=
R_MODULES-externally.patch
> b/meta/recipes-devtools/clang/clang/0030-Don-t-expose-LLVM_HAVE_OPT_VIEWE=
R_MODULES-externally.patch
> similarity index 86%
> rename from
> meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_=
MODULES-externally.patch
> rename to
> meta/recipes-devtools/clang/clang/0030-Don-t-expose-LLVM_HAVE_OPT_VIEWER_=
MODULES-externally.patch
> index 0cdb2ad668..af9564053c 100644
> ---
> a/meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_OPT_VIEWE=
R_MODULES-externally.patch
> +++
> b/meta/recipes-devtools/clang/clang/0030-Don-t-expose-LLVM_HAVE_OPT_VIEWE=
R_MODULES-externally.patch
> @@ -1,4 +1,4 @@
> -From 53da129f7986c5bd310f4f4a8236987df7e073c6 Mon Sep 17 00:00:00 2001
> +From b6a9ddd0ba2d8bd14871c135157f3878a9d629c1 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Mon, 29 Sep 2025 14:44:05 +0100
>  Subject: [PATCH] Don't expose LLVM_HAVE_OPT_VIEWER_MODULES externally
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/llvm/cmake/modules/LLVMConfig.cmake.in b/llvm/cmake/modules=
/
> LLVMConfig.cmake.in
> -index 70c807abea98..5603c9215332 100644
> +index 6f5fcc6..ce07563 100644
>  --- a/llvm/cmake/modules/LLVMConfig.cmake.in
>  +++ b/llvm/cmake/modules/LLVMConfig.cmake.in
> -@@ -137,7 +137,6 @@ set(LLVM_DEFINITIONS "@LLVM_DEFINITIONS@")
> +@@ -145,7 +145,6 @@ set(LLVM_DEFINITIONS "@LLVM_DEFINITIONS@")
>   set(LLVM_BINARY_DIR "@LLVM_CONFIG_BINARY_DIR@")
>   set(LLVM_CMAKE_DIR "@LLVM_CONFIG_CMAKE_DIR@")
>   set(LLVM_TOOLS_BINARY_DIR "@LLVM_CONFIG_TOOLS_BINARY_DIR@")
> diff --git
> a/meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-tblgen-if=
-it-is-actually-need.patch
> b/meta/recipes-devtools/clang/clang/0031-Only-build-clang-tblgen-if-it-is=
-actually-needed.patch
> similarity index 81%
> rename from
> meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-tblgen-if-i=
t-is-actually-need.patch
> rename to
> meta/recipes-devtools/clang/clang/0031-Only-build-clang-tblgen-if-it-is-a=
ctually-needed.patch
> index 5efe043eaf..690791c5e3 100644
> ---
> a/meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-tblgen-if=
-it-is-actually-need.patch
> +++
> b/meta/recipes-devtools/clang/clang/0031-Only-build-clang-tblgen-if-it-is=
-actually-needed.patch
> @@ -1,7 +1,7 @@
> -From de58b9bbc8c52299ff22c4f0ab21e3878d411669 Mon Sep 17 00:00:00 2001
> +From a55e7674203ffcb42e4e3ee4c8cf7aa964aee086 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Sat, 11 Oct 2025 16:01:50 -0700
> -Subject: [PATCH] [clang] Only build clang-tblgen if it is actually neede=
d
> +Subject: [PATCH] Only build clang-tblgen if it is actually needed
>
>  It's possible to build clang with an existing clang-tblgen (common when
>  cross-compiling, for instance) by setting CLANG_TABLEGEN_EXE.  If this
> @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
>  diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt
> -index e4cb1a359620..b650b3b986f4 100644
> +index 89f584c..bd7ebc3 100644
>  --- a/clang/CMakeLists.txt
>  +++ b/clang/CMakeLists.txt
> -@@ -479,7 +479,9 @@ option(CLANG_ENABLE_HLSL "Include HLSL build
> products" Off)
> +@@ -531,7 +531,9 @@ option(CLANG_ENABLE_HLSL "Include HLSL build
> products" Off)
>   # While HLSL support is experimental this should stay hidden.
>   mark_as_advanced(CLANG_ENABLE_HLSL)
>
> diff --git
> a/meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-path-for=
-libcc-when-LLVM_ENA.patch
> b/meta/recipes-devtools/clang/clang/0032-llvm-libgcc-Fix-symlink-path-for=
-libcc-when-LLVM_ENA.patch
> similarity index 93%
> rename from
> meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-path-for-l=
ibcc-when-LLVM_ENA.patch
> rename to
> meta/recipes-devtools/clang/clang/0032-llvm-libgcc-Fix-symlink-path-for-l=
ibcc-when-LLVM_ENA.patch
> index 583e91e497..6081f2d7b4 100644
> ---
> a/meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-path-for=
-libcc-when-LLVM_ENA.patch
> +++
> b/meta/recipes-devtools/clang/clang/0032-llvm-libgcc-Fix-symlink-path-for=
-libcc-when-LLVM_ENA.patch
> @@ -1,4 +1,4 @@
> -From bca77d818187e68989dfa9e386b38632b76a477e Mon Sep 17 00:00:00 2001
> +From b383508d002bb41ac979ab356f73fcf0ae97ca00 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 28 Oct 2025 15:44:49 -0700
>  Subject: [PATCH] llvm-libgcc: Fix symlink path for libcc when
> @@ -33,10 +33,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 13 insertions(+), 3 deletions(-)
>
>  diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
> -index 47208fc19869..54009c1104c3 100644
> +index a297447..1ae9167 100644
>  --- a/llvm-libgcc/CMakeLists.txt
>  +++ b/llvm-libgcc/CMakeLists.txt
> -@@ -124,11 +124,21 @@ target_link_libraries(unwind_shared PUBLIC
> +@@ -133,11 +133,21 @@ target_link_libraries(unwind_shared PUBLIC
>
> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
>   get_compiler_rt_install_dir(${COMPILER_RT_DEFAULT_TARGET_ARCH}
> install_dir_builtins)
> @@ -60,7 +60,7 @@ index 47208fc19869..54009c1104c3 100644
>     string(PREPEND install_dir_builtins "../")
>   endif()
>   set(LLVM_LIBGCC_COMPILER_RT
> ${install_dir_builtins}/libclang_rt.builtins${builtins_suffix}.a)
> -@@ -137,7 +147,7 @@ add_custom_target(llvm-libgcc ALL
> +@@ -146,7 +156,7 @@ add_custom_target(llvm-libgcc ALL
>     DEPENDS unwind_shared unwind_static
> clang_rt.builtins-${COMPILER_RT_DEFAULT_TARGET_ARCH}
>     COMMAND ${CMAKE_COMMAND} -E create_symlink ${LLVM_LIBGCC_COMPILER_RT}
> libgcc.a
>     COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.a libgcc_eh.a
> diff --git
> a/meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysroot-base=
d-compiler-rt-search.patch
> b/meta/recipes-devtools/clang/clang/0033-Consolidate-and-fix-sysroot-base=
d-compiler-rt-search.patch
> similarity index 91%
> rename from
> meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysroot-based-=
compiler-rt-search.patch
> rename to
> meta/recipes-devtools/clang/clang/0033-Consolidate-and-fix-sysroot-based-=
compiler-rt-search.patch
> index a2a7fa80f1..ecaaa738a7 100644
> ---
> a/meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysroot-base=
d-compiler-rt-search.patch
> +++
> b/meta/recipes-devtools/clang/clang/0033-Consolidate-and-fix-sysroot-base=
d-compiler-rt-search.patch
> @@ -1,7 +1,8 @@
> -From b818a92ac171e80e39ad9e99d1f862d23f2bb5b3 Mon Sep 17 00:00:00 2001
> +From 7da49a0e48fa77d38548f8f1dedc7cb1bb8dce53 Mon Sep 17 00:00:00 2001
>  From: "mark.yang" <mark.yang@lge.com>
>  Date: Tue, 14 Apr 2026 16:17:01 +0900
> -Subject: [PATCH] Consolidate and fix sysroot-based compiler-rt search
> paths
> +Subject: [PATCH] Consolidate and fix sysroot-based compiler-rt search
> + paths
>
>  Consolidate patches 0008 and 0033 into a single patch with a fix for
>  native builds.
> @@ -41,10 +42,10 @@ Signed-off-by: mark.yang <mark.yang@lge.com>
>   1 file changed, 28 insertions(+), 3 deletions(-)
>
>  diff --git a/clang/lib/Driver/ToolChain.cpp
> b/clang/lib/Driver/ToolChain.cpp
> -index 77a2c73f0..ac28b51c4 100644
> +index f894a06..eceada5 100644
>  --- a/clang/lib/Driver/ToolChain.cpp
>  +++ b/clang/lib/Driver/ToolChain.cpp
> -@@ -15,6 +15,7 @@
> +@@ -16,6 +16,7 @@
>   #include "ToolChains/InterfaceStubs.h"
>   #include "clang/Basic/ObjCRuntime.h"
>   #include "clang/Basic/Sanitizers.h"
> @@ -52,7 +53,7 @@ index 77a2c73f0..ac28b51c4 100644
>   #include "clang/Config/config.h"
>   #include "clang/Driver/Action.h"
>   #include "clang/Driver/CommonArgs.h"
> -@@ -723,7 +724,15 @@ StringRef ToolChain::getOSLibName() const {
> +@@ -872,7 +873,15 @@ StringRef ToolChain::getOSLibName() const {
>   }
>
>   std::string ToolChain::getCompilerRTPath() const {
> @@ -69,7 +70,7 @@ index 77a2c73f0..ac28b51c4 100644
>     if (isBareMetal()) {
>       llvm::sys::path::append(Path, "lib", getOSLibName());
>       if (!SelectedMultilibs.empty()) {
> -@@ -1021,7 +1030,15 @@ ToolChain::getTargetSubDirPath(StringRef BaseDir)
> const {
> +@@ -1179,7 +1188,15 @@ std::optional<std::string>
> ToolChain::getDefaultIntrinsicModuleDir() const {
>   }
>
>   std::optional<std::string> ToolChain::getRuntimePath() const {
> @@ -86,7 +87,7 @@ index 77a2c73f0..ac28b51c4 100644
>     llvm::sys::path::append(P, "lib");
>     if (auto Ret =3D getTargetSubDirPath(P))
>       return Ret;
> -@@ -1049,7 +1066,15 @@ ToolChain::path_list
> ToolChain::getArchSpecificLibPaths() const {
> +@@ -1207,7 +1224,15 @@ ToolChain::path_list
> ToolChain::getArchSpecificLibPaths() const {
>     path_list Paths;
>
>     auto AddPath =3D [&](const ArrayRef<StringRef> &SS) {
> diff --git
> a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.pat=
ch
> b/meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-test.pat=
ch
> similarity index 83%
> rename from
> meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
> rename to
> meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-test.patch
> index 9b4e29ff64..5e53d43944 100644
> ---
> a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.pat=
ch
> +++
> b/meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-test.pat=
ch
> @@ -1,3 +1,8 @@
> +From 9463b5d24fc62372fc2731d4d4665c64c72b55b2 Mon Sep 17 00:00:00 2001
> +From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +Date: Wed, 19 Aug 2026 22:46:10 +0530
> +Subject: [PATCH] guard clang-tools-extra test
> +
>  clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, whic=
h
>  exists in LLVM's CMake project but is not visible when Clang is built
>  separately. To run clang tests, disable clang-tools-extra tests for now.
> @@ -22,30 +27,49 @@ Without this patch when CLANG_INCLUDE_TESTS is ON got
> the following error
>
>  ------------------------------------------------------------------------=
-------
>
>  Upstream-Status: Inappropriate [OE-Specific]
> +
>  Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +---
> + clang-tools-extra/CMakeLists.txt                 | 4 ++--
> + clang-tools-extra/clangd/CMakeLists.txt          | 2 +-
> + clang-tools-extra/include-cleaner/CMakeLists.txt | 2 +-
> + 3 files changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/clang-tools-extra/CMakeLists.txt
> b/clang-tools-extra/CMakeLists.txt
> -index 6b6f2b1..26e4c10 100644
> +index 87050db..3824129 100644
>  --- a/clang-tools-extra/CMakeLists.txt
>  +++ b/clang-tools-extra/CMakeLists.txt
> -@@ -8,7 +8,7 @@ include(GNUInstallDirs)
> +@@ -8,7 +8,7 @@ option(CLANG_TIDY_ENABLE_STATIC_ANALYZER
>   option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS
>     "Enable query-based custom checks in clang-tidy" ON)
> -
> +
>  -if(CLANG_INCLUDE_TESTS)
>  +if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
>     umbrella_lit_testsuite_begin(check-clang-tools)
> -
> +
>     option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind=
"
> OFF)
>  @@ -45,7 +45,7 @@ if (CLANG_ENABLE_CLANGD)
>   endif()
> -
> +
>   # Add the common testsuite after all the tools.
>  -if(CLANG_INCLUDE_TESTS)
>  +if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
>     add_subdirectory(test)
>     add_subdirectory(unittests)
>     umbrella_lit_testsuite_end(check-clang-tools)
> +diff --git a/clang-tools-extra/clangd/CMakeLists.txt
> b/clang-tools-extra/clangd/CMakeLists.txt
> +index 890562d..c4d6623 100644
> +--- a/clang-tools-extra/clangd/CMakeLists.txt
> ++++ b/clang-tools-extra/clangd/CMakeLists.txt
> +@@ -217,7 +217,7 @@ endif()
> + option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
> + llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
> +
> +-if(CLANG_INCLUDE_TESTS)
> ++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
> +   add_subdirectory(test)
> +   add_subdirectory(unittests)
> + endif()
>  diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt
> b/clang-tools-extra/include-cleaner/CMakeLists.txt
>  index dc147f9..4855577 100644
>  --- a/clang-tools-extra/include-cleaner/CMakeLists.txt
> @@ -59,16 +83,3 @@ index dc147f9..4855577 100644
>     add_subdirectory(test)
>     add_subdirectory(unittests)
>   endif()
> -diff --git a/clang-tools-extra/clangd/CMakeLists.txt
> b/clang-tools-extra/clangd/CMakeLists.txt
> -index a1e9da4..94dcb96 100644
> ---- a/clang-tools-extra/clangd/CMakeLists.txt
> -+++ b/clang-tools-extra/clangd/CMakeLists.txt
> -@@ -215,7 +215,7 @@ endif()
> - option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
> - llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
> -
> --if(CLANG_INCLUDE_TESTS)
> -+if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
> -   add_subdirectory(test)
> -   add_subdirectory(unittests)
> - endif()
> diff --git
> a/meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-se=
arching-for-noreturn.patch
> b/meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-se=
arching-for-noreturn.patch
> deleted file mode 100644
> index 6021f736ff..0000000000
> ---
> a/meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-se=
arching-for-noreturn.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 051b3bfa1e0e5cfed4a02318e330b38b0090cc49 Mon Sep 17 00:00:00 2001
> -From: Serge Pavlov <sepavloff@gmail.com>
> -Date: Fri, 25 Jul 2025 13:35:19 +0700
> -Subject: [PATCH] Prevent revisiting block when searching for noreturn va=
rs
> -
> -When searching for noreturn variable initializations, do not visit CFG
> -blocks that are already visited, it prevents hanging  the analysis.
> -
> -It must fix https://github.com/llvm/llvm-project/issues/150336.
> -
> -Upstream-Status: Submitted [
> https://github.com/llvm/llvm-project/pull/150582]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - clang/test/SemaCXX/noreturn-vars.cpp | 17 +++++++++++++++++
> - 1 file changed, 17 insertions(+)
> -
> -diff --git a/clang/test/SemaCXX/noreturn-vars.cpp
> b/clang/test/SemaCXX/noreturn-vars.cpp
> -index ca65fcf5ca31..1bf074149f04 100644
> ---- a/clang/test/SemaCXX/noreturn-vars.cpp
> -+++ b/clang/test/SemaCXX/noreturn-vars.cpp
> -@@ -225,3 +225,20 @@ extern void abc_02(func_type *);
> -   abc_02(&func_ptr);
> -   func_ptr();
> - } // expected-warning {{function declared 'noreturn' should not return}=
}
> -+
> -+namespace Issue150336 {
> -+void free(void *);
> -+typedef void (*sel_freefunc)(void *);
> -+struct gmx_ana_selmethod_t {
> -+  sel_freefunc free;
> -+  int nparams;
> -+  int *param;
> -+};
> -+void gmx_selelem_free_method(struct gmx_ana_selmethod_t* method, void*
> mdata) {
> -+    sel_freefunc free_func =3D 0;
> -+    for (int i =3D 0; i < method->nparams; ++i)
> -+        free(&method->param[i]);
> -+    if (mdata && free_func)
> -+        free_func(mdata);
> -+}
> -+}
> diff --git
> a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x=
86-without-SSE2.patch
> b/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x=
86-without-SSE2.patch
> new file mode 100644
> index 0000000000..df35636055
> --- /dev/null
> +++
> b/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x=
86-without-SSE2.patch
> @@ -0,0 +1,36 @@
> +From: Sunil Dora <sunilkumar.dora@windriver.com>
> +Date: Fri, 29 Aug 2026 13:55:00 +0530
> +Subject: [PATCH] libc: Disable float16 on 32-bit x86 without SSE2
> +
> +GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 even though
> +_Float16 is only usable on x86-32 with SSE2 enabled. The float16
> +detection in float16-macros.h keys on that macro, so the shared f16
> +math headers are compiled on plain i686 and every use of _Float16
> +fails:
> +
> +  libc/src/__support/FPUtil/BasicOperations.h:63:67:
> +      error: SSE register return with SSE2 disabled
> +  libc/src/__support/math/acosf16.h:73:14:
> +      error: invalid conversion from type '_Float16' without option
> '-msse2'
> +
> +Since llvm/lib/Support/APFloat.cpp started including shared/math.h,
> +this breaks the LLVM build itself for 32-bit x86 baselines older than
> +SSE2 (e.g. -march=3Dpentiumpro), as used by Yocto/OpenEmbedded multilib.
> +
> +Require SSE2 on 32-bit x86 in the guard, matching the existing
> +exclusions for 32-bit Arm and RISC-V. Targets with SSE2 are unaffected.
> +
> +Upstream-Status: Backport [
> https://github.com/llvm/llvm-project/commit/05da143c63d333420b99eab198e1a=
89c97480929
> ]
> +Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> +---
> +--- a/libc/include/llvm-libc-macros/float16-macros.h   2026-08-29
> 13:55:04.771442947 +0530
> ++++ b/libc/include/llvm-libc-macros/float16-macros.h   2026-08-29
> 13:55:04.773991812 +0530
> +@@ -15,7 +15,7 @@
> +     (!defined(__GNUC__) || __GNUC__ >=3D 13 ||
>        \
> +      (defined(__clang__) && __clang_major__ >=3D 12)) &&
>        \
> +     !defined(__arm__) && !defined(_M_ARM) && !defined(__riscv) &&
>       \
> +-    !defined(_WIN32)
> ++    !defined(_WIN32) && (!defined(__i386__) || defined(__SSE2__))
> + #define LIBC_TYPES_HAS_FLOAT16
> +
> + // TODO: This would no longer be required if HdrGen let us guard functi=
on
> diff --git
> a/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elemen=
ts-of-OffloadArch-enum.patch
> b/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elemen=
ts-of-OffloadArch-enum.patch
> deleted file mode 100644
> index 493948acef..0000000000
> ---
> a/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elemen=
ts-of-OffloadArch-enum.patch
> +++ /dev/null
> @@ -1,274 +0,0 @@
> -From 82f18b02d9fec1bcc225a92251466ffee82f56b5 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 20 Mar 2026 14:22:17 -0700
> -Subject: [PATCH] [Clang] Rename UNUSED and UNKNOWN elements of
> OffloadArch enum to avoid
> - macro collisions
> -
> -OffloadArch uses enumerator named `UNUSED` `UNKNOWN`, which are common
> macro name
> -in external codebases (e.g. Mesa defines UNUSED as an attribute helper).
> If such
> -a macro is visible when including clang/Basic/OffloadArch.h, the
> preprocessor
> -expands the token inside the enum and breaks compilation of the installe=
d
> Clang
> -headers.
> -
> -Rename the enumerator to `Unused` and `Unknown` and update all in-tree
> references. This is a
> -spelling-only change (no behavioral impact) and mirrors the existing
> approach
> -used for SM_32_ to avoid macro clashes.
> -
> -Upstream-Status: Backport [
> https://github.com/llvm/llvm-project/commit/5bc3d1966b2d0b300c338d85bb38e=
356f0d12a8c
> ]
> -Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> -
> -diff --git a/clang/include/clang/Basic/OffloadArch.h
> b/clang/include/clang/Basic/OffloadArch.h
> -index ea665b1..970487c 100644
> ---- a/clang/include/clang/Basic/OffloadArch.h
> -+++ b/clang/include/clang/Basic/OffloadArch.h
> -@@ -16,8 +16,8 @@ class StringRef;
> - namespace clang {
> -
> - enum class OffloadArch {
> --  UNUSED,
> --  UNKNOWN,
> -+  Unused,
> -+  Unknown,
> -   // TODO: Deprecate and remove GPU architectures older than sm_52.
> -   SM_20,
> -   SM_21,
> -@@ -145,7 +145,7 @@ const char *OffloadArchToString(OffloadArch A);
> - const char *OffloadArchToVirtualArchString(OffloadArch A);
> -
> - // Convert a string to an OffloadArch enum value. Returns
> --// OffloadArch::UNKNOWN if the string is not recognized.
> -+// OffloadArch::Unknown if the string is not recognized.
> - OffloadArch StringToOffloadArch(llvm::StringRef S);
> -
> - } // namespace clang
> -diff --git a/clang/lib/Basic/Cuda.cpp b/clang/lib/Basic/Cuda.cpp
> -index 514fa2f..7884910 100644
> ---- a/clang/lib/Basic/Cuda.cpp
> -+++ b/clang/lib/Basic/Cuda.cpp
> -@@ -75,7 +75,7 @@ CudaVersion ToCudaVersion(llvm::VersionTuple Version) =
{
> - }
> -
> - CudaVersion MinVersionForOffloadArch(OffloadArch A) {
> --  if (A =3D=3D OffloadArch::UNKNOWN)
> -+  if (A =3D=3D OffloadArch::Unknown)
> -     return CudaVersion::UNKNOWN;
> -
> -   // AMD GPUs do not depend on CUDA versions.
> -@@ -141,7 +141,7 @@ CudaVersion MaxVersionForOffloadArch(OffloadArch A) =
{
> -     return CudaVersion::NEW;
> -
> -   switch (A) {
> --  case OffloadArch::UNKNOWN:
> -+  case OffloadArch::Unknown:
> -     return CudaVersion::UNKNOWN;
> -   case OffloadArch::SM_20:
> -   case OffloadArch::SM_21:
> -diff --git a/clang/lib/Basic/OffloadArch.cpp
> b/clang/lib/Basic/OffloadArch.cpp
> -index 05177f1..f3bbe64 100644
> ---- a/clang/lib/Basic/OffloadArch.cpp
> -+++ b/clang/lib/Basic/OffloadArch.cpp
> -@@ -17,7 +17,7 @@ struct OffloadArchToStringMap {
> - #define GFX(gpu) {OffloadArch::GFX##gpu, "gfx" #gpu, "compute_amdgcn"}
> - static const OffloadArchToStringMap ArchNames[] =3D {
> -     // clang-format off
> --    {OffloadArch::UNUSED, "", ""},
> -+    {OffloadArch::Unused, "", ""},
> -     SM(20), {OffloadArch::SM_21, "sm_21", "compute_20"}, // Fermi
> -     SM(30), {OffloadArch::SM_32_, "sm_32", "compute_32"}, SM(35),
> SM(37),  // Kepler
> -     SM(50), SM(52), SM(53),          // Maxwell
> -@@ -132,7 +132,7 @@ OffloadArch StringToOffloadArch(llvm::StringRef S) {
> -         return S =3D=3D Map.ArchName;
> -       });
> -   if (Result =3D=3D std::end(ArchNames))
> --    return OffloadArch::UNKNOWN;
> -+    return OffloadArch::Unknown;
> -   return Result->Arch;
> - }
> -
> -diff --git a/clang/lib/Basic/Targets/NVPTX.cpp
> b/clang/lib/Basic/Targets/NVPTX.cpp
> -index 6526eef..9584f8a 100644
> ---- a/clang/lib/Basic/Targets/NVPTX.cpp
> -+++ b/clang/lib/Basic/Targets/NVPTX.cpp
> -@@ -64,7 +64,7 @@ NVPTXTargetInfo::NVPTXTargetInfo(const llvm::Triple
> &Triple,
> -   // Define available target features
> -   // These must be defined in sorted order!
> -   NoAsmVariants =3D true;
> --  GPU =3D OffloadArch::UNUSED;
> -+  GPU =3D OffloadArch::Unused;
> -
> -   // PTX supports f16 as a fundamental type.
> -   HasFastHalfType =3D true;
> -diff --git a/clang/lib/Basic/Targets/NVPTX.h
> b/clang/lib/Basic/Targets/NVPTX.h
> -index 9bd0cc3..eeffb0e 100644
> ---- a/clang/lib/Basic/Targets/NVPTX.h
> -+++ b/clang/lib/Basic/Targets/NVPTX.h
> -@@ -87,7 +87,7 @@ public:
> -   initFeatureMap(llvm::StringMap<bool> &Features, DiagnosticsEngine
> &Diags,
> -                  StringRef CPU,
> -                  const std::vector<std::string> &FeaturesVec) const
> override {
> --    if (GPU !=3D OffloadArch::UNUSED)
> -+    if (GPU !=3D OffloadArch::Unused)
> -       Features[OffloadArchToString(GPU)] =3D true;
> -     // Only add PTX feature if explicitly requested. Otherwise, let the
> backend
> -     // use the minimum required PTX version for the target SM.
> -@@ -146,7 +146,7 @@ public:
> -   }
> -
> -   bool isValidCPUName(StringRef Name) const override {
> --    return StringToOffloadArch(Name) !=3D OffloadArch::UNKNOWN;
> -+    return StringToOffloadArch(Name) !=3D OffloadArch::Unknown;
> -   }
> -
> -   void fillValidCPUList(SmallVectorImpl<StringRef> &Values) const
> override {
> -@@ -157,7 +157,7 @@ public:
> -
> -   bool setCPU(const std::string &Name) override {
> -     GPU =3D StringToOffloadArch(Name);
> --    return GPU !=3D OffloadArch::UNKNOWN;
> -+    return GPU !=3D OffloadArch::Unknown;
> -   }
> -
> -   void setSupportedOpenCLOpts() override {
> -diff --git a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
> b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
> -index db0d56d..f78047d 100644
> ---- a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
> -+++ b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
> -@@ -2266,15 +2266,15 @@ bool
> CGOpenMPRuntimeGPU::hasAllocateAttributeForGlobalVar(const VarDecl *VD,
> - // Get current OffloadArch and ignore any unknown values
> - static OffloadArch getOffloadArch(CodeGenModule &CGM) {
> -   if (!CGM.getTarget().hasFeature("ptx"))
> --    return OffloadArch::UNKNOWN;
> -+    return OffloadArch::Unknown;
> -   for (const auto &Feature : CGM.getTarget().getTargetOpts().FeatureMap=
)
> {
> -     if (Feature.getValue()) {
> -       OffloadArch Arch =3D StringToOffloadArch(Feature.getKey());
> --      if (Arch !=3D OffloadArch::UNKNOWN)
> -+      if (Arch !=3D OffloadArch::Unknown)
> -         return Arch;
> -     }
> -   }
> --  return OffloadArch::UNKNOWN;
> -+  return OffloadArch::Unknown;
> - }
> -
> - /// Check to see if target architecture supports unified addressing
> which is
> -@@ -2382,8 +2382,8 @@ void
> CGOpenMPRuntimeGPU::processRequiresDirective(const OMPRequiresDecl *D) {
> -       case OffloadArch::Generic:
> -       case OffloadArch::GRANITERAPIDS:
> -       case OffloadArch::BMG_G21:
> --      case OffloadArch::UNUSED:
> --      case OffloadArch::UNKNOWN:
> -+      case OffloadArch::Unused:
> -+      case OffloadArch::Unknown:
> -         break;
> -       case OffloadArch::LAST:
> -         llvm_unreachable("Unexpected GPU arch.");
> -diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
> -index eb3f9cb..c8894a1 100644
> ---- a/clang/lib/Driver/Driver.cpp
> -+++ b/clang/lib/Driver/Driver.cpp
> -@@ -946,7 +946,7 @@ inferOffloadToolchains(Compilation &C,
> Action::OffloadKind Kind) {
> -   llvm::DenseSet<llvm::StringRef> Triples;
> -   for (llvm::StringRef Arch : Archs) {
> -     OffloadArch ID =3D StringToOffloadArch(Arch);
> --    if (ID =3D=3D OffloadArch::UNKNOWN)
> -+    if (ID =3D=3D OffloadArch::Unknown)
> -       ID =3D StringToOffloadArch(
> -           getProcessorFromTargetID(llvm::Triple("amdgcn-amd-amdhsa"),
> Arch));
> -
> -@@ -961,12 +961,12 @@ inferOffloadToolchains(Compilation &C,
> Action::OffloadKind Kind) {
> -       return llvm::DenseSet<llvm::StringRef>();
> -     }
> -     if (Kind =3D=3D Action::OFK_OpenMP &&
> --        (ID =3D=3D OffloadArch::UNKNOWN || ID =3D=3D OffloadArch::UNUSE=
D)) {
> -+        (ID =3D=3D OffloadArch::Unknown || ID =3D=3D OffloadArch::Unuse=
d)) {
> -
>  C.getDriver().Diag(clang::diag::err_drv_failed_to_deduce_target_from_arc=
h)
> -           << Arch;
> -       return llvm::DenseSet<llvm::StringRef>();
> -     }
> --    if (ID =3D=3D OffloadArch::UNKNOWN || ID =3D=3D OffloadArch::UNUSED=
) {
> -+    if (ID =3D=3D OffloadArch::Unknown || ID =3D=3D OffloadArch::Unused=
) {
> -       C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
> -           << "offload" << Arch;
> -       return llvm::DenseSet<llvm::StringRef>();
> -@@ -3305,7 +3305,7 @@ class OffloadingActionBuilder final {
> -     bool Relocatable =3D false;
> -
> -     /// Default GPU architecture if there's no one specified.
> --    OffloadArch DefaultOffloadArch =3D OffloadArch::UNKNOWN;
> -+    OffloadArch DefaultOffloadArch =3D OffloadArch::Unknown;
> -
> -     /// Compilation unit ID specified by option '-fuse-cuid=3D' or'-cui=
d=3D'.
> -     const CUIDOptions &CUIDOpts;
> -@@ -3407,7 +3407,7 @@ class OffloadingActionBuilder final {
> -
> -       // If we have a fat binary, add it to the list.
> -       if (CudaFatBinary) {
> --        AddTopLevel(CudaFatBinary, OffloadArch::UNUSED);
> -+        AddTopLevel(CudaFatBinary, OffloadArch::Unused);
> -         CudaDeviceActions.clear();
> -         CudaFatBinary =3D nullptr;
> -         return;
> -@@ -4669,12 +4669,12 @@ static StringRef
> getCanonicalArchString(Compilation &C,
> -   OffloadArch Arch =3D
> -       StringToOffloadArch(getProcessorFromTargetID(Triple, ArchStr));
> -   if (Triple.isNVPTX() &&
> --      (Arch =3D=3D OffloadArch::UNKNOWN || !IsNVIDIAOffloadArch(Arch)))=
 {
> -+      (Arch =3D=3D OffloadArch::Unknown || !IsNVIDIAOffloadArch(Arch)))=
 {
> -     C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
> -         << "CUDA" << ArchStr;
> -     return StringRef();
> -   } else if (Triple.isAMDGPU() &&
> --             (Arch =3D=3D OffloadArch::UNKNOWN || !IsAMDOffloadArch(Arc=
h))) {
> -+             (Arch =3D=3D OffloadArch::Unknown || !IsAMDOffloadArch(Arc=
h))) {
> -     C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
> -         << "HIP" << ArchStr;
> -     return StringRef();
> -diff --git a/clang/lib/Driver/OffloadBundler.cpp
> b/clang/lib/Driver/OffloadBundler.cpp
> -index f69ac41..6d446f2 100644
> ---- a/clang/lib/Driver/OffloadBundler.cpp
> -+++ b/clang/lib/Driver/OffloadBundler.cpp
> -@@ -95,7 +95,7 @@ OffloadTargetInfo::OffloadTargetInfo(const StringRef
> Target,
> -       Components.size() =3D=3D 6 ? Components.back() : "";
> -   StringRef TargetId =3D TargetIdWithFeature.split(':').first;
> -   if (!TargetId.empty() &&
> --      clang::StringToOffloadArch(TargetId) !=3D
> clang::OffloadArch::UNKNOWN)
> -+      clang::StringToOffloadArch(TargetId) !=3D
> clang::OffloadArch::Unknown)
> -     this->TargetID =3D TargetIdWithFeature;
> -   else
> -     this->TargetID =3D "";
> -diff --git a/clang/lib/Driver/ToolChains/Cuda.cpp
> b/clang/lib/Driver/ToolChains/Cuda.cpp
> -index 6cc73ff..d97b926 100644
> ---- a/clang/lib/Driver/ToolChains/Cuda.cpp
> -+++ b/clang/lib/Driver/ToolChains/Cuda.cpp
> -@@ -319,7 +319,7 @@ void CudaInstallationDetector::AddCudaIncludeArgs(
> -
> - void CudaInstallationDetector::CheckCudaVersionSupportsArch(
> -     OffloadArch Arch) const {
> --  if (Arch =3D=3D OffloadArch::UNKNOWN || Version =3D=3D CudaVersion::U=
NKNOWN ||
> -+  if (Arch =3D=3D OffloadArch::Unknown || Version =3D=3D CudaVersion::U=
NKNOWN ||
> -       ArchsWithBadVersion[(int)Arch])
> -     return;
> -
> -@@ -408,7 +408,7 @@ void NVPTX::Assembler::ConstructJob(Compilation &C,
> const JobAction &JA,
> -
> -   // Obtain architecture from the action.
> -   OffloadArch gpu_arch =3D StringToOffloadArch(GPUArchName);
> --  assert(gpu_arch !=3D OffloadArch::UNKNOWN &&
> -+  assert(gpu_arch !=3D OffloadArch::Unknown &&
> -          "Device action expected to have an architecture.");
> -
> -   // Check that our installation's ptxas supports gpu_arch.
> -diff --git a/clang/lib/Sema/SemaDeclAttr.cpp
> b/clang/lib/Sema/SemaDeclAttr.cpp
> -index 3f0ea5c..e6d3516 100644
> ---- a/clang/lib/Sema/SemaDeclAttr.cpp
> -+++ b/clang/lib/Sema/SemaDeclAttr.cpp
> -@@ -5732,7 +5732,7 @@ Sema::CreateLaunchBoundsAttr(const
> AttributeCommonInfo &CI, Expr *MaxThreads,
> -   if (MaxBlocks) {
> -     // '.maxclusterrank' ptx directive requires .target sm_90 or higher=
.
> -     auto SM =3D getOffloadArch(Context.getTargetInfo());
> --    if (SM =3D=3D OffloadArch::UNKNOWN || SM < OffloadArch::SM_90) {
> -+    if (SM =3D=3D OffloadArch::Unknown || SM < OffloadArch::SM_90) {
> -       Diag(MaxBlocks->getBeginLoc(),
> diag::warn_cuda_maxclusterrank_sm_90)
> -           << OffloadArchToString(SM) << CI <<
> MaxBlocks->getSourceRange();
> -       // Ignore it by setting MaxBlocks to null;
> diff --git
> a/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_f=
rame-in-cxa_personal.patch
> b/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_f=
rame-in-cxa_personal.patch
> deleted file mode 100644
> index f458fd0cf8..0000000000
> ---
> a/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_f=
rame-in-cxa_personal.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 5dbd0a05f64a43849a7edde95a0e5f2323cd1f9d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <khem.raj@oss.qualcomm.com>
> -Date: Tue, 31 Mar 2026 19:33:29 -0700
> -Subject: [PATCH] libcxxabi: declare __gnu_unwind_frame in cxa_personalit=
y
> -
> -ARM EHABI builds of libcxxabi fail with clang-22+ because
> -cxa_personality.cpp calls __gnu_unwind_frame without a visible
> -declaration, triggering:
> -
> -  error: use of undeclared identifier '__gnu_unwind_frame'
> -
> -Add an extern "C" forward declaration before the EHABI unwind helper
> -so the source compiles correctly.
> -
> -Upstream-Status: Submitted [
> https://github.com/llvm/llvm-project/pull/189787]
> -Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ----
> - libcxxabi/src/cxa_personality.cpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/libcxxabi/src/cxa_personality.cpp
> b/libcxxabi/src/cxa_personality.cpp
> -index 35f4e3807724..ddff277cc7b8 100644
> ---- a/libcxxabi/src/cxa_personality.cpp
> -+++ b/libcxxabi/src/cxa_personality.cpp
> -@@ -1116,6 +1116,8 @@ __gxx_personality_seh0(PEXCEPTION_RECORD ms_exc,
> void *this_frame,
> -
> - #else
> -
> -+extern "C" _Unwind_Reason_Code __gnu_unwind_frame(_Unwind_Exception*,
> -+                                                  _Unwind_Context*);
> - // Helper function to unwind one frame.
> - // ARM EHABI 7.3 and 7.4: If the personality function returns
> _URC_CONTINUE_UNWIND, the
> - // personality routine should update the virtual register set (VRS)
> according to the
> diff --git
> a/meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit-fold-can=
didates-in-determini.patch
> b/meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit-fold-can=
didates-in-determini.patch
> deleted file mode 100644
> index 39e27ac12f..0000000000
> ---
> a/meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit-fold-can=
didates-in-determini.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 965f9d87adb0a7376454374fbc140ab69bd796a9 Mon Sep 17 00:00:00 2001
> -From: Florian Hahn <flo@fhahn.com>
> -Date: Fri, 27 Mar 2026 13:02:51 +0000
> -Subject: [PATCH] [LoopUnroll] Use MapVector for deterministic iteration
> order.
> - (#188821)
> -
> -NonLoopBlocksIDom determines the order we adjust the DT, impacting DRT
> -child ordering.
> -
> -Similarly, ExitInfos order impacts the order of SetDest, which applies
> -DT updates.
> -
> -The order impacts collectChildrenInLoop, which in turn impacts the we
> -process BBs in LICM. And this in turn impacts the order in which we
> -perform alias queries.
> -
> -If the order is not deterministic, we sometimes get different NumNoAlias
> -statistic counts, and possibly also different IR, although I have not
> -confirmed the latter.
> -
> -Upstream-Status: Backport [
> https://github.com/llvm/llvm-project/commit/965f9d87adb0a7376454374fbc140=
ab69bd796a9
> ]
> -Signed-off-by: Sunilkumar Dora <sunilkumar.dora@windriver.com>
> -Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> -
> ----
> - llvm/lib/Transforms/Utils/LoopPeel.cpp   | 3 ++-
> - llvm/lib/Transforms/Utils/LoopUnroll.cpp | 3 ++-
> - 2 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/llvm/lib/Transforms/Utils/LoopPeel.cpp
> b/llvm/lib/Transforms/Utils/LoopPeel.cpp
> -index 91737b5c30533..4c67d5a9ae680 100644
> ---- a/llvm/lib/Transforms/Utils/LoopPeel.cpp
> -+++ b/llvm/lib/Transforms/Utils/LoopPeel.cpp
> -@@ -11,6 +11,7 @@
> -
> - #include "llvm/Transforms/Utils/LoopPeel.h"
> - #include "llvm/ADT/DenseMap.h"
> -+#include "llvm/ADT/MapVector.h"
> - #include "llvm/ADT/SmallVector.h"
> - #include "llvm/ADT/Statistic.h"
> - #include "llvm/Analysis/Loads.h"
> -@@ -1121,7 +1122,7 @@ void llvm::peelLoop(Loop *L, unsigned PeelCount,
> bool PeelLast, LoopInfo *LI,
> -   // later. Immediate dominator of such block might change, because we
> add more
> -   // routes which can lead to the exit: we can reach it from the peeled
> -   // iterations too.
> --  DenseMap<BasicBlock *, BasicBlock *> NonLoopBlocksIDom;
> -+  MapVector<BasicBlock *, BasicBlock *> NonLoopBlocksIDom;
> -   for (auto *BB : L->blocks()) {
> -     auto *BBDomNode =3D DT.getNode(BB);
> -     SmallVector<BasicBlock *, 16> ChildrenToUpdate;
> -diff --git a/llvm/lib/Transforms/Utils/LoopUnroll.cpp
> b/llvm/lib/Transforms/Utils/LoopUnroll.cpp
> -index 6a2ccbea996bf..ab35d217f0d93 100644
> ---- a/llvm/lib/Transforms/Utils/LoopUnroll.cpp
> -+++ b/llvm/lib/Transforms/Utils/LoopUnroll.cpp
> -@@ -17,6 +17,7 @@
> -
> - #include "llvm/ADT/ArrayRef.h"
> - #include "llvm/ADT/DenseMap.h"
> -+#include "llvm/ADT/MapVector.h"
> - #include "llvm/ADT/STLExtras.h"
> - #include "llvm/ADT/ScopedHashTable.h"
> - #include "llvm/ADT/SetVector.h"
> -@@ -515,7 +516,7 @@ llvm::UnrollLoop(Loop *L, UnrollLoopOptions ULO,
> LoopInfo *LI,
> -     BasicBlock *FirstExitingBlock =3D nullptr;
> -     SmallVector<BasicBlock *> ExitingBlocks;
> -   };
> --  DenseMap<BasicBlock *, ExitInfo> ExitInfos;
> -+  MapVector<BasicBlock *, ExitInfo> ExitInfos;
> -   SmallVector<BasicBlock *, 4> ExitingBlocks;
> -   L->getExitingBlocks(ExitingBlocks);
> -   for (auto *ExitingBlock : ExitingBlocks) {
> diff --git a/meta/recipes-devtools/clang/common-clang.inc
> b/meta/recipes-devtools/clang/common-clang.inc
> index 9018094419 <(901)%20809-4419>..5d571e5fce 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -3,9 +3,9 @@ LLVM_DIR =3D "llvm${LLVM_RELEASE}"
>
>  LLVM_HTTP ?=3D "https://github.com/llvm"
>
> -MAJOR_VER =3D "22"
> +MAJOR_VER =3D "23"
>  MINOR_VER =3D "1"
> -PATCH_VER =3D "8"
> +PATCH_VER =3D "0"
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> diff --git a/meta/recipes-devtools/clang/common.inc
> b/meta/recipes-devtools/clang/common.inc
> index e1e03872cd..0ca6951ff4 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,51 +17,45 @@ BASEURI ?=3D
> "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
>  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] =3D
> "922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888"
> +SRC_URI[sha256sum] =3D
> "ab1f0e3ec52448c33e8782eaf0422504b87c7b016b22514653ee0d8fcee479ff"
>
>  SRC_URI =3D "\
>      ${BASEURI} \
> -
> file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch \
> -    file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
> -
> file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch \
> -    file://0004-llvm-allow-env-override-of-exe-and-libdir-path.patch \
> -    file://0005-clang-driver-Check-sysroot-for-ldso-path.patch \
> -    file://0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch =
\
> -    file://0007-clang-Prepend-trailing-to-sysroot.patch \
> -    file://0009-clang-Define-releative-gcc-installation-dir.patch \
> -
> file://0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch \
> -    file://0011-Check-for-atomic-double-intrinsics.patch \
> -    file://0012-cmake-Fix-configure-for-packages-using-find_package.patc=
h
> \
> -
> file://0013-clang-Fix-resource-dir-location-for-cross-toolchains.patch \
> -
> file://0014-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch \
> -    file://0015-clang-Use-python3-in-python-scripts.patch \
> -
> file://0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch \
> -
> file://0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \
> -
> file://0018-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch \
> -    file://0019-libunwind-Added-unw_backtrace-method.patch \
> -    file://0020-lldb-Link-with-libatomic-on-x86.patch \
> -    file://0021-compiler-rt-Enable-__int128-for-ppc32.patch \
> -    file://0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
> -    file://0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
> -    file://0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch=
 \
> -    file://0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch =
\
> -    file://0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
> -
> file://0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
> -    file://0028-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
> -
> file://0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
> -    file://0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patc=
h
> \
> -
> file://0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
> -
> file://0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
> -
> file://0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
> -
> file://0035-Prevent-revisiting-block-when-searching-for-noreturn.patch \
> -
> file://0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch \
> -
> file://0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch \
> -
> file://0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
> -
> file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch =
\
> -
> file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
> -
> file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
> -    file://0042-guard-clang-tools-extra-test.patch \
> -
> file://0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch \
> +
> file://0001-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch \
> +    file://0002-llvm-allow-env-override-of-exe-and-libdir-path.patch \
> +    file://0003-clang-driver-Check-sysroot-for-ldso-path.patch \
> +    file://0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch =
\
> +    file://0005-clang-Prepend-trailing-to-sysroot.patch \
> +    file://0006-clang-Define-releative-gcc-installation-dir.patch \
> +
> file://0007-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch \
> +    file://0008-Check-for-atomic-double-intrinsics.patch \
> +    file://0009-cmake-Fix-configure-for-packages-using-find_package.patc=
h
> \
> +
> file://0010-clang-Fix-resource-dir-location-for-cross-toolchains.patch \
> +
> file://0011-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch \
> +    file://0012-clang-Use-python3-in-python-scripts.patch \
> +
> file://0013-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch \
> +
> file://0014-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch \
> +    file://0015-libunwind-Added-unw_backtrace-method.patch \
> +    file://0016-lldb-Link-with-libatomic-on-x86.patch \
> +    file://0017-compiler-rt-Enable-__int128-for-ppc32.patch \
> +    file://0018-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
> +    file://0019-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
> +    file://0020-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch=
 \
> +    file://0021-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch =
\
> +    file://0022-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
> +
> file://0023-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
> +    file://0024-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
> +
> file://0025-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
> +    file://0026-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patc=
h
> \
> +
> file://0027-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
> +    file://0028-Hardcode-uptr-sptr-typedefs-on-Mips-Linux.patch \
> +
> file://0029-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
> +
> file://0030-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch \
> +    file://0031-Only-build-clang-tblgen-if-it-is-actually-needed.patch \
> +
> file://0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
> +
> file://0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
> +    file://0034-guard-clang-tools-extra-test.patch \
> +    file://0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch \
>  "
>  # Fallback to no-PIE if not set
>  GCCPIE ??=3D ""
> --
> 2.43.0
>
>

--000000000000f2ca75065a4907cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 30,=
 2026 at 5:59=E2=80=AFAM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.co=
m">sunilkumar.dora@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Sunil Dora &lt;<a href=3D"mailto:sun=
ilkumar.dora@windriver.com" target=3D"_blank">sunilkumar.dora@windriver.com=
</a>&gt;<br>
<br>
Rebase the OE patch stack from 22.1.8 onto the 23.x release branch.<br>
<br>
Dropped, the fix is already in 23.1.0:<br>
=C2=A0 compiler-rt: do not use backtrace APIs on non-glibc linux<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/llvm/llvm-project/commit/252ad2=
052409" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-p=
roject/commit/252ad2052409</a><br>
=C2=A0 Rename UNUSED and UNKNOWN elements of OffloadArch enum<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/llvm/llvm-project/commit/82f18b=
02d9fe" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-p=
roject/commit/82f18b02d9fe</a><br>
=C2=A0 libcxxabi: declare __gnu_unwind_frame in cxa_personality<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/llvm/llvm-project/commit/8119f1=
854948" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-p=
roject/commit/8119f1854948</a><br>
=C2=A0 LoopUnroll: iterate exit fold candidates in deterministic order<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/llvm/llvm-project/commit/965f9d=
87adb0" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-p=
roject/commit/965f9d87adb0</a><br>
=C2=A0 Prevent revisiting block when searching for noreturn<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/llvm/llvm-project/commit/330b40=
e11fd2" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-p=
roject/commit/330b40e11fd2</a><br>
<br>
Dropped, obsolete:<br>
=C2=A0 libcxxabi: find libunwind headers when LIBCXXABI_LIBUNWIND_INCLUDES<=
br>
=C2=A0 =C2=A0 (cmake&#39;s find_path now searches the user-supplied path fi=
rst)<br>
=C2=A0 compiler-rt: support a new embedded linux target<br>
=C2=A0 =C2=A0 (only added files for the long-removed Makefile build system)=
<br>
<br>
Reworked for the TripleName.def triple string tables added in 23:<br>
=C2=A0 llvm/clang: insert anchor for adding OE distro vendor<br>
=C2=A0 clang/llvm: add OE specific ABI triple for N32 ABI<br>
<br>
Reworked for the restructured powerpc source lists in compiler-rt:<br>
=C2=A0 compiler-rt: enable __int128 for ppc32<br>
<br>
Newly carried, already merged in LLVM main:<br>
=C2=A0 libc: disable float16 on 32-bit x86 without SSE2<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/llvm/llvm-project/commit/05da14=
3c63d3" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-p=
roject/commit/05da143c63d3</a><br>
<br>
GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 without SSE2,<br>
so the llvm-libc float16 headers that APFloat.cpp now includes fail<br>
to build for 32-bit x86 multilib (&quot;SSE register return with SSE2<br>
disabled&quot;) without that last patch.<br>
<br>
Release notes: <a href=3D"https://releases.llvm.org/23.1.0/docs/ReleaseNote=
s.html" rel=3D"noreferrer" target=3D"_blank">https://releases.llvm.org/23.1=
.0/docs/ReleaseNotes.html</a><br>
<br>
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...ify-cross-compilation.-Don-t-use-na.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0...ibunwind-headers-when-LIBCXXABI_LIBU.patch |=C2=A0 60 ----<br>
=C2=A0...-support-a-new-embedded-linux-target.patch | 309 -----------------=
-<br>
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
=C2=A0...-anchor-for-adding-OE-distro-vendor.patch} |=C2=A0 37 +--<br>
=C2=A0...ple-for-non-debian-multiarch-linux-.patch} |=C2=A0 =C2=A09 +-<br>
=C2=A0...ibunwind-Added-unw_backtrace-method.patch} |=C2=A0 =C2=A08 +-<br>
=C2=A0...016-lldb-Link-with-libatomic-on-x86.patch} |=C2=A0 =C2=A04 +-<br>
=C2=A0...ot-use-backtrace-APIs-on-non-glibc-l.patch |=C2=A0 68 ----<br>
=C2=A0...mpiler-rt-Enable-__int128-for-ppc32.patch} |=C2=A0 26 +-<br>
=C2=A0...t-use-cmake-infra-to-detect-libzstd.patch} |=C2=A0 =C2=A08 +-<br>
=C2=A0...-Fix-stat-struct-s-size-for-O32-ABI.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0...cpp-ARMLibDirs-search-also-in-lib32.patch} |=C2=A0 10 +-<br>
=C2=A0...-OE-specific-ABI-triple-for-N32-ABI.patch} |=C2=A0 63 ++--<br>
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
=C2=A0...&gt; 0034-guard-clang-tools-extra-test.patch} |=C2=A0 47 ++-<br>
=C2=A0...ng-block-when-searching-for-noreturn.patch |=C2=A0 41 ---<br>
=C2=A0...e-float16-on-32-bit-x86-without-SSE2.patch |=C2=A0 36 ++<br>
=C2=A0...UNKNOWN-elements-of-OffloadArch-enum.patch | 274 ----------------<=
br>
=C2=A0...e-__gnu_unwind_frame-in-cxa_personal.patch |=C2=A0 33 --<br>
=C2=A0...te-exit-fold-candidates-in-determini.patch |=C2=A0 71 ----<br>
=C2=A0meta/recipes-devtools/clang/common-clang.inc=C2=A0 |=C2=A0 =C2=A04 +-=
<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 78 ++---<br>
=C2=A045 files changed, 302 insertions(+), 1102 deletions(-)<br>
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
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 2966cddc05..dde6821718 100644<br>
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
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.8 =3D &quot;Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-llvm-project-source-23.1.0 =3D &quot;Khem Raj &lt;<a =
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
diff --git a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cr=
oss-compilation.-Don-t-use-na.patch b/meta/recipes-devtools/clang/clang/000=
1-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch<br>
similarity index 90%<br>
rename from meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cro=
ss-compilation.-Don-t-use-na.patch<br>
rename to meta/recipes-devtools/clang/clang/0001-compiler-rt-Simplify-cross=
-compilation.-Don-t-use-na.patch<br>
index 896bbd11aa..4684fff493 100644<br>
--- a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-com=
pilation.-Don-t-use-na.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0001-compiler-rt-Simplify-cross-com=
pilation.-Don-t-use-na.patch<br>
@@ -1,4 +1,4 @@<br>
-From 16b03fccab20cac13065ab99f36a7f0a77a62b92 Mon Sep 17 00:00:00 2001<br>
+From 09798ecb4d4c7f1372e7538666bf9c5199f7ab04 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 19 May 2016 23:11:45 -0700<br>
=C2=A0Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don&#39;t u=
se<br>
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 10 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt<=
br>
-index a92258ae1244..98c4e9a681d5 100644<br>
+index d720b86..60ac56f 100644<br>
=C2=A0--- a/compiler-rt/CMakeLists.txt<br>
=C2=A0+++ b/compiler-rt/CMakeLists.txt<br>
-@@ -109,7 +109,16 @@ if (COMPILER_RT_STANDALONE_BUILD)<br>
+@@ -125,7 +125,16 @@ if (COMPILER_RT_STANDALONE_BUILD)<br>
=C2=A0 =C2=A0 set(CMAKE_CXX_EXTENSIONS NO)<br>
<br>
=C2=A0 =C2=A0 if (NOT LLVM_RUNTIMES_BUILD)<br>
diff --git a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwin=
d-headers-when-LIBCXXABI_LIBU.patch b/meta/recipes-devtools/clang/clang/000=
1-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch<br>
deleted file mode 100644<br>
index 43221274bf..0000000000<br>
--- a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-heade=
rs-when-LIBCXXABI_LIBU.patch<br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-From 97247b6a1df63a5f930d090a3952876eb67cf6fb Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sun, 27 Aug 2017 10:37:49 -0700<br>
-Subject: [PATCH] libcxxabi: Find libunwind headers when<br>
- LIBCXXABI_LIBUNWIND_INCLUDES is set<br>
-<br>
-Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake arguments<br=
>
-then it ends up not searching the specified dir and unwind.h is not found<=
br>
-especially for ARM targets<br>
-<br>
-This patch makes the searching synthesized directories and then set<br>
-LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- libcxxabi/CMakeLists.txt | 15 ++++++++++-----<br>
- 1 file changed, 10 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt<br>
-index 2b67c5972339..45d84b404b30 100644<br>
---- a/libcxxabi/CMakeLists.txt<br>
-+++ b/libcxxabi/CMakeLists.txt<br>
-@@ -476,7 +476,7 @@ set(LIBCXXABI_LIBUNWIND_PATH &quot;${LIBCXXABI_LIBUNWI=
ND_PATH}&quot; CACHE PATH<br>
-=C2=A0 =C2=A0 =C2=A0&quot;Specify path to libunwind source.&quot; FORCE)<b=
r>
- <br>
- if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)<br>
--=C2=A0 find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwind.h<br>
-+=C2=A0 find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h<br>
-=C2=A0 =C2=A0 =C2=A0PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${LIBCXXABI_LIBUNWIND_PATH}/inclu=
de<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CMAKE_BINARY_DIR}/${LIBCXXABI_L=
IBUNWIND_INCLUDES}<br>
-@@ -487,18 +487,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH =
MATCHES ARM)<br>
-=C2=A0 =C2=A0 =C2=A0NO_CMAKE_FIND_ROOT_PATH<br>
-=C2=A0 =C2=A0)<br>
- <br>
--=C2=A0 if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL &quot;LIBCXXABI=
_LIBUNWIND_INCLUDES_INTERNAL-NOTFOUND&quot;)<br>
--=C2=A0 =C2=A0 set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL &quot;&quot;)<br>
-+=C2=A0 if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL &quot;LIBCXXABI_LIBUNWIN=
D_INCLUDES-NOTFOUND&quot;)<br>
-+=C2=A0 =C2=A0 set(LIBCXXABI_LIBUNWIND_INCLUDES &quot;&quot;)<br>
-=C2=A0 =C2=A0endif()<br>
- endif()<br>
- <br>
--if (NOT &quot;${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}&quot; STREQUAL &qu=
ot;&quot;)<br>
--=C2=A0 include_directories(&quot;${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}=
&quot;)<br>
-+if (NOT &quot;${LIBCXXABI_LIBUNWIND_INCLUDES}&quot; STREQUAL &quot;&quot;=
)<br>
-+=C2=A0 include_directories(&quot;${LIBCXXABI_LIBUNWIND_INCLUDES}&quot;)<b=
r>
- endif()<br>
- <br>
- add_custom_target(cxxabi-test-depends<br>
-=C2=A0 =C2=A0COMMENT &quot;Build dependencies required to run the libc++ab=
i test suite.&quot;)<br>
- <br>
-+set(LIBCXXABI_LIBUNWIND_INCLUDES &quot;${LIBCXXABI_LIBUNWIND_INCLUDES}&qu=
ot; CACHE PATH<br>
-+=C2=A0 =C2=A0 &quot;Specify path to libunwind includes.&quot; FORCE)<br>
-+set(LIBCXXABI_LIBUNWIND_PATH &quot;${LIBCXXABI_LIBUNWIND_PATH}&quot; CACH=
E PATH<br>
-+=C2=A0 =C2=A0 &quot;Specify path to libunwind source.&quot; FORCE)<br>
-+<br>
- # Add source code. This also contains all of the logic for deciding linke=
r flags<br>
- # soname, etc...<br>
- add_subdirectory(include)<br>
diff --git a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-n=
ew-embedded-linux-target.patch b/meta/recipes-devtools/clang/clang/0002-com=
piler-rt-support-a-new-embedded-linux-target.patch<br>
deleted file mode 100644<br>
index 5dcad6b0df..0000000000<br>
--- a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embe=
dded-linux-target.patch<br>
+++ /dev/null<br>
@@ -1,309 +0,0 @@<br>
-From eae63772aacba29de729d9af5c52542cd8a043ee Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sun, 19 Apr 2015 15:16:23 -0700<br>
-Subject: [PATCH] compiler-rt: support a new embedded linux target<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- .../make/platform/<a href=3D"http://clang_linux_embedded.mk" rel=3D"noref=
errer" target=3D"_blank">clang_linux_embedded.mk</a>=C2=A0 =C2=A0 =C2=A0| 2=
86 ++++++++++++++++++<br>
- .../clang_linux_embedded_test_input.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
- 2 files changed, 286 insertions(+)<br>
- create mode 100644 compiler-rt/make/platform/<a href=3D"http://clang_linu=
x_embedded.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk=
</a><br>
- create mode 100644 compiler-rt/make/platform/clang_linux_embedded_test_in=
put.c<br>
-<br>
-diff --git a/compiler-rt/make/platform/<a href=3D"http://clang_linux_embed=
ded.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a> b/=
compiler-rt/make/platform/<a href=3D"http://clang_linux_embedded.mk" rel=3D=
"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a><br>
-new file mode 100644<br>
-index 000000000000..d0a890075a1c<br>
---- /dev/null<br>
-+++ b/compiler-rt/make/platform/<a href=3D"http://clang_linux_embedded.mk"=
 rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a><br>
-@@ -0,0 +1,286 @@<br>
-+# These are the functions which clang needs when it is targeting a previo=
us<br>
-+# version of the OS. The issue is that the backend may use functions whic=
h were<br>
-+# not present in the libgcc that shipped on the platform. In such cases, =
we link<br>
-+# with a version of the library which contains private_extern definitions=
 of all<br>
-+# the extra functions which might be referenced.<br>
-+<br>
-+Description :=3D Static runtime libraries for embedded clang/Linux<br>
-+<br>
-+# A function that ensures we don&#39;t try to build for architectures tha=
t we<br>
-+# don&#39;t have working toolchains for.<br>
-+CheckArches =3D \<br>
-+=C2=A0 $(shell \<br>
-+=C2=A0 =C2=A0 result=3D&quot;&quot;; \<br>
-+=C2=A0 =C2=A0 for arch in $(1); do \<br>
-+=C2=A0 =C2=A0 =C2=A0 if $(CC) -arch $$arch -c \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -integrated-as \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(ProjSrcRoot)/make/platform/clang_linux_embe=
dded_test_input.c \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -o /dev/null &gt; /dev/null 2&gt; /dev/null; =
then \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result=3D&quot;$$result$$arch &quot;; \<br>
-+=C2=A0 =C2=A0 =C2=A0 else \<br>
-+=C2=A0 =C2=A0 =C2=A0 printf 1&gt;&amp;2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;warning: <a href=3D"http://clang_linux_=
embedded.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</=
a>: dropping arch &#39;$$arch&#39; from lib &#39;$(2)&#39;\n&quot;; \<br>
-+=C2=A0 =C2=A0 =C2=A0 fi; \<br>
-+=C2=A0 =C2=A0 done; \<br>
-+=C2=A0 =C2=A0 echo $$result)<br>
-+<br>
-+XCRun =3D \<br>
-+=C2=A0 $(shell \<br>
-+=C2=A0 =C2=A0 result=3D`xcrun -find $(1) 2&gt; /dev/null`; \<br>
-+=C2=A0 =C2=A0 if [ &quot;$$?&quot; !=3D &quot;0&quot; ]; then result=3D$(=
1); fi; \<br>
-+=C2=A0 =C2=A0 echo $$result)<br>
-+<br>
-+###<br>
-+<br>
-+CC=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D $(call XCRun,clang)<br>
-+AR=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D $(call XCRun,ar)<br>
-+RANLIB=C2=A0 =C2=A0:=3D $(call XCRun,ranlib)<br>
-+STRIP=C2=A0 =C2=A0 :=3D $(call XCRun,strip)<br>
-+LIPO=C2=A0 =C2=A0 =C2=A0:=3D $(call XCRun,lipo)<br>
-+DSYMUTIL :=3D $(call XCRun,dsymutil)<br>
-+Configs :=3D<br>
-+UniversalArchs :=3D<br>
-+<br>
-+# Soft-float version of the runtime. No floating-point instructions will =
be used<br>
-+# and the ABI (out of necessity) passes floating values in normal registe=
rs:<br>
-+# non-VFP variant of the AAPCS.<br>
-+UniversalArchs.soft_static :=3D $(call CheckArches,arm armv7m armv7em arm=
v7,soft_static)<br>
-+Configs +=3D $(if $(UniversalArchs.soft_static),soft_static)<br>
-+<br>
-+# Hard-float version of the runtime. On ARM VFP instructions and register=
s are<br>
-+# allowed, and floating point values get passed in them. VFP variant of t=
he<br>
-+# AAPCS.<br>
-+UniversalArchs.hard_static :=3D $(call CheckArches,armv7em armv7 i386 x86=
_64,hard_static)<br>
-+Configs +=3D $(if $(UniversalArchs.hard_static),hard_static)<br>
-+<br>
-+UniversalArchs.soft_pic :=3D $(call CheckArches,armv6m armv7m armv7em arm=
v7,soft_pic)<br>
-+Configs +=3D $(if $(UniversalArchs.soft_pic),soft_pic)<br>
-+<br>
-+UniversalArchs.hard_pic :=3D $(call CheckArches,armv7em armv7 i386 x86_64=
,hard_pic)<br>
-+Configs +=3D $(if $(UniversalArchs.hard_pic),hard_pic)<br>
-+<br>
-+CFLAGS :=3D -Wall -Werror -Oz -fomit-frame-pointer -ffreestanding<br>
-+<br>
-+PIC_CFLAGS :=3D -fPIC<br>
-+STATIC_CFLAGS :=3D -static<br>
-+<br>
-+CFLAGS_SOFT :=3D -mfloat-abi=3Dsoft<br>
-+CFLAGS_HARD :=3D -mfloat-abi=3Dhard<br>
-+<br>
-+CFLAGS_I386=C2=A0 :=3D -march=3Dpentium<br>
-+<br>
-+CFLAGS.soft_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOFT)<br>
-+CFLAGS.hard_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HARD)<br>
-+CFLAGS.soft_pic=C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_SOFT)<=
br>
-+CFLAGS.hard_pic=C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_HARD)<=
br>
-+<br>
-+CFLAGS.soft_static.armv7 :=3D $(CFLAGS.soft_static) $(CFLAGS_ARMV7)<br>
-+CFLAGS.hard_static.armv7 :=3D $(CFLAGS.hard_static) $(CFLAGS_ARMV7)<br>
-+CFLAGS.soft_pic.armv7=C2=A0 =C2=A0 :=3D $(CFLAGS.soft_pic) $(CFLAGS_ARMV7=
)<br>
-+CFLAGS.hard_pic.armv7=C2=A0 =C2=A0 :=3D $(CFLAGS.hard_pic) $(CFLAGS_ARMV7=
)<br>
-+<br>
-+# x86 platforms ignore -mfloat-abi options and complain about doing so. D=
espite<br>
-+# this they&#39;re hard-float.<br>
-+CFLAGS.hard_static.i386=C2=A0 =C2=A0:=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFL=
AGS_I386)<br>
-+CFLAGS.hard_pic.i386=C2=A0 =C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS) $(C=
FLAGS_I386)<br>
-+CFLAGS.hard_static.x86_64 :=3D $(CFLAGS) $(STATIC_CFLAGS)<br>
-+CFLAGS.hard_pic.x86_64=C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS)<br>
-+<br>
-+# Functions not wanted:<br>
-+#=C2=A0 =C2=A0+ eprintf is obsolete anyway<br>
-+#=C2=A0 =C2=A0+ *vfp: designed for Thumb1 CPUs with VFPv2<br>
-+<br>
-+COMMON_FUNCTIONS :=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 absvdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 absvsi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 addvdi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 addvsi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 ashldi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 ashrdi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 bswapdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 bswapsi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 clzdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 clzsi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 cmpdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 ctzdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 ctzsi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 divdc3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 divdi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 divsc3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 divmodsi4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 udivmodsi4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 do_global_dtors \<br>
-+=C2=A0 =C2=A0 =C2=A0 ffsdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 fixdfdi \<br>
-+=C2=A0 =C2=A0 =C2=A0 fixsfdi \<br>
-+=C2=A0 =C2=A0 =C2=A0 fixunsdfdi \<br>
-+=C2=A0 =C2=A0 =C2=A0 fixunsdfsi \<br>
-+=C2=A0 =C2=A0 =C2=A0 fixunssfdi \<br>
-+=C2=A0 =C2=A0 =C2=A0 fixunssfsi \<br>
-+=C2=A0 =C2=A0 =C2=A0 floatdidf \<br>
-+=C2=A0 =C2=A0 =C2=A0 floatdisf \<br>
-+=C2=A0 =C2=A0 =C2=A0 floatundidf \<br>
-+=C2=A0 =C2=A0 =C2=A0 floatundisf \<br>
-+=C2=A0 =C2=A0 =C2=A0 gcc_bcmp \<br>
-+=C2=A0 =C2=A0 =C2=A0 lshrdi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 moddi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 muldc3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 muldi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 mulsc3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 mulvdi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 mulvsi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 negdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 negvdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 negvsi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 paritydi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 paritysi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 popcountdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 popcountsi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 powidf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 powisf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 subvdi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 subvsi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 ucmpdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 udiv_w_sdiv \<br>
-+=C2=A0 =C2=A0 =C2=A0 udivdi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 udivmoddi4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 umoddi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 adddf3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 addsf3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 cmpdf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 cmpsf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 div0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 divdf3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 divsf3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 divsi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 extendsfdf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 ffssi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 fixdfsi \<br>
-+=C2=A0 =C2=A0 =C2=A0 fixsfsi \<br>
-+=C2=A0 =C2=A0 =C2=A0 floatsidf \<br>
-+=C2=A0 =C2=A0 =C2=A0 floatsisf \<br>
-+=C2=A0 =C2=A0 =C2=A0 floatunsidf \<br>
-+=C2=A0 =C2=A0 =C2=A0 floatunsisf \<br>
-+=C2=A0 =C2=A0 =C2=A0 comparedf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 comparesf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 modsi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 muldf3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 mulsf3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 negdf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 negsf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 subdf3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 subsf3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 truncdfsf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 udivsi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 umodsi3 \<br>
-+=C2=A0 =C2=A0 =C2=A0 unorddf2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 unordsf2<br>
-+<br>
-+ARM_FUNCTIONS :=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_cdcmpeq \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_cdrcmple \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_cfcmpeq \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_cfrcmple \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_dcmpeq \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_dcmpge \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_dcmpgt \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_dcmple \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_dcmplt \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_drsub \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_fcmpeq \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_fcmpge \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_fcmpgt \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_fcmple \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_fcmplt \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_frsub \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_idivmod \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_uidivmod \<br>
-+<br>
-+# ARM Assembly implementation which requires Thumb2 (i.e. won&#39;t work =
on v6M).<br>
-+THUMB2_FUNCTIONS :=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 switch16 \<br>
-+=C2=A0 =C2=A0 =C2=A0 switch32 \<br>
-+=C2=A0 =C2=A0 =C2=A0 switch8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 switchu8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_add_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_sub_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_and_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_or_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_xor_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_nand_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_max_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_umax_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_min_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_umin_4 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_add_8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_sub_8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_and_8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_or_8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_xor_8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_nand_8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_max_8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_umax_8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_min_8 \<br>
-+=C2=A0 =C2=A0 =C2=A0 sync_fetch_and_umin_8<br>
-+<br>
-+I386_FUNCTIONS :=3D=C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.eax \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.ebp \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.ebx \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.ecx \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.edi \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.edx \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.esi<br>
-+<br>
-+# FIXME: Currently, compiler-rt is missing implementations for a number o=
f the<br>
-+# functions. Filter them out for now.<br>
-+MISSING_FUNCTIONS :=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 cmpdf2 cmpsf2 div0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 ffssi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 bswapsi2 \<br>
-+=C2=A0 =C2=A0 =C2=A0 gcc_bcmp \<br>
-+=C2=A0 =C2=A0 =C2=A0 do_global_dtors \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get=
_pc_thunk.ebx \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get=
_pc_thunk.edx \<br>
-+=C2=A0 =C2=A0 =C2=A0 i686.get_pc_thunk.esi \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfr=
cmple aeabi_dcmpeq \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt =
aeabi_drsub \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmpl=
e aeabi_fcmplt \<br>
-+=C2=A0 =C2=A0 =C2=A0 aeabi_frsub aeabi_idivmod aeabi_uidivmod<br>
-+<br>
-+FUNCTIONS_ARMV6M=C2=A0 :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)<br>
-+FUNCTIONS_ARM_ALL :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS) $(THUMB2_FUNC=
TIONS)<br>
-+FUNCTIONS_I386=C2=A0 =C2=A0 :=3D $(COMMON_FUNCTIONS) $(I386_FUNCTIONS)<br=
>
-+FUNCTIONS_X86_64=C2=A0 :=3D $(COMMON_FUNCTIONS)<br>
-+<br>
-+FUNCTIONS_ARMV6M :=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M=
))<br>
-+FUNCTIONS_ARM_ALL :=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_AL=
L))<br>
-+FUNCTIONS_I386 :=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))=
<br>
-+FUNCTIONS_X86_64 :=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64=
))<br>
-+<br>
-+FUNCTIONS.soft_static.armv6m :=3D $(FUNCTIONS_ARMV6M)<br>
-+FUNCTIONS.soft_pic.armv6m=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARMV6M)<br>
-+<br>
-+FUNCTIONS.soft_static.armv7m :=3D $(FUNCTIONS_ARM_ALL)<br>
-+FUNCTIONS.soft_pic.armv7m=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br>
-+<br>
-+FUNCTIONS.soft_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)<br>
-+FUNCTIONS.hard_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)<br>
-+FUNCTIONS.soft_pic.armv7em=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br>
-+FUNCTIONS.hard_pic.armv7em=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br>
-+<br>
-+FUNCTIONS.soft_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)<br>
-+FUNCTIONS.hard_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)<br>
-+FUNCTIONS.soft_pic.armv7=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br>
-+FUNCTIONS.hard_pic.armv7=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br>
-+<br>
-+FUNCTIONS.hard_static.i386 :=3D $(FUNCTIONS_I386)<br>
-+FUNCTIONS.hard_pic.i386=C2=A0 =C2=A0 :=3D $(FUNCTIONS_I386)<br>
-+<br>
-+FUNCTIONS.hard_static.x86_64 :=3D $(FUNCTIONS_X86_64)<br>
-+FUNCTIONS.hard_pic.x86_64=C2=A0 =C2=A0 :=3D $(FUNCTIONS_X86_64)<br>
-diff --git a/compiler-rt/make/platform/clang_linux_embedded_test_input.c b=
/compiler-rt/make/platform/clang_linux_embedded_test_input.c<br>
-new file mode 100644<br>
-index 000000000000..e69de29bb2d1<br>
diff --git a/meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override=
-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0002-llvm=
-allow-env-override-of-exe-and-libdir-path.patch<br>
similarity index 96%<br>
rename from meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override-=
of-exe-and-libdir-path.patch<br>
rename to meta/recipes-devtools/clang/clang/0002-llvm-allow-env-override-of=
-exe-and-libdir-path.patch<br>
index 3c7c274693..583718c6ee 100644<br>
--- a/meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe=
-and-libdir-path.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0002-llvm-allow-env-override-of-exe=
-and-libdir-path.patch<br>
@@ -1,4 +1,4 @@<br>
-From d13464858866ff3c0026294d6842f74a11a0d625 Mon Sep 17 00:00:00 2001<br>
+From 9aa64eaa942dad120bc6baaf17d6d859049f9de9 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com" target=3D"_=
blank">mkelly@xevo.com</a>&gt;<br>
=C2=A0Date: Fri, 19 May 2017 00:22:57 -0700<br>
=C2=A0Subject: [PATCH] llvm: allow env override of exe and libdir path<br>
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 19 insertions(+), 6 deletions(-)<br>
<br>
=C2=A0diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm=
-config/llvm-config.cpp<br>
-index 24ea264419af..0a3f51ae2b83 100644<br>
+index 76aa9f8..64795e9 100644<br>
=C2=A0--- a/llvm/tools/llvm-config/llvm-config.cpp<br>
=C2=A0+++ b/llvm/tools/llvm-config/llvm-config.cpp<br>
=C2=A0@@ -248,6 +248,13 @@ Typical components:\n\<br>
diff --git a/meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysr=
oot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0003-clang-driv=
er-Check-sysroot-for-ldso-path.patch<br>
similarity index 87%<br>
rename from meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysro=
ot-for-ldso-path.patch<br>
rename to meta/recipes-devtools/clang/clang/0003-clang-driver-Check-sysroot=
-for-ldso-path.patch<br>
index e4636d30d1..d68dc94b03 100644<br>
--- a/meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysroot-for=
-ldso-path.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0003-clang-driver-Check-sysroot-for=
-ldso-path.patch<br>
@@ -1,4 +1,4 @@<br>
-From 7a12ad3232dd6881ca40d94277ca8064a12d9df6 Mon Sep 17 00:00:00 2001<br>
+From 6d26dbc005701acc1dbbd9e05e8596328a7d58f1 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca" targe=
t=3D"_blank">dan.mcgregor@usask.ca</a>&gt;<br>
=C2=A0Date: Wed, 26 Apr 2017 20:29:41 -0600<br>
=C2=A0Subject: [PATCH] clang: driver: Check sysroot for ldso path<br>
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 21 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
-index d525b417b4ea..1c31901ade74 100644<br>
+index 8d30a5e..1958c64 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
-@@ -630,8 +630,12 @@ std::string Linux::getDynamicLinker(const ArgList &am=
p;Args) const {<br>
+@@ -645,8 +645,12 @@ std::string Linux::getDynamicLinker(const ArgList &am=
p;Args) const {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Triple.getEnvironment() =3D=3D llvm::Tri=
ple::GNUEABIHFT64 ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tools::arm::getARMFloatABI(*this, Args) =
=3D=3D tools::arm::FloatABI::Hard;<br>
<br>
@@ -34,7 +34,7 @@ index d525b417b4ea..1c31901ade74 100644<br>
=C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 case llvm::Triple::loongarch32: {<br>
-@@ -685,11 +689,19 @@ std::string Linux::getDynamicLinker(const ArgList &a=
mp;Args) const {<br>
+@@ -700,11 +704,19 @@ std::string Linux::getDynamicLinker(const ArgList &a=
mp;Args) const {<br>
=C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib64&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 Loader =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tools::ppc::hasPPCAbiArg(Args, &quot;el=
fv2&quot;)) ? &quot;ld64.so.2&quot; : &quot;ld64.so.1&quot;;<br>
@@ -53,8 +53,8 @@ index d525b417b4ea..1c31901ade74 100644<br>
=C2=A0+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 case llvm::Triple::riscv32:<br>
-=C2=A0 =C2=A0case llvm::Triple::riscv64: {<br>
-@@ -707,6 +719,10 @@ std::string Linux::getDynamicLinker(const ArgList &am=
p;Args) const {<br>
+=C2=A0 =C2=A0case llvm::Triple::riscv64:<br>
+@@ -724,6 +736,10 @@ std::string Linux::getDynamicLinker(const ArgList &am=
p;Args) const {<br>
=C2=A0 =C2=A0 case llvm::Triple::sparcv9:<br>
=C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib64&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 Loader =3D &quot;ld-linux.so.2&quot;;<br>
@@ -65,7 +65,7 @@ index d525b417b4ea..1c31901ade74 100644<br>
=C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 case llvm::Triple::systemz:<br>
=C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
-@@ -721,6 +737,10 @@ std::string Linux::getDynamicLinker(const ArgList &am=
p;Args) const {<br>
+@@ -738,6 +754,10 @@ std::string Linux::getDynamicLinker(const ArgList &am=
p;Args) const {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 LibDir =3D X32 ? &quot;libx32&quot; : &quot;lib64&quot=
;;<br>
=C2=A0 =C2=A0 =C2=A0 Loader =3D X32 ? &quot;ld-linux-x32.so.2&quot; : &quot=
;ld-linux-x86-64.so.2&quot;;<br>
diff --git a/meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-=
Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0004-c=
lang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch<br>
similarity index 86%<br>
rename from meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-A=
dd-lssp_nonshared-on-musl.patch<br>
rename to meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add=
-lssp_nonshared-on-musl.patch<br>
index 0269dece67..1ba19bb4cd 100644<br>
--- a/meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-Add-lss=
p_nonshared-on-musl.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lss=
p_nonshared-on-musl.patch<br>
@@ -1,4 +1,4 @@<br>
-From 19b8ca2e1aa536e7d7f7eb379fc4e4d6f1efd07a Mon Sep 17 00:00:00 2001<br>
+From 64a5c3e2680fb2a04ecba015af8eb5049c4840e1 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 19 May 2016 21:11:06 -0700<br>
=C2=A0Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl=
<br>
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 6 insertions(+)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/T=
oolChains/Gnu.cpp<br>
-index cb6a9b242421..8f126474b7d1 100644<br>
+index 24076d8..a7a64fc 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Gnu.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Gnu.cpp<br>
-@@ -539,6 +539,12 @@ void tools::gnutools::Linker::ConstructJob(Compilatio=
n &amp;C, const JobAction &amp;JA,<br>
+@@ -537,6 +537,12 @@ void tools::gnutools::Linker::ConstructJob(Compilatio=
n &amp;C, const JobAction &amp;JA,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IsIAMCU)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CmdArgs.push_back(&quot;-lgloss&quot;);<=
br>
<br>
diff --git a/meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-=
to-sysroot.patch b/meta/recipes-devtools/clang/clang/0005-clang-Prepend-tra=
iling-to-sysroot.patch<br>
similarity index 81%<br>
rename from meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-t=
o-sysroot.patch<br>
rename to meta/recipes-devtools/clang/clang/0005-clang-Prepend-trailing-to-=
sysroot.patch<br>
index 321de79c78..0de2208a0f 100644<br>
--- a/meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-to-sysr=
oot.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0005-clang-Prepend-trailing-to-sysr=
oot.patch<br>
@@ -1,4 +1,4 @@<br>
-From 1746960b385afbc9e8e355a3b7c66b43c946451b Mon Sep 17 00:00:00 2001<br>
+From e6285791435950771c13b442319efdcd6a21d81e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 16 Mar 2017 09:02:13 -0700<br>
=C2=A0Subject: [PATCH] clang: Prepend trailing &#39;/&#39; to sysroot<br>
@@ -25,12 +25,12 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
-index 1c31901ade74..f7f096c1ac0a 100644<br>
+index 1958c64..cb2b227 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
-@@ -235,7 +235,7 @@ Linux::Linux(const Driver &amp;D, const llvm::Triple &=
amp;Triple, const ArgList &amp;Args)<br>
-=C2=A0 =C2=A0Multilibs =3D GCCInstallation.getMultilibs();<br>
-=C2=A0 =C2=A0SelectedMultilibs.assign({GCCInstallation.getMultilib()});<br=
>
+@@ -238,7 +238,7 @@ Linux::Linux(const Driver &amp;D, const llvm::Triple &=
amp;Triple, const ArgList &amp;Args)<br>
+=C2=A0 =C2=A0loadMultilibsFromYAML(Args, D);<br>
+ <br>
=C2=A0 =C2=A0 llvm::Triple::ArchType Arch =3D Triple.getArch();<br>
=C2=A0-=C2=A0 std::string SysRoot =3D computeSysRoot();<br>
=C2=A0+=C2=A0 std::string SysRoot =3D computeSysRoot() + &quot;/&quot;;<br>
diff --git a/meta/recipes-devtools/clang/clang/0009-clang-Define-releative-=
gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0006-clang-D=
efine-releative-gcc-installation-dir.patch<br>
similarity index 94%<br>
rename from meta/recipes-devtools/clang/clang/0009-clang-Define-releative-g=
cc-installation-dir.patch<br>
rename to meta/recipes-devtools/clang/clang/0006-clang-Define-releative-gcc=
-installation-dir.patch<br>
index 38470e9834..427842a07a 100644<br>
--- a/meta/recipes-devtools/clang/clang/0009-clang-Define-releative-gcc-ins=
tallation-dir.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0006-clang-Define-releative-gcc-ins=
tallation-dir.patch<br>
@@ -1,4 +1,4 @@<br>
-From bfba4232621e151cfc5dcb16ce5bf661f8c3d8f8 Mon Sep 17 00:00:00 2001<br>
+From 04e0958fea64ebc9c89c0a6c147e8806a87727bd Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 20 Mar 2021 16:09:16 -0700<br>
=C2=A0Subject: [PATCH] clang: Define / releative gcc installation dir<br>
@@ -61,7 +61,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 14 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/T=
oolChains/Gnu.cpp<br>
-index 8f126474b7d1..c80980a7fb09 100644<br>
+index a7a64fc..f44663f 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Gnu.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Gnu.cpp<br>
=C2=A0@@ -18,6 +18,7 @@<br>
@@ -72,7 +72,7 @@ index 8f126474b7d1..c80980a7fb09 100644<br>
=C2=A0 #include &quot;clang/Driver/Driver.h&quot;<br>
=C2=A0 #include &quot;clang/Driver/MultilibBuilder.h&quot;<br>
=C2=A0 #include &quot;clang/Driver/Tool.h&quot;<br>
-@@ -2847,6 +2848,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDi=
rForGCCTriple(<br>
+@@ -2869,6 +2870,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDi=
rForGCCTriple(<br>
=C2=A0 =C2=A0 =C2=A0 const llvm::Triple &amp;TargetTriple, const ArgList &a=
mp;Args,<br>
=C2=A0 =C2=A0 =C2=A0 const std::string &amp;LibDir, StringRef CandidateTrip=
le,<br>
=C2=A0 =C2=A0 =C2=A0 bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCro=
ssDirExists) {<br>
@@ -80,7 +80,7 @@ index 8f126474b7d1..c80980a7fb09 100644<br>
=C2=A0 =C2=A0 // Locations relative to the system lib directory where GCC&#=
39;s triple-specific<br>
=C2=A0 =C2=A0 // directories might reside.<br>
=C2=A0 =C2=A0 struct GCCLibSuffix {<br>
-@@ -2858,19 +2860,20 @@ void Generic_GCC::GCCInstallationDetector::ScanLib=
DirForGCCTriple(<br>
+@@ -2880,19 +2882,20 @@ void Generic_GCC::GCCInstallationDetector::ScanLib=
DirForGCCTriple(<br>
=C2=A0 =C2=A0 =C2=A0 // Whether this library suffix is relevant for the tri=
ple.<br>
=C2=A0 =C2=A0 =C2=A0 bool Active;<br>
=C2=A0 =C2=A0 } Suffixes[] =3D {<br>
@@ -108,7 +108,7 @@ index 8f126474b7d1..c80980a7fb09 100644<br>
<br>
=C2=A0 =C2=A0 SmallVector&lt;GCCInstallCandidate, 3&gt; Installations;<br>
=C2=A0 =C2=A0 for (auto &amp;Suffix : Suffixes) {<br>
-@@ -3273,8 +3276,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::opt:=
:ArgList &amp;DriverArgs,<br>
+@@ -3297,8 +3300,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::opt:=
:ArgList &amp;DriverArgs,<br>
=C2=A0 =C2=A0 // incompatible with the NDK libraries.<br>
=C2=A0 =C2=A0 SmallString&lt;128&gt; DriverIncludeDir(getDriver().Dir);<br>
=C2=A0 =C2=A0 llvm::sys::path::append(DriverIncludeDir, &quot;..&quot;, &qu=
ot;include&quot;);<br>
diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-=
ldl-along-with-lunwind-for-st.patch b/meta/recipes-devtools/clang/clang/000=
7-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch<br>
similarity index 86%<br>
rename from meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-l=
dl-along-with-lunwind-for-st.patch<br>
rename to meta/recipes-devtools/clang/clang/0007-clang-Add-lpthread-and-ldl=
-along-with-lunwind-for-st.patch<br>
index b338d0f570..e07f004fb4 100644<br>
--- a/meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-ldl-alo=
ng-with-lunwind-for-st.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0007-clang-Add-lpthread-and-ldl-alo=
ng-with-lunwind-for-st.patch<br>
@@ -1,8 +1,8 @@<br>
-From 03875620d0172a7c07e3cdc607a6877b06a130e9 Mon Sep 17 00:00:00 2001<br>
+From f64b2adab7e4c515aa1e082054ad4514898e2d5d Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 31 Jul 2019 22:51:39 -0700<br>
-Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for sta=
tic<br>
- linking<br>
+Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for<br>
+ static linking<br>
<br>
=C2=A0When doing static liking with --unwindlib=3Dlibunwind -static we enco=
unter<br>
=C2=A0undefined symbols<br>
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp b/clang/lib/D=
river/ToolChains/CommonArgs.cpp<br>
-index 10a1a412eea0..a217897610c3 100644<br>
+index 08c0695..362e7ca 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/CommonArgs.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp<br>
-@@ -2415,6 +2415,8 @@ static void AddUnwindLibrary(const ToolChain &amp;TC=
, const Driver &amp;D,<br>
+@@ -2484,6 +2484,8 @@ static void AddUnwindLibrary(const ToolChain &amp;TC=
, const Driver &amp;D,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CmdArgs.push_back(&quot;-lunwind&quot;);=
<br>
=C2=A0 =C2=A0 =C2=A0 } else if (LGT =3D=3D LibGccType::StaticLibGcc) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CmdArgs.push_back(&quot;-l:libunwind.a&quot;);<=
br>
diff --git a/meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double=
-intrinsics.patch b/meta/recipes-devtools/clang/clang/0008-Check-for-atomic=
-double-intrinsics.patch<br>
similarity index 91%<br>
rename from meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double-=
intrinsics.patch<br>
rename to meta/recipes-devtools/clang/clang/0008-Check-for-atomic-double-in=
trinsics.patch<br>
index ba6a5c1510..c9764c70e9 100644<br>
--- a/meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double-intrin=
sics.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0008-Check-for-atomic-double-intrin=
sics.patch<br>
@@ -1,4 +1,4 @@<br>
-From ea4326b11976e48dde6d99605ac24df048cd3b10 Mon Sep 17 00:00:00 2001<br>
+From a4a94de113dce4cf88c05bf0d5628a902ed93ff3 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 18 Nov 2019 17:00:29 -0800<br>
=C2=A0Subject: [PATCH] Check for atomic&lt;double&gt; intrinsics<br>
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/llvm/cmake/modules/CheckAtomic.cmake b/llvm/cmake/module=
s/CheckAtomic.cmake<br>
-index f11cadf39ff6..80a18a92956a 100644<br>
+index f11cadf..80a18a9 100644<br>
=C2=A0--- a/llvm/cmake/modules/CheckAtomic.cmake<br>
=C2=A0+++ b/llvm/cmake/modules/CheckAtomic.cmake<br>
=C2=A0@@ -30,10 +30,11 @@ function(check_working_cxx_atomics64 varname)<br>
diff --git a/meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for=
-packages-using-find_package.patch b/meta/recipes-devtools/clang/clang/0009=
-cmake-Fix-configure-for-packages-using-find_package.patch<br>
similarity index 89%<br>
rename from meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for-=
packages-using-find_package.patch<br>
rename to meta/recipes-devtools/clang/clang/0009-cmake-Fix-configure-for-pa=
ckages-using-find_package.patch<br>
index 946eb1661f..2a3744f225 100644<br>
--- a/meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for-packag=
es-using-find_package.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0009-cmake-Fix-configure-for-packag=
es-using-find_package.patch<br>
@@ -1,4 +1,4 @@<br>
-From dc281691e778a61cc14bca4eb187792d2ffb384c Mon Sep 17 00:00:00 2001<br>
+From d373417d4724071c98f95d17c88cc78e9dc1c241 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Ovidiu Panait &lt;<a href=3D"mailto:ovidiu.panait@windriver.com=
" target=3D"_blank">ovidiu.panait@windriver.com</a>&gt;<br>
=C2=A0Date: Fri, 31 Jan 2020 10:56:11 +0200<br>
=C2=A0Subject: [PATCH] cmake: Fix configure for packages using find_package=
()<br>
@@ -31,7 +31,7 @@ Signed-off-by: Ovidiu Panait &lt;<a href=3D"mailto:ovidiu=
.panait@windriver.com" target=3D"_blank">ovidiu.panait@windriver.com</a>&gt=
;<br>
=C2=A0 3 files changed, 2 insertions(+), 15 deletions(-)<br>
<br>
=C2=A0diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules=
/AddClang.cmake<br>
-index 4059fc3e986c..44d43aa8f25b 100644<br>
+index e2112d7..f51983d 100644<br>
=C2=A0--- a/clang/cmake/modules/AddClang.cmake<br>
=C2=A0+++ b/clang/cmake/modules/AddClang.cmake<br>
=C2=A0@@ -182,7 +182,6 @@ macro(add_clang_tool name)<br>
@@ -51,10 +51,10 @@ index 4059fc3e986c..44d43aa8f25b 100644<br>
=C2=A0 =C2=A0 endif()<br>
=C2=A0 =C2=A0 set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEM=
E ON)<br>
=C2=A0diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/Ad=
dLLVM.cmake<br>
-index d938214f9d0d..4816f2127e14 100644<br>
+index a267166..09ff2af 100644<br>
=C2=A0--- a/llvm/cmake/modules/AddLLVM.cmake<br>
=C2=A0+++ b/llvm/cmake/modules/AddLLVM.cmake<br>
-@@ -1485,7 +1485,6 @@ macro(llvm_add_tool project name)<br>
+@@ -1625,7 +1625,6 @@ macro(llvm_add_tool project name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if( LLVM_BUILD_TOOLS )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_target_export_arg(${name} ${project}=
 export_to_llvmexports)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install(TARGETS ${name}<br>
@@ -62,7 +62,7 @@ index d938214f9d0d..4816f2127e14 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RUNTIME DEST=
INATION ${${project}_TOOLS_INSTALL_DIR}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMPONENT ${=
name})<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (LLVM_ENABLE_PDB)<br>
-@@ -1501,10 +1500,8 @@ macro(llvm_add_tool project name)<br>
+@@ -1641,10 +1640,8 @@ macro(llvm_add_tool project name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endif()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 endif()<br>
=C2=A0 =C2=A0 =C2=A0 endif()<br>
@@ -75,7 +75,7 @@ index d938214f9d0d..4816f2127e14 100644<br>
=C2=A0 =C2=A0 endif()<br>
=C2=A0 =C2=A0 get_subproject_title(subproject_title)<br>
=C2=A0 =C2=A0 set_target_properties(${name} PROPERTIES FOLDER &quot;${subpr=
oject_title}/Tools&quot;)<br>
-@@ -1559,7 +1556,6 @@ macro(add_llvm_utility name)<br>
+@@ -1699,7 +1696,6 @@ macro(add_llvm_utility name)<br>
=C2=A0 =C2=A0 =C2=A0 if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_target_export_arg(${name} LLVM export_to_ll=
vmexports)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install(TARGETS ${name}<br>
@@ -83,7 +83,7 @@ index d938214f9d0d..4816f2127e14 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RUNTIME DESTINATION=
 ${LLVM_UTILS_INSTALL_DIR}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMPONENT ${name})<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (LLVM_ENABLE_PDB)<br>
-@@ -1573,7 +1569,6 @@ macro(add_llvm_utility name)<br>
+@@ -1713,7 +1709,6 @@ macro(add_llvm_utility name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEPENDS ${name}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COMPONENT ${name})<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 endif()<br>
@@ -92,10 +92,10 @@ index d938214f9d0d..4816f2127e14 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_property(GLOBAL APPEND PROPERTY LLVM_EXPORT=
S_BUILDTREE_ONLY ${name})<br>
=C2=A0 =C2=A0 =C2=A0 endif()<br>
=C2=A0diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/T=
ableGen.cmake<br>
-index 84c03cd6432e..72da60ce3ca1 100644<br>
+index 397089a..5240962 100644<br>
=C2=A0--- a/llvm/cmake/modules/TableGen.cmake<br>
=C2=A0+++ b/llvm/cmake/modules/TableGen.cmake<br>
-@@ -237,12 +237,7 @@ macro(add_tablegen target project)<br>
+@@ -239,12 +239,7 @@ macro(add_tablegen target project)<br>
<br>
=C2=A0 =C2=A0 if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_O=
NLY AND<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DIS=
TRIBUTION_COMPONENTS))<br>
@@ -108,7 +108,7 @@ index 84c03cd6432e..72da60ce3ca1 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMPONENT ${target}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RUNTIME DESTINATION &quot;=
${ADD_TABLEGEN_DESTINATION}&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 if(NOT LLVM_ENABLE_IDE)<br>
-@@ -253,7 +248,6 @@ macro(add_tablegen target project)<br>
+@@ -255,7 +250,6 @@ macro(add_tablegen target project)<br>
=C2=A0 =C2=A0 endif()<br>
=C2=A0 =C2=A0 if(ADD_TABLEGEN_EXPORT)<br>
=C2=A0 =C2=A0 =C2=A0 string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)<br=
>
diff --git a/meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-=
location-for-cross-toolchains.patch b/meta/recipes-devtools/clang/clang/001=
0-clang-Fix-resource-dir-location-for-cross-toolchains.patch<br>
similarity index 95%<br>
rename from meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-l=
ocation-for-cross-toolchains.patch<br>
rename to meta/recipes-devtools/clang/clang/0010-clang-Fix-resource-dir-loc=
ation-for-cross-toolchains.patch<br>
index 72b989c0a2..df6c44bca1 100644<br>
--- a/meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-locatio=
n-for-cross-toolchains.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0010-clang-Fix-resource-dir-locatio=
n-for-cross-toolchains.patch<br>
@@ -1,4 +1,4 @@<br>
-From 248a51bece02c199d0f84d14fa7e2e2379c592a0 Mon Sep 17 00:00:00 2001<br>
+From d03df63cfd772452b5b7c8ddb587f576f054b004 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jim Broadus &lt;<a href=3D"mailto:jbroadus@xevo.com" target=3D"=
_blank">jbroadus@xevo.com</a>&gt;<br>
=C2=A0Date: Thu, 26 Mar 2020 16:05:53 -0700<br>
=C2=A0Subject: [PATCH] clang: Fix resource dir location for cross toolchain=
s<br>
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/clang/lib/Options/OptionUtils.cpp b/clang/lib/Options/Op=
tionUtils.cpp<br>
-index e5aefa012f67..7c1b657ce2c1 100644<br>
+index 77f8955..62bb694 100644<br>
=C2=A0--- a/clang/lib/Options/OptionUtils.cpp<br>
=C2=A0+++ b/clang/lib/Options/OptionUtils.cpp<br>
=C2=A0@@ -213,6 +213,7 @@ std::string clang::GetResourcesPath(StringRef Bin=
aryPath) {<br>
diff --git a/meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-p=
refix-when-checking-sysroot-f.patch b/meta/recipes-devtools/clang/clang/001=
1-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch<br>
similarity index 88%<br>
rename from meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-pr=
efix-when-checking-sysroot-f.patch<br>
rename to meta/recipes-devtools/clang/clang/0011-clang-driver-Add-dyld-pref=
ix-when-checking-sysroot-f.patch<br>
index 725d10a2a7..29d7a6d6bc 100644<br>
--- a/meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-prefix-w=
hen-checking-sysroot-f.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0011-clang-driver-Add-dyld-prefix-w=
hen-checking-sysroot-f.patch<br>
@@ -1,8 +1,8 @@<br>
-From b3eea8bcdb792a7b19b879c76eac64f36d1fe012 Mon Sep 17 00:00:00 2001<br>
+From 75e6420bd7f45f1b60a856d51866e22d83cf55b0 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Oleksandr Ocheretnyi &lt;<a href=3D"mailto:oocheret@cisco.com" =
target=3D"_blank">oocheret@cisco.com</a>&gt;<br>
=C2=A0Date: Wed, 15 Apr 2020 00:08:39 +0300<br>
-Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot for =
ldso<br>
- path<br>
+Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot<br>
+ for ldso path<br>
<br>
=C2=A0 * the dyld-prefix shall be taken into account when the default<br>
=C2=A0 =C2=A0 path for the dynamic linker has to be checked.<br>
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 10 insertions(+), 10 deletions(-)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
-index f7f096c1ac0a..7b608a84a66e 100644<br>
+index cb2b227..c2ac9b6 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
-@@ -632,8 +632,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
+@@ -647,8 +647,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 Loader =3D HF ? &quot;ld-linux-armhf.so.3&quot; : &quo=
t;ld-linux.so.3&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib32&quot;;<br>
@@ -33,7 +33,7 @@ index f7f096c1ac0a..7b608a84a66e 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 break;<br>
-@@ -689,8 +689,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
+@@ -704,8 +704,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
=C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib64&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 Loader =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tools::ppc::hasPPCAbiArg(Args, &quot;el=
fv2&quot;)) ? &quot;ld64.so.2&quot; : &quot;ld64.so.1&quot;;<br>
@@ -44,7 +44,7 @@ index f7f096c1ac0a..7b608a84a66e 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 break;<br>
-@@ -698,8 +698,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
+@@ -713,8 +713,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
=C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib64&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 Loader =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tools::ppc::hasPPCAbiArg(Args, &quot;el=
fv1&quot;)) ? &quot;ld64.so.1&quot; : &quot;ld64.so.2&quot;;<br>
@@ -55,7 +55,7 @@ index f7f096c1ac0a..7b608a84a66e 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 break;<br>
-@@ -719,8 +719,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
+@@ -736,8 +736,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
=C2=A0 =C2=A0 case llvm::Triple::sparcv9:<br>
=C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib64&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 Loader =3D &quot;ld-linux.so.2&quot;;<br>
@@ -66,7 +66,7 @@ index f7f096c1ac0a..7b608a84a66e 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 break;<br>
-@@ -737,8 +737,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
+@@ -754,8 +754,8 @@ std::string Linux::getDynamicLinker(const ArgList &amp=
;Args) const {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 LibDir =3D X32 ? &quot;libx32&quot; : &quot;lib64&quot=
;;<br>
=C2=A0 =C2=A0 =C2=A0 Loader =3D X32 ? &quot;ld-linux-x32.so.2&quot; : &quot=
;ld-linux-x86-64.so.2&quot;;<br>
diff --git a/meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-py=
thon-scripts.patch b/meta/recipes-devtools/clang/clang/0012-clang-Use-pytho=
n3-in-python-scripts.patch<br>
similarity index 90%<br>
rename from meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-pyt=
hon-scripts.patch<br>
rename to meta/recipes-devtools/clang/clang/0012-clang-Use-python3-in-pytho=
n-scripts.patch<br>
index e29d23cab2..5b0a0b3431 100644<br>
--- a/meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-python-sc=
ripts.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0012-clang-Use-python3-in-python-sc=
ripts.patch<br>
@@ -1,4 +1,4 @@<br>
-From 17e1af5e12a01296d2c032a768569d4d8b06505b Mon Sep 17 00:00:00 2001<br>
+From bc161f33adb168a0a1614d38eb84190c3f690000 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 14 Oct 2020 22:19:57 -0700<br>
=C2=A0Subject: [PATCH] clang: Use python3 in python scripts<br>
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/clang-tools-extra/clang-include-fixer/find-all-symbols/t=
ool/run-find-all-symbols.py b/clang-tools-extra/clang-include-fixer/find-al=
l-symbols/tool/run-find-all-symbols.py<br>
-index 49a1b1493264..6158876d15f7 100755<br>
+index 49a1b14..6158876 100755<br>
=C2=A0--- a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run=
-find-all-symbols.py<br>
=C2=A0+++ b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run=
-find-all-symbols.py<br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -24,7 +24,7 @@ index 49a1b1493264..6158876d15f7 100755<br>
=C2=A0 # =3D- run-find-all-symbols.py - Parallel find-all-symbols runner -*=
- python=C2=A0 -*-=3D#<br>
=C2=A0 #<br>
=C2=A0diff --git a/clang/tools/scan-view/bin/scan-view b/clang/tools/scan-v=
iew/bin/scan-view<br>
-index d01aebb4029a..f3375804654d 100755<br>
+index d01aebb..f337580 100755<br>
=C2=A0--- a/clang/tools/scan-view/bin/scan-view<br>
=C2=A0+++ b/clang/tools/scan-view/bin/scan-view<br>
=C2=A0@@ -1,4 +1,4 @@<br>
diff --git a/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-ancho=
r-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang/001=
3-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch<br>
similarity index 91%<br>
rename from meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor=
-for-adding-OE-distro-vendor.patch<br>
rename to meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-f=
or-adding-OE-distro-vendor.patch<br>
index 674a3b264e..aba7488323 100644<br>
--- a/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for-a=
dding-OE-distro-vendor.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-a=
dding-OE-distro-vendor.patch<br>
@@ -1,7 +1,8 @@<br>
-From 259d8eb2ed82c9248387a3cbb1befee358ecbb8e Mon Sep 17 00:00:00 2001<br>
+From 12fbb32963d7aad6c0d5a0ca5fc0f536f1a9b4fe Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" targ=
et=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0Date: Mon, 25 Jan 2021 16:14:35 +0800<br>
-Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor nam=
es<br>
+Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor<br>
+ names<br>
=C2=A0MIME-Version: 1.0<br>
=C2=A0Content-Type: text/plain; charset=3DUTF-8<br>
=C2=A0Content-Transfer-Encoding: 8bit<br>
@@ -99,11 +100,11 @@ Signed-off-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"m=
ailto:joaomarcos.costa@bootlin.com" target=3D"_blank">joaomarcos.costa@boot=
lin.com</a>&gt;<br>
=C2=A0 clang/lib/Driver/Distro.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1 +<br>
=C2=A0 clang/lib/Driver/ToolChains/Gnu.cpp=C2=A0 =C2=A0| 1 +<br>
=C2=A0 clang/lib/Driver/ToolChains/Linux.cpp | 2 ++<br>
- llvm/lib/TargetParser/Triple.cpp=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- 5 files changed, 7 insertions(+), 1 deletion(-)<br>
+ llvm/lib/TargetParser/Triple.cpp=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
+ 5 files changed, 7 insertions(+)<br>
<br>
=C2=A0diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clan=
g/Driver/Distro.h<br>
-index 0e17b30eb..b449a62dc 100644<br>
+index aa4b3e1..2d77a2b 100644<br>
=C2=A0--- a/clang/include/clang/Driver/Distro.h<br>
=C2=A0+++ b/clang/include/clang/Driver/Distro.h<br>
=C2=A0@@ -45,6 +45,7 @@ public:<br>
@@ -114,7 +115,7 @@ index 0e17b30eb..b449a62dc 100644<br>
=C2=A0 =C2=A0 =C2=A0 OpenSUSE,<br>
=C2=A0 =C2=A0 =C2=A0 UbuntuQuantal,<br>
=C2=A0 =C2=A0 =C2=A0 UbuntuRaring,<br>
-@@ -132,6 +133,7 @@ public:<br>
+@@ -133,6 +134,7 @@ public:<br>
<br>
=C2=A0 =C2=A0 bool IsGentoo() const { return DistroVal =3D=3D Gentoo; }<br>
<br>
@@ -123,7 +124,7 @@ index 0e17b30eb..b449a62dc 100644<br>
=C2=A0 };<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cp=
p<br>
-index df10458d0..61dc127a4 100644<br>
+index 585497e..3b58ac7 100644<br>
=C2=A0--- a/clang/lib/Driver/Distro.cpp<br>
=C2=A0+++ b/clang/lib/Driver/Distro.cpp<br>
=C2=A0@@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs=
::FileSystem &amp;VFS) {<br>
@@ -135,10 +136,10 @@ index df10458d0..61dc127a4 100644<br>
=C2=A0 =C2=A0 return Version;<br>
=C2=A0 }<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/T=
oolChains/Gnu.cpp<br>
-index c80980a7f..80fd8058b 100644<br>
+index f44663f..73ff1f4 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Gnu.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Gnu.cpp<br>
-@@ -2370,6 +2370,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(<br>
+@@ -2371,6 +2371,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x86_64-pc-linux-gnu&quot;,=C2=A0 =C2=A0 &=
quot;x86_64-redhat-linux6E&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x86_64-redhat-linux&quot;,=C2=A0 =C2=A0 &=
quot;x86_64-suse-linux&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x86_64-manbo-linux-gnu&quot;, &quot;x86_6=
4-slackware-linux&quot;,<br>
@@ -147,7 +148,7 @@ index c80980a7f..80fd8058b 100644<br>
=C2=A0 =C2=A0 static const char *const X32Triples[] =3D {&quot;x86_64-linux=
-gnux32&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;x86_64-pc-linux-gnux32&quot;};<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
-index 7b608a84a..585a86a2d 100644<br>
+index c2ac9b6..3231f36 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
=C2=A0@@ -45,6 +45,7 @@ std::string Linux::getMultiarchTriple(const Driver =
&amp;D,<br>
@@ -167,18 +168,14 @@ index 7b608a84a..585a86a2d 100644<br>
=C2=A0 =C2=A0 case llvm::Triple::aarch64:<br>
=C2=A0 =C2=A0 =C2=A0 if (IsAndroid)<br>
=C2=A0diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser=
/Triple.cpp<br>
-index a4f9dd42c..86b74451e 100644<br>
+index 356782c..883e654 100644<br>
=C2=A0--- a/llvm/lib/TargetParser/Triple.cpp<br>
=C2=A0+++ b/llvm/lib/TargetParser/Triple.cpp<br>
-@@ -702,7 +702,7 @@ static Triple::VendorType parseVendor(StringRef Vendor=
Name) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.Case(&quot;suse&quot;, Triple::SUSE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.Case(&quot;oe&quot;, Triple::OpenEmbedded)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.Case(&quot;intel&quot;, Triple::Intel)<br>
--=C2=A0 =C2=A0 =C2=A0 .Case(&quot;meta&quot;, Triple::Meta)<br>
-+=C2=A0 =C2=A0 =C2=A0 .Case(&quot;meta&quot;, Triple::Meta) //CLANG_EXTRA_=
OE_VENDORS_CASES<br>
+@@ -741,6 +741,7 @@ static Triple::VendorType parseVendor(StringRef Vendor=
Name) {<br>
+ #define TRIPLE_VENDOR(Enum, Name) .Case(Name, Triple::Enum)<br>
+ #define TRIPLE_VENDOR_ALIAS(Enum, AliasName) .Case(AliasName, Triple::Enu=
m)<br>
+ #include &quot;llvm/TargetParser/TripleName.def&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 //CLANG_EXTRA_OE_VENDORS_CASES<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .Default(Triple::UnknownVendor);<br>
=C2=A0 }<br>
<br>
--- <br>
-2.39.5<br>
-<br>
diff --git a/meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-fo=
r-non-debian-multiarch-linux-.patch b/meta/recipes-devtools/clang/clang/001=
4-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch<br>
similarity index 86%<br>
rename from meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for=
-non-debian-multiarch-linux-.patch<br>
rename to meta/recipes-devtools/clang/clang/0014-clang-Fix-x86-triple-for-n=
on-debian-multiarch-linux-.patch<br>
index 786ff426d3..d54859c338 100644<br>
--- a/meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for-non-d=
ebian-multiarch-linux-.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0014-clang-Fix-x86-triple-for-non-d=
ebian-multiarch-linux-.patch<br>
@@ -1,7 +1,8 @@<br>
-From 6839ba1413cf09eb14a24eeda44fb02c1c6809e1 Mon Sep 17 00:00:00 2001<br>
+From 0a569622e3ebdb2ebd1a2a4f9553161c1bd188d8 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 19 May 2021 17:56:03 -0700<br>
-Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux dist=
ros<br>
+Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux<br>
+ distros<br>
<br>
=C2=A0OpenEmbedded does not hardcode mutli-arch like debian therefore ensur=
e<br>
=C2=A0that it still uses the proper tuple<br>
@@ -13,10 +14,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
-index 4a0adedce09a..9fed904c05c2 100644<br>
+index 3231f36..41e0017 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
-@@ -227,8 +227,9 @@ Linux::Linux(const Driver &amp;D, const llvm::Triple &=
amp;Triple, const ArgList &amp;Args)<br>
+@@ -228,8 +228,9 @@ Linux::Linux(const Driver &amp;D, const llvm::Triple &=
amp;Triple, const ArgList &amp;Args)<br>
=C2=A0 =C2=A0 =C2=A0 : Generic_ELF(D, Triple, Args) {<br>
=C2=A0 =C2=A0 GCCInstallation.TripleToDebianMultiarch =3D [](const llvm::Tr=
iple &amp;T) {<br>
=C2=A0 =C2=A0 =C2=A0 StringRef TripleStr =3D T.str();<br>
diff --git a/meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_bac=
ktrace-method.patch b/meta/recipes-devtools/clang/clang/0015-libunwind-Adde=
d-unw_backtrace-method.patch<br>
similarity index 89%<br>
rename from meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_back=
trace-method.patch<br>
rename to meta/recipes-devtools/clang/clang/0015-libunwind-Added-unw_backtr=
ace-method.patch<br>
index 0b7966ee57..2beff16173 100644<br>
--- a/meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_backtrace-=
method.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0015-libunwind-Added-unw_backtrace-=
method.patch<br>
@@ -1,4 +1,4 @@<br>
-From bf7c0933d65eb811c993ff32fdc6b65f6befc5af Mon Sep 17 00:00:00 2001<br>
+From 1ab2bd0edf76583f0e430da5ef8a53ca4029455f Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Maksim Kita &lt;<a href=3D"mailto:maksim-kita@yandex-team.ru" t=
arget=3D"_blank">maksim-kita@yandex-team.ru</a>&gt;<br>
=C2=A0Date: Sun, 23 May 2021 10:27:29 +0000<br>
=C2=A0Subject: [PATCH] libunwind: Added unw_backtrace method<br>
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 21 insertions(+)<br>
<br>
=C2=A0diff --git a/libunwind/include/libunwind.h b/libunwind/include/libunw=
ind.h<br>
-index 56ca7110274a..60a27f28100b 100644<br>
+index 6c2dfe5..602cafb 100644<br>
=C2=A0--- a/libunwind/include/libunwind.h<br>
=C2=A0+++ b/libunwind/include/libunwind.h<br>
=C2=A0@@ -235,6 +235,7 @@ extern int unw_is_signal_frame(unw_cursor_t *) LI=
BUNWIND_AVAIL;<br>
@@ -24,10 +24,10 @@ index 56ca7110274a..60a27f28100b 100644<br>
=C2=A0 extern unw_addr_space_t unw_local_addr_space;<br>
<br>
=C2=A0diff --git a/libunwind/src/libunwind.cpp b/libunwind/src/libunwind.cp=
p<br>
-index 7ffffc2a30c0..ed0b394cb002 100644<br>
+index 0b9d56e..fbfbd48 100644<br>
=C2=A0--- a/libunwind/src/libunwind.cpp<br>
=C2=A0+++ b/libunwind/src/libunwind.cpp<br>
-@@ -531,6 +531,26 @@ int __unw_remove_find_dynamic_unwind_sections(<br>
+@@ -527,6 +527,26 @@ int __unw_remove_find_dynamic_unwind_sections(<br>
<br>
=C2=A0 #endif // __APPLE__<br>
<br>
diff --git a/meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomi=
c-on-x86.patch b/meta/recipes-devtools/clang/clang/0016-lldb-Link-with-liba=
tomic-on-x86.patch<br>
similarity index 92%<br>
rename from meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomic=
-on-x86.patch<br>
rename to meta/recipes-devtools/clang/clang/0016-lldb-Link-with-libatomic-o=
n-x86.patch<br>
index b9f7270f62..45a71fc2ab 100644<br>
--- a/meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomic-on-x8=
6.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0016-lldb-Link-with-libatomic-on-x8=
6.patch<br>
@@ -1,4 +1,4 @@<br>
-From 94c6e940ddc44922ee505993549477a0fa7ac50d Mon Sep 17 00:00:00 2001<br>
+From 765a550228a57f9bf88ea2c284a5aec01c4c220e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 8 Feb 2022 01:31:26 -0800<br>
=C2=A0Subject: [PATCH] lldb: Link with libatomic on x86<br>
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 4 insertions(+)<br>
<br>
=C2=A0diff --git a/lldb/source/Utility/CMakeLists.txt b/lldb/source/Utility=
/CMakeLists.txt<br>
-index 04f1692e53b3..da0a48d9da54 100644<br>
+index c0d0a42..463c0d7 100644<br>
=C2=A0--- a/lldb/source/Utility/CMakeLists.txt<br>
=C2=A0+++ b/lldb/source/Utility/CMakeLists.txt<br>
=C2=A0@@ -19,6 +19,10 @@ if (CMAKE_SYSTEM_NAME MATCHES &quot;Windows&quot;)=
<br>
diff --git a/meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-=
backtrace-APIs-on-non-glibc-l.patch b/meta/recipes-devtools/clang/clang/001=
7-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch<br>
deleted file mode 100644<br>
index 3fa436d526..0000000000<br>
--- a/meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtra=
ce-APIs-on-non-glibc-l.patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-From bc8371eb77cca413ccb4ebf8239c597f7be40006 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Wed, 19 May 2021 17:32:13 -0700<br>
-Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc linux=
<br>
-<br>
-musl e.g. does not provide backtrace APIs<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- .../lib/gwp_asan/optional/backtrace_linux_libc.cpp=C2=A0 | 13 +++++++++++=
+-<br>
- 1 file changed, 12 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp b/=
compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp<br>
-index ea8e72be287d..0344074dd254 100644<br>
---- a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp<br>
-+++ b/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp<br>
-@@ -7,7 +7,9 @@<br>
- //=3D=3D=3D--------------------------------------------------------------=
--------=3D=3D=3D//<br>
- <br>
- #include &lt;assert.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;execinfo.h&gt;<br>
-+#endif<br>
- #include &lt;stddef.h&gt;<br>
- #include &lt;stdint.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
-@@ -21,8 +23,11 @@<br>
- namespace {<br>
- size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {<br>
-=C2=A0 =C2=A0static_assert(sizeof(uintptr_t) =3D=3D sizeof(void *), &quot;=
uintptr_t is not void*&quot;);<br>
--<br>
-+#ifdef __GLIBC__<br>
-=C2=A0 =C2=A0return backtrace(reinterpret_cast&lt;void **&gt;(TraceBuffer)=
, Size);<br>
-+#else<br>
-+=C2=A0 return -1;<br>
-+#endif<br>
- }<br>
- <br>
- // We don&#39;t need any custom handling for the Segv backtrace - the lib=
c unwinder<br>
-@@ -30,7 +35,11 @@ size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {=
<br>
- // to avoid the additional frame.<br>
- GWP_ASAN_ALWAYS_INLINE size_t SegvBacktrace(uintptr_t *TraceBuffer, size_=
t Size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0void * /*Context*/) {<br>
-+#ifdef __GLIBC__<br>
-=C2=A0 =C2=A0return Backtrace(TraceBuffer, Size);<br>
-+#else<br>
-+=C2=A0 return -1;<br>
-+#endif<br>
- }<br>
- <br>
- static void PrintBacktrace(uintptr_t *Trace, size_t TraceLength,<br>
-@@ -40,6 +49,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t Trac=
eLength,<br>
-=C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0}<br>
- <br>
-+#ifdef __GLIBC__<br>
-=C2=A0 =C2=A0char **BacktraceSymbols =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0backtrace_symbols(reinterpret_cast&lt;void **&g=
t;(Trace), TraceLength);<br>
- <br>
-@@ -53,6 +63,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t Trac=
eLength,<br>
-=C2=A0 =C2=A0Printf(&quot;\n&quot;);<br>
-=C2=A0 =C2=A0if (BacktraceSymbols)<br>
-=C2=A0 =C2=A0 =C2=A0free(BacktraceSymbols);<br>
-+#endif<br>
- }<br>
- } // anonymous namespace<br>
- <br>
diff --git a/meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__in=
t128-for-ppc32.patch b/meta/recipes-devtools/clang/clang/0017-compiler-rt-E=
nable-__int128-for-ppc32.patch<br>
similarity index 77%<br>
rename from meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__int=
128-for-ppc32.patch<br>
rename to meta/recipes-devtools/clang/clang/0017-compiler-rt-Enable-__int12=
8-for-ppc32.patch<br>
index 89b492b877..12749e8f96 100644<br>
--- a/meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__int128-fo=
r-ppc32.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0017-compiler-rt-Enable-__int128-fo=
r-ppc32.patch<br>
@@ -1,4 +1,4 @@<br>
-From 968515d7aa2d7e4af5f318618c307dbe21538650 Mon Sep 17 00:00:00 2001<br>
+From 3a7b96edc836c0264206f01f5fc7e0cd1bc6c70c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 9 Mar 2022 16:28:16 -0800<br>
=C2=A0Subject: [PATCH] compiler-rt: Enable __int128 for ppc32<br>
@@ -6,15 +6,15 @@ Subject: [PATCH] compiler-rt: Enable __int128 for ppc32<b=
r>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
- compiler-rt/lib/builtins/CMakeLists.txt | 13 ++++++-------<br>
+ compiler-rt/lib/builtins/CMakeLists.txt | 17 ++++++-----------<br>
=C2=A0 compiler-rt/lib/builtins/int_types.h=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- 2 files changed, 7 insertions(+), 8 deletions(-)<br>
+ 2 files changed, 7 insertions(+), 12 deletions(-)<br>
<br>
=C2=A0diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/li=
b/builtins/CMakeLists.txt<br>
-index c3dbd65998f1..b3a44ea3c3b3 100644<br>
+index e128fea..eb108d7 100644<br>
=C2=A0--- a/compiler-rt/lib/builtins/CMakeLists.txt<br>
=C2=A0+++ b/compiler-rt/lib/builtins/CMakeLists.txt<br>
-@@ -813,11 +813,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}<br>
+@@ -916,11 +916,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}<br>
<br>
=C2=A0 set(nvptx64_SOURCES ${GENERIC_SOURCES})<br>
<br>
@@ -27,7 +27,7 @@ index c3dbd65998f1..b3a44ea3c3b3 100644<br>
=C2=A0 =C2=A0 ppc/divtc3.c<br>
=C2=A0 =C2=A0 ppc/fixtfdi.c<br>
=C2=A0 =C2=A0 ppc/fixunstfdi.c<br>
-@@ -832,14 +830,15 @@ set(powerpc64_SOURCES<br>
+@@ -935,11 +933,11 @@ set(powerpc64_SOURCES<br>
=C2=A0 )<br>
=C2=A0 # These routines require __int128, which isn&#39;t supported on AIX.=
<br>
=C2=A0 if (NOT OS_NAME MATCHES &quot;AIX&quot;)<br>
@@ -40,13 +40,23 @@ index c3dbd65998f1..b3a44ea3c3b3 100644<br>
=C2=A0+=C2=A0 =C2=A0 ${powerpc_SOURCES}<br>
=C2=A0 =C2=A0 )<br>
=C2=A0 endif()<br>
+ if (OS_NAME MATCHES &quot;AIX&quot;)<br>
+@@ -947,12 +945,9 @@ if (OS_NAME MATCHES &quot;AIX&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0ppc/init_ifuncs.c<br>
+=C2=A0 =C2=A0 =C2=A0${powerpc_SOURCES}<br>
+=C2=A0 =C2=A0)<br>
+-=C2=A0 set(powerpc64_SOURCES<br>
+-=C2=A0 =C2=A0 ppc/init_ifuncs.c<br>
+-=C2=A0 =C2=A0 ${powerpc64_SOURCES}<br>
+-=C2=A0 )<br>
+ endif()<br>
=C2=A0-set(powerpc64le_SOURCES ${powerpc64_SOURCES})<br>
=C2=A0+set(powerpc64le_SOURCES ${powerpc_SOURCES})<br>
=C2=A0+set(powerpc64_SOURCES ${powerpc_SOURCES})<br>
<br>
=C2=A0 set(riscv_SOURCES<br>
=C2=A0 =C2=A0 cpu_model/riscv.c<br>
-@@ -1014,7 +1013,7 @@ else ()<br>
+@@ -1125,7 +1120,7 @@ else ()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # For RISCV32 and 32-bit SPARC, we must force e=
nable int128 for compiling long<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # double routines.<br>
@@ -56,7 +66,7 @@ index c3dbd65998f1..b3a44ea3c3b3 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list(APPEND BUILTIN_CFLAGS_${arch} -ffor=
ce-enable-int128)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 endif()<br>
=C2=A0diff --git a/compiler-rt/lib/builtins/int_types.h b/compiler-rt/lib/b=
uiltins/int_types.h<br>
-index 7c7f8cb64aa9..81386f1b99b0 100644<br>
+index 6411507..754f8ce 100644<br>
=C2=A0--- a/compiler-rt/lib/builtins/int_types.h<br>
=C2=A0+++ b/compiler-rt/lib/builtins/int_types.h<br>
=C2=A0@@ -64,7 +64,7 @@ typedef union {<br>
diff --git a/meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-i=
nfra-to-detect-libzstd.patch b/meta/recipes-devtools/clang/clang/0018-llvm-=
Do-not-use-cmake-infra-to-detect-libzstd.patch<br>
similarity index 91%<br>
rename from meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-in=
fra-to-detect-libzstd.patch<br>
rename to meta/recipes-devtools/clang/clang/0018-llvm-Do-not-use-cmake-infr=
a-to-detect-libzstd.patch<br>
index cccb1e9885..167cd12431 100644<br>
--- a/meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-infra-to=
-detect-libzstd.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0018-llvm-Do-not-use-cmake-infra-to=
-detect-libzstd.patch<br>
@@ -1,4 +1,4 @@<br>
-From 8c5fc285de0051107aa9b7e2e269aa2667fd16f4 Mon Sep 17 00:00:00 2001<br>
+From f610b9f158e13a40f0e86f7a171be493f8ca64fe Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 12 Aug 2022 11:50:57 -0700<br>
=C2=A0Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd<br>
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0diff --git a/llvm/lib/Support/CMakeLists.txt b/llvm/lib/Support/CMake=
Lists.txt<br>
-index 099b0e55579b..8c35b8a31457 100644<br>
+index 1a3fa39..dd11f9a 100644<br>
=C2=A0--- a/llvm/lib/Support/CMakeLists.txt<br>
=C2=A0+++ b/llvm/lib/Support/CMakeLists.txt<br>
=C2=A0@@ -22,7 +22,7 @@ if (HAS_WERROR_GLOBAL_CTORS)<br>
@@ -42,7 +42,7 @@ index 099b0e55579b..8c35b8a31457 100644<br>
=C2=A0 endif()<br>
<br>
=C2=A0 if( WIN32 )<br>
-@@ -351,7 +351,7 @@ if(LLVM_ENABLE_ZLIB)<br>
+@@ -360,7 +360,7 @@ if(LLVM_ENABLE_ZLIB)<br>
=C2=A0 =C2=A0 =C2=A0 get_property(zlib_library TARGET ZLIB::ZLIB PROPERTY L=
OCATION)<br>
=C2=A0 =C2=A0 endif()<br>
=C2=A0 =C2=A0 get_library_name(${zlib_library} zlib_library)<br>
@@ -51,7 +51,7 @@ index 099b0e55579b..8c35b8a31457 100644<br>
=C2=A0 endif()<br>
<br>
=C2=A0 if(LLVM_ENABLE_ZSTD)<br>
-@@ -365,7 +365,7 @@ if(LLVM_ENABLE_ZSTD)<br>
+@@ -374,7 +374,7 @@ if(LLVM_ENABLE_ZSTD)<br>
=C2=A0 =C2=A0 endif()<br>
=C2=A0 =C2=A0 if (zstd_target STREQUAL zstd::libzstd_shared)<br>
=C2=A0 =C2=A0 =C2=A0 get_library_name(${zstd_library} zstd_library)<br>
diff --git a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-st=
ruct-s-size-for-O32-ABI.patch b/meta/recipes-devtools/clang/clang/0019-comp=
iler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch<br>
similarity index 91%<br>
rename from meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-str=
uct-s-size-for-O32-ABI.patch<br>
rename to meta/recipes-devtools/clang/clang/0019-compiler-rt-Fix-stat-struc=
t-s-size-for-O32-ABI.patch<br>
index a498c36b84..021f622894 100644<br>
--- a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-struct-s-=
size-for-O32-ABI.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Fix-stat-struct-s-=
size-for-O32-ABI.patch<br>
@@ -1,4 +1,4 @@<br>
-From 4a114f5fcd2ab8870b26ba3df4747fc066933f66 Mon Sep 17 00:00:00 2001<br>
+From 6917a5e0eb77c0134b59c3cb942292bc5c38e87f Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 3 Jan 2023 18:44:34 -0800<br>
=C2=A0Subject: [PATCH] compiler-rt: Fix stat struct&#39;s size for O32 ABI<=
br>
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 13 insertions(+)<br>
<br>
=C2=A0diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limi=
ts_posix.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_pos=
ix.h<br>
-index 05ebee49f2ab..89c4dcaf3e3d 100644<br>
+index 73eb958..b0dcbde 100644<br>
=C2=A0--- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posi=
x.h<br>
=C2=A0+++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posi=
x.h<br>
=C2=A0@@ -100,6 +100,18 @@ const unsigned struct_kernel_stat64_sz =3D 104;<=
br>
@@ -36,7 +36,7 @@ index 05ebee49f2ab..89c4dcaf3e3d 100644<br>
=C2=A0 const unsigned struct_kernel_stat_sz =3D SANITIZER_ANDROID<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0? FIRST_32_SECOND_64(104, 128)<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 if defined(_ABIN32) &amp;&amp; _MIPS_SIM =3D=
=3D _ABIN32<br>
-@@ -110,6 +122,7 @@ const unsigned struct_kernel_stat_sz =3D SANITIZER_AND=
ROID<br>
+@@ -116,6 +128,7 @@ const unsigned struct_kernel_stat_sz =3D SANITIZER_AND=
ROID<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0: FIRST_32_SECOND_64(160, 216);<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 endif<br>
=C2=A0 const unsigned struct_kernel_stat64_sz =3D 104;<br>
diff --git a/meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARML=
ibDirs-search-also-in-lib32.patch b/meta/recipes-devtools/clang/clang/0020-=
ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch<br>
similarity index 98%<br>
rename from meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARMLi=
bDirs-search-also-in-lib32.patch<br>
rename to meta/recipes-devtools/clang/clang/0020-ToolChains-Gnu.cpp-ARMLibD=
irs-search-also-in-lib32.patch<br>
index 09224af386..19784aef10 100644<br>
--- a/meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARMLibDirs-=
search-also-in-lib32.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0020-ToolChains-Gnu.cpp-ARMLibDirs-=
search-also-in-lib32.patch<br>
@@ -1,4 +1,4 @@<br>
-From 27e4b9755ddd3bec16a851cce0df48e909ae6438 Mon Sep 17 00:00:00 2001<br>
+From 0d7e696f552b1047e89c5114551b6dc902e6f0f1 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 31 Aug 2023 18:14:47 +0200<br>
=C2=A0Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32<=
br>
@@ -55,10 +55,10 @@ Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Marti=
n.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 2 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/T=
oolChains/Gnu.cpp<br>
-index 80fd8058bd98..37cb6cfdf2da 100644<br>
+index 73ff1f4..6a2b362 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Gnu.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Gnu.cpp<br>
-@@ -2346,7 +2346,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(<br>
+@@ -2347,7 +2347,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(<br>
=C2=A0 =C2=A0 static const char *const AArch64beLibDirs[] =3D {&quot;/lib&q=
uot;};<br>
=C2=A0 =C2=A0 static const char *const AArch64beTriples[] =3D {&quot;aarch6=
4_be-none-linux-gnu&quot;};<br>
<br>
@@ -68,10 +68,10 @@ index 80fd8058bd98..37cb6cfdf2da 100644<br>
=C2=A0 =C2=A0 static const char *const ARMHFTriples[] =3D {&quot;arm-linux-=
gnueabihf&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;armv7hl-redhat-linux-gnueabi&quot;,<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
-index 9fed904c05c2..5bb66c9faa1f 100644<br>
+index 41e0017..5f8b7fd 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
-@@ -198,6 +198,7 @@ static StringRef getOSLibDir(const llvm::Triple &amp;T=
riple, const ArgList &amp;Args) {<br>
+@@ -199,6 +199,7 @@ static StringRef getOSLibDir(const llvm::Triple &amp;T=
riple, const ArgList &amp;Args) {<br>
=C2=A0 =C2=A0 // reasoning about oslibdir spellings with the lib dir spelli=
ngs in the<br>
=C2=A0 =C2=A0 // GCCInstallationDetector, but that is a more significant re=
factoring.<br>
=C2=A0 =C2=A0 if (Triple.getArch() =3D=3D llvm::Triple::x86 || Triple.isPPC=
32() ||<br>
diff --git a/meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-speci=
fic-ABI-triple-for-N32-ABI.patch b/meta/recipes-devtools/clang/clang/0021-c=
lang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch<br>
similarity index 60%<br>
rename from meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-specif=
ic-ABI-triple-for-N32-ABI.patch<br>
rename to meta/recipes-devtools/clang/clang/0021-clang-llvm-Add-OE-specific=
-ABI-triple-for-N32-ABI.patch<br>
index c93a9ec7e0..6577380978 100644<br>
--- a/meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-specific-ABI=
-triple-for-N32-ABI.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0021-clang-llvm-Add-OE-specific-ABI=
-triple-for-N32-ABI.patch<br>
@@ -1,4 +1,4 @@<br>
-From 7023d17f81a472e72a5739e007b9e7148d105137 Mon Sep 17 00:00:00 2001<br>
+From 33988376d79f9eca5f54000cdcc558c8dc3d89ba Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 3 Feb 2024 16:47:10 -0800<br>
=C2=A0Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI<b=
r>
@@ -8,16 +8,17 @@ Its gnun32 when using OE<br>
=C2=A0Upstream-Status: Inappropriate [OE-Specific]<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
- clang/lib/Driver/ToolChains/Gnu.cpp=C2=A0 =C2=A0| 1 +<br>
- clang/lib/Driver/ToolChains/Linux.cpp | 4 ++--<br>
- llvm/lib/TargetParser/Triple.cpp=C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
- 3 files changed, 6 insertions(+), 3 deletions(-)<br>
+ clang/lib/Driver/ToolChains/Gnu.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 +<br>
+ clang/lib/Driver/ToolChains/Linux.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
+ llvm/include/llvm/TargetParser/TripleName.def | 2 +-<br>
+ llvm/lib/TargetParser/Triple.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 2 ++<br>
+ 4 files changed, 6 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/T=
oolChains/Gnu.cpp<br>
-index 37cb6cfdf2da..bcd7d345c25a 100644<br>
+index 6a2b362..05d1c44 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Gnu.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Gnu.cpp<br>
-@@ -2415,6 +2415,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(<br>
+@@ -2416,6 +2416,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(<br>
<br>
=C2=A0 =C2=A0 static const char *const MIPSN32LibDirs[] =3D {&quot;/lib32&q=
uot;};<br>
=C2=A0 =C2=A0 static const char *const MIPSN32Triples[] =3D {&quot;mips64-l=
inux-gnuabin32&quot;,<br>
@@ -26,10 +27,10 @@ index 37cb6cfdf2da..bcd7d345c25a 100644<br>
=C2=A0 =C2=A0 static const char *const MIPSN32ELLibDirs[] =3D {&quot;/lib32=
&quot;};<br>
=C2=A0 =C2=A0 static const char *const MIPSN32ELTriples[] =3D {<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
-index 5bb66c9faa1f..c6d6e20dbc4d 100644<br>
+index 5f8b7fd..ac7bd3a 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
-@@ -138,7 +138,7 @@ std::string Linux::getMultiarchTriple(const Driver &am=
p;D,<br>
+@@ -139,7 +139,7 @@ std::string Linux::getMultiarchTriple(const Driver &am=
p;D,<br>
=C2=A0 =C2=A0 =C2=A0 return IsMipsR6 ? &quot;mipsisa32r6el-linux-gnu&quot; =
: &quot;mipsel-linux-gnu&quot;;<br>
=C2=A0 =C2=A0 case llvm::Triple::mips64: {<br>
=C2=A0 =C2=A0 =C2=A0 std::string MT =3D std::string(IsMipsR6 ? &quot;mipsis=
a64r6&quot; : &quot;mips64&quot;) +<br>
@@ -38,7 +39,7 @@ index 5bb66c9faa1f..c6d6e20dbc4d 100644<br>
=C2=A0 =C2=A0 =C2=A0 if (D.getVFS().exists(concat(SysRoot, &quot;/lib&quot;=
, MT)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MT;<br>
=C2=A0 =C2=A0 =C2=A0 if (D.getVFS().exists(concat(SysRoot, &quot;/lib/mips6=
4-linux-gnu&quot;)))<br>
-@@ -147,7 +147,7 @@ std::string Linux::getMultiarchTriple(const Driver &am=
p;D,<br>
+@@ -148,7 +148,7 @@ std::string Linux::getMultiarchTriple(const Driver &am=
p;D,<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 case llvm::Triple::mips64el: {<br>
=C2=A0 =C2=A0 =C2=A0 std::string MT =3D std::string(IsMipsR6 ? &quot;mipsis=
a64r6el&quot; : &quot;mips64el&quot;) +<br>
@@ -47,28 +48,32 @@ index 5bb66c9faa1f..c6d6e20dbc4d 100644<br>
=C2=A0 =C2=A0 =C2=A0 if (D.getVFS().exists(concat(SysRoot, &quot;/lib&quot;=
, MT)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MT;<br>
=C2=A0 =C2=A0 =C2=A0 if (D.getVFS().exists(concat(SysRoot, &quot;/lib/mips6=
4el-linux-gnu&quot;)))<br>
+diff --git a/llvm/include/llvm/TargetParser/TripleName.def b/llvm/include/=
llvm/TargetParser/TripleName.def<br>
+index bbc03b3..081d8ff 100644<br>
+--- a/llvm/include/llvm/TargetParser/TripleName.def<br>
++++ b/llvm/include/llvm/TargetParser/TripleName.def<br>
+@@ -102,7 +102,7 @@ TRIPLE_OS(H2, &quot;h2&quot;)<br>
+ <br>
+ TRIPLE_ENV(EABIHF, &quot;eabihf&quot;)<br>
+ TRIPLE_ENV(EABI, &quot;eabi&quot;)<br>
+-TRIPLE_ENV(GNUABIN32, &quot;gnuabin32&quot;)<br>
++TRIPLE_ENV(GNUABIN32, &quot;gnun32&quot;)<br>
+ TRIPLE_ENV(GNUABI64, &quot;gnuabi64&quot;)<br>
+ TRIPLE_ENV(GNUEABIHFT64, &quot;gnueabihft64&quot;)<br>
+ TRIPLE_ENV(GNUEABIHF, &quot;gnueabihf&quot;)<br>
=C2=A0diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser=
/Triple.cpp<br>
-index 86b74451ec0d..d94b7d44d11a 100644<br>
+index 883e654..aa2bb35 100644<br>
=C2=A0--- a/llvm/lib/TargetParser/Triple.cpp<br>
=C2=A0+++ b/llvm/lib/TargetParser/Triple.cpp<br>
-@@ -358,7 +358,7 @@ StringRef Triple::getEnvironmentTypeName(EnvironmentTy=
pe Kind) {<br>
-=C2=A0 =C2=A0case GNU: return &quot;gnu&quot;;<br>
-=C2=A0 =C2=A0case GNUT64: return &quot;gnut64&quot;;<br>
-=C2=A0 =C2=A0case GNUABI64: return &quot;gnuabi64&quot;;<br>
--=C2=A0 case GNUABIN32: return &quot;gnuabin32&quot;;<br>
-+=C2=A0 case GNUABIN32: return &quot;gnun32&quot;;<br>
-=C2=A0 =C2=A0case GNUEABI: return &quot;gnueabi&quot;;<br>
-=C2=A0 =C2=A0case GNUEABIT64: return &quot;gnueabit64&quot;;<br>
-=C2=A0 =C2=A0case GNUEABIHF: return &quot;gnueabihf&quot;;<br>
-@@ -762,6 +762,7 @@ static Triple::EnvironmentType parseEnvironment(String=
Ref EnvironmentName) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith(&quot;eabihf&quot;, Triple::EABIHF)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith(&quot;eabi&quot;, Triple::EABI)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith(&quot;gnuabin32&quot;, Triple::GNUA=
BIN32)<br>
-+=C2=A0 =C2=A0 =C2=A0 .StartsWith(&quot;gnun32&quot;, Triple::GNUABIN32)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith(&quot;gnuabi64&quot;, Triple::GNUAB=
I64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith(&quot;gnueabihft64&quot;, Triple::G=
NUEABIHFT64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith(&quot;gnueabihf&quot;, Triple::GNUE=
ABIHF)<br>
-@@ -1087,6 +1088,7 @@ Triple::Triple(std::string &amp;&amp;Str) : Data(std=
::move(Str)) {<br>
+@@ -755,6 +755,7 @@ static Triple::OSType parseOS(StringRef OSName) {<br>
+ <br>
+ static Triple::EnvironmentType parseEnvironment(StringRef EnvironmentName=
) {<br>
+=C2=A0 =C2=A0return StringSwitch&lt;Triple::EnvironmentType&gt;(Environmen=
tName)<br>
++=C2=A0 =C2=A0 =C2=A0 .StartsWith(&quot;gnuabin32&quot;, Triple::GNUABIN32=
)<br>
+ #define TRIPLE_ENV(Enum, Name) .StartsWith(Name, Triple::Enum)<br>
+ #include &quot;llvm/TargetParser/TripleName.def&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.Default(Triple::UnknownEnvironment);<br>
+@@ -1106,6 +1107,7 @@ Triple::Triple(std::string &amp;&amp;Str) : Data(std=
::move(Str)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Environment =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 StringSwitch&lt;Triple::Environme=
ntType&gt;(Components[0])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .StartsWith(&quot;m=
ipsn32&quot;, Triple::GNUABIN32)<br></blockquote><div><br></div><div>=C2=A0=
 =C2=A0.def already has an alias mechanism (<code>TRIPLE_VENDOR_ALIAS</code=
> appears in the vendor rework) =E2=80=94 if <code>TRIPLE_ENV_ALIAS</code> =
exists too, using it for <code>gnuabin32</code> would keep the compat spell=
ing in the table itself instead of hand-editing <code>parseEnvironment</cod=
e>, which will rebase more cleanly next=C2=A0 =C2=A0</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.i=
n-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0022-ll=
vm-Add-libunwind.pc.in-and-llvm-config-scripts.patch<br>
similarity index 84%<br>
rename from meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in=
-and-llvm-config-scripts.patch<br>
rename to meta/recipes-devtools/clang/clang/0022-llvm-Add-libunwind.pc.in-a=
nd-llvm-config-scripts.patch<br>
index 72ffdc6c1f..34ba534074 100644<br>
--- a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-l=
lvm-config-scripts.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0022-llvm-Add-libunwind.pc.in-and-l=
lvm-config-scripts.patch<br>
@@ -1,4 +1,4 @@<br>
-From 17a1a4919c0ff554fc30bbb85a63b9d2a1164324 Mon Sep 17 00:00:00 2001<br>
+From 9ec97845821ead65ebd8ab26b69d949e10b65338 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 14 May 2024 22:04:43 -0700<br>
=C2=A0Subject: [PATCH] llvm: Add <a href=3D"http://libunwind.pc.in" rel=3D"=
noreferrer" target=3D"_blank">libunwind.pc.in</a> and llvm-config scripts<b=
r>
@@ -10,15 +10,15 @@ Upstream-Status: Inappropriate [ OE-Specific ]<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Var=
atharajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.c=
om</a>&gt;<br>
=C2=A0---<br>
- libunwind/<a href=3D"http://libunwind.pc.in" rel=3D"noreferrer" target=3D=
"_blank">libunwind.pc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++=
++++<br>
- llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++<br=
>
- 2 files changed, 61 insertions(+)<br>
+ libunwind/<a href=3D"http://libunwind.pc.in" rel=3D"noreferrer" target=3D=
"_blank">libunwind.pc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++=
+++++++<br>
+ llvm/tools/llvm-config/llvm-config | 15 +++++++++++++++<br>
+ 2 files changed, 24 insertions(+)<br>
=C2=A0 create mode 100644 libunwind/<a href=3D"http://libunwind.pc.in" rel=
=3D"noreferrer" target=3D"_blank">libunwind.pc.in</a><br>
=C2=A0 create mode 100644 llvm/tools/llvm-config/llvm-config<br>
<br>
=C2=A0diff --git a/libunwind/<a href=3D"http://libunwind.pc.in" rel=3D"nore=
ferrer" target=3D"_blank">libunwind.pc.in</a> b/libunwind/<a href=3D"http:/=
/libunwind.pc.in" rel=3D"noreferrer" target=3D"_blank">libunwind.pc.in</a><=
br>
=C2=A0new file mode 100644<br>
-index 000000000000..a93d676604f9<br>
+index 0000000..a93d676<br>
=C2=A0--- /dev/null<br>
=C2=A0+++ b/libunwind/<a href=3D"http://libunwind.pc.in" rel=3D"noreferrer"=
 target=3D"_blank">libunwind.pc.in</a><br>
=C2=A0@@ -0,0 +1,9 @@<br>
@@ -33,7 +33,7 @@ index 000000000000..a93d676604f9<br>
=C2=A0+Libs: -lunwind<br>
=C2=A0diff --git a/llvm/tools/llvm-config/llvm-config b/llvm/tools/llvm-con=
fig/llvm-config<br>
=C2=A0new file mode 100644<br>
-index 000000000000..6a0dd54b8eab<br>
+index 0000000..0578773<br>
=C2=A0--- /dev/null<br>
=C2=A0+++ b/llvm/tools/llvm-config/llvm-config<br>
=C2=A0@@ -0,0 +1,15 @@<br>
diff --git a/meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-L=
LVM_LIBDIR_SUFFIX-like-other-.patch b/meta/recipes-devtools/clang/clang/002=
3-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch<br>
similarity index 90%<br>
rename from meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LL=
VM_LIBDIR_SUFFIX-like-other-.patch<br>
rename to meta/recipes-devtools/clang/clang/0023-scan-build-py-respect-LLVM=
_LIBDIR_SUFFIX-like-other-.patch<br>
index 934d5adc50..55ad603b7c 100644<br>
--- a/meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LLVM_LIB=
DIR_SUFFIX-like-other-.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0023-scan-build-py-respect-LLVM_LIB=
DIR_SUFFIX-like-other-.patch<br>
@@ -1,7 +1,8 @@<br>
-From a2171be64a181e0b263fc8ec31a760193651203c Mon Sep 17 00:00:00 2001<br>
+From b9565c7e6525f3ca20df3171c36698b521a45594 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" targ=
et=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 13 Sep 2024 13:38:08 +0200<br>
-Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other tool=
s do<br>
+Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other<br>
+ tools do<br>
<br>
=C2=A0* other libraries are installed in &#39;lib64&#39; or &#39;lib32&#39;=
 based on<br>
=C2=A0 =C2=A0LLVM_LIBDIR_SUFFIX value, but libscanbuild files were always<b=
r>
@@ -11,13 +12,13 @@ Upstream-Status: Submitted [<a href=3D"https://github.c=
om/llvm/llvm-project/pull/108549" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/llvm/llvm-project/pull/108549</a>]<br>
<br>
=C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
=C2=A0---<br>
- clang/tools/scan-build-py/CMakeLists.txt | 26 ++++++++++++------------<br=
>
- 1 file changed, 13 insertions(+), 13 deletions(-)<br>
+ clang/tools/scan-build-py/CMakeLists.txt | 32 ++++++++++++------------<br=
>
+ 1 file changed, 16 insertions(+), 16 deletions(-)<br>
<br>
-Index: llvm-project-22.1.2.src/clang/tools/scan-build-py/CMakeLists.txt<br=
>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- llvm-project-22.1.2.src.orig/clang/tools/scan-build-py/CMakeLists.txt<=
br>
-+++ llvm-project-22.1.2.src/clang/tools/scan-build-py/CMakeLists.txt<br>
+diff --git a/clang/tools/scan-build-py/CMakeLists.txt b/clang/tools/scan-b=
uild-py/CMakeLists.txt<br>
+index 84087a9..9647642 100644<br>
+--- a/clang/tools/scan-build-py/CMakeLists.txt<br>
++++ b/clang/tools/scan-build-py/CMakeLists.txt<br>
=C2=A0@@ -80,52 +80,52 @@ if(CLANG_INSTALL_SCANBUILDPY)<br>
=C2=A0 =C2=A0 endforeach()<br>
<br>
diff --git a/meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass=
-target-to-clang-compiler.patch b/meta/recipes-devtools/clang/clang/0024-co=
mpiler-rt-Do-not-pass-target-to-clang-compiler.patch<br>
similarity index 91%<br>
rename from meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass-=
target-to-clang-compiler.patch<br>
rename to meta/recipes-devtools/clang/clang/0024-compiler-rt-Do-not-pass-ta=
rget-to-clang-compiler.patch<br>
index fe24fe051b..b3fb642742 100644<br>
--- a/meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass-target=
-to-clang-compiler.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0024-compiler-rt-Do-not-pass-target=
-to-clang-compiler.patch<br>
@@ -1,4 +1,4 @@<br>
-From 6b1f360c66b60c4bb639057590a8b2162d3bcf6b Mon Sep 17 00:00:00 2001<br>
+From f68925e7c31fa4bdd684a4ab44fd1350bb43205b Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 13 Mar 2025 00:30:38 -0700<br>
=C2=A0Subject: [PATCH] compiler-rt: Do not pass --target to clang compiler<=
br>
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 4 deletions(-)<br>
<br>
=C2=A0diff --git a/compiler-rt/lib/fuzzer/CMakeLists.txt b/compiler-rt/lib/=
fuzzer/CMakeLists.txt<br>
-index a57e2fe46245..2928ed2ab6d5 100644<br>
+index 2da488d..9af4410 100644<br>
=C2=A0--- a/compiler-rt/lib/fuzzer/CMakeLists.txt<br>
=C2=A0+++ b/compiler-rt/lib/fuzzer/CMakeLists.txt<br>
=C2=A0@@ -140,10 +140,6 @@ if(OS_NAME MATCHES &quot;Android|Linux|Fuchsia&q=
uot; AND<br>
diff --git a/meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-=
ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/clang/clang/002=
5-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch<br>
similarity index 92%<br>
rename from meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-C=
lassInfo-lists-by-name-as-we.patch<br>
rename to meta/recipes-devtools/clang/clang/0025-AsmMatcherEmitter-sort-Cla=
ssInfo-lists-by-name-as-we.patch<br>
index 413bc3f275..28d0567e15 100644<br>
--- a/meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-ClassIn=
fo-lists-by-name-as-we.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0025-AsmMatcherEmitter-sort-ClassIn=
fo-lists-by-name-as-we.patch<br>
@@ -1,4 +1,4 @@<br>
-From 281cd05306cbfa5744e4a1f3ebf5c745324efe7a Mon Sep 17 00:00:00 2001<br>
+From bf8a65efcdce65143081785b9ed8759d60be1bd4 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 27 Nov 2020 10:11:08 +0000<br>
=C2=A0Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as w=
ell<br>
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/T=
ableGen/AsmMatcherEmitter.cpp<br>
-index e6085af5aa91..b0180638c754 100644<br>
+index 4af5c85..917aeec 100644<br>
=C2=A0--- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp<br>
=C2=A0+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp<br>
=C2=A0@@ -384,7 +384,10 @@ public:<br>
diff --git a/meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM=
_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/clang/clang/0026=
-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch<br>
similarity index 92%<br>
rename from meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM_=
LDFLAGS-from-ldflags-output.patch<br>
rename to meta/recipes-devtools/clang/clang/0026-llvm-config-remove-LLVM_LD=
FLAGS-from-ldflags-output.patch<br>
index e059748873..7724af8009 100644<br>
--- a/meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM_LDFLAG=
S-from-ldflags-output.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0026-llvm-config-remove-LLVM_LDFLAG=
S-from-ldflags-output.patch<br>
@@ -1,4 +1,4 @@<br>
-From cbc2595eed96fa7de77162e4c7b99681579d01ef Mon Sep 17 00:00:00 2001<br>
+From f58186cc6ba2fff4d2e9fb624a904b1c5a4f7733 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qua=
lcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<br>
=C2=A0Date: Wed, 2 Apr 2025 17:05:17 +0300<br>
=C2=A0Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags outp=
ut<br>
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm=
-config/llvm-config.cpp<br>
-index 0a3f51ae2b83..5c95a1f3ff24 100644<br>
+index 64795e9..3e57005 100644<br>
=C2=A0--- a/llvm/tools/llvm-config/llvm-config.cpp<br>
=C2=A0+++ b/llvm/tools/llvm-config/llvm-config.cpp<br>
=C2=A0@@ -576,7 +576,7 @@ int main(int argc, char **argv) {<br>
diff --git a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-syn=
c_fetch_and_-for-any-pre-ARMv.patch b/meta/recipes-devtools/clang/clang/002=
7-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch<br>
similarity index 95%<br>
rename from meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sync=
_fetch_and_-for-any-pre-ARMv.patch<br>
rename to meta/recipes-devtools/clang/clang/0027-compiler-rt-Exclude-sync_f=
etch_and_-for-any-pre-ARMv.patch<br>
index 52bdeaf9d5..a1847f99f9 100644<br>
--- a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sync_fetch=
_and_-for-any-pre-ARMv.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0027-compiler-rt-Exclude-sync_fetch=
_and_-for-any-pre-ARMv.patch<br>
@@ -1,4 +1,4 @@<br>
-From 3a486a17b697c65cdc7d2c17d9e14f2bfc2be911 Mon Sep 17 00:00:00 2001<br>
+From 9046478db7833765487e66d5a3706b7cb67f1ee2 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 10 May 2025 14:03:12 -0700<br>
=C2=A0Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-AR=
Mv6<br>
@@ -40,10 +40,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 12 insertions(+)<br>
<br>
=C2=A0diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/li=
b/builtins/CMakeLists.txt<br>
-index b3a44ea3c3b3..4a328ab0ca26 100644<br>
+index eb108d7..4041119 100644<br>
=C2=A0--- a/compiler-rt/lib/builtins/CMakeLists.txt<br>
=C2=A0+++ b/compiler-rt/lib/builtins/CMakeLists.txt<br>
-@@ -975,6 +975,18 @@ else ()<br>
+@@ -1082,6 +1082,18 @@ else ()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${TARGET_${arch}_CFLAGS})<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 list(JOIN CMAKE_REQUIRED_FLAGS &quot; &quot; CM=
AKE_REQUIRED_FLAGS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 message(STATUS &quot;Performing additional conf=
igure checks with target flags: ${CMAKE_REQUIRED_FLAGS}&quot;)<br>
diff --git a/meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-up=
tr-sptr-typedefs-on-Mips-Linu.patch b/meta/recipes-devtools/clang/clang/002=
8-Hardcode-uptr-sptr-typedefs-on-Mips-Linux.patch<br>
similarity index 86%<br>
rename from meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-upt=
r-sptr-typedefs-on-Mips-Linu.patch<br>
rename to meta/recipes-devtools/clang/clang/0028-Hardcode-uptr-sptr-typedef=
s-on-Mips-Linux.patch<br>
index b0aae5457a..d3a9a6c308 100644<br>
--- a/meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-uptr-sptr=
-typedefs-on-Mips-Linu.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0028-Hardcode-uptr-sptr-typedefs-on=
-Mips-Linux.patch<br>
@@ -1,7 +1,7 @@<br>
-From b71c398a1b10b29886c2db2a920f476fec6f7de2 Mon Sep 17 00:00:00 2001<br>
+From aab77dfb9c2e1a118ffb5bd690f34bf93b6f3f36 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 22 May 2025 21:50:45 -0700<br>
-Subject: [PATCH] [compiler-rt] Hardcode uptr/sptr typedefs on Mips/Linux<b=
r>
+Subject: [PATCH] Hardcode uptr/sptr typedefs on Mips/Linux<br>
<br>
=C2=A0Sanitizer build on Mips/Linux faills to build due to assertion errors=
<br>
=C2=A0mismatched definitions. This is due to inconsistent definitions of<br=
>
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs=
.h b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h<br>
-index c719e2a8ef60..60b997e653c4 100644<br>
+index c694897..08f6d35 100644<br>
=C2=A0--- a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h<br>
=C2=A0+++ b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h<br>
-@@ -139,7 +139,7 @@<br>
+@@ -143,7 +143,7 @@<br>
=C2=A0 namespace __sanitizer {<br>
<br>
=C2=A0 #if defined(__UINTPTR_TYPE__)<br>
diff --git a/meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-heade=
rs-in-the-debug-info-when-bui.patch b/meta/recipes-devtools/clang/clang/002=
9-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch<br>
similarity index 89%<br>
rename from meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-header=
s-in-the-debug-info-when-bui.patch<br>
rename to meta/recipes-devtools/clang/clang/0029-Revert-libc-Remap-headers-=
in-the-debug-info-when-bui.patch<br>
index 57003dcf56..faae71645a 100644<br>
--- a/meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-headers-in-t=
he-debug-info-when-bui.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0029-Revert-libc-Remap-headers-in-t=
he-debug-info-when-bui.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9ace97c0c2df52d823c9d5345cca0251bf2ccf16 Mon Sep 17 00:00:00 2001<br>
+From cffcea54bf4605d958407edb233fffdbe730f4af Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 27 Jul 2025 19:12:13 -0700<br>
=C2=A0Subject: [PATCH] Revert &quot;[libc++] Remap headers in the debug inf=
o when<br>
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 5 deletions(-)<br>
<br>
=C2=A0diff --git a/libcxx/include/CMakeLists.txt b/libcxx/include/CMakeList=
s.txt<br>
-index 787cfffa5019..d73bcd852a1e 100644<br>
+index b40f586..7bd7622 100644<br>
=C2=A0--- a/libcxx/include/CMakeLists.txt<br>
=C2=A0+++ b/libcxx/include/CMakeLists.txt<br>
-@@ -1718,11 +1718,6 @@ add_dependencies(cxx-headers generate-cxx-headers)<=
br>
+@@ -1728,11 +1728,6 @@ add_dependencies(cxx-headers generate-cxx-headers)<=
br>
=C2=A0 target_include_directories(cxx-headers INTERFACE ${LIBCXX_GENERATED_=
INCLUDE_TARGET_DIR}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${LIBCXX_GENERATED_INCLUDE_DIR})<br>
<br>
diff --git a/meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_=
OPT_VIEWER_MODULES-externally.patch b/meta/recipes-devtools/clang/clang/003=
0-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch<br>
similarity index 86%<br>
rename from meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_O=
PT_VIEWER_MODULES-externally.patch<br>
rename to meta/recipes-devtools/clang/clang/0030-Don-t-expose-LLVM_HAVE_OPT=
_VIEWER_MODULES-externally.patch<br>
index 0cdb2ad668..af9564053c 100644<br>
--- a/meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_OPT_VIE=
WER_MODULES-externally.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0030-Don-t-expose-LLVM_HAVE_OPT_VIE=
WER_MODULES-externally.patch<br>
@@ -1,4 +1,4 @@<br>
-From 53da129f7986c5bd310f4f4a8236987df7e073c6 Mon Sep 17 00:00:00 2001<br>
+From b6a9ddd0ba2d8bd14871c135157f3878a9d629c1 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=
=3D"_blank">ross.burton@arm.com</a>&gt;<br>
=C2=A0Date: Mon, 29 Sep 2025 14:44:05 +0100<br>
=C2=A0Subject: [PATCH] Don&#39;t expose LLVM_HAVE_OPT_VIEWER_MODULES extern=
ally<br>
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/llvm/cmake/modules/<a href=3D"http://LLVMConfig.cmake.in=
" rel=3D"noreferrer" target=3D"_blank">LLVMConfig.cmake.in</a> b/llvm/cmake=
/modules/<a href=3D"http://LLVMConfig.cmake.in" rel=3D"noreferrer" target=
=3D"_blank">LLVMConfig.cmake.in</a><br>
-index 70c807abea98..5603c9215332 100644<br>
+index 6f5fcc6..ce07563 100644<br>
=C2=A0--- a/llvm/cmake/modules/<a href=3D"http://LLVMConfig.cmake.in" rel=
=3D"noreferrer" target=3D"_blank">LLVMConfig.cmake.in</a><br>
=C2=A0+++ b/llvm/cmake/modules/<a href=3D"http://LLVMConfig.cmake.in" rel=
=3D"noreferrer" target=3D"_blank">LLVMConfig.cmake.in</a><br>
-@@ -137,7 +137,6 @@ set(LLVM_DEFINITIONS &quot;@LLVM_DEFINITIONS@&quot;)<b=
r>
+@@ -145,7 +145,6 @@ set(LLVM_DEFINITIONS &quot;@LLVM_DEFINITIONS@&quot;)<b=
r>
=C2=A0 set(LLVM_BINARY_DIR &quot;@LLVM_CONFIG_BINARY_DIR@&quot;)<br>
=C2=A0 set(LLVM_CMAKE_DIR &quot;@LLVM_CONFIG_CMAKE_DIR@&quot;)<br>
=C2=A0 set(LLVM_TOOLS_BINARY_DIR &quot;@LLVM_CONFIG_TOOLS_BINARY_DIR@&quot;=
)<br>
diff --git a/meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-=
tblgen-if-it-is-actually-need.patch b/meta/recipes-devtools/clang/clang/003=
1-Only-build-clang-tblgen-if-it-is-actually-needed.patch<br>
similarity index 81%<br>
rename from meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-t=
blgen-if-it-is-actually-need.patch<br>
rename to meta/recipes-devtools/clang/clang/0031-Only-build-clang-tblgen-if=
-it-is-actually-needed.patch<br>
index 5efe043eaf..690791c5e3 100644<br>
--- a/meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-tblgen-=
if-it-is-actually-need.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0031-Only-build-clang-tblgen-if-it-=
is-actually-needed.patch<br>
@@ -1,7 +1,7 @@<br>
-From de58b9bbc8c52299ff22c4f0ab21e3878d411669 Mon Sep 17 00:00:00 2001<br>
+From a55e7674203ffcb42e4e3ee4c8cf7aa964aee086 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=
=3D"_blank">ross.burton@arm.com</a>&gt;<br>
=C2=A0Date: Sat, 11 Oct 2025 16:01:50 -0700<br>
-Subject: [PATCH] [clang] Only build clang-tblgen if it is actually needed<=
br>
+Subject: [PATCH] Only build clang-tblgen if it is actually needed<br>
<br>
=C2=A0It&#39;s possible to build clang with an existing clang-tblgen (commo=
n when<br>
=C2=A0cross-compiling, for instance) by setting CLANG_TABLEGEN_EXE.=C2=A0 I=
f this<br>
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt<br>
-index e4cb1a359620..b650b3b986f4 100644<br>
+index 89f584c..bd7ebc3 100644<br>
=C2=A0--- a/clang/CMakeLists.txt<br>
=C2=A0+++ b/clang/CMakeLists.txt<br>
-@@ -479,7 +479,9 @@ option(CLANG_ENABLE_HLSL &quot;Include HLSL build prod=
ucts&quot; Off)<br>
+@@ -531,7 +531,9 @@ option(CLANG_ENABLE_HLSL &quot;Include HLSL build prod=
ucts&quot; Off)<br>
=C2=A0 # While HLSL support is experimental this should stay hidden.<br>
=C2=A0 mark_as_advanced(CLANG_ENABLE_HLSL)<br>
<br>
diff --git a/meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink=
-path-for-libcc-when-LLVM_ENA.patch b/meta/recipes-devtools/clang/clang/003=
2-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch<br>
similarity index 93%<br>
rename from meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-=
path-for-libcc-when-LLVM_ENA.patch<br>
rename to meta/recipes-devtools/clang/clang/0032-llvm-libgcc-Fix-symlink-pa=
th-for-libcc-when-LLVM_ENA.patch<br>
index 583e91e497..6081f2d7b4 100644<br>
--- a/meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-path-f=
or-libcc-when-LLVM_ENA.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0032-llvm-libgcc-Fix-symlink-path-f=
or-libcc-when-LLVM_ENA.patch<br>
@@ -1,4 +1,4 @@<br>
-From bca77d818187e68989dfa9e386b38632b76a477e Mon Sep 17 00:00:00 2001<br>
+From b383508d002bb41ac979ab356f73fcf0ae97ca00 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 28 Oct 2025 15:44:49 -0700<br>
=C2=A0Subject: [PATCH] llvm-libgcc: Fix symlink path for libcc when<br>
@@ -33,10 +33,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 13 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt<=
br>
-index 47208fc19869..54009c1104c3 100644<br>
+index a297447..1ae9167 100644<br>
=C2=A0--- a/llvm-libgcc/CMakeLists.txt<br>
=C2=A0+++ b/llvm-libgcc/CMakeLists.txt<br>
-@@ -124,11 +124,21 @@ target_link_libraries(unwind_shared PUBLIC<br>
+@@ -133,11 +133,21 @@ target_link_libraries(unwind_shared PUBLIC<br>
=C2=A0 #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0 get_compiler_rt_install_dir(${COMPILER_RT_DEFAULT_TARGET_ARCH} insta=
ll_dir_builtins)<br>
@@ -60,7 +60,7 @@ index 47208fc19869..54009c1104c3 100644<br>
=C2=A0 =C2=A0 string(PREPEND install_dir_builtins &quot;../&quot;)<br>
=C2=A0 endif()<br>
=C2=A0 set(LLVM_LIBGCC_COMPILER_RT ${install_dir_builtins}/libclang_rt.buil=
tins${builtins_suffix}.a)<br>
-@@ -137,7 +147,7 @@ add_custom_target(llvm-libgcc ALL<br>
+@@ -146,7 +156,7 @@ add_custom_target(llvm-libgcc ALL<br>
=C2=A0 =C2=A0 DEPENDS unwind_shared unwind_static clang_rt.builtins-${COMPI=
LER_RT_DEFAULT_TARGET_ARCH}<br>
=C2=A0 =C2=A0 COMMAND ${CMAKE_COMMAND} -E create_symlink ${LLVM_LIBGCC_COMP=
ILER_RT} libgcc.a<br>
=C2=A0 =C2=A0 COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.a libgcc=
_eh.a<br>
diff --git a/meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sys=
root-based-compiler-rt-search.patch b/meta/recipes-devtools/clang/clang/003=
3-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch<br>
similarity index 91%<br>
rename from meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysr=
oot-based-compiler-rt-search.patch<br>
rename to meta/recipes-devtools/clang/clang/0033-Consolidate-and-fix-sysroo=
t-based-compiler-rt-search.patch<br>
index a2a7fa80f1..ecaaa738a7 100644<br>
--- a/meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysroot-ba=
sed-compiler-rt-search.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0033-Consolidate-and-fix-sysroot-ba=
sed-compiler-rt-search.patch<br>
@@ -1,7 +1,8 @@<br>
-From b818a92ac171e80e39ad9e99d1f862d23f2bb5b3 Mon Sep 17 00:00:00 2001<br>
+From 7da49a0e48fa77d38548f8f1dedc7cb1bb8dce53 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: &quot;mark.yang&quot; &lt;<a href=3D"mailto:mark.yang@lge.com" =
target=3D"_blank">mark.yang@lge.com</a>&gt;<br>
=C2=A0Date: Tue, 14 Apr 2026 16:17:01 +0900<br>
-Subject: [PATCH] Consolidate and fix sysroot-based compiler-rt search path=
s<br>
+Subject: [PATCH] Consolidate and fix sysroot-based compiler-rt search<br>
+ paths<br>
<br>
=C2=A0Consolidate patches 0008 and 0033 into a single patch with a fix for<=
br>
=C2=A0native builds.<br>
@@ -41,10 +42,10 @@ Signed-off-by: mark.yang &lt;<a href=3D"mailto:mark.yan=
g@lge.com" target=3D"_blank">mark.yang@lge.com</a>&gt;<br>
=C2=A0 1 file changed, 28 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolCh=
ain.cpp<br>
-index 77a2c73f0..ac28b51c4 100644<br>
+index f894a06..eceada5 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChain.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChain.cpp<br>
-@@ -15,6 +15,7 @@<br>
+@@ -16,6 +16,7 @@<br>
=C2=A0 #include &quot;ToolChains/InterfaceStubs.h&quot;<br>
=C2=A0 #include &quot;clang/Basic/ObjCRuntime.h&quot;<br>
=C2=A0 #include &quot;clang/Basic/Sanitizers.h&quot;<br>
@@ -52,7 +53,7 @@ index 77a2c73f0..ac28b51c4 100644<br>
=C2=A0 #include &quot;clang/Config/config.h&quot;<br>
=C2=A0 #include &quot;clang/Driver/Action.h&quot;<br>
=C2=A0 #include &quot;clang/Driver/CommonArgs.h&quot;<br>
-@@ -723,7 +724,15 @@ StringRef ToolChain::getOSLibName() const {<br>
+@@ -872,7 +873,15 @@ StringRef ToolChain::getOSLibName() const {<br>
=C2=A0 }<br>
<br>
=C2=A0 std::string ToolChain::getCompilerRTPath() const {<br>
@@ -69,7 +70,7 @@ index 77a2c73f0..ac28b51c4 100644<br>
=C2=A0 =C2=A0 if (isBareMetal()) {<br>
=C2=A0 =C2=A0 =C2=A0 llvm::sys::path::append(Path, &quot;lib&quot;, getOSLi=
bName());<br>
=C2=A0 =C2=A0 =C2=A0 if (!SelectedMultilibs.empty()) {<br>
-@@ -1021,7 +1030,15 @@ ToolChain::getTargetSubDirPath(StringRef BaseDir) c=
onst {<br>
+@@ -1179,7 +1188,15 @@ std::optional&lt;std::string&gt; ToolChain::getDefa=
ultIntrinsicModuleDir() const {<br>
=C2=A0 }<br>
<br>
=C2=A0 std::optional&lt;std::string&gt; ToolChain::getRuntimePath() const {=
<br>
@@ -86,7 +87,7 @@ index 77a2c73f0..ac28b51c4 100644<br>
=C2=A0 =C2=A0 llvm::sys::path::append(P, &quot;lib&quot;);<br>
=C2=A0 =C2=A0 if (auto Ret =3D getTargetSubDirPath(P))<br>
=C2=A0 =C2=A0 =C2=A0 return Ret;<br>
-@@ -1049,7 +1066,15 @@ ToolChain::path_list ToolChain::getArchSpecificLibP=
aths() const {<br>
+@@ -1207,7 +1224,15 @@ ToolChain::path_list ToolChain::getArchSpecificLibP=
aths() const {<br>
=C2=A0 =C2=A0 path_list Paths;<br>
<br>
=C2=A0 =C2=A0 auto AddPath =3D [&amp;](const ArrayRef&lt;StringRef&gt; &amp=
;SS) {<br>
diff --git a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra=
-test.patch b/meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extr=
a-test.patch<br>
similarity index 83%<br>
rename from meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-=
test.patch<br>
rename to meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-te=
st.patch<br>
index 9b4e29ff64..5e53d43944 100644<br>
--- a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.p=
atch<br>
+++ b/meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-test.p=
atch<br>
@@ -1,3 +1,8 @@<br>
+From 9463b5d24fc62372fc2731d4d4665c64c72b55b2 Mon Sep 17 00:00:00 2001<br>
+From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varatharajan@wind=
river.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>&gt;<br>
+Date: Wed, 19 Aug 2026 22:46:10 +0530<br>
+Subject: [PATCH] guard clang-tools-extra test<br>
+<br>
=C2=A0clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, w=
hich<br>
=C2=A0exists in LLVM&#39;s CMake project but is not visible when Clang is b=
uilt<br>
=C2=A0separately. To run clang tests, disable clang-tools-extra tests for n=
ow.<br>
@@ -22,30 +27,49 @@ Without this patch when CLANG_INCLUDE_TESTS is ON got t=
he following error<br>
=C2=A0---------------------------------------------------------------------=
----------<br>
<br>
=C2=A0Upstream-Status: Inappropriate [OE-Specific]<br>
+<br>
=C2=A0Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Var=
atharajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.c=
om</a>&gt;<br>
+---<br>
+ clang-tools-extra/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
+ clang-tools-extra/clangd/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 2 +-<br>
+ clang-tools-extra/include-cleaner/CMakeLists.txt | 2 +-<br>
+ 3 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMa=
keLists.txt<br>
-index 6b6f2b1..26e4c10 100644<br>
+index 87050db..3824129 100644<br>
=C2=A0--- a/clang-tools-extra/CMakeLists.txt<br>
=C2=A0+++ b/clang-tools-extra/CMakeLists.txt<br>
-@@ -8,7 +8,7 @@ include(GNUInstallDirs)<br>
+@@ -8,7 +8,7 @@ option(CLANG_TIDY_ENABLE_STATIC_ANALYZER<br>
=C2=A0 option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS<br>
=C2=A0 =C2=A0 &quot;Enable query-based custom checks in clang-tidy&quot; ON=
)<br>
-<br>
+ <br>
=C2=A0-if(CLANG_INCLUDE_TESTS)<br>
=C2=A0+if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)<br>
=C2=A0 =C2=A0 umbrella_lit_testsuite_begin(check-clang-tools)<br>
-<br>
+ <br>
=C2=A0 =C2=A0 option(CLANG_TOOLS_TEST_USE_VG &quot;Run Clang tools&#39; tes=
ts under Valgrind&quot; OFF)<br>
=C2=A0@@ -45,7 +45,7 @@ if (CLANG_ENABLE_CLANGD)<br>
=C2=A0 endif()<br>
-<br>
+ <br>
=C2=A0 # Add the common testsuite after all the tools.<br>
=C2=A0-if(CLANG_INCLUDE_TESTS)<br>
=C2=A0+if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)<br>
=C2=A0 =C2=A0 add_subdirectory(test)<br>
=C2=A0 =C2=A0 add_subdirectory(unittests)<br>
=C2=A0 =C2=A0 umbrella_lit_testsuite_end(check-clang-tools)<br>
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/c=
langd/CMakeLists.txt<br>
+index 890562d..c4d6623 100644<br>
+--- a/clang-tools-extra/clangd/CMakeLists.txt<br>
++++ b/clang-tools-extra/clangd/CMakeLists.txt<br>
+@@ -217,7 +217,7 @@ endif()<br>
+ option(CLANGD_BUILD_DEXP &quot;Build the dexp tool as part of Clangd&quot=
; ON)<br>
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)<br>
+ <br>
+-if(CLANG_INCLUDE_TESTS)<br>
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)<br>
+=C2=A0 =C2=A0add_subdirectory(test)<br>
+=C2=A0 =C2=A0add_subdirectory(unittests)<br>
+ endif()<br>
=C2=A0diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang=
-tools-extra/include-cleaner/CMakeLists.txt<br>
=C2=A0index dc147f9..4855577 100644<br>
=C2=A0--- a/clang-tools-extra/include-cleaner/CMakeLists.txt<br>
@@ -59,16 +83,3 @@ index dc147f9..4855577 100644<br>
=C2=A0 =C2=A0 add_subdirectory(test)<br>
=C2=A0 =C2=A0 add_subdirectory(unittests)<br>
=C2=A0 endif()<br>
-diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/c=
langd/CMakeLists.txt<br>
-index a1e9da4..94dcb96 100644<br>
---- a/clang-tools-extra/clangd/CMakeLists.txt<br>
-+++ b/clang-tools-extra/clangd/CMakeLists.txt<br>
-@@ -215,7 +215,7 @@ endif()<br>
- option(CLANGD_BUILD_DEXP &quot;Build the dexp tool as part of Clangd&quot=
; ON)<br>
- llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)<br>
-<br>
--if(CLANG_INCLUDE_TESTS)<br>
-+if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)<br>
-=C2=A0 =C2=A0add_subdirectory(test)<br>
-=C2=A0 =C2=A0add_subdirectory(unittests)<br>
- endif()<br>
diff --git a/meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-bloc=
k-when-searching-for-noreturn.patch b/meta/recipes-devtools/clang/clang/003=
5-Prevent-revisiting-block-when-searching-for-noreturn.patch<br>
deleted file mode 100644<br>
index 6021f736ff..0000000000<br>
--- a/meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-=
searching-for-noreturn.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-From 051b3bfa1e0e5cfed4a02318e330b38b0090cc49 Mon Sep 17 00:00:00 2001<br>
-From: Serge Pavlov &lt;<a href=3D"mailto:sepavloff@gmail.com" target=3D"_b=
lank">sepavloff@gmail.com</a>&gt;<br>
-Date: Fri, 25 Jul 2025 13:35:19 +0700<br>
-Subject: [PATCH] Prevent revisiting block when searching for noreturn vars=
<br>
-<br>
-When searching for noreturn variable initializations, do not visit CFG<br>
-blocks that are already visited, it prevents hanging=C2=A0 the analysis.<b=
r>
-<br>
-It must fix <a href=3D"https://github.com/llvm/llvm-project/issues/150336"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-project/=
issues/150336</a>.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/llvm/llvm-projec=
t/pull/150582" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm=
/llvm-project/pull/150582</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- clang/test/SemaCXX/noreturn-vars.cpp | 17 +++++++++++++++++<br>
- 1 file changed, 17 insertions(+)<br>
-<br>
-diff --git a/clang/test/SemaCXX/noreturn-vars.cpp b/clang/test/SemaCXX/nor=
eturn-vars.cpp<br>
-index ca65fcf5ca31..1bf074149f04 100644<br>
---- a/clang/test/SemaCXX/noreturn-vars.cpp<br>
-+++ b/clang/test/SemaCXX/noreturn-vars.cpp<br>
-@@ -225,3 +225,20 @@ extern void abc_02(func_type *);<br>
-=C2=A0 =C2=A0abc_02(&amp;func_ptr);<br>
-=C2=A0 =C2=A0func_ptr();<br>
- } // expected-warning {{function declared &#39;noreturn&#39; should not r=
eturn}}<br>
-+<br>
-+namespace Issue150336 {<br>
-+void free(void *);<br>
-+typedef void (*sel_freefunc)(void *);<br>
-+struct gmx_ana_selmethod_t {<br>
-+=C2=A0 sel_freefunc free;<br>
-+=C2=A0 int nparams;<br>
-+=C2=A0 int *param;<br>
-+};<br>
-+void gmx_selelem_free_method(struct gmx_ana_selmethod_t* method, void* md=
ata) {<br>
-+=C2=A0 =C2=A0 sel_freefunc free_func =3D 0;<br>
-+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; method-&gt;nparams; ++i)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(&amp;method-&gt;param[i]);<br>
-+=C2=A0 =C2=A0 if (mdata &amp;&amp; free_func)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free_func(mdata);<br>
-+}<br>
-+}<br>
diff --git a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on=
-32-bit-x86-without-SSE2.patch b/meta/recipes-devtools/clang/clang/0035-lib=
c-Disable-float16-on-32-bit-x86-without-SSE2.patch<br>
new file mode 100644<br>
index 0000000000..df35636055<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit=
-x86-without-SSE2.patch<br>
@@ -0,0 +1,36 @@<br>
+From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" targ=
et=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
+Date: Fri, 29 Aug 2026 13:55:00 +0530<br>
+Subject: [PATCH] libc: Disable float16 on 32-bit x86 without SSE2<br>
+<br>
+GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 even though<br>
+_Float16 is only usable on x86-32 with SSE2 enabled. The float16<br>
+detection in float16-macros.h keys on that macro, so the shared f16<br>
+math headers are compiled on plain i686 and every use of _Float16<br>
+fails:<br>
+<br>
+=C2=A0 libc/src/__support/FPUtil/BasicOperations.h:63:67:<br>
+=C2=A0 =C2=A0 =C2=A0 error: SSE register return with SSE2 disabled<br>
+=C2=A0 libc/src/__support/math/acosf16.h:73:14:<br>
+=C2=A0 =C2=A0 =C2=A0 error: invalid conversion from type &#39;_Float16&#39=
; without option &#39;-msse2&#39;<br>
+<br>
+Since llvm/lib/Support/APFloat.cpp started including shared/math.h,<br>
+this breaks the LLVM build itself for 32-bit x86 baselines older than<br>
+SSE2 (e.g. -march=3Dpentiumpro), as used by Yocto/OpenEmbedded multilib.<b=
r>
+<br>
+Require SSE2 on 32-bit x86 in the guard, matching the existing<br>
+exclusions for 32-bit Arm and RISC-V. Targets with SSE2 are unaffected.<br=
>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/llvm/llvm-project=
/commit/05da143c63d333420b99eab198e1a89c97480929" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/llvm/llvm-project/commit/05da143c63d333420b9=
9eab198e1a89c97480929</a>]<br>
+Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.=
com" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
+---<br>
+--- a/libc/include/llvm-libc-macros/float16-macros.h=C2=A0 =C2=A02026-08-2=
9 13:55:04.771442947 +0530<br>
++++ b/libc/include/llvm-libc-macros/float16-macros.h=C2=A0 =C2=A02026-08-2=
9 13:55:04.773991812 +0530<br>
+@@ -15,7 +15,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0(!defined(__GNUC__) || __GNUC__ &gt;=3D 13 ||=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 (defined(__clang__) &amp;&amp; __clang_major__ &gt;=
=3D 12)) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0!defined(__arm__) &amp;&amp; !defined(_M_ARM) &amp;&am=
p; !defined(__riscv) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
+-=C2=A0 =C2=A0 !defined(_WIN32)<br>
++=C2=A0 =C2=A0 !defined(_WIN32) &amp;&amp; (!defined(__i386__) || defined(=
__SSE2__))<br>
+ #define LIBC_TYPES_HAS_FLOAT16<br>
+ <br>
+ // TODO: This would no longer be required if HdrGen let us guard function=
<br>
diff --git a/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNO=
WN-elements-of-OffloadArch-enum.patch b/meta/recipes-devtools/clang/clang/0=
039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch<br>
deleted file mode 100644<br>
index 493948acef..0000000000<br>
--- a/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elem=
ents-of-OffloadArch-enum.patch<br>
+++ /dev/null<br>
@@ -1,274 +0,0 @@<br>
-From 82f18b02d9fec1bcc225a92251466ffee82f56b5 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Fri, 20 Mar 2026 14:22:17 -0700<br>
-Subject: [PATCH] [Clang] Rename UNUSED and UNKNOWN elements of OffloadArch=
 enum to avoid <br>
- macro collisions<br>
-<br>
-OffloadArch uses enumerator named `UNUSED` `UNKNOWN`, which are common mac=
ro name<br>
-in external codebases (e.g. Mesa defines UNUSED as an attribute helper). I=
f such<br>
-a macro is visible when including clang/Basic/OffloadArch.h, the preproces=
sor<br>
-expands the token inside the enum and breaks compilation of the installed =
Clang<br>
-headers.<br>
-<br>
-Rename the enumerator to `Unused` and `Unknown` and update all in-tree ref=
erences. This is a<br>
-spelling-only change (no behavioral impact) and mirrors the existing appro=
ach<br>
-used for SM_32_ to avoid macro clashes.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/llvm/llvm-project=
/commit/5bc3d1966b2d0b300c338d85bb38e356f0d12a8c" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/llvm/llvm-project/commit/5bc3d1966b2d0b300c3=
38d85bb38e356f0d12a8c</a>]<br>
-Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathar=
ajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a=
>&gt;<br>
-<br>
-diff --git a/clang/include/clang/Basic/OffloadArch.h b/clang/include/clang=
/Basic/OffloadArch.h<br>
-index ea665b1..970487c 100644<br>
---- a/clang/include/clang/Basic/OffloadArch.h<br>
-+++ b/clang/include/clang/Basic/OffloadArch.h<br>
-@@ -16,8 +16,8 @@ class StringRef;<br>
- namespace clang {<br>
-<br>
- enum class OffloadArch {<br>
--=C2=A0 UNUSED,<br>
--=C2=A0 UNKNOWN,<br>
-+=C2=A0 Unused,<br>
-+=C2=A0 Unknown,<br>
-=C2=A0 =C2=A0// TODO: Deprecate and remove GPU architectures older than sm=
_52.<br>
-=C2=A0 =C2=A0SM_20,<br>
-=C2=A0 =C2=A0SM_21,<br>
-@@ -145,7 +145,7 @@ const char *OffloadArchToString(OffloadArch A);<br>
- const char *OffloadArchToVirtualArchString(OffloadArch A);<br>
-<br>
- // Convert a string to an OffloadArch enum value. Returns<br>
--// OffloadArch::UNKNOWN if the string is not recognized.<br>
-+// OffloadArch::Unknown if the string is not recognized.<br>
- OffloadArch StringToOffloadArch(llvm::StringRef S);<br>
-<br>
- } // namespace clang<br>
-diff --git a/clang/lib/Basic/Cuda.cpp b/clang/lib/Basic/Cuda.cpp<br>
-index 514fa2f..7884910 100644<br>
---- a/clang/lib/Basic/Cuda.cpp<br>
-+++ b/clang/lib/Basic/Cuda.cpp<br>
-@@ -75,7 +75,7 @@ CudaVersion ToCudaVersion(llvm::VersionTuple Version) {<=
br>
- }<br>
-<br>
- CudaVersion MinVersionForOffloadArch(OffloadArch A) {<br>
--=C2=A0 if (A =3D=3D OffloadArch::UNKNOWN)<br>
-+=C2=A0 if (A =3D=3D OffloadArch::Unknown)<br>
-=C2=A0 =C2=A0 =C2=A0return CudaVersion::UNKNOWN;<br>
-<br>
-=C2=A0 =C2=A0// AMD GPUs do not depend on CUDA versions.<br>
-@@ -141,7 +141,7 @@ CudaVersion MaxVersionForOffloadArch(OffloadArch A) {<=
br>
-=C2=A0 =C2=A0 =C2=A0return CudaVersion::NEW;<br>
-<br>
-=C2=A0 =C2=A0switch (A) {<br>
--=C2=A0 case OffloadArch::UNKNOWN:<br>
-+=C2=A0 case OffloadArch::Unknown:<br>
-=C2=A0 =C2=A0 =C2=A0return CudaVersion::UNKNOWN;<br>
-=C2=A0 =C2=A0case OffloadArch::SM_20:<br>
-=C2=A0 =C2=A0case OffloadArch::SM_21:<br>
-diff --git a/clang/lib/Basic/OffloadArch.cpp b/clang/lib/Basic/OffloadArch=
.cpp<br>
-index 05177f1..f3bbe64 100644<br>
---- a/clang/lib/Basic/OffloadArch.cpp<br>
-+++ b/clang/lib/Basic/OffloadArch.cpp<br>
-@@ -17,7 +17,7 @@ struct OffloadArchToStringMap {<br>
- #define GFX(gpu) {OffloadArch::GFX##gpu, &quot;gfx&quot; #gpu, &quot;comp=
ute_amdgcn&quot;}<br>
- static const OffloadArchToStringMap ArchNames[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0// clang-format off<br>
--=C2=A0 =C2=A0 {OffloadArch::UNUSED, &quot;&quot;, &quot;&quot;},<br>
-+=C2=A0 =C2=A0 {OffloadArch::Unused, &quot;&quot;, &quot;&quot;},<br>
-=C2=A0 =C2=A0 =C2=A0SM(20), {OffloadArch::SM_21, &quot;sm_21&quot;, &quot;=
compute_20&quot;}, // Fermi<br>
-=C2=A0 =C2=A0 =C2=A0SM(30), {OffloadArch::SM_32_, &quot;sm_32&quot;, &quot=
;compute_32&quot;}, SM(35), SM(37),=C2=A0 // Kepler<br>
-=C2=A0 =C2=A0 =C2=A0SM(50), SM(52), SM(53),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Maxwell<br>
-@@ -132,7 +132,7 @@ OffloadArch StringToOffloadArch(llvm::StringRef S) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return S =3D=3D Map.ArchName;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0});<br>
-=C2=A0 =C2=A0if (Result =3D=3D std::end(ArchNames))<br>
--=C2=A0 =C2=A0 return OffloadArch::UNKNOWN;<br>
-+=C2=A0 =C2=A0 return OffloadArch::Unknown;<br>
-=C2=A0 =C2=A0return Result-&gt;Arch;<br>
- }<br>
-<br>
-diff --git a/clang/lib/Basic/Targets/NVPTX.cpp b/clang/lib/Basic/Targets/N=
VPTX.cpp<br>
-index 6526eef..9584f8a 100644<br>
---- a/clang/lib/Basic/Targets/NVPTX.cpp<br>
-+++ b/clang/lib/Basic/Targets/NVPTX.cpp<br>
-@@ -64,7 +64,7 @@ NVPTXTargetInfo::NVPTXTargetInfo(const llvm::Triple &amp=
;Triple,<br>
-=C2=A0 =C2=A0// Define available target features<br>
-=C2=A0 =C2=A0// These must be defined in sorted order!<br>
-=C2=A0 =C2=A0NoAsmVariants =3D true;<br>
--=C2=A0 GPU =3D OffloadArch::UNUSED;<br>
-+=C2=A0 GPU =3D OffloadArch::Unused;<br>
-<br>
-=C2=A0 =C2=A0// PTX supports f16 as a fundamental type.<br>
-=C2=A0 =C2=A0HasFastHalfType =3D true;<br>
-diff --git a/clang/lib/Basic/Targets/NVPTX.h b/clang/lib/Basic/Targets/NVP=
TX.h<br>
-index 9bd0cc3..eeffb0e 100644<br>
---- a/clang/lib/Basic/Targets/NVPTX.h<br>
-+++ b/clang/lib/Basic/Targets/NVPTX.h<br>
-@@ -87,7 +87,7 @@ public:<br>
-=C2=A0 =C2=A0initFeatureMap(llvm::StringMap&lt;bool&gt; &amp;Features, Dia=
gnosticsEngine &amp;Diags,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 StringRef C=
PU,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const std::=
vector&lt;std::string&gt; &amp;FeaturesVec) const override {<br>
--=C2=A0 =C2=A0 if (GPU !=3D OffloadArch::UNUSED)<br>
-+=C2=A0 =C2=A0 if (GPU !=3D OffloadArch::Unused)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Features[OffloadArchToString(GPU)] =3D true;<br=
>
-=C2=A0 =C2=A0 =C2=A0// Only add PTX feature if explicitly requested. Other=
wise, let the backend<br>
-=C2=A0 =C2=A0 =C2=A0// use the minimum required PTX version for the target=
 SM.<br>
-@@ -146,7 +146,7 @@ public:<br>
-=C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0bool isValidCPUName(StringRef Name) const override {<br>
--=C2=A0 =C2=A0 return StringToOffloadArch(Name) !=3D OffloadArch::UNKNOWN;=
<br>
-+=C2=A0 =C2=A0 return StringToOffloadArch(Name) !=3D OffloadArch::Unknown;=
<br>
-=C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0void fillValidCPUList(SmallVectorImpl&lt;StringRef&gt; &amp;V=
alues) const override {<br>
-@@ -157,7 +157,7 @@ public:<br>
-<br>
-=C2=A0 =C2=A0bool setCPU(const std::string &amp;Name) override {<br>
-=C2=A0 =C2=A0 =C2=A0GPU =3D StringToOffloadArch(Name);<br>
--=C2=A0 =C2=A0 return GPU !=3D OffloadArch::UNKNOWN;<br>
-+=C2=A0 =C2=A0 return GPU !=3D OffloadArch::Unknown;<br>
-=C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0void setSupportedOpenCLOpts() override {<br>
-diff --git a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp b/clang/lib/CodeGen/=
CGOpenMPRuntimeGPU.cpp<br>
-index db0d56d..f78047d 100644<br>
---- a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp<br>
-+++ b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp<br>
-@@ -2266,15 +2266,15 @@ bool CGOpenMPRuntimeGPU::hasAllocateAttributeForGl=
obalVar(const VarDecl *VD,<br>
- // Get current OffloadArch and ignore any unknown values<br>
- static OffloadArch getOffloadArch(CodeGenModule &amp;CGM) {<br>
-=C2=A0 =C2=A0if (!CGM.getTarget().hasFeature(&quot;ptx&quot;))<br>
--=C2=A0 =C2=A0 return OffloadArch::UNKNOWN;<br>
-+=C2=A0 =C2=A0 return OffloadArch::Unknown;<br>
-=C2=A0 =C2=A0for (const auto &amp;Feature : CGM.getTarget().getTargetOpts(=
).FeatureMap) {<br>
-=C2=A0 =C2=A0 =C2=A0if (Feature.getValue()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0OffloadArch Arch =3D StringToOffloadArch(Featur=
e.getKey());<br>
--=C2=A0 =C2=A0 =C2=A0 if (Arch !=3D OffloadArch::UNKNOWN)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (Arch !=3D OffloadArch::Unknown)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return Arch;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0}<br>
--=C2=A0 return OffloadArch::UNKNOWN;<br>
-+=C2=A0 return OffloadArch::Unknown;<br>
- }<br>
-<br>
- /// Check to see if target architecture supports unified addressing which=
 is<br>
-@@ -2382,8 +2382,8 @@ void CGOpenMPRuntimeGPU::processRequiresDirective(co=
nst OMPRequiresDecl *D) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case OffloadArch::Generic:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case OffloadArch::GRANITERAPIDS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case OffloadArch::BMG_G21:<br>
--=C2=A0 =C2=A0 =C2=A0 case OffloadArch::UNUSED:<br>
--=C2=A0 =C2=A0 =C2=A0 case OffloadArch::UNKNOWN:<br>
-+=C2=A0 =C2=A0 =C2=A0 case OffloadArch::Unused:<br>
-+=C2=A0 =C2=A0 =C2=A0 case OffloadArch::Unknown:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case OffloadArch::LAST:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0llvm_unreachable(&quot;Unexpected GPU ar=
ch.&quot;);<br>
-diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp<br>
-index eb3f9cb..c8894a1 100644<br>
---- a/clang/lib/Driver/Driver.cpp<br>
-+++ b/clang/lib/Driver/Driver.cpp<br>
-@@ -946,7 +946,7 @@ inferOffloadToolchains(Compilation &amp;C, Action::Off=
loadKind Kind) {<br>
-=C2=A0 =C2=A0llvm::DenseSet&lt;llvm::StringRef&gt; Triples;<br>
-=C2=A0 =C2=A0for (llvm::StringRef Arch : Archs) {<br>
-=C2=A0 =C2=A0 =C2=A0OffloadArch ID =3D StringToOffloadArch(Arch);<br>
--=C2=A0 =C2=A0 if (ID =3D=3D OffloadArch::UNKNOWN)<br>
-+=C2=A0 =C2=A0 if (ID =3D=3D OffloadArch::Unknown)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ID =3D StringToOffloadArch(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getProcessorFromTargetID(llvm::Tr=
iple(&quot;amdgcn-amd-amdhsa&quot;), Arch));<br>
-<br>
-@@ -961,12 +961,12 @@ inferOffloadToolchains(Compilation &amp;C, Action::O=
ffloadKind Kind) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return llvm::DenseSet&lt;llvm::StringRef&gt;();=
<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0if (Kind =3D=3D Action::OFK_OpenMP &amp;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 (ID =3D=3D OffloadArch::UNKNOWN || ID =3D=3D =
OffloadArch::UNUSED)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (ID =3D=3D OffloadArch::Unknown || ID =3D=3D =
OffloadArch::Unused)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0C.getDriver().Diag(clang::diag::err_drv_failed_=
to_deduce_target_from_arch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; Arch;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return llvm::DenseSet&lt;llvm::StringRef&gt;();=
<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 if (ID =3D=3D OffloadArch::UNKNOWN || ID =3D=3D OffloadArch=
::UNUSED) {<br>
-+=C2=A0 =C2=A0 if (ID =3D=3D OffloadArch::Unknown || ID =3D=3D OffloadArch=
::Unused) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0C.getDriver().Diag(clang::diag::err_drv_offload=
_bad_gpu_arch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; &quot;offload&quot; &lt;=
&lt; Arch;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return llvm::DenseSet&lt;llvm::StringRef&gt;();=
<br>
-@@ -3305,7 +3305,7 @@ class OffloadingActionBuilder final {<br>
-=C2=A0 =C2=A0 =C2=A0bool Relocatable =3D false;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0/// Default GPU architecture if there&#39;s no one spe=
cified.<br>
--=C2=A0 =C2=A0 OffloadArch DefaultOffloadArch =3D OffloadArch::UNKNOWN;<br=
>
-+=C2=A0 =C2=A0 OffloadArch DefaultOffloadArch =3D OffloadArch::Unknown;<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0/// Compilation unit ID specified by option &#39;-fuse=
-cuid=3D&#39; or&#39;-cuid=3D&#39;.<br>
-=C2=A0 =C2=A0 =C2=A0const CUIDOptions &amp;CUIDOpts;<br>
-@@ -3407,7 +3407,7 @@ class OffloadingActionBuilder final {<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// If we have a fat binary, add it to the list.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (CudaFatBinary) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 AddTopLevel(CudaFatBinary, OffloadArch::UNUSE=
D);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AddTopLevel(CudaFatBinary, OffloadArch::Unuse=
d);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CudaDeviceActions.clear();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CudaFatBinary =3D nullptr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-@@ -4669,12 +4669,12 @@ static StringRef getCanonicalArchString(Compilatio=
n &amp;C,<br>
-=C2=A0 =C2=A0OffloadArch Arch =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0StringToOffloadArch(getProcessorFromTargetID(Tr=
iple, ArchStr));<br>
-=C2=A0 =C2=A0if (Triple.isNVPTX() &amp;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 (Arch =3D=3D OffloadArch::UNKNOWN || !IsNVIDIAOffloa=
dArch(Arch))) {<br>
-+=C2=A0 =C2=A0 =C2=A0 (Arch =3D=3D OffloadArch::Unknown || !IsNVIDIAOffloa=
dArch(Arch))) {<br>
-=C2=A0 =C2=A0 =C2=A0C.getDriver().Diag(clang::diag::err_drv_offload_bad_gp=
u_arch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; &quot;CUDA&quot; &lt;&lt; ArchS=
tr;<br>
-=C2=A0 =C2=A0 =C2=A0return StringRef();<br>
-=C2=A0 =C2=A0} else if (Triple.isAMDGPU() &amp;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(Arch =3D=3D OffloadArch:=
:UNKNOWN || !IsAMDOffloadArch(Arch))) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(Arch =3D=3D OffloadArch:=
:Unknown || !IsAMDOffloadArch(Arch))) {<br>
-=C2=A0 =C2=A0 =C2=A0C.getDriver().Diag(clang::diag::err_drv_offload_bad_gp=
u_arch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; &quot;HIP&quot; &lt;&lt; ArchSt=
r;<br>
-=C2=A0 =C2=A0 =C2=A0return StringRef();<br>
-diff --git a/clang/lib/Driver/OffloadBundler.cpp b/clang/lib/Driver/Offloa=
dBundler.cpp<br>
-index f69ac41..6d446f2 100644<br>
---- a/clang/lib/Driver/OffloadBundler.cpp<br>
-+++ b/clang/lib/Driver/OffloadBundler.cpp<br>
-@@ -95,7 +95,7 @@ OffloadTargetInfo::OffloadTargetInfo(const StringRef Tar=
get,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Components.size() =3D=3D 6 ? Components.back() =
: &quot;&quot;;<br>
-=C2=A0 =C2=A0StringRef TargetId =3D TargetIdWithFeature.split(&#39;:&#39;)=
.first;<br>
-=C2=A0 =C2=A0if (!TargetId.empty() &amp;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 clang::StringToOffloadArch(TargetId) !=3D clang::Off=
loadArch::UNKNOWN)<br>
-+=C2=A0 =C2=A0 =C2=A0 clang::StringToOffloadArch(TargetId) !=3D clang::Off=
loadArch::Unknown)<br>
-=C2=A0 =C2=A0 =C2=A0this-&gt;TargetID =3D TargetIdWithFeature;<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0this-&gt;TargetID =3D &quot;&quot;;<br>
-diff --git a/clang/lib/Driver/ToolChains/Cuda.cpp b/clang/lib/Driver/ToolC=
hains/Cuda.cpp<br>
-index 6cc73ff..d97b926 100644<br>
---- a/clang/lib/Driver/ToolChains/Cuda.cpp<br>
-+++ b/clang/lib/Driver/ToolChains/Cuda.cpp<br>
-@@ -319,7 +319,7 @@ void CudaInstallationDetector::AddCudaIncludeArgs(<br>
-<br>
- void CudaInstallationDetector::CheckCudaVersionSupportsArch(<br>
-=C2=A0 =C2=A0 =C2=A0OffloadArch Arch) const {<br>
--=C2=A0 if (Arch =3D=3D OffloadArch::UNKNOWN || Version =3D=3D CudaVersion=
::UNKNOWN ||<br>
-+=C2=A0 if (Arch =3D=3D OffloadArch::Unknown || Version =3D=3D CudaVersion=
::UNKNOWN ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ArchsWithBadVersion[(int)Arch])<br>
-=C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-@@ -408,7 +408,7 @@ void NVPTX::Assembler::ConstructJob(Compilation &amp;C=
, const JobAction &amp;JA,<br>
-<br>
-=C2=A0 =C2=A0// Obtain architecture from the action.<br>
-=C2=A0 =C2=A0OffloadArch gpu_arch =3D StringToOffloadArch(GPUArchName);<br=
>
--=C2=A0 assert(gpu_arch !=3D OffloadArch::UNKNOWN &amp;&amp;<br>
-+=C2=A0 assert(gpu_arch !=3D OffloadArch::Unknown &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Device action expected to have an=
 architecture.&quot;);<br>
-<br>
-=C2=A0 =C2=A0// Check that our installation&#39;s ptxas supports gpu_arch.=
<br>
-diff --git a/clang/lib/Sema/SemaDeclAttr.cpp b/clang/lib/Sema/SemaDeclAttr=
.cpp<br>
-index 3f0ea5c..e6d3516 100644<br>
---- a/clang/lib/Sema/SemaDeclAttr.cpp<br>
-+++ b/clang/lib/Sema/SemaDeclAttr.cpp<br>
-@@ -5732,7 +5732,7 @@ Sema::CreateLaunchBoundsAttr(const AttributeCommonIn=
fo &amp;CI, Expr *MaxThreads,<br>
-=C2=A0 =C2=A0if (MaxBlocks) {<br>
-=C2=A0 =C2=A0 =C2=A0// &#39;.maxclusterrank&#39; ptx directive requires .t=
arget sm_90 or higher.<br>
-=C2=A0 =C2=A0 =C2=A0auto SM =3D getOffloadArch(Context.getTargetInfo());<b=
r>
--=C2=A0 =C2=A0 if (SM =3D=3D OffloadArch::UNKNOWN || SM &lt; OffloadArch::=
SM_90) {<br>
-+=C2=A0 =C2=A0 if (SM =3D=3D OffloadArch::Unknown || SM &lt; OffloadArch::=
SM_90) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Diag(MaxBlocks-&gt;getBeginLoc(), diag::warn_cu=
da_maxclusterrank_sm_90)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; OffloadArchToString(SM) =
&lt;&lt; CI &lt;&lt; MaxBlocks-&gt;getSourceRange();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Ignore it by setting MaxBlocks to null;<br>
diff --git a/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu=
_unwind_frame-in-cxa_personal.patch b/meta/recipes-devtools/clang/clang/004=
0-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch<br>
deleted file mode 100644<br>
index f458fd0cf8..0000000000<br>
--- a/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind=
_frame-in-cxa_personal.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From 5dbd0a05f64a43849a7edde95a0e5f2323cd1f9d Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" target=3D"=
_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
-Date: Tue, 31 Mar 2026 19:33:29 -0700<br>
-Subject: [PATCH] libcxxabi: declare __gnu_unwind_frame in cxa_personality<=
br>
-<br>
-ARM EHABI builds of libcxxabi fail with clang-22+ because<br>
-cxa_personality.cpp calls __gnu_unwind_frame without a visible<br>
-declaration, triggering:<br>
-<br>
-=C2=A0 error: use of undeclared identifier &#39;__gnu_unwind_frame&#39;<br=
>
-<br>
-Add an extern &quot;C&quot; forward declaration before the EHABI unwind he=
lper<br>
-so the source compiles correctly.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/llvm/llvm-projec=
t/pull/189787" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm=
/llvm-project/pull/189787</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" t=
arget=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
----<br>
- libcxxabi/src/cxa_personality.cpp | 2 ++<br>
- 1 file changed, 2 insertions(+)<br>
-<br>
-diff --git a/libcxxabi/src/cxa_personality.cpp b/libcxxabi/src/cxa_persona=
lity.cpp<br>
-index 35f4e3807724..ddff277cc7b8 100644<br>
---- a/libcxxabi/src/cxa_personality.cpp<br>
-+++ b/libcxxabi/src/cxa_personality.cpp<br>
-@@ -1116,6 +1116,8 @@ __gxx_personality_seh0(PEXCEPTION_RECORD ms_exc, voi=
d *this_frame,<br>
-<br>
- #else<br>
-<br>
-+extern &quot;C&quot; _Unwind_Reason_Code __gnu_unwind_frame(_Unwind_Excep=
tion*,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 _Unwind_Context*);<br>
- // Helper function to unwind one frame.<br>
- // ARM EHABI 7.3 and 7.4: If the personality function returns _URC_CONTIN=
UE_UNWIND, the<br>
- // personality routine should update the virtual register set (VRS) accor=
ding to the<br>
diff --git a/meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit=
-fold-candidates-in-determini.patch b/meta/recipes-devtools/clang/clang/004=
3-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch<br>
deleted file mode 100644<br>
index 39e27ac12f..0000000000<br>
--- a/meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit-fold-c=
andidates-in-determini.patch<br>
+++ /dev/null<br>
@@ -1,71 +0,0 @@<br>
-From 965f9d87adb0a7376454374fbc140ab69bd796a9 Mon Sep 17 00:00:00 2001<br>
-From: Florian Hahn &lt;<a href=3D"mailto:flo@fhahn.com" target=3D"_blank">=
flo@fhahn.com</a>&gt;<br>
-Date: Fri, 27 Mar 2026 13:02:51 +0000<br>
-Subject: [PATCH] [LoopUnroll] Use MapVector for deterministic iteration or=
der.<br>
- (#188821)<br>
-<br>
-NonLoopBlocksIDom determines the order we adjust the DT, impacting DRT<br>
-child ordering.<br>
-<br>
-Similarly, ExitInfos order impacts the order of SetDest, which applies<br>
-DT updates.<br>
-<br>
-The order impacts collectChildrenInLoop, which in turn impacts the we<br>
-process BBs in LICM. And this in turn impacts the order in which we<br>
-perform alias queries.<br>
-<br>
-If the order is not deterministic, we sometimes get different NumNoAlias<b=
r>
-statistic counts, and possibly also different IR, although I have not<br>
-confirmed the latter.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/llvm/llvm-project=
/commit/965f9d87adb0a7376454374fbc140ab69bd796a9" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/llvm/llvm-project/commit/965f9d87adb0a737645=
4374fbc140ab69bd796a9</a>]<br>
-Signed-off-by: Sunilkumar Dora &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
-Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathar=
ajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a=
>&gt;<br>
-<br>
----<br>
- llvm/lib/Transforms/Utils/LoopPeel.cpp=C2=A0 =C2=A0| 3 ++-<br>
- llvm/lib/Transforms/Utils/LoopUnroll.cpp | 3 ++-<br>
- 2 files changed, 4 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/llvm/lib/Transforms/Utils/LoopPeel.cpp b/llvm/lib/Transforms/=
Utils/LoopPeel.cpp<br>
-index 91737b5c30533..4c67d5a9ae680 100644<br>
---- a/llvm/lib/Transforms/Utils/LoopPeel.cpp<br>
-+++ b/llvm/lib/Transforms/Utils/LoopPeel.cpp<br>
-@@ -11,6 +11,7 @@<br>
-<br>
- #include &quot;llvm/Transforms/Utils/LoopPeel.h&quot;<br>
- #include &quot;llvm/ADT/DenseMap.h&quot;<br>
-+#include &quot;llvm/ADT/MapVector.h&quot;<br>
- #include &quot;llvm/ADT/SmallVector.h&quot;<br>
- #include &quot;llvm/ADT/Statistic.h&quot;<br>
- #include &quot;llvm/Analysis/Loads.h&quot;<br>
-@@ -1121,7 +1122,7 @@ void llvm::peelLoop(Loop *L, unsigned PeelCount, boo=
l PeelLast, LoopInfo *LI,<br>
-=C2=A0 =C2=A0// later. Immediate dominator of such block might change, bec=
ause we add more<br>
-=C2=A0 =C2=A0// routes which can lead to the exit: we can reach it from th=
e peeled<br>
-=C2=A0 =C2=A0// iterations too.<br>
--=C2=A0 DenseMap&lt;BasicBlock *, BasicBlock *&gt; NonLoopBlocksIDom;<br>
-+=C2=A0 MapVector&lt;BasicBlock *, BasicBlock *&gt; NonLoopBlocksIDom;<br>
-=C2=A0 =C2=A0for (auto *BB : L-&gt;blocks()) {<br>
-=C2=A0 =C2=A0 =C2=A0auto *BBDomNode =3D DT.getNode(BB);<br>
-=C2=A0 =C2=A0 =C2=A0SmallVector&lt;BasicBlock *, 16&gt; ChildrenToUpdate;<=
br>
-diff --git a/llvm/lib/Transforms/Utils/LoopUnroll.cpp b/llvm/lib/Transform=
s/Utils/LoopUnroll.cpp<br>
-index 6a2ccbea996bf..ab35d217f0d93 100644<br>
---- a/llvm/lib/Transforms/Utils/LoopUnroll.cpp<br>
-+++ b/llvm/lib/Transforms/Utils/LoopUnroll.cpp<br>
-@@ -17,6 +17,7 @@<br>
-<br>
- #include &quot;llvm/ADT/ArrayRef.h&quot;<br>
- #include &quot;llvm/ADT/DenseMap.h&quot;<br>
-+#include &quot;llvm/ADT/MapVector.h&quot;<br>
- #include &quot;llvm/ADT/STLExtras.h&quot;<br>
- #include &quot;llvm/ADT/ScopedHashTable.h&quot;<br>
- #include &quot;llvm/ADT/SetVector.h&quot;<br>
-@@ -515,7 +516,7 @@ llvm::UnrollLoop(Loop *L, UnrollLoopOptions ULO, LoopI=
nfo *LI,<br>
-=C2=A0 =C2=A0 =C2=A0BasicBlock *FirstExitingBlock =3D nullptr;<br>
-=C2=A0 =C2=A0 =C2=A0SmallVector&lt;BasicBlock *&gt; ExitingBlocks;<br>
-=C2=A0 =C2=A0};<br>
--=C2=A0 DenseMap&lt;BasicBlock *, ExitInfo&gt; ExitInfos;<br>
-+=C2=A0 MapVector&lt;BasicBlock *, ExitInfo&gt; ExitInfos;<br>
-=C2=A0 =C2=A0SmallVector&lt;BasicBlock *, 4&gt; ExitingBlocks;<br>
-=C2=A0 =C2=A0L-&gt;getExitingBlocks(ExitingBlocks);<br>
-=C2=A0 =C2=A0for (auto *ExitingBlock : ExitingBlocks) {<br>
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-de=
vtools/clang/common-clang.inc<br>
index <a href=3D"tel:(901)%20809-4419" value=3D"+19018094419" target=3D"_bl=
ank">9018094419</a>..5d571e5fce 100644<br>
--- a/meta/recipes-devtools/clang/common-clang.inc<br>
+++ b/meta/recipes-devtools/clang/common-clang.inc<br>
@@ -3,9 +3,9 @@ LLVM_DIR =3D &quot;llvm${LLVM_RELEASE}&quot;<br>
<br>
=C2=A0LLVM_HTTP ?=3D &quot;<a href=3D"https://github.com/llvm" rel=3D"noref=
errer" target=3D"_blank">https://github.com/llvm</a>&quot;<br>
<br>
-MAJOR_VER =3D &quot;22&quot;<br>
+MAJOR_VER =3D &quot;23&quot;<br>
=C2=A0MINOR_VER =3D &quot;1&quot;<br>
-PATCH_VER =3D &quot;8&quot;<br>
+PATCH_VER =3D &quot;0&quot;<br>
=C2=A0# could be &#39;rcX&#39; or &#39;git&#39; or empty ( for release )<br=
>
=C2=A0VER_SUFFIX =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc<br>
index e1e03872cd..0ca6951ff4 100644<br>
--- a/meta/recipes-devtools/clang/common.inc<br>
+++ b/meta/recipes-devtools/clang/common.inc<br>
@@ -17,51 +17,45 @@ BASEURI ?=3D &quot;${LLVM_HTTP}/llvm-project/releases/d=
ownload/llvmorg-${PV}${VER_SUFFI<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${LLVM_HTTP}/llvm-project/releases/&quot=
;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/llvmorg-?(?P&lt;pver&gt;\=
d+(\.\d+)+)&quot;<br>
=C2=A0SOURCEDIR ?=3D &quot;llvm-project-${PV}${VER_SUFFIX}.src&quot;<br>
-SRC_URI[sha256sum] =3D &quot;922f1817a0df7b1489272d18134ee0087a8b068828f87=
ac63b9861b1a9965888&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ab1f0e3ec52448c33e8782eaf0422504b87c7b016b225=
14653ee0d8fcee479ff&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${BASEURI} \<br>
-=C2=A0 =C2=A0 file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_=
LIBU.patch \<br>
-=C2=A0 =C2=A0 file://0002-compiler-rt-support-a-new-embedded-linux-target.=
patch \<br>
-=C2=A0 =C2=A0 file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-us=
e-na.patch \<br>
-=C2=A0 =C2=A0 file://0004-llvm-allow-env-override-of-exe-and-libdir-path.p=
atch \<br>
-=C2=A0 =C2=A0 file://0005-clang-driver-Check-sysroot-for-ldso-path.patch \=
<br>
-=C2=A0 =C2=A0 file://0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-mus=
l.patch \<br>
-=C2=A0 =C2=A0 file://0007-clang-Prepend-trailing-to-sysroot.patch \<br>
-=C2=A0 =C2=A0 file://0009-clang-Define-releative-gcc-installation-dir.patc=
h \<br>
-=C2=A0 =C2=A0 file://0010-clang-Add-lpthread-and-ldl-along-with-lunwind-fo=
r-st.patch \<br>
-=C2=A0 =C2=A0 file://0011-Check-for-atomic-double-intrinsics.patch \<br>
-=C2=A0 =C2=A0 file://0012-cmake-Fix-configure-for-packages-using-find_pack=
age.patch \<br>
-=C2=A0 =C2=A0 file://0013-clang-Fix-resource-dir-location-for-cross-toolch=
ains.patch \<br>
-=C2=A0 =C2=A0 file://0014-clang-driver-Add-dyld-prefix-when-checking-sysro=
ot-f.patch \<br>
-=C2=A0 =C2=A0 file://0015-clang-Use-python3-in-python-scripts.patch \<br>
-=C2=A0 =C2=A0 file://0016-llvm-clang-Insert-anchor-for-adding-OE-distro-ve=
ndor.patch \<br>
-=C2=A0 =C2=A0 file://0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-gli=
bc-l.patch \<br>
-=C2=A0 =C2=A0 file://0018-clang-Fix-x86-triple-for-non-debian-multiarch-li=
nux-.patch \<br>
-=C2=A0 =C2=A0 file://0019-libunwind-Added-unw_backtrace-method.patch \<br>
-=C2=A0 =C2=A0 file://0020-lldb-Link-with-libatomic-on-x86.patch \<br>
-=C2=A0 =C2=A0 file://0021-compiler-rt-Enable-__int128-for-ppc32.patch \<br=
>
-=C2=A0 =C2=A0 file://0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.pa=
tch \<br>
-=C2=A0 =C2=A0 file://0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.p=
atch \<br>
-=C2=A0 =C2=A0 file://0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib=
32.patch \<br>
-=C2=A0 =C2=A0 file://0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-AB=
I.patch \<br>
-=C2=A0 =C2=A0 file://0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts=
.patch \<br>
-=C2=A0 =C2=A0 file://0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-ot=
her-.patch \<br>
-=C2=A0 =C2=A0 file://0028-compiler-rt-Do-not-pass-target-to-clang-compiler=
.patch \<br>
-=C2=A0 =C2=A0 file://0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-a=
s-we.patch \<br>
-=C2=A0 =C2=A0 file://0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-out=
put.patch \<br>
-=C2=A0 =C2=A0 file://0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-=
ARMv.patch \<br>
-=C2=A0 =C2=A0 file://0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-=
Linu.patch \<br>
-=C2=A0 =C2=A0 file://0034-Revert-libc-Remap-headers-in-the-debug-info-when=
-bui.patch \<br>
-=C2=A0 =C2=A0 file://0035-Prevent-revisiting-block-when-searching-for-nore=
turn.patch \<br>
-=C2=A0 =C2=A0 file://0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-extern=
ally.patch \<br>
-=C2=A0 =C2=A0 file://0037-clang-Only-build-clang-tblgen-if-it-is-actually-=
need.patch \<br>
-=C2=A0 =C2=A0 file://0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM=
_ENA.patch \<br>
-=C2=A0 =C2=A0 file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArc=
h-enum.patch \<br>
-=C2=A0 =C2=A0 file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_pers=
onal.patch \<br>
-=C2=A0 =C2=A0 file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-se=
arch.patch \<br>
-=C2=A0 =C2=A0 file://0042-guard-clang-tools-extra-test.patch \<br>
-=C2=A0 =C2=A0 file://0043-LoopUnroll-Iterate-exit-fold-candidates-in-deter=
mini.patch \<br>
+=C2=A0 =C2=A0 file://0001-compiler-rt-Simplify-cross-compilation.-Don-t-us=
e-na.patch \<br>
+=C2=A0 =C2=A0 file://0002-llvm-allow-env-override-of-exe-and-libdir-path.p=
atch \<br>
+=C2=A0 =C2=A0 file://0003-clang-driver-Check-sysroot-for-ldso-path.patch \=
<br>
+=C2=A0 =C2=A0 file://0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-mus=
l.patch \<br>
+=C2=A0 =C2=A0 file://0005-clang-Prepend-trailing-to-sysroot.patch \<br>
+=C2=A0 =C2=A0 file://0006-clang-Define-releative-gcc-installation-dir.patc=
h \<br>
+=C2=A0 =C2=A0 file://0007-clang-Add-lpthread-and-ldl-along-with-lunwind-fo=
r-st.patch \<br>
+=C2=A0 =C2=A0 file://0008-Check-for-atomic-double-intrinsics.patch \<br>
+=C2=A0 =C2=A0 file://0009-cmake-Fix-configure-for-packages-using-find_pack=
age.patch \<br>
+=C2=A0 =C2=A0 file://0010-clang-Fix-resource-dir-location-for-cross-toolch=
ains.patch \<br>
+=C2=A0 =C2=A0 file://0011-clang-driver-Add-dyld-prefix-when-checking-sysro=
ot-f.patch \<br>
+=C2=A0 =C2=A0 file://0012-clang-Use-python3-in-python-scripts.patch \<br>
+=C2=A0 =C2=A0 file://0013-llvm-clang-Insert-anchor-for-adding-OE-distro-ve=
ndor.patch \<br>
+=C2=A0 =C2=A0 file://0014-clang-Fix-x86-triple-for-non-debian-multiarch-li=
nux-.patch \<br>
+=C2=A0 =C2=A0 file://0015-libunwind-Added-unw_backtrace-method.patch \<br>
+=C2=A0 =C2=A0 file://0016-lldb-Link-with-libatomic-on-x86.patch \<br>
+=C2=A0 =C2=A0 file://0017-compiler-rt-Enable-__int128-for-ppc32.patch \<br=
>
+=C2=A0 =C2=A0 file://0018-llvm-Do-not-use-cmake-infra-to-detect-libzstd.pa=
tch \<br>
+=C2=A0 =C2=A0 file://0019-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.p=
atch \<br>
+=C2=A0 =C2=A0 file://0020-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib=
32.patch \<br>
+=C2=A0 =C2=A0 file://0021-clang-llvm-Add-OE-specific-ABI-triple-for-N32-AB=
I.patch \<br>
+=C2=A0 =C2=A0 file://0022-llvm-Add-libunwind.pc.in-and-llvm-config-scripts=
.patch \<br>
+=C2=A0 =C2=A0 file://0023-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-ot=
her-.patch \<br>
+=C2=A0 =C2=A0 file://0024-compiler-rt-Do-not-pass-target-to-clang-compiler=
.patch \<br>
+=C2=A0 =C2=A0 file://0025-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-a=
s-we.patch \<br>
+=C2=A0 =C2=A0 file://0026-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-out=
put.patch \<br>
+=C2=A0 =C2=A0 file://0027-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-=
ARMv.patch \<br>
+=C2=A0 =C2=A0 file://0028-Hardcode-uptr-sptr-typedefs-on-Mips-Linux.patch =
\<br>
+=C2=A0 =C2=A0 file://0029-Revert-libc-Remap-headers-in-the-debug-info-when=
-bui.patch \<br>
+=C2=A0 =C2=A0 file://0030-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-extern=
ally.patch \<br>
+=C2=A0 =C2=A0 file://0031-Only-build-clang-tblgen-if-it-is-actually-needed=
.patch \<br>
+=C2=A0 =C2=A0 file://0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM=
_ENA.patch \<br>
+=C2=A0 =C2=A0 file://0033-Consolidate-and-fix-sysroot-based-compiler-rt-se=
arch.patch \<br>
+=C2=A0 =C2=A0 file://0034-guard-clang-tools-extra-test.patch \<br>
+=C2=A0 =C2=A0 file://0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.=
patch \<br>
=C2=A0&quot;<br>
=C2=A0# Fallback to no-PIE if not set<br>
=C2=A0GCCPIE ??=3D &quot;&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000f2ca75065a4907cf--

