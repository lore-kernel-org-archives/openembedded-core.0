Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EB9C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 12:44:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.14162.1721306647792030234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 05:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lmhhTwYs;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4266ea6a488so2715885e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 05:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721306646; x=1721911446; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eu9vQaKXrviM5LZ8mCThMfbOnOXXvlX39N1hiC7hKFI=;
        b=lmhhTwYsh9ve0+DktTTImwi/xP/VuaApcu6fciVbSX0iLUO3DNvnIsrxLdGyFdyrY3
         XF1erxiPWsvvVCXU+SViMQIO2r3jkoGTbm4W8FDPgoUiPdrmIdf6Tg7eipdDCJCpQ7aL
         oSNYQrRQlioO33Vu2TTKfd6DmSlrK1r7tUuIzrZEZhtxMbHxXPDSstDvJIUvAAurG/5h
         rj6QXEXifyb58w9GX1cYmxGnFZIT5lVP/2He5wRjomQA1np1htGZIoCpa5nUgnoh+685
         lMQUUpTkCBGubGyEWOxATxpUG3fpio/Oq3oUTCKHxZGciSN5t4ApDk0Yxt3zLgX6u3gI
         EToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721306646; x=1721911446;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eu9vQaKXrviM5LZ8mCThMfbOnOXXvlX39N1hiC7hKFI=;
        b=evQh9qNOeLQfCy6G1z+9jqtIPz+i64XWF/qwjiBBn+Ndz+I76PyIFLBzniG/3lF/sR
         UVLpvt1hBqzVs/x5o3klSKMY56mUQ+csN7Ogvi06hczD1tDH22I4GthjpiIs2a+EwOCF
         L5Fg9clWxXZAcTrhzffFybW0JPyPddLqGPGAk7dk/IY6XHetjAZBukGdtVs0GnZ2qinN
         TsC+GAAQLD+rhILo4LpEP1RQqFYQTI9yR4zhzjQ/peYKFcVYQRw+RqDgQGYjpYF4TUTy
         tkWqMmrFEVsTLwPExkI2grPh1LU9yXDXDLT6rKbz4VVAwpHh0OsJoirVbbOgBm2fISa0
         CogA==
X-Forwarded-Encrypted: i=1; AJvYcCVsNH7bNeJvUhyPQqjpHnnN7L1HAaEHp1hLU9Io36gqOsODArxopVXTw5O4q7XOslkbYhPqVH34Jd0GRS4R1uxX9iliAWBCM4Ip70gt+QttQsUEM7QTFVQr
X-Gm-Message-State: AOJu0YyDaori5aASh1CIFdfI9Jt3wyo4z4FvWyFA7+n04u2fOUeKj/OZ
	GfTw5URBScXgKuqbnJHOYf1vcDNcbuDxnUSuf0kYPAHZaR/h7YLb
X-Google-Smtp-Source: AGHT+IHNUOdg7qtny7IL1gsRedTxVNWzmAWhxXLPDN6kJTLbWuexIMAyxUlGy8XUwiPwvdWfTJcUBw==
X-Received: by 2002:a05:6000:1fa9:b0:366:e986:22ef with SMTP id ffacd0b85a97d-368315f1eeamr5567178f8f.4.1721306645940;
        Thu, 18 Jul 2024 05:44:05 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccc9csm14210831f8f.57.2024.07.18.05.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:44:05 -0700 (PDT)
Message-ID: <ce1e121d6ac30f241093146f49a21bed718c9b1f.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/6] Use the kernel from sstate when
 building fitImages
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2024 14:44:04 +0200
In-Reply-To: <CANPvuRnVz=_xQvZ=8DFvNoOH2SLR9cK0UpTSzF5BAOXE-frKYw@mail.gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
	 <50bea4fa4fe781c4b584d746fec34c758d28599f.camel@gmail.com>
	 <CA+chaQeGeXFd7rH2KjsYdtW50Nnre0DL8ykjjmWSRKNX89OrYg@mail.gmail.com>
	 <f8486647cf50da429e45b457e483bb89a2f2a1b6.camel@gmail.com>
	 <CANPvuRnVz=_xQvZ=8DFvNoOH2SLR9cK0UpTSzF5BAOXE-frKYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 12:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202208

On Thu, 2024-07-18 at 11:28 +0100, Jose Quaresma wrote:
>=20
>=20
> Adrian Freihofer via lists.openembedded.org
> <adrian.freihofer=3Dgmail.com@lists.openembedded.org> escreveu (quinta,
> 18/07/2024 =C3=A0(s) 09:00):
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
> >=20
> > So far we haven't had any problems with rebuilding kernels. The
> > trouble
> > started when we started using fitImages with initramfs for some
> > devices.=C2=A0It is also worth noting that we build from sstate, but
> > with an
> > empty TMPDIR.
> >=20
> > In such a scenario bitbake does:
> >=20
> > =C2=A0* The initramfs gets assembled. This is expected because images
> > are
> > =C2=A0 =C2=A0not sstate cached. This runs quickly because all the packa=
ges
> > which
> > =C2=A0 =C2=A0are required to build the initramfs come from sstate-cache=
.
> > =C2=A0* Since the initramfs changes, the fitImage which includes it mus=
t
> > be
> > =C2=A0 =C2=A0re-assembled as well.
> >=20
>=20
>=20
> I have faced this problem and sent a patch [1] to support storing the
> full images on the sstate.
> As it was not a tested and widely used case, it was rejected.
> We continue using this in our distro but without the patch we need to
> change more parts on our side.

I don't think adding images to the sstate cache can help much. But it
comes at a high cost. It definitely wouldn't help in the case that
should be optimized with my patches here:
 * If the initramfs changes it needs to be re-built and cannot be taken
   from the sstate-cache anyway.
 * The issue is: If the initramfs changes, the kernel gets re-built.
   What we need is an sstate for the kernel artifacts but not for the
   initramfs artifacts.

Adrian

>=20
> [1] https://lists.openembedded.org/g/openembedded-core/message/184243
> =C2=A0
> > =C2=A0* Now the hassle starts: The do_assemble_fitimage_initramfs needs
> > the
> > =C2=A0 =C2=A0kernel binaries (linux.bin, DTBs...) which are not availab=
le
> > from
> > =C2=A0 =C2=A0sttate. Bitbake has to start with kernel do_fetch in case =
of an
> > =C2=A0 =C2=A0empty TMPDIR just to get the fitImage assembled.
> >=20
> > With my patches the kernel binaries used for the fitImage come from
> > sstate (if the initramfs is not bundled).
> >=20
>=20
>=20
> Anyway=C2=A0your overwall patch set is still=C2=A0a good improvement to n=
ot
> rebuilding the kernel.
> That=C2=A0was my concern=C2=A0also and the main reason for my patch.
> =C2=A0
> Jose
> =C2=A0
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
> > > >=20
> > > >=20
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#202191):
> > https://lists.openembedded.org/g/openembedded-core/message/202191
> > Mute This Topic:
> > https://lists.openembedded.org/mt/107231736/5052612
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-
> > core/unsub [quaresma.jose@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20
>=20
> --=20
> Best regards,
>=20
> Jos=C3=A9 Quaresma


