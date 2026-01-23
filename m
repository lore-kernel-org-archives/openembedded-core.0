Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF794D72357
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 08:56:26 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63584.1769158578141065428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 00:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LMLY/FXV;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59dd9aef51eso2246814e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 00:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769158576; cv=none;
        d=google.com; s=arc-20240605;
        b=Gy6+T9pSF92ZrdhzIphf6P6TPGHXGV8dICEgfgrV+Zdn7fUeGQMzzS2VvhbJOkbMQ/
         Kn/c94tAZiUsHWD8ebmi93jk4GjkCejbAhA968kZXRNcHFNbzkGcGxqBgeWtSEbemqIz
         eWCtpClFL8gDvAF7Ndw5XO+c8m+V1RJuoAJMgRy9N+faM7LsneYhe2Mq60caH0DRdbX4
         LL2nlzMtG/LWFD5sg6rGn8wsTQ57wsvY2Ga2tgtbmYQMk7UgTfo5GFYKtTbuSXGYlpCD
         9EY/oX9krK4Nj5yjQ34kjs11AOiz34O6pED0h+rnEFnnnTWjq2mZGZdXiHjpyPxWfqSf
         9+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RZPm9nW2d0R5eYRNtDwVEBqr7R4jCk3f3IwGs5ZLhWs=;
        fh=6DRnRsodwJgYP+rxnMrtCbtlIW9oHYTvWPZfyvv7+y0=;
        b=XwObT+CI7yg6v02mYS2ulMLcASLln4M3Ca1GnOZVjpOebkm310vN98RCBPhwoFOPrb
         UgbrXq/uu59UEsYK+iX4qchnQB9rZIbWxEkXYMfK1pWi74QgH4UT/JVDVMpRQCi9cTAm
         3rOoUkPGaXGC1GNJb78djNw/znKUwV1Ia6rYw44egFK3zMoVVJ6iJTtRjb0KmTYtfmox
         SWdrBHdZJWNN7puhwOkCoiPg4SMnjoqrL1VeTUDuL3toiinjZo6KuxXcZk+BnuH9NevF
         hLpv6w6Dbvt2rRxpTEdJNzrTyUFpwMCaPIjolUC+6k5dnfXr+XiezCFM6YsPdVO3NBnZ
         wQ9g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769158576; x=1769763376; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZPm9nW2d0R5eYRNtDwVEBqr7R4jCk3f3IwGs5ZLhWs=;
        b=LMLY/FXV7GZMfoTkPisxobsrOgIjYzCiQVPhdgRHl3L26oqjuMEfOmqNK86VOQ8iXi
         +XDFo30bkAVmRemARoPiwUFZpMJHbMrb1TexXfK22dK/26oaYvD7n/LsEVIQ7wG1AxUR
         kDIEVsrZ3pCZ/MV3SsxPPrUpjXIsgJ29M2v4HYHphyj3Z75zgfE2cpIs7DQL3uvKs8E3
         UqQe9fr+ojG6k7zH45xYuZm+k0b3pH9+d2R+4+9vwJTJ81Byn41wdLKmMZTF56bf3JPj
         l/Uhcsg4G9Au4oaBy7LPd2+jYehN0Mxd1tLc6g5tWHgqbwtl+/m+J024Dfuo32OKY93l
         qVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769158576; x=1769763376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RZPm9nW2d0R5eYRNtDwVEBqr7R4jCk3f3IwGs5ZLhWs=;
        b=Equvyg3PmGdrI4f+uwNJgm6b1+mHONvVGZKH6JNxEms0/ZUIt2KJpzC2t77ulY1P4L
         M1KzYCO0X0XB1iZwL+AeAVkXqd37Cu59FnFJTao/o6C5Wt1iM7SCUveJUnNk8i7NMd9z
         XcidWWonTAZIZM5Vlim88rwXdOvqbLRR8NSHgX1SQPtFyVvUnU/6zYTQ2/q+tbGkRWKL
         z1oNNTnt5N0OS56oA7FENChxvyhxaTW6taZNBM/Kbv7xPoHSWSrzDWoIzzovpJoolmpw
         DqFzfcFN9+2PPrmlyqhWqGBCRXY7NCNEE7CaQcxoqHx5peGuVL3ZzpDfm9VouHmfPEHI
         FIsg==
X-Gm-Message-State: AOJu0YxAzBM7H/HFV4ahPJ2ztTLCLZvwIM3A3vaC120a814AGBxdOgdd
	VFvdTJBpQDEB7NG56EVPhMcNGQk+QDuJyMn6elUpKtIXscwrb99C8W6cPE5VsaPJHlm1egMutnD
	E/9dFAss2UWj+9BYzgCp7CumB/gXjs3D70WvL
X-Gm-Gg: AZuq6aIFeUCk6uoEiUGLX4d8hLq7VMW0o4PLoPQv90zJ9SrC0Dk3UVFU1CsFsbh3SVJ
	o21+RTZXl13sYySiQU3g70Wgdmi0b+P6C7cBzCKusnwbGRwipP4JzzFqMeNyplKGqnLeW59QG1i
	7W7sHt7nq+iuRKSjKWEpmoitYAxoXI1nWOtCdriF7YiLkMyW2jwGZrfcCXgyBrAK78N/hklb0hn
	VFtIK0jkZNiXxfXpv3PkCT4zjr7X6uQyupF8hNJ0WAn+xhGmJGmL/V3w3vRwFxpwNix2bnVo6xN
	SI/bRm8w
X-Received: by 2002:a05:6512:1253:b0:59d:e351:c339 with SMTP id
 2adb3069b0e04-59de8170d50mr292062e87.48.1769158575963; Fri, 23 Jan 2026
 00:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20260123084336.3061764-1-leon.anavi@konsulko.com>
In-Reply-To: <20260123084336.3061764-1-leon.anavi@konsulko.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Jan 2026 09:56:05 +0100
X-Gm-Features: AZwV_QiQ7KhkVU5sAhyyS18haLICVO3Hz-ovB7vNvP6rgrqSEk_liKROgn-Al8k
Message-ID: <CA+chaQcjfc2w1Tt7L43VR4H=fV8NM9k8h8mNZwjPp3FejQr4ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
To: leon.anavi@konsulko.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 08:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229878

Thanks, but this needs python3-backports-zstd to be imported from
meta-oe to fix the ptest as discussed in:
https://lists.openembedded.org/g/openembedded-core/message/228548
https://lists.openembedded.org/g/openembedded-core/message/229015

And if python3-backports-zstd is no longer needed with python-3.14 now
in oe-core, then you need to drop the whole
do_configure:append:arm:toolchain-clang.

Regards,

On Fri, Jan 23, 2026 at 9:43=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 0.19.1:
>
> - Fix SeekableZstdFile write table entries on 32-bits architectures
>   when there is a huge number of entries
>
> From release 0.19.0:
>
> - The project has been completely refactored to use the Zstandard
>   implementation from the standard library (PEP-784)
> - The refactor has some minor impact on public APIs, such as
>   changing the exception raised on invalid input
> - Add backports.zstd dependency for Python before 3.14
> - Changes in build dependency: remove setuptools and C build
>   toolchain, add hatchling and hatch-vcs
> - Remove git submodule usage
> - Drop support for Python 3.9 and below
> - Use ruff as formatter and linter
> - Embed type hints in Python code, and check with mypy
>
> All ptests pass following python3 upgrade from 3.13.11 to 3.14.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...emove-setuptools-version-limit-of-74.patch | 27 -------------------
>  ...std_0.17.0.bb =3D> python3-pyzstd_0.19.1.bb} |  7 ++---
>  2 files changed, 4 insertions(+), 30 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Remo=
ve-setuptools-version-limit-of-74.patch
>  rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb =3D> pytho=
n3-pyzstd_0.19.1.bb} (73%)
>
> diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setu=
ptools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-pyz=
std/0001-Remove-setuptools-version-limit-of-74.patch
> deleted file mode 100644
> index f2910322ff..0000000000
> --- a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-=
version-limit-of-74.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 9 Apr 2025 14:38:31 -0700
> -Subject: [PATCH] Remove setuptools version limit of '74'
> -
> -Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
> -support beyond that which is needed for python 3.9 on windows. We
> -do not have this problem on Linux
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index dd885e4..5d4d511 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -1,6 +1,6 @@
> - [build-system]
> - # setuptools 64+ support --build-option
> - # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 =
under Windows
> --requires =3D ["setuptools>=3D64,<74"]
> -+requires =3D ["setuptools>=3D64"]
> - backend-path =3D ["build_script"]
> - build-backend =3D "pyzstd_pep517"
> diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta=
/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> similarity index 73%
> rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> index af7069b6ed..a41c16682d 100644
> --- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> +++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> @@ -9,10 +9,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daedb5a2679cd=
1552fb61c181ef974b9e"
>
>  PYPI_PACKAGE =3D "pyzstd"
>
> -SRC_URI +=3D "file://0001-Remove-setuptools-version-limit-of-74.patch"
> -SRC_URI[sha256sum] =3D "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21=
b81764fa208c1db6"
> +SRC_URI[sha256sum] =3D "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d58=
6937830a8afc7d72"
>
> -inherit pypi python_setuptools_build_meta ptest-python-pytest
> +inherit pypi python_hatchling ptest-python-pytest
> +
> +DEPENDS +=3D "python3-hatch-vcs-native"
>
>  # clang-16 with -flto segfaults on arm, therefore ignore flto for now
>  do_configure:append:arm:toolchain-clang() {
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229876): https://lists.openembedded.org/g/openembedde=
d-core/message/229876
> Mute This Topic: https://lists.openembedded.org/mt/117415035/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

