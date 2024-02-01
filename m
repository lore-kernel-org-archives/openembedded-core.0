Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E52C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 13:41:52 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.15636.1706794904030005439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 05:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EA2p8ODN;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-290fb65531eso686692a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706794903; x=1707399703; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ue8OyWZja66WcxnCCF/cWoanCkFiOJD22kyKZnbJF2Y=;
        b=EA2p8ODN9U/keeBiQuSbEgAX5YVn2KYw5y9w3ME1w9w9GkPIWI2ofdm3QzIQg5MHex
         gIVkhr+gsbt91HP31cjLVXTYlSZlma+OukTRwYNqtKXQoXEN2bZedwvRzg/ID4dZMaaV
         8aqG9hC/hm80u9t9nZtwOeObGPl10p7dFGTFsIR2zBXUcEXW5z8RexpvRruVC8YTD3bY
         pHZ5OAvPsRq5KszF9rzgUeFeGRCDK8f3qRooiuqV5jND4mjDJCGS3kfnupIsSb0Y1FGc
         YTIT865DcCf/jWW8dUBSP0XDjEiU0n6zKtgWskFucgu0Ytn6ak832zVEaEcljYT634PG
         bRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706794903; x=1707399703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ue8OyWZja66WcxnCCF/cWoanCkFiOJD22kyKZnbJF2Y=;
        b=KduqVnRSnvJ3XkIv6fCRmBPiA7Hwq3tfJlv7QyydRfL4r1h3y0LwRRK4T0E8pbMSDq
         B55hVGNc3oBIE7WyyCJM7ilF3En6AFpVYekxI3VG6yyGcg0uXAP66KV/vGIbMDtGNdcT
         niy0WjcbSCzakTEUOMTd8bb3t0bkW7g/Klw0L53YMaNrX5TZ2duiDslT5t87TDJJ9R8u
         y2obBM1O/gUNG4SpTiG46Vfphjo5SLuNEq8bLnYI34GcEZmi2DgaSrcLV2G70QHXrUDy
         u880mpUJkv/FbEvHGhrUq/GLiOYmEv4CSOSgEF/IxzT805fNy/e00LD++IQp5H8KOGNw
         hEdg==
X-Gm-Message-State: AOJu0YzfQYvo7aYubYOsSJNXtRMHcJuZLCtMNif9bXLX+9UrAbDy8uwx
	uqrXuHpOHXZWs3WH3WflFPjpIusQc6BIWffa2GC/bDjT+fYK76LCCnHjdTzBWQLR43SmZNrFXA9
	EBgf0xohpIjZ62zrND+q+Lgrk0qA=
X-Google-Smtp-Source: AGHT+IFYDVl8wJ4zdbdJRU8sU17/Thn/HVkKTI+3qNySGLD2DUnmlGvHnIrFHKx3dlHAzLOPyLWG6xbetfJrgqpsZFg=
X-Received: by 2002:a17:90a:bf88:b0:294:2c87:279b with SMTP id
 d8-20020a17090abf8800b002942c87279bmr1690388pjs.49.1706794903273; Thu, 01 Feb
 2024 05:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20240201115326.506503-1-claus.stovgaard@gmail.com>
 <CADkTA4NBTEH9js2E+KBGx3_LeLzd0RDCVY9gw2gHp-qP5ooO_Q@mail.gmail.com> <b594d06bbba5dd65e8f1f9a7cc865a7e5aaaff66.camel@gmail.com>
In-Reply-To: <b594d06bbba5dd65e8f1f9a7cc865a7e5aaaff66.camel@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Feb 2024 08:41:32 -0500
Message-ID: <CADkTA4MUkExGV3WM6LLZA6i9Nk=XU9G2Yc+0AkQchY5UJgAbMg@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] kernel-devsrc: fix missing RDEPENDS
 gawk and make
To: claus.stovgaard@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 13:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194588

On Thu, Feb 1, 2024 at 8:31=E2=80=AFAM <claus.stovgaard@gmail.com> wrote:
>
>
> Thanks for your quick reply Bruce
>
> On Thu, 2024-02-01 at 07:45 -0500, Bruce Ashfield wrote:
> > On Thu, Feb 1, 2024 at 6:54=E2=80=AFAM Claus Stovgaard
> > <claus.stovgaard@gmail.com> wrote:
> > >
> > > gawk is also needed for x86-64. See scripts/check-sysctl-docs
> > > Since version 6.6 the package rules has been split up into a rules
> > > file
> > > resulting in the need for make. See scripts/package/debian/rules
> >
> > When I looked, the rules aren't actually used when we are building an
> > out
> > of tree module (and via make scripts prepare) indirectly.
> >
> > In a situation like this the approach I've taken to exclude the
> > source from
> > devsrc to keep it minimal.
>
> Okay. I will patch the do_install instead and remove the debian rules
> file. I don't see the usage either so it is fine with me.

Just remove it in kernel-devsrc's copy of things. We can let the
kernel continue to install them, we just don't need them in kernel-devsrc
itself.

>
> >
> > If you are seeing gawk required as part of building a module or make
> > scripts prepare, then we definitely do need to add the dependency.
> >
>
> I can see we are including the scripts/check-sysctl-docs and objdump-
> func needing gawk - no matter the architecture.
>
> Alternative we should properly remove those also.

We definitely can, if they are bringing in something we don't need to
prepare the source tree for building modules.

The ones I've added over time have all been related to that.

Bruce

>
> Will split it up in two commits, and start with the "make" fix
>
> /Claus
>
>
> > >
> > > For reproducing the issue on a normal qemux86-64 machine, change to
> > > the
> > > linux-yocto-dev kernel, add the kernel-devsrc to the toolchain
> > > target
> > > task and disable ptest in distro features. (Notice ptest pulls gawk
> > > and
> > > make in as RDEPENDS for other packages hiding the issue)
> > >
> > > when populating sdk you will see dnf failing.
> > >
> > >  Problem: conflicting requests
> > >   - nothing provides /usr/bin/gawk needed by kernel-devsrc-1.0-
> > > r0.qemux86_64 from oe-repo
> > >   - nothing provides /usr/bin/make needed by kernel-devsrc-1.0-
> > > r0.qemux86_64 from oe-repo
> > >
> > > Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> > > ---
> > >  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > index ce5777fbe9..222f6cf8e1 100644
> > > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > @@ -395,7 +395,9 @@ RDEPENDS:${PN} +=3D "${@bb.utils.contains('ARCH',
> > > 'x86', 'elfutils-dev', '', d)}"
> > >  RDEPENDS:${PN} +=3D "${@bb.utils.contains('ARCH', 'powerpc',
> > > 'elfutils-dev', '', d)}"
> > >  # 5.8+ needs gcc-plugins libmpc-dev
> > >  RDEPENDS:${PN} +=3D "gcc-plugins libmpc-dev"
> > > -# 5.13+ needs awk for arm64
> > > -RDEPENDS:${PN}:append:aarch64 =3D " gawk"
> > > +# 5.13+ needs awk
> > > +RDEPENDS:${PN} +=3D "gawk"
> >
> > The commit message should really say "all architectures require
> > gawk", if this
> > is the change we are making to the actual RDEPENDS itself.
> >
> > >  # 5.13+ needs grep for powerpc
> > >  RDEPENDS:${PN}:append:powerpc =3D " grep"
> > > +# 6.6+ needs make for debian package rules
> > > +RDEPENDS:${PN} +=3D "make"
> >
> > Similarly, we should just be removing the rules from devsrc if they
> > aren't required
> > and we can avoid this dependency.
> >
> > Bruce
> >
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#194584):
> > > https://lists.openembedded.org/g/openembedded-core/message/194584
> > > Mute This Topic:
> > > https://lists.openembedded.org/mt/104095126/1050810
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub [
> > > bruce.ashfield@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

