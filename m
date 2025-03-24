Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F020AC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 10:45:21 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.36156.1742813116978854009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 03:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LiKe8hYL;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8fca43972so44753526d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742813116; x=1743417916; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Fhol+L1ofhjhCTSwoUEoaODe12xSvybOLoNmcpUzAE=;
        b=LiKe8hYLpSoVFNWaH9xqO+5JSCYWsnELzX25q9Xgu17YWHArynLKvvXFwE/AlALaDv
         dFy3SJm0BzqibpN1uK+ehDkf1cKgL0Ivz+xJxIGxKdx85z+sRm8bTx29r1z6ll3Ihc5j
         kZUvzE+LE1MPIt92iE4rX1awqugMYpX8OWbrFLwf/oYmDAGqAG+N0J0rcAUg5D66FckE
         ijVqPcfB0RzbAfQwNxsRKiqtX/Nt93bcfoGDBjdGN8Jo0XGOOzIu0WZghteefXlCMcEK
         7y7gr2uXImDt84i6JKFiLJ1JfL/vFBEQC0JZ63F2Bw5aXBmjDtWJZZPGLqv1PO2EEeks
         IVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813116; x=1743417916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Fhol+L1ofhjhCTSwoUEoaODe12xSvybOLoNmcpUzAE=;
        b=lpcrQQ9v/a1AB3kLTfepQWJG4ihhaSDr0koier4gDm9+K1i/yGox7U+0ne7SMNaDmD
         4ExGCZByDJzRKJTSMXfRlsAnKBQHOpzj5jaYRl9oj/F2/gnNYzvmp/X8gwJwt/ASflhD
         isl31ELSp0FKVM43kAYT2wpMXSVoGKHAqzyuLLBofRR/hmSwVmgMo0n4/rTea/7AYR8x
         /xqjmXj3nh8RhkmhFtp2X/TFI8FKeIqqW172BCqwPGKNroGUpcyQoG2tbEjcvrC/FDxZ
         KrRiQ+334zKrWTsjjUgKwZxYxsUgWyIrYMeETavkYiaI+XBMa5vDJe0TfRyR7cL+haUM
         +X+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWKjOyvwNLgXPoyo/CMh50rX8e0qfxou16KFoN+ioGbDtxgVqMHBzx5qfsWD3mTy9RJJFO5k8ClHjgdW84TKHQ/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1YbZYM7JhJZIp2cP9NkkpvquXjjkXdyDb5B4sh1xStz3UqGcZ
	PkY5O5ALAHP6mLMiyoZbIm+mFA42fiBfcXmePsCrOzKVmDu5aEBdDnXitPh986p1AKniw7vMEiq
	9Vi3dUtGuv5k07mGlBRX29anGBVfXzCDX
X-Gm-Gg: ASbGnctYfpIboa9NpyPUrRRPrNHxNL51MlILgjmvp1rN7u2jtcSnSJxNBzt0LxJ1aYo
	GHSDN1oul777uCRWcGBmOh8jyQp0E1ZsAIGItFkh69xHfX4SdqOjyWeJslaH/EI+9XiheZbh8jj
	TzfAO8YggoQFtDCE0ERkYaqI/ca+q0sxSqR10Fk4O51AE9fgbgq5OFPnmg40tq
X-Google-Smtp-Source: AGHT+IHkoqdG+nlOpaPHVDi8HEyvbTYNldHdyBgXWO29RVMOB9zmY+EUauCd3kpX8EsDEW0+7FIc06ur0gSVBaRUt+g=
X-Received: by 2002:a05:6214:5294:b0:6e8:f2aa:a8af with SMTP id
 6a1803df08f44-6eb3f36a718mr188282946d6.38.1742813115793; Mon, 24 Mar 2025
 03:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com> <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Mar 2025 11:45:04 +0100
X-Gm-Features: AQ5f1Jp3ZgNpGK-IRjuwS7tBI_ZRJLmEh5L-7DFbwLo2vD-JeWJEBmHeHOucQGY
Message-ID: <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
Subject: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
To: Mario.Schuknecht@iris-sensing.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213525

You can see in the error log that this selftest failed:

2025-03-23 17:20:09,617 - oe-selftest - INFO - RESULTS -
runtime_test.TestImage.test_testimage_apt: FAILED (69.22s)

You can find what it does here:
https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/runtime=
_test.py#n183

Alex

On Mon, 24 Mar 2025 at 11:39, Mario Schuknecht via
lists.openembedded.org
<Mario.Schuknecht=3Diris-sensing.com@lists.openembedded.org> wrote:
>
> Hi Mathieu,
>
> thanks for your reply.
>
> I have tried to reproduce the error but without success.
>
> How do you set up the environment and what command do you run?
>
> Regards,
> Mario
>
> ________________________________________
> Von: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Gesendet: Sonntag, 23. M=C3=A4rz 2025 18:44
> An: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
> Betreff: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_pa=
ckage
>
> On Fri Mar 21, 2025 at 4:12 PM CET, Mario Schuknecht via lists.openembedd=
ed.org wrote:
> > Inherit lib_package to create an extra libgpg-error-bin package for
> > executables. As a result, the gpg-error and yat2m executables are now i=
n
> > this libgpg-error-bin package, and no longer in the libgpg-error
> > package.
> >
> > Signed-off-by: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
> > ---
>
> Hi Mario,
>
> Thanks for the v2, but it looks like we still have a build error:
>
> ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Unable to install packag=
es. Command '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-=
1148269/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/recipe-s=
ysroot-native/usr/bin/apt-get  install --allow-downgrades --allow-remove-es=
sential --allow-change-held-packages --allow-unauthenticated --no-remove  a=
pt dpkg gnupg packagegroup-core-boot packagegroup-core-full-cmdline package=
group-core-ssh-openssh psplash run-postinsts signing-keys-packagefeed ssh-p=
regen-hostkeys' returned 100:
> Reading package lists...
> Building dependency tree...
> Reading state information...
> Some packages could not be installed. This may mean that you have
> requested an impossible situation or if you are using the unstable
> distribution that some required packages have not yet been created
> or been moved out of Incoming.
> The following information may help to resolve the situation:
>
> The following packages have unmet dependencies:
>  gnupg : Depends: gnupg-gpg but it is not going to be installed
>          Depends: libgpg-error (>=3D 1.51)
>          Recommends: pinentry but it is not going to be installed
> E: Unable to correct problems, you have held broken packages.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/54/builds/1247
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1159
>
> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213524): https://lists.openembedded.org/g/openembedde=
d-core/message/213524
> Mute This Topic: https://lists.openembedded.org/mt/111829729/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

