Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C97C001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:44:34 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.994.1689799464281543775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QxBA42Gp;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b74209fb60so698781fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 13:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689799462; x=1690404262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtkzzdaVZYpPtmVkwWXkTEU8GUKpEr2J6DhE3CB+ylE=;
        b=QxBA42GpdJCbSaSSpTu4bo7nYRsP/ZsVCX5oPHJPzV0BfRCvHLU01pt0IUfHLwKuQu
         cbreO7BJm7aL9kGSeQv7fjPZzw6o8irAXnHlHuZUKhJ6p2O2SsSWCl/KT/WlfpOPSJgB
         S6QEmsHrgIK86fl01itc1XZQKqtrj9xYFNPhXdTxnC1zB/va5urFJuNPnKr7S1yBwvoY
         5P8BJ+xPeHXXaEB5QU1dHQKD3Jd5GHbIeE1GkFh9ZFK+n+oCTraDhiRj4zf3hXsqDSYa
         kFVE6tudDLihjcya5xtghzu9YZZfeR9FBElcsOQd9aF4WvpoP0+wYoklo5NOZtSiP9ku
         sDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689799462; x=1690404262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtkzzdaVZYpPtmVkwWXkTEU8GUKpEr2J6DhE3CB+ylE=;
        b=CuQDp5tyRIW6EsgoLUPXHd0kwldnNhCmVVSsekw0s5TOulzc24HCiAIvJeAOhT6yny
         A1zwNDDcDJi3cxhi5XWwzZBCiNqiaXNU2pOc2rl+PKs+LVm4MrWXeCgoSdg/yrbMdJCJ
         5CgGLmvCa9T2K9bDZ6XISyvHv6K5TT3Ce7ihMkcYSmHqhGoFVaIr+DwKjjICsKKneIQD
         yyVEmXv0I2rtaw2u/OXBsuzWstC25QjCYCnoL10ph/DRbwAOpc4zFIesgGxssCYHsLLA
         nGXFrvvZZWtImOfr/LtQ660UT5VqywRPeJft2ItsI5fJ5/wUf55Ma0EOhDLe6+MzE4mZ
         e/yg==
X-Gm-Message-State: ABy/qLbJczOB/d/PdZxh6qEh82vNDYvAiv90uydnGFCNIqkJoGxSZ956
	+pc/Jst1C8NtLJrpvR0vwtpnkb2jUSXOjYVJq4KD/to9
X-Google-Smtp-Source: APBJJlG6ZwMvgzquqG9mZ6nnwHsR+iWQfPAsGZcU0dairHNhXnvYzM1VyEHd34fVUZ1+Bs+ZurYUDs3Uu/qG1raVzB8=
X-Received: by 2002:a05:651c:201:b0:2b4:65bf:d7b with SMTP id
 y1-20020a05651c020100b002b465bf0d7bmr784032ljn.2.1689799462222; Wed, 19 Jul
 2023 13:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230717143624.437293-1-richard.purdie@linuxfoundation.org>
 <CANNYZj-9u4gDwvjL8+9F8+GSJUqes45w-DMn-v2xvg3qaXRH5w@mail.gmail.com>
 <CAJdd5GakykM-7tv0FppDg7iSa3rwzCPbhhh1jR3zdYm1hm9QWA@mail.gmail.com> <CANNYZj9fvRJWAB_jSpnqzx_wgzapANNdPMNCosqO3P6S-W+gpQ@mail.gmail.com>
In-Reply-To: <CANNYZj9fvRJWAB_jSpnqzx_wgzapANNdPMNCosqO3P6S-W+gpQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 19 Jul 2023 14:44:10 -0600
Message-ID: <CAJdd5Gav=2bCyhLEF8kREWVMhhePJOru322b2-gXHGK6U4sK1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner: Pull in parallel test fixes
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184612

Do you have a recent log of a failure? All the ones in the ticket
buildbot says are from a month ago (or, maybe that's just a quirk of
buildbot?)

On Wed, Jul 19, 2023 at 2:35=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Which newer commit, in which repo? I believe the latest SRCREV update
> in oe-core master that landed 12 hours ago or so is what broke things.
>
> Alex
>
> On Wed, 19 Jul 2023 at 22:32, Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > There is a newer commit that was merged to master just today; please
> > see if that fixes it.
> >
> > On Wed, Jul 19, 2023 at 2:26=E2=80=AFPM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Unfortunately this seems to once again have regressed glib/codegen
> > > ptest (the test writes large amounts to stdout):
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15154
> > >
> > > I'll send a revert.
> > >
> > > Alex
> > >
> > > On Mon, 17 Jul 2023 at 16:36, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > Pull in the commits:
> > > >
> > > >     Change test timeout to be total elapsed time
> > > >     Report if child dies from a signal
> > > >     Recreate pipe for each test
> > > >     Revert "runner: Correctly handle running parallel tests"
> > > >     runner: Correctly handle running parallel tests
> > > >
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > ---
> > > >  meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.b=
b b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > > > index 6f3104499f2..77e2b94f376 100644
> > > > --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > > > +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > > > @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit=
.cgi/ptest-runner2/about/"
> > > >  LICENSE =3D "GPL-2.0-or-later"
> > > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaa=
baa882bbe"
> > > >
> > > > -SRCREV =3D "8259375d306a8129f6c5d8528314496fc6ae1ca3"
> > > > +SRCREV =3D "07d8a676aa962ecc5ec264ec33b0074adf2a8733"
> > > >  PV .=3D "+git${SRCPV}"
> > > >
> > > >  SRC_URI =3D "git://git.yoctoproject.org/ptest-runner2;branch=3Dmas=
ter;protocol=3Dhttps \
> > > > --
> > > > 2.39.2
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#184473): https://lists.openembedded.org/g/opene=
mbedded-core/message/184473
> > > > Mute This Topic: https://lists.openembedded.org/mt/100195650/168648=
9
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [alex.kanavin@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

