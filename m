Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01EDC27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:16:46 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.9311.1718111804037033309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MFpdb2Ld;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bc27cfb14so4999811e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718111802; x=1718716602; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+a5M7tlq8FK+1Mq8j55w5701FRw8S3B2V/TbKbP9hk=;
        b=MFpdb2LdRRBGmPhPAQcrIC8XnQeO12ctA0AMtfn//8ilPRg36djACQwohz6z9f/1de
         h19N0AY2n4Zhij+IY85VvyfV+RDbvcFyTyAygL0SSBFHFmBHoRiJui5Oyh3ZAI/xEH6I
         p+YjGWTAlL8VyIK7yLZttVtATkdD1StKGydIxHJmK/XlfwezV2RTqXG/aBNdINnCMuH6
         1o7VU0CaJr5YAVIg7eJHANdReqg/KDY2lmizuwh2KHLDq2e57SoPKm4aV8xHdhG+7iUY
         8jFeqR7FVWS1xEezsIxFjMw7GDP22xijPCXJ+oDftXXvjh46pwNKo0jPlJ81svHu80Rz
         fEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111802; x=1718716602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+a5M7tlq8FK+1Mq8j55w5701FRw8S3B2V/TbKbP9hk=;
        b=ap1268LjiX1PzkO8jlBVJbfZ33KfizTeMZBNG5qHTKl31Ufj0k8S2kMTgFsSTUgCXN
         Cc3laI7aXSPVGD9hnkRaMSVYlWIVSQsvaLUoKBUkYuy1Z8ou7c1uzZsW2EHvEIn0vaCv
         6l3Y2ZBJVDRsXyIQ5/XArkwDKulBAOGZvqwftIITsWpQyVAHnp+AyM5tSbJP3JFTi8B+
         IhN1sVZHuIn/KADA5aiO9EwClnUmOYJLhc3/D6Qyx82iFYkhvGPVCryqCeSYgtLk6qC+
         XqHQC6TmhwyhoHH3n0XYhD8y/R/rNHhmaoEFtp9jsZ4HI5t5fVbTzLms+4ro9RQ5pE1Y
         SG0w==
X-Gm-Message-State: AOJu0YwKzvsA9vX7Q2znXYPtspiTzYWjjkucGm3V70wdJOIgCfZsiexO
	bwYuT4NkpdsIrQeLnYg6Nb87qRe7fKJ8mchrujSZZ/Fc4REJ2/2O+MIRbw==
X-Google-Smtp-Source: AGHT+IG+lJEH0DyXJgidr5lu+hop3kXnhsLN2j31w8noYaS3kpRAmMJFUZCnqeOEtzla+y1SA2AuLw==
X-Received: by 2002:a05:6512:e94:b0:52c:82c9:6d6a with SMTP id 2adb3069b0e04-52c82c974bemr7434256e87.21.1718111801850;
        Tue, 11 Jun 2024 06:16:41 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c87fdb43esm1194000e87.121.2024.06.11.06.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:16:40 -0700 (PDT)
Date: Tue, 11 Jun 2024 15:22:56 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 0/2] image-bootfiles: new class
Message-ID: <ZmhPsNk6T5PRxTbW@gmail.com>
References: <20240530095314.407638-1-marcus.folkesson@gmail.com>
 <F9A4DF94-3431-46E0-A0BC-9804279DC91C@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2APCZs9bfynL714a"
Content-Disposition: inline
In-Reply-To: <F9A4DF94-3431-46E0-A0BC-9804279DC91C@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200520


--2APCZs9bfynL714a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ross,

On Tue, Jun 11, 2024 at 10:37:06AM +0000, Ross Burton wrote:
> On 30 May 2024, at 10:53, Marcus Folkesson via lists.openembedded.org <ma=
rcus.folkesson=3Dgmail.com@lists.openembedded.org> wrote:
> > The image-bootfiles class is used to put all files listed in
> > IMAGE_BOOT_FILES into the root filesystem.
> >=20
> > IMAGE_BOOT_FILES is used by the bootimg-partition wic plugin to put the
> > files into a boot partition.=20
> > Be able to list files as "boot files" in e.g. your .conf or image files
> > instead of install those in every recipe is a good thing.
> >=20
> > It is not always desired to have a separate boot partition for boot
> > files. Sometimes it could be good to have them as a part of the root
> > filesystem.
> >=20
> > For example, if a double copy strategy is used for update the system,
> > then you probably want to update both the boot files and root filesystem
> > at the same time as there may be dependencies.
>=20
> In my mind, IMAGE_BOOT_FILES is a workaround for the fact that some /boot=
 partitions (such as ones generated by wic) are not managed by bitbake dire=
ctly.  If you have a setup where you just have a / that contains /boot isn=
=E2=80=99t adding eg grub to IMAGE_INSTALL sufficient to get it in the righ=
t place in the rootfs?

I don't know about the workaround, but it would'nt surprise me as it is
not handled by bitbake as it is now.

For some packages yes, but not for all. If you, for instance, have an embed=
ded
system where you depend on other files that are critical for the boot
process, there is no uniform way to specify that for those files.

IMAGE_BOOT_FILES is good as it let you include e.g. ramdisks and such
that does not have installation scripts to the boot partition.

The use case that I had was that I was first using a separate boot
partition using the bootimg-partition wic plugin. Everything was good.
Then I wanted to include those files into the root filesystem instead to
be able to do an atomic update on everything, but there is no good way
to achive that.

This image-class make the swap from bootimg-partition to rootfs
seamless as it uses the same mechanics for both implementations.

>=20
> Ross
>=20

Best regards,
Marcus Folkesson

--2APCZs9bfynL714a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmZoT6sACgkQiIBOb1ld
UjK4cRAAzo4sZLbpsKmNfAPit2HM4aZ3OuOxk2xzM+sUKrJKusXLjCIUZc4odcMU
ryic/VaAB1FhniLyr/e39i7P6vwXkcYTdAvZEmcyeQ57N3NMMYcYCGVv1m8wT+VL
pU2n0jSTx4bA4dOs2DnK0EL4z4elcVNV4Yo9amExpAGvrynKj88L1kdwJSF49fAW
xDy54AGkQgWtwwqpe/vbdzcYUaXtO+Pols52sbP9sJ9XOPDIhNbg/m+5iQe7zojM
pQl7kZblUSxzLJx7m5L/NHW3jK6uOLVvOmuzziQa7SYYraNSFjk+mRRyf9cOwxPm
c7oeTS0m1u9f/a+wR3h7uS94K5Wj3Fm0s9I37OdxguHq8ASGiS/VCk5nJDVTRw7C
f0zT+34eOw5tyIlKuTU3A6woPaxF3TUaNCStcEy96jXw9Egwk7+5nV1odh5KOFQ4
5OMi4mR7zs3BXCbgY9rwBaoawWPn5v7pcJ2GfgZ1TeLympNlNC9IE0OCH7elEZEK
NUlB3YP+/mbQJxjRuCvxLRSHUWerdrVhqmzMC9eoemzbvJrv5+m0si2VtUACGTM/
k4qpFSU8LZkED1BtuyI7MMmrzkpMKIBxq2zbXCiEzJZD5DgmSoWk10tOoYUP8iEe
CJzTBASXM8H+m25qYHoA42qpUrkfzyaECVBjZuaay4JShQIwsHU=
=qNK9
-----END PGP SIGNATURE-----

--2APCZs9bfynL714a--

