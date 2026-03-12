Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11D1106ACD6
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 18:02:22 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.951.1773338534318137390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 11:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iDXLZKTy;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c9707fc11so1062332d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 11:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773338533; cv=none;
        d=google.com; s=arc-20240605;
        b=ALp16JhUNRXSHAIjlgaDwLIIyu0ucuS8ZdVcfNwDUz0YjvRNfwtn6W5fky72ld10C4
         OCBD+5/4bCZxI6tqgl6cHYJxYmMM/tPgLyzwsLg8GM6rwK1LwEtr4IrwIbL0YkZAwx/u
         1MqezTvLrEbBriP3hM4DeLIA5dQR5QOC4wIoM1YHho1kj7kOHtZoKBUG7/W70hnoV3H9
         yzdoYn04oHdpT2OlXRjPqDmdH5pPYWA4+9M+0i4AXWp10puWPw+Q1btUQN7pWKDn4WdW
         v0d7g9U2dyUtQ98VJxVL7BkjqKZIMPWe6JQjRt/1xdImaVFnQv2KPwcpOPX6Wyx3hSzC
         +O/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/K6kRkVcuOBT3T8M1xSgCE20/MsaKmdb9p3B3U3p5hY=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=hl/737K18fI2mn7bj8HmauizqixCc2xX4UFex2z8WEVrrshB1oNuIOUx4sqAY0XoYi
         4Z3vOPtFAnPxXjPnFV61BagUA8+BdFHX7a0dpPmp4zjLoJRvCH38dbDqmbImOuE3ELjy
         HdSG7Ofo9PUDJM/0avZ2QMRGMJmLLPA6bGqt+xSbkTYdtRmWpAOBvQl+klk1e+0h/1EB
         2nW9wH2iFRjLBqXQneIgoIApblQgloGwX+2cSteJjR4ccAfJcjYYPa8GgNX0cv9d5fMo
         JAG/t0GgiWbPeI22gmi0em1dJ9VU6mTi36X3ty76FIKIjzPMxkeKKIIgujB5HW7xZ8Tb
         C8+A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773338533; x=1773943333; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/K6kRkVcuOBT3T8M1xSgCE20/MsaKmdb9p3B3U3p5hY=;
        b=iDXLZKTyFwCf5cY77IROqnQWg0YJfEeTmhDUwqbhA6fhAVRQxWpeNRAKHq23anUanQ
         lIKHFAAwzHHL7Mzz9FC2/Aus5L4U95tqog8mR0gYjEInvZeJgrGGymeY3hWgy3HWJ/np
         KPuyXJgOoPMboTD2OM/6/DxZIFJlwAXN6kd6OPwIffjgqLG+WTH29U0Y5DMf+5PVvxXz
         HaOvpyhrt9BcpFXjb+ztsBPM//5xUjwRcSrp+dvrEfhF9gTIyvhxqRLOkYZ/ekNWMuEo
         mtw0cZe6Y8kXsGdumblB2ev8+4Bsf4t0WBVVNj63D9dC/34uJBgMc7vKo5b5gXYeJWyb
         M9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773338533; x=1773943333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/K6kRkVcuOBT3T8M1xSgCE20/MsaKmdb9p3B3U3p5hY=;
        b=nIVqDoLmCsPGjhgZn1PPzW4y/B6SXLgMqnW/2R9j3Bac8kqU3E+JZGc4/XYg1Qj9Jj
         Q4r2xAU3/smVO8UhrjSXJ9KleN/v7iB/ZRkP9A25QJOEY/2+r7HF8GZtq92HvMnKU2wz
         MWV8cE1QTEl+OHr4sMHwrc3uMBKll4ZE7x/CJWZaRFbcc98R/0okOBx8VeRuBNEy8VTR
         h3E3OZBoreY2Xc0OVPyBINxHSFPoC/NnVxLaesN5OGYyqwgMzKM9+2kT3KZCI3YLRUab
         7pf1vlmbDDBwEKIpQrdgHYcasmEj2/Yd+YLu9JDc6v5a63yl4EUqrTH3hYerclVfKWms
         4HMQ==
X-Gm-Message-State: AOJu0Yx9QLseXpzcbXp93gq/DeHv/GrHDoeXLNkP9tenOg8nu0WlMeiW
	Vu0DjCglIaBEtBStqVULoQIwc44k3IAmYODOUaRLrInRR51c7eWxxkTEd7yEzcVISASFa+1aAwK
	daaa/wHsYzoeGiDXAahzOjTG2hNIJlEU=
X-Gm-Gg: ATEYQzw2ttm1OnkIH31pOSYmniRo4VEBLdIxHZvc+RA9Hio9dT7kGlZ7qV3ec8ANgEH
	mbTvvuP5tV5KxJ/bywbm3ASAadhMfbYCjHn+vpx8iUDU3VFdrpCT5PhLXHTvHyhL+4cjD50/0kt
	BP9qLnurFKGY0cHrTnqi5y8Wroo5kSBqSvzBzekAAy+0KnnRYJz3XBVcJV5+9Qgcq/JJNxCdTn/
	7IJwJAkuxaaf3xr6EucoEwgnnqtyOKlSI0QIKbevw5EKRxMFWJBNUknuS6qMjFzbb1f/R0J31mr
	+Z4aXHSaFPllpDHpZ1EmdQ==
X-Received: by 2002:a05:690e:42c1:b0:64c:bfd0:ad6f with SMTP id
 956f58d0204a3-64e62fa057dmr377482d50.33.1773338532450; Thu, 12 Mar 2026
 11:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <20260310184058.533343-11-JPEWhacker@gmail.com>
 <a437698a4d24a835440e282d0d744f5b3ff669a3.camel@linuxfoundation.org>
 <CAJdd5GYvTS71yZ7OfgH3d2Ouam8H-2y4hZmgJurLXC9t3CA9fg@mail.gmail.com>
 <c46dca246219768d5ecc515b904fbfc6053feab7.camel@linuxfoundation.org>
 <CAJdd5Gaz02WEo4a=OVVsFCRr7am5t30Nfv5Hd1L8+yX3gZboog@mail.gmail.com> <CAJdd5GbybqHSHR461E+KB81Z89xfSq2jb+bEOUG=33JhCrN=3A@mail.gmail.com>
In-Reply-To: <CAJdd5GbybqHSHR461E+KB81Z89xfSq2jb+bEOUG=33JhCrN=3A@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Mar 2026 12:02:01 -0600
X-Gm-Features: AaiRm50FDmSnurjzG9PJxKpLQh6q5ooqQBnxdSafWTUYESq1Sw1FoScIhdlq1FE
Message-ID: <CAJdd5Gbb+T2Vg_KY8gdH=nur=tKUJk=Jv5hGdzWYe0101u_uSw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 10/15] dummy-sdk-package: Disable SPDX
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 18:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232999

On Thu, Mar 12, 2026 at 10:43=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com>=
 wrote:
>
> On Thu, Mar 12, 2026 at 10:06=E2=80=AFAM Joshua Watt <jpewhacker@gmail.co=
m> wrote:
> >
> > On Thu, Mar 12, 2026 at 9:58=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2026-03-12 at 08:24 -0600, Joshua Watt wrote:
> > > > On Thu, Mar 12, 2026 at 5:59=E2=80=AFAM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembe=
dded.org wrote:
> > > > > > The dummy SDK packages do not need SPDX support, and since they=
 play
> > > > > > some games with allarch that cause problems, it's simplest to d=
isable
> > > > > > their SPDX output.
> > > > > >
> > > > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > > > ---
> > > > > >  meta/recipes-core/meta/dummy-sdk-package.inc | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/met=
a/recipes-core/meta/dummy-sdk-package.inc
> > > > > > index bf453cac9b..71e788b0b9 100644
> > > > > > --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> > > > > > +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> > > > > > @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
> > > > > >  PACKAGE_ARCH =3D "all"
> > > > > >
> > > > > >  inherit allarch
> > > > > > +inherit nospdx
> > > > > >
> > > > > >  INHIBIT_DEFAULT_DEPS =3D "1"
> > > > >
> > > > > I know why you did this, but after thinking about this, I'm worri=
ed and
> > > > > I'm not sure this is the right move.
> > > > >
> > > > > The SDK dummy packages are "odd" but they are actual package file=
s that
> > > > > are generated and would be present in manifests and as such, if t=
hey're
> > > > > missing from the SPDX manifests and docs, this is going to raise
> > > > > questions. I appreciate they don't have content and their main us=
e is
> > > > > their 'provides'.
> > > > >
> > > > > Taking a step back, we do support generic/multiple levels of pack=
age
> > > > > arch and since we support that, the SPDX code does need to handle=
 that
> > > > > too. I'm therefore starting to worry that SPDX can't cope with th=
e
> > > > > multiple package levels. Can you remind me what the issue is with=
 the
> > > > > "all" arch here?
> > > >
> > > > The problem is specifically the anonymous python that does:
> > > >
> > > >     d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
> > > >
> > > > Which seems specifically intended to bypass the allarch logic in a
> > > > weird way. It's specifically doing this to put the package in a pla=
ce
> > > > no-one can find it (this includes SPDX); I didn't think it provided
> > > > much value hence disabling it, but looking closer, I think we can d=
o:
> > > >
> > > > SSTATE_MULTILIB_SSTATE_ARCHS:append =3D " ${SDK_PACKAGE_ARCH}"
> > > >
> > > > in create-spdx-sdk-3.0.bbclass and that should fix it. I'll try it.
> > >
> > > That code was to put these packages into their own separate feed.
> > > Specifically:
> > >
> > > meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb:DUMMYARCH =
=3D "buildtools-dummy-${SDKPKGSUFFIX}"
> > > meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb:DUMMYARCH =3D =
"sdk-provides-dummy-${SDKPKGSUFFIX}"
> > > meta/recipes-core/meta/dummy-sdk-package.inc:    d.setVar('PACKAGE_AR=
CH', '${DUMMYARCH}')
> > > meta/recipes-core/meta/target-sdk-provides-dummy.bb:DUMMYARCH =3D "sd=
k-provides-dummy-target"
> > >
> > > so there are separate package feeds being created and then the SDK co=
de
> > > can select which package feeds it wants to use for a given
> > > configuration/recipe.
> > >
> > > That isn't to bypass allarch but just to customise the end package fe=
ed
> > > naming and allow different forms of SDK to be built by bringing in th=
e
> > > different package combinations.
> > >
> > > My worry is that the SPDX code isn't going to handle the scenario whe=
re
> > > PACKAGE_ARCH is changed (for example for a specialist graphics stack)
> > > and that one of our general features will be lost.
> >
> > Right, SPDX is (supposed) to do whatever sstate does, so if it works
> > for sstate it works for SPDX. The problem isn't that this code does
> > the arch changing (specifically), it's that it changes the arch to an
> > arbitrary one that isn't part of the normal package search order (on
> > purpose), and then expects everyone to manually add in that arch when
> > they need the package (which, SPDX was _not_ doing but all of the
> > other SDK code obviously is). I think my proposed fix is thus correct
> > and I will test it which should cover this corner case.
> >
> > In general, I think most packages are handled correctly because again,
> > SPDX does whatever sstate does, and SPDX even respects SSTATE_ARCHS
> > which is how I think other recipes would deal with a similar
> > situation. However, the SDKs are different specifically because they
> > expect SDK_PACKAGE_ARCH to be respected by anything dealing with the
> > sdk generation code, which is what was missing in SPDX.
>
> Hang on, I think I'm getting this confused with a different problem.....

Ok, I remember this one correctly now (who needs AI to
hallucinate....). I think the correct thing to do here is to add:

do_create_recipe_spdx[vardeps] +=3D "PACKAGE_ARCH"

because it's not rebuilding when this recipe changes PACKAGE_ARCH. The
other SPDX tasks are because of an implicit dependency on PACKAGE_ARCH
that re-triggers them. In the back of my mind I seem to recall we
maybe didn't want to do this for some reason, but PACKAGE_ARCH isn't
in BB_*_IGNORE_VARS so maybe I'm just mis-remembering.

Anyway, if this fix seems correct I'll make it.


>
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > >

