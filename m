Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B50EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 23:11:14 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.1051.1689030673894725042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 16:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=V6ES8r7C;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-783544a1c90so252479439f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 16:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689030673; x=1691622673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX7GVYqvm7mGy1zlg0jiGmjZv24BzDYqbLeZPba0fpM=;
        b=V6ES8r7ChXyAiteTJIMllg5nWSCZBdrxpOS0Lq6lsIaOIs9bxMGz8/hRwwZom3dALX
         kI5O/a6HJHvraPNs5/tk9HjaT4bRhPtmtdVeU35VNeVomS79GrKIWy6Z49QW5fjwOvbC
         0/rtnbb70lwLm3qEVq7Czm/LiFr6sxr9p27wEXp++1WIHmPiWqYjbVmLi7huHdS7MYKr
         OCsRGIqg14HLJUzaukt/zd54tSYX+eKbIQhlaifXMDZCGRbu/I2hm0MN7M9N7Yf2K9rq
         dEoe90YxS5+JYMvJJ6Fp+tJKO/xOJmsSqCXxdSLehaSIedkxbR+ZimhM3eumndJg9Vtr
         gCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689030673; x=1691622673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NX7GVYqvm7mGy1zlg0jiGmjZv24BzDYqbLeZPba0fpM=;
        b=cVPup3Zf070pHe+UtovolTqKnetzBxYCfmSzRK7Oc2qYu2qc8P5XvcOx2paKsqosCl
         TQq/T+xr/+o3pBQnsOGAlgrvuzTSFX2IWI4OahECJbGtmTPO3QeBc7xdFhR/vZ0Omnkj
         BHXdW5A7Me43WSqAtFPhQ0/b6Afg8vz+63xhaOtR5IfnIg2XJ1iHynV0YJeqGq7xKgeI
         XNNvK0NengxmhzPr9DRg7oLOkrzxweexXLQLm6fRW3nG1qyUxCqbEWyeqF4AThTVldKb
         Qh1EHH2PVsffeWPo5A6KcK1Hi5F2NUjDCLprUpVIKMPo+hC20rxZ4dg/vupwpfGZxpWt
         d+Ag==
X-Gm-Message-State: ABy/qLbOfQtadloFo2J11zGaIhh20mwA+aEl0pV/ARwlNEwTT3CSr+xk
	EGEMXZS9tOMtsDBxHtv2Em8k1hLm2VkWq6BbTiE=
X-Google-Smtp-Source: APBJJlF3BAWeAax3VaKAHte3DqvAVTTN2oDIpSF4t1tE/wwDu8EQR5ucgbT45vTg1+pQwlz+pifGnU9a8MirLZuYbpA=
X-Received: by 2002:a5d:8a0c:0:b0:786:f352:e3d4 with SMTP id
 w12-20020a5d8a0c000000b00786f352e3d4mr3634056iod.7.1689030673078; Mon, 10 Jul
 2023 16:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
 <CDACE6FE-F991-4E69-BC69-B1BEC6B6B761@arm.com> <20230710205902398898f0@mail.local>
 <1770A3C5B7BBB722.31955@lists.openembedded.org>
In-Reply-To: <1770A3C5B7BBB722.31955@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2023 19:11:02 -0400
Message-ID: <CADkTA4NOi18=t4PRpYOeVdzQs3ErpeP6fEuZdR6APBuhZ=vs-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/15] kernel: consolidated pull request
To: bruce.ashfield@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 23:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184107

On Mon, Jul 10, 2023 at 6:58=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Mon, Jul 10, 2023 at 4:59=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On 10/07/2023 14:54:50+0000, Ross Burton wrote:
> > > On 10 Jul 2023, at 04:20, Bruce Ashfield via lists.openembedded.org <=
bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > > > Here's the latest queued kernel changes. There are the expectd -sta=
ble updates
> > > > 6.1, but those of course aren't the most interesting part of this q=
ueue.
> > >
> > >
> > > I=E2=80=99ve not triaged them yet as it=E2=80=99s still building, but=
 https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5577 is =
just this branch on top of master and has some new failures/warnings.
> > >
> >
> > It mostly worked on my branch, there is this new failure though:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7413/=
steps/12/logs/stdio
> >
> > Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File "/home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa=
/runtime/cases/parselogs.py", line 393, in test_parselogs
> >     self.assertEqual(errcount, 0, msg=3Dself.msg)
> > AssertionError: 4 !=3D 0 : No ignore list found for this machine, using=
 default
> > No ignore list found for this machine, using default
> > No ignore list found for this machine, using default
> > No ignore list found for this machine, using default
> > No ignore list found for this machine, using default
> > No ignore list found for this machine, using default
> > No ignore list found for this machine, using default
> > No ignore list found for this machine, using default
> > Log: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/=
work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0-r0/target_logs/Xorg.0.log
>
> It's odd.
>
> I can build and test qemuarm core-image-sato and I don't get any warnings=
.
>
> I wasn't able to see the exact configuration of that specific run (is
> it under build-properties?).

I'm using systemd vs sysvinit, it could be masking the messages. I'll
try that change locally.

Bruce

>
> Bruce
>
>
> > -----------------------
> > Central error: [    17.416] (II) FBDEV(0):      mode "640x480" test fai=
led
> > ***********************
> > [    17.381]    compiled for 1.21.1.8, module version =3D 0.0.2
> > [    17.381]    ABI class: X.Org Video Driver, version 25.2
> > [    17.384] (II) FBDEV(0): using default device
> > [    17.389] (=3D=3D) FBDEV(0): Depth 24, (=3D=3D) framebuffer bpp 32
> > [    17.389] (=3D=3D) FBDEV(0): RGB weight 888
> > [    17.389] (=3D=3D) FBDEV(0): Default visual is TrueColor
> > [    17.403] (=3D=3D) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
> > [    17.406] (II) FBDEV(0): hardware: virtio_gpudrmfb (video memory: 40=
00kB)
> > [    17.407] (DB) xf86MergeOutputClassOptions unsupported bus type 0
> > [    17.411] (II) FBDEV(0): checking modes against framebuffer device..=
.
> > [    17.416] (II) FBDEV(0):     mode "640x480" test failed
> > [    17.417] (II) FBDEV(0):     mode "640x480" test failed
> > [    17.418] (II) FBDEV(0):     mode "640x480" test failed
> > [    17.419] (II) FBDEV(0):     mode "640x480" test failed
> > [    17.441] (II) FBDEV(0):     mode "640x480" not found
> > [    17.442] (II) FBDEV(0): checking modes against monitor...
> > [    17.444] (II) FBDEV(0): Virtual size is 1280x800 (pitch 1280)
> > [    17.445] (**) FBDEV(0):  Built-in mode "current"
> > [    17.446] (=3D=3D) FBDEV(0): DPI set to (96, 96)
> > [    17.447] (II) Loading sub module "fb"
> > [    17.448] (II) LoadModule: "fb"
> >
> > > Ross
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184105): https://lists.openembedded.org/g/openembedde=
d-core/message/184105
> Mute This Topic: https://lists.openembedded.org/mt/100051814/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

