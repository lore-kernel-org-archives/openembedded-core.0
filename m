Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A5FCF395A
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:50:24 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.21581.1726757418570650765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gBVz3hgU;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5344ab30508so1709352e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726757417; x=1727362217; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFicY0rvLQNVyde51+uYkTizns+LBdgiubU8kfzRuEY=;
        b=gBVz3hgUh5HRncCAbzB0DjFckkWgwxUmNPhoJnrUU5r2mba5ufwtu845uf9UEeQ8z/
         JAGeyjvXOewUFbZnr2Xbc2sHpTq0ylf/s6xfiHkKEfWP9hHlv8LN9R0wm6YX6r9Z4hvR
         /AhS9k8CTCQAwQD+qyv/sXh36xImc7hqe9OnR0KqUhlMuBc031Qvq2iKhnsLlfdiZtBh
         HWfTxHiV8285m+38C/BhQxJj1iKAHETGN67ZDAFG+X++zbpLVbC2nEfq80OC314S9t7a
         V3l0ZrCj0d+NpKpzwrtLialyS7kryvonTYPtjMGP1LDWravVn80cA3FjPopQ7t4laQoc
         K2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726757417; x=1727362217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFicY0rvLQNVyde51+uYkTizns+LBdgiubU8kfzRuEY=;
        b=cnCCETOj1ibymRhzn6h1SF9BhB3vmbq8Zz6V6900FGrjP0kcEXWmtJJAvrncE1JiKA
         +ikDWsjMsf9+rR8sAEfwYB+WcnJLuksth9kiXbRpc7WgzUTGna/ywwRbdi7o+aOo9U3m
         8KMtOBiHxVLXCOTykCFaLSBno3kWuBddJ4Hpi3mG9UOU6rnJUn0ACwbLU6ueK2ZYEswD
         dtTt4QeuFSWUoSw4q9LkMVaWhiRA2DTXGvyY1f3jJpH2ROhCL3W0YpP/u07FgaEVE42s
         BP2Fx3lHGpWeBekmSYJFGSl/ptUwz9YEOL0ZwjgLSLMkEan9Oz/mw/13XB3lC+sLutBe
         EPNw==
X-Forwarded-Encrypted: i=1; AJvYcCXXl3PSxHEeGd6XqMRSGtqSyGyWS1SMZOJbDecgiWn3l2/pQL48RA5MMVNl6fxuBvA0vtHh8fmYRxyiwl2nAjXG5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySi0DrScWQR7b1udBPRbLYd8Yuylf/gDX2pVTdGfgv03nHDjSw
	wTzessXbBsC2OS32gSL1FD1Uvpjr26/YaylJa0zBn+0h/NNHe5veTW92T5g5nvMk7kP9K21GR5J
	zEpGrSC1av/UKTf0ihLXYptX8S+A=
X-Google-Smtp-Source: AGHT+IGZnyDT6F4Th55H8fI3hKuE4se56KtNEIXCi1eOMUQRWnDFZ8P4ZKMI1WgDdaffKFpYCYAPBl2xMbsYbcyW2xE=
X-Received: by 2002:a05:6512:1055:b0:52f:336:e846 with SMTP id
 2adb3069b0e04-536a563b000mr1138556e87.14.1726757416358; Thu, 19 Sep 2024
 07:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240919124848.653457-1-Harish.Sadineni@windriver.com> <09eb61b5cfa0eca6e6f6028aa882af3781dcacb3.camel@linuxfoundation.org>
In-Reply-To: <09eb61b5cfa0eca6e6f6028aa882af3781dcacb3.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 19 Sep 2024 08:50:04 -0600
Message-ID: <CAJdd5GbvMY+ORi+77qm8sUnr+A87LYi75TC3fNjf5Ld5XVeBYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/2] binutils: Fix packaging of bfd-plugins
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204705

In general, we don't really support any nativesdk- recipes in MinGW;
it's pretty difficult to get recipes working for MinGW in general, so
we are pretty focused on just providing the cross-compiler utilities
so that the SDK can be used to compile for your target device, and
less so to provide utilities for running on Windows proper. A lot of
recipes are pretty much impossible to compile as nativesdk- (e.g.
Python).

In general, my recommendation would be to use the MinGW SDK to provide
the cross compiler, and if you want additional tools in your Windows
environment, use something like msys2 to provide them (or compile your
own versions). IMHO, this a much more maintainable long term solution,
since I don't think it's going to be particularly easy to allow
arbitrary recipes to be compiled as nativesdk- for MinGW, and
msys2/mingw has already solved this problem anyway.

On Thu, Sep 19, 2024 at 7:41=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2024-09-19 at 05:48 -0700, Sadineni, Harish via lists.openembedde=
d.org wrote:
> > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >
> > Fixes the follwing error while building nativesdk-binutils with i686-mi=
ngw32 as SDKMACHINE:
> > ERROR: nativesdk-binutils-2.43.1-r0 do_package: QA Issue: nativesdk-bin=
utils: Files/directories
> > were installed but not shipped in any package:
> >    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/=
lib/bfd-plugins
> >    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/=
lib/bfd-plugins/libdep.dll
> >
> > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils_2.43.1.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/r=
ecipes-devtools/binutils/binutils_2.43.1.bb
> > index 2cce40f1ef..eb7c16cbc4 100644
> > --- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
> > +++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
> > @@ -72,5 +72,6 @@ SRC_URI:append:class-nativesdk =3D  " file://0003-bin=
utils-nativesdk-Search-for-al
> >
> >  USE_ALTERNATIVES_FOR:class-nativesdk =3D ""
> >  FILES:${PN}:append:class-nativesdk =3D " ${bindir}"
> > +FILES:${PN}:append:class-nativesdk =3D " ${libdir}/bfd-plugins"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
>
> I ended up digging into this a lot more. I was able to reproduce the
> failure locally but that implies the autobuilder isn't testing this
> combination. According to the configuration, it should be so I'm a bit
> puzzled why the autobuilder doesn't see it.
>
> The autobuilder config for this is here:
>
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n1=
362
>
> Resulting in a build such as this:
>
> https://valkyrie.yoctoproject.org/#/builders/7/builds/162
>
> I would like to understand why automated testing isn't catching this.
>
> Getting back to the patch, I noticed that bintutils.inc already does:
>
>  FILES:${PN} =3D " \
>         ${bindir}/${TARGET_PREFIX}* \
>         ${libdir}/lib*.so.* \
>         ${libdir}/bfd-plugins/lib*.so \
> ...
>
> and the issue is that it uses .so and the recipe is generating a .dll
> file.
>
> I'd note that bitbake.conf has:
>
>  SOLIBS =3D ".so.*"
>  SOLIBS:darwin =3D ".dylib"
>
>  SOLIBSDEV =3D ".so"
>  # Due to the ordering of PACKAGES and the naming of the dev symlinks on =
darwin,
>  # we can't make the symlinks end up in the -dev packages easily at this =
point. This hack
>  # at least means builds aren't completely broken and symlinks don't take=
 up much space.
>  SOLIBSDEV:darwin =3D ".dylibbroken"
>
> with the intent of being able to abstract out dylib/so/dll references.
> I'm wondering if we should add:
>
> SOLIBS:mingw32 =3D ".dll"
> SOLIBSDEV:mingw32 =3D ".dll"
>
> which would then let us change the binutils.inc entry to:
>
> ${libdir}/bfd-plugins/lib*${SOLIBSDEV}
>
> In testing this I found it breaks zstd and zlib since those always
> generate .so files even on mingw. I've hardcoded SOLIBS and SOLIBSDEV
> in the bbappends in mingw to counteract that:
>
> https://git.yoctoproject.org/meta-mingw/commit/?id=3Ddb1f53f73e95499a5f0b=
0edc45dd9cc9718d3c8a
>
> I think these changes should combine to fix the underlying problem and
> also make it easier to fix things like this in future.
>
> They probably need wider testing though.
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>

