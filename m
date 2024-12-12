Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B53E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 13:59:51 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.20118.1734011986463693121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 05:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PP/Wq9+f;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d8e773ad77so4582406d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 05:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734011985; x=1734616785; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wFhcHg4GrGvKMFnW2r78WSfKj4a1c6CVpjPxsxB57E=;
        b=PP/Wq9+ffdu7+oZooIMPHUzo/WdbKxhAd69Gc09jU4tGjVi9/72J6w5T8GX2B4zi4c
         oeJmI+O2YWnTCtyvs+ev0hl2hpyEIshxG4pMuq7ShlEJpJ+fTlmz49dSujTwoL//gP6i
         zIzrqTIwOTje593tLJf/I+ZBrC41ql91VsrScywOJuG2Bxfb/ikAcg5kEwKRWW5w7L7H
         Iox4yUVJBmSohfh6Hd/xbJy9TPyat4YMIytk1j1d0RQXXfQPpj/MKpZzUShHznhOiVGs
         reH/3d1TiY1dyHBx4IoEN5ZUVNw7Wa7jC71njQZwUZ/sUF0BOJ/HCaGZp7sZLvM8U5pj
         e33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734011985; x=1734616785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wFhcHg4GrGvKMFnW2r78WSfKj4a1c6CVpjPxsxB57E=;
        b=oL+QO53m+MAy+mozKk54sCk62IuytsBNQahUCelbutV0YBo96DyPMHP8ltrBEJEEUJ
         UPdXQKhZcfR0odPqRafy+hXFVjrm1I7+3sSwnU15KAxK89JIuFip4h2eTDlWhotzCnoN
         B7Zlzrucv48JEc1FazeJRs27BIvU93aBmIgziFVGM5T8PTewhdHywgV0l4HEjWNoQbxC
         XxSJihIQ+xn8uaCayVMzu0z64UaEyVq7aqk2ZxhjPKGxtDc/BkCAqYT6AUp1qnrHreZI
         5KBedOafSKH5mHWPMXAPc94eAEU3feWCn8bMac6WdoOtiCerR3lN9g+Xs56qAn5cae7Y
         /sWw==
X-Gm-Message-State: AOJu0YwPRM5nfHDIYK+sclcST8hyvVVyND3tHHeGkwitrB8zblDP9Nbt
	5aVy+oicw2R1/O47MCIuODZ9IGLhNwf+yLkWr4tFVt1PJ9MS/9a5WSPOF3EgaS/vJ6kFWtSs3Fu
	Wo3PwZQbCNg6lvvLMYQCNgEgzspk=
X-Gm-Gg: ASbGncslxZxFFCwyz0EbXM33frcqMRxwqro7nXmC6sIueU8JiRJVDEfeEzNBNKsv3w6
	Q3B5Cibh+K/3Zt+3koTCAS7/b1L4OY17Vy23n3eqeXNITBFuiF8bU7D6ivkPCeytQ+SJ6dSUE
X-Google-Smtp-Source: AGHT+IGJnX/LD8XjlivkGekueMPrjC9GBh6oaFIyuHzhB4dQOPVza0eQZ7nMnDlXxuoH5pVIaT7N1fIor+JYVQYLXEQ=
X-Received: by 2002:ad4:5c83:0:b0:6d1:9f29:2e3b with SMTP id
 6a1803df08f44-6db0f73377bmr4398256d6.13.1734011985211; Thu, 12 Dec 2024
 05:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20241204120838.141829-1-alex.kanavin@gmail.com> <509DAE26-9961-4082-96EB-E6F2F8411D2F@arm.com>
In-Reply-To: <509DAE26-9961-4082-96EB-E6F2F8411D2F@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Dec 2024 14:59:34 +0100
Message-ID: <CANNYZj_TR3v38dipHYuTEkTNaEAycCMSqByq3aOt2=5n1EuggQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: update 2.58.2 -> 2.59.2
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 13:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208633

On Thu, 12 Dec 2024 at 14:45, Ross Burton <Ross.Burton@arm.com> wrote:
> > +export EXTRA_NATIVE_PKGCONFIG_PATH =3D "${B}/meson-uninstalled:"
> > +LDFLAGS +=3D " -L${B}/rsvg"
> > +# needed on ubuntu 20.04/debian 11 to avoid 'undefined reference to `d=
lsym'' errors
> > +BUILD_LDFLAGS +=3D " -ldl"
>
> That=E2=80=99s a big pile of yuck, some of which feels like =E2=80=9Chow =
does this work upstream?=E2=80=9D levels of breakage.  Are we exposing flaw=
s in the librsvg build, or our meson integration, or something else?

The last two are flaws in librsvg using custom meson code to run
cargo, which bypasses all of the carefully collected tweaks in the
cargo bbclass. Theoretically one can file bugs with librsvg upstream
etc., but... I just can't be bothered :-/

The first one is better explained here:
https://git.yoctoproject.org/poky/commit/?id=3Dc6557ce953bc858df6b8128748fd=
4fbc41aa88c1

> > +SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " pkgconfig_sysroot_p=
reprocess"
> > +
> > +# installed .pc file contains
> > +# prefix=3D${pcfiledir}/../..
> > +# which is expanded to an absolute path, and thus doesn't work when ad=
ditionally prefixed with a sysroot directory
> > +pkgconfig_sysroot_preprocess() {
> > +        sed -i -e "s:^prefix=3D.*:prefix=3D${prefix}:g" ${SYSROOT_DEST=
DIR}${libdir}/pkgconfig/librsvg-2.0.pc
> > +}
>
> Surely a better fix is to upstream a change to set the prefix to the pref=
ix?

The change would be to pkg-config upstream, which hasn't been
maintained for many years? The issue is there, not in the .pc file
itself. Having 'prefix=3D${pcfiledir}/../..' in it is not wrong.

Alex

