Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2846BC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 11:34:32 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.19709.1716896063008948252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 04:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ggyixtN5;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e974857588so6665471fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716896061; x=1717500861; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HFkc50XwgQAZ6D1IzggKu4KUNZ9OVSeKwKJ4Zup4Hg=;
        b=ggyixtN5hnGRIuLKtyLy6HQxRKubdhzBXb2y06K02xXlcnReUXhXo+OYtWycDzaecF
         bWLUpS4oX9kfecMZL+5rbta5VqoaXAlfFs9EbQquo/QMU52AdPVcgbmOTzSuk3EKOVC6
         /1hU8aVIB0tawfE5AU0/SFuku0TT0MF3dhI1+37GRNQN73uct8lLV8/8UsQREnycsowG
         yxdN2VGvh4qzHM9MY111C1P11nUbe7PfRIBnvBk5mqjgCvct7fv2C/hFIKEydzON30Wk
         YGI/Dd8471Q/IRqLQ5IstbZzUnTHU2VEsZ1IW4hK5wLb887k7pWbQr5/sZWArVVzdQrx
         j83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716896061; x=1717500861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HFkc50XwgQAZ6D1IzggKu4KUNZ9OVSeKwKJ4Zup4Hg=;
        b=b79gqkMNvXHrpsJEi44jYnfoG6Hq+Llc9i1eOBAcT7SHekTuCAeeIrX913H6gQK6ME
         Za+ARhRhdBDf4S47Tt8TOB0YC2+0YY+DYDIPx2kYNEAorZkgdgnkaM1o9L5IxP7lgYbO
         +MdErvjDWBV0bq2psAjkxR4HO6Ov+V4EaiWWTkl7+PkB48hG+46po3N6I0tD2P95DGjA
         3kS0Px4tylcQLS0IPou9hCy/PTqWm3qvOiuo33o2M5hWrcPUDYIf2KeGlElYwxi+7ai5
         bRYau6qyhmrTaj2mNXxoj4/vH6nciCcw4gnn2X5OnGI6J6EUhcsPDVCpSxU0QfsL0p44
         VOfg==
X-Gm-Message-State: AOJu0YwCC8JUMXTFvX/GaSNhnA9QL3M3sNhexCtEL+lNvU64h+U2gncv
	BxYbdyEq+zFQKG7G3u4lRcYmkkWaFh71QZqxkkvsZTd9OPwabQer
X-Google-Smtp-Source: AGHT+IFu8VGbkLUiDwyZXZNKmDpaomcSGnFTt+r63N6cCCd+DhERTKiaguwykwzqwNiE48HteLRlWQ==
X-Received: by 2002:a2e:b385:0:b0:2e1:cb22:a4d with SMTP id 38308e7fff4ca-2e95b25679dmr73100211fa.36.1716896060686;
        Tue, 28 May 2024 04:34:20 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95be04536sm22516191fa.112.2024.05.28.04.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 04:34:20 -0700 (PDT)
Date: Tue, 28 May 2024 13:40:33 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 2/2] image-bootfiles.bbclass: new class, copy boot
 files to root filesystem
Message-ID: <ZlXCsQkoqxoiwpXN@gmail.com>
References: <20240528090832.725884-1-marcus.folkesson@gmail.com>
 <20240528090832.725884-3-marcus.folkesson@gmail.com>
 <2261f556-6e25-4d18-9147-2f9d361bdaeb@cherry.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cw3NbZhPvL28fnfA"
Content-Disposition: inline
In-Reply-To: <2261f556-6e25-4d18-9147-2f9d361bdaeb@cherry.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 11:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199970


--Cw3NbZhPvL28fnfA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On Tue, May 28, 2024 at 01:23:20PM +0200, Quentin Schulz wrote:
> Hi Marcus,
>=20

[...]

> > +#
> > +#
> > +# Usage: add inherit +=3D "image-bootfiles" to your image
> > +#
>=20
> Simply
>=20
> inherit image-bootfiles

Noted

>=20
> c.f. https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-us=
er-manual-metadata.html#inherit-directive
>=20
> since you put this class into meta/classes/ and not meta/classes-recipes/,
> it could be included both with
>=20
> INHERIT +=3D "image-bootfiles"
>=20
> and
>=20
> inherit image-bootfiles
>=20
> The former is to be included from configuration files (e.g. a distro,
> local.conf, machine conf file, etc.). The latter inside the image recipe
> directly.
>=20
> I am wondering if we shouldn't make this a recipes-only bbclass? so moving
> it to meta/classes-recipes/? This means that we won't be able to use the
> INHERIT +=3D "image-bootfiles" anymore but.... should we? On one side, we=
 have
> something that only applies to images, on the other hand, it's probably
> something close to a policy, so rather part of a distro. So just wonderin=
g,
> not asking for a change :)

I don't have a strong opinion, I let this be to what people think is
the best.
If I must choose, I think it is more of a distro thing.

>=20
> Cheers,
> Quentin
>=20
> > +
> > +IMAGE_BOOT_FILES_DIR ?=3D "boot"
> > +
> > +python bootfiles_populate() {
> > +    import shutil
> > +    from oe.bootfiles import get_boot_files
> > +
> > +    deploy_image_dir =3D d.getVar("DEPLOY_DIR_IMAGE")
> > +    boot_dir =3D os.path.join(d.getVar("IMAGE_ROOTFS"), d.getVar("IMAG=
E_BOOT_FILES_DIR"))
> > +
> > +    boot_files =3D d.getVar("IMAGE_BOOT_FILES")
> > +    if boot_files is None:
> > +        return
> > +
> > +    install_files =3D get_boot_files(deploy_image_dir, boot_files)
> > +    if install_files is None:
> > +        bb.warn("Could not find any boot files to install even though =
IMAGE_BOOT_FILES is not empty")
> > +        return
> > +
> > +    os.makedirs(boot_dir, exist_ok=3DTrue)
> > +    for src, dst  in install_files:
> > +        image_src =3D os.path.join(deploy_image_dir, src)
> > +        image_dst =3D os.path.join(boot_dir, dst)
> > +        shutil.copyfile(image_src, image_dst)
>=20
> This won't work if the parent directory of image_dst doesn't exist yet.

Good catch, I will do as you suggest.

[...]
>=20
> Cheers,
> Quentin


Best regards,
Marcus Folkesson

--Cw3NbZhPvL28fnfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmZVwqwACgkQiIBOb1ld
UjJbxw//ZSIDArSb11mFL11ns90R+IdOq/4G6TRT62ASM83wm/QTG1FnREfiBaSl
1zPZtauB5ZBeuL8FtEM2ObK2w7Z9/Rrcro7jjONu6iztNwoZRgZk9cyISvNggJua
aNMbLq+Z4fuJoPZQI7ycMRu8mlwr+DiHJEDxlwliaezhPP8Hz6Ev54lx31tI/A1S
15kfEihHTdsS4MnhPrJat4sleiFKgurCEtowndxXAchfF9WuR2+ebILVLCPiKOAT
d7+Ov05ps5ksy2OFx9DxjxzZ7AKKAc3QlosTQC3bdlH701oOBLOXU1475NRVqFP5
wjORNORcw5xwAKFye4lXdUhjhGFt5kl45dI/HHsdA501qTU/7VOnfx6Z3M5yps6q
lagApPSRfGETxkR+cX9bLW5+Ek52HXF9LFd5R7HYAsGs5uacr3ho1TyDuUDINv9D
0Vd96J0kblfInqPYJ3PJ30/wEOIzZrBlW4g10Fi7C5Tecmfj1zkjJ46j6HgEHRNT
hS215na8IlvWJlG9v2KzLF6x4aNkYp9MujJrDERRmvbJgm76biUFGUsdVuhRyOfx
nos3DVRe/L37y+C7+JxdAKmsZRj5ScVLORUhbAdgMoNyZEVPBQb5cIZCuHK3LQmi
weRkCZQD1xPKbkgNXH5GRQ3+ZJY/MKgZaoOIie3Wblt7+ulAo4g=
=iBTe
-----END PGP SIGNATURE-----

--Cw3NbZhPvL28fnfA--

