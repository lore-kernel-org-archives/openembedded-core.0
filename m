Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB75C4829E
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 01:43:36 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.9412.1708047810634860988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 17:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x07CcDve;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.175, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso1376039276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708047809; x=1708652609; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2jJ61Q/ud6aOZCkUu36G3DQKw88FXovYoLqOzA+qhU=;
        b=x07CcDve6opyCZvdkg8Uc+9vqmEPfqUWyB/zN4DmeZFXzzT6WOcN9oML/wJZnBvdoe
         RUh58yGfFb9cRVKs01dG+mSDk2+gO76MFD3I8TUHafMX0grAsVgbGfECyqqOBkGmkyd9
         Hr72iPDnxvYqqJTdw1VcVXnK53iybgHryKECey9m7EbJuCMapU/YLSbXHGCe7hWM7h5E
         hm6/kXLH3yp31wF3jPA8xmQrwzOHPhtIN9DT6ey3Ep7k1PyeZ4eF5wba484maPinjA61
         SwkSlnJbBNOpiX/omgETQk1m6S/iJNHXwB3Uh3B4dE+mSrjhBguiVXGcGHFNKMsyHxw9
         LR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708047809; x=1708652609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2jJ61Q/ud6aOZCkUu36G3DQKw88FXovYoLqOzA+qhU=;
        b=ugrBD2m0VQ6nnisDEipjD8zbfoV2i1eMNYeI0jlkMKuAvgtlxQfp4xUciHFPvUEKYJ
         S7ugQsX61XXMO+8G0oyELeHlMy7PPdMhnQOP30NlmMHzO+mqJCisq8+qyY9AeKsiDPQz
         O2yRLIOQs0kIYxU55NSXRT2fkuuz7DG6dKPlo7xoGWmQPy1jcbpwH7dBz6C+7NN0Ev7Q
         KTYHvxWFJW1H/GTkUuekeJ/taoRQrlBuVVL770MFqmSYaEW7hxTjVDMGOub959gZJa/L
         uLxbEdg3JrHlzTIF3Eo4H6ORpxWxz1CU4Jer94NNM29yZxWAtKNeGzVnDOH6BcZjIPfw
         kQMA==
X-Gm-Message-State: AOJu0YwcyjO7iZf/oASlkXI1VTdrbIRyQBdYhuOyksx2zYYPzf239TqF
	UqpwpMK2n+C9qUTTJZRVCCBtwIMfLgrN3Y8ObJSIpGlO4N9BS9bsV/OVAzOe4GB18ZHAHP081d6
	VVLNiC8WSt4Sr9MR9QPNX7HwxiBfhXRwQWcn22pHBblRaJgIBddQ=
X-Google-Smtp-Source: AGHT+IHMmZ3GmqQBrj7RojtzzEmRKolJDybMi1go2yMRt/KPFlizKONp/0eNTbs9ORDAjgjzL9rATl4IprCpoLMBmsw=
X-Received: by 2002:a25:b347:0:b0:dcc:5a25:ae88 with SMTP id
 k7-20020a25b347000000b00dcc5a25ae88mr3386881ybg.19.1708047809592; Thu, 15 Feb
 2024 17:43:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1707745886.git.steve@sakoman.com> <d9273edae80978c34f8426f34f991b9598828aa9.1707745886.git.steve@sakoman.com>
 <6fc21e62-f75e-4bd7-bf61-5d86efa05854@ti.com>
In-Reply-To: <6fc21e62-f75e-4bd7-bf61-5d86efa05854@ti.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 15 Feb 2024 15:43:18 -1000
Message-ID: <CAOSpxdb85tHCEWMQkJ5eMPQJ=Tb+KKVEBHqAFVFA+9TOc3-_tg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 7/8] kernel: fix localversion in v6.3+
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 01:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195735

On Thu, Feb 15, 2024 at 3:20=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
> With this patch in place we are seeing a breakage on our kernel builds.
> This patch was cherry picked from master, but the next patch on this
> file in master removes the LOCALVERSION setting...
>
> https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe=
/kernel-arch.bbclass?h=3Dmaster-next&id=3Db378eec156998eea55ba61e59103cb34f=
ab0d07c
>
>
> There is a disconnect here.  Why did we change kirkstone, a stable LTS
> version with a partial patch series based on master?

The original kirkstone backport request for this patch was sent to the
list for review on February 9.

There were no comments or objections, so I added it to the patch test
queue.  No issues were encountered on the autobuilder, so I sent this
patch (along with the rest of the patch queue) to the list for a
second review opportunity on February 12.  Once again there were no
comments or objections, so it was merged today February 15.

I follow this process because I'm not smart enough, nor do I have time
enough to thoroughly research all implications of every patch.  I rely
on autobuilder testing and community review to minimize breakage.

This normally works quite well, but this time it didn't.  I'll revert
this patch and if someone would like to resubmit a proper series to
deal with the issue it is trying to fix I will consider it and run it
through the same process.

Steve


> On 2/12/2024 7:54 AM, Steve Sakoman wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > During testing of the v6.4 reference kernel, it was noticed that
> > on-target modules no longer matched the magic value of the running
> > kernel.
> >
> > This was due to a different localversion in the cross built kernel
> > and the scripts / resources created on target.
> >
> > This was due to changes in the setlocalversion script introduced
> > in the v6.3 series.
> >
> > The .scmversion file is no longer used (or packaged) to inhibit
> > the addition of a "+" (through querying of the git status of the
> > kernel) or the setting of a local version.
> >
> > We recently introduced the KERNEL_LOCALVERSION variable to allow
> > recipes to place a value in .scmversion, so we extend the use of
> > that variable to kernel-arch.bbclass and use it to set the
> > exported variable LOCALVERSION.
> >
> > We must do it at the kernel-arch level, as the variable must be
> > exported in any kernel build to ensure that setlocalversion always
> > correctly sets the localversion.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c691
> >
> > Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >   meta/classes/kernel-arch.bbclass |  7 +++++++
> >   meta/classes/kernel.bbclass      | 10 ++++++++--
> >   2 files changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arc=
h.bbclass
> > index 4cd08b96fb..0a79dea0af 100644
> > --- a/meta/classes/kernel-arch.bbclass
> > +++ b/meta/classes/kernel-arch.bbclass
> > @@ -66,3 +66,10 @@ KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_=
LD_KERNEL_ARCH}"
> >   KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> >   TOOLCHAIN ?=3D "gcc"
> >
> > +# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" i=
n
> > +# the local version. Having it empty means nothing will be added, and =
any
> > +# value will be appended to the local kernel version. This replaces th=
e
> > +# use of .scmversion file for setting a localversion without using
> > +# the CONFIG_LOCALVERSION option.
> > +KERNEL_LOCALVERSION ??=3D ""
> > +export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 5951347361..940f1a3cf4 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -418,7 +418,7 @@ do_compile_kernelmodules() {
> >       if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
> >               oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTR=
A_ARGS}
> >
> > -             # Module.symvers gets updated during the
> > +             # Module.symvers gets updated during the
> >               # building of the kernel modules. We need to
> >               # update this in the shared workdir since some
> >               # external kernel modules has a dependency on
> > @@ -635,7 +635,13 @@ kernel_do_configure() {
> >       # $ scripts/setlocalversion . =3D> +
> >       # $ make kernelversion =3D> 2.6.37
> >       # $ make kernelrelease =3D> 2.6.37+
> > -     touch ${B}/.scmversion ${S}/.scmversion
> > +     # See kernel-arch.bbclass for post v6.3 removal of the extra
> > +     # + in localversion. .scmversion is no longer used, and the
> > +     # variable LOCALVERSION must be used
> > +     if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
> > +             echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> > +             echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> > +     fi
> >
> >       if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B=
}/.config" ]; then
> >               mv "${S}/.config" "${B}/.config"
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#195328): https://lists.openembedded.org/g/openembed=
ded-core/message/195328
> > Mute This Topic: https://lists.openembedded.org/mt/104311283/6551054
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

