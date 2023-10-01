Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890B2E78495
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 21:31:18 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.68842.1696195876079960147
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 14:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k6uF5k/r;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1e19cb7829bso326992fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 14:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696195875; x=1696800675; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paGREzujVh/XKhnSXOM7n7/aWuoi9uAyAIQPBLaDFwY=;
        b=k6uF5k/rd4AdOBXRwXxun3BU2ytqpimmRPNauByMO4X0985rV/sTYpR6+eQP86Xuz1
         93YbbPe7DqN/8ti+dmcN7YSJ0bgjCR5Wg0sUCVD5vYFl+rqAgbaOLH/PZy6N0m1VXiKa
         OVxOpxZ53FDBRJY1ZwnGXy5EvZHo2cOPDH0aUHBVHb7vlDlCa24qJ74Cr23T+te/LRqo
         Xj5O4lhLgSlgkVGIlTwAlA7HNezkagiBks6oYeuRzuGMqfHFEqDxjexFMzY1c0fnScfF
         Gpjz0IPDd8aS8ivJ4KEsIZ1SMGsahi1eYV0uLPq0YSa1iOpPqzau6nrG9VInz7bw86nm
         NIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696195875; x=1696800675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paGREzujVh/XKhnSXOM7n7/aWuoi9uAyAIQPBLaDFwY=;
        b=CYa37lF9UV+0mVCrWa7uCbg/eVcWGgU5dL/ffAKpojvuxKjObqqtLpRH3y9G3zmmv7
         HH0oMp2TE9uBQgy+wejiTth7SXdy2NwJGvzrFcRx2MTKjNeEZUMBRpYBml/u+BAThDlB
         a49QYNP7TuMak0ZwUrGJi7FyEiNi4l33mOXz2yOR1jugyckvddLzziGXOn9j+hUkPRGt
         1YLWlL4e0ezQ8C6EirFfzDzD4VGfekaiqMfHbGvYQpsymzxS4xSWZVdpuA8RvU3KF+9C
         BCNl6H+NGTOOI+Wi+9n9rmo0JMwc0m/nL2z7SIg8STFbxwwcqWJXgeHtMbbJU0dY7ePK
         KUSw==
X-Gm-Message-State: AOJu0YyYYGRYbmP3DDO0/h9uGGv1k1yzJawhWTDKFMvMPM9KW4lN9NdC
	Y3PVAn4puLf94ukdSn3hEu7fGlzKb48pGUTauHQ=
X-Google-Smtp-Source: AGHT+IGWVSMTt65N3/8PfK0m018LIR3vweq51Xm4ik8HkBh1KHtPk2hVQfa6Lvfa9hgTffshr7vS2ldGDZXN/aC230A=
X-Received: by 2002:a05:6870:d24c:b0:1d5:e792:e7ad with SMTP id
 h12-20020a056870d24c00b001d5e792e7admr11865934oac.5.1696195875169; Sun, 01
 Oct 2023 14:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
 <2c1e6c379204c619cc4fe41f1b3cea1b8c6582f7.camel@linuxfoundation.org>
 <a87cca5199af470fc7e3b415d57f5b3b8fad4318.camel@linuxfoundation.org> <CAMKF1srSs1YRudkXQ2jdQYN5ZSFENPhv5o0yc3Ycx=1CCAUeXw@mail.gmail.com>
In-Reply-To: <CAMKF1srSs1YRudkXQ2jdQYN5ZSFENPhv5o0yc3Ycx=1CCAUeXw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Oct 2023 14:30:49 -0700
Message-ID: <CAMKF1sp9c-SY7GzMQz8=KWZUJ4mwC4auj-rEH2uQ6md7zeu5LQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/10] kernel: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 21:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188590

seeing couple of build failure in meta-oe too

https://errors.yoctoproject.org/Errors/Build/172283/


On Sun, Oct 1, 2023 at 10:40=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sun, Oct 1, 2023 at 4:49=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2023-10-01 at 11:13 +0100, Richard Purdie wrote:
> > > On Fri, 2023-09-29 at 16:04 -0400, bruce.ashfield@gmail.com wrote:
> > > > Given where we are in the release cycle, this clearly is NOT a typi=
cal
> > > > consolidated pull request.
> > > >
> > > > I've done what normally takes about three weeks in about 4 days.
> > > >
> > > > With 6.4 going EOL before expected upstream, it really isn't a suit=
able
> > > > reference kernel for the release.
> > > >
> > > > So we've decided to take on the task of getting 6.5 ready and avail=
able,
> > > > and at the same time moving the -dev kernel to v6.6. The -dev kerne=
l
> > > > testing for 6.5 was critical for this, since I already knew the cor=
e
> > > > was sane.
> > > >
> > > > Also we've never shipped purposely mismatched libc-headers in the r=
elease,
> > > > so I also took the leap to update the libc-headers to match.
> > > >
> > > > I've already sent fixes to meta-oe, and there's a btrfs update in t=
his
> > > > series to fix breakage that I found in the tightly coupled packages=
.
> > > >
> > > > I've built and booted core-image-kernel-dev, core-image-minimal, co=
re-image-sato
> > > > for both glibc and musl for all the supported architectures.
> > > > There will be some things that break regardless, but this needs the
> > > > better coverage of the AB.
> > > >
> > > > If this causes too much problems, our choices are to ship 6.4 EOLd,=
 or
> > > > fall all the way back to 6.1.
> > > >
> > > > I'll remove 6.4 from master once we've figured out the fallout from
> > > > this kernel, and which direction we are going.
> > >
> > > I've merged this series which seemed to work fine. Given the time
> > > constraints, I thought I'd throw some 6.5 testing at the autobuilder.
> > > It ran into two issues. One was cryptodev, I have a patch for that in
> > > master-next. The other were entropy boot failures on arm kvm:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/551=
2/steps/12/logs/stdio
> > >
> > > [    0.796831] Key type id_resolver registered
> > > [    0.797581] Key type id_legacy registered
> > > [    0.798724] Key type cifs.idmap registered
> > > [    0.808070] jitterentropy: Initialization failed with host not com=
pliant with requirements: 9
> > > [    0.809690] xor: measuring software checksum speed
> > > [    0.811307]    8regs           : 12333 MB/sec
> > > [    0.812862]    32regs          : 12322 MB/sec
> > > [    0.814885]    arm64_neon      :  7851 MB/sec
> > > [    0.815626] xor: using function: 8regs (12333 MB/sec)
> > >
> > >
> > > -----------------------
> > > Central error: [    0.808070] jitterentropy: Initialization failed wi=
th host not compliant with requirements: 9
> > > ***********************
> > >
> > > I did find this in google:
> > >
> > > https://lore.kernel.org/linux-arm-kernel/68c6b70a-8d6c-08b5-46ce-2436=
07479d5c@i2se.com/T/
> > >
> > > which does bisect to a change.
> > >
> > > I'll rerun the autobuilder testing with the cryptodev patch and see i=
f
> > > anything else transpires.
> >
> > The LTP on arm run failed:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5406
> >
> > which diving into the logs shows it went OOM and keeled over badly:
> >
> > https://autobuilder.yocto.io/pub/failed-builds-data/qemu_boot_log.20231=
001101358
> >
> > meta-virtualization doesn't like something:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2295
> >
> > The arm ptest failures above are unsurprisingly still around:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5513
> >
> > There may or may not be failing strace ptests on x86:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5694/=
steps/13/logs/stdio
>
> strace might be related to something like this
> https://blog.sebastianwick.net/posts/so-peerpidfd-usefulness/
>
> >
> > but we didn't get the world build failures from cryptodev.
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#188481): https://lists.openembedded.org/g/openembed=
ded-core/message/188481
> > Mute This Topic: https://lists.openembedded.org/mt/101665418/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

