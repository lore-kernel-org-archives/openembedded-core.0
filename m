Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A6AC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 08:40:19 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.10696.1721292009839991424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 01:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c/XzuOgZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e9a920e73so60873e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 01:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721292008; x=1721896808; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN0IcjSI5h5wuBgThB95tfhAU1Dj1PDUMcCouXIXFnU=;
        b=c/XzuOgZ5nsTBJus7zxZwpcRGC7xy5HvgrzqzHxGgvz+j6kEJtaFxlOMwMQqRU3NCh
         mL6EUVy09TTXBk/rnAb0QAs/bc80Dgr8U/9NouNRqOfzuwc0svFffcjiUBgmFJaLPMDF
         cF/ut78ZPWPH+Egw57Xi0M/Sk/wjJ3FHYTudUF00f70SgOaXpba0vw/VVEzk+E1Chzs6
         y03PiJQT2S7T2MBqXyoURQ3Qe2td93d+h45rOWPSvssi/UqyP4TFTYucCtN87erWxRKP
         YKllkdl+mpXBALPfuh/BA1cHaxfFpp55bBACflVxKbPn5feT8L4OXpUoIhnczp0HMf+6
         BOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721292008; x=1721896808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wN0IcjSI5h5wuBgThB95tfhAU1Dj1PDUMcCouXIXFnU=;
        b=O1ZNc0OedO2z+MxohtVvr7l+GeWKSS6IB3eSFXUsa7995OGRiUoc1E21HoPag163qN
         DsHSkRcae03Yk2+0ZviSbQoqBnoTBrOT7Ur5EGOvTWa8h8DjY6KtLMCtlhnr0ENUUVOF
         qLrp1gfBpwhz7yfwZbPtaaJTknRuLh4LHYD2PxkPpTXuemINDxU97IJQWC3hw+FAQUpg
         Cj3gCShBLViTRyO9q0E9wR+Ay2ILDZaF+xbg6IBVoc5aKbNP0J/nYbD2wOl9MSHlSxmH
         gmtmG4Jtb711LoSitPYO2PuHylNwLZhPqtsHXgJZB4bzwEjyhwzDoDB2GdIah7GDABJ4
         yZ+g==
X-Gm-Message-State: AOJu0YxKNflAQwGXZKxjMcKEmE38M01+oNulHjZQtWQZ4tB6QSrciIiy
	qur2HW4ghmpIdvN4MzcghxKe4Bb3vijHdPr0C3M77ezYcpMAk1cIoSHbXSgYgGeNck6P7DXIRLr
	vd0KUE8cZ+e7roHYvtu+7BghCQeQ=
X-Google-Smtp-Source: AGHT+IFK7zH9/dNBSSjhQkGIzylibh6v5LmLIyO3bOiqY7h7dia+UYHcVLqgi4+lmYdncicIBrObsm8UtdKBCOJ3VhY=
X-Received: by 2002:a05:6512:2397:b0:52c:8979:9627 with SMTP id
 2adb3069b0e04-52ee53ad335mr3270260e87.3.1721292007253; Thu, 18 Jul 2024
 01:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
 <50bea4fa4fe781c4b584d746fec34c758d28599f.camel@gmail.com>
 <CA+chaQeGeXFd7rH2KjsYdtW50Nnre0DL8ykjjmWSRKNX89OrYg@mail.gmail.com> <f8486647cf50da429e45b457e483bb89a2f2a1b6.camel@gmail.com>
In-Reply-To: <f8486647cf50da429e45b457e483bb89a2f2a1b6.camel@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Jul 2024 10:39:55 +0200
Message-ID: <CA+chaQfrdAhRKwbEwe+5nRxZ71J6RE4eBLzFNsg-u0FZJS815g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/6] Use the kernel from sstate when building fitImages
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 08:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202194

On Thu, Jul 18, 2024 at 10:00=E2=80=AFAM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Hi Martin
>
> Thank you for looking at my patches.
>
> On Mon, 2024-07-15 at 16:32 +0200, Martin Jansa wrote:
> > Doesn't it still rebuild from scratch when IMAGE_VERSION_SUFFIX
> > changes?
>
> I wonder why this happens in WebOS. I think that this line
> kernel_do_deploy[vardepsexclude] =3D "DATETIME"
> prevents such unnecessary rebuilds.

Hi Adrian,

yes DATETIME is excluded by default, but it's useful to use different
suffix in IMAGE_VERSION_SUFFIX (e.g. BUILD_NUMBER from CI on jenkins
or release version when building release) and in such cases you don't
want to vardepexclude it, because it's useful to produce matching
version in images as well as kernel (and other artifacts you might
have), so your 1.2.1 release images doesn't end with 1.2.0 kernel
artifacts just because kernel sstate signature didn't change in 1.2.1
bugfix release.

Does this make sense? I bet it would happen in your builds as well.

Whole point of:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12937
is to allow "renaming" (adding more hardlinks) artifacts with matching
IMAGE_VERSION_SUFFIX without the need of rebuilding anything (e.g.
version-less kernel artifacts are re-used from sstate and then only
quick deploy-links task is executed to add right versioned hardlinks
in deploy directory.)

Cheers,

> So far we haven't had any problems with rebuilding kernels. The trouble
> started when we started using fitImages with initramfs for some
> devices. It is also worth noting that we build from sstate, but with an
> empty TMPDIR.
>
> In such a scenario bitbake does:
>
>  * The initramfs gets assembled. This is expected because images are
>    not sstate cached. This runs quickly because all the packages which
>    are required to build the initramfs come from sstate-cache.
>  * Since the initramfs changes, the fitImage which includes it must be
>    re-assembled as well.
>  * Now the hassle starts: The do_assemble_fitimage_initramfs needs the
>    kernel binaries (linux.bin, DTBs...) which are not available from
>    sttate. Bitbake has to start with kernel do_fetch in case of an
>    empty TMPDIR just to get the fitImage assembled.
>
> With my patches the kernel binaries used for the fitImage come from
> sstate (if the initramfs is not bundled).
>
> I tested this like that:
>
> cat build/conf/local.conf
>
> KERNEL_IMAGETYPE =3D "Image"
> KERNEL_IMAGETYPES +=3D " fitImage "
> KERNEL_CLASSES =3D " kernel-fitimage "and RAM disk
> IMAGE_FSTYPES +=3D "cpio.gz"
> INITRAMFS_IMAGE =3D "core-image-minimal"
> IMAGE_NAME_SUFFIX:pn-core-image-minimal =3D ""
> UBOOT_RD_LOADADDRESS =3D "0x88000000"
> UBOOT_RD_ENTRYPOINT =3D "0x88000000"
> UBOOT_LOADADDRESS =3D "0x80080000"
> UBOOT_ENTRYPOINT =3D "0x80080000"
> FIT_DESC =3D "A model description"
>
> # Allow to change the initramfs
> FOO_VAR =3D "1"
> INHERIT +=3D "image-buildinfo"
> IMAGE_BUILDINFO_VARS:append =3D " FOO_VAR"
>
>
> bitbake virtual/kernel
>
> mv build/tmp build/tmp-old-1
>
> bitbake virtual/kernel
> -> bitbake does:
> - setscene tasks
> - core-image-minimal do_rootfs ...
> - kernel do_deploy (from sstate)
> - kernel do_deploy_fitimage_unbundled
>
>
> bitbake virtual/kernel
> -> bitbake does: nothing
>
>
> # Enforce a re-build of the initramfs
> mv build/tmp build/tmp-old-2
> echo 'FOO_VAR =3D "1"' >> build/conf/local.conf
>
> bitbake virtual/kernel
> -> bitbake does:
> - setscene tasks
> - core-image-minimal do_rootfs ...
> - kernel do_deploy (from sstate)
> - kernel do_deploy_fitimage_unbundled
>
>
> bitbake virtual/kernel
> -> bitbake does: nothing
>
>
> diff \
> <(ls build/tmp-old-2/deploy/images/qemux86-64 -1) \
> <(ls build/tmp/deploy/images/qemux86-64/ -1)
> 4,10c4,10
> < core-image-minimal-qemux86-64-20240718065105.cpio.gz
> < core-image-minimal-qemux86-64-20240718065105.ext4
> < core-image-minimal-qemux86-64-20240718065105.manifest
> < core-image-minimal-qemux86-64-20240718065105.qemuboot.conf
> < core-image-minimal-qemux86-64-20240718065105.spdx.tar.zst
> < core-image-minimal-qemux86-64-20240718065105.tar.bz2
> < core-image-minimal-qemux86-64-20240718065105.testdata.json
> ---
> > core-image-minimal-qemux86-64-20240718073341.cpio.gz
> > core-image-minimal-qemux86-64-20240718073341.ext4
> > core-image-minimal-qemux86-64-20240718073341.manifest
> > core-image-minimal-qemux86-64-20240718073341.qemuboot.conf
> > core-image-minimal-qemux86-64-20240718073341.spdx.tar.zst
> > core-image-minimal-qemux86-64-20240718073341.tar.bz2
> > core-image-minimal-qemux86-64-20240718073341.testdata.json
> 20c20
> < fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> 20240718065105.bin
> ---
> > fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> 20240718073341.bin
> 22c22
> < fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> 20240718065105.its
> ---
> > fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> 20240718073341.its
>
>
>
> The answer is then: No it does not re-build. At least not in the
> scenario which I would like to fix it, it does not rebuild from
> scratch.
>
> Does that make sense?
>
> Regards,
> Adrian
>
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#201933):
> > > https://lists.openembedded.org/g/openembedded-core/message/201933
> > > Mute This Topic:
> > > https://lists.openembedded.org/mt/107231736/3617156
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub [
> > > martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

