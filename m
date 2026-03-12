Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA9B106ACC2
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:06:33 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25543.1773331587619438560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXgJvpIv;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79628fb5c05so10162427b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773331587; cv=none;
        d=google.com; s=arc-20240605;
        b=R5knC8IpQXP05s+ZmO/0eOQN2X3O2QHTj1MhefEwZk4/W0a6eZx6SEA0zPrC4tG+Qk
         RmHdc7FsKPBWxIKPfHD93Y8+wfOjfrhvBvT62Td6GIQxHQxrF+hLVQkU/d2irUh/y8aX
         QVMUK5DqMsaLLorMwaGjyOIxL/udrCWT+gWvvaCPUXCiqT0dSEObg0zoUcATqPDHUUPl
         8Uh2xkTQHXX7cxIC2VunInu5RekO97RsrEBFoDmplo5SPxCklCoGOmV5BNbBNPNpNl47
         3FPIurkDwUHhHNV9bZT6E10ZX5ysxZcacw8LViiC8ZHUTdnrTRRQ6HD6aXAmvaSrBSMu
         sZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cobl8Qq+NULJWXe8BJ7FUOti3I9tQOpy5EQEDpYG0do=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=kCYE70xLey8dVQ9Cak2WpUNNO69jDhi0FA8wd4ztVJshKs5s+lb9jWyaFLMWZaSaJY
         cBi92pyxotOS2uhICmQjLfYWy3MV+MygEIRShh+lBNN+cdRyLxSKlvpNeQQRWdhyADil
         NE9c1T2byyMBJhQoKEi5Y4R72T/xRel0XCvU45YgeAh6dQkBQU7yGB4Q2X4eceHNfLZo
         s+a3PsIkf2cZWRcRXf0gOata0SjmlewAnna/FpHw3yhSKhRwrfVhphHxQ07+1iE6mk4N
         Ewp+1DOzWk50t2OkCBI5Yyzmbn58C3Wk8ygBI529iBhKLiNamNY7rPLbItA6IipMkbZg
         Olug==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773331587; x=1773936387; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cobl8Qq+NULJWXe8BJ7FUOti3I9tQOpy5EQEDpYG0do=;
        b=fXgJvpIvFtdmW3w2nNnBEYWB7G1RrX7lGW3Ov583Frt/2hePg2ubvAKznqYAB6FLZh
         aK29mMdSGTNmWtL+EHIhfwun8Ev+oTyJKjM0vczCCDw5Dk6xg+WPeVRQATZEqAPPZZ7W
         tQG7gAAtRHszFoUu5y6jgfZnda0WV27kpJO/SLyYWDG+nSk1u6w90JbZyRsVnjpU274c
         HjJ8wBOIP8u3Cy0D4Myn8mjFFgld35r3Kv1R0oaF/cG+mfDCYfQBQkF3Jwxk3YXqj4Uh
         QEh9YOlxfmCWViT62l/GHOjvhcB7/r6kXuOKBPpvIm89FWcmWu4Ur98+4ZbtWvNvRhDQ
         uAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331587; x=1773936387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cobl8Qq+NULJWXe8BJ7FUOti3I9tQOpy5EQEDpYG0do=;
        b=sJCo+O57X8gZ79wVh83WD3uC6Ar18LKPO2ucbSJTdI15t6YGL3xyQ/MIgU67wXow0H
         Ycv8VMqVVz635oDMULvLcmgJ/gQy/TrRxO9Y+y8SZCBqJHtS1/Z4NQofQNXWsdQuJQU1
         AuYPR2LaSHkAWxDUQfQLOhu+UFiMQqGnTpMiKNT629gtlQ3a0QdhUnOFa5cekXMRgUV+
         Xo4XZgh2IsF736rh2O3siuKsMnMsFiuB9DwkAY68nQuExQvOsXMHAh/QvqxiD65lMh9M
         md189ec+LwfHAmOkftWYFo1m2mGRw9MqAue3cGSzQ438mQjFZyI1cNsDOj/84aKVtW8u
         oQSQ==
X-Gm-Message-State: AOJu0YwHHPQFVdBtiOCcYy8LsQbzFyIq/JXWD4sPMuojG1ne+oYdN+Aw
	za0ASWPZW4m/CYtI1X8Ac5ana+s5qyn2hme8EUqWCB6uhOvaWaoyH7Y+zxybfkVr/ufN3ZS0K4a
	Tw7KTNZ2STl2VOzQ7zIOy6S+3aKnVlB8=
X-Gm-Gg: ATEYQzwmU6T/jJcAKW1EFXsenCWTE8BiFQVUXx0rIK/jhTTSUfW69R1l12nh+JziI9x
	EX0R66Eh3Ea4FvfrPQEVSeafTJuCITELw1ex0OWcDX4u9CRaKWAvZZR4MGNOo5I3W/dR131Fxn0
	fVku3xGYhT2F1XTI/1RamljjsUuaJQYbyEzxjbV8bQahfk0GY8qtUdnOtSxaTq3sD+PnPWUGlEq
	dhNeu8ZTOW2ocuXdS3PD2Rq2CNssVVyLRzYLWCsyT97+kYq3dBwdRwjuCZo+lqB7x+Rfp8LgwyP
	jVT5Ar9ldvTzox6rE/p6cQ==
X-Received: by 2002:a05:690c:c1d5:b0:798:711f:a0a5 with SMTP id
 00721157ae682-79a1c10febemr817357b3.29.1773331586611; Thu, 12 Mar 2026
 09:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <20260310184058.533343-11-JPEWhacker@gmail.com>
 <a437698a4d24a835440e282d0d744f5b3ff669a3.camel@linuxfoundation.org>
 <CAJdd5GYvTS71yZ7OfgH3d2Ouam8H-2y4hZmgJurLXC9t3CA9fg@mail.gmail.com> <c46dca246219768d5ecc515b904fbfc6053feab7.camel@linuxfoundation.org>
In-Reply-To: <c46dca246219768d5ecc515b904fbfc6053feab7.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Mar 2026 10:06:14 -0600
X-Gm-Features: AaiRm51klgtcXlevNI-Bx47NxmZWbqo1Suev4j1BCD-s-GoUlipYjqbEhVukaZg
Message-ID: <CAJdd5Gaz02WEo4a=OVVsFCRr7am5t30Nfv5Hd1L8+yX3gZboog@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 10/15] dummy-sdk-package: Disable SPDX
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232986

On Thu, Mar 12, 2026 at 9:58=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2026-03-12 at 08:24 -0600, Joshua Watt wrote:
> > On Thu, Mar 12, 2026 at 5:59=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded=
.org wrote:
> > > > The dummy SDK packages do not need SPDX support, and since they pla=
y
> > > > some games with allarch that cause problems, it's simplest to disab=
le
> > > > their SPDX output.
> > > >
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >  meta/recipes-core/meta/dummy-sdk-package.inc | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/re=
cipes-core/meta/dummy-sdk-package.inc
> > > > index bf453cac9b..71e788b0b9 100644
> > > > --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> > > > +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> > > > @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
> > > >  PACKAGE_ARCH =3D "all"
> > > >
> > > >  inherit allarch
> > > > +inherit nospdx
> > > >
> > > >  INHIBIT_DEFAULT_DEPS =3D "1"
> > >
> > > I know why you did this, but after thinking about this, I'm worried a=
nd
> > > I'm not sure this is the right move.
> > >
> > > The SDK dummy packages are "odd" but they are actual package files th=
at
> > > are generated and would be present in manifests and as such, if they'=
re
> > > missing from the SPDX manifests and docs, this is going to raise
> > > questions. I appreciate they don't have content and their main use is
> > > their 'provides'.
> > >
> > > Taking a step back, we do support generic/multiple levels of package
> > > arch and since we support that, the SPDX code does need to handle tha=
t
> > > too. I'm therefore starting to worry that SPDX can't cope with the
> > > multiple package levels. Can you remind me what the issue is with the
> > > "all" arch here?
> >
> > The problem is specifically the anonymous python that does:
> >
> >     d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
> >
> > Which seems specifically intended to bypass the allarch logic in a
> > weird way. It's specifically doing this to put the package in a place
> > no-one can find it (this includes SPDX); I didn't think it provided
> > much value hence disabling it, but looking closer, I think we can do:
> >
> > SSTATE_MULTILIB_SSTATE_ARCHS:append =3D " ${SDK_PACKAGE_ARCH}"
> >
> > in create-spdx-sdk-3.0.bbclass and that should fix it. I'll try it.
>
> That code was to put these packages into their own separate feed.
> Specifically:
>
> meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb:DUMMYARCH =3D "=
buildtools-dummy-${SDKPKGSUFFIX}"
> meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb:DUMMYARCH =3D "sdk=
-provides-dummy-${SDKPKGSUFFIX}"
> meta/recipes-core/meta/dummy-sdk-package.inc:    d.setVar('PACKAGE_ARCH',=
 '${DUMMYARCH}')
> meta/recipes-core/meta/target-sdk-provides-dummy.bb:DUMMYARCH =3D "sdk-pr=
ovides-dummy-target"
>
> so there are separate package feeds being created and then the SDK code
> can select which package feeds it wants to use for a given
> configuration/recipe.
>
> That isn't to bypass allarch but just to customise the end package feed
> naming and allow different forms of SDK to be built by bringing in the
> different package combinations.
>
> My worry is that the SPDX code isn't going to handle the scenario where
> PACKAGE_ARCH is changed (for example for a specialist graphics stack)
> and that one of our general features will be lost.

Right, SPDX is (supposed) to do whatever sstate does, so if it works
for sstate it works for SPDX. The problem isn't that this code does
the arch changing (specifically), it's that it changes the arch to an
arbitrary one that isn't part of the normal package search order (on
purpose), and then expects everyone to manually add in that arch when
they need the package (which, SPDX was _not_ doing but all of the
other SDK code obviously is). I think my proposed fix is thus correct
and I will test it which should cover this corner case.

In general, I think most packages are handled correctly because again,
SPDX does whatever sstate does, and SPDX even respects SSTATE_ARCHS
which is how I think other recipes would deal with a similar
situation. However, the SDKs are different specifically because they
expect SDK_PACKAGE_ARCH to be respected by anything dealing with the
sdk generation code, which is what was missing in SPDX.

>
> Cheers,
>
> Richard
>
>
>
>

