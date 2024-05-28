Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CB7C25B7E
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 08:45:21 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.17625.1716885914460262492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 01:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZLY5ZWA5;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e72224c395so4745661fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 01:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716885912; x=1717490712; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0TxV6ugigDP6D0j8af84doFiQgWuBzNf5SG6P3PQ+aE=;
        b=ZLY5ZWA5t/JLkiWWXgAtGJ28X9yw4Vf8MqYXi85ZZ9KMq53i4QjmMtHCkdN4rSUPbw
         xMSifNW6KAZ1c+az3H1/Zw0brfJJSPZsfwXxkHr7sEJ+JKU03oN3Rv17HGXpLDRp2YvT
         VSohRQg9DAWX5GE4UwXUOp3ts8dvLVDaPf5yrcVUA1/gJ/CFIo1UyOp0N3Tihl/8DvVt
         sgQ8yy4tc4iLuK1hx9qmASpKXSrgbhHJs8m3kxbffo7nQfBdnnSR5PAAY+vbZEyxRRd/
         JsP0fmkNA1H1BxuKM31Cs6fL+bYES2LlopMoDhCbUL/xHw9M9/MgjgH6sTxQsssoE40U
         h7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716885912; x=1717490712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TxV6ugigDP6D0j8af84doFiQgWuBzNf5SG6P3PQ+aE=;
        b=kWEGJSFpCrNUd/rto7+/qCEAok8ZBPRibCmuN5hJW7Ggt9WsjXrJdSDDzkHqsGgnBe
         n0WtHR4DwLAxhrFHkxnTBZ6Sg8xeZHIx3BASTHWb/qInxVZXOJ+Azk1zqyhhFilPuAD+
         dzmWIFKdiMAZc2GwM4l8INBoPTFHXT+3DPzOe1qocWDGmG8KN7IoPYVZuCvw8qtEsUiN
         IB3RXVAQFTYLJjCA4nndZzEdCTxVEZvmE8FFh1WudXxYRIFJio8nECObut65EaHTfHlJ
         irWF85d5/MCu8QVkrWkRea3UYcEM8pcnXp7N4YF/b5+pOanR0DXvT3KkBETwpOZyUXtc
         f7qA==
X-Gm-Message-State: AOJu0Yy1AJaSly3BhshHaoqMFu5WBmBzzf5NOSa8p5Jnl/7cJCnMu3gB
	bHPTSgCWyRnFbspJH1WzRkM10bXWn2YTR2LOiluazfc85rmDU863
X-Google-Smtp-Source: AGHT+IEhX2ZFLlNm1dBjeHla38duWBHkYktN+UL1upLDoLJBnKhZUdmKG7mAr9ZptuvDOHfdJMaD9g==
X-Received: by 2002:a2e:9793:0:b0:2e0:9646:8512 with SMTP id 38308e7fff4ca-2e95b0c091bmr73628411fa.31.1716885911916;
        Tue, 28 May 2024 01:45:11 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98a3eca53sm628671fa.109.2024.05.28.01.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 01:45:11 -0700 (PDT)
Date: Tue, 28 May 2024 10:51:24 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] image-bootfiles.bbclass: new class, copy boot
 files to root filesystem
Message-ID: <ZlWbDL4qswnioROL@gmail.com>
References: <20240525085023.6042-1-marcus.folkesson@gmail.com>
 <20240525085023.6042-3-marcus.folkesson@gmail.com>
 <a18ae6ed-1ab1-4ba7-93d3-e22e00d9554e@cherry.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nNh598CAerwXmPHv"
Content-Disposition: inline
In-Reply-To: <a18ae6ed-1ab1-4ba7-93d3-e22e00d9554e@cherry.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 08:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199953


--nNh598CAerwXmPHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Quentin,

Thank you for your in-depth review.
It is probably obvious that Python is not my mother tounge, so all
feedback is appreciated :-)

On Mon, May 27, 2024 at 05:29:40PM +0200, Quentin Schulz wrote:
> Hi Marcus,
>=20
> On 5/25/24 10:50 AM, Marcus Folkesson wrote:
> > image-bootfiles class copy files listed in IMAGE_BOOT_FILES
> > to the IMAGE_BOOTFILES_DIR directory of the root filesystem.
> >=20
> > This is useful when there is no explicit boot partition but all boot
> > files should instead reside inside the root filesystem.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >   meta/classes/image-bootfiles.bbclass | 38 ++++++++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> >   create mode 100644 meta/classes/image-bootfiles.bbclass
> >=20
> > diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-=
bootfiles.bbclass
> > new file mode 100644
> > index 0000000000..29a38ac631
> > --- /dev/null
> > +++ b/meta/classes/image-bootfiles.bbclass
> > @@ -0,0 +1,38 @@
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +# Copyright (C) 2024 Marcus Folkesson
> > +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> > +#
> > +# Writes IMAGE_BOOT_FILES to the IMAGE_BOOTFILES_DIR directory
> > +#
> > +#
> > +# Usage: add INHERIT +=3D "image-bootfiles" to your image
> > +#
>=20
> One is supposed to use inherit image-bootfiles inside recipes. INHERIT is
> for global inherit, from configuration files, e.g. INHERIT +=3D "rm_work".

Got it, thanks.

>=20
> > +
> > +IMAGE_BOOTFILES_DIR ?=3D "/boot"
> > +
>=20
> I would really suggest to have the exact same prefix as for the
> IMAGE_BOOT_FILES variable since they are related. I would like to avoid t=
he
> DEPLOYDIR, DEPLOY_DIR confusion for example :)

Good point.

>=20
> > +def bootfiles_populate(d):
> > +    import shutil
> > +    from oe.bootfiles import get_boot_files
> > +
> > +    boot_files =3D d.getVar("IMAGE_BOOT_FILES")
> > +    deploy_image_dir =3D d.getVar("DEPLOY_DIR_IMAGE")
> > +    boot_dir =3D d.getVar("IMAGE_ROOTFS") + d.getVar("IMAGE_BOOTFILES_=
DIR")
> > +
>=20
> I would suggest to use
> os.path.join(d.getVar("IMAGE_ROOTFS"), d.getVar("IMAGE_BOOTFILES_DIR"))
> here to make it a tiny bit more robust to missing/redundant slashes (/) f=
or
> example.

That is better.

>=20
> > +    install_files =3D get_boot_files(deploy_image_dir, boot_files)
> > +    if install_files is None:
> > +        return
> > +
>=20
> I'm wondering if we shouldn't print a warning or at the very least a note=
 if
> boot_files is not empty but install_files is, this seems like there could=
 be
> an issue no?

Sounds good, I will add a print.

>=20
> > +    os.makedirs(boot_dir, exist_ok=3DTrue)
> > +    for entry in install_files:
> > +        src, dst =3D entry
>=20
> Those two lines could be merged into:
>=20
> for src, dst in install_files:
>=20
> I believe.

Yep, it worked.

>=20
> > +        image_src =3D os.path.join(deploy_image_dir, src)
> > +        image_dst =3D os.path.join(boot_dir, dst)
> > +        shutil.copyfile(image_src, image_dst)
> > +
> > +python bootfiles () {
> > +   bootfiles_populate(d),
>=20
> I'm surprised by the comma at the end of the line, is this required someh=
ow?
> What does this do?

No it is not. It is a remnant from my debugging. Good catch though.

>=20
> I'm also not entirely sure we need to have this additional indirection? Is
> """
> python bootfiles_populate() {
>     <code from def bootfiles_populate(d):>
> }
> IMAGE_PREPROCESS_COMMAND +=3D "bootfiles_populate;"
> """
>=20
> not working somehow (I don't know if it should, so just asking)? tinyinit=
rd
> in meta/recipes-core/images/core-image-tiny-initramfs.bb seems to be doing
> it, so should/could be possible?

I change it as suggested. bootfiles() did more things before I cleaned
it up, so it is most of a remnant.

>=20
> Cheers,
> Quentin


Best regards,
Marcus Folkesson

--nNh598CAerwXmPHv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmZVmwcACgkQiIBOb1ld
UjJPjg//eOU0QxryM4tj/mXUpAe/KEB6Ub1gG+JKoB55gYRkPbH63ng/1yCvmodw
FcDl6oblKVry7t989LMSVD/WyJPjz/gKYXX2L19Ol2umCoSnTYf90CJYFZp+ItAU
7zJfQa//6UJFigCcH+/VydfHJeHrBtZhK3NvEw5Oniws7ki/NATqOyP0t+OOn40U
BXeO+De6i3QF1jHE1v5cRLmrCyY19OIUuVorcnvX9QypHx0+TEkWOc/yNLAUZvBw
AFGZhP0ah0Wx7s2WB9EUAZv1g94xevio/MTvZtvuaZ4B4w80Yhiwk7rinktlkgul
Ug5PZcOgKFy+QQ4MNLXtVDK4FNuPhEySlJkOm1D8ZKwNokb09cjE4BF+9ZhlD47S
T2mCXg/xoapLLw1nMbf8bjarRRHkfjFqH4USRa7V2X5arCfKNZrI3MzZWmtl9/Rx
fIyi0zZX0fkZBSN/R21NLCvG/XXl9oZmmLgbd5Xap2mYdlS7RTACJbaXi72FyyA5
wGQaFC35I9GRdUnFkkO2L8iRS8yS2eKok+ON9Mok7usyrlKbbytBn9SWyprnc1tu
7WU6tIG2xFZx2+VFB9oGu17IPsRpNaeNece7ZEUocvxHy4vdAbQOIaAps68aR0n2
VUbox6j/MP2i0iaX6yge2vhRnvYQ4cigRhnlCwiH5vkDTO5Qv/4=
=9M2y
-----END PGP SIGNATURE-----

--nNh598CAerwXmPHv--

