Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4FACEE35F
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 22:37:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.30569.1728513415335169822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 15:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HAImpy1s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so1993675e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728513414; x=1729118214; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn4JcM0DBo652Ndv4hSC3BKVBaUK8NhMu6iBnk4mXF0=;
        b=HAImpy1smPZ+RnXxhkWQesKZ0RkLOoTE3tQMYqPXHSgdNAsDu9nB+gk+nCBLYYu+xO
         Mjwr8EO/i7GHBPPT4HoXtQo9IU3RGeidvpUOK4VzeYaaklaZTfrVRpiA/64TkArlhZku
         Ee7v73ZK00DYVvx8QQuakFUEXgY2MoqJ2/Vdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728513414; x=1729118214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vn4JcM0DBo652Ndv4hSC3BKVBaUK8NhMu6iBnk4mXF0=;
        b=CxPXp/VDU0AYXPEtN5btHJ1ISaOSExYrpa28JPmYoQkJgK8UisRZUS+T1Q0gX3DKRQ
         KpZROdcOk+1zL5blNaElwFfEhWWbuCuQ9GUnx6jW67P6oSQLktcw/5Leflo4/57cMq5L
         ACUqb5BOTYzNPfbYFjbrDWb13TCSMJI0Sm0IooqrlsxlLjokYf2dvsNMFiuogWWTykIR
         zp5C+CKbRnOedtAKDEUN7Xl8fhpN4QUUZy2cehQI0o/VTtDm1HYZY59pOasoMaYXDvDY
         NOsDm0+NsmGmGBgkc0BlYjRFGqZN50IN3bltry0MDlcdygI9YZrUq7TVd9xUBOnIjUlU
         2SSw==
X-Forwarded-Encrypted: i=1; AJvYcCWDV9KGx6krjilV+aTlJxireBQXSe075VYtOfyB0gllCuT0qFxv0425YVwnMGvtX2wzSEZCNUBVgM98xhQjjX2fEw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6Bc6srjd+NB2W7tmCXVXOgxytAhPs+dxluyGEwNUreDPENaeD
	zR5qQqfqqFRoGG2luCXNIfqoc+4qmWNFzHBuWEUPKf653cZBsUk6KbzH9mRzI9ue4mYu2zYzgfQ
	X
X-Google-Smtp-Source: AGHT+IGCTUgM7uOA0NeG3H489UjFuivz/1+dnnI/kZ3iD8XplEasP3eWXxlm1cZfEZVaN1Cx1EVJ2g==
X-Received: by 2002:a05:600c:3b16:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-430ccf1a8ffmr28621335e9.8.1728513413608;
        Wed, 09 Oct 2024 15:36:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb33:4e5d:4941:5018? ([2001:8b0:aba:5f3c:fb33:4e5d:4941:5018])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf5f462sm31738725e9.23.2024.10.09.15.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 15:36:52 -0700 (PDT)
Message-ID: <21828cb8152b762bbc4987312e2dc0c0613c34fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 0/8] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Wed, 09 Oct 2024 23:36:51 +0100
In-Reply-To: <17FCDA527F20D203.22523@lists.openembedded.org>
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
	 <17FCDA527F20D203.22523@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 22:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205373

On Wed, 2024-10-09 at 18:53 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2024-10-09 at 14:26 +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > These changes enable building systemd uki images which combine
> > kernel, kernel command line, initrd and possibly signatures to
> > a single UEFI binary. This binary can be booted with UEFI firmware
> > and systemd-boot. No grub is needed and UEFI firmware and/or
> > systemd-boot provide possibilities for boot menus.
> > The uki binary can also be signed for UEFI secure boot
> > so the secure boot extends from firmware to kernel and initrd.
> > Binding secure boot to full userspace is then easier since for
> > example
> > kernel command line and initrd contain the support needed to mount
> > encrypted dm-verity etc partitions, and/or create partitions on
> > demand
> > with systemd-repart using device specific TPM devices for
> > encryption.
> >=20
> > Tested on qemuarm64-secureboot machine from meta-arm with changes
> > to
> > support secure boot. Slightly different configuration tested on
> > multiple arm64 System Ready boards with UEFI firmware, real and
> > firmware
> > based TPM devices. Tested with ovmf firmware on x86_64 with
> > selftests but
> > without secure boot which seems to be harder to setup in ovmf.
> >=20
> > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu
> > and
> > wic.Wic2.test_expand_mbr_image, failing when executing all wic
> > selftests
> > on a build machine with zfs filesystem. Will investigate this
> > further.
> > The issue seems to be in mkfs.ext4 producing broken filesystem, and
> > partially
> > in the tests which don't run the correct rootfs file (.ext4 vs
> > .wic).
> > Will debug this further and it is IMO unrelated to these changes
> > since
> > they reproduce on pure master branch without this series.
> >=20
> > v6: fixed wic refactoring botch which broken non-uki systemd-boot
> > usage on
> > =C2=A0=C2=A0=C2=A0 genericarm64 reported by Ross Burton <Ross.Burton@ar=
m.com>,
> > added
> > =C2=A0=C2=A0=C2=A0 selftest to cover this wks usage on x86 and aarch64
> >=20
> > v5: drop patch "image_types_wic.bbclass: set systemd-boot and os-
> > release
> > =C2=A0=C2=A0=C2=A0 dependency for all archs" since systemd-boot does no=
t support
> > all
> > =C2=A0=C2=A0=C2=A0 architectures
> >=20
> > v4: handle missing runqemu variable from build config, add
> > python3-pefile to fast ptest list
> >=20
> > v3: rebased, fixed and added more sefltests, removed wic plugin
> > side uki
> > support
> >=20
> > v2:
> > https://lists.openembedded.org/g/openembedded-core/message/204090
> >=20
>=20
> This seems to be causing selftest failures unfortunately:
>=20
> https://valkyrie.yoctoproject.org/#/builders/54/builds/206/steps/14/logs/=
stdio

I think something may be broken in master causing that. Not quite sure
what/when yet.

Cheers,

Richard

