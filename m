Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0B1C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 13:56:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.15072.1720619752800167609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 06:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c/XxWzjy;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-36799a67d9cso5063633f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720619751; x=1721224551; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs012mv22UvpZ8kE/UrG0IkUD0VWqF+sfUE4EVYzETQ=;
        b=c/XxWzjyeYQ5ejzEHZQoosUoJhvPEkdD9ePSi+xyrfvVj2qeX7gfwrck5t0lRMcX22
         zXa8u4ubnsAsJ6tkttgHI/3oHI2MIzotBY95ysMsGbKsNYUKQAijw1ynStLldLstKNQ6
         UIhcDPi2y+6fYyOt93yQchIEsGbQfQCaOG6vlnaiZqa5paBOTaKwQ/1X4LvNCVaqJMgX
         jXWA58ytIZDz+jKeDxiOr73MGq/vHAWWcdARu2TxUOdCHL1cmerDEc2hrPfDuSRVqusQ
         zq1SC9zdc9cR6vfUyztKznLsYuvbdTBz92qGplgjnfhmWrM4n/0Jiak7Tf6TVGlYl0/S
         OmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619751; x=1721224551;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rs012mv22UvpZ8kE/UrG0IkUD0VWqF+sfUE4EVYzETQ=;
        b=uUDQnLPKzgAeg5HqtuiDhlx3GpOhwWS/tjNX4Eoq899qpkoY7BTHp5SYVCvbfqNsue
         I0jkDpQJkaKLpJQ7WkHROm8udmsuqSHGfPW2s8hN4jgHqWK91h7KQyfwtOlqli3ZRbMm
         iSwyY7GnGaUF8s9YO756InvyHn/MTmgunvLwIdMXtNO2mIxOfwCTVABbeDXr8ab45p/B
         /tLE8UwgYLbHQlrUck01IU4PaJgWMTUqaCh0FxyQPrYvGS5SSl8ZqhPWiyvu7Oha3cyy
         SYYfuwW2ihUTzpoyPFiRC1XKYou6ZD1PGzQRLnyDpfUHUQcNUJ/I+T/FQb6lTYu6UKi/
         T1MA==
X-Forwarded-Encrypted: i=1; AJvYcCXP5sKGWjzgTloIeGCNlxCu+RI1ye8/DLqNQBPo/y6UM053bALlLv1GeJod210ZoS46L/JIcPqqvnAeb0Xtu8SRbf74dVlTd5N6O0kHA4e3JXWK+lNtOwFy
X-Gm-Message-State: AOJu0YyoGUt4jDFMS7t9PyjsxEARuGB+/WDDngqRDNfpFbREGTUeGyXy
	7kULnE1VcsXu3RHTGWK6bVlYefM20mkya5RztUiQ/jOvr0FJmbRv
X-Google-Smtp-Source: AGHT+IFhuVwQH+qBcYpkZxuObOWFf3NjJin7PJ+Z76KPeot4L7T7pzS/MljUlCGeV58tLFv2FpRFIA==
X-Received: by 2002:adf:f691:0:b0:366:f2c2:61f3 with SMTP id ffacd0b85a97d-367cead1138mr4869659f8f.51.1720619750920;
        Wed, 10 Jul 2024 06:55:50 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab0b4sm5370544f8f.90.2024.07.10.06.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:55:50 -0700 (PDT)
Message-ID: <4c9a1976c0392df112a38b22f80a5461ba19d02f.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 00/14] Use the kernel from sstate when
 building fitImages
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2024 15:55:49 +0200
In-Reply-To: <cc5bf2cb09ef50d38a28d50ab988743dd01d9eae.camel@linuxfoundation.org>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
	 <cc5bf2cb09ef50d38a28d50ab988743dd01d9eae.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 13:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201732

On Wed, 2024-07-10 at 10:46 +0100, Richard Purdie wrote:
> On Thu, 2024-07-04 at 09:09 +0200, Adrian Freihofer via
> lists.openembedded.org wrote:
> > If the KERNEL_IMAGETYPES(S) contains fitImage, the kernel is always
> > rebuilt when something changes in the initramfs, which happens
> > frequently.
> > This is even worse if the build runs from an empty TMPDIR. The
> > kernel
> > re-build starts by fetching the large kernel git repository and
> > recompiling it from scratch.
> >=20
> > This cannot be improved if INITRAMFS_IMAGE_BUNDLE =3D "1". If the
> > kernel
> > Makefile is needed to generate the initramfs bundle the kernel
> > build
> > folder is required.
> > But for a build configuration with INITRAMFS_IMAGE_BUNDLE =3D "" the
> > build folder is not needed. Creating the initramfs bundle requires:
> > linux.bin, DTBs and the initramfs which are available in the deploy
> > directory. That means creating the fitImage can be done with
> > artifacts
> > which are already cached by the sstate.
> >=20
> > There is an extra commit providing a html file. This html file
> > provides
> > some graphics which show the changes in the kernel's task
> > dependencies.
> > I hope this simplifies the re-view of this patch series.
> >=20
> > Adrian Freihofer (14):
> > =C2=A0 oe-selftest: wic fix deps of
> > test_efi_plugin_unified_kernel_image_qemu
> > =C2=A0 oe-selftest: fitimage refactor u-boot-tools-native
> > =C2=A0 oe-selftest: fitimage drop test-mkimage-wrapper
> > =C2=A0 oe-selftest: fitimage cleanup asserts
> > =C2=A0 oe-selftest: fitimage fix test_initramfs_bundle
> > =C2=A0 kernel-fitimage: fix handling of empty default dtb
> > =C2=A0 kernel-fitimage: fix external dtb check
> > =C2=A0 kernel: execute do_bundle_initramfs only when needed
> > =C2=A0 kernel-fitimage: refactor do_assemble_fitimage_initramfs
> > =C2=A0 kernel-fitimage: refactor creation of linux.bin
> > =C2=A0 kernel-fitimage: fix intentation
> > =C2=A0 kernel-fitimage: run unbundled fitimage after deploy
> > =C2=A0 image: depends do_deploy_fitimage_unbundled
> > =C2=A0 DO NOT MERGE: explanation and testing
>=20
> I think there was a failure in automated testing from this series on
> genericarm64:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/165/builds/583
> https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/587

This is reproducible on my side. It works without my last patch but it
breaks with my last patch.

Thank you for the feedback, I will investigate.
Adrian

>=20
> There was also:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5730
>=20
> but I think this was systemd upgrade related. I'm not 100% sure
> though.
>=20
> Cheers,
>=20
> Richard


