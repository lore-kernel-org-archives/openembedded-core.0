Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E9AC27C75
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 14:57:57 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.11848.1718117875432807384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 07:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zu6ZsgaY;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c84a21c62so2895532e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718117873; x=1718722673; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AyJIHdl84UqC21Wm7x2Zylzd9AfffWYHlU2IL+gk1yA=;
        b=Zu6ZsgaYdaab0Pr+hqS/9TNUp53glU05/EnLCGG7nMHv3K91sE5lhJzcL7jf8BZrGI
         Kqgjo/26d5FJCWAk7NgneaeiGHFmJd9SnjCbMJ4xwpOLgL8a3oJKA+UR5gQNscVZwJQl
         a8XFY0/gFDZbPXwqoL3ji5AjbQadEuPBhrhrF+YpCrQIY6AKJWYrGOOD3iIS5oWTi6I4
         E/dVPtFpaAUsXn0MI2EmdBOjgv4p1FzA7ruN8u/ueiCtZmJiFC5Y8Ddf+/hNUlLqNYsd
         fnnWtVCu9JMumXzZ5bUioWGki9E9Fr4qARVsGhV/pTDnwHmy6jcLm2J4z91N3XBqqMcW
         txQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718117873; x=1718722673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyJIHdl84UqC21Wm7x2Zylzd9AfffWYHlU2IL+gk1yA=;
        b=lI7D8R0IVDJG5V7kmbrhScGYOAH81PBSGKmoEcJiCxp9c67EN/KiHUCAJpfolrY7gc
         Z8W+6eSbkzcEPRAXr8jrN2DyAWkE+OseL7lSnTqyHI4+ZP40+Q+8x2i9VI5j0gxRMTb/
         VQMHxn1fKYrb8h8nfNE7SiHHxVS+/04/Rxw68TpoVveJ+I7CUdNHOBC6LkWbg9jjDNiS
         1l3t+Ok25mdcfjRAULsESwGT3umhk378B7WUTCGSkBSWUwhFz+7gRpc+e2AoCzhE4SPs
         GwkprhX8xsc2EfGA/F50msk618/g0yl4t05f4XOi332m5BmP05uKFRU/uBEsGRG10CMP
         nppQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4cJbup09Iib3z6oExe2A0JouQ3alx6q4DxBn240W3KMar3TCE6llySmig94CKnHzUTX8WqeDQUKja5IkqY+uT9LigGgsyvlBThOiPxWbqah5abhCZpXbJ
X-Gm-Message-State: AOJu0YzPAlxU1787f3/EqoSkzoDNd8E/VYAQKkKplnnlknLojZvz28ux
	zTE6kyqnMDpEIea1VKoOVEli/qxbyR4rTy0qWxgE5m/v6isXFZPNylPZcA==
X-Google-Smtp-Source: AGHT+IHONbn+KJOvmnAMrAGlIRTmsFmDkDbNKMS2vqpumLusqTYjlBLg/18l3t7pJE0R0c1+A23Uhg==
X-Received: by 2002:a05:6512:318e:b0:52c:9528:55d1 with SMTP id 2adb3069b0e04-52c952856f6mr1676854e87.4.1718117873313;
        Tue, 11 Jun 2024 07:57:53 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c82c37a25sm1421882e87.149.2024.06.11.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 07:57:52 -0700 (PDT)
Date: Tue, 11 Jun 2024 17:04:08 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 0/2] image-bootfiles: new class
Message-ID: <ZmhnaAv3KziwhCKF@gmail.com>
References: <20240530095314.407638-1-marcus.folkesson@gmail.com>
 <F9A4DF94-3431-46E0-A0BC-9804279DC91C@arm.com>
 <ZmhPsNk6T5PRxTbW@gmail.com>
 <e21366a98f2769cb7460ad6ebfe86ad3a51c24cd.camel@geanix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FVotlNAVd4HwBbTo"
Content-Disposition: inline
In-Reply-To: <e21366a98f2769cb7460ad6ebfe86ad3a51c24cd.camel@geanix.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 14:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200537


--FVotlNAVd4HwBbTo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Martin,

On Tue, Jun 11, 2024 at 04:44:04PM +0200, Martin Hundeb=C3=B8ll wrote:
> On Tue, 2024-06-11 at 15:22 +0200, Marcus Folkesson wrote:
> > Hi Ross,
> >=20
> > On Tue, Jun 11, 2024 at 10:37:06AM +0000, Ross Burton wrote:
> > > On 30 May 2024, at 10:53, Marcus Folkesson via
> > > lists.openembedded.org
> > > <marcus.folkesson=3Dgmail.com@lists.openembedded.org> wrote:
> > > > The image-bootfiles class is used to put all files listed in
> > > > IMAGE_BOOT_FILES into the root filesystem.
> > > >=20
> > > > IMAGE_BOOT_FILES is used by the bootimg-partition wic plugin to
> > > > put the
> > > > files into a boot partition.=20
> > > > Be able to list files as "boot files" in e.g. your .conf or image
> > > > files
> > > > instead of install those in every recipe is a good thing.
> > > >=20
> > > > It is not always desired to have a separate boot partition for
> > > > boot
> > > > files. Sometimes it could be good to have them as a part of the
> > > > root
> > > > filesystem.
> > > >=20
> > > > For example, if a double copy strategy is used for update the
> > > > system,
> > > > then you probably want to update both the boot files and root
> > > > filesystem
> > > > at the same time as there may be dependencies.
> > >=20
> > > In my mind, IMAGE_BOOT_FILES is a workaround for the fact that some
> > > /boot partitions (such as ones generated by wic) are not managed by
> > > bitbake directly.=C2=A0 If you have a setup where you just have a / t=
hat
> > > contains /boot isn=E2=80=99t adding eg grub to IMAGE_INSTALL sufficie=
nt to
> > > get it in the right place in the rootfs?
> >=20
> > I don't know about the workaround, but it would'nt surprise me as it
> > is
> > not handled by bitbake as it is now.
> >=20
> > For some packages yes, but not for all. If you, for instance, have an
> > embedded
> > system where you depend on other files that are critical for the boot
> > process, there is no uniform way to specify that for those files.
> >=20
> > IMAGE_BOOT_FILES is good as it let you include e.g. ramdisks and such
> > that does not have installation scripts to the boot partition.
> >=20
> > The use case that I had was that I was first using a separate boot
> > partition using the bootimg-partition wic plugin. Everything was
> > good.
> > Then I wanted to include those files into the root filesystem instead
> > to
> > be able to do an atomic update on everything, but there is no good
> > way
> > to achive that.
>=20
> I'd suggest updating the recipe providing those boot files, so it
> installs them into /boot (maybe in addition to deploying them to
> $DEPLOYDIR).

Yes, that is the option.

>=20
> > This image-class make the swap from bootimg-partition to rootfs
> > seamless as it uses the same mechanics for both implementations.
>=20
> I have always disliked the concept of recipes pulling files from
> ${DEPLOY_DIR_IMAGE}. That folder is an output folder, and should not be
> used as input for other packages.
>=20
> Instead, a proper do_populate_deploy task similar to
> do_populate_sysroot would make it possible to DEPEND +=3D on deployed
> files from other recipes.

I would probably have implemented it differently if we did not already
had the bootimg-partition plugin that works this way.

I think there is a point in having them work in a similar a way.

>=20
> But this is probably a discussion for another mail thread. Sorry for
> raising my opinion so late in the process.

No problem, all feedback is good. Thank you

>=20
> // Martin


Best regards,
Marcus Folkesson

--FVotlNAVd4HwBbTo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmZoZ2MACgkQiIBOb1ld
UjKW4BAAvglA8UN4GA/UqXjnEU60FmPXiBOLajZILmOo2BVsEN1mwNXafoLZAK2l
uqx54woirmHJLXEGHAkVzoajHAdVBvzDh0g5HPW0UQ7q4Lq939A09AGXW9s7tHCN
ZhFGhNRYWeT80PTfZM/c/sJEP2nr5QRykHJl9BZaDA2UiQyCOt4IKmcAZCGJyRyb
nBDzkwpS9ikRTrT8bFG00W63uiQEitU/wI0qace17m0UvpHR7CieBoylYTwLVZ+C
R33Cn1wNwpxjZ1iGvAyUrbdYZPbAcWF1m8mD57aPu98p8fk7LQxffKGOH+K+OhWa
RQdjCWmw0RP+ftaa4VJVpQpcQc0dgeYiB8uQdPmI/rHHM3vxIUV9zYFLxe/TIdag
ib9PFO+5YySWVkDBj/McMsD2FQdrEyxApSlWLzz5Hkv5uHxy5q4dv8q4SJJw2zac
FS/tbggWZh1XggPllgbkSz1xQ2YvIXlq9GKXgmCU7pSMPfaGVrd+sm5Dd8StwwFq
ACdZ6+Imxc/+14CLw05uudbiVb5IVDy5/L2Lz0TNBvJZgstkpl10UncS3Is1L0vc
iI6ZyMpef5QttyjH2ZDyV/B6hHMO4nMTgmCz1bgHz4N2mnp174CDpnEL+Pmm+39F
fsoiaLF6ng3RvjrrByeJfSdnclhpICPAFeAGnbIIJP6qc5Tk7oc=
=0o/i
-----END PGP SIGNATURE-----

--FVotlNAVd4HwBbTo--

