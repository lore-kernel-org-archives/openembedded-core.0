Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B867E106ACCD
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:44:13 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.257.1773333849958229103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dXLODfER;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7991d890ebbso12974477b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773333849; cv=none;
        d=google.com; s=arc-20240605;
        b=DDqRh+lwSwjvCuQISOZfVjfTCRXaBXId/KLVwO1YyCKnaJqYbx8uR+7+VUnBafEDEJ
         uajZ1wo8gS4RGcqn8Rbki+YDC8kNcicOP8/HI0mc4tdPBSvmhsyToUrQJ3Y1LH2FX/FM
         LEu95W3lmLB4aDQwe3ksuOIvYp92GlGQ8796pE8YpdPrgICTtKh6dlM0Gd0dvb3unlaC
         Ovl0T2UdjvNK7f5CTAiAK6NGv5JdqjXQypOo/pF90EWroEt0wRdNLS+cJ6yA+ToIX8O+
         ow/TrRh4zFHesY1vu1v8x3v9+rZ96ZsJnXvo+smDIULXf73v0UjIoD/NHKtwelLucsZ+
         uOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruFpro2UljXMX4SX00fWHJmI/AlyI00umJYcK2lOUPo=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=Vrygz6MpVpwTGr1EzwS6zUJfMqYSG6i7MjHO6E4jH38K7f6SANew3ZgC5N4mzzyRay
         v1JXeMwsXseLymbOdVl6vMEXC6LdZhM7vNWeWHzRtJB05spi2jAG5aA+hfdwW+vqTfA5
         xtW1My6rt7WpF2dVxD01+mIVBEPFR+MvhKMONxVanV8GX6EFfQ/EWqDUMFvBuX31kHAu
         L4xZKsqf6IXSVSbUuDfaqK78Y2QreO6BMCsX8VzL+Adb63t+pGO0GelXPXdSyQ45g4oO
         ujmOZ9KWuPfSqiJGmI8NBDFitV8AMQ85/73hT2C2ldbu117+7sN2i8FKgHPiFhjNZBtm
         f0RQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773333849; x=1773938649; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruFpro2UljXMX4SX00fWHJmI/AlyI00umJYcK2lOUPo=;
        b=dXLODfERovzIepyBbzk93rwvBfYcZRIHKSPSi5TNJ2//x0VifqxrkBBl0a7Gxgmfpl
         lUQ3GafYgfL+De/R0gD7rsG6TFpOiUXBlWPDRIx4uz22FR6Hqxz959uIT7b08ipCLjrw
         9eefMXNy80+vy1WDCRwETBv6IPolUlJOEwzo/iv6spZMxRUwBGTbwDddVjQSNyAU/qa8
         zMIDqtC4ECvjXjLsNlHERFs5jM8F+Sjh+yWcRI974ZqfbLRl2qGo3XvYl8pVukgN+slu
         G74ap20rXyE3NE58cNzt+/2443nqs1wYBKfRiZsTeLri/DExzuDe93PQ/JNsiiy1t7eM
         yPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773333849; x=1773938649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruFpro2UljXMX4SX00fWHJmI/AlyI00umJYcK2lOUPo=;
        b=o9eHA+jt4fhFPYbMQ7vdHCA68oQU3rP9BesFyohcPXDYeiuLZljvAtdC/bR8cxDR/Z
         Sg4xjVaIq2JDpVl6zpi6jR1vpbZeo4Nhx2GYwPGA/3KWveZSfka25d2tdk8x7dCFoMi+
         gSY5x2PiWx2uQVm3e/+3fij26mjzNTnJw/YpFSD41CSfpdeZ1nv7biDtK+acmjI4XUjA
         rpKwoerKHmG0swfH5LUynOtBm7tzarp3fBRGZkOzz+vFfC6LwTZYlk1L3VpKx5OwzU1B
         0BR2oKaiJsDm7EwfdCps+qRLr/66Fiywmvg2uxCoWNA34zj6/G9E2REOh83MDPKbpW8N
         hNpQ==
X-Gm-Message-State: AOJu0YxrfZv7h4DJBPI2exYZd0rSFMnwDTWgBS8uJH1EX3kz6dY7U9/a
	swdtHRk2HoywgEVydXs3FwEc4kQyDmV7NdwPoNxW+na5Wi6W6ghVXr0pLczBxkYxf2fjAW9Fp+N
	mCTM2xtVBxfRPGgPH6uZEpeZ73IeG2U0=
X-Gm-Gg: ATEYQzxXZ7lytP5PIZ8lhBs2+RAHXlmT2p5w6URSktoD4pLyO02gBnZCqWD/csUdCKa
	jkfl10Bzz+1GxxRZabZ8yW4FsJvDUqSYuhO+dkg0KAroJozadoWWQdEgNYD7BOiQJnZYKEqpbqx
	SRjkm45xRxK1F9y3rcelvtehMJ3kt0w2T0mmRzLGQJlyYF0VkuX8JhDKP99csRzMuN32xEhju/0
	zPuybz42vwrDM9cFelKtnc8gnI3G7zkSSm5M7oSURX8Lw/Rx9DM+N9hXWwqL3q+ZKxLImC2rabw
	oG8JjAaJNiUKkGxA/ru0uX5m/VYr1jwR
X-Received: by 2002:a05:690c:3388:b0:794:cf56:5bc2 with SMTP id
 00721157ae682-79a1c23cefbmr2317457b3.59.1773333848903; Thu, 12 Mar 2026
 09:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <20260310184058.533343-11-JPEWhacker@gmail.com>
 <a437698a4d24a835440e282d0d744f5b3ff669a3.camel@linuxfoundation.org>
 <CAJdd5GYvTS71yZ7OfgH3d2Ouam8H-2y4hZmgJurLXC9t3CA9fg@mail.gmail.com>
 <c46dca246219768d5ecc515b904fbfc6053feab7.camel@linuxfoundation.org> <CAJdd5Gaz02WEo4a=OVVsFCRr7am5t30Nfv5Hd1L8+yX3gZboog@mail.gmail.com>
In-Reply-To: <CAJdd5Gaz02WEo4a=OVVsFCRr7am5t30Nfv5Hd1L8+yX3gZboog@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Mar 2026 10:43:57 -0600
X-Gm-Features: AaiRm53Qk377YP0goUHUrteYWifOXS7BjBv-rtf7kXhukxsG5dwNEeR78LKjhgE
Message-ID: <CAJdd5GbybqHSHR461E+KB81Z89xfSq2jb+bEOUG=33JhCrN=3A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 10/15] dummy-sdk-package: Disable SPDX
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232997

On Thu, Mar 12, 2026 at 10:06=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com>=
 wrote:
>
> On Thu, Mar 12, 2026 at 9:58=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2026-03-12 at 08:24 -0600, Joshua Watt wrote:
> > > On Thu, Mar 12, 2026 at 5:59=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedd=
ed.org wrote:
> > > > > The dummy SDK packages do not need SPDX support, and since they p=
lay
> > > > > some games with allarch that cause problems, it's simplest to dis=
able
> > > > > their SPDX output.
> > > > >
> > > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > > ---
> > > > >  meta/recipes-core/meta/dummy-sdk-package.inc | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/=
recipes-core/meta/dummy-sdk-package.inc
> > > > > index bf453cac9b..71e788b0b9 100644
> > > > > --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> > > > > +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> > > > > @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
> > > > >  PACKAGE_ARCH =3D "all"
> > > > >
> > > > >  inherit allarch
> > > > > +inherit nospdx
> > > > >
> > > > >  INHIBIT_DEFAULT_DEPS =3D "1"
> > > >
> > > > I know why you did this, but after thinking about this, I'm worried=
 and
> > > > I'm not sure this is the right move.
> > > >
> > > > The SDK dummy packages are "odd" but they are actual package files =
that
> > > > are generated and would be present in manifests and as such, if the=
y're
> > > > missing from the SPDX manifests and docs, this is going to raise
> > > > questions. I appreciate they don't have content and their main use =
is
> > > > their 'provides'.
> > > >
> > > > Taking a step back, we do support generic/multiple levels of packag=
e
> > > > arch and since we support that, the SPDX code does need to handle t=
hat
> > > > too. I'm therefore starting to worry that SPDX can't cope with the
> > > > multiple package levels. Can you remind me what the issue is with t=
he
> > > > "all" arch here?
> > >
> > > The problem is specifically the anonymous python that does:
> > >
> > >     d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
> > >
> > > Which seems specifically intended to bypass the allarch logic in a
> > > weird way. It's specifically doing this to put the package in a place
> > > no-one can find it (this includes SPDX); I didn't think it provided
> > > much value hence disabling it, but looking closer, I think we can do:
> > >
> > > SSTATE_MULTILIB_SSTATE_ARCHS:append =3D " ${SDK_PACKAGE_ARCH}"
> > >
> > > in create-spdx-sdk-3.0.bbclass and that should fix it. I'll try it.
> >
> > That code was to put these packages into their own separate feed.
> > Specifically:
> >
> > meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb:DUMMYARCH =3D=
 "buildtools-dummy-${SDKPKGSUFFIX}"
> > meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb:DUMMYARCH =3D "s=
dk-provides-dummy-${SDKPKGSUFFIX}"
> > meta/recipes-core/meta/dummy-sdk-package.inc:    d.setVar('PACKAGE_ARCH=
', '${DUMMYARCH}')
> > meta/recipes-core/meta/target-sdk-provides-dummy.bb:DUMMYARCH =3D "sdk-=
provides-dummy-target"
> >
> > so there are separate package feeds being created and then the SDK code
> > can select which package feeds it wants to use for a given
> > configuration/recipe.
> >
> > That isn't to bypass allarch but just to customise the end package feed
> > naming and allow different forms of SDK to be built by bringing in the
> > different package combinations.
> >
> > My worry is that the SPDX code isn't going to handle the scenario where
> > PACKAGE_ARCH is changed (for example for a specialist graphics stack)
> > and that one of our general features will be lost.
>
> Right, SPDX is (supposed) to do whatever sstate does, so if it works
> for sstate it works for SPDX. The problem isn't that this code does
> the arch changing (specifically), it's that it changes the arch to an
> arbitrary one that isn't part of the normal package search order (on
> purpose), and then expects everyone to manually add in that arch when
> they need the package (which, SPDX was _not_ doing but all of the
> other SDK code obviously is). I think my proposed fix is thus correct
> and I will test it which should cover this corner case.
>
> In general, I think most packages are handled correctly because again,
> SPDX does whatever sstate does, and SPDX even respects SSTATE_ARCHS
> which is how I think other recipes would deal with a similar
> situation. However, the SDKs are different specifically because they
> expect SDK_PACKAGE_ARCH to be respected by anything dealing with the
> sdk generation code, which is what was missing in SPDX.

Hang on, I think I'm getting this confused with a different problem.....

>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >

