Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA4DCD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 15:37:18 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23316.1779896229873032706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 08:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dI1HHCVE;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c21049dafso10895443d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 08:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779896229; cv=none;
        d=google.com; s=arc-20240605;
        b=Bn9diBY0rIKfAqTsL0djxSo/sJ30Sc3HhM9jItEtob4Fk8zh8WYMwbxorKToJFBMkz
         nIAyL0epgO/yIqXI4vyl/maQBBpU8grd/9St8/unttDAokiCT0K+/YWNTPgmMLZ5xt9A
         em8DIA5EM8i0mzAOStF1oNTMuhD8a+mpUqaLvX19oqjnvX0u7XI21VcnF7spf9LUxFNC
         5WqBN3jSQ4OKL7haarQdpLJ9kp2gNg3IhRkXtj/RnfB3md+Gib+HQcYeripO6A5edy+J
         /Ga/Aq9arJaiJIYx9+GAcHa0Nk6CZkGT9yqzuT5p9NtFjN4Fvu8hzHvCWVTW6AWNso6x
         rWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ODmKpjx+OJZOagjpPvw3ptpBU8bCN1qPdrwSUxC33xE=;
        fh=0ZCQ9x1NfmTVMlWNiGvD4E2X+VMVRRvQUDvYUSFbvN0=;
        b=gTbdohKExdMjmm+uU8/o7h8MOpZHD+PrZR3J5iwoygYcBPXfvItRbR8+ofS82GekHE
         6hgCrTsLCvf6FL2b3fBF8Mmhxfm8a7vVrk8iQqUYvcZwZfZzkfFXMTX1InIMMV0hti0k
         tG725q88u/iYnd9xwWhd0rSEXKf8Jkhfmv9ly2yR+TtA1FCcRaZm0AFROpOrhxmU5Sih
         PO37ftKo0X9GPq/rp2hvvbHwNs1V+hFwBXe4OrHEvK3bp1m0sT3IRD8WrgMhSjxLqoR8
         3miG+oL9d1l7zRuJSeNLz6ai8NaqQfxysRAw7/oeZsdb3ToHJONC5TH+tWdPpFuOYUdu
         VPSg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779896229; x=1780501029; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ODmKpjx+OJZOagjpPvw3ptpBU8bCN1qPdrwSUxC33xE=;
        b=dI1HHCVEGNdeA4QRrqH/ls3DROPRXU+UrpMdCm2n7o7o3GIwbiGDahcU/t6iFsClOC
         DDnS2DyXCjRXjcuEzDiCMzuJjt9h6G4i/C6+7xs5OwTgQ29XciIv9M8nts8bTtthDFXs
         SgadlB+PBMHXAw+ls1TbhqHV6rH3oj5P/Wp2LJbuQFy1ggG7Ppnmpt+klVz8aOlQvAER
         bd1dRpGiFmqbE3qsDwm1IipGrux1z3Rglqcsk8/5ChM3afRZR4C2nXYribMhQ0LfVqyw
         X5bOXKxWPKXlZH+4895jIfEZLLXe60gh+kNjDs2xREzsTUKTLwdTp8Q6xreEwy4GaYuj
         6HHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896229; x=1780501029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODmKpjx+OJZOagjpPvw3ptpBU8bCN1qPdrwSUxC33xE=;
        b=aiOQVecFsKDPfV6RrnnslKGAYviQBsEfFEUibWP4LHfQp2RWZ9D21JOsBo8fzTSHl9
         IwrGND3WS8l6fMm7DCpVV+oOSg57oNdgOTFC5qNvoz8GsWItt0e6VFYlE+YjhIjP/mRz
         iJq/84DlY9g6ypQApjVX53mdjxekdx4ZeO4mHNCOwzMUwx68gnPGEcZSo+CwJZA1mIXd
         qjU1N32wYXnqIDeyJCglm+ZM69QFQJaw/g6houj5FiJFbRZn+EkIgJxJFx7fRYY9bi14
         nKWyNzsDOv73YQMaD0YY3myGPWK6QkmGc6K7NUkuAk0k4a8NOD8nZdXiaTcKucwfLSNa
         DSyw==
X-Gm-Message-State: AOJu0YyGpxOOzuO42BZ2rnS6zIGM3MtISHN+7J7nvVWlXF0WW1tKaGMP
	xJ5HWjjtBbOup7TSYIsHJZ7xToE80ZarmAXjj71npE25+OHr5pSGKuJAZAGv5ytI3EyQxT2IPoc
	Km4bmRwktX2nDQQj1PT2dtBk8usdebcQ=
X-Gm-Gg: Acq92OFl4UzlqnMC8jt6JpT0ib+HnDXSdEvwUNFhOAyq+qGtLEMSFkVmZg6L4VXhBTE
	2f0aJvFimAixkvHWiCwUju0XeeIz/7pAK/ggxMf+dy9GxYregEtxRtEjPkeSjoDrYBqzlWGplwU
	8ftPFNsdR9jDJtSfOUv2wy2G/hSKCVoKUrMcm9MkkUuKEIdTP7YJPMs5B8kn8doc6rq8pkds9EH
	lEGfdZE4FUFVK5aw31aUsNMWwAolQuxgYj2NW6VTCHToLFqHmzjfGbER1lqNu+YCFVsCWkPQRsB
	nEhaESHDJIBt1snaZGsv9eE0sG59j2fUkOzeq9lb/+ehOH4euGiKfaRpe3hBamUGzasjQF9H5hb
	X7qKPVRO1VKMmydhi7ZSoMUdzOKnGHR9jqibK7p9R6xgbLGYQP+Ec9jIp7pHfViF/FWNLBBn/OJ
	NNI9YOvSLfHVTzSQ==
X-Received: by 2002:a05:690e:d4f:b0:65e:b223:c01 with SMTP id
 956f58d0204a3-65ec99a0e13mr20621834d50.59.1779896228257; Wed, 27 May 2026
 08:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com> <20260527133516.2337150-2-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260527133516.2337150-2-Hemanth.KumarMD@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 May 2026 17:36:56 +0200
X-Gm-Features: AVHnY4JyGcfsWASA2kKPtACc5IeiKaTQ8gjMDAXBMJmhHx80wjwOeKrM8IQiS0c
Message-ID: <CAMKF1srbz7YVSrEccx2YHcs9SreiNqsxPRsiJhZw470j8Ks-CQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/7] gcc: Upgrade GCC to 16.1 release
To: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000006c265c0652ce62fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 15:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237671

--0000000000006c265c0652ce62fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patchset looks good to me

On Wed, May 27, 2026, 3:35=E2=80=AFPM Hemanth Kumar M D via lists.openembed=
ded.org
<Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> Notable changes in GCC 16 include:
> - Improved C23/C++23 support and initial C++26 features
> - Enhanced diagnostics and static analyzer improvements
> - Optimizer and code generation enhancements
> - Target-specific updates for AArch64, RISC-V, x86, and others
> - Runtime library updates (libstdc++, libatomic, libgomp, libsanitizer)
> - Multiple bug fixes and performance improvements
>
> * Rebased existing OE-Core patches for GCC 16.1 and dropped
> patches merged upstream.
>
> For detailed info: https://gcc.gnu.org/gcc-16/changes.html
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   2 +-
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  .../gcc/{gcc-15.2.inc =3D> gcc-16.1.inc}        |  17 +-
>  ...ian_15.2.bb =3D> gcc-cross-canadian_16.1.bb} |   0
>  .../{gcc-cross_15.2.bb =3D> gcc-cross_16.1.bb}  |   0
>  ...-crosssdk_15.2.bb =3D> gcc-crosssdk_16.1.bb} |   0
>  ...cc-runtime_15.2.bb =3D> gcc-runtime_16.1.bb} |   0
>  ...itizers_15.2.bb =3D> gcc-sanitizers_16.1.bb} |   0
>  ...{gcc-source_15.2.bb =3D> gcc-source_16.1.bb} |   0
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   2 +-
>  ...sroot-gcc-version-specific-dirs-with.patch |   4 +-
>  ...omic-Do-not-enforce-march-on-aarch64.patch |  18 +-
>  ...025-gcc-testsuite-tweaks-for-mips-OE.patch |  78 +++---
>  .../gcc/gcc/0026-fix-pr90579-testcases.patch  |  40 ---
>  .../gcc/gcc/0027-gcc15-pr122394.patch         |  88 ------
>  ...028-fix-gcc-libitm-false-postives-01.patch | 187 -------------
>  ...028-fix-gcc-libitm-false-postives-02.patch | 220 ---------------
>  ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 ------------------
>  .../gcc/{gcc_15.2.bb =3D> gcc_16.1.bb}          |   0
>  ...initial_15.2.bb =3D> libgcc-initial_16.1.bb} |   0
>  .../gcc/{libgcc_15.2.bb =3D> libgcc_16.1.bb}    |   0
>  ...ibgfortran_15.2.bb =3D> libgfortran_16.1.bb} |   0
>  22 files changed, 66 insertions(+), 849 deletions(-)
>  rename meta/recipes-devtools/gcc/{gcc-15.2.inc =3D> gcc-16.1.inc} (88%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb =3D>
> gcc-cross-canadian_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb =3D> gcc-cross_16.1.=
bb}
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb =3D>
> gcc-crosssdk_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb =3D>
> gcc-runtime_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb =3D>
> gcc-sanitizers_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb =3D>
> gcc-source_16.1.bb} (100%)
>  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.pat=
ch
>  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-01.patch
>  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-02.patch
>  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C=
-26.patch
>  rename meta/recipes-devtools/gcc/{gcc_15.2.bb =3D> gcc_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb =3D>
> libgcc-initial_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc_15.2.bb =3D> libgcc_16.1.bb}
> (100%)
>  rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb =3D>
> libgfortran_16.1.bb} (100%)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 24c5a9d712..fdfdec28b5 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -200,7 +200,7 @@
> RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "Kh=
em
> Raj <r
>  RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-gcc-source-15.2.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
> +RECIPE_MAINTAINER:pn-gcc-source-16.1.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
>  RECIPE_MAINTAINER:pn-gcompat =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-gcr =3D "Unassigned <unassigned@yoctoproject.org>"
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 3c956dfb12..33d3efd845 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D
> "binutils-crosssdk-${SDK_
>  # Default libc config
>  PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>
> -GCCVERSION ?=3D "15.%"
> +GCCVERSION ?=3D "16.%"
>  SDKGCCVERSION ?=3D "${GCCVERSION}"
>  GLIBCVERSION ?=3D "2.43%"
>  RUSTVERSION ?=3D "1.95.0%"
> diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc
> b/meta/recipes-devtools/gcc/gcc-16.1.inc
> similarity index 88%
> rename from meta/recipes-devtools/gcc/gcc-15.2.inc
> rename to meta/recipes-devtools/gcc/gcc-16.1.inc
> index a96f2b8411..3a96228631 100644
> --- a/meta/recipes-devtools/gcc/gcc-15.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
> @@ -2,11 +2,11 @@ require gcc-common.inc
>
>  # Third digit in PV should be incremented after a minor release
>
> -PV =3D "15.2.0"
> +PV =3D "16.1.0"
>
>  # BINV should be incremented to a revision after a minor gcc release
>
> -BINV =3D "15.2.0"
> +BINV =3D "16.1.0"
>
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>
> @@ -34,17 +34,17 @@ LIC_FILES_CHKSUM =3D "\
>  #SRC_URI[sha256sum] =3D
> "41bf7be5dc029112a9df625266e7de030ffc36ff3638f270b180ae8c91fe6449"
>
>  # from snapshot
> -#RELEASE ?=3D "15-20250420"
> -#RELEASE ?=3D "15.1.0-RC-20250418"
> +#RELEASE ?=3D "16-20260502"
> +#RELEASE ?=3D "16.1.0-RC-20260424"
>  #BASEURI ?=3D "
> https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
>  #SOURCEDIR ?=3D "gcc-${RELEASE}"
> -#SRC_URI[sha256sum] =3D
> "fe18624317c6c662977eea8b5a506ec6c132fc11c7a8d53e2f6d21b139b0af3c"
> +#SRC_URI[sha256sum] =3D
> "e8edc2aaf0affce7020658b0be9a3fc820aa33dc610640d3fe1ba1aee360051b"
>
>  # official release
>  RELEASE ?=3D "${PV}"
>  BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
>  SOURCEDIR ?=3D "gcc-${PV}"
> -SRC_URI[sha256sum] =3D
> "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e"
> +SRC_URI[sha256sum] =3D
> "50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be05b171d36a510f79"
>
>  SRC_URI =3D "${BASEURI} \
>             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> @@ -72,11 +72,6 @@ SRC_URI =3D "${BASEURI} \
>             file://0023-Fix-install-path-of-linux64.h.patch \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
> -           file://0026-fix-pr90579-testcases.patch \
> -           file://0027-gcc15-pr122394.patch \
> -           file://0028-fix-gcc-libitm-false-postives-01.patch \
> -           file://0028-fix-gcc-libitm-false-postives-02.patch \
> -           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
>             file://0001-mapper-localhost-might-not-be-known.patch \
>  "
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
> b/meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_15.2.bb
> b/meta/recipes-devtools/gcc/gcc-cross_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_15.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_16.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
> b/meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
> b/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
> b/meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_15.2.bb
> b/meta/recipes-devtools/gcc/gcc-source_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_15.2.bb
> rename to meta/recipes-devtools/gcc/gcc-source_16.1.bb
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> index 621f8bc41f..07e9e23f3d 100644
> ---
> a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> +++
> b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> @@ -172,7 +172,7 @@ index fbc75a90ad5..38c239940bd 100644
>  +  SYSTEMLIBS_DIR "ld-linux-loongarch-" ABI_SPEC ".so.1"
>
>   #define MUSL_ABI_SPEC \
> -   "%{mabi=3Dlp64d:}" \
> +   "%{mabi=3Dilp32d:}" \
>  @@ -40,7 +40,7 @@ along with GCC; see the file COPYING3.  If not see
>
>   #undef MUSL_DYNAMIC_LINKER
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-sp=
ecific-dirs-with.patch
> b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-sp=
ecific-dirs-with.patch
> index a087ba17d9..678457bbc9 100644
> ---
> a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-sp=
ecific-dirs-with.patch
> +++
> b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-sp=
ecific-dirs-with.patch
> @@ -89,12 +89,12 @@ index 007c91780f6..22eb17bc099 100644
>  +                  {
>  +                    memcpy (path + len, this_multi, this_multi_len + 1)=
;
>  +                    memcpy (path + len + this_multi_len, multi_suffix,
> suffix_len + 1);
> -+                    ret =3D callback (path, callback_info);
> ++                    ret =3D callback (path);
>  +                      if (ret)
>  +                        break;
>  +                  }
>  +              }
>  +
>               memcpy (path + len, multi_suffix, suffix_len + 1);
> -             ret =3D callback (path, callback_info);
> +             ret =3D callback (path);
>               if (ret)
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aa=
rch64.patch
> b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aa=
rch64.patch
> index 0f2a9d8c1f..5a8a79c0d2 100644
> ---
> a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aa=
rch64.patch
> +++
> b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aa=
rch64.patch
> @@ -29,14 +29,14 @@ index 0f1a7156084..255fe448e63 100644
>
>   endif
>  diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> -index 9798e7c09e9..3b3027eb77d 100644
> +index 887ae41..b3d5e6f 100644
>  --- a/libatomic/Makefile.in
>  +++ b/libatomic/Makefile.in
> -@@ -452,7 +452,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE),
> $(all_c_files)))
> - libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsuffix \
> -       _$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
> -       $(am__append_3) $(am__append_4)
> --@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D
> -march=3Darmv8-a+lse
> - @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Darmv7-=
a+fp
> -DHAVE_KERNEL64
> - @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Di586
> - @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -mcx16 -mcx16
> +@@ -470,7 +470,6 @@ libatomic_la_LDFLAGS =3D $(libatomic_version_info)
> $(libatomic_version_script) \
> + @PARTIAL_VXWORKS_FALSE@       _$(s)_.lo,$(SIZEOBJS))) $(am__append_1) \
> + @PARTIAL_VXWORKS_FALSE@       $(am__append_2) $(am__append_3) \
> + @PARTIAL_VXWORKS_FALSE@       $(am__append_4) $(am__append_5)
> +-@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@
> @PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS =3D -march=3Darmv8-a+lse
> + @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@
> @PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS =3D -march=3Darmv7-a+fp -DHAVE_KERNE=
L64
> + @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS =
=3D
> -march=3Di586
> + @ARCH_LOONGARCH_TRUE@@HAVE_IFUNC_TRUE@
> @PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS =3D -mlsx|-mscq
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.pat=
ch
> b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.pat=
ch
> index fcdd79a840..dc708942b4 100644
> ---
> a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.pat=
ch
> +++
> b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.pat=
ch
> @@ -92,10 +92,10 @@ index 6dd8fa3fce9..95672008219 100644
>         "preprocess" {
>             set compile_type "preprocess"
>  diff --git a/gcc/testsuite/lib/target-supports.exp
> b/gcc/testsuite/lib/target-supports.exp
> -index c0376b04551..5d053dfe726 100644
> +index 55775d0..df161a9 100644
>  --- a/gcc/testsuite/lib/target-supports.exp
>  +++ b/gcc/testsuite/lib/target-supports.exp
> -@@ -2949,14 +2949,7 @@ proc check_mips_loongson_mmi_hw_available { } {
> +@@ -3113,14 +3113,7 @@ proc check_mips_loongson_mmi_hw_available { } {
>         if { !([istarget mips*-*-*]) } {
>             expr 0
>         } else {
> @@ -107,11 +107,11 @@ index c0376b04551..5d053dfe726 100644
>  -              return 0;
>  -            }
>  -          } "-mloongson-mmi"
> -+          expr 0
> ++            expr 0
>         }
>       }]
>   }
> -@@ -2970,29 +2963,7 @@ proc check_mips_msa_hw_available { } {
> +@@ -3134,29 +3127,7 @@ proc check_mips_msa_hw_available { } {
>       if { !([istarget mips*-*-*]) } {
>         expr 0
>       } else {
> @@ -138,38 +138,41 @@ index c0376b04551..5d053dfe726 100644
>  -      }
>  -      #endif
>  -      } "-mmsa"
> -+      expr 0
> ++    expr 0
>       }
>     }]
>   }
> -@@ -10371,6 +10342,7 @@ proc is-effective-target-keyword { arg } {
> +@@ -10740,6 +10711,7 @@ proc is-effective-target-keyword { arg } {
>
>   proc et-dg-runtest { runtest testcases flags default-extra-flags } {
>       global dg-do-what-default
> -+    global do-what-limit
> ++    global do-what-limit
>       global EFFECTIVE_TARGETS
>       global et_index
>
> -@@ -10378,6 +10350,7 @@ proc et-dg-runtest { runtest testcases flags
> default-extra-flags } {
> +@@ -10747,16 +10719,19 @@ proc et-dg-runtest { runtest testcases flags
> default-extra-flags } {
>         foreach target $EFFECTIVE_TARGETS {
>             set target_flags $flags
>             set dg-do-what-default compile
> -+            set do-what-limit link
> -           set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
> +-          set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
> ++          set do-what-limit link
> ++            set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
>             if { [info procs add_options_for_${target}] !=3D [list] } {
>                 set target_flags [add_options_for_${target} "$flags"]
> -@@ -10385,8 +10358,10 @@ proc et-dg-runtest { runtest testcases flags
> default-extra-flags } {
> +           }
>             if { [info procs check_effective_target_${target}_runtime]
>                  !=3D [list] && [check_effective_target_${target}_runtime=
] }
> {
>                 set dg-do-what-default run
> -+              set do-what-limit run
> ++                set do-what-limit run
>             }
>             $runtest $testcases $target_flags ${default-extra-flags}
> +-          unset et_index
>  +          unset do-what-limit
> ++            unset et_index
>         }
>       } else {
> -       set et_index 0
> -@@ -12172,6 +12147,7 @@ proc check_effective_target_sigsetjmp {} {
> +       $runtest $testcases $flags ${default-extra-flags}
> +@@ -12539,6 +12514,7 @@ proc check_effective_target_sigsetjmp {} {
>   proc check_vect_support_and_set_flags { } {
>       global DEFAULT_VECTCFLAGS
>       global dg-do-what-default
> @@ -177,51 +180,62 @@ index c0376b04551..5d053dfe726 100644
>       global EFFECTIVE_TARGETS
>
>       if [istarget powerpc*-*-*] {
> -@@ -12203,6 +12179,7 @@ proc check_vect_support_and_set_flags { } {
> +@@ -12570,14 +12546,16 @@ proc check_vect_support_and_set_flags { } {
>                 set DEFAULT_VECTCFLAGS [linsert $DEFAULT_VECTCFLAGS 0
> "-mcpu=3D970"]
>             }
>             set dg-do-what-default compile
> -+        set do-what-limit link
> -       }
> +-      }
> ++       set do-what-limit link
> ++        }
>       } elseif { [check_effective_target_x86] } {
>         lappend DEFAULT_VECTCFLAGS "-msse2"
> -@@ -12210,6 +12187,7 @@ proc check_vect_support_and_set_flags { } {
> +       if { [check_effective_target_sse2_runtime] } {
>             set dg-do-what-default run
>         } else {
>             set dg-do-what-default compile
> -+        set do-what-limit link
> -       }
> +-      }
> ++         set do-what-limit link
> ++        }
>       } elseif { [istarget mips*-*-*]
>                && [check_effective_target_nomips16] } {
> -@@ -12229,6 +12207,7 @@ proc check_vect_support_and_set_flags { } {
> +       if { [check_effective_target_mpaired_single "-mpaired-single"] } =
{
> +@@ -12596,7 +12574,8 @@ proc check_vect_support_and_set_flags { } {
>             set dg-do-what-default run
>         } else {
>             set dg-do-what-default compile
> -+        set do-what-limit link
> -       }
> +-      }
> ++       set do-what-limit link
> ++        }
>       } elseif [istarget alpha*-*-*] {
>         # Alpha's vectorization capabilities are extremely limited.
> -@@ -12242,6 +12221,7 @@ proc check_vect_support_and_set_flags { } {
> +       # It's more effort than its worth disabling all of the tests
> +@@ -12609,7 +12588,8 @@ proc check_vect_support_and_set_flags { } {
>             set dg-do-what-default run
>         } else {
>             set dg-do-what-default compile
> -+        set do-what-limit link
> -       }
> +-      }
> ++       set do-what-limit link
> ++        }
>       } elseif [istarget ia64-*-*] {
>         set dg-do-what-default run
> -@@ -12255,6 +12235,7 @@ proc check_vect_support_and_set_flags { } {
> +     } elseif [is-effective-target arm_neon_ok] {
> +@@ -12622,7 +12602,8 @@ proc check_vect_support_and_set_flags { } {
>             set dg-do-what-default run
>         } else {
>             set dg-do-what-default compile
> -+        set do-what-limit link
> -       }
> +-      }
> ++       set do-what-limit link
> ++        }
>       } elseif [istarget aarch64*-*-*] {
>         set dg-do-what-default run
> -@@ -12279,6 +12260,7 @@ proc check_vect_support_and_set_flags { } {
> +     } elseif [istarget s390*-*-*] {
> +@@ -12646,7 +12627,8 @@ proc check_vect_support_and_set_flags { } {
>         } else {
>             lappend DEFAULT_VECTCFLAGS "-march=3Dz14" "-mzarch"
>             set dg-do-what-default compile
> -+        set do-what-limit link
> -       }
> +-      }
> ++       set do-what-limit link
> ++        }
>       } elseif [istarget amdgcn-*-*] {
>         set dg-do-what-default run
> +     } elseif [istarget riscv*-*-*] {
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
> b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
> deleted file mode 100644
> index 6ada61b74f..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 679e24f5a751663998ff7202149a749e0f7251f9 Mon Sep 17 00:00:00 2001
> -From: Harish Sadineni <Harish.Sadineni@windriver.com>
> -Date: Sun, 10 Aug 2025 20:28:00 +0800
> -Subject: [PATCH] testsuite: i386: Fix gcc.target/i386/pr90579.c when PIE
> is
> - enabled [PR118885]
> -
> -When gcc build with --enable-deafult-pie the following tests
> -were getting failed:
> - FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
> - FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
> - FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
> - FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16
> -
> -    PR target/118885
> -
> -gcc/testsuite/ChangeLog:
> -
> -    * gcc.target/i386/pr90579.c: add -fno-pie to dg-options
> -    to fix tests when PIE is enabled.
> -
> -Upstream-Status: Backport [
> https://gcc.gnu.org/cgit/gcc/commit/?id=3D679e24f5a751663998ff7202149a749=
e0f7251f9
> ]
> -
> -Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ----
> - gcc/testsuite/gcc.target/i386/pr90579.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc/testsuite/gcc.target/i386/pr90579.c
> b/gcc/testsuite/gcc.target/i386/pr90579.c
> -index ab48a44063c..19081ec9fdf 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr90579.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr90579.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-O3 -mavx2 -mfpmath=3Dsse" } */
> -+/* { dg-options "-O3 -mavx2 -mfpmath=3Dsse -fno-pie" } */
> -
> - extern double r[6];
> - extern double a[];
> ---
> -2.49.0
> diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
> b/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
> deleted file mode 100644
> index 9ee371cef7..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -From e55dcff97708a4937dc4d8736b8b3074ebbff6f3 Mon Sep 17 00:00:00 2001
> -From: Jakub Jelinek <jakub@redhat.com>
> -Date: Mon, 27 Oct 2025 17:43:17 +0100
> -Subject: phiopt: Fix up DEBUG_EXPR_DECL creation in spaceship_replacemen=
t
> - [PR122394]
> -
> -The following testcase ICEs in gcc 15 (and is at least latent in 12-14
> too),
> -because the DEBUG_EXPR_DECL has incorrect mode.  It has
> -TREE_TYPE (orig_use_lhs) type, but TYPE_MODE (type) rather than
> -TYPE_MODE (TREE_TYPE (orig_use_lhs)) where the two types are sometimes
> -the same, but sometimes different (same if !has_cast_debug_uses, differe=
nt
> -otherwise).
> -
> -Though, there wouldn't be the this issue if it used the proper API to
> create
> -the DEBUG_EXPR_DECL which takes care of everything.  This is the sole
> -spot that doesn't use that API.
> -
> -Doesn't affect the trunk because the code has been removed and replaced
> with
> -different stuff after the libstdc++ ABI change in r16-3474.
> -Before r15-5557 the mode has been always wrong because this was done onl=
y
> -for has_cast_debug_uses.  And the bug has been introduced with r12-5490.
> -
> -Enough archeology, while it could be fixed by changing the second
> -SET_DECL_MODE argument, I think it is better to use build_debug_expr_dec=
l.
> -
> -2025-10-27  Jakub Jelinek  <jakub@redhat.com>
> -
> -       PR tree-optimization/122394
> -       * tree-ssa-phiopt.cc (spaceship_replacement): Use
> -       build_debug_expr_decl instead of manually building DEBUG_EXPR_DEC=
L
> -       and getting SET_DECL_MODE wrong.
> -
> -       * g++.dg/opt/pr122394.C: New test.
> -
> -Upstream-Status: Backport [
> https://gcc.gnu.org/cgit/gcc/commit/?id=3De55dcff97708a4937dc4d8736b8b307=
4ebbff6f3
> ]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc/testsuite/g++.dg/opt/pr122394.C | 20 ++++++++++++++++++++
> - gcc/tree-ssa-phiopt.cc              |  6 ++----
> - 2 files changed, 22 insertions(+), 4 deletions(-)
> - create mode 100644 gcc/testsuite/g++.dg/opt/pr122394.C
> -
> -diff --git a/gcc/testsuite/g++.dg/opt/pr122394.C
> b/gcc/testsuite/g++.dg/opt/pr122394.C
> -new file mode 100644
> -index 000000000000..1f84bebd74c2
> ---- /dev/null
> -+++ b/gcc/testsuite/g++.dg/opt/pr122394.C
> -@@ -0,0 +1,20 @@
> -+// PR tree-optimization/122394
> -+// { dg-do compile { target c++23 } }
> -+// { dg-options "-O1 -g" }
> -+
> -+#include <compare>
> -+
> -+struct A {
> -+  friend auto operator<=3D> (A, A) =3D default;
> -+  double a;
> -+};
> -+void foo ();
> -+A b, c;
> -+
> -+void
> -+bar ()
> -+{
> -+  bool d =3D c >=3D b;
> -+  if (d)
> -+    foo ();
> -+}
> -diff --git a/gcc/tree-ssa-phiopt.cc b/gcc/tree-ssa-phiopt.cc
> -index aaebae6b38c0..3e0ad9d3bb09 100644
> ---- a/gcc/tree-ssa-phiopt.cc
> -+++ b/gcc/tree-ssa-phiopt.cc
> -@@ -2995,10 +2995,8 @@ spaceship_replacement (basic_block cond_bb,
> basic_block middle_bb,
> -             if (has_cast_debug_uses
> -                 || (HONOR_NANS (TREE_TYPE (lhs1)) && !is_cast))
> -               {
> --                tree temp3 =3D make_node (DEBUG_EXPR_DECL);
> --                DECL_ARTIFICIAL (temp3) =3D 1;
> --                TREE_TYPE (temp3) =3D TREE_TYPE (orig_use_lhs);
> --                SET_DECL_MODE (temp3, TYPE_MODE (type));
> -+                tree temp3
> -+                  =3D build_debug_expr_decl (TREE_TYPE (orig_use_lhs));
> -                 if (has_cast_debug_uses)
> -                   t =3D fold_convert (TREE_TYPE (temp3), temp2);
> -                 else
> ---
> -cgit
> -
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-01.pat=
ch
> b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-01.pat=
ch
> deleted file mode 100644
> index d8ed99adb5..0000000000
> ---
> a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-01.pat=
ch
> +++ /dev/null
> @@ -1,187 +0,0 @@
> -From b129ff0880c6d10e0379b46889d01255ee8d1f82 Mon Sep 17 00:00:00 2001
> -From: Pietro Monteiro <pietro@sociotechnical.xyz>
> -Date: Fri, 30 Jan 2026 20:22:49 -0500
> -Subject: libitm: testsuite: don't include libstdc++ paths in test names
> - [PR69018]
> -
> -Libitm C++ tests pass -B/full/path/to/build/libstc++/src/.libs on the
> -options argument to dg-runtest and the libstdc++ include paths as
> -the default-extra-options.  This causes 2 problems:
> -
> -1) If a test uses `dg-options' then the libstdc++ include paths are
> -not passed to the compiler.
> -
> -2) The `-B/full/path/to/build/libstc++/src/.libs' gets added to the
> -test name.  This makes comparing build done in different directories
> -harder because the hardcoded full path.
> -
> -Stop passing options and default-extra-options to dg-runtest and move
> -dealing with the path-releated flags to libitm_target_compile in
> -libitm.exp, where they are added to additional_flags.
> -
> -Also change the FSF address to the website in the license text.
> -
> -libitm/ChangeLog:
> -       PR libitm/69018
> -       * testsuite/lib/libitm.exp (libitm_target_compile): Add
> -       lang_include_flags and `-B${blddir}/${lang_library_paths}' to
> -       additional_flags.
> -       * testsuite/libitm.c++/c++.exp: Set lang_library_paths and
> lang_include_flags.
> -
> -Upstream-Status: Backport [
> https://gcc.gnu.org/cgit/gcc/patch/?id=3Db129ff0880c6d10e0379b46889d01255=
ee8d1f82
> ]
> -
> -Signed-off-by: Pietro Monteiro <pietro@sociotechnical.xyz>
> -Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ----
> - libitm/testsuite/lib/libitm.exp     | 25 ++++++++++----
> - libitm/testsuite/libitm.c++/c++.exp | 67
> +++++++++++++++++--------------------
> - 2 files changed, 48 insertions(+), 44 deletions(-)
> -
> -diff --git a/libitm/testsuite/lib/libitm.exp
> b/libitm/testsuite/lib/libitm.exp
> -index 0b3301537cee..69a49906d338 100644
> ---- a/libitm/testsuite/lib/libitm.exp
> -+++ b/libitm/testsuite/lib/libitm.exp
> -@@ -9,8 +9,7 @@
> - # GNU General Public License for more details.
> - #
> - # You should have received a copy of the GNU General Public License
> --# along with this program; if not, write to the Free Software
> --# Foundation, Inc., 51 Franklin Street
> <https://www.google.com/maps/search/51+Franklin+Street?entry=3Dgmail&sour=
ce=3Dg>,
> Fifth Floor, Boston, MA 02110-1301, USA.
> -+# along with this program; if not, see <http://www.gnu.org/licenses/>.
> -
> - # Damn dejagnu for not having proper library search paths for load_lib.
> - # We have to explicitly load everything that gcc-dg.exp wants to load.
> -@@ -193,14 +192,24 @@ proc libitm_target_compile { source dest type
> options } {
> -     global gluefile wrap_flags
> -     global ALWAYS_CFLAGS
> -     global GCC_UNDER_TEST
> --    global lang_test_file
> --    global lang_library_path
> -+    global lang_library_paths
> -     global lang_link_flags
> -+    global lang_include_flags
> -
> --    if { [info exists lang_test_file] } {
> --      if { $blddir !=3D "" } {
> -+    if { [info exists lang_include_flags] } {
> -+      lappend options "additional_flags=3D${lang_include_flags}"
> -+    }
> -+
> -+    if { [info exists lang_library_paths] } {
> -+      foreach lang_library_path $lang_library_paths {
> -+          # targets that use lib[...].a%s in their specs need a -B opti=
on
> -+          # for uninstalled testing.
> -+          lappend options
> "additional_flags=3D-B${blddir}/${lang_library_path}"
> -           lappend options "ldflags=3D-L${blddir}/${lang_library_path}"
> -       }
> -+    }
> -+
> -+    if { [info exists lang_link_flags] } {
> -       lappend options "ldflags=3D${lang_link_flags}"
> -     }
> -
> -@@ -219,7 +228,9 @@ proc libitm_target_compile { source dest type option=
s
> } {
> -       set options [concat "$ALWAYS_CFLAGS" $options]
> -     }
> -
> --    set options [dg-additional-files-options $options $source $dest
> $type]
> -+    if { $source !=3D "" } {
> -+        set options [dg-additional-files-options $options $source $dest
> $type]
> -+    }
> -
> -     set result [target_compile $source $dest $type $options]
> -
> -diff --git a/libitm/testsuite/libitm.c++/c++.exp
> b/libitm/testsuite/libitm.c++/c++.exp
> -index a1ce7ce4062e..90f3058e7249 100644
> ---- a/libitm/testsuite/libitm.c++/c++.exp
> -+++ b/libitm/testsuite/libitm.c++/c++.exp
> -@@ -11,8 +11,7 @@
> - # GNU General Public License for more details.
> - #
> - # You should have received a copy of the GNU General Public License
> --# along with this program; if not, write to the Free Software
> --# Foundation, Inc., 51 Franklin Street
> <https://www.google.com/maps/search/51+Franklin+Street?entry=3Dgmail&sour=
ce=3Dg>,
> Fifth Floor, Boston, MA 02110-1301, USA.
> -+# along with this program; if not, see <http://www.gnu.org/licenses/>.
> -
> - load_lib libitm-dg.exp
> - load_gcc_lib gcc-dg.exp
> -@@ -33,48 +32,42 @@ set blddir [lookfor_file [get_multilibs] libitm]
> -
> -
> - if { $blddir !=3D "" } {
> --    # Look for a static libstdc++ first.
> --    if [file exists "${blddir}/${lang_library_path}/libstdc++.a"] {
> --      set lang_test_file "${lang_library_path}/libstdc++.a"
> --      set lang_test_file_found 1
> --      # We may have a shared only build, so look for a shared libstdc++=
.
> --    } elseif [file exists
> "${blddir}/${lang_library_path}/libstdc++.${shlib_ext}"] {
> --      set lang_test_file "${lang_library_path}/libstdc++.${shlib_ext}"
> --      set lang_test_file_found 1
> --    } else {
> --      puts "No libstdc++ library found, will not execute c++ tests"
> -+    if { ![file exists "${blddir}/${lang_library_path}/libstdc++.a"]
> -+       && ![file exists
> "${blddir}/${lang_library_path}/libstdc++.${shlib_ext}"] } {
> -+      verbose -log "No libstdc++ library found, will not execute c++
> tests"
> -+      unset lang_library_path
> -+      return
> -     }
> --} elseif { [info exists GXX_UNDER_TEST] } {
> --    set lang_test_file_found 1
> --    # Needs to exist for libitm.exp.
> --    set lang_test_file ""
> -+    lappend lang_library_paths ${lang_library_path}
> -+} elseif { ![info exists GXX_UNDER_TEST] } {
> -+    verbose -log "GXX_UNDER_TEST not defined, will not execute c++ test=
s"
> -+    return
> -+}
> -+
> -+# Gather a list of all tests.
> -+set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]
> -+
> -+if { $blddir !=3D "" } {
> -+    set ld_library_path
> "$always_ld_library_path:${blddir}/${lang_library_path}"
> - } else {
> --    puts "GXX_UNDER_TEST not defined, will not execute c++ tests"
> -+    set ld_library_path "$always_ld_library_path"
> - }
> -
> --if { $lang_test_file_found } {
> --    # Gather a list of all tests.
> --    set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]
> -+append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TEST]
> -+set_ld_library_path_env_vars
> -
> --    set stdcxxadder ""
> --    if { $blddir !=3D "" } {
> --      set ld_library_path
> "$always_ld_library_path:${blddir}/${lang_library_path}"
> --      set stdcxxadder "-B ${blddir}/${lang_library_path}"
> --    } else {
> --      set ld_library_path "$always_ld_library_path"
> --    }
> --    append ld_library_path [gcc-set-multilib-library-path
> $GCC_UNDER_TEST]
> --    set_ld_library_path_env_vars
> -+set flags_file "${blddir}/../libstdc++-v3/scripts/testsuite_flags"
> -+if { [file exists $flags_file] } {
> -+    set lang_include_flags [exec sh $flags_file --build-includes]
> -+}
> -
> --    set flags_file "${blddir}/../libstdc++-v3/scripts/testsuite_flags"
> --    if { [file exists $flags_file] } {
> --      set libstdcxx_includes [exec sh $flags_file --build-includes]
> --    } else {
> --      set libstdcxx_includes ""
> --    }
> -+# Main loop.
> -+dg-runtest $tests "" ""
> -
> --    # Main loop.
> --    dg-runtest $tests $stdcxxadder $libstdcxx_includes
> -+if { $blddir !=3D "" } {
> -+    unset lang_include_flags
> -+    unset lang_library_path
> -+    unset lang_library_paths
> - }
> -
> - # All done.
> ---
> -cgit
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-02.pat=
ch
> b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-02.pat=
ch
> deleted file mode 100644
> index 67ed47ff51..0000000000
> ---
> a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-02.pat=
ch
> +++ /dev/null
> @@ -1,220 +0,0 @@
> -From 66ce317036f2eb5aeb96d5e4b9e468799d7566b6 Mon Sep 17 00:00:00 2001
> -From: Pietro Monteiro <pietro@sociotechnical.xyz>
> -Date: Wed, 11 Feb 2026 11:55:13 -0500
> -Subject: libitm: Fix recent libitm testsuite regression [PR69018]
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The commit r16-7202-gb129ff0880c6d1 broke running libitm=E2=80=99s tests=
uite
> -using combinations of options because it didn=E2=80=99t clean up all the
> -global variables set in c++.exp.  Fix the regression by using g++ for
> -the C++ tests and cleaning up the variables shared between C and C++
> -tests.
> -
> -libitm/ChangeLog:
> -       PR libitm/69018
> -       * testsuite/lib/libitm.exp (libitm_init): Check
> -       GXX_UNDER_TEST.  Add "${blddir}/.libs" to
> -       always_ld_library_path if blddir is not empty.  Use
> -       "-fdiagnostics-plain-output".  Don't set compiler to
> GCC_UNDER_TEST.
> -       * testsuite/libitm.c++/c++.exp: If $blddir is not empty set
> -       libstdc++_library_path, shlib_ext, lang_include_flags, add
> -       "${blddir}/${lang_library_paths}" to ld_library_path.
> -       Unset libstdc++_library_path and shlib_ext if we skip C++
> -       tests and at the end of the test run.
> -       * testsuite/libitm.c/c.exp: Update the FSF address to the
> -       website in the license text. Unset lang_library_paths and
> -       lang_include_flags.  Set the compiler to $GCC_UNDER_TEST.
> -
> -Upstream-Status: Backport [
> https://gcc.gnu.org/cgit/gcc/patch/?id=3D66ce317036f2eb5aeb96d5e4b9e46879=
9d7566b6
> ]
> -
> -Co-authored-by: Jakub Jelinek  <jakub@redhat.com>
> -Signed-off-by: Pietro Monteiro <pietro@sociotechnical.xyz>
> -Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ----
> - libitm/testsuite/lib/libitm.exp     | 21 +++++++++++++++----
> - libitm/testsuite/libitm.c++/c++.exp | 42
> ++++++++++++++-----------------------
> - libitm/testsuite/libitm.c/c.exp     | 14 ++++++-------
> - 3 files changed, 40 insertions(+), 37 deletions(-)
> -
> -diff --git a/libitm/testsuite/lib/libitm.exp
> b/libitm/testsuite/lib/libitm.exp
> -index 69a49906d338..2de0f6cbf158 100644
> ---- a/libitm/testsuite/lib/libitm.exp
> -+++ b/libitm/testsuite/lib/libitm.exp
> -@@ -79,7 +79,7 @@ proc libitm_init { args } {
> -     global ALWAYS_CFLAGS
> -     global CFLAGS
> -     global TOOL_EXECUTABLE TOOL_OPTIONS
> --    global GCC_UNDER_TEST
> -+    global GCC_UNDER_TEST GXX_UNDER_TEST
> -     global TESTING_IN_BUILD_TREE
> -     global target_triplet
> -     global always_ld_library_path
> -@@ -97,6 +97,17 @@ proc libitm_init { args } {
> -       } else {
> -           set GCC_UNDER_TEST "[find_gcc]"
> -       }
> -+      # Only if we're guessing 'GCC_UNDER_TEST', we're also going to
> guess
> -+      # 'GXX_UNDER_TEST'
> -+      if ![info exists GXX_UNDER_TEST] then {
> -+          if [info exists TOOL_EXECUTABLE] {
> -+              set GXX_UNDER_TEST $TOOL_EXECUTABLE
> -+          } else {
> -+              set GXX_UNDER_TEST "[find_g++]"
> -+          }
> -+      } else {
> -+          error "GXX_UNDER_TEST set but not GCC_UNDER_TEST"
> -+      }
> -     }
> -
> -     if ![info exists tmpdir] {
> -@@ -119,7 +130,7 @@ proc libitm_init { args } {
> -     }
> -
> -     # Compute what needs to be put into LD_LIBRARY_PATH
> --    set always_ld_library_path ".:${blddir}/.libs"
> -+    set always_ld_library_path "."
> -
> -     # Compute what needs to be added to the existing LD_LIBRARY_PATH.
> -     if {$gccdir !=3D ""} {
> -@@ -150,6 +161,8 @@ proc libitm_init { args } {
> -       lappend ALWAYS_CFLAGS "additional_flags=3D-B${blddir}/"
> -       lappend ALWAYS_CFLAGS "additional_flags=3D-I${blddir}"
> -       lappend ALWAYS_CFLAGS "ldflags=3D-L${blddir}/.libs"
> -+
> -+      append always_ld_library_path ":${blddir}/.libs"
> -     }
> -     lappend ALWAYS_CFLAGS "additional_flags=3D-I${srcdir}/.."
> -
> -@@ -179,7 +192,8 @@ proc libitm_init { args } {
> -     # Turn on transactional memory support.
> -     lappend ALWAYS_CFLAGS "additional_flags=3D-fgnu-tm"
> -
> --    lappend ALWAYS_CFLAGS "additional_flags=3D-fdiagnostics-color=3Dnev=
er"
> -+    # Disable caret, color, URL diagnostics
> -+    lappend ALWAYS_CFLAGS "additional_flags=3D-fdiagnostics-plain-outpu=
t"
> - }
> -
> - #
> -@@ -220,7 +234,6 @@ proc libitm_target_compile { source dest type option=
s
> } {
> -
> -     lappend options "additional_flags=3D[libio_include_flags]"
> -     lappend options "timeout=3D[timeout_value]"
> --    lappend options "compiler=3D$GCC_UNDER_TEST"
> -
> -     set options [concat $libitm_compile_options $options]
> -
> -diff --git a/libitm/testsuite/libitm.c++/c++.exp
> b/libitm/testsuite/libitm.c++/c++.exp
> -index 90f3058e7249..c24dc830bcc5 100644
> ---- a/libitm/testsuite/libitm.c++/c++.exp
> -+++ b/libitm/testsuite/libitm.c++/c++.exp
> -@@ -16,39 +16,33 @@
> - load_lib libitm-dg.exp
> - load_gcc_lib gcc-dg.exp
> -
> --global shlib_ext
> --
> --set shlib_ext [get_shlib_extension]
> --# The C++ tests should be linked with g++, which defaults to
> -shared-libgcc.
> --# Doing that is currently too intrusive, so hardcode here.
> --set lang_link_flags "-shared-libgcc -lstdc++"
> --set lang_test_file_found 0
> --set lang_library_path "../libstdc++-v3/src/.libs"
> --
> --# Initialize dg.
> --dg-init
> --
> --set blddir [lookfor_file [get_multilibs] libitm]
> --
> --
> - if { $blddir !=3D "" } {
> --    if { ![file exists "${blddir}/${lang_library_path}/libstdc++.a"]
> --       && ![file exists
> "${blddir}/${lang_library_path}/libstdc++.${shlib_ext}"] } {
> -+    set libstdc++_library_path "../libstdc++-v3/src/.libs"
> -+    set shlib_ext [get_shlib_extension]
> -+    if { ![file exists "${blddir}/${libstdc++_library_path}/libstdc++.a=
"]
> -+       && ![file exists
> "${blddir}/${libstdc++_library_path}/libstdc++.${shlib_ext}"] } {
> -       verbose -log "No libstdc++ library found, will not execute c++
> tests"
> --      unset lang_library_path
> -+      unset libstdc++_library_path
> -+      unset shlib_ext
> -       return
> -     }
> --    lappend lang_library_paths ${lang_library_path}
> -+    lappend lang_library_paths ${libstdc++_library_path}
> - } elseif { ![info exists GXX_UNDER_TEST] } {
> -     verbose -log "GXX_UNDER_TEST not defined, will not execute c++ test=
s"
> -     return
> - }
> -
> -+lappend ALWAYS_CFLAGS "compiler=3D$GXX_UNDER_TEST"
> -+
> -+# Initialize dg.
> -+dg-init
> -+
> - # Gather a list of all tests.
> - set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]
> -
> - if { $blddir !=3D "" } {
> --    set ld_library_path
> "$always_ld_library_path:${blddir}/${lang_library_path}"
> -+    set lang_include_flags [exec sh
> ${blddir}/../libstdc++-v3/scripts/testsuite_flags --build-includes]
> -+    set ld_library_path
> "$always_ld_library_path:${blddir}/${lang_library_paths}"
> - } else {
> -     set ld_library_path "$always_ld_library_path"
> - }
> -@@ -56,18 +50,14 @@ if { $blddir !=3D "" } {
> - append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TEST]
> - set_ld_library_path_env_vars
> -
> --set flags_file "${blddir}/../libstdc++-v3/scripts/testsuite_flags"
> --if { [file exists $flags_file] } {
> --    set lang_include_flags [exec sh $flags_file --build-includes]
> --}
> --
> - # Main loop.
> - dg-runtest $tests "" ""
> -
> - if { $blddir !=3D "" } {
> -     unset lang_include_flags
> --    unset lang_library_path
> -+    unset libstdc++_library_path
> -     unset lang_library_paths
> -+    unset shlib_ext
> - }
> -
> - # All done.
> -diff --git a/libitm/testsuite/libitm.c/c.exp
> b/libitm/testsuite/libitm.c/c.exp
> -index daa71427d64c..7a697b870932 100644
> ---- a/libitm/testsuite/libitm.c/c.exp
> -+++ b/libitm/testsuite/libitm.c/c.exp
> -@@ -9,20 +9,20 @@
> - # GNU General Public License for more details.
> - #
> - # You should have received a copy of the GNU General Public License
> --# along with this program; if not, write to the Free Software
> --# Foundation, Inc., 51 Franklin Street
> <https://www.google.com/maps/search/51+Franklin+Street?entry=3Dgmail&sour=
ce=3Dg>,
> Fifth Floor, Boston, MA 02110-1301, USA.
> -+# along with this program; if not, see <http://www.gnu.org/licenses/>.
> -
> --if [info exists lang_library_path] then {
> --    unset lang_library_path
> --    unset lang_link_flags
> -+if [info exists lang_library_paths] then {
> -+    unset lang_library_paths
> - }
> --if [info exists lang_test_file] then {
> --    unset lang_test_file
> -+if [info exists lang_include_flags] then {
> -+    unset lang_include_flags
> - }
> -
> - load_lib libitm-dg.exp
> - load_gcc_lib gcc-dg.exp
> -
> -+lappend ALWAYS_CFLAGS "compiler=3D$GCC_UNDER_TEST"
> -+
> - # If a testcase doesn't have special options, use these.
> - if ![info exists DEFAULT_CFLAGS] then {
> -     set DEFAULT_CFLAGS "-O2"
> ---
> -cgit
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to=
-C-26.patch
> b/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to=
-C-26.patch
> deleted file mode 100644
> index 431facb011..0000000000
> ---
> a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to=
-C-26.patch
> +++ /dev/null
> @@ -1,257 +0,0 @@
> -From 0ffe3c9af4e5d5468df742512b6e930fe7039230 Mon Sep 17 00:00:00 2001
> -From: Jakub Jelinek <jakub@redhat.com>
> -Date: Fri, 21 Nov 2025 16:25:58 +0100
> -Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
> -
> -The following builds with -std=3Dc++11 and c++14 and c++17 and c++20 and
> c++23
> -and c++26.
> -
> -I see the u8 string literals are mixed e.g. with strerror, so in
> --fexec-charset=3DIBM1047 there will still be garbage, so am not 100% sur=
e if
> -the u8 literals everywhere are worth it either.
> -
> -2025-11-21  Jakub Jelinek  <jakub@redhat.com>
> -
> -       * cody.hh (S2C): For __cpp_char8_t >=3D 201811 use char8_t instea=
d of
> -       char in argument type.
> -       (MessageBuffer::Space): Revert 2025-11-15 change.
> -       (MessageBuffer::Append): For __cpp_char8_t >=3D 201811 add overlo=
ad
> -       with char8_t const * type of first argument.
> -       (Packet::Packet): Similarly for first argument.
> -       * client.cc (CommunicationError, Client::ProcessResponse,
> -       Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
> -       IncludeTranslateResponse): Cast u8 string literals to (const char
> *)
> -       where needed.
> -       * server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
> -
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> -Upstream-Status: Backport [07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7]
> ----
> - libcody/client.cc | 36 +++++++++++++++++++-----------------
> - libcody/cody.hh   | 22 ++++++++++++++++++++++
> - libcody/server.cc | 28 ++++++++++++++--------------
> - 3 files changed, 55 insertions(+), 31 deletions(-)
> -
> -diff --git a/libcody/client.cc b/libcody/client.cc
> -index ae69d190cb77..147fecdbe500 100644
> ---- a/libcody/client.cc
> -+++ b/libcody/client.cc
> -@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
> -
> - static Packet CommunicationError (int err)
> - {
> --  std::string e {u8"communication error:"};
> -+  std::string e {(const char *) u8"communication error:"};
> -   e.append (strerror (err));
> -
> -   return Packet (Client::PC_ERROR, std::move (e));
> -@@ -110,33 +110,34 @@ Packet Client::ProcessResponse
> (std::vector<std::string> &words,
> -     {
> -       if (e =3D=3D EINVAL)
> -       {
> --        std::string msg (u8"malformed string '");
> -+        std::string msg ((const char *) u8"malformed string '");
> -         msg.append (words[0]);
> --        msg.append (u8"'");
> -+        msg.append ((const char *) u8"'");
> -         return Packet (Client::PC_ERROR, std::move (msg));
> -       }
> -       else
> --      return Packet (Client::PC_ERROR, u8"missing response");
> -+      return Packet (Client::PC_ERROR, (const char *) u8"missing
> response");
> -     }
> -
> -   Assert (!words.empty ());
> --  if (words[0] =3D=3D u8"ERROR")
> -+  if (words[0] =3D=3D (const char *) u8"ERROR")
> -     return Packet (Client::PC_ERROR,
> --                 words.size () =3D=3D 2 ? words[1]: u8"malformed error
> response");
> -+                 words.size () =3D=3D 2 ? words[1]
> -+                 : (const char *) u8"malformed error response");
> -
> -   if (isLast && !read.IsAtEnd ())
> -     return Packet (Client::PC_ERROR,
> --                 std::string (u8"unexpected extra response"));
> -+                 std::string ((const char *) u8"unexpected extra
> response"));
> -
> -   Assert (code < Detail::RC_HWM);
> -   Packet result (responseTable[code] (words));
> -   result.SetRequest (code);
> -   if (result.GetCode () =3D=3D Client::PC_ERROR && result.GetString ().=
empty
> ())
> -     {
> --      std::string msg {u8"malformed response '"};
> -+      std::string msg {(const char *) u8"malformed response '"};
> -
> -       read.LexedLine (msg);
> --      msg.append (u8"'");
> -+      msg.append ((const char *) u8"'");
> -       result.GetString () =3D std::move (msg);
> -     }
> -   else if (result.GetCode () =3D=3D Client::PC_CONNECT)
> -@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char cons=
t
> *ident,
> -                         size_t alen, size_t ilen)
> - {
> -   write.BeginLine ();
> --  write.AppendWord (u8"HELLO");
> -+  write.AppendWord ((const char *) u8"HELLO");
> -   write.AppendInteger (Version);
> -   write.AppendWord (agent, true, alen);
> -   write.AppendWord (ident, true, ilen);
> -@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char cons=
t
> *ident,
> - // HELLO $version $agent [$flags]
> - Packet ConnectResponse (std::vector<std::string> &words)
> - {
> --  if (words[0] =3D=3D u8"HELLO" && (words.size () =3D=3D 3 || words.siz=
e () =3D=3D
> 4))
> -+  if (words[0] =3D=3D (const char *) u8"HELLO"
> -+      && (words.size () =3D=3D 3 || words.size () =3D=3D 4))
> -     {
> -       char *eptr;
> -       unsigned long val =3D strtoul (words[1].c_str (), &eptr, 10);
> -@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
> - // PATHNAME $dir | ERROR
> - Packet PathnameResponse (std::vector<std::string> &words)
> - {
> --  if (words[0] =3D=3D u8"PATHNAME" && words.size () =3D=3D 2)
> -+  if (words[0] =3D=3D (const char *) u8"PATHNAME" && words.size () =3D=
=3D 2)
> -     return Packet (Client::PC_PATHNAME, std::move (words[1]));
> -
> -   return Packet (Client::PC_ERROR, u8"");
> -@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string>
> &words)
> - // OK or ERROR
> - Packet OKResponse (std::vector<std::string> &words)
> - {
> --  if (words[0] =3D=3D u8"OK")
> -+  if (words[0] =3D=3D (const char *) u8"OK")
> -     return Packet (Client::PC_OK);
> -   else
> -     return Packet (Client::PC_ERROR,
> -@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const
> *include, Flags flags, size_t ilen)
> - // PATHNAME $cmifile
> - Packet IncludeTranslateResponse (std::vector<std::string> &words)
> - {
> --  if (words[0] =3D=3D u8"BOOL" && words.size () =3D=3D 2)
> -+  if (words[0] =3D=3D (const char *) u8"BOOL" && words.size () =3D=3D 2=
)
> -     {
> --      if (words[1] =3D=3D u8"FALSE")
> --      return Packet (Client::PC_BOOL, 0);
> --      else if (words[1] =3D=3D u8"TRUE")
> -+      if (words[1] =3D=3D (const char *) u8"FALSE")
> -+      return Packet (Client::PC_BOOL);
> -+      else if (words[1] =3D=3D (const char *) u8"TRUE")
> -       return Packet (Client::PC_BOOL, 1);
> -       else
> -       return Packet (Client::PC_ERROR, u8"");
> -diff --git a/libcody/cody.hh b/libcody/cody.hh
> -index 789ce9e70b75..93bce93aa94d 100644
> ---- a/libcody/cody.hh
> -+++ b/libcody/cody.hh
> -@@ -47,12 +47,21 @@ namespace Detail  {
> -
> - // C++11 doesn't have utf8 character literals :(
> -
> -+#if __cpp_char8_t >=3D 201811
> -+template<unsigned I>
> -+constexpr char S2C (char8_t const (&s)[I])
> -+{
> -+  static_assert (I =3D=3D 2, "only single octet strings may be converte=
d");
> -+  return s[0];
> -+}
> -+#else
> - template<unsigned I>
> - constexpr char S2C (char const (&s)[I])
> - {
> -   static_assert (I =3D=3D 2, "only single octet strings may be converte=
d");
> -   return s[0];
> - }
> -+#endif
> -
> - /// Internal buffering class.  Used to concatenate outgoing messages
> - /// and Lex incoming ones.
> -@@ -123,6 +132,13 @@ public:
> -       Space ();
> -     Append (str, maybe_quote, len);
> -   }
> -+#if __cpp_char8_t >=3D 201811
> -+  void AppendWord (char8_t const *str, bool maybe_quote =3D false,
> -+                 size_t len =3D ~size_t (0))
> -+  {
> -+    AppendWord ((const char *) str, maybe_quote, len);
> -+  }
> -+#endif
> -   /// Add a word as with AppendWord
> -   /// @param str the string to append
> -   /// @param maybe_quote string might need quoting, as for Append
> -@@ -264,6 +280,12 @@ public:
> -     : string (s), cat (STRING), code (c)
> -   {
> -   }
> -+#if __cpp_char8_t >=3D 201811
> -+  Packet (unsigned c, const char8_t *s)
> -+    : string ((const char *) s), cat (STRING), code (c)
> -+  {
> -+  }
> -+#endif
> -   Packet (unsigned c, std::vector<std::string> &&v)
> -     : vector (std::move (v)), cat (VECTOR), code (c)
> -   {
> -diff --git a/libcody/server.cc b/libcody/server.cc
> -index e2fa069bb933..c18469fae843 100644
> ---- a/libcody/server.cc
> -+++ b/libcody/server.cc
> -@@ -36,12 +36,12 @@ static RequestPair
> -   const requestTable[Detail::RC_HWM] =3D
> -   {
> -     // Same order as enum RequestCode
> --    RequestPair {u8"HELLO", nullptr},
> --    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
> --    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
> --    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
> --    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
> --    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
> -+    RequestPair {(const char *) u8"HELLO", nullptr},
> -+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
> -+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest}=
,
> -+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest}=
,
> -+    RequestPair {(const char *) u8"MODULE-COMPILED",
> ModuleCompiledRequest},
> -+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE",
> IncludeTranslateRequest},
> -   };
> - }
> -
> -@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
> -         std::string msg;
> -
> -         if (err > 0)
> --          msg =3D u8"error processing '";
> -+          msg =3D (const char *) u8"error processing '";
> -         else if (ix >=3D Detail::RC_HWM)
> --          msg =3D u8"unrecognized '";
> -+          msg =3D (const char *) u8"unrecognized '";
> -         else if (IsConnected () && ix =3D=3D Detail::RC_CONNECT)
> --          msg =3D u8"already connected '";
> -+          msg =3D (const char *) u8"already connected '";
> -         else if (!IsConnected () && ix !=3D Detail::RC_CONNECT)
> --          msg =3D u8"not connected '";
> -+          msg =3D (const char *) u8"not connected '";
> -         else
> --          msg =3D u8"malformed '";
> -+          msg =3D (const char *) u8"malformed '";
> -
> -         read.LexedLine (msg);
> --        msg.append (u8"'");
> -+        msg.append ((const char *) u8"'");
> -         if (err > 0)
> -           {
> --            msg.append (u8" ");
> -+            msg.append ((const char *) u8" ");
> -             msg.append (strerror (err));
> -           }
> -         resolver->ErrorResponse (this, std::move (msg));
> -@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
> -     return nullptr;
> -
> -   if (words.size () =3D=3D 3)
> --    words.emplace_back (u8"");
> -+    words.emplace_back ((const char *) u8"");
> -   unsigned version =3D ParseUnsigned (words[1]);
> -   if (version =3D=3D ~0u)
> -     return nullptr;
> diff --git a/meta/recipes-devtools/gcc/gcc_15.2.bb
> b/meta/recipes-devtools/gcc/gcc_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_15.2.bb
> rename to meta/recipes-devtools/gcc/gcc_16.1.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
> b/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb
> b/meta/recipes-devtools/gcc/libgcc_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_15.2.bb
> rename to meta/recipes-devtools/gcc/libgcc_16.1.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_15.2.bb
> b/meta/recipes-devtools/gcc/libgfortran_16.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_15.2.bb
> rename to meta/recipes-devtools/gcc/libgfortran_16.1.bb
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237662):
> https://lists.openembedded.org/g/openembedded-core/message/237662
> Mute This Topic: https://lists.openembedded.org/mt/119512432/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006c265c0652ce62fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This patchset looks good to me</div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, May 27, 2026, 3:35=E2=80=AFPM Hemanth Kumar M D via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;Hemanth.KumarMD=3D<a h=
ref=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">From: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@=
windriver.com" target=3D"_blank" rel=3D"noreferrer">Hemanth.KumarMD@windriv=
er.com</a>&gt;<br>
<br>
Notable changes in GCC 16 include:<br>
- Improved C23/C++23 support and initial C++26 features<br>
- Enhanced diagnostics and static analyzer improvements<br>
- Optimizer and code generation enhancements<br>
- Target-specific updates for AArch64, RISC-V, x86, and others<br>
- Runtime library updates (libstdc++, libatomic, libgomp, libsanitizer)<br>
- Multiple bug fixes and performance improvements<br>
<br>
* Rebased existing OE-Core patches for GCC 16.1 and dropped<br>
patches merged upstream.<br>
<br>
For detailed info: <a href=3D"https://gcc.gnu.org/gcc-16/changes.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://gcc.gnu.org/gcc-16/cha=
nges.html</a><br>
<br>
Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@wind=
river.com" target=3D"_blank" rel=3D"noreferrer">Hemanth.KumarMD@windriver.c=
om</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../gcc/{gcc-15.2.inc =3D&gt; gcc-16.1.inc}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 17 +-<br>
=C2=A0...<a href=3D"http://ian_15.2.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">ian_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_1=
6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross-canadian_=
16.1.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0.../{<a href=3D"http://gcc-cross_15.2.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">gcc-cross_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-cr=
oss_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross_16.1=
.bb</a>}=C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0...-<a href=3D"http://crosssdk_15.2.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">crosssdk_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross=
sdk_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-crosssdk_1=
6.1.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://cc-runtime_15.2.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">cc-runtime_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-ru=
ntime_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-runtime_=
16.1.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://itizers_15.2.bb" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">itizers_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-sanitize=
rs_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-sanitizers_=
16.1.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0...{<a href=3D"http://gcc-source_15.2.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">gcc-source_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-s=
ource_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-source_1=
6.1.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...sroot-gcc-version-specific-dirs-with.patch |=C2=A0 =C2=A04 +-<br>
=C2=A0...omic-Do-not-enforce-march-on-aarch64.patch |=C2=A0 18 +-<br>
=C2=A0...025-gcc-testsuite-tweaks-for-mips-OE.patch |=C2=A0 78 +++---<br>
=C2=A0.../gcc/gcc/0026-fix-pr90579-testcases.patch=C2=A0 |=C2=A0 40 ---<br>
=C2=A0.../gcc/gcc/0027-gcc15-pr122394.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 88 ------<br>
=C2=A0...028-fix-gcc-libitm-false-postives-01.patch | 187 -------------<br>
=C2=A0...028-fix-gcc-libitm-false-postives-02.patch | 220 ---------------<b=
r>
=C2=A0...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 -----------------=
-<br>
=C2=A0.../gcc/{<a href=3D"http://gcc_15.2.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">gcc_15.2.bb</a> =3D&gt; <a href=3D"http://gcc_16.1.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">gcc_16.1.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://initial_15.2.bb" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">initial_15.2.bb</a> =3D&gt; <a href=3D"http://libgcc-initi=
al_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgcc-initial_=
16.1.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://libgcc_15.2.bb" rel=3D"noreferrer noreferr=
er" target=3D"_blank">libgcc_15.2.bb</a> =3D&gt; <a href=3D"http://libgcc_1=
6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgcc_16.1.bb</a>}=
=C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://ibgfortran_15.2.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">ibgfortran_15.2.bb</a> =3D&gt; <a href=3D"http://libgfo=
rtran_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgfortran_=
16.1.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A022 files changed, 66 insertions(+), 849 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-15.2.inc =3D&gt; gcc-16.1.inc} =
(88%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-canadia=
n_15.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross-canadi=
an_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_16.1.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">gcc-cross-canadian_16.1.bb</a>} (=
100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross_15.2.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross_15.2.bb</a> =3D=
&gt; <a href=3D"http://gcc-cross_16.1.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">gcc-cross_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk_15.2=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-crosssdk_15.2.bb</=
a> =3D&gt; <a href=3D"http://gcc-crosssdk_16.1.bb" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">gcc-crosssdk_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-runtime_15.2.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-runtime_15.2.bb</a>=
 =3D&gt; <a href=3D"http://gcc-runtime_16.1.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">gcc-runtime_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-sanitizers_15=
.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-sanitizers_15.2.=
bb</a> =3D&gt; <a href=3D"http://gcc-sanitizers_16.1.bb" rel=3D"noreferrer =
noreferrer" target=3D"_blank">gcc-sanitizers_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-source_15.2.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-source_15.2.bb</a> =
=3D&gt; <a href=3D"http://gcc-source_16.1.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">gcc-source_16.1.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-tes=
tcases.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.=
patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-=
false-postives-01.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-=
false-postives-02.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it=
-buildable-by-C-11-to-C-26.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc_15.2.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gcc_15.2.bb</a> =3D&gt; <a hre=
f=3D"http://gcc_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gc=
c_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc-initial_15=
.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgcc-initial_15.2.=
bb</a> =3D&gt; <a href=3D"http://libgcc-initial_16.1.bb" rel=3D"noreferrer =
noreferrer" target=3D"_blank">libgcc-initial_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc_15.2.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">libgcc_15.2.bb</a> =3D&gt; <=
a href=3D"http://libgcc_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">libgcc_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgfortran_15.2.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgfortran_15.2.bb</a>=
 =3D&gt; <a href=3D"http://libgfortran_16.1.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">libgfortran_16.1.bb</a>} (100%)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 24c5a9d712..fdfdec28b5 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -200,7 +200,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TA=
RGET_ARCH} =3D &quot;Khem Raj &lt;r<br>
=C2=A0RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D &quot;Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">r=
aj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-gcc-runtime =3D &quot;Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmai=
l.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-gcc-sanitizers =3D &quot;Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@g=
mail.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-gcc-source-15.2.0 =3D &quot;Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gma=
il.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-gcc-source-16.1.0 =3D &quot;Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gma=
il.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-gcompat =3D &quot;Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.co=
m</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-gconf =3D &quot;Ross Burton &lt;<a href=3D"mailt=
o:ross.burton@arm.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@arm=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-gcr =3D &quot;Unassigned &lt;<a href=3D"mailto:u=
nassigned@yoctoproject.org" target=3D"_blank" rel=3D"noreferrer">unassigned=
@yoctoproject.org</a>&gt;&quot;<br>
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc<br>
index 3c956dfb12..33d3efd845 100644<br>
--- a/meta/conf/distro/include/tcmode-default.inc<br>
+++ b/meta/conf/distro/include/tcmode-default.inc<br>
@@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D &q=
uot;binutils-crosssdk-${SDK_<br>
=C2=A0# Default libc config<br>
=C2=A0PREFERRED_PROVIDER_virtual/gettext ??=3D &quot;gettext&quot;<br>
<br>
-GCCVERSION ?=3D &quot;15.%&quot;<br>
+GCCVERSION ?=3D &quot;16.%&quot;<br>
=C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
=C2=A0GLIBCVERSION ?=3D &quot;2.43%&quot;<br>
=C2=A0RUSTVERSION ?=3D &quot;1.95.0%&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools=
/gcc/gcc-16.1.inc<br>
similarity index 88%<br>
rename from meta/recipes-devtools/gcc/gcc-15.2.inc<br>
rename to meta/recipes-devtools/gcc/gcc-16.1.inc<br>
index a96f2b8411..3a96228631 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc<br>
@@ -2,11 +2,11 @@ require gcc-common.inc<br>
<br>
=C2=A0# Third digit in PV should be incremented after a minor release<br>
<br>
-PV =3D &quot;15.2.0&quot;<br>
+PV =3D &quot;16.1.0&quot;<br>
<br>
=C2=A0# BINV should be incremented to a revision after a minor gcc release<=
br>
<br>
-BINV =3D &quot;15.2.0&quot;<br>
+BINV =3D &quot;16.1.0&quot;<br>
<br>
=C2=A0FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/ba=
ckport:&quot;<br>
<br>
@@ -34,17 +34,17 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0#SRC_URI[sha256sum] =3D &quot;41bf7be5dc029112a9df625266e7de030ffc36f=
f3638f270b180ae8c91fe6449&quot;<br>
<br>
=C2=A0# from snapshot<br>
-#RELEASE ?=3D &quot;15-20250420&quot;<br>
-#RELEASE ?=3D &quot;15.1.0-RC-20250418&quot;<br>
+#RELEASE ?=3D &quot;16-20260502&quot;<br>
+#RELEASE ?=3D &quot;16.1.0-RC-20260424&quot;<br>
=C2=A0#BASEURI ?=3D &quot;<a href=3D"https://gcc.gnu.org/pub/gcc/snapshots/=
$%7BRELEASE%7D/gcc-$%7BRELEASE%7D.tar.xz" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEA=
SE}.tar.xz</a>&quot;<br>
=C2=A0#SOURCEDIR ?=3D &quot;gcc-${RELEASE}&quot;<br>
-#SRC_URI[sha256sum] =3D &quot;fe18624317c6c662977eea8b5a506ec6c132fc11c7a8=
d53e2f6d21b139b0af3c&quot;<br>
+#SRC_URI[sha256sum] =3D &quot;e8edc2aaf0affce7020658b0be9a3fc820aa33dc6106=
40d3fe1ba1aee360051b&quot;<br>
<br>
=C2=A0# official release<br>
=C2=A0RELEASE ?=3D &quot;${PV}&quot;<br>
=C2=A0BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz&quot;=
<br>
=C2=A0SOURCEDIR ?=3D &quot;gcc-${PV}&quot;<br>
-SRC_URI[sha256sum] =3D &quot;438fd996826b0c82485a29da03a72d71d6e3541a83ec7=
02df4271f6fe025d24e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab=
7be05b171d36a510f79&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${BASEURI} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-gcc-4.3.1-ARCH_FLAGS_=
FOR_TARGET.patch \<br>
@@ -72,11 +72,6 @@ SRC_URI =3D &quot;${BASEURI} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-Fix-install-path-of-l=
inux64.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-Avoid-hardcoded-build=
-paths-into-ppc-libgcc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0025-gcc-testsuite-tweaks-=
for-mips-OE.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0026-fix-pr90579-testcases=
.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-gcc15-pr122394.patch =
\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-fix-gcc-libitm-false-=
postives-01.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-fix-gcc-libitm-false-=
postives-02.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-libcody-Make-it-build=
able-by-C-11-to-C-26.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mapper-localhost-migh=
t-not-be-known.patch \<br>
=C2=A0&quot;<br>
<br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian=
_15.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross-canadia=
n_15.2.bb</a> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canad=
ian_16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross-cana=
dian_16.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_=
15.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross-canadian=
_15.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_16=
.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross-canadian_1=
6.1.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_15.2.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross_15.2.bb</a> b/me=
ta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_16.1.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">gcc-cross_16.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_15.2.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross_15.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_16.1.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">gcc-cross_16.1.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_15.2.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-crosssdk_15.2.bb</a=
> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_16.1.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gcc-crosssdk_16.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_15.2.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-crosssdk_15.2.bb</a>=
<br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_16.1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-crosssdk_16.1.bb</a><b=
r>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_15.2.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-runtime_15.2.bb</a> =
b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_16.1.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">gcc-runtime_16.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_15.2.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-runtime_15.2.bb</a><b=
r>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_16.1.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-runtime_16.1.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_15.=
2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-sanitizers_15.2.b=
b</a> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_16.1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-sanitizers_16.1.bb</a>=
<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_15.2=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-sanitizers_15.2.bb=
</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_16.1.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-sanitizers_16.1.bb</=
a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_15.2.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-source_15.2.bb</a> b/=
meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_16.1.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">gcc-source_16.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_15.2.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">gcc-source_15.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_16.1.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">gcc-source_16.1.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER=
-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define=
-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
index 621f8bc41f..07e9e23f3d 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch<br>
@@ -172,7 +172,7 @@ index fbc75a90ad5..38c239940bd 100644<br>
=C2=A0+=C2=A0 SYSTEMLIBS_DIR &quot;ld-linux-loongarch-&quot; ABI_SPEC &quot=
;.so.1&quot;<br>
<br>
=C2=A0 #define MUSL_ABI_SPEC \<br>
-=C2=A0 =C2=A0&quot;%{mabi=3Dlp64d:}&quot; \<br>
+=C2=A0 =C2=A0&quot;%{mabi=3Dilp32d:}&quot; \<br>
=C2=A0@@ -40,7 +40,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not=
 see<br>
<br>
=C2=A0 #undef MUSL_DYNAMIC_LINKER<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-v=
ersion-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search=
-target-sysroot-gcc-version-specific-dirs-with.patch<br>
index a087ba17d9..678457bbc9 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-=
specific-dirs-with.patch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-=
specific-dirs-with.patch<br>
@@ -89,12 +89,12 @@ index 007c91780f6..22eb17bc099 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memcpy (path + len, this_multi, this_multi_len + 1);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memcpy (path + len + this_multi_len, multi_suffix, suffix_len + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
 =3D callback (path, callback_info);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
 =3D callback (path);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (ret)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy (path + len, multi_=
suffix, suffix_len + 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D callback (path, ca=
llback_info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D callback (path);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-ma=
rch-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-=
enforce-march-on-aarch64.patch<br>
index 0f2a9d8c1f..5a8a79c0d2 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-=
aarch64.patch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-=
aarch64.patch<br>
@@ -29,14 +29,14 @@ index 0f1a7156084..255fe448e63 100644<br>
<br>
=C2=A0 endif<br>
=C2=A0diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in<br>
-index 9798e7c09e9..3b3027eb77d 100644<br>
+index 887ae41..b3d5e6f 100644<br>
=C2=A0--- a/libatomic/Makefile.in<br>
=C2=A0+++ b/libatomic/Makefile.in<br>
-@@ -452,7 +452,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE), $(all_c_fi=
les)))<br>
- libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsuffix \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__a=
ppend_2) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__append_3) $(am__append_4)<br>
--@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Darmv=
8-a+lse<br>
- @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Darmv7-a+=
fp -DHAVE_KERNEL64<br>
- @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Di586<br>
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -mcx16 -mcx16<br>
+@@ -470,7 +470,6 @@ libatomic_la_LDFLAGS =3D $(libatomic_version_info) $(l=
ibatomic_version_script) \<br>
+ @PARTIAL_VXWORKS_FALSE@=C2=A0 =C2=A0 =C2=A0 =C2=A0_$(s)_.lo,$(SIZEOBJS)))=
 $(am__append_1) \<br>
+ @PARTIAL_VXWORKS_FALSE@=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__append_2) $(am__a=
ppend_3) \<br>
+ @PARTIAL_VXWORKS_FALSE@=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__append_4) $(am__a=
ppend_5)<br>
+-@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OP=
TIONS =3D -march=3Darmv8-a+lse<br>
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTION=
S =3D -march=3Darmv7-a+fp -DHAVE_KERNEL64<br>
+ @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS =3D=
 -march=3Di586<br>
+ @ARCH_LOONGARCH_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTION=
S =3D -mlsx|-mscq<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mi=
ps-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-m=
ips-OE.patch<br>
index fcdd79a840..dc708942b4 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.p=
atch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.p=
atch<br>
@@ -92,10 +92,10 @@ index 6dd8fa3fce9..95672008219 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;preprocess&quot; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set compile_type &quot;preprocess=
&quot;<br>
=C2=A0diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/li=
b/target-supports.exp<br>
-index c0376b04551..5d053dfe726 100644<br>
+index 55775d0..df161a9 100644<br>
=C2=A0--- a/gcc/testsuite/lib/target-supports.exp<br>
=C2=A0+++ b/gcc/testsuite/lib/target-supports.exp<br>
-@@ -2949,14 +2949,7 @@ proc check_mips_loongson_mmi_hw_available { } {<br>
+@@ -3113,14 +3113,7 @@ proc check_mips_loongson_mmi_hw_available { } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if { !([istarget mips*-*-*]) } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expr 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
@@ -107,11 +107,11 @@ index c0376b04551..5d053dfe726 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } &quot;-mloongson-mmi&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expr 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expr 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 }]<br>
=C2=A0 }<br>
-@@ -2970,29 +2963,7 @@ proc check_mips_msa_hw_available { } {<br>
+@@ -3134,29 +3127,7 @@ proc check_mips_msa_hw_available { } {<br>
=C2=A0 =C2=A0 =C2=A0 if { !([istarget mips*-*-*]) } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expr 0<br>
=C2=A0 =C2=A0 =C2=A0 } else {<br>
@@ -138,38 +138,41 @@ index c0376b04551..5d053dfe726 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 #endif<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 } &quot;-mmsa&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 expr 0<br>
++=C2=A0 =C2=A0 expr 0<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 }]<br>
=C2=A0 }<br>
-@@ -10371,6 +10342,7 @@ proc is-effective-target-keyword { arg } {<br>
+@@ -10740,6 +10711,7 @@ proc is-effective-target-keyword { arg } {<br>
<br>
=C2=A0 proc et-dg-runtest { runtest testcases flags default-extra-flags } {=
<br>
=C2=A0 =C2=A0 =C2=A0 global dg-do-what-default<br>
-+=C2=A0 =C2=A0 global do-what-limit<br>
++=C2=A0 =C2=A0 global do-what-limit <br>
=C2=A0 =C2=A0 =C2=A0 global EFFECTIVE_TARGETS<br>
=C2=A0 =C2=A0 =C2=A0 global et_index<br>
<br>
-@@ -10378,6 +10350,7 @@ proc et-dg-runtest { runtest testcases flags defau=
lt-extra-flags } {<br>
+@@ -10747,16 +10719,19 @@ proc et-dg-runtest { runtest testcases flags def=
ault-extra-flags } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 foreach target $EFFECTIVE_TARGETS {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set target_flags $flags<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default compile<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit link<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set et_index [lsearch -exact $EFF=
ECTIVE_TARGETS $target]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set et_index [lsearch -exact $EFFECTIV=
E_TARGETS $target]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit link<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set et_index [lsearch -exact $E=
FFECTIVE_TARGETS $target]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if { [info procs add_options_for_=
${target}] !=3D [list] } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set target_flags [a=
dd_options_for_${target} &quot;$flags&quot;]<br>
-@@ -10385,8 +10358,10 @@ proc et-dg-runtest { runtest testcases flags defa=
ult-extra-flags } {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if { [info procs check_effective_=
target_${target}_runtime]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=3D [list] &=
amp;&amp; [check_effective_target_${target}_runtime] } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-defa=
ult run<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit run<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit=
 run<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $runtest $testcases $target_flags=
 ${default-extra-flags}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset et_index<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset do-what-limit<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset et_index<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0set et_index 0<br>
-@@ -12172,6 +12147,7 @@ proc check_effective_target_sigsetjmp {} {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$runtest $testcases $flags ${default-extra-flag=
s}<br>
+@@ -12539,6 +12514,7 @@ proc check_effective_target_sigsetjmp {} {<br>
=C2=A0 proc check_vect_support_and_set_flags { } {<br>
=C2=A0 =C2=A0 =C2=A0 global DEFAULT_VECTCFLAGS<br>
=C2=A0 =C2=A0 =C2=A0 global dg-do-what-default<br>
@@ -177,51 +180,62 @@ index c0376b04551..5d053dfe726 100644<br>
=C2=A0 =C2=A0 =C2=A0 global EFFECTIVE_TARGETS<br>
<br>
=C2=A0 =C2=A0 =C2=A0 if [istarget powerpc*-*-*] {<br>
-@@ -12203,6 +12179,7 @@ proc check_vect_support_and_set_flags { } {<br>
+@@ -12570,14 +12546,16 @@ proc check_vect_support_and_set_flags { } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set DEFAULT_VECTCFL=
AGS [linsert $DEFAULT_VECTCFLAGS 0 &quot;-mcpu=3D970&quot;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default compile<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit link<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0set do-what-limit link<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 } elseif { [check_effective_target_x86] } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lappend DEFAULT_VECTCFLAGS &quot;-msse2&quot;<b=
r>
-@@ -12210,6 +12187,7 @@ proc check_vect_support_and_set_flags { } {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if { [check_effective_target_sse2_runtime] } {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default run<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default compile<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit link<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set do-what-limit link=C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 } elseif { [istarget mips*-*-*]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; [check_ef=
fective_target_nomips16] } {<br>
-@@ -12229,6 +12207,7 @@ proc check_vect_support_and_set_flags { } {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if { [check_effective_target_mpaired_single &qu=
ot;-mpaired-single&quot;] } {<br>
+@@ -12596,7 +12574,8 @@ proc check_vect_support_and_set_flags { } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default run<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default compile<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit link<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0set do-what-limit link<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 } elseif [istarget alpha*-*-*] {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Alpha&#39;s vectorization capabilities are ex=
tremely limited.<br>
-@@ -12242,6 +12221,7 @@ proc check_vect_support_and_set_flags { } {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# It&#39;s more effort than its worth disabling=
 all of the tests<br>
+@@ -12609,7 +12588,8 @@ proc check_vect_support_and_set_flags { } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default run<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default compile<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit link<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0set do-what-limit link<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 } elseif [istarget ia64-*-*] {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default run<br>
-@@ -12255,6 +12235,7 @@ proc check_vect_support_and_set_flags { } {<br>
+=C2=A0 =C2=A0 =C2=A0} elseif [is-effective-target arm_neon_ok] {<br>
+@@ -12622,7 +12602,8 @@ proc check_vect_support_and_set_flags { } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default run<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default compile<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit link<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0set do-what-limit link<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 } elseif [istarget aarch64*-*-*] {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default run<br>
-@@ -12279,6 +12260,7 @@ proc check_vect_support_and_set_flags { } {<br>
+=C2=A0 =C2=A0 =C2=A0} elseif [istarget s390*-*-*] {<br>
+@@ -12646,7 +12627,8 @@ proc check_vect_support_and_set_flags { } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lappend DEFAULT_VECTCFLAGS &quot;=
-march=3Dz14&quot; &quot;-mzarch&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default compile<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set do-what-limit link<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0set do-what-limit link<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 } elseif [istarget amdgcn-*-*] {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 set dg-do-what-default run<br>
+=C2=A0 =C2=A0 =C2=A0} elseif [istarget riscv*-*-*] {<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch=
 b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch<br>
deleted file mode 100644<br>
index 6ada61b74f..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 679e24f5a751663998ff7202149a749e0f7251f9 Mon Sep 17 00:00:00 2001<br>
-From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com"=
 target=3D"_blank" rel=3D"noreferrer">Harish.Sadineni@windriver.com</a>&gt;=
<br>
-Date: Sun, 10 Aug 2025 20:28:00 +0800<br>
-Subject: [PATCH] testsuite: i386: Fix gcc.target/i386/pr90579.c when PIE i=
s<br>
- enabled [PR118885]<br>
-<br>
-When gcc build with --enable-deafult-pie the following tests<br>
-were getting failed:<br>
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40<br>
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32<br>
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24<br>
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16<br>
-<br>
-=C2=A0 =C2=A0 PR target/118885<br>
-<br>
-gcc/testsuite/ChangeLog:<br>
-<br>
-=C2=A0 =C2=A0 * gcc.target/i386/pr90579.c: add -fno-pie to dg-options<br>
-=C2=A0 =C2=A0 to fix tests when PIE is enabled.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/cgit/gcc/commit/=
?id=3D679e24f5a751663998ff7202149a749e0f7251f9" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://gcc.gnu.org/cgit/gcc/commit/?id=3D679e24f5a751=
663998ff7202149a749e0f7251f9</a>]<br>
-<br>
-Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">Harish.Sadineni@windriver.co=
m</a>&gt;<br>
----<br>
- gcc/testsuite/gcc.target/i386/pr90579.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/gcc/testsuite/gcc.target/i386/pr90579.c b/gcc/testsuite/gcc.t=
arget/i386/pr90579.c<br>
-index ab48a44063c..19081ec9fdf 100644<br>
---- a/gcc/testsuite/gcc.target/i386/pr90579.c<br>
-+++ b/gcc/testsuite/gcc.target/i386/pr90579.c<br>
-@@ -1,5 +1,5 @@<br>
- /* { dg-do compile } */<br>
--/* { dg-options &quot;-O3 -mavx2 -mfpmath=3Dsse&quot; } */<br>
-+/* { dg-options &quot;-O3 -mavx2 -mfpmath=3Dsse -fno-pie&quot; } */<br>
- <br>
- extern double r[6];<br>
- extern double a[];<br>
--- <br>
-2.49.0<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch b/meta=
/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch<br>
deleted file mode 100644<br>
index 9ee371cef7..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch<br>
+++ /dev/null<br>
@@ -1,88 +0,0 @@<br>
-From e55dcff97708a4937dc4d8736b8b3074ebbff6f3 Mon Sep 17 00:00:00 2001<br>
-From: Jakub Jelinek &lt;<a href=3D"mailto:jakub@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">jakub@redhat.com</a>&gt;<br>
-Date: Mon, 27 Oct 2025 17:43:17 +0100<br>
-Subject: phiopt: Fix up DEBUG_EXPR_DECL creation in spaceship_replacement<=
br>
- [PR122394]<br>
-<br>
-The following testcase ICEs in gcc 15 (and is at least latent in 12-14 too=
),<br>
-because the DEBUG_EXPR_DECL has incorrect mode.=C2=A0 It has<br>
-TREE_TYPE (orig_use_lhs) type, but TYPE_MODE (type) rather than<br>
-TYPE_MODE (TREE_TYPE (orig_use_lhs)) where the two types are sometimes<br>
-the same, but sometimes different (same if !has_cast_debug_uses, different=
<br>
-otherwise).<br>
-<br>
-Though, there wouldn&#39;t be the this issue if it used the proper API to =
create<br>
-the DEBUG_EXPR_DECL which takes care of everything.=C2=A0 This is the sole=
<br>
-spot that doesn&#39;t use that API.<br>
-<br>
-Doesn&#39;t affect the trunk because the code has been removed and replace=
d with<br>
-different stuff after the libstdc++ ABI change in r16-3474.<br>
-Before r15-5557 the mode has been always wrong because this was done only<=
br>
-for has_cast_debug_uses.=C2=A0 And the bug has been introduced with r12-54=
90.<br>
-<br>
-Enough archeology, while it could be fixed by changing the second<br>
-SET_DECL_MODE argument, I think it is better to use build_debug_expr_decl.=
<br>
-<br>
-2025-10-27=C2=A0 Jakub Jelinek=C2=A0 &lt;<a href=3D"mailto:jakub@redhat.co=
m" target=3D"_blank" rel=3D"noreferrer">jakub@redhat.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR tree-optimization/122394<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* tree-ssa-phiopt.cc (spaceship_replacement): U=
se<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0build_debug_expr_decl instead of manually build=
ing DEBUG_EXPR_DECL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0and getting SET_DECL_MODE wrong.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* g++.dg/opt/pr122394.C: New test.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/cgit/gcc/commit/=
?id=3De55dcff97708a4937dc4d8736b8b3074ebbff6f3" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://gcc.gnu.org/cgit/gcc/commit/?id=3De55dcff97708=
a4937dc4d8736b8b3074ebbff6f3</a>]<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank" rel=3D"noreferrer">hongxu.jia@windriver.com</a>&gt;<br>
----<br>
- gcc/testsuite/g++.dg/opt/pr122394.C | 20 ++++++++++++++++++++<br>
- gcc/tree-ssa-phiopt.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 ++----<br>
- 2 files changed, 22 insertions(+), 4 deletions(-)<br>
- create mode 100644 gcc/testsuite/g++.dg/opt/pr122394.C<br>
-<br>
-diff --git a/gcc/testsuite/g++.dg/opt/pr122394.C b/gcc/testsuite/g++.dg/op=
t/pr122394.C<br>
-new file mode 100644<br>
-index 000000000000..1f84bebd74c2<br>
---- /dev/null<br>
-+++ b/gcc/testsuite/g++.dg/opt/pr122394.C<br>
-@@ -0,0 +1,20 @@<br>
-+// PR tree-optimization/122394<br>
-+// { dg-do compile { target c++23 } }<br>
-+// { dg-options &quot;-O1 -g&quot; }<br>
-+<br>
-+#include &lt;compare&gt;<br>
-+<br>
-+struct A {<br>
-+=C2=A0 friend auto operator&lt;=3D&gt; (A, A) =3D default;<br>
-+=C2=A0 double a;<br>
-+};<br>
-+void foo ();<br>
-+A b, c;<br>
-+<br>
-+void<br>
-+bar ()<br>
-+{<br>
-+=C2=A0 bool d =3D c &gt;=3D b;<br>
-+=C2=A0 if (d)<br>
-+=C2=A0 =C2=A0 foo ();<br>
-+}<br>
-diff --git a/gcc/tree-ssa-phiopt.cc b/gcc/tree-ssa-phiopt.cc<br>
-index aaebae6b38c0..3e0ad9d3bb09 100644<br>
---- a/gcc/tree-ssa-phiopt.cc<br>
-+++ b/gcc/tree-ssa-phiopt.cc<br>
-@@ -2995,10 +2995,8 @@ spaceship_replacement (basic_block cond_bb, basic_b=
lock middle_bb,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (has_cast_debug_uses<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (HONOR_NA=
NS (TREE_TYPE (lhs1)) &amp;&amp; !is_cast))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tree temp3 =3D ma=
ke_node (DEBUG_EXPR_DECL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DECL_ARTIFICIAL (=
temp3) =3D 1;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TREE_TYPE (temp3)=
 =3D TREE_TYPE (orig_use_lhs);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SET_DECL_MODE (te=
mp3, TYPE_MODE (type));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tree temp3<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D build_=
debug_expr_decl (TREE_TYPE (orig_use_lhs));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (has_cast=
_debug_uses)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D=
 fold_convert (TREE_TYPE (temp3), temp2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
--- <br>
-cgit <br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postiv=
es-01.patch b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-posti=
ves-01.patch<br>
deleted file mode 100644<br>
index d8ed99adb5..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-01.p=
atch<br>
+++ /dev/null<br>
@@ -1,187 +0,0 @@<br>
-From b129ff0880c6d10e0379b46889d01255ee8d1f82 Mon Sep 17 00:00:00 2001<br>
-From: Pietro Monteiro &lt;<a href=3D"mailto:pietro@sociotechnical.xyz" tar=
get=3D"_blank" rel=3D"noreferrer">pietro@sociotechnical.xyz</a>&gt;<br>
-Date: Fri, 30 Jan 2026 20:22:49 -0500<br>
-Subject: libitm: testsuite: don&#39;t include libstdc++ paths in test name=
s<br>
- [PR69018]<br>
-<br>
-Libitm C++ tests pass -B/full/path/to/build/libstc++/src/.libs on the<br>
-options argument to dg-runtest and the libstdc++ include paths as<br>
-the default-extra-options.=C2=A0 This causes 2 problems:<br>
-<br>
-1) If a test uses `dg-options&#39; then the libstdc++ include paths are<br=
>
-not passed to the compiler.<br>
-<br>
-2) The `-B/full/path/to/build/libstc++/src/.libs&#39; gets added to the<br=
>
-test name.=C2=A0 This makes comparing build done in different directories<=
br>
-harder because the hardcoded full path.<br>
-<br>
-Stop passing options and default-extra-options to dg-runtest and move<br>
-dealing with the path-releated flags to libitm_target_compile in<br>
-libitm.exp, where they are added to additional_flags.<br>
-<br>
-Also change the FSF address to the website in the license text.<br>
-<br>
-libitm/ChangeLog:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR libitm/69018<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* testsuite/lib/libitm.exp (libitm_target_compi=
le): Add<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lang_include_flags and `-B${blddir}/${lang_libr=
ary_paths}&#39; to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0additional_flags.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* testsuite/libitm.c++/c++.exp: Set lang_librar=
y_paths and lang_include_flags.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/cgit/gcc/patch/?=
id=3Db129ff0880c6d10e0379b46889d01255ee8d1f82" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://gcc.gnu.org/cgit/gcc/patch/?id=3Db129ff0880c6d1=
0e0379b46889d01255ee8d1f82</a>]<br>
-<br>
-Signed-off-by: Pietro Monteiro &lt;<a href=3D"mailto:pietro@sociotechnical=
.xyz" target=3D"_blank" rel=3D"noreferrer">pietro@sociotechnical.xyz</a>&gt=
;<br>
-Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">Harish.Sadineni@windriver.co=
m</a>&gt;<br>
----<br>
- libitm/testsuite/lib/libitm.exp=C2=A0 =C2=A0 =C2=A0| 25 ++++++++++----<br=
>
- libitm/testsuite/libitm.c++/c++.exp | 67 +++++++++++++++++---------------=
-----<br>
- 2 files changed, 48 insertions(+), 44 deletions(-)<br>
-<br>
-diff --git a/libitm/testsuite/lib/libitm.exp b/libitm/testsuite/lib/libitm=
.exp<br>
-index 0b3301537cee..69a49906d338 100644<br>
---- a/libitm/testsuite/lib/libitm.exp<br>
-+++ b/libitm/testsuite/lib/libitm.exp<br>
-@@ -9,8 +9,7 @@<br>
- # GNU General Public License for more details.<br>
- #<br>
- # You should have received a copy of the GNU General Public License<br>
--# along with this program; if not, write to the Free Software<br>
--# Foundation, Inc., <a href=3D"https://www.google.com/maps/search/51+Fran=
klin+Street?entry=3Dgmail&amp;source=3Dg">51 Franklin Street</a>, Fifth Flo=
or, Boston, MA 02110-1301, USA.<br>
-+# along with this program; if not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
- <br>
- # Damn dejagnu for not having proper library search paths for load_lib.<b=
r>
- # We have to explicitly load everything that gcc-dg.exp wants to load.<br=
>
-@@ -193,14 +192,24 @@ proc libitm_target_compile { source dest type option=
s } {<br>
-=C2=A0 =C2=A0 =C2=A0global gluefile wrap_flags<br>
-=C2=A0 =C2=A0 =C2=A0global ALWAYS_CFLAGS<br>
-=C2=A0 =C2=A0 =C2=A0global GCC_UNDER_TEST<br>
--=C2=A0 =C2=A0 global lang_test_file<br>
--=C2=A0 =C2=A0 global lang_library_path<br>
-+=C2=A0 =C2=A0 global lang_library_paths<br>
-=C2=A0 =C2=A0 =C2=A0global lang_link_flags<br>
-+=C2=A0 =C2=A0 global lang_include_flags<br>
- <br>
--=C2=A0 =C2=A0 if { [info exists lang_test_file] } {<br>
--=C2=A0 =C2=A0 =C2=A0 if { $blddir !=3D &quot;&quot; } {<br>
-+=C2=A0 =C2=A0 if { [info exists lang_include_flags] } {<br>
-+=C2=A0 =C2=A0 =C2=A0 lappend options &quot;additional_flags=3D${lang_incl=
ude_flags}&quot;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 if { [info exists lang_library_paths] } {<br>
-+=C2=A0 =C2=A0 =C2=A0 foreach lang_library_path $lang_library_paths {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # targets that use lib[...].a%s in the=
ir specs need a -B option<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # for uninstalled testing.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lappend options &quot;additional_flags=
=3D-B${blddir}/${lang_library_path}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lappend options &quot;ldflags=3D-=
L${blddir}/${lang_library_path}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 if { [info exists lang_link_flags] } {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lappend options &quot;ldflags=3D${lang_link_fla=
gs}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-@@ -219,7 +228,9 @@ proc libitm_target_compile { source dest type options =
} {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0set options [concat &quot;$ALWAYS_CFLAGS&quot; =
$options]<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 set options [dg-additional-files-options $options $source $=
dest $type]<br>
-+=C2=A0 =C2=A0 if { $source !=3D &quot;&quot; } {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set options [dg-additional-files-options $opt=
ions $source $dest $type]<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0set result [target_compile $source $dest $type $option=
s]<br>
- <br>
-diff --git a/libitm/testsuite/libitm.c++/c++.exp b/libitm/testsuite/libitm=
.c++/c++.exp<br>
-index a1ce7ce4062e..90f3058e7249 100644<br>
---- a/libitm/testsuite/libitm.c++/c++.exp<br>
-+++ b/libitm/testsuite/libitm.c++/c++.exp<br>
-@@ -11,8 +11,7 @@<br>
- # GNU General Public License for more details.<br>
- #<br>
- # You should have received a copy of the GNU General Public License<br>
--# along with this program; if not, write to the Free Software<br>
--# Foundation, Inc., <a href=3D"https://www.google.com/maps/search/51+Fran=
klin+Street?entry=3Dgmail&amp;source=3Dg">51 Franklin Street</a>, Fifth Flo=
or, Boston, MA 02110-1301, USA.<br>
-+# along with this program; if not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
- <br>
- load_lib libitm-dg.exp<br>
- load_gcc_lib gcc-dg.exp<br>
-@@ -33,48 +32,42 @@ set blddir [lookfor_file [get_multilibs] libitm]<br>
- <br>
- <br>
- if { $blddir !=3D &quot;&quot; } {<br>
--=C2=A0 =C2=A0 # Look for a static libstdc++ first.<br>
--=C2=A0 =C2=A0 if [file exists &quot;${blddir}/${lang_library_path}/libstd=
c++.a&quot;] {<br>
--=C2=A0 =C2=A0 =C2=A0 set lang_test_file &quot;${lang_library_path}/libstd=
c++.a&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 set lang_test_file_found 1<br>
--=C2=A0 =C2=A0 =C2=A0 # We may have a shared only build, so look for a sha=
red libstdc++.<br>
--=C2=A0 =C2=A0 } elseif [file exists &quot;${blddir}/${lang_library_path}/=
libstdc++.${shlib_ext}&quot;] {<br>
--=C2=A0 =C2=A0 =C2=A0 set lang_test_file &quot;${lang_library_path}/libstd=
c++.${shlib_ext}&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 set lang_test_file_found 1<br>
--=C2=A0 =C2=A0 } else {<br>
--=C2=A0 =C2=A0 =C2=A0 puts &quot;No libstdc++ library found, will not exec=
ute c++ tests&quot;<br>
-+=C2=A0 =C2=A0 if { ![file exists &quot;${blddir}/${lang_library_path}/lib=
stdc++.a&quot;]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ![file exists &quot;${blddir}/${lan=
g_library_path}/libstdc++.${shlib_ext}&quot;] } {<br>
-+=C2=A0 =C2=A0 =C2=A0 verbose -log &quot;No libstdc++ library found, will =
not execute c++ tests&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 unset lang_library_path<br>
-+=C2=A0 =C2=A0 =C2=A0 return<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--} elseif { [info exists GXX_UNDER_TEST] } {<br>
--=C2=A0 =C2=A0 set lang_test_file_found 1<br>
--=C2=A0 =C2=A0 # Needs to exist for libitm.exp.<br>
--=C2=A0 =C2=A0 set lang_test_file &quot;&quot;<br>
-+=C2=A0 =C2=A0 lappend lang_library_paths ${lang_library_path}<br>
-+} elseif { ![info exists GXX_UNDER_TEST] } {<br>
-+=C2=A0 =C2=A0 verbose -log &quot;GXX_UNDER_TEST not defined, will not exe=
cute c++ tests&quot;<br>
-+=C2=A0 =C2=A0 return<br>
-+}<br>
-+<br>
-+# Gather a list of all tests.<br>
-+set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]<br>
-+<br>
-+if { $blddir !=3D &quot;&quot; } {<br>
-+=C2=A0 =C2=A0 set ld_library_path &quot;$always_ld_library_path:${blddir}=
/${lang_library_path}&quot;<br>
- } else {<br>
--=C2=A0 =C2=A0 puts &quot;GXX_UNDER_TEST not defined, will not execute c++=
 tests&quot;<br>
-+=C2=A0 =C2=A0 set ld_library_path &quot;$always_ld_library_path&quot;<br>
- }<br>
- <br>
--if { $lang_test_file_found } {<br>
--=C2=A0 =C2=A0 # Gather a list of all tests.<br>
--=C2=A0 =C2=A0 set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]<br=
>
-+append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TEST]<br=
>
-+set_ld_library_path_env_vars<br>
- <br>
--=C2=A0 =C2=A0 set stdcxxadder &quot;&quot;<br>
--=C2=A0 =C2=A0 if { $blddir !=3D &quot;&quot; } {<br>
--=C2=A0 =C2=A0 =C2=A0 set ld_library_path &quot;$always_ld_library_path:${=
blddir}/${lang_library_path}&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 set stdcxxadder &quot;-B ${blddir}/${lang_library_pa=
th}&quot;<br>
--=C2=A0 =C2=A0 } else {<br>
--=C2=A0 =C2=A0 =C2=A0 set ld_library_path &quot;$always_ld_library_path&qu=
ot;<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 append ld_library_path [gcc-set-multilib-library-path $GCC_=
UNDER_TEST]<br>
--=C2=A0 =C2=A0 set_ld_library_path_env_vars<br>
-+set flags_file &quot;${blddir}/../libstdc++-v3/scripts/testsuite_flags&qu=
ot;<br>
-+if { [file exists $flags_file] } {<br>
-+=C2=A0 =C2=A0 set lang_include_flags [exec sh $flags_file --build-include=
s]<br>
-+}<br>
- <br>
--=C2=A0 =C2=A0 set flags_file &quot;${blddir}/../libstdc++-v3/scripts/test=
suite_flags&quot;<br>
--=C2=A0 =C2=A0 if { [file exists $flags_file] } {<br>
--=C2=A0 =C2=A0 =C2=A0 set libstdcxx_includes [exec sh $flags_file --build-=
includes]<br>
--=C2=A0 =C2=A0 } else {<br>
--=C2=A0 =C2=A0 =C2=A0 set libstdcxx_includes &quot;&quot;<br>
--=C2=A0 =C2=A0 }<br>
-+# Main loop.<br>
-+dg-runtest $tests &quot;&quot; &quot;&quot;<br>
- <br>
--=C2=A0 =C2=A0 # Main loop.<br>
--=C2=A0 =C2=A0 dg-runtest $tests $stdcxxadder $libstdcxx_includes<br>
-+if { $blddir !=3D &quot;&quot; } {<br>
-+=C2=A0 =C2=A0 unset lang_include_flags<br>
-+=C2=A0 =C2=A0 unset lang_library_path<br>
-+=C2=A0 =C2=A0 unset lang_library_paths<br>
- }<br>
- <br>
- # All done.<br>
--- <br>
-cgit <br>
diff --git a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postiv=
es-02.patch b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-posti=
ves-02.patch<br>
deleted file mode 100644<br>
index 67ed47ff51..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-02.p=
atch<br>
+++ /dev/null<br>
@@ -1,220 +0,0 @@<br>
-From 66ce317036f2eb5aeb96d5e4b9e468799d7566b6 Mon Sep 17 00:00:00 2001<br>
-From: Pietro Monteiro &lt;<a href=3D"mailto:pietro@sociotechnical.xyz" tar=
get=3D"_blank" rel=3D"noreferrer">pietro@sociotechnical.xyz</a>&gt;<br>
-Date: Wed, 11 Feb 2026 11:55:13 -0500<br>
-Subject: libitm: Fix recent libitm testsuite regression [PR69018]<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-The commit r16-7202-gb129ff0880c6d1 broke running libitm=E2=80=99s testsui=
te<br>
-using combinations of options because it didn=E2=80=99t clean up all the<b=
r>
-global variables set in c++.exp.=C2=A0 Fix the regression by using g++ for=
<br>
-the C++ tests and cleaning up the variables shared between C and C++<br>
-tests.<br>
-<br>
-libitm/ChangeLog:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR libitm/69018<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* testsuite/lib/libitm.exp (libitm_init): Check=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GXX_UNDER_TEST.=C2=A0 Add &quot;${blddir}/.libs=
&quot; to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0always_ld_library_path if blddir is not empty.=
=C2=A0 Use<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-fdiagnostics-plain-output&quot;.=C2=A0 D=
on&#39;t set compiler to GCC_UNDER_TEST.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* testsuite/libitm.c++/c++.exp: If $blddir is n=
ot empty set<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libstdc++_library_path, shlib_ext, lang_include=
_flags, add<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${blddir}/${lang_library_paths}&quot; to =
ld_library_path.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Unset libstdc++_library_path and shlib_ext if w=
e skip C++<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tests and at the end of the test run.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* testsuite/libitm.c/c.exp: Update the FSF addr=
ess to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0website in the license text. Unset lang_library=
_paths and<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lang_include_flags.=C2=A0 Set the compiler to $=
GCC_UNDER_TEST.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/cgit/gcc/patch/?=
id=3D66ce317036f2eb5aeb96d5e4b9e468799d7566b6" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://gcc.gnu.org/cgit/gcc/patch/?id=3D66ce317036f2eb=
5aeb96d5e4b9e468799d7566b6</a>]<br>
-<br>
-Co-authored-by: Jakub Jelinek=C2=A0 &lt;<a href=3D"mailto:jakub@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">jakub@redhat.com</a>&gt;<br>
-Signed-off-by: Pietro Monteiro &lt;<a href=3D"mailto:pietro@sociotechnical=
.xyz" target=3D"_blank" rel=3D"noreferrer">pietro@sociotechnical.xyz</a>&gt=
;<br>
-Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">Harish.Sadineni@windriver.co=
m</a>&gt;<br>
----<br>
- libitm/testsuite/lib/libitm.exp=C2=A0 =C2=A0 =C2=A0| 21 +++++++++++++++--=
--<br>
- libitm/testsuite/libitm.c++/c++.exp | 42 ++++++++++++++------------------=
-----<br>
- libitm/testsuite/libitm.c/c.exp=C2=A0 =C2=A0 =C2=A0| 14 ++++++-------<br>
- 3 files changed, 40 insertions(+), 37 deletions(-)<br>
-<br>
-diff --git a/libitm/testsuite/lib/libitm.exp b/libitm/testsuite/lib/libitm=
.exp<br>
-index 69a49906d338..2de0f6cbf158 100644<br>
---- a/libitm/testsuite/lib/libitm.exp<br>
-+++ b/libitm/testsuite/lib/libitm.exp<br>
-@@ -79,7 +79,7 @@ proc libitm_init { args } {<br>
-=C2=A0 =C2=A0 =C2=A0global ALWAYS_CFLAGS<br>
-=C2=A0 =C2=A0 =C2=A0global CFLAGS<br>
-=C2=A0 =C2=A0 =C2=A0global TOOL_EXECUTABLE TOOL_OPTIONS<br>
--=C2=A0 =C2=A0 global GCC_UNDER_TEST<br>
-+=C2=A0 =C2=A0 global GCC_UNDER_TEST GXX_UNDER_TEST<br>
-=C2=A0 =C2=A0 =C2=A0global TESTING_IN_BUILD_TREE<br>
-=C2=A0 =C2=A0 =C2=A0global target_triplet<br>
-=C2=A0 =C2=A0 =C2=A0global always_ld_library_path<br>
-@@ -97,6 +97,17 @@ proc libitm_init { args } {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set GCC_UNDER_TEST &quot;[find_gc=
c]&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 # Only if we&#39;re guessing &#39;GCC_UNDER_TEST&#39=
;, we&#39;re also going to guess<br>
-+=C2=A0 =C2=A0 =C2=A0 # &#39;GXX_UNDER_TEST&#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 if ![info exists GXX_UNDER_TEST] then {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [info exists TOOL_EXECUTABLE] {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set GXX_UNDER_TEST $TOOL=
_EXECUTABLE<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set GXX_UNDER_TEST &quot=
;[find_g++]&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error &quot;GXX_UNDER_TEST set but not=
 GCC_UNDER_TEST&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if ![info exists tmpdir] {<br>
-@@ -119,7 +130,7 @@ proc libitm_init { args } {<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0# Compute what needs to be put into LD_LIBRARY_PATH<br=
>
--=C2=A0 =C2=A0 set always_ld_library_path &quot;.:${blddir}/.libs&quot;<br=
>
-+=C2=A0 =C2=A0 set always_ld_library_path &quot;.&quot;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0# Compute what needs to be added to the existing LD_LI=
BRARY_PATH.<br>
-=C2=A0 =C2=A0 =C2=A0if {$gccdir !=3D &quot;&quot;} {<br>
-@@ -150,6 +161,8 @@ proc libitm_init { args } {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lappend ALWAYS_CFLAGS &quot;additional_flags=3D=
-B${blddir}/&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lappend ALWAYS_CFLAGS &quot;additional_flags=3D=
-I${blddir}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lappend ALWAYS_CFLAGS &quot;ldflags=3D-L${blddi=
r}/.libs&quot;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 append always_ld_library_path &quot;:${blddir}/.libs=
&quot;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0lappend ALWAYS_CFLAGS &quot;additional_flags=3D-I${src=
dir}/..&quot;<br>
- <br>
-@@ -179,7 +192,8 @@ proc libitm_init { args } {<br>
-=C2=A0 =C2=A0 =C2=A0# Turn on transactional memory support.<br>
-=C2=A0 =C2=A0 =C2=A0lappend ALWAYS_CFLAGS &quot;additional_flags=3D-fgnu-t=
m&quot;<br>
- <br>
--=C2=A0 =C2=A0 lappend ALWAYS_CFLAGS &quot;additional_flags=3D-fdiagnostic=
s-color=3Dnever&quot;<br>
-+=C2=A0 =C2=A0 # Disable caret, color, URL diagnostics<br>
-+=C2=A0 =C2=A0 lappend ALWAYS_CFLAGS &quot;additional_flags=3D-fdiagnostic=
s-plain-output&quot;<br>
- }<br>
- <br>
- #<br>
-@@ -220,7 +234,6 @@ proc libitm_target_compile { source dest type options =
} {<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0lappend options &quot;additional_flags=3D[libio_includ=
e_flags]&quot;<br>
-=C2=A0 =C2=A0 =C2=A0lappend options &quot;timeout=3D[timeout_value]&quot;<=
br>
--=C2=A0 =C2=A0 lappend options &quot;compiler=3D$GCC_UNDER_TEST&quot;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0set options [concat $libitm_compile_options $options]<=
br>
- <br>
-diff --git a/libitm/testsuite/libitm.c++/c++.exp b/libitm/testsuite/libitm=
.c++/c++.exp<br>
-index 90f3058e7249..c24dc830bcc5 100644<br>
---- a/libitm/testsuite/libitm.c++/c++.exp<br>
-+++ b/libitm/testsuite/libitm.c++/c++.exp<br>
-@@ -16,39 +16,33 @@<br>
- load_lib libitm-dg.exp<br>
- load_gcc_lib gcc-dg.exp<br>
- <br>
--global shlib_ext<br>
--<br>
--set shlib_ext [get_shlib_extension]<br>
--# The C++ tests should be linked with g++, which defaults to -shared-libg=
cc.<br>
--# Doing that is currently too intrusive, so hardcode here.<br>
--set lang_link_flags &quot;-shared-libgcc -lstdc++&quot;<br>
--set lang_test_file_found 0<br>
--set lang_library_path &quot;../libstdc++-v3/src/.libs&quot;<br>
--<br>
--# Initialize dg.<br>
--dg-init<br>
--<br>
--set blddir [lookfor_file [get_multilibs] libitm]<br>
--<br>
--<br>
- if { $blddir !=3D &quot;&quot; } {<br>
--=C2=A0 =C2=A0 if { ![file exists &quot;${blddir}/${lang_library_path}/lib=
stdc++.a&quot;]<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ![file exists &quot;${blddir}/${lan=
g_library_path}/libstdc++.${shlib_ext}&quot;] } {<br>
-+=C2=A0 =C2=A0 set libstdc++_library_path &quot;../libstdc++-v3/src/.libs&=
quot;<br>
-+=C2=A0 =C2=A0 set shlib_ext [get_shlib_extension]<br>
-+=C2=A0 =C2=A0 if { ![file exists &quot;${blddir}/${libstdc++_library_path=
}/libstdc++.a&quot;]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ![file exists &quot;${blddir}/${lib=
stdc++_library_path}/libstdc++.${shlib_ext}&quot;] } {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0verbose -log &quot;No libstdc++ library found, =
will not execute c++ tests&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 unset lang_library_path<br>
-+=C2=A0 =C2=A0 =C2=A0 unset libstdc++_library_path<br>
-+=C2=A0 =C2=A0 =C2=A0 unset shlib_ext<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 lappend lang_library_paths ${lang_library_path}<br>
-+=C2=A0 =C2=A0 lappend lang_library_paths ${libstdc++_library_path}<br>
- } elseif { ![info exists GXX_UNDER_TEST] } {<br>
-=C2=A0 =C2=A0 =C2=A0verbose -log &quot;GXX_UNDER_TEST not defined, will no=
t execute c++ tests&quot;<br>
-=C2=A0 =C2=A0 =C2=A0return<br>
- }<br>
- <br>
-+lappend ALWAYS_CFLAGS &quot;compiler=3D$GXX_UNDER_TEST&quot;<br>
-+<br>
-+# Initialize dg.<br>
-+dg-init<br>
-+<br>
- # Gather a list of all tests.<br>
- set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]<br>
- <br>
- if { $blddir !=3D &quot;&quot; } {<br>
--=C2=A0 =C2=A0 set ld_library_path &quot;$always_ld_library_path:${blddir}=
/${lang_library_path}&quot;<br>
-+=C2=A0 =C2=A0 set lang_include_flags [exec sh ${blddir}/../libstdc++-v3/s=
cripts/testsuite_flags --build-includes]<br>
-+=C2=A0 =C2=A0 set ld_library_path &quot;$always_ld_library_path:${blddir}=
/${lang_library_paths}&quot;<br>
- } else {<br>
-=C2=A0 =C2=A0 =C2=A0set ld_library_path &quot;$always_ld_library_path&quot=
;<br>
- }<br>
-@@ -56,18 +50,14 @@ if { $blddir !=3D &quot;&quot; } {<br>
- append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TEST]<br=
>
- set_ld_library_path_env_vars<br>
- <br>
--set flags_file &quot;${blddir}/../libstdc++-v3/scripts/testsuite_flags&qu=
ot;<br>
--if { [file exists $flags_file] } {<br>
--=C2=A0 =C2=A0 set lang_include_flags [exec sh $flags_file --build-include=
s]<br>
--}<br>
--<br>
- # Main loop.<br>
- dg-runtest $tests &quot;&quot; &quot;&quot;<br>
- <br>
- if { $blddir !=3D &quot;&quot; } {<br>
-=C2=A0 =C2=A0 =C2=A0unset lang_include_flags<br>
--=C2=A0 =C2=A0 unset lang_library_path<br>
-+=C2=A0 =C2=A0 unset libstdc++_library_path<br>
-=C2=A0 =C2=A0 =C2=A0unset lang_library_paths<br>
-+=C2=A0 =C2=A0 unset shlib_ext<br>
- }<br>
- <br>
- # All done.<br>
-diff --git a/libitm/testsuite/libitm.c/c.exp b/libitm/testsuite/libitm.c/c=
.exp<br>
-index daa71427d64c..7a697b870932 100644<br>
---- a/libitm/testsuite/libitm.c/c.exp<br>
-+++ b/libitm/testsuite/libitm.c/c.exp<br>
-@@ -9,20 +9,20 @@<br>
- # GNU General Public License for more details.<br>
- #<br>
- # You should have received a copy of the GNU General Public License<br>
--# along with this program; if not, write to the Free Software<br>
--# Foundation, Inc., <a href=3D"https://www.google.com/maps/search/51+Fran=
klin+Street?entry=3Dgmail&amp;source=3Dg">51 Franklin Street</a>, Fifth Flo=
or, Boston, MA 02110-1301, USA.<br>
-+# along with this program; if not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
- <br>
--if [info exists lang_library_path] then {<br>
--=C2=A0 =C2=A0 unset lang_library_path<br>
--=C2=A0 =C2=A0 unset lang_link_flags<br>
-+if [info exists lang_library_paths] then {<br>
-+=C2=A0 =C2=A0 unset lang_library_paths<br>
- }<br>
--if [info exists lang_test_file] then {<br>
--=C2=A0 =C2=A0 unset lang_test_file<br>
-+if [info exists lang_include_flags] then {<br>
-+=C2=A0 =C2=A0 unset lang_include_flags<br>
- }<br>
- <br>
- load_lib libitm-dg.exp<br>
- load_gcc_lib gcc-dg.exp<br>
- <br>
-+lappend ALWAYS_CFLAGS &quot;compiler=3D$GCC_UNDER_TEST&quot;<br>
-+<br>
- # If a testcase doesn&#39;t have special options, use these.<br>
- if ![info exists DEFAULT_CFLAGS] then {<br>
-=C2=A0 =C2=A0 =C2=A0set DEFAULT_CFLAGS &quot;-O2&quot;<br>
--- <br>
-cgit <br>
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-b=
y-C-11-to-C-26.patch b/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-b=
uildable-by-C-11-to-C-26.patch<br>
deleted file mode 100644<br>
index 431facb011..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-=
to-C-26.patch<br>
+++ /dev/null<br>
@@ -1,257 +0,0 @@<br>
-From 0ffe3c9af4e5d5468df742512b6e930fe7039230 Mon Sep 17 00:00:00 2001<br>
-From: Jakub Jelinek &lt;<a href=3D"mailto:jakub@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">jakub@redhat.com</a>&gt;<br>
-Date: Fri, 21 Nov 2025 16:25:58 +0100<br>
-Subject: [PATCH] libcody: Make it buildable by C++11 to C++26<br>
-<br>
-The following builds with -std=3Dc++11 and c++14 and c++17 and c++20 and c=
++23<br>
-and c++26.<br>
-<br>
-I see the u8 string literals are mixed e.g. with strerror, so in<br>
--fexec-charset=3DIBM1047 there will still be garbage, so am not 100% sure =
if<br>
-the u8 literals everywhere are worth it either.<br>
-<br>
-2025-11-21=C2=A0 Jakub Jelinek=C2=A0 &lt;<a href=3D"mailto:jakub@redhat.co=
m" target=3D"_blank" rel=3D"noreferrer">jakub@redhat.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* cody.hh (S2C): For __cpp_char8_t &gt;=3D 2018=
11 use char8_t instead of<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char in argument type.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(MessageBuffer::Space): Revert 2025-11-15 chang=
e.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(MessageBuffer::Append): For __cpp_char8_t &gt;=
=3D 201811 add overload<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0with char8_t const * type of first argument.<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(Packet::Packet): Similarly for first argument.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* client.cc (CommunicationError, Client::Proces=
sResponse,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Client::Connect, ConnectResponse, PathnameRespo=
nse, OKResponse,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0IncludeTranslateResponse): Cast u8 string liter=
als to (const char *)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0where needed.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* server.cc (Server::ProcessRequests, ConnectRe=
quest): Likewise.<br>
-<br>
-Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">martin.jansa@gmail.com</a>&gt;<br>
-Upstream-Status: Backport [07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7]<br>
----<br>
- libcody/client.cc | 36 +++++++++++++++++++-----------------<br>
- libcody/cody.hh=C2=A0 =C2=A0| 22 ++++++++++++++++++++++<br>
- libcody/server.cc | 28 ++++++++++++++--------------<br>
- 3 files changed, 55 insertions(+), 31 deletions(-)<br>
-<br>
-diff --git a/libcody/client.cc b/libcody/client.cc<br>
-index ae69d190cb77..147fecdbe500 100644<br>
---- a/libcody/client.cc<br>
-+++ b/libcody/client.cc<br>
-@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()<br>
- <br>
- static Packet CommunicationError (int err)<br>
- {<br>
--=C2=A0 std::string e {u8&quot;communication error:&quot;};<br>
-+=C2=A0 std::string e {(const char *) u8&quot;communication error:&quot;};=
<br>
-=C2=A0 =C2=A0e.append (strerror (err));<br>
- <br>
-=C2=A0 =C2=A0return Packet (Client::PC_ERROR, std::move (e));<br>
-@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector&lt;std::=
string&gt; &amp;words,<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (e =3D=3D EINVAL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::string msg (u8&quot;malformed string &#3=
9;&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::string msg ((const char *) u8&quot;malfo=
rmed string &#39;&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.append (words[0]);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.append (u8&quot;&#39;&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.append ((const char *) u8&quot;&#39;&quot=
;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return Packet (Client::PC_ERROR, std::mo=
ve (msg));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 =C2=A0 return Packet (Client::PC_ERROR, u8&quot;missing res=
ponse&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 return Packet (Client::PC_ERROR, (const char *) u8&q=
uot;missing response&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0Assert (!words.empty ());<br>
--=C2=A0 if (words[0] =3D=3D u8&quot;ERROR&quot;)<br>
-+=C2=A0 if (words[0] =3D=3D (const char *) u8&quot;ERROR&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0return Packet (Client::PC_ERROR,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0words.size =
() =3D=3D 2 ? words[1]: u8&quot;malformed error response&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0words.size =
() =3D=3D 2 ? words[1]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: (const ch=
ar *) u8&quot;malformed error response&quot;);<br>
- <br>
-=C2=A0 =C2=A0if (isLast &amp;&amp; !read.IsAtEnd ())<br>
-=C2=A0 =C2=A0 =C2=A0return Packet (Client::PC_ERROR,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::string=
 (u8&quot;unexpected extra response&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::string=
 ((const char *) u8&quot;unexpected extra response&quot;));<br>
- <br>
-=C2=A0 =C2=A0Assert (code &lt; Detail::RC_HWM);<br>
-=C2=A0 =C2=A0Packet result (responseTable[code] (words));<br>
-=C2=A0 =C2=A0result.SetRequest (code);<br>
-=C2=A0 =C2=A0if (result.GetCode () =3D=3D Client::PC_ERROR &amp;&amp; resu=
lt.GetString ().empty ())<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 std::string msg {u8&quot;malformed response &#39;&qu=
ot;};<br>
-+=C2=A0 =C2=A0 =C2=A0 std::string msg {(const char *) u8&quot;malformed re=
sponse &#39;&quot;};<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0read.LexedLine (msg);<br>
--=C2=A0 =C2=A0 =C2=A0 msg.append (u8&quot;&#39;&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 msg.append ((const char *) u8&quot;&#39;&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0result.GetString () =3D std::move (msg);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0else if (result.GetCode () =3D=3D Client::PC_CONNECT)<br>
-@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const =
*ident,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0size_t alen, size_t ilen)<br>
- {<br>
-=C2=A0 =C2=A0write.BeginLine ();<br>
--=C2=A0 write.AppendWord (u8&quot;HELLO&quot;);<br>
-+=C2=A0 write.AppendWord ((const char *) u8&quot;HELLO&quot;);<br>
-=C2=A0 =C2=A0write.AppendInteger (Version);<br>
-=C2=A0 =C2=A0write.AppendWord (agent, true, alen);<br>
-=C2=A0 =C2=A0write.AppendWord (ident, true, ilen);<br>
-@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const =
*ident,<br>
- // HELLO $version $agent [$flags]<br>
- Packet ConnectResponse (std::vector&lt;std::string&gt; &amp;words)<br>
- {<br>
--=C2=A0 if (words[0] =3D=3D u8&quot;HELLO&quot; &amp;&amp; (words.size () =
=3D=3D 3 || words.size () =3D=3D 4))<br>
-+=C2=A0 if (words[0] =3D=3D (const char *) u8&quot;HELLO&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &amp;&amp; (words.size () =3D=3D 3 || words.size () =
=3D=3D 4))<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *eptr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long val =3D strtoul (words[1].c_str (=
), &amp;eptr, 10);<br>
-@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()<br>
- // PATHNAME $dir | ERROR<br>
- Packet PathnameResponse (std::vector&lt;std::string&gt; &amp;words)<br>
- {<br>
--=C2=A0 if (words[0] =3D=3D u8&quot;PATHNAME&quot; &amp;&amp; words.size (=
) =3D=3D 2)<br>
-+=C2=A0 if (words[0] =3D=3D (const char *) u8&quot;PATHNAME&quot; &amp;&am=
p; words.size () =3D=3D 2)<br>
-=C2=A0 =C2=A0 =C2=A0return Packet (Client::PC_PATHNAME, std::move (words[1=
]));<br>
- <br>
-=C2=A0 =C2=A0return Packet (Client::PC_ERROR, u8&quot;&quot;);<br>
-@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector&lt;std::string&gt=
; &amp;words)<br>
- // OK or ERROR<br>
- Packet OKResponse (std::vector&lt;std::string&gt; &amp;words)<br>
- {<br>
--=C2=A0 if (words[0] =3D=3D u8&quot;OK&quot;)<br>
-+=C2=A0 if (words[0] =3D=3D (const char *) u8&quot;OK&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0return Packet (Client::PC_OK);<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0return Packet (Client::PC_ERROR,<br>
-@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include=
, Flags flags, size_t ilen)<br>
- // PATHNAME $cmifile<br>
- Packet IncludeTranslateResponse (std::vector&lt;std::string&gt; &amp;word=
s)<br>
- {<br>
--=C2=A0 if (words[0] =3D=3D u8&quot;BOOL&quot; &amp;&amp; words.size () =
=3D=3D 2)<br>
-+=C2=A0 if (words[0] =3D=3D (const char *) u8&quot;BOOL&quot; &amp;&amp; w=
ords.size () =3D=3D 2)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 if (words[1] =3D=3D u8&quot;FALSE&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 return Packet (Client::PC_BOOL, 0);<br>
--=C2=A0 =C2=A0 =C2=A0 else if (words[1] =3D=3D u8&quot;TRUE&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (words[1] =3D=3D (const char *) u8&quot;FALSE&quo=
t;)<br>
-+=C2=A0 =C2=A0 =C2=A0 return Packet (Client::PC_BOOL);<br>
-+=C2=A0 =C2=A0 =C2=A0 else if (words[1] =3D=3D (const char *) u8&quot;TRUE=
&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return Packet (Client::PC_BOOL, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return Packet (Client::PC_ERROR, u8&quot;&quot;=
);<br>
-diff --git a/libcody/cody.hh b/libcody/cody.hh<br>
-index 789ce9e70b75..93bce93aa94d 100644<br>
---- a/libcody/cody.hh<br>
-+++ b/libcody/cody.hh<br>
-@@ -47,12 +47,21 @@ namespace Detail=C2=A0 {<br>
- <br>
- // C++11 doesn&#39;t have utf8 character literals :(<br>
- <br>
-+#if __cpp_char8_t &gt;=3D 201811<br>
-+template&lt;unsigned I&gt;<br>
-+constexpr char S2C (char8_t const (&amp;s)[I])<br>
-+{<br>
-+=C2=A0 static_assert (I =3D=3D 2, &quot;only single octet strings may be =
converted&quot;);<br>
-+=C2=A0 return s[0];<br>
-+}<br>
-+#else<br>
- template&lt;unsigned I&gt;<br>
- constexpr char S2C (char const (&amp;s)[I])<br>
- {<br>
-=C2=A0 =C2=A0static_assert (I =3D=3D 2, &quot;only single octet strings ma=
y be converted&quot;);<br>
-=C2=A0 =C2=A0return s[0];<br>
- }<br>
-+#endif<br>
- <br>
- /// Internal buffering class.=C2=A0 Used to concatenate outgoing messages=
<br>
- /// and Lex incoming ones.<br>
-@@ -123,6 +132,13 @@ public:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Space ();<br>
-=C2=A0 =C2=A0 =C2=A0Append (str, maybe_quote, len);<br>
-=C2=A0 =C2=A0}<br>
-+#if __cpp_char8_t &gt;=3D 201811<br>
-+=C2=A0 void AppendWord (char8_t const *str, bool maybe_quote =3D false,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len =
=3D ~size_t (0))<br>
-+=C2=A0 {<br>
-+=C2=A0 =C2=A0 AppendWord ((const char *) str, maybe_quote, len);<br>
-+=C2=A0 }<br>
-+#endif<br>
-=C2=A0 =C2=A0/// Add a word as with AppendWord<br>
-=C2=A0 =C2=A0/// @param str the string to append<br>
-=C2=A0 =C2=A0/// @param maybe_quote string might need quoting, as for Appe=
nd<br>
-@@ -264,6 +280,12 @@ public:<br>
-=C2=A0 =C2=A0 =C2=A0: string (s), cat (STRING), code (c)<br>
-=C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0}<br>
-+#if __cpp_char8_t &gt;=3D 201811<br>
-+=C2=A0 Packet (unsigned c, const char8_t *s)<br>
-+=C2=A0 =C2=A0 : string ((const char *) s), cat (STRING), code (c)<br>
-+=C2=A0 {<br>
-+=C2=A0 }<br>
-+#endif<br>
-=C2=A0 =C2=A0Packet (unsigned c, std::vector&lt;std::string&gt; &amp;&amp;=
v)<br>
-=C2=A0 =C2=A0 =C2=A0: vector (std::move (v)), cat (VECTOR), code (c)<br>
-=C2=A0 =C2=A0{<br>
-diff --git a/libcody/server.cc b/libcody/server.cc<br>
-index e2fa069bb933..c18469fae843 100644<br>
---- a/libcody/server.cc<br>
-+++ b/libcody/server.cc<br>
-@@ -36,12 +36,12 @@ static RequestPair<br>
-=C2=A0 =C2=A0const requestTable[Detail::RC_HWM] =3D<br>
-=C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0// Same order as enum RequestCode<br>
--=C2=A0 =C2=A0 RequestPair {u8&quot;HELLO&quot;, nullptr},<br>
--=C2=A0 =C2=A0 RequestPair {u8&quot;MODULE-REPO&quot;, ModuleRepoRequest},=
<br>
--=C2=A0 =C2=A0 RequestPair {u8&quot;MODULE-EXPORT&quot;, ModuleExportReque=
st},<br>
--=C2=A0 =C2=A0 RequestPair {u8&quot;MODULE-IMPORT&quot;, ModuleImportReque=
st},<br>
--=C2=A0 =C2=A0 RequestPair {u8&quot;MODULE-COMPILED&quot;, ModuleCompiledR=
equest},<br>
--=C2=A0 =C2=A0 RequestPair {u8&quot;INCLUDE-TRANSLATE&quot;, IncludeTransl=
ateRequest},<br>
-+=C2=A0 =C2=A0 RequestPair {(const char *) u8&quot;HELLO&quot;, nullptr},<=
br>
-+=C2=A0 =C2=A0 RequestPair {(const char *) u8&quot;MODULE-REPO&quot;, Modu=
leRepoRequest},<br>
-+=C2=A0 =C2=A0 RequestPair {(const char *) u8&quot;MODULE-EXPORT&quot;, Mo=
duleExportRequest},<br>
-+=C2=A0 =C2=A0 RequestPair {(const char *) u8&quot;MODULE-IMPORT&quot;, Mo=
duleImportRequest},<br>
-+=C2=A0 =C2=A0 RequestPair {(const char *) u8&quot;MODULE-COMPILED&quot;, =
ModuleCompiledRequest},<br>
-+=C2=A0 =C2=A0 RequestPair {(const char *) u8&quot;INCLUDE-TRANSLATE&quot;=
, IncludeTranslateRequest},<br>
-=C2=A0 =C2=A0};<br>
- }<br>
- <br>
-@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::string msg;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &gt; 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D u8&quot;error processing &#39;=
&quot;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D (const char *) u8&quot;error p=
rocessing &#39;&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (ix &gt;=3D Detail::RC_HWM)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D u8&quot;unrecognized &#39;&quo=
t;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D (const char *) u8&quot;unrecog=
nized &#39;&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (IsConnected () &amp;&amp; ix =
=3D=3D Detail::RC_CONNECT)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D u8&quot;already connected &#39=
;&quot;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D (const char *) u8&quot;already=
 connected &#39;&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!IsConnected () &amp;&amp; ix !=
=3D Detail::RC_CONNECT)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D u8&quot;not connected &#39;&qu=
ot;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D (const char *) u8&quot;not con=
nected &#39;&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D u8&quot;malformed &#39;&quot;;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D (const char *) u8&quot;malform=
ed &#39;&quot;;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read.LexedLine (msg);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.append (u8&quot;&#39;&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.append ((const char *) u8&quot;&#39;&quot=
;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &gt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.append (u8&quot; &quot;);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.append ((const char *) u8&q=
uot; &quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.append (strerror (err)=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resolver-&gt;ErrorResponse (this, std::m=
ove (msg));<br>
-@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,<br>
-=C2=A0 =C2=A0 =C2=A0return nullptr;<br>
- <br>
-=C2=A0 =C2=A0if (words.size () =3D=3D 3)<br>
--=C2=A0 =C2=A0 words.emplace_back (u8&quot;&quot;);<br>
-+=C2=A0 =C2=A0 words.emplace_back ((const char *) u8&quot;&quot;);<br>
-=C2=A0 =C2=A0unsigned version =3D ParseUnsigned (words[1]);<br>
-=C2=A0 =C2=A0if (version =3D=3D ~0u)<br>
-=C2=A0 =C2=A0 =C2=A0return nullptr;<br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc_15.2.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gcc_15.2.bb</a> b/meta/recipes=
-devtools/gcc/<a href=3D"http://gcc_16.1.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">gcc_16.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc_15.2.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">gcc_15.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc_16.1.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">gcc_16.1.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_15.=
2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgcc-initial_15.2.b=
b</a> b/meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_16.1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">libgcc-initial_16.1.bb</a>=
<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_15.2=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgcc-initial_15.2.bb=
</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_16.1.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">libgcc-initial_16.1.bb</=
a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc_15.2.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">libgcc_15.2.bb</a> b/meta/rec=
ipes-devtools/gcc/<a href=3D"http://libgcc_16.1.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">libgcc_16.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc_15.2.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libgcc_15.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc_16.1.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libgcc_16.1.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_15.2.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">libgfortran_15.2.bb</a> =
b/meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_16.1.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libgfortran_16.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_15.2.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">libgfortran_15.2.bb</a><b=
r>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_16.1.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">libgfortran_16.1.bb</a><br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237662): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237662" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/237662</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119512432/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119512432/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000006c265c0652ce62fa--

