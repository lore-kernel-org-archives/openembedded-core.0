Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8E4C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 17:10:10 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.53790.1745860209723104260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 10:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vty7NWPZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-400b948600aso1385197b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745860209; x=1746465009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guB+bqJNxasd6hwybjPEAdEtPlcBYmfInHHVjSeCq5s=;
        b=Vty7NWPZSzWbfLaFU0KKJ5OTGwqJXl0T7Oea5R2K9jtSRhTwQE4f3BhPfe1dZECTin
         Zws2HgvDDVsUj3oSAZFMjOBipLEIo7iOj67GWvQhBckg6IkFSnjvnBg0EeiFz0DG6kEa
         QTFnWmoeQB+y/GlNr6OGnKLsPzcLWG77nEwrsc1/S1tqe7w8HDqMz6yBqVYVQUGNCT4d
         KjpIMTbsu55ky1lUSDHEoLP6DOn6YEGUQjFMP3vIDWkCPsEpW17vKdUktCF/kQR0RZrA
         w2+O9yaZtFmcc8IL/XciNDOhr/9UikTklB0F+OcVYwyVzeGSPr5wsptbSONTQXJpc0lS
         bm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860209; x=1746465009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guB+bqJNxasd6hwybjPEAdEtPlcBYmfInHHVjSeCq5s=;
        b=OXqLPkUOSSh2m2ofU8X4KIB2O8VTbQHPZJGb7WTcOiAYASA5Wa57GhYBHexSQjgAnA
         outNGSPNES/PTGAc00kxFFMRusu/vGObu/xXqHbj+nr+qXm0hSnUvUkQrx3eOqXjYMR4
         OyyIy+DSL1NXm0NdL1mSjfHb+RbQUia2psQtbE7SIgbE1k1eAq16xv1gPpfcKruk0TbJ
         wY3pwdJ21L1YPMFRXRBbTPO5gwijpQIidhseg4tm4k6idfiiAuhtNreW9SqBTwKA0p1f
         zm+mSgtA/ULVr6mbxxzD34QOvasvn/9JXYCgr1UCU6ipIWQgTozjSbW1tJW2CdT5hVtd
         zVAQ==
X-Gm-Message-State: AOJu0Yxu01BUz2y0NUC+bmv9c/Tfo8Kj9ic9VsC6qRc+GaLDzX4Bg1yV
	hPjXpfeQwOsWn3WOOIpLW1HVWxjZ4Ie4ES05bTcqbw+NPCXMc1Ib5UdBFkvuRBLkyXi8DjeUBHD
	fT0paB0VQfgFg5xK/cUYxjq5G7Ro=
X-Gm-Gg: ASbGncvEwMWDFyJ7Vi6AUPunOn2Jixe9979QYyOuq6yIGtndQEpOEsuhOe/0blIadNj
	HbhGZIgMuepaNtBI5qI0LhHQeODLUjH+bbXTzv+trsBoF3zzsmVsDHUgzhi/LIDG15JgvjEJQEO
	YoAYgNFWFWZgm+/ioYFTh4tQ==
X-Google-Smtp-Source: AGHT+IFwYt/UGWzFEwy7TafW3yHMDqnMvecUfsYu8BqdR+K0U3jrXHxupJNfgE5TQr9+RbUDMY5ukRSgrGGdLPYBDs4=
X-Received: by 2002:a05:6808:3510:b0:3f9:d5a2:89a6 with SMTP id
 5614622812f47-401fd7e5daemr5968575b6e.35.1745860208907; Mon, 28 Apr 2025
 10:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
 <20250426-clang-merge-v4-8-42d205904261@gmail.com> <tims4g3kpjke7bfqfbvx2sfc5y2avhiyixn2sm7cgvwmwt7lid@3il6kjlvkpcd>
 <CAMKF1sq=x6caiTm_ixio56zVsg_rjLR9189vKHkQKzF7hD6HDQ@mail.gmail.com> <CAO9ioeWvPcSRt0kRNiPpnZQU+QDfMc9kbDZ_+PgzpLuzQJSbqQ@mail.gmail.com>
In-Reply-To: <CAO9ioeWvPcSRt0kRNiPpnZQU+QDfMc9kbDZ_+PgzpLuzQJSbqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 10:09:42 -0700
X-Gm-Features: ATxdqUFc6l3P8HZCz1p1FFJbZLCO3SBTRnPCXw3xA_S9IyEfn2AIc3ez2VEXS1o
Message-ID: <CAMKF1spY4-3SHT85oRU30SeLzYQA7kSvKczP6-OsHjwn7LNfZw@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] mesa: Pass needed clang flags via BINDGEN_EXTRA_CLANG_ARGS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 17:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215623

On Mon, Apr 28, 2025 at 7:56=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, 28 Apr 2025 at 17:51, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Apr 28, 2025 at 4:03=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, Apr 26, 2025 at 08:16:47PM -0700, Khem Raj wrote:
> > > > This is needed for clang to find the c++ headers when invoked via
> > > > bindgen
> > > >
> > > > Fixes
> > > > | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linu=
x/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fat=
al error: 'cassert' file not found
> > > > | Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/ma=
ster/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sy=
sroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' fil=
e not found
> > > > |
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >  meta/recipes-graphics/mesa/mesa.inc | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > >
> > > This way we have two sets of bindgen/clang args: one added by
> > > meson.bbclass, one specific for mesa which you patch up here. Please
> > > pick up the attached patch instead, it makes sure that there is only =
one
> > > place to specify bindgen args for Clang and documents the reason for =
SDK
> > > packages requiring special handling.
> >
> > This is breaking mesa-native recipe. Why is bindgen invocation special
> > for meson? we have other recipes in
> > e.g. meta-openembedded which pass this variable from recipes and have
> > finer control over
> > recipe types that way
>
> mesa-native worked for me, what is your build configuration?

I have this
PACKAGECONFIG:append:pn-mesa =3D " opencl libclc gallium-llvm "
PACKAGECONFIG:append:pn-mesa-native =3D " opencl libclc gallium-llvm "
PACKAGECONFIG:append:pn-nativesdk-mesa =3D " opencl libclc gallium-llvm "

and I am building for qemuarm64 on x86_64 host and sdkhost.

>
> Putting necessary arguments to meson cross file was a recommendation
> from Mesa developers. I think we should follow it instead of patching
> environment variable in recipes.

Is this recommendation from meson too ? I think no, so we will be
carry this locally moreover, meson
is uses to build more packages than mesa and adding mesa
recommendation for generic meson
might not be ideal.

>
> >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
>
>
> --
> With best wishes
> Dmitry

