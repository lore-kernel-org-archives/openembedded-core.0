Return-Path: <haokexin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA955C5478C
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 06:32:32 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.15804.1709620343747826976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 22:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yr2g2Gpq;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: haokexin@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so45372085ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 22:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709620343; x=1710225143; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptYO7Xvv0sZXJdhYCixpr0f+TxWjGybsTm/q2d7ftQI=;
        b=Yr2g2GpqrCdnD6fcYTIJHicZjX0OBQHwGgPnvIsLPrI9hmXTsl4Y05epmWNEpNptBg
         JYqlEMd8uQJh2aPOswNZM5Mw60Q55fpAeQWEtHg4ZuqsfE5ZVBsZrOp77Y7yEKD1onSM
         fyBMaykvDHaEHJKDoQ/sOFYGUH9+tjY5RXXqa6nHp6gAC5i8RFV5zaPHQHfDIKBXnvc2
         +yyfjMdI9r2OCypSuUPXMtxiDSdEKk2KGIV0NHve7Z+PCwOScYx0/OOraWbtpiqBAasI
         hNJCUZS6KW8a2Kx001ojWv8guQCntmXN/J/55cJQih4kR5jazh8Aih6c2Quo/inVkFwR
         L0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709620343; x=1710225143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptYO7Xvv0sZXJdhYCixpr0f+TxWjGybsTm/q2d7ftQI=;
        b=duNJlvBP+CboJcnrQWW7FUcMWFmXAMauTfZrrm8IIYp0prlYjHwigkT3cQcRQf/abD
         ZA2aaHGm1f77hXtC2/zqMXcbo3o8QgORPYCIEYGnxjt/GAkjRqeipwavbhqhhylRd/fZ
         rr1lmSZG5amKY3SfLcvX6hFU5hYDx+CXtU8QJoTBu9UpwLJprdla4bPxuHy5icWsQHgI
         AQJiN5o7QuSFURha566brPzqmpsFMOLCC11Z41BIQqbrrReCjtDgmPkteMHtX7Ka4ej/
         wvO+GyE7huOQD8O8IAI2md3ZHzf2QqnyrIKenejMYlWv3cz55vlLc6uSEKngsPGz+Sc6
         DP8Q==
X-Gm-Message-State: AOJu0YyI1/hlqnu2pvTFopb2GMj2lQqSWv4p/mbrJkERJq89pKAuBU8y
	AzP+Ju3D058pv3XrnH5GjJ+1QgxR4KVTcpEQ0anes4wcIff6sqp6
X-Google-Smtp-Source: AGHT+IFcfduV6wUiRslhdyN5b0Rs1r3PJphIJljpX5d0lw9PVgwWUaAjNssXmTbOb07EFL/NOvBOlQ==
X-Received: by 2002:a17:902:f283:b0:1db:d826:45a1 with SMTP id k3-20020a170902f28300b001dbd82645a1mr1129672plc.9.1709620343094;
        Mon, 04 Mar 2024 22:32:23 -0800 (PST)
Received: from pek-khao-d3 (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902821100b001db40866e09sm9626393pln.260.2024.03.04.22.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 22:32:22 -0800 (PST)
Date: Tue, 5 Mar 2024 14:32:15 +0800
From: Kevin Hao <haokexin@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image-live.bbclass: Adjust the default value for
 INITRD_LIVE
Message-ID: <Zea8b-Itf6V3k1vH@pek-khao-d3>
References: <20240303065454.4141916-1-haokexin@gmail.com>
 <aa9d8319cedf564d2c3bbfd5c92870d927e1bcc5.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jWI5G0TSoNrbeLd1"
Content-Disposition: inline
In-Reply-To: <aa9d8319cedf564d2c3bbfd5c92870d927e1bcc5.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 06:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196621


--jWI5G0TSoNrbeLd1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 12:11:51AM +0000, Richard Purdie wrote:
> On Sun, 2024-03-03 at 14:54 +0800, Kevin Hao wrote:
> > From: Kevin Hao <kexin.hao@windriver.com>
> >=20
> > - After the commit 26d97acc7137 ("image-artifact-names: include
> > ${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and
> > ${IMAGE_LINK_NAME}"), the image names have changed from
> > =A0 core-image-minimal-qemux86-64-20230307181808.rootfs.ext4
> > =A0 core-image-minimal-qemux86-64.ext4
> > to
> > =A0 core-image-minimal-qemux86-64.rootfs-20230307181456.ext4
> > =A0 core-image-minimal-qemux86-64.rootfs.ext4
> > So we also need to add ${IMAGE_NAME_SUFFIX} to the default INITRD_LIVE.
> >=20
> > - The ${INITRAMFS_FSTYPES} may contains multi filesystem types,
> > such as "cpio.gz cpio.xz". So it can't be used directly in setting
> > of the default INITRD_LIVE. We choose the first filesystem type
> > in ${INITRAMFS_FSTYPES} for the default INITRD_LIVE.
> >=20
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> > ---
> > =A0meta/classes-recipe/image-live.bbclass | 2 +-
> > =A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> I think this causes:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/8468/st=
eps/11/logs/stdio
>=20
> unfortunately.

Sorry, my default. ${IMAGE_NAME_SUFFIX} shouldn't be added to INITRD_LIVE. =
V2 is coming.

Thanks,
Kevin

--jWI5G0TSoNrbeLd1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmXmvG8ACgkQk1jtMN6u
sXF3Gwf/aaXohQ14xHRjtcJpyreEkRZlK2M7p0OEfRI8jkueObapQ6CRI1HZxLk7
HnOSP3RHxyQiqfnn7Av/PB6hB/d5q3zsNdH0WkL9iRu1sUFbdGWBWOx2gPb53J+a
0OxPc1NEY6ebsoACl2xjYbl21ty77dZYHfJRFu6EeQ/mkMoHfnSHFqYa80gGczRs
dBNTbm/jQijXUKnqUDma7tNXK7m6Xfb68HqXvgNwo93rMVBihZispQVu2NgeDLTr
EmuQmqT9VHN43BeKgYx2iKQbsPWJMpdsRXPWBZ/o4c6T4/IhMAHzHo2TBh9ZItVP
Xd6k3nneQnezwBirBZudD8pSskd7kA==
=rEtq
-----END PGP SIGNATURE-----

--jWI5G0TSoNrbeLd1--

