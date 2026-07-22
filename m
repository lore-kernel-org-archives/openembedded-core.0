Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318C3C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:47:34 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47091.1784724444579432923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r4qx3oUN;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-80a123ef90aso83459997b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784724443; cv=none;
        d=google.com; s=arc-20260327;
        b=fap/yevUQOg2VZVRhUL15MQqCnQOT1dqbCgovwiI2L/pfy9JRNDVQGX7hivJ/Or884
         MT8Fi8YQFDeRG6pfk2pra7kUkRqF9oNPW+81E2jsOHasaW6dvBNHdHq65fmyvzvuQ+mR
         FYl/bQ/5propidxcimDay+1KrMmfgA0xtusuwaYJA5OnqlDh10QoaCVFNeA0oh4DG21n
         H9Kn4kHY3H0pcGg9GdBrSTyllKVW3tLAQBYdF/nZre3Ekul5LiIiWGlWaSJYkOSojZ0A
         VRAP+1r0/FMEoUhVmrrmY3A4VeUQ5hwyyZNvbW3Zm1HOcYzoDbVu3IkFvQt4cF35ICD7
         DXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rizAtWotj3tGdb6sVMsGTtVVUlrda3GFT5uHlDi1qJY=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=dj+3SLox5WyHh9kPiOXTY9Baym7lZ11Jrag5vKXhDNCzAJFZsqpUOF68S/scxe8ruQ
         0JdLUEEEqejQkllyIY4Oyk+ijTcOz2yzeAWTpAnVapC4A3wxINTY4ZWyg+prAnihdn96
         CXP16THxozFH6cA6WhEKatrtpUAw6zY3sbwIyds2Euf46WDdVSfU1n79QLqlUZ3Uzuqn
         OCbXDrYIExbyAeXAOzXdAm+8+2JhS74qrQ9NAiYTO9zvdVFcLoizXWAJW7zTmqfPUno5
         5a8d7GHyoPjKMBk+6OPpvXdedUX0D1JqyklgimRo0B09z5NxKqH2HTDgXfuWhD4S5qj+
         emYg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784724443; x=1785329243; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rizAtWotj3tGdb6sVMsGTtVVUlrda3GFT5uHlDi1qJY=;
        b=r4qx3oUNsvyhuYOazzpZo4Y0UYbh0I+lXtfBXqzLSE/7qUPokVMnwJ3X4ySSFQcfMU
         LNAHowSkCK1khrLkFWxK/ReoFD8VerA0eHTPSnwJsoBQ3kylSHbW2bHpIHqgfRRCRux1
         OzSrGCiD8PuDHltkTxx+35VWqRC7Gc8MAfnZn0liwSw+1UsUAz00HNJLQIbbcWbotBpE
         OvALgcazudYlJkY1WHb8iWn0VhwU5Hp+MoUHcbptcVz0NcP0CkHeKwTeu78HAgREsMhR
         ZQc7cWlypYlMLeyORDk8kCAgXYSDCRDDa9uWrg6tILUCO50TDxcMxfAhVnj0oXrdpDEr
         GdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724443; x=1785329243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rizAtWotj3tGdb6sVMsGTtVVUlrda3GFT5uHlDi1qJY=;
        b=hehEzyGcWB60pkDjkEHrfZ0NkycnlysuyS/UgpTJN2GG+NtzvKo6ahGM/3R1BvYRGI
         sCqZ2J0Tsxl0iCgn+QrRDH2W4EoVlM6DapH3TlVAsAMfJ/7/xFvywKUIDAlH5aZrJ/Gp
         ZPFgez6y9hG2ps8ZulVfk3GSBBrlI5EHYLy/mj134C8jKaTvD4VZaHY35YGjEgq7OpL5
         BjKBxoEBXh/vzExQr9EiOdEvy2k9fi8JRAoeeG4eeLNRyYomtkGtOqTGCRtpa9XhFHCv
         tas/Fa3cktdE3UFLmCozdUfRDQSSX5z7n4LnET1FzLyN3BfdtBK3ib4aPW0gqGBofdhp
         0Wwg==
X-Gm-Message-State: AOJu0Yzdnz/U6Dmxn4Y7vt7YTcgvSzyjNRksESrt7iGkzWtFNcJSI/Tq
	RDyKMXruthRFnd+hzM9+rIS26Mx75bsmszqJWQuPauKgRwLpDElKqqOAn1KoNjPZfT2tfPYlFMP
	ABaD9nGRDciZrPawY1wbofumGBup3OqUi4lKh
X-Gm-Gg: AR+sD11t0YJSuUUxhX8BDyyM+/iiduGbW8m3qf+YI+gvrbJtNDB8lR2rR2Auu+Nd/05
	M6LGgWXb/bZYWZm0e/E45tY//k/ar1h09Vx/A+wjKk9wQ2CSwWqUQP/iC3ilissY0v2Ki4TSlCz
	0WNlzY985Vp/06aMcOBTwsGhsxMr354gV4tY2MQzsm2osju7OxzlcSnh4FxwKwSh6i+qgAZbcig
	0/Zg0VF76/4U69VlTP62TRVbbvz42uHEbsXTzqbmgIeCGrDV5IP+476Y+/LJy0JAjT8dh+m9jDW
	LfKbwng7Nu7+JM6GfDLRZx+5aTSn1YCEymoob6aVjyEO4rCbLD8aK5RIUTAjLdyVP9MRCgPuwV6
	Jz7nq
X-Received: by 2002:a05:690c:3701:b0:81e:c95e:2be7 with SMTP id
 00721157ae682-81f339a06c4mr11988687b3.3.1784724443601; Wed, 22 Jul 2026
 05:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260722035139.1349872-1-bruce.ashfield@gmail.com>
 <20260722035139.1349872-2-bruce.ashfield@gmail.com> <e0b6b290108ede092a5601fb5b1e2dbc07891266.camel@linuxfoundation.org>
In-Reply-To: <e0b6b290108ede092a5601fb5b1e2dbc07891266.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Jul 2026 08:47:10 -0400
X-Gm-Features: AUfX_mzVi5ObZWvPspi05GfdUdLfFyNToqh4swIVA-txa7ukQnmphnGtonkjXpg
Message-ID: <CADkTA4PveJ1rptqQZz0tu83apEJ1fWiz88q_YAHntz2_JGiOWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] linux-yocto-dev: enable BSP config audit reporting
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241687

On Wed, Jul 22, 2026 at 2:49=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2026-07-21 at 23:51 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > linux-yocto-dev did not set KCONF_BSP_AUDIT_LEVEL, so it inherited the
> > kernel-yocto.bbclass default of 0. That silently suppresses the 'invali=
d
> > fragment elements' and 'redefinition' audit categories: do_kernel_confi=
gcheck
> > still runs and still writes .kernel-meta/cfg/{invalid,redefinition}.txt=
, but
> > nothing is ever reported to the user.
> >
> > This was hiding real breakage. Five config options removed upstream in =
v7.1
> > (CONFIG_HAMRADIO, CONFIG_CRYPTO_MICHAEL_MIC, CONFIG_ISDN, CONFIG_ISDN_C=
API,
> > CONFIG_NF_CT_PROTO_UDPLITE) sat stale in the kernel-cache fragments for=
 a
> > full release cycle without a single warning.
> >
> > The versioned recipes already set this (linux-yocto and linux-yocto-rt =
use
> > 1, linux-yocto-tiny uses 2); the dev recipe being the sole exception is
> > backwards, since the dev kernel tracks a moving upstream and is precise=
ly
> > where dropped symbols should surface first.
> >
> > Set it to 1 to match linux-yocto.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipe=
s-kernel/linux/linux-yocto-dev.bb
> > index f82f3c326b..ef6e1e0759 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > @@ -16,6 +16,7 @@ include recipes-kernel/linux/linux-yocto-dev-revision=
s.inc
> >
> >  KBRANCH =3D "v7.2/standard/base"
> >  KMETA =3D "kernel-meta"
> > +KCONF_BSP_AUDIT_LEVEL =3D "1"
>
>
> Should we change the default now this is well established?
>

I get enough complaints about the fragments and folks needing to inherit
kernel-yocto, etc, so I'd prefer to just keep the audit off and let them op=
t-in
so the default behaviour is as close to a "regular" kernel build as possibl=
e.

Bruce

> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

