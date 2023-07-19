Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4823DC001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:35:44 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.779.1689798934673039623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dxAinAOR;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b93fba1f62so492161fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689798933; x=1692390933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH4gPJSLlGazTheuHpCzmIEe36a1eym5vcAHZPBhzMg=;
        b=dxAinAORJFGSp1VQpsVxjj0nLpPtszjWdkUWAKAx//j8K0joa4aEW8SN+Z82FGWRTE
         deC0qCtS/cPifdqdNa5XiV/+Iz8fYmTFKPH6DSiLTbCpodA4//5ZAdaV17I9vCzXAYDC
         Q7fqn9L6WQkuy2mERKfJug+AOhqJpmqJsgUAVGYxBBqfogIk1CJROo3lFtivM7EVX/FL
         jv7F91qndThuI986bqGApgGOwMaRrK0mq6hXoOsia5Csp8GjIIelA4AtO8UHLgA2RyPY
         iHrQuoWiRN9IPu5yKTWwYhaH7d0Y4GYwCmiyY1sqT+4LmapSCmgJ2zycoLEW6hIircOQ
         jQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689798933; x=1692390933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NH4gPJSLlGazTheuHpCzmIEe36a1eym5vcAHZPBhzMg=;
        b=Cv8NKZVJ39jqFqy38Yzj/U84INhoDyucwrEw4EXApXl/rtGSHfXRQk+/veKizqsnXh
         mivwwPCyDXdnuLeSxEQHnhZrVyoRk7EnFT5eAufEpIY5TJFzEloqJKruNcjadXxk8QFe
         4WRmV48BhTPA8dYCglo6dKvFBVvz8AKN8IiE860da6HAn+RInZZdKcZLerEJDHAWE/z4
         7QrDgptVgmrE16TEl3eVKDykeusOPZRFYWvdc2rhngw8g1rj3prcDHyk9tpVnEHx5jRi
         44W2WV1wxOT+GupK62vnv7ILMAIe4Ti9/EtBjxB5AkR17JjmjWz8K6dpZ5Jwz5fh2o2U
         jpUQ==
X-Gm-Message-State: ABy/qLaCJ34sGGAqsVxI96lIwdYW/7MvRWR8D/jNDIBmM/tu1kHBr1L9
	GLw0zPfRsVPOwQECPg4od3z1bHN4+CyzHz+JNWg=
X-Google-Smtp-Source: APBJJlFU7+CBoolRFIssaNsNQiEUnW/fFG2OVGe0m4tWbHAze1ETOt2+Z3ifOo4l8f9p0tBZ3sea6HNb09cBrNdnJ04=
X-Received: by 2002:a2e:96d3:0:b0:2b7:a64:6c3e with SMTP id
 d19-20020a2e96d3000000b002b70a646c3emr729618ljj.26.1689798932547; Wed, 19 Jul
 2023 13:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230717143624.437293-1-richard.purdie@linuxfoundation.org>
 <CANNYZj-9u4gDwvjL8+9F8+GSJUqes45w-DMn-v2xvg3qaXRH5w@mail.gmail.com> <CAJdd5GakykM-7tv0FppDg7iSa3rwzCPbhhh1jR3zdYm1hm9QWA@mail.gmail.com>
In-Reply-To: <CAJdd5GakykM-7tv0FppDg7iSa3rwzCPbhhh1jR3zdYm1hm9QWA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jul 2023 22:35:24 +0200
Message-ID: <CANNYZj9fvRJWAB_jSpnqzx_wgzapANNdPMNCosqO3P6S-W+gpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner: Pull in parallel test fixes
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184610

Which newer commit, in which repo? I believe the latest SRCREV update
in oe-core master that landed 12 hours ago or so is what broke things.

Alex

On Wed, 19 Jul 2023 at 22:32, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> There is a newer commit that was merged to master just today; please
> see if that fixes it.
>
> On Wed, Jul 19, 2023 at 2:26=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Unfortunately this seems to once again have regressed glib/codegen
> > ptest (the test writes large amounts to stdout):
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15154
> >
> > I'll send a revert.
> >
> > Alex
> >
> > On Mon, 17 Jul 2023 at 16:36, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Pull in the commits:
> > >
> > >     Change test timeout to be total elapsed time
> > >     Report if child dies from a signal
> > >     Recreate pipe for each test
> > >     Revert "runner: Correctly handle running parallel tests"
> > >     runner: Correctly handle running parallel tests
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb =
b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > > index 6f3104499f2..77e2b94f376 100644
> > > --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > > +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > > @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.c=
gi/ptest-runner2/about/"
> > >  LICENSE =3D "GPL-2.0-or-later"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaaba=
a882bbe"
> > >
> > > -SRCREV =3D "8259375d306a8129f6c5d8528314496fc6ae1ca3"
> > > +SRCREV =3D "07d8a676aa962ecc5ec264ec33b0074adf2a8733"
> > >  PV .=3D "+git${SRCPV}"
> > >
> > >  SRC_URI =3D "git://git.yoctoproject.org/ptest-runner2;branch=3Dmaste=
r;protocol=3Dhttps \
> > > --
> > > 2.39.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#184473): https://lists.openembedded.org/g/openemb=
edded-core/message/184473
> > > Mute This Topic: https://lists.openembedded.org/mt/100195650/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

