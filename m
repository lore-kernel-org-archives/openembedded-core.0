Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF4DC02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 07:23:11 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.25231.1739690590630755155
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 23:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fRgGy4xS;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54527a7270eso2173437e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 23:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739690589; x=1740295389; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCPIPBn9Mkz7D9pe8qhvVD3PyYXU2/Do/yJ7qNSDOVc=;
        b=fRgGy4xSa3Q1bYxolm5gFNZprg+Nb+hzltAxVC6GArEi+3o6VX1vn1gEfKrbFlWsVi
         wq1BKIHGyc0CP9Ha2N7JJ6eyT1nobTpbwvfJs0uzjJKjK8YsCD+KzRXlkDRE8vLLZeAj
         GhI7aYFgAgWmz7gcD0hLizsbBOcE2A4UzVVWDh42cnobK2U4jHeDeZ6QXn66VbDESrIV
         eALLITDOjHFX9nGtPPcPP6Xg+hpF+u+qCLWYOql6LsQWRgGLRAjMIo8BRssRZGUk0AHe
         UHyJSZumu0pmSpYtivlSZVCn5/0WFvMsG6/Yrc7tbLSfCV9JwjnvMOsCRQFRK8Wpveqo
         nKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739690589; x=1740295389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCPIPBn9Mkz7D9pe8qhvVD3PyYXU2/Do/yJ7qNSDOVc=;
        b=SwqbJFgbwWozIrMTelP9qKgFR0r70Dd63zWUXbmKp7wIpi8STAt+CCHdzgE2PrXbIK
         ZmYQlIMOGPutYu5CzDj11OaiNkpjZRLKjBbdDzf37oE1TqoAqMCyTCpIn8UAGnKfnlzt
         D7N8D54X/QpOocfSBB37d2A6SoGC7TDTaC1FOeT3FoMPMjZvr+TU5rkWGFXCuTZT2kZW
         5q53B3zmsOXSCnl9N3iFgDvHW7k7XwGcNwrORE+15dyw8mtIOGI+0DPokQ7r/GPWnyfu
         seK3GNPIPGYprDPLRSPZnOkfRmGe386ejrEaMbcLEGjJvQSbsJlb/jB6vQ7Vgv+0L6Yy
         VNQw==
X-Gm-Message-State: AOJu0YyXPqdrEqcEJNSs7CLcOaQuMNpLAdklmceSaPZAlqnu/i2GZSgN
	uRoBgsG1LCrFSyjsE9q0Y8jgIElIgoDx/hIB9Hx0xrv4h8DCuooM57i90+l64lUx2OfEAcds+xA
	m8+aNIfrre1R3OYhqKrNrsBbDfZc=
X-Gm-Gg: ASbGncvrIe/DC5SKcMharup0UmF9gChqN78FrqzI+Thk7k3fZNuJ1BwXiU35DkHuJnx
	q8m2oK9dU9lT8Owgkd1/hY4EdOMy0cpydaAPdsE1roSCauKAgGJjiTgay/8kRHgJBhpBfgiL1ta
	AowU8=
X-Google-Smtp-Source: AGHT+IGXZUfKLyJ5jQ3aOiiRcjaFUXnHWD5LvLZzL7ExeP79zbrHlL22YC9BZ+YqGEpVDfQiDXTYcXDls8XRFly3nI8=
X-Received: by 2002:a05:6512:ba6:b0:545:271d:f8e with SMTP id
 2adb3069b0e04-5452fe6533fmr1340969e87.29.1739690588368; Sat, 15 Feb 2025
 23:23:08 -0800 (PST)
MIME-Version: 1.0
References: <20250215150516.1168-1-alex.kiernan@gmail.com> <CAMKF1so-xu31Hi-EFhX8WfLNP0vpp=4zJLFDWwwMbtTACaCGtw@mail.gmail.com>
In-Reply-To: <CAMKF1so-xu31Hi-EFhX8WfLNP0vpp=4zJLFDWwwMbtTACaCGtw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 16 Feb 2025 07:22:57 +0000
X-Gm-Features: AWEUYZkODkgB5SmKAWII67bKRFRLhAkOYtXyw4ICHN9EKXKTIW36ZnROMw1CTM0
Message-ID: <CAO5Uq5SSuEaEu451qx7JqTDPxScJ4qjaeW5ddSHi+RDgGeD1gQ@mail.gmail.com>
Subject: Re: [OE-Core] packagegroup-base: Add option to set zeroconf provider
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 07:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211497

On Sun, Feb 16, 2025 at 2:04=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sat, Feb 15, 2025 at 7:06=E2=80=AFAM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > avahi, systemd-resolved and mDNSResponder (in meta-networking) can all
> > provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> > which of these will provide service via packagegroup-base-zeroconf.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  meta/recipes-core/packagegroups/packagegroup-base.bb | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/met=
a/recipes-core/packagegroups/packagegroup-base.bb
> > index cb9d1f07af51..c172250a4322 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > @@ -312,11 +312,14 @@ RDEPENDS:packagegroup-base-nfs =3D "\
> >  RRECOMMENDS:packagegroup-base-nfs =3D "\
> >      kernel-module-nfs "
> >
> > +# Choose 'avahi-daemon', 'mdns' or 'systemd-resolved' as zeroconf-daem=
on
> > +ZEROCONF_DAEMON ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'system=
d-resolved', 'systemd-resolved', 'avahi-daemon', d)}"
>
> are these distro features new? if so we need to document them as well
>

I have a doc patch for ZEROCONF_DAEMON, never quite sure how to order
things between the repos. `systemd-resolved` is an existing,
documented distro feature.

> >  SUMMARY:packagegroup-base-zeroconf =3D "Zeroconf support"
> >  RDEPENDS:packagegroup-base-zeroconf =3D "\
> > -    avahi-daemon"
> > +    ${@ '' if d.getVar('ZEROCONF_DAEMON') =3D=3D 'systemd-resolved' el=
se d.getVar('ZEROCONF_DAEMON')} \
> > +    "
> >  RDEPENDS:packagegroup-base-zeroconf:append:libc-glibc =3D "\
> > -    libnss-mdns \
> > +    ${@bb.utils.contains('ZEROCONF_DAEMON', 'systemd-resolved', '', 'l=
ibnss-mdns', d)} \
> >      "
> >
> >  SUMMARY:packagegroup-base-ipv6 =3D "IPv6 support"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#211488): https://lists.openembedded.org/g/openembed=
ded-core/message/211488
> > Mute This Topic: https://lists.openembedded.org/mt/111200541/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Alex Kiernan

