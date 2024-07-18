Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1717C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 12:37:50 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.14042.1721306263741288782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 05:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QuAmjdEd;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-427b4c621b9so2115205e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721306262; x=1721911062; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SHIdnr0B0l0NHJFyADYkuc04L0PnQS43hvBPSVuuMfg=;
        b=QuAmjdEdHNRZsNjFIj20i2d8nw7iosGrcDluBnjnY0PdvLM+xnv3bxv35z9SxpKEPl
         gQuB5iqAnqNCGwhoB2rTHcZ+k366CghbO+aNvk/arzjdkBL/Gzfhsv489fod4ySquVx3
         X3PHqbY7VyiPqGuqjx4MJp/2YEfmQZcpICEHPjoz8yecunJJFsxTiiNav95YYBL+1hYs
         B1ChaJyd4WZst4GO2PLis8gAYZVABY+wZI19iC3gtr2bQPnpNp4pxwYVOZbt0FlsUvfd
         MJD6TPSa8aLW9t9jYYEI7BMJ06J9MYcixyrd5IPgzhmB3Sikzm09K3w6FOJjkbfyr2nS
         EGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721306262; x=1721911062;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHIdnr0B0l0NHJFyADYkuc04L0PnQS43hvBPSVuuMfg=;
        b=oHmPwurbiuzi/Y85PS4hLSdWpFaijbajuW6Lf6GygCpMJXqUiHUqX2o8AO+FQHWn7J
         gnatvke0SPWZ2MMuV7NZVYQVaWq45bijbWSP55YHt2jEttalkpxG8cFkTdqltcY1mo9o
         Pq2EM1ExRrz8xKR0I4i1cJKgKtlWYstJQLq+Y0MrTQ+G7GnHZbd4/JFBOMDXY4IS9Hmo
         8M+20fKG2mjPvDTXRWuhLDvlhzR9XzKZ7RhD5HKM7I64RNSJXh5rx2UVrLZhIbhne/jY
         XrshOERgBK02nNEgjM6LuM46XmowXJpGOjucoL2jFAOV3BEHs9SoKCKvdyGU01rekH87
         knnA==
X-Gm-Message-State: AOJu0YwdoDcq6AyifyvR1Hlngv4qOu2qQublyymnAG6XpVyvYt113E6z
	xDGfC3p4jSDgMrOXp2sk/8oxtHotSlx9HhZ+1nO7hF1KFv+6oXZP
X-Google-Smtp-Source: AGHT+IEnZz0wllLUbdFQSnc0Y+CXfkDt3t4n140fJXuXkHR9i/ioVk9I3YTUWu1QnMRa/95uXOKHsw==
X-Received: by 2002:a05:600c:1f90:b0:426:5440:854a with SMTP id 5b1f17b1804b1-427c2ca2203mr35957735e9.1.1721306261758;
        Thu, 18 Jul 2024 05:37:41 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a95530sm10419075e9.45.2024.07.18.05.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:37:41 -0700 (PDT)
Message-ID: <8c93f18c668fcb008069e318d6eb63de057d91da.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/6] Use the kernel from sstate when
 building fitImages
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2024 14:37:40 +0200
In-Reply-To: <CA+chaQfrdAhRKwbEwe+5nRxZ71J6RE4eBLzFNsg-u0FZJS815g@mail.gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
	 <50bea4fa4fe781c4b584d746fec34c758d28599f.camel@gmail.com>
	 <CA+chaQeGeXFd7rH2KjsYdtW50Nnre0DL8ykjjmWSRKNX89OrYg@mail.gmail.com>
	 <f8486647cf50da429e45b457e483bb89a2f2a1b6.camel@gmail.com>
	 <CA+chaQfrdAhRKwbEwe+5nRxZ71J6RE4eBLzFNsg-u0FZJS815g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 12:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202207

On Thu, 2024-07-18 at 10:39 +0200, Martin Jansa wrote:
> On Thu, Jul 18, 2024 at 10:00=E2=80=AFAM Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> >=20
> > Hi Martin
> >=20
> > Thank you for looking at my patches.
> >=20
> > On Mon, 2024-07-15 at 16:32 +0200, Martin Jansa wrote:
> > > Doesn't it still rebuild from scratch when IMAGE_VERSION_SUFFIX
> > > changes?
> >=20
> > I wonder why this happens in WebOS. I think that this line
> > kernel_do_deploy[vardepsexclude] =3D "DATETIME"
> > prevents such unnecessary rebuilds.
>=20
> Hi Adrian,
>=20
> yes DATETIME is excluded by default, but it's useful to use different
> suffix in IMAGE_VERSION_SUFFIX (e.g. BUILD_NUMBER from CI on jenkins
> or release version when building release) and in such cases you don't
> want to vardepexclude it, because it's useful to produce matching
> version in images as well as kernel (and other artifacts you might
> have), so your 1.2.1 release images doesn't end with 1.2.0 kernel
> artifacts just because kernel sstate signature didn't change in 1.2.1
> bugfix release.
>=20
> Does this make sense? I bet it would happen in your builds as well.

I try to optimize everything towards binary-reproducible builds. This
means that we remove all kinds of variables that change because the
time changes or because the CI build ID changes or something like that.
I see no benefit in compiling such information into the firmware.
But the problem I see is that such ideas clash with efficient and
binary-reproducible builds.

That means that I don't see a reason for changing the
IMAGE_VERSION_SUFFIX variable in such a way.

>=20
> Whole point of:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12937
> is to allow "renaming" (adding more hardlinks) artifacts with
> matching
> IMAGE_VERSION_SUFFIX without the need of rebuilding anything (e.g.
> version-less kernel artifacts are re-used from sstate and then only
> quick deploy-links task is executed to add right versioned hardlinks
> in deploy directory.)
>=20

Well, yes, it would. But, I am confident that it is a better strategy
to simply not do this than to support it.

If such non-reproducible information is needed anyway, it can be
archived independently of Bitbake.

Adrian

> Cheers,
>=20
> > So far we haven't had any problems with rebuilding kernels. The
> > trouble
> > started when we started using fitImages with initramfs for some
> > devices. It is also worth noting that we build from sstate, but
> > with an
> > empty TMPDIR.
> >=20
> > In such a scenario bitbake does:
> >=20
> > =C2=A0* The initramfs gets assembled. This is expected because images
> > are
> > =C2=A0=C2=A0 not sstate cached. This runs quickly because all the packa=
ges
> > which
> > =C2=A0=C2=A0 are required to build the initramfs come from sstate-cache=
.
> > =C2=A0* Since the initramfs changes, the fitImage which includes it mus=
t
> > be
> > =C2=A0=C2=A0 re-assembled as well.
> > =C2=A0* Now the hassle starts: The do_assemble_fitimage_initramfs needs
> > the
> > =C2=A0=C2=A0 kernel binaries (linux.bin, DTBs...) which are not availab=
le
> > from
> > =C2=A0=C2=A0 sttate. Bitbake has to start with kernel do_fetch in case =
of an
> > =C2=A0=C2=A0 empty TMPDIR just to get the fitImage assembled.
> >=20
> > With my patches the kernel binaries used for the fitImage come from
> > sstate (if the initramfs is not bundled).
> >=20
> > I tested this like that:
> >=20
> > cat build/conf/local.conf
> >=20
> > KERNEL_IMAGETYPE =3D "Image"
> > KERNEL_IMAGETYPES +=3D " fitImage "
> > KERNEL_CLASSES =3D " kernel-fitimage "and RAM disk
> > IMAGE_FSTYPES +=3D "cpio.gz"
> > INITRAMFS_IMAGE =3D "core-image-minimal"
> > IMAGE_NAME_SUFFIX:pn-core-image-minimal =3D ""
> > UBOOT_RD_LOADADDRESS =3D "0x88000000"
> > UBOOT_RD_ENTRYPOINT =3D "0x88000000"
> > UBOOT_LOADADDRESS =3D "0x80080000"
> > UBOOT_ENTRYPOINT =3D "0x80080000"
> > FIT_DESC =3D "A model description"
> >=20
> > # Allow to change the initramfs
> > FOO_VAR =3D "1"
> > INHERIT +=3D "image-buildinfo"
> > IMAGE_BUILDINFO_VARS:append =3D " FOO_VAR"
> >=20
> >=20
> > bitbake virtual/kernel
> >=20
> > mv build/tmp build/tmp-old-1
> >=20
> > bitbake virtual/kernel
> > -> bitbake does:
> > - setscene tasks
> > - core-image-minimal do_rootfs ...
> > - kernel do_deploy (from sstate)
> > - kernel do_deploy_fitimage_unbundled
> >=20
> >=20
> > bitbake virtual/kernel
> > -> bitbake does: nothing
> >=20
> >=20
> > # Enforce a re-build of the initramfs
> > mv build/tmp build/tmp-old-2
> > echo 'FOO_VAR =3D "1"' >> build/conf/local.conf
> >=20
> > bitbake virtual/kernel
> > -> bitbake does:
> > - setscene tasks
> > - core-image-minimal do_rootfs ...
> > - kernel do_deploy (from sstate)
> > - kernel do_deploy_fitimage_unbundled
> >=20
> >=20
> > bitbake virtual/kernel
> > -> bitbake does: nothing
> >=20
> >=20
> > diff \
> > <(ls build/tmp-old-2/deploy/images/qemux86-64 -1) \
> > <(ls build/tmp/deploy/images/qemux86-64/ -1)
> > 4,10c4,10
> > < core-image-minimal-qemux86-64-20240718065105.cpio.gz
> > < core-image-minimal-qemux86-64-20240718065105.ext4
> > < core-image-minimal-qemux86-64-20240718065105.manifest
> > < core-image-minimal-qemux86-64-20240718065105.qemuboot.conf
> > < core-image-minimal-qemux86-64-20240718065105.spdx.tar.zst
> > < core-image-minimal-qemux86-64-20240718065105.tar.bz2
> > < core-image-minimal-qemux86-64-20240718065105.testdata.json
> > ---
> > > core-image-minimal-qemux86-64-20240718073341.cpio.gz
> > > core-image-minimal-qemux86-64-20240718073341.ext4
> > > core-image-minimal-qemux86-64-20240718073341.manifest
> > > core-image-minimal-qemux86-64-20240718073341.qemuboot.conf
> > > core-image-minimal-qemux86-64-20240718073341.spdx.tar.zst
> > > core-image-minimal-qemux86-64-20240718073341.tar.bz2
> > > core-image-minimal-qemux86-64-20240718073341.testdata.json
> > 20c20
> > < fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> > 20240718065105.bin
> > ---
> > > fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> > 20240718073341.bin
> > 22c22
> > < fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-
> > qemux86-64-
> > 20240718065105.its
> > ---
> > > fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-
> > > qemux86-64-
> > 20240718073341.its
> >=20
> >=20
> >=20
> > The answer is then: No it does not re-build. At least not in the
> > scenario which I would like to fix it, it does not rebuild from
> > scratch.
> >=20
> > Does that make sense?
> >=20
> > Regards,
> > Adrian
> >=20
> > > >=20
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#201933):
> > > > https://lists.openembedded.org/g/openembedded-core/message/201933
> > > > Mute This Topic:
> > > > https://lists.openembedded.org/mt/107231736/3617156
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe:
> > > > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > > > martin.jansa@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >=20
> >=20


