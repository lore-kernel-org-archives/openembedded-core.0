Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B73C25B78
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 18:12:47 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.2976.1716660760210128902
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 11:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ghz3bVAr;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b96a95c5e8so1129659eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 11:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716660759; x=1717265559; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+KU4yxqP/akbEH9co5eGC4NTcKb27oQhq/mYbz2a5Q=;
        b=Ghz3bVArtsON85eZcRMqMyn17hhtxOlSFbUZB3x/KL3HiTfOEREibfwheNK8U1+5hV
         DNPCvXurRyCI7Dy/mqo/2ETvlnNEmAvtwpfpDBoYOA7qmCgzqvyh7nHnck4kVrUVjnZ8
         gvuPI5sAS0O401uFExAK9hrdrykHEisoQYXiWUPmC+ZP78GpfwzEUKcfxfRw76FgemmE
         y6b8VxS69D1dJUepQNi5CbB4z2vO7N+MScYrUfHHNG1K2V2Bvwk9ANu0c4S2wtYxsJ7+
         ZAB/z8vwzmGUM3AWrcAcrBp8grUSTlaPhmlicafw31n/I3WvNDZnmXsgHm1DQ+M0Myln
         07Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716660759; x=1717265559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+KU4yxqP/akbEH9co5eGC4NTcKb27oQhq/mYbz2a5Q=;
        b=FtqYSPnBq4t+2pe1G7b/F4l1s1JrhNGf+Mu7ZSKLadtKCf03fORR52VtgbbdulDvVs
         2z0VcOPX2X89uufLPhyeVVGljAa5hdl3cOeFdzpdSZIsXirQDrZ9p99PAjcUSrJbCGNx
         ei9mu2HZn5b0aC8Tk0ua/VQduUHr4R/jeVCXAC0v+C6scSDM8onkhFGo9tXLixBqehg9
         JVjc3XMOWLZKMD7D1Z85uSDU92yYvayh6CWir3iskSY2gq1J6p6ODCyLI0J9itNv0rFJ
         OwvlZi8KjiiJ6GzDG6qlzIOFxYF4rr4mwR4po5l3+ronfQXGkys0D+cwom5OI/vTsIv4
         89eA==
X-Gm-Message-State: AOJu0YzHT5sxDRv3+nuouifIh12+/LJhByovQ8Zj2FAKg258MIl9qeGw
	dkRU5qL/P7OsmyvKNgOVSdJSPBoOIx1C8pa2aRydPDabIW4oa/iYsmuzoKl4W6/5RbLyxbUP2od
	d6TZzuC165KiIfXsZDDhZqC9PDNE=
X-Google-Smtp-Source: AGHT+IFlrwExs7rwtPHNVlqxMJEFuVPJU46bIsaz8mCTbbqcyg7By4XSErrIFtFB71NkFHwQ+XPBgg/y96eVKxxaL0c=
X-Received: by 2002:a05:6870:2112:b0:24c:b769:3d22 with SMTP id
 586e51a60fabf-24cb7695855mr4704552fac.53.1716660759236; Sat, 25 May 2024
 11:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240525104838.619254-1-peter.marko@siemens.com> <20240525104838.619254-2-peter.marko@siemens.com>
In-Reply-To: <20240525104838.619254-2-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 May 2024 11:12:12 -0700
Message-ID: <CAMKF1srWp71THWhjRzG=gPtSpqShtpOf-hniALgMq=xXp+2qfQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] llvm: Upgrade to 18.1.4
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 18:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199876

I am fine with all 3 patches backported in this series.

On Sat, May 25, 2024 at 3:49=E2=80=AFAM Peter Marko <peter.marko@siemens.co=
m> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Brings following fixes
>
> * e6c3289804a6 [CMake][Release] Disable PGO (#88465) (#89000)
> * 028e425f86cc [MIPS] Fix the opcode of max.fmt and mina.fmt (#85609)
> * e3c832b37b0a Fix override keyword being print to the left side
> * 1deeee3f5da4 Revert "[Mips] Fix missing sign extension in expansion of =
sub-word atomic max (#77072)"
> * 995539ce05ba [LLD] [COFF] Don't add pseudo relocs for dangling referenc=
es (#88487)
> * db67e6fb9ad1 [libc++] Fix -Wgnu-include-next in stddef.h (#88214)
> * 647fbc710840 [SelectionDAG] Prevent combination on inconsistent type in=
 `combineCarryDiamond` (#84888)
> * eaae766a20fd [RISCV] Support rv{32, 64}e in the compiler builtins (#882=
52)
> * c24b41d71f2e github-upload-release.py: Fix bug preventing release creat=
ion (#84571)
> * c837970dd7e9 [Codegen][X86] Fix /HOTPATCH with clang-cl and inline asm =
(#87639)
> * d0ddcce21d91 [InstSimplify] Make sure the simplified value doesn't gene=
rate poison in threadBinOpOverSelect (#87075)
> * 4056cc29dfd3 Prepend all library intrinsics with `#` when building for =
Arm64EC (#87542)
> * 6e071cf30599 [SLP]Fix a crash if the argument of call was affected by m=
inbitwidth analysis.
> * d89da2ac8839 [libcxx] coerce formatter precision to int (#87738)
> * b6ebea7972cd [SPARC] Implement L and H inline asm argument modifiers (#=
87259)
> * bffecba7ce4c [libc++] Simplify the implementation of <stddef.h> (#86843=
)
> * 9899a2d76c8f [lit][ci] Publish lit wheels (#88072)
> * 3ceccbdb1995 [clang-format] Correctly annotate braces of empty ctors/dt=
ors (#82097)
> * 429d62872525 [Headers] Don't declare unreachable() from stddef.h in C++=
 (#86748)
> * feba8727f805 [ConstantRange] Fix off by 1 bugs in UIToFP and SIToFP han=
dling. (#86041)
> * e4259b583c92 [Float2Int] Pre-commit test for SIToFP/UIToFP ConstantRang=
e bug. NFC
> * daca56d8e162 Bump version to 18.1.4 (#87715)
>
> (From OE-Core rev: adc2651a8e902af24fee6ff30a72f4b7c63bef6f)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtoo=
ls/llvm/llvm_git.bb
> index c4fd73f2d7..e7fa88b30e 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -17,14 +17,14 @@ inherit cmake pkgconfig
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> -PV =3D "18.1.3${VER_SUFFIX}"
> +PV =3D "18.1.4${VER_SUFFIX}"
>
>  MAJOR_VERSION =3D "${@oe.utils.trim_version("${PV}", 1)}"
>
>  LLVM_RELEASE =3D "${PV}"
>
>  BRANCH =3D "release/${MAJOR_VERSION}.x"
> -SRCREV =3D "c13b7485b87909fcf739f62cfa382b55407433c0"
> +SRCREV =3D "e6c3289804a67ea0bb6a86fadbe454dd93b8d855"
>  SRC_URI =3D "git://github.com/llvm/llvm-project.git;branch=3D${BRANCH};p=
rotocol=3Dhttps \
>             file://0007-llvm-allow-env-override-of-exe-path.patch;striple=
vel=3D2 \
>             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as=
-we.patch;striplevel=3D2 \
> --
> 2.30.2
>

