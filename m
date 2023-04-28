Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E6DC77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 07:58:06 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.14188.1682668685594446546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 00:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DT8blyRk;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2a8b1b51dbdso91351081fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 00:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682668684; x=1685260684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1xe6wr99/P4YdSV6s0kKA09ZgkhQDsZ2ey43aVaqk4=;
        b=DT8blyRkcxOiXJAejApqQJfDovFx1RZuDrTM3HDuzDofWdmxbtd/NezQyn8AxC+Wiq
         Cc16PhwOkLbS8cpmVGJNrlk8ogC3R7UspILpW5lF+gRHoSGsZdB0WXDLxLotTTZf8/a/
         dgs1YWEkZmo7qwHSOX9VHi+vvy8VTKTEZrQzygVohVkmNJNRnc7osyLRKPZdWYweDYtn
         x89Yl4WzBdx8v/S9w/uqHNGbaL38fX6GnAo8vHQMX0Jj82yXhqGbDwQP1T0slTGDo6J+
         5sEHVYZ9CW098lxFbLjtM878BSf5fj0ua5yWhix5Pd7EOpHe+yjm+thPaty8kt12DIUK
         4gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682668684; x=1685260684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1xe6wr99/P4YdSV6s0kKA09ZgkhQDsZ2ey43aVaqk4=;
        b=fcR3IliAL7kimfaBM5IrrJzwI4PUqOl48tr1Goh9IdpnB3BsoMu4IdCiseobtZjbDo
         t9iCVF+FtVbnrU2eXleEtOC3KK8ToDjVZRqWpLKewY6jVfLlw8oj+HDGmhyIMCn6iuol
         IcWZaLeBZexegkd2s7up5g5j2vsY+s4QSPcUd+i2ByvRaAabHJfUMy28wp1iC0Jj+nKa
         BOcH5fE0G8+rrC1/DB3HMETLHlJuaMVzW4nOomS7IGO8bvrWAJ4jDkAh/CtCht5R1khZ
         XDH3NEnCYvv4G2kfr+++d+lmmOBIcl5hNCTizaPx8cyXN4JQJbWvs+5gu5xxBKmamEp+
         GKmw==
X-Gm-Message-State: AC+VfDw3jhAVVZexYBRIVL6vSB3AcpGpAog/wIXSibe0VUWN/ayzvRg/
	i0VFHRKCfM7+Wv7g8srDmdaSYguoqFYtfMEORlU=
X-Google-Smtp-Source: ACHHUZ61HOiVkYa0nK+kdPbPl2GiCREETxZ5+xOxJlC5fKAHwWSYvbaCJp7WzudmfONiE1XEYPNPD4peQzVsg4I+GNo=
X-Received: by 2002:a2e:b687:0:b0:2a8:ea1e:bdf4 with SMTP id
 l7-20020a2eb687000000b002a8ea1ebdf4mr1397155ljo.52.1682668683533; Fri, 28 Apr
 2023 00:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-11-alex@linutronix.de>
 <CAMKF1sqY5MDSWV9WDbeFa=O4fA8a7-SzST8ji_jGZEd2GHoQAg@mail.gmail.com> <175A0763DEAA3E73.26969@lists.openembedded.org>
In-Reply-To: <175A0763DEAA3E73.26969@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Apr 2023 09:57:52 +0200
Message-ID: <CANNYZj8sGXn6TY_FdMM08jDtEJVsCQBcyF6rRxO_uh7UFOmeaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/11] insane.bbclass: enable 32 bit time API
 check on affected architectures
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 07:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180509

Come to think of it, let's downgrade this check to WARN_QA. It's not a
critical error, not yet :)

Alex

On Fri, 28 Apr 2023 at 09:05, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> They all need INSANE_SKIP =3D "32bit-time".
>
> I'll send patches.
>
> Alex
>
> On Fri, 28 Apr 2023 at 05:20, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I see this error triggering for meta-openembedded builds
> >
> > qemuarm - https://errors.yoctoproject.org/Errors/Build/163136/
> >
> > On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  meta/classes-global/insane.bbclass | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global=
/insane.bbclass
> > > index 8788f58fc5b..38126d89a58 100644
> > > --- a/meta/classes-global/insane.bbclass
> > > +++ b/meta/classes-global/insane.bbclass
> > > @@ -44,7 +44,7 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-fil=
es arch pkgconfig la \
> > >              already-stripped installed-vs-shipped ldflags compile-ho=
st-path \
> > >              install-host-path pn-overrides unknown-configure-option =
\
> > >              useless-rpaths rpaths staticdev empty-dirs \
> > > -            patch-fuzz patch-status-core\
> > > +            patch-fuzz patch-status-core 32bit-time \
> > >              "
> > >  # Add usrmerge QA check based on distro feature
> > >  ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmer=
ge', ' usrmerge', '', d)}"
> > > @@ -512,6 +512,11 @@ def check_32bit_symbols(path, packagename, d, el=
f, messages):
> > >      """
> > >      Check that ELF files do not use any 32 bit time APIs from glibc.
> > >      """
> > > +    thirtytwo_bit_time_archs =3D set(('arm','armeb','mipsarcho32','p=
owerpc','x86'))
> > > +    overrides =3D set(d.getVar('OVERRIDES').split(':'))
> > > +    if not(thirtytwo_bit_time_archs & overrides):
> > > +        return
> > > +
> > >      import re
> > >      # This list is manually constructed by searching the image folde=
r of the
> > >      # glibc recipe for __USE_TIME_BITS64.  There is no good way to d=
o this
> > > --
> > > 2.30.2
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180508): https://lists.openembedded.org/g/openembedde=
d-core/message/180508
> Mute This Topic: https://lists.openembedded.org/mt/98511413/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

