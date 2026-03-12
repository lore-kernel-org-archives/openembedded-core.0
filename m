Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4572106ACE9
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 20:34:42 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147.1773347680236480112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 13:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ae4hRkf+;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a145bf7c1so10994347b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 13:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773347679; cv=none;
        d=google.com; s=arc-20240605;
        b=MdeBVSqHATAX4g4AhgOXG/jhp9nN7vjiN04nhAU0wczLnlvwdc1u3SHTu+jkFlr5PI
         lCGjjsEjildg13l2v5y/gJDNEFApGOpjYS7F7d6xy6YIxLfk8+oaBbA8He9OSj22ps3U
         80O2qMd3TP79FXRuKjxTQt4q7kpweMd4Wm4kQG5aXUIj9bIVpmhqIVacgoA/fgU71II1
         pE+I/k9KrAgAqEePBpKAGgjUrhNdOjFntolYzI3gPeuRGLEcSgwPL7nmwHlX5o41YO4/
         ypi8KVe/17wB5rDxErBWKytqTGegyit/G2dNry2KrZLW2yRhoa9mBI28PfhUDgSTRZ5Z
         uiAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AlBM1qy2VFRi9WYEjhkzPUCMNPG9GnUzv64vRyItfeA=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=Ns7DIQsqlfXXtGgeeBb5QnWSoQ0Eghpt+ZSntx+rMPMEeklNUR8T1pGLVzSURNviQT
         zVIgOayXXz28C3qMzblRkxzSgnBBGW1ReHl5gSGfVFqZUGZrxyur5rak6v4o2nkGhTCf
         /ksLP7DKjReXckjVZ25/jGdqaMsGGt2Uo1b4/yGlMC2a0LNI6eY2cMzbrFr38FKr5ovg
         mSh8ENTagLlEYYrfjQMiJrpDyPMkAF9as14iGuze5RF8iJIa9v5F62RwzgZR01MDyUOj
         4z3euIeD3JBTG7KVO/aNXAfhC257L9hzuV8QaW1ruCjeAUdS83LekwJK35qxyzFJp7ck
         qs3g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773347679; x=1773952479; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlBM1qy2VFRi9WYEjhkzPUCMNPG9GnUzv64vRyItfeA=;
        b=ae4hRkf+S7flj5NSNw0D7C8vdTeFzDzI0u1nwkBXdEzC/UlhbihQgEOsxzzhX+3fYZ
         kw2zvR/04fOk7QSWAFqmqmhV4JvBAGLnZWqb3/VA4kqp8Rx0l7YabYi6M06fkOsVd7Un
         MuoXddAEs+tnolTV/lda8v4FTxtFXBgP6veXSqAT/+Anhy93wfBbAkNRggAHhDTMyWRo
         4eO0IaGVO4Sh8+hvd7lX1v981QqbyEDUs3khxw8jRQYJcIpaUFm5leZS+fyw8oV3Z3Vd
         XolpMky9uCe0w2ykEy4c0H1UN9innvG3XED4VJfaE0zutPPCFS0hSz7aUDp/AQoTB7m+
         Kc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773347679; x=1773952479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlBM1qy2VFRi9WYEjhkzPUCMNPG9GnUzv64vRyItfeA=;
        b=kLAYHVBBsZyTOCj5Vzt5PjKf5uIsfdrsWC8dHl6Tjn6Q4R8CdlCdUUhZ7EX10f4KIk
         gqfeQ5YPbQeGOzkvWXV0gXmndFnEclTWv0CJLDEi7u/FOtf1J8fJVpYEwN/dLjOc90LJ
         8wE2cF5Efj14z0FbGZsFxRrwGNJ8AFTDK3Q8ubjAq4/axXMUEXsbtPKu5g7ThIJMXXhz
         NIJW6wpi7SaJu6Ov8IfMMAfcP4U6fUnmQ/7CB4ddHZlBIwg/6u0Csw5CrsBZ6Un1XYiE
         bol9FDBRPf9hFSZI9+L/uJVUdpgSjE8smMSmOGntnN+O3xZUKvcNXRZg5NIrk2KXyJdm
         YU1Q==
X-Gm-Message-State: AOJu0YweJLsTv4bkPiGP0LvjgRyASX7YJRiKZV/bxJ+FW5tWkcnHfd62
	J247nhLuZmeXRBzsXtxJpNEsMUd6hNuoZagIj1SSrjYVqCo+8QlFO+hcgCmmXrXcCqVYJYpbAAt
	iy2cN2wdFE74i0bFPl+qDxBKD9Ww3T4LcpmTT
X-Gm-Gg: ATEYQzy5poRE9Wezh8FWDARP5xSWi3BEk0F5Ll3yXOjybBKPtzaQaLnXZuHwCwAjb6E
	o7YjbrIMUR7O7Vn3rl5cXkxp32rSCqbO+qXF1wBesDdCzgdTi/vONf/vHOPdyBPoOsucdZsp1b+
	ZODYPocfURlDTps/mpa3kAaOLcGu+pxdm/UeVCXxSHX9NX1J/Inq0i354VlnwBZCqtMC5Rj/H/R
	gcBO+NEbmVX47pDNZWRwTLM4iItQMiInAqIAvX5X/971oZhb4x9rfV/tt22Q5u3/X5eJ9iAO9cl
	B+kL9X2pgi4qTFYq/bjvnQ==
X-Received: by 2002:a05:690c:e3c1:b0:799:125a:1b85 with SMTP id
 00721157ae682-79a1c1d8653mr10312867b3.49.1773347679232; Thu, 12 Mar 2026
 13:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <20260310184058.533343-11-JPEWhacker@gmail.com>
 <a437698a4d24a835440e282d0d744f5b3ff669a3.camel@linuxfoundation.org>
 <CAJdd5GYvTS71yZ7OfgH3d2Ouam8H-2y4hZmgJurLXC9t3CA9fg@mail.gmail.com>
 <c46dca246219768d5ecc515b904fbfc6053feab7.camel@linuxfoundation.org>
 <CAJdd5Gaz02WEo4a=OVVsFCRr7am5t30Nfv5Hd1L8+yX3gZboog@mail.gmail.com>
 <CAJdd5GbybqHSHR461E+KB81Z89xfSq2jb+bEOUG=33JhCrN=3A@mail.gmail.com> <CAJdd5Gbb+T2Vg_KY8gdH=nur=tKUJk=Jv5hGdzWYe0101u_uSw@mail.gmail.com>
In-Reply-To: <CAJdd5Gbb+T2Vg_KY8gdH=nur=tKUJk=Jv5hGdzWYe0101u_uSw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Mar 2026 14:34:28 -0600
X-Gm-Features: AaiRm52RPjI3IfteGU3DkUBv3tFmvIWrfM1ct8wy3epeZWx-NJ5czJEh83dlxyc
Message-ID: <CAJdd5Gbj8CKFrdtBT8eU_Qk-qhi-s8abKjmcuUtphTQNjCe9EA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 10/15] dummy-sdk-package: Disable SPDX
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 20:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233004

On Thu, Mar 12, 2026 at 12:02=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com>=
 wrote:
>
> On Thu, Mar 12, 2026 at 10:43=E2=80=AFAM Joshua Watt <jpewhacker@gmail.co=
m> wrote:
> >
> > On Thu, Mar 12, 2026 at 10:06=E2=80=AFAM Joshua Watt <jpewhacker@gmail.=
com> wrote:
> > >
> > > On Thu, Mar 12, 2026 at 9:58=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, 2026-03-12 at 08:24 -0600, Joshua Watt wrote:
> > > > > On Thu, Mar 12, 2026 at 5:59=E2=80=AFAM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openem=
bedded.org wrote:
> > > > > > > The dummy SDK packages do not need SPDX support, and since th=
ey play
> > > > > > > some games with allarch that cause problems, it's simplest to=
 disable
> > > > > > > their SPDX output.
> > > > > > >
> > > > > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > > > > ---
> > > > > > >  meta/recipes-core/meta/dummy-sdk-package.inc | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > >
> > > > > > > diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/m=
eta/recipes-core/meta/dummy-sdk-package.inc
> > > > > > > index bf453cac9b..71e788b0b9 100644
> > > > > > > --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> > > > > > > +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> > > > > > > @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
> > > > > > >  PACKAGE_ARCH =3D "all"
> > > > > > >
> > > > > > >  inherit allarch
> > > > > > > +inherit nospdx
> > > > > > >
> > > > > > >  INHIBIT_DEFAULT_DEPS =3D "1"
> > > > > >
> > > > > > I know why you did this, but after thinking about this, I'm wor=
ried and
> > > > > > I'm not sure this is the right move.
> > > > > >
> > > > > > The SDK dummy packages are "odd" but they are actual package fi=
les that
> > > > > > are generated and would be present in manifests and as such, if=
 they're
> > > > > > missing from the SPDX manifests and docs, this is going to rais=
e
> > > > > > questions. I appreciate they don't have content and their main =
use is
> > > > > > their 'provides'.
> > > > > >
> > > > > > Taking a step back, we do support generic/multiple levels of pa=
ckage
> > > > > > arch and since we support that, the SPDX code does need to hand=
le that
> > > > > > too. I'm therefore starting to worry that SPDX can't cope with =
the
> > > > > > multiple package levels. Can you remind me what the issue is wi=
th the
> > > > > > "all" arch here?
> > > > >
> > > > > The problem is specifically the anonymous python that does:
> > > > >
> > > > >     d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
> > > > >
> > > > > Which seems specifically intended to bypass the allarch logic in =
a
> > > > > weird way. It's specifically doing this to put the package in a p=
lace
> > > > > no-one can find it (this includes SPDX); I didn't think it provid=
ed
> > > > > much value hence disabling it, but looking closer, I think we can=
 do:
> > > > >
> > > > > SSTATE_MULTILIB_SSTATE_ARCHS:append =3D " ${SDK_PACKAGE_ARCH}"
> > > > >
> > > > > in create-spdx-sdk-3.0.bbclass and that should fix it. I'll try i=
t.
> > > >
> > > > That code was to put these packages into their own separate feed.
> > > > Specifically:
> > > >
> > > > meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb:DUMMYARCH=
 =3D "buildtools-dummy-${SDKPKGSUFFIX}"
> > > > meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb:DUMMYARCH =
=3D "sdk-provides-dummy-${SDKPKGSUFFIX}"
> > > > meta/recipes-core/meta/dummy-sdk-package.inc:    d.setVar('PACKAGE_=
ARCH', '${DUMMYARCH}')
> > > > meta/recipes-core/meta/target-sdk-provides-dummy.bb:DUMMYARCH =3D "=
sdk-provides-dummy-target"
> > > >
> > > > so there are separate package feeds being created and then the SDK =
code
> > > > can select which package feeds it wants to use for a given
> > > > configuration/recipe.
> > > >
> > > > That isn't to bypass allarch but just to customise the end package =
feed
> > > > naming and allow different forms of SDK to be built by bringing in =
the
> > > > different package combinations.
> > > >
> > > > My worry is that the SPDX code isn't going to handle the scenario w=
here
> > > > PACKAGE_ARCH is changed (for example for a specialist graphics stac=
k)
> > > > and that one of our general features will be lost.
> > >
> > > Right, SPDX is (supposed) to do whatever sstate does, so if it works
> > > for sstate it works for SPDX. The problem isn't that this code does
> > > the arch changing (specifically), it's that it changes the arch to an
> > > arbitrary one that isn't part of the normal package search order (on
> > > purpose), and then expects everyone to manually add in that arch when
> > > they need the package (which, SPDX was _not_ doing but all of the
> > > other SDK code obviously is). I think my proposed fix is thus correct
> > > and I will test it which should cover this corner case.
> > >
> > > In general, I think most packages are handled correctly because again=
,
> > > SPDX does whatever sstate does, and SPDX even respects SSTATE_ARCHS
> > > which is how I think other recipes would deal with a similar
> > > situation. However, the SDKs are different specifically because they
> > > expect SDK_PACKAGE_ARCH to be respected by anything dealing with the
> > > sdk generation code, which is what was missing in SPDX.
> >
> > Hang on, I think I'm getting this confused with a different problem....=
.
>
> Ok, I remember this one correctly now (who needs AI to
> hallucinate....). I think the correct thing to do here is to add:
>
> do_create_recipe_spdx[vardeps] +=3D "PACKAGE_ARCH"
>
> because it's not rebuilding when this recipe changes PACKAGE_ARCH. The
> other SPDX tasks are because of an implicit dependency on PACKAGE_ARCH
> that re-triggers them. In the back of my mind I seem to recall we
> maybe didn't want to do this for some reason, but PACKAGE_ARCH isn't
> in BB_*_IGNORE_VARS so maybe I'm just mis-remembering.
>
> Anyway, if this fix seems correct I'll make it.

After trying this it doesn't work either. I'll write down my analysis
of why and maybe we can figure it out:

First of all, the SPDX code writes out SPDX files based on their
SSTATE_PKGARCH (which is why I say SPDX behaves like sstate). This was
done back in 2023 [1]. SSTATE_PKGARCH is in BB_HASHEXCLUDE_COMMON, so
changes in SSTATE_PKGARCH do not cause SPDX code to rebuild; I think
this is intentional, but I'm not sure.

nativesdk-sdk-provides-dummy sets `PACKAGE_ARCH =3D "all"` and inherits
allarch, but in sstate.bbclass, there is this:

    elif bb.data.inherits_class('nativesdk', d):
        d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${SDK_OS}"))

So, SSTATE_PKGARCH is set to "${SDK_ARCH}_${SDK_OS}"

After this, the anon python in dummy-sdk-package.inc set PACKAGE_ARCH
to ${DUMMYARCH}, which in this case is always
"sdk-provides-dummy-nativesdk" -- FWIW, this really wants to look like
the culprit but actually is irrelevant to the problem.

Now, the problem is that there is nothing to retrigger running
do_create_recipe_spdx() when SDKMACHINE changes. This task (on
purpose) has pretty minimal dependencies, but specifically nothing
related to SDKMACHINE changing re-triggers this task. Thus consider
the following command sequence which will trigger the bug (with a
clean tmp dir):

SDKMACHINE=3Dx86_64 bitbake nativesdk-sdk-provides-dummy &&
SDKMACHINE=3Di686 bitbake -fc create_spdx nativesdk-provided-dummy

In this case, the first command runs and puts the
nativesdk-sdk-provides-dummy do_create_recipe_spdx files in
"${SDK_ARCH}_${SDK_OS}" ("x86_64_linux"). The second command reruns
do_create_spdx, but because SDKMACHINE doesn't factor into the
taskhash of do_create_recipe_spdx, it does not rerun that task,
assuming it's fine. Now, do_create_spdx cannot find the required SPDX
file, because "x86_64_linux" is not in sstate search path
(SSTATE_ARCHS) anymore.

Maybe allarch.bbclass and nativesdk.bbclass just don't interact well
(esp. when sstate.bbclass appears to be making some assumptions about
those two)? I did some digging and there are not many other recipes
that inherit both allarch and nativesdk, however the other one I found
was ca-certificates, and indeed it has the same error when building
nativesdk-ca-certificates and switching SDKMACHINE.

I'm at a loss for where the actual bug is here. If it's true that SPDX
should be using SSTATE_PKGARCH, I cannot see what it's doing wrong
here (as I said, it more or less just copies what sstate does).

I'm kinda surprised we don't have other sstate problems with this
recipe, given all of this, but maybe sstate isn't hard failing on
missing files.

[1]: b2db10e966 ("create-spdx/sbom: Ensure files don't overlap between
machines")

>
>
> >
> > >
> > > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >
> > > >
> > > >
> > > >

