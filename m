Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B19E77197
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 03:37:48 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.10867.1736307466079041363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 19:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=foi4sBIQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2a8690dcb35so4456010fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 19:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736307465; x=1736912265; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upr4ROYZ9t2dBtwNvabxB3rrdx95ReMjpexjLoHs3+E=;
        b=foi4sBIQItRkKsJJrHyri1OQiqNJziacxRYwZ7CbJk8GUXQLBnyR9vHRQM9yO7QvE2
         jZXimtaTl8HC8vlz6LkDFSy/Cx0Ki4BfPGHwjcgL8Evrcoyuyr5VSv244LlJ9Jvj+Oo6
         m2sy6lVmcosp0K7dfCRkHjUmJLpN59ewVCh+wcfenel2vj2ya/koWLwVOYTctMb5Xmwd
         tiJK3nSYRadaL3G8nfkuNX7Dr33n4pd+6K9UKYjx081/1nshXKLx5hTkovM+UJHoHUq0
         LZto3ZsynvzQLJajgdZKcO+x21sEckPc3BLsCChxzkCw4s05qff0lsKHwtHmyuOYEeYO
         VCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736307465; x=1736912265;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upr4ROYZ9t2dBtwNvabxB3rrdx95ReMjpexjLoHs3+E=;
        b=EK25i3PD61sPJrbwEttzHK2hir+G78k7kKW+9mKFd6S+qXwZUdnfys7Kb6A4S1HBX2
         QPyDhbb0QsMryOJmgPHZI8QX/Qir35mPXLNtHetQB97ylVx95v5K+mmOcwm1UMKEaP2p
         HEIFPRTEp5DU7vwPfYyQhOb70ne31axwzUOaoajfiZATsfm//jermyXzYcFHI8chzHh1
         QHNYbgcPNXKtHMMVbI/wTiZCski11KgAalzAPOe9FS2s2lfPU0FpMdLvUrjVs9573YUJ
         NlJB1c6IFuUnjRl62rZ47tXbSYdpaSNB2tcQTyT2XqMILbNOcO0OApficA9C/ary/5Og
         mquw==
X-Gm-Message-State: AOJu0Yy4PQXVgHfqw3N08zh1yxcGxiHunds3mzrBrH/aTMfTEMn2/bqb
	qJm3Us/SA5wTfQmpOB101s8DsOjrB/f9Hk9FK8/9dg5M4T7UyOD9sKrc1GJlWHxYaow6VoJTsJf
	8veeyvCmKLG1THxaAKrQc0i6Rl7ZyqA==
X-Gm-Gg: ASbGncsMIKDqa9we9C5yCvBAqDZiPHqd+rqgZLTQDBvuE15KPzxO6GHZzKhJlhqTU9M
	ZbhK6mQ50sm22zUB1KEEUl2g+vqio9Vev1I2opJrygVtB1V4gI+Kn
X-Google-Smtp-Source: AGHT+IFri3E6h6ItlT5VQBSeUuQ/twKxwTAhRyb8mOaEpoP2XWDFybddfEeldOXwZrRmvoViWBPMpYrScKroJ+GX2jY=
X-Received: by 2002:a05:6871:7a01:b0:29e:4a6c:4010 with SMTP id
 586e51a60fabf-2aa06647235mr719036fac.6.1736307464830; Tue, 07 Jan 2025
 19:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20250108033627.2889555-1-raj.khem@gmail.com>
In-Reply-To: <20250108033627.2889555-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jan 2025 19:37:18 -0800
X-Gm-Features: AbW1kvaC0DA6FO0lZJiuniQkPzqoYSBAzU9hMMhlIGiwI-VOAvlkiQ3zEt3_uc8
Message-ID: <CAMKF1sqNgixN_hq5HTm8nRX7vVYD40VsXCriMVmujj93rgNOwA@mail.gmail.com>
Subject: Re: [PATCH] glibc: Revert clang float128 patch
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 03:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209511

ignore this one patch please.

On Tue, Jan 7, 2025 at 7:36=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...e-__HAVE_FLOAT128-for-Clang-and-use-.patch | 87 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
>  2 files changed, 88 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-=
__HAVE_FLOAT128-for-Clang-and-use-.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_=
FLOAT128-for-Clang-and-use-.patch b/meta/recipes-core/glibc/glibc/0001-Reve=
rt-x86-Define-__HAVE_FLOAT128-for-Clang-and-use-.patch
> new file mode 100644
> index 00000000000..88823cb95bc
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT12=
8-for-Clang-and-use-.patch
> @@ -0,0 +1,87 @@
> +From b662179d7c679e423b8595e0509253688544a4fd Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 26 Dec 2024 18:59:26 -0800
> +Subject: [PATCH] Revert "x86: Define __HAVE_FLOAT128 for Clang and use
> + __builtin_*f128 code path"
> +
> +This reverts commit d773aff467840f5ed305e40c180466e90bd88183.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + sysdeps/x86/bits/floatn.h | 24 ++++++++----------------
> + 1 file changed, 8 insertions(+), 16 deletions(-)
> +
> +diff --git a/sysdeps/x86/bits/floatn.h b/sysdeps/x86/bits/floatn.h
> +index ba030d270a..e661abaea4 100644
> +--- a/sysdeps/x86/bits/floatn.h
> ++++ b/sysdeps/x86/bits/floatn.h
> +@@ -28,8 +28,7 @@
> +    support, for x86_64 and x86.  */
> + #if (defined __x86_64__                                                =
       \
> +      ? __GNUC_PREREQ (4, 3)                                           \
> +-     : (defined __GNU__ ? __GNUC_PREREQ (4, 5) : __GNUC_PREREQ (4, 4)))=
 \
> +-    || __glibc_clang_prereq (3, 4)
> ++     : (defined __GNU__ ? __GNUC_PREREQ (4, 5) : __GNUC_PREREQ (4, 4)))
> + # define __HAVE_FLOAT128 1
> + #else
> + # define __HAVE_FLOAT128 0
> +@@ -59,9 +58,7 @@
> + /* Defined to concatenate the literal suffix to be used with _Float128
> +    types, if __HAVE_FLOAT128 is 1. */
> + # if __HAVE_FLOAT128
> +-#  if !__GNUC_PREREQ (7, 0) \
> +-      || (defined __cplusplus && !__GNUC_PREREQ (13, 0)) \
> +-      || defined __clang__
> ++#  if !__GNUC_PREREQ (7, 0) || (defined __cplusplus && !__GNUC_PREREQ (=
13, 0))
> + /* The literal suffix f128 exists only since GCC 7.0.  */
> + #   define __f128(x) x##q
> + #  else
> +@@ -71,9 +68,7 @@
> +
> + /* Defined to a complex binary128 type if __HAVE_FLOAT128 is 1.  */
> + # if __HAVE_FLOAT128
> +-#  if !__GNUC_PREREQ (7, 0) \
> +-      || (defined __cplusplus && !__GNUC_PREREQ (13, 0)) \
> +-      || defined __clang__
> ++#  if !__GNUC_PREREQ (7, 0) || (defined __cplusplus && !__GNUC_PREREQ (=
13, 0))
> + /* Add a typedef for older GCC compilers which don't natively support
> +    _Complex _Float128.  */
> + typedef _Complex float __cfloat128 __attribute__ ((__mode__ (__TC__)));
> +@@ -87,14 +82,12 @@ typedef _Complex float __cfloat128 __attribute__ ((_=
_mode__ (__TC__)));
> + # if __HAVE_FLOAT128
> +
> + /* The type _Float128 exists only since GCC 7.0.  */
> +-#  if !__GNUC_PREREQ (7, 0) \
> +-      || (defined __cplusplus && !__GNUC_PREREQ (13, 0)) \
> +-      || __glibc_clang_prereq (3, 4)
> ++#  if !__GNUC_PREREQ (7, 0) || (defined __cplusplus && !__GNUC_PREREQ (=
13, 0))
> + typedef __float128 _Float128;
> + #  endif
> +
> +-/* __builtin_huge_valf128 doesn't exist before GCC 7.0 nor Clang 7.0.  =
*/
> +-#  if !__GNUC_PREREQ (7, 0) && !__glibc_clang_prereq (7, 0)
> ++/* __builtin_huge_valf128 doesn't exist before GCC 7.0.  */
> ++#  if !__GNUC_PREREQ (7, 0)
> + #   define __builtin_huge_valf128() ((_Float128) __builtin_huge_val ())
> + #  endif
> +
> +@@ -103,7 +96,7 @@ typedef __float128 _Float128;
> +    Converting a narrower sNaN to _Float128 produces a quiet NaN, so
> +    attempts to use _Float128 sNaNs will not work properly with older
> +    compilers.  */
> +-#  if !__GNUC_PREREQ (7, 0) && !defined __clang__
> ++#  if !__GNUC_PREREQ (7, 0)
> + #   define __builtin_copysignf128 __builtin_copysignq
> + #   define __builtin_fabsf128 __builtin_fabsq
> + #   define __builtin_inff128() ((_Float128) __builtin_inf ())
> +@@ -114,8 +107,7 @@ typedef __float128 _Float128;
> + /* In math/math.h, __MATH_TG will expand signbit to __builtin_signbit*,
> +    e.g.: __builtin_signbitf128, before GCC 6.  However, there has never
> +    been a __builtin_signbitf128 in GCC and the type-generic builtin is
> +-   only available since GCC 6.  signbit is expanded to __builtin_signbi=
t
> +-   after Clang 3.3.  */
> ++   only available since GCC 6.  */
> + #  if !__GNUC_PREREQ (6, 0)
> + #   define __builtin_signbitf128 __signbitf128
> + #  endif
> diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/gl=
ibc/glibc_2.41.bb
> index 7f2576692d6..70afc78a55c 100644
> --- a/meta/recipes-core/glibc/glibc_2.41.bb
> +++ b/meta/recipes-core/glibc/glibc_2.41.bb
> @@ -54,6 +54,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
>             file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selft=
est.patch \
>             file://0024-features.h-Bump-__GLIBC_MINOR__-to-next-release-o=
n-m.patch \
> +           file://0001-Revert-x86-Define-__HAVE_FLOAT128-for-Clang-and-u=
se-.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"

