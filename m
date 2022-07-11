Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2740C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 03:06:27 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.24304.1657508781676220824
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 20:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AKLnrnp0;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so7040107pjo.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 20:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7cgukDRKztC3FT8ZvTTPtgdcr6vLFVzytt56W/3RWck=;
        b=AKLnrnp0+HRQwBRGQrFp3CZdnLKoAA/qiXwkeEmFcGrgdd7Y09QLoOJEo8S6Ybc64h
         eQh6l8oLKHKud9M0a4Mi71ad9lxN/vW5FdCfK9MW0Lk52J9+h2G/h7lhJA9WiWcKJEsa
         Vq1RLOioHEv3p4kJQmh3JfWqT4iZCnVPA2qfKCWJL3GWJsuUU6NY7CBJGKp+l6Ehfg5K
         wvqvjCWJJNYyHIPwurZyP5YFJsDofysvPPey7d9hnPzdU+eO1u2tyhsW0/AUyy3GawNX
         NBQRZdfoqb2QstvwqLFn1pJRQh0FCLf95a68PjvJojjWHZ5RQZ1aA+6jGrn8CfCOZO0p
         SY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7cgukDRKztC3FT8ZvTTPtgdcr6vLFVzytt56W/3RWck=;
        b=c1NOYsXbGLWrMeXTM7TyjmGVTQDjWSdbGKTpBWQhO5sNMX1l3QN245Wv6CsQAiVwBa
         GFwNqby1QA0QkiTYb+qG3WE5l0pkP1qNHLbCfxSJkJnTBjR2wMU8jg6klYA2/T7q9tuZ
         GBP3x4nMBf3DZv2T2XTmb5hjmB1D6LO3gAOnarEFKy59dftLmX94ORZWgXGhCzOpKWfL
         9VKsY8iPNC6O8KFwyzoUb2KPqOHofPMG1r3yV1UvZbXjS6B+E+csm1aU3hBsBX5Vna3H
         AbFPCbFykvCotllK9euGNgBFTXcjDQxEW0DjLXfT5pnLtLipjYLLx4OBW2nngAV8D6Pg
         U5oA==
X-Gm-Message-State: AJIora9csPSaWGL6f2SptF2UqAzrDmHpMtyuOKCcpOQJHlC1j3YMuw1v
	aMdKoCe4sMvIyCJAJczk9Pf1Y+sCbnEP74OddQQ=
X-Google-Smtp-Source: 
 AGRyM1szozsl0LEHbiTad7Z1DJ9uBQvrSyjGUGELpKivgV3tcTBnUMmxUKSCCjcGiPxjp53MCYaV5qbTrMlfJZ1E2jE=
X-Received: by 2002:a17:90a:ff17:b0:1ef:8b4b:8cc0 with SMTP id
 ce23-20020a17090aff1700b001ef8b4b8cc0mr15388575pjb.155.1657508781100; Sun, 10
 Jul 2022 20:06:21 -0700 (PDT)
MIME-Version: 1.0
References: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
 <77dd3defcb6908755d06585d4cfb69a523626a22.camel@linuxfoundation.org>
 <17009EE9B42D5D4F.21011@lists.openembedded.org>
 <1700A558F3D5D3E4.14864@lists.openembedded.org>
In-Reply-To: <1700A558F3D5D3E4.14864@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Jul 2022 00:06:14 -0300
Message-ID: 
 <CADkTA4P=BDAYiZUCN+hhqpyUUAoOckX+RMphyZiwmci3nFrkOA@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 03:06:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167858

On Sun, Jul 10, 2022 at 11:27 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Sun, Jul 10, 2022 at 9:29 PM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, Jul 8, 2022 at 10:47 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2022-07-08 at 09:37 -0400, Bruce Ashfield wrote:
> > > > On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > Hi All,
> > > > >
> > > > > We've made good progress and I appreciate the help from people. I=
 ran a
> > > > > fresh build on the autobuilder and I forced it to rerun the QA ch=
ecks
> > > > > for all recipes. The tricky bit about warnings is that they don't=
 show
> > > > > up for objects from sstate and the addition of the buildpaths QA =
check
> > > > > doesn't cause the checks to rerun. Due to that a few more previso=
uly
> > > > > unseen issues cropped up.
> > > > >
> > > > > The list of issues now stands are:
> > > > >
> > > > > qemuppc:
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds=
/5428
> > > > > WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/=
modules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cm=
d in package kernel-devsrc contains reference to TMPDIR [buildpaths]
> > > >
> > > > I'll take this one. My fix was only for arch/arm, but I'll expand i=
t
> > > > to cover ppc32.
> > >
> > > Thanks.
> > >
> > > I built qemuppc locally and got a different failure, I'd really like =
to
> > > know why I saw that and the autobuilder did not. The failure was:
> > >
> > > WARNING: linux-yocto-5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0 do_p=
ackage_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35=
d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/vt/consolema=
p_deftbl.c in package linux-yocto-src contains reference to TMPDIR
> > > File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf=
07b-r0/linux-qemuppc-standard-build/lib/oid_registry_data.c in package linu=
x-yocto-src contains reference to TMPDIR [buildpaths]
> >
> > I have the devsrc fixed for qeumppc32, fix incoming shortly.
> >
> > But for this one, I don't see it either. What do I need to enable to
> > get the linux-yocto-src package ? Mine is empty, hence no warning. Is
> > it one of the archiver modes ?
>
> I sent a series with a fix for qemuppc32 kernel-devsrc and a WIP fix
> for the conmakehash issue, I'll have a look at oid_registry next.


oid_registry is a perl script .. also capturing the full path of the
executable. I did a similar fix for linux-yocto 5.15 and used
'basename' versus the whole path.

If these hold up, we can expand the versions that get the fix.

Bruce

>
> Bruce
>
> >
> > Bruce
> >
> > >
> > > sure enough, tmp/work/qemuppc-poky-linux/linux-yocto/5.15.48+gitAUTOI=
NC+b35d1d1e83_5aa3abf07b-r0$ head package/usr/src/debug/linux-yocto/5.15.48=
+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/t=
ty/vt/consolemap_deftbl.c
> > > /*
> > >  * Do not edit this file; it was automatically generated by
> > >  *
> > >  * conmakehash /media/build1/poky/build/tmp/work-shared/qemuppc/kerne=
l-source/drivers/tty/vt/cp437.uni > [this file]
> > >  *
> > >  */
> > >
> > >
> > > I think the warning is saying there is a second issue in linux-qemupp=
c-
> > > standard-build/lib/oid_registry_data.c too.
> > >
> > > Sorry Bruce, not sure why several roads lead to the kernel :/
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167856): https://lists.openembedded.org/g/openembedde=
d-core/message/167856
> Mute This Topic: https://lists.openembedded.org/mt/92248896/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

