Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31AAC77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 07:05:36 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.13608.1682665535860138932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 00:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nHNkrQql;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4ec8149907aso10457907e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682665534; x=1685257534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1WSFcOO/YUvpM7cnJMEHkDgOskNlyUvJYpm/IRvTG0=;
        b=nHNkrQql6XNf+iNuGxK+vrk3n0RwWkiDosV8TvNpiLdTKxbI+XsZf3dXM1rm0EpyzI
         ndjomiFus+MR8t2ItYeO4/i53z7lG8y3zqOInTllkcXbIifqZbvQ58MBRYp9wQnCam+t
         oH+PwufDdLzSv7M4gdoSM50jvUSKYBKWl7xYDNDnOn1ZTvL42QmmFzINB2OCBqCgUOQx
         aDUjMbzGGYZOkbRAOoKhOQicEmAcU6kw+fM+vcnqFYY1w5WW8pZmM2ezduSBYY/i9fgT
         /cFE2o0eZe0z74lf1ucY3Hx1OMRFhAvNqQYnT8MWxBJAHgEeHnItsDk4akoStMtbn/0X
         DY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682665534; x=1685257534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1WSFcOO/YUvpM7cnJMEHkDgOskNlyUvJYpm/IRvTG0=;
        b=M/icOAgWapBF8VJ7r+2ja709ZYBd9bgnBhMyH7nW91DqnaG1/c6kBLSFiD/i9vZcvn
         pGM5odCmmzxdR8Eg3Wu3Tsy6HnmThDVaeIEVntJvZ51Mr+tsGyag2PtUUCJUHpLBvEKH
         oMft24NwAEtcEJAZklbYjK7RV6QCMku630Vm8PcHpYFD0kRdAJoYbd16Yt9GTd54gHRG
         D1GInKtT7Rw7hYGrXyRW6s83DiF/PqKTtiNAVnPqv6+hfG8Wm1OIJB6yDWNyKtpxw+OT
         wW8cOObOzUtWbHeEkaS7p+NDbTndaWOn2bwQ8/aoT8COfYZfh9OW9NtYkrn91JfIlJea
         PBOA==
X-Gm-Message-State: AC+VfDynbgry1VLtlaZ0sT7f9f1wGSlyPIUvX9MuIc/JRHRiDkJ4S225
	HtBVM5qlIlwTPR4WgOad3GrpoeKTbDHYupM0TwI=
X-Google-Smtp-Source: ACHHUZ6d4CZilhF6zG1/V6V4ZUN1PuNaxj+Ms03irKuhEEddf0HV+vuElz1Ud/aQ9AxNI0pnLPHyDOo8Bl4DScwMf/w=
X-Received: by 2002:a05:6512:98b:b0:4ef:b18c:89b1 with SMTP id
 w11-20020a056512098b00b004efb18c89b1mr1239422lft.63.1682665533867; Fri, 28
 Apr 2023 00:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-11-alex@linutronix.de>
 <CAMKF1sqY5MDSWV9WDbeFa=O4fA8a7-SzST8ji_jGZEd2GHoQAg@mail.gmail.com>
In-Reply-To: <CAMKF1sqY5MDSWV9WDbeFa=O4fA8a7-SzST8ji_jGZEd2GHoQAg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Apr 2023 09:05:22 +0200
Message-ID: <CANNYZj9oR+GXg2jzHQXSNgFZ9_NcT57CzyyBHokP0kRr=PYOYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/11] insane.bbclass: enable 32 bit time API
 check on affected architectures
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 07:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180508

They all need INSANE_SKIP =3D "32bit-time".

I'll send patches.

Alex

On Fri, 28 Apr 2023 at 05:20, Khem Raj <raj.khem@gmail.com> wrote:
>
> I see this error triggering for meta-openembedded builds
>
> qemuarm - https://errors.yoctoproject.org/Errors/Build/163136/
>
> On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes-global/insane.bbclass | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/i=
nsane.bbclass
> > index 8788f58fc5b..38126d89a58 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -44,7 +44,7 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files=
 arch pkgconfig la \
> >              already-stripped installed-vs-shipped ldflags compile-host=
-path \
> >              install-host-path pn-overrides unknown-configure-option \
> >              useless-rpaths rpaths staticdev empty-dirs \
> > -            patch-fuzz patch-status-core\
> > +            patch-fuzz patch-status-core 32bit-time \
> >              "
> >  # Add usrmerge QA check based on distro feature
> >  ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge=
', ' usrmerge', '', d)}"
> > @@ -512,6 +512,11 @@ def check_32bit_symbols(path, packagename, d, elf,=
 messages):
> >      """
> >      Check that ELF files do not use any 32 bit time APIs from glibc.
> >      """
> > +    thirtytwo_bit_time_archs =3D set(('arm','armeb','mipsarcho32','pow=
erpc','x86'))
> > +    overrides =3D set(d.getVar('OVERRIDES').split(':'))
> > +    if not(thirtytwo_bit_time_archs & overrides):
> > +        return
> > +
> >      import re
> >      # This list is manually constructed by searching the image folder =
of the
> >      # glibc recipe for __USE_TIME_BITS64.  There is no good way to do =
this
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180429): https://lists.openembedded.org/g/openembed=
ded-core/message/180429
> > Mute This Topic: https://lists.openembedded.org/mt/98511413/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

