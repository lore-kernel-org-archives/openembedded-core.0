Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50862EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 08:19:04 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.3789.1688026735453911588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 01:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=ZuVu1nV5;
 spf=pass (domain: smile.fr, ip: 209.85.208.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51d80d81d6eso476834a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 01:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1688026734; x=1690618734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsGDt9b9EB9pWYttRft2humdZNlUY0tdNRKCuZkOP7c=;
        b=ZuVu1nV5Egwyf+OTkoyzf4kERMIw7iXNQRTiDrfwlPFIRlj8VqbcYqy3u70+nCMcxZ
         8hy5TFpTELRJi3+bl/WyiFbbRtazTItLlPQThuejeGGDXl551sx/8p5flSR+JmMg2rRo
         zj3mgkqYmRtmfDB0fzmywS8qPcvmGbDl7sPIHzCRVm2QK98Dyj5J6LtBLIt60YP3goMD
         K6F+Ptua27wKCI/+wQQcdD/zWlFZFpIs+IbQgSlLhmlMi1JvkihP4N28WkIedXCo0fWJ
         lOqmP3xy9PhiI9/p4oelyOAgwT8IeLb+e4nA+UzzaLYzzzX1kcsr1XTdCf1Sm84iK/MB
         AY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688026734; x=1690618734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsGDt9b9EB9pWYttRft2humdZNlUY0tdNRKCuZkOP7c=;
        b=HUpGCxTI15am8Gxvp+ADYk5800NM6dDSvaK7+Z1TBiarHnDJUWCNSh9DhVcoGU39sl
         HMYf5KIJwIxO+8qj3pNq/OXJYG9Xt+e6eKjsfICFUtuSgwrc3USZSeO1WcJZkrSRBfLC
         x9G6aVPRitXS1+hAvvpJTSwjwhqpvX85p0nYvt5IpmSZG7CpG+o0njPvHIZuxmJaUH/U
         zhR/3ytummIeYGBifMerM3EL3JdI0DSK4H8XkvsVDSUS+V6+fULjcxgY1X9JNxdVVfuS
         Xjw831YUhLXfHjs1LIP2ZeEzEWmPr/1pZ0I/ignyRQrdQixLRXfmdGVZeZHqmB4VMldQ
         KT0A==
X-Gm-Message-State: AC+VfDyXvboRARf2Z7IdolIFiRHucoLZ2PJVAnHzS9ais0jvhGfBhKpf
	HSbTfd2lSpwAEhdGQuInibULsY6deNHK3sgQ19kFTQ==
X-Google-Smtp-Source: ACHHUZ7DYWW5dMtt38NCTrjFkiMJdld4ftGT/dhjPqmT7/KmumlCIKwIf2QIbJ9XOCVON4QTuLXi+f8oqoEjpy2ZPpY=
X-Received: by 2002:aa7:ca55:0:b0:51d:9e0c:1396 with SMTP id
 j21-20020aa7ca55000000b0051d9e0c1396mr6300712edt.35.1688026733633; Thu, 29
 Jun 2023 01:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230628070939.1298739-1-yoann.congal@smile.fr> <213c079050886cbd2e74fa048b83b0d36e5c82f4.camel@linuxfoundation.org>
In-Reply-To: <213c079050886cbd2e74fa048b83b0d36e5c82f4.camel@linuxfoundation.org>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Thu, 29 Jun 2023 10:18:27 +0200
Message-ID: <CAMSfU+5wJtO_JARqLorXFsor8S7OAzzDLs1ux35O2X3pts8RXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/devtool: add unit test for
 "devtool add -b"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Fawzi KHABER <fawzi.khaber@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 08:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183609

Le mer. 28 juin 2023 =C3=A0 21:47, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Wed, 2023-06-28 at 09:09 +0200, Yoann Congal wrote:
> > From: Fawzi KHABER <fawzi.khaber@smile.fr>
> >
> > Fix [Yocto #15085]
> >
> > Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  meta/lib/oeqa/selftest/cases/devtool.py | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/se=
lftest/cases/devtool.py
> > index 4c8e375d00..c5ed8f5720 100644
> > --- a/meta/lib/oeqa/selftest/cases/devtool.py
> > +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> > @@ -366,6 +366,29 @@ class DevtoolAddTests(DevtoolBase):
> >              bindir =3D bindir[1:]
> >          self.assertTrue(os.path.isfile(os.path.join(installdir, bindir=
, 'pv')), 'pv binary not found in D')
> >
> > +    def test_devtool_add_binary(self):
> > +        # Test "devtool add -b" with an arbitrary binary package from =
Yocto mirrors
> > +        pn =3D 'pvr-bin-cdv-devel'
> > +        pv =3D '1.0.3-1.1'
> > +        url =3D 'http://downloads.yoctoproject.org/mirror/sources/pvr-=
bin-cdv-devel-1.0.3-1.1.i586.rpm'
> > +
> > +        self.track_for_cleanup(self.workspacedir)
> > +        self.add_command_to_tearDown('bitbake -c cleansstate %s' % pn)
> > +        self.add_command_to_tearDown('bitbake-layers remove-layer */wo=
rkspace')
> > +
> > +        # Test devtool add -b
> > +        result =3D runCmd('devtool add  -b %s %s' % (pn, url))
> > +        self.assertExists(os.path.join(self.workspacedir, 'conf', 'lay=
er.conf'), 'Workspace directory not created')
> > +
> > +        # Test devtool build
> > +        result =3D runCmd('devtool build %s' % pn)
> > +        bb_vars =3D get_bb_vars(['D', 'bindir'], pn)
> > +        installdir =3D bb_vars['D']
> > +        self.assertTrue(installdir, 'Could not query installdir variab=
le')
> > +
> > +        # Check that a known file from the binary package has indeed b=
een installed
> > +        self.assertTrue(os.path.isfile(os.path.join(installdir, 'usr',=
 'include', 'EGL', 'egl.h')), 'egl.h not found in D')
> > +
> >      def test_devtool_add_git_local(self):
> >          # We need dbus built so that DEPENDS recognition works
> >          bitbake('dbus')
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5437/st=
eps/14/logs/stdio
>
> There are systems where rpm doesn't exist so the test can fail?

Yeah you are right !
I need to find a binary package available from yocto mirrors that can
be extracted with HOSTTOOLS.
If I can't find this, I'll build the binary package directly in the test.

I will send a v2.

Regards,
--=20
Yoann Congal
Smile ECS - Tech expert

