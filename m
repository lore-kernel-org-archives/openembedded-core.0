Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6E7C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 07:36:23 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.13127.1721633781282487942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 00:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VhepfzlV;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efd855adbso1815160e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 00:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721633779; x=1722238579; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsHk4Ks6J/cWCrq4aFMBaPjjDhgdJi556Qq4c8QcuT8=;
        b=VhepfzlVmjZ8vheRBtwxR3iSuNhXQV7EvKPP7eR/kJnl7r43iueZe2QOshR8/fLVBl
         eAIuZ6R7qiOgO4ouRQ33oUIxIOy4hlkfib3TofAtVvTfBcuDEDPaBm1sr0PYCSb3U9mz
         OZMDrdC+0SkIme+ej8RTe2+X4v4zlWtorCgD6g6nZ2Zfj2G0CHRktir+cBIFv2cY8yd0
         1FH8CzpR0G1f1hrQ2/GBgSxZyIVeZgSVB5vNnIPuGqDdLJPQIH42j3dxWZQaCm/3U2nt
         ZspmxQl3VWneYNZiQpPceXq+fvXjKtzSrAKUpdTeH0Z859bBFDrsrGxN6VJVQhJK+gVc
         yfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721633779; x=1722238579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsHk4Ks6J/cWCrq4aFMBaPjjDhgdJi556Qq4c8QcuT8=;
        b=Km3WIje0eZ45YvylKebaMcVnKVeeZZ5VXAn/+7sLv0QH3hitHYt4pWTIRHiQo0lH84
         2z4eYOHqmdCuqpNgt1L4WThQODm49krpgu/Yiq6N0DYCfAeZ2VZWb4/gPq5BYyWOFpQP
         nZ5KCuKtYFgHEezusepxC2Pzz6ZFPmgFpvxFd4A3oOHMDjnSoNFLLbKJ9Sionn+Ze0uk
         SKRXyuU8dM1uXxZov+sDLWEN/YBdYqPXbkQmgmq8lEf233N84UKrja32J9vGH+SybORW
         +vbQs5isN9HoseGM0/YKLB7tCG32PnZ50FBDCipJ6omcpDUoDU4xplmMCcp0pQZlQobH
         mCqQ==
X-Gm-Message-State: AOJu0YwcxlfXMqP3TjwgqVgH34KLpA9427LPsRK/U9K4zh7woHbyNJYs
	+WfSpwJYG//2uQPcGOJQT+pOLz88W+Qz2Iqcp3x8n9K5jpL0ussA
X-Google-Smtp-Source: AGHT+IHN0IBXgK4squh4RcqFL2p2aCyTz0rk+VVRhUa4uDISApB1xPwGQ/My1PYKdF0MfNLXqGeYgw==
X-Received: by 2002:ac2:4e05:0:b0:52c:82fa:ef7b with SMTP id 2adb3069b0e04-52efb7beed4mr3701078e87.44.1721633778812;
        Mon, 22 Jul 2024 00:36:18 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef552bff1sm1107345e87.37.2024.07.22.00.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 00:36:17 -0700 (PDT)
Date: Mon, 22 Jul 2024 09:36:16 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 0/2] image-bootfiles: new class
Message-ID: <Zp4L8EByRvtwNWKH@gmail.com>
References: <20240530095314.407638-1-marcus.folkesson@gmail.com>
 <F9A4DF94-3431-46E0-A0BC-9804279DC91C@arm.com>
 <ZmhPsNk6T5PRxTbW@gmail.com>
 <B8E92509-1DB9-4B4C-BE85-CAE559E59506@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yI2wcd0SiolVQKac"
Content-Disposition: inline
In-Reply-To: <B8E92509-1DB9-4B4C-BE85-CAE559E59506@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 07:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202307


--yI2wcd0SiolVQKac
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ross,

On Tue, Jul 16, 2024 at 11:28:46AM +0000, Ross Burton wrote:
>=20
>=20
> > On 11 Jun 2024, at 14:22, Marcus Folkesson <marcus.folkesson@gmail.com>=
 wrote:
> >=20
> > Hi Ross,
> >=20
> > On Tue, Jun 11, 2024 at 10:37:06AM +0000, Ross Burton wrote:
> >> On 30 May 2024, at 10:53, Marcus Folkesson via lists.openembedded.org =
<marcus.folkesson=3Dgmail.com@lists.openembedded.org> wrote:
> >>> The image-bootfiles class is used to put all files listed in
> >>> IMAGE_BOOT_FILES into the root filesystem.
> >>>=20
> >>> IMAGE_BOOT_FILES is used by the bootimg-partition wic plugin to put t=
he
> >>> files into a boot partition.=20
> >>> Be able to list files as "boot files" in e.g. your .conf or image fil=
es
> >>> instead of install those in every recipe is a good thing.
> >>>=20
> >>> It is not always desired to have a separate boot partition for boot
> >>> files. Sometimes it could be good to have them as a part of the root
> >>> filesystem.
> >>>=20
> >>> For example, if a double copy strategy is used for update the system,
> >>> then you probably want to update both the boot files and root filesys=
tem
> >>> at the same time as there may be dependencies.
> >>=20
> >> In my mind, IMAGE_BOOT_FILES is a workaround for the fact that some /b=
oot partitions (such as ones generated by wic) are not managed by bitbake d=
irectly.  If you have a setup where you just have a / that contains /boot i=
sn=E2=80=99t adding eg grub to IMAGE_INSTALL sufficient to get it in the ri=
ght place in the rootfs?
> >=20
> > I don't know about the workaround, but it would'nt surprise me as it is
> > not handled by bitbake as it is now.
> >=20
> > For some packages yes, but not for all. If you, for instance, have an e=
mbedded
> > system where you depend on other files that are critical for the boot
> > process, there is no uniform way to specify that for those files.
> >=20
> > IMAGE_BOOT_FILES is good as it let you include e.g. ramdisks and such
> > that does not have installation scripts to the boot partition.
> >=20
> > The use case that I had was that I was first using a separate boot
> > partition using the bootimg-partition wic plugin. Everything was good.
> > Then I wanted to include those files into the root filesystem instead to
> > be able to do an atomic update on everything, but there is no good way
> > to achive that.
> >=20
> > This image-class make the swap from bootimg-partition to rootfs
> > seamless as it uses the same mechanics for both implementations.
>=20
> The uniform way to put files into the file system is to package them up, =
surely.
>=20
> For example, the u-boot recipe produces a u-boot package:
>=20
> $ oe-pkgdata-util list-pkg-files u-boot
> u-boot:
> 	/boot/u-boot-qemuarm64-2024.07-r0.bin
> 	/boot/u-boot.bin
>=20
> If I add u-boot to the image then it contains /boot/u-boot.bin.
>=20
> So sorry, I still don=E2=80=99t understand what problem this is solving.

The biggest benefit is that the bootimg-partition and image-bootfiles
becomes interchangeable, you may go from a separate boot partition with
all your boot files to whatever directory in rootfs you want. The
content will be the same, all renamed files will be the same and
everything works as before.


>=20
> Cheers,
> Ross


Best regards,
Marcus Folkesson

--yI2wcd0SiolVQKac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmaeC+sACgkQiIBOb1ld
UjJqZxAAqqDk0MF8T+5QcTBS4LqRM8+mtAFMTE3RU84w3a9AqEkkmGs6do1iLM6w
B6v/NxFQdQEvvqIj7KFp7cyv/vKk8KCmORLWEFNIEHDnmg01YZBSlK2ajPKWTrs8
mEYvgC1dtbQqZnib8Dlv5BmspnnFpzZbISaqiuo3WRyRsKojdVq0qwNyOYgsRQ7g
nX9k7srYrU0h7r8J/KHwsIr+UHp7FkoDXc9UZyfY/l8A4J53xVZFUCxufcd8nyr1
TXk6R4WOoxdJ40jCOqLnh/3ENve8keqoW/oMCvGaDCxWEaxEUFhDbSI9shOVbt0y
txIemHYJgc1jv5KRXO9X/Wan7NwIn7FgCU8271poj1p5stdZJJnqSFLomE7f1acs
Js3haeLFKzs4VOxXegDCqmW32EN99BR2TYhzh4dA9mTJVDmAADsmbARCN0t5tjrU
2pKXmTyEQ6oBAO1jKq2P7UYMaNwqTDtC0H00+8KaDGPh9sdz5utuwrRyWUFtX1ci
+5uybKjWyjSp8tUDdwF7Gf4+XrwNb/27EjBah/6WniWbur5sxVDApcC9vdohyxmg
OqQaRJK78ghGm6ZZQwG6/DPsCp+96hWaIX5rWeOHw2IvsfIbPgaGHJ3M7tMj50mg
GuZSYLy2cSLPEnuhQqZCjOm3TO9v60m1XS7LG2DfKLtZ2s8IsUM=
=S3QT
-----END PGP SIGNATURE-----

--yI2wcd0SiolVQKac--

