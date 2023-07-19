Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3596CC001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:48:14 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.967.1689799689521838870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RCYQ5+XR;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b8390003e2so785171fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 13:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689799687; x=1692391687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywppqxTqdEqMGpzmWzOEMhk1gmv/63WvJIP/RVa10CM=;
        b=RCYQ5+XRwCKPEIelbreNxyvBBNof19yiAu6Nr+EL3xmoe2ehwrVdLmcwxEodj+Ld0m
         EDTOp8s+iEkAmNKoZjBg5EWsxNZWbGZHYrPDo9IY3osHHamI/hy+jUMYWjz6VMWlTV81
         VA3SzyDJVMOTDZPpI1TTrXuhamBrzgNCvevlyyJYo2f/35rlmsGkTT5yPBP7RXAmaoaw
         asCK8o3sEkjCbyqmT4DWA2sC/qlwRBbDx0oZCuoYFi/gFzNdFFPEIlB+OAB8ByKLFS3L
         /N1gFIb/NEti9xCpZmp8Cv2j+4fDygsOVnHCkz3k8qhLfZQ6dcItYnFPo5Dvn+X06Oeq
         mSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689799687; x=1692391687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywppqxTqdEqMGpzmWzOEMhk1gmv/63WvJIP/RVa10CM=;
        b=das3Ef1Z3hdUzt2ooz/x4E6c46vrwhpC5ntPOUB7r77IJ6famuvyapXHcoFSDbcijf
         DGKjPsQybrE8AW/Au3m6J7hmON+rVYqxjk9AMizaS6YDusCEPVWu09sacZlZgt2D0JEW
         XI887muxIlaIpxs3ZIAsr1ZqJVTv6U4eqEHBl4+k1Xf6kT+Y4B8QdY69WL3uU8ViMEcv
         nRQVGm0ZbxrUDFF4dLUrIXrI5CzTTXDLJwOXgxHMwIWJ1WFRTIte/5DJyula/suBTEDy
         hQRw0P6d97Wj0Al+YQcF79RsI4AYbIaZyv5IswREql43z3OxF576hdpqt5cnjqGJIl4d
         YI7g==
X-Gm-Message-State: ABy/qLZ8oWexE+4MUVq4gOe2TNfS/ATwqON/XB1LGHulConeTToPzEn+
	4qc8AGu3o/ariYY+WL4MtJc/MLVjfNyuL3bE7frazNDPRfs=
X-Google-Smtp-Source: APBJJlHn3lKw9tkeaVaFcPUlYCmomNp/vWFdHhTfMkObFcnUh3QZ4jx1aib3I+7iDaOvzM+iE8TMMjTYG3Y6AWSycuM=
X-Received: by 2002:a2e:6814:0:b0:2b6:da64:734f with SMTP id
 c20-20020a2e6814000000b002b6da64734fmr827696lja.47.1689799687320; Wed, 19 Jul
 2023 13:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230717143624.437293-1-richard.purdie@linuxfoundation.org>
 <CANNYZj-9u4gDwvjL8+9F8+GSJUqes45w-DMn-v2xvg3qaXRH5w@mail.gmail.com>
 <CAJdd5GakykM-7tv0FppDg7iSa3rwzCPbhhh1jR3zdYm1hm9QWA@mail.gmail.com>
 <CANNYZj9fvRJWAB_jSpnqzx_wgzapANNdPMNCosqO3P6S-W+gpQ@mail.gmail.com> <CAJdd5Gav=2bCyhLEF8kREWVMhhePJOru322b2-gXHGK6U4sK1g@mail.gmail.com>
In-Reply-To: <CAJdd5Gav=2bCyhLEF8kREWVMhhePJOru322b2-gXHGK6U4sK1g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jul 2023 22:47:59 +0200
Message-ID: <CANNYZj-bHhOpyvoEUXmJSDfSRqW1DBbRadHcRxQpjiJqKJnPTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner: Pull in parallel test fixes
To: Joshua Watt <jpewhacker@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184613

No, indeed they're all obsolete. They were added to the ticket today,
so I assumed they're fresh failures. Ignore the revert then, sorry for
hasty blaming.

Alex

On Wed, 19 Jul 2023 at 22:44, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Do you have a recent log of a failure? All the ones in the ticket
> buildbot says are from a month ago (or, maybe that's just a quirk of
> buildbot?)
>
> On Wed, Jul 19, 2023 at 2:35=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Which newer commit, in which repo? I believe the latest SRCREV update
> > in oe-core master that landed 12 hours ago or so is what broke things.
> >
> > Alex
> >
> > On Wed, 19 Jul 2023 at 22:32, Joshua Watt <jpewhacker@gmail.com> wrote:
> > >
> > > There is a newer commit that was merged to master just today; please
> > > see if that fixes it.
> > >
> > > On Wed, Jul 19, 2023 at 2:26=E2=80=AFPM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Unfortunately this seems to once again have regressed glib/codegen
> > > > ptest (the test writes large amounts to stdout):
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15154
> > > >
> > > > I'll send a revert.
> > > >
> > > > Alex
> > > >
> > > > On Mon, 17 Jul 2023 at 16:36, Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > Pull in the commits:
> > > > >
> > > > >     Change test timeout to be total elapsed time
> > > > >     Report if child dies from a signal
> > > > >     Recreate pipe for each test
> > > > >     Revert "runner: Correctly handle running parallel tests"
> > > > >     runner: Correctly handle running parallel tests
> > > > >
> > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org=
>
> > > > > ---
> > > > >  meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2=
.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > > > > index 6f3104499f2..77e2b94f376 100644
> > > > > --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > > > > +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > > > > @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cg=
it.cgi/ptest-runner2/about/"
> > > > >  LICENSE =3D "GPL-2.0-or-later"
> > > > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7ab=
aabaa882bbe"
> > > > >
> > > > > -SRCREV =3D "8259375d306a8129f6c5d8528314496fc6ae1ca3"
> > > > > +SRCREV =3D "07d8a676aa962ecc5ec264ec33b0074adf2a8733"
> > > > >  PV .=3D "+git${SRCPV}"
> > > > >
> > > > >  SRC_URI =3D "git://git.yoctoproject.org/ptest-runner2;branch=3Dm=
aster;protocol=3Dhttps \
> > > > > --
> > > > > 2.39.2
> > > > >
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#184473): https://lists.openembedded.org/g/ope=
nembedded-core/message/184473
> > > > > Mute This Topic: https://lists.openembedded.org/mt/100195650/1686=
489
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/u=
nsub [alex.kanavin@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >

