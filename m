Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 306EC65D5F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 08:21:24 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so2694949wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Sp5zvMuQ6df2OQEc8iBWldfGtZCmzhaahybQaNPpveo=;
	b=CT60WpHfOlhwJ7h93ee29vTMiLBIjhumJt9mVgz2Tx/IjzO7yck0+se7/eqEHCh6r9
	AoULuSVKTUiaeBKJoEr00HQA48aSWevZW3DfNyd0iJD9EsyPxPB+UHHkesSN1KYlYYFl
	Jir48yJmwj3dmLMFVUKnQvUhugek8sm5DiVI+Gle+6icc8vcwMJjzZ1f/aCtCFzPJkwM
	aAl8D9FBRtUPIbvqdR5XhLu9+WCGTPvYpoy6Ak0Dn5SRFCe2M+At1K/b6YtK1k0+M/h+
	G0bVPyoa9qzi8TpaFomM3cj6becCZSvjXWLA3Pl/wVCWcAcZtZ4d8z9CHi7efnGc1Lrv
	Lhkw==
X-Received: by 10.180.212.41 with SMTP id nh9mr35539670wic.66.1407313285230;
	Wed, 06 Aug 2014 01:21:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gq4sm3761724wib.8.2014.08.06.01.21.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 01:21:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 10:21:54 +0200
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20140806082154.GB14848@jama>
References: <1407259572-35454-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1407259572-35454-1-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: create an all encompassing package group
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Aug 2014 08:21:25 -0000
X-Groupsio-MsgNum: 56034
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline

--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2014 at 01:26:12PM -0400, Paul Gortmaker wrote:
> Currently util-linux is fragmented into lots of small chunks,
> and if one is looking to avoid using busybox wholesale, there
> is currently no easy way to say "I want all of it".  Here we
> create a packagegroup for all of the util-linux chunks, so
> that it need not be duplicated by everyone wanting the same
> overall goal of removing busybox.

Why don't you define these as empty packages with just RDEPENDS
in util-linux?

> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-util-linux.bb b=
/meta/recipes-core/packagegroups/packagegroup-util-linux.bb
> new file mode 100644
> index 000000000000..54151502b176
> --- /dev/null
> +++ b/meta/recipes-core/packagegroups/packagegroup-util-linux.bb
> @@ -0,0 +1,69 @@
> +#
> +# Copyright (C) 2014 Wind River
> +#
> +
> +SUMMARY =3D "util-linux Packages"
> +DESCRIPTION =3D "Packages created from util-linux"
> +PR =3D "r0"
> +LICENSE =3D "MIT"
> +
> +inherit packagegroup
> +
> +PACKAGES =3D "\
> +    packagegroup-util-linux \
> +    packagegroup-util-linux-block \
> +    packagegroup-util-linux-console \
> +    packagegroup-util-linux-uid \
> +    packagegroup-util-linux-misc \
> +    packagegroup-util-linux-partition \
> +    "
> +
> +RDEPENDS_packagegroup-util-linux =3D "\
> +    packagegroup-util-linux-block \
> +    packagegroup-util-linux-console \
> +    packagegroup-util-linux-uid \
> +    packagegroup-util-linux-misc \
> +    packagegroup-util-linux-partition \
> +    "
> +
> +RDEPENDS_packagegroup-util-linux-partition =3D "\
> +    util-linux-fdisk \
> +    util-linux-cfdisk \
> +    util-linux-sfdisk \
> +    util-linux-partx \
> +    "
> +
> +RDEPENDS_packagegroup-util-linux-console =3D "\
> +    util-linux-agetty \
> +    util-linux-reset \
> +    "
> +
> +RDEPENDS_packagegroup-util-linux-block =3D " \
> +    util-linux-mkfs \
> +    util-linux-mkfs.cramfs \
> +    util-linux-fsck.cramfs \
> +    util-linux-fstrim \
> +    util-linux-fsck \
> +    util-linux-blkid \
> +    util-linux-libblkid \
> +    util-linux-umount \
> +    util-linux-mount \
> +    util-linux-libmount \
> +    util-linux-swaponoff \
> +    "
> +
> +RDEPENDS_packagegroup-util-linux-uid =3D "\
> +    util-linux-libuuid \
> +    util-linux-uuidd \
> +    util-linux-uuidgen \
> +    util-linux-findfs \
> +    "
> +
> +RDEPENDS_packagegroup-util-linux-misc =3D "\
> +    util-linux-losetup \
> +    util-linux-readprofile \
> +    util-linux-lscpu \
> +    util-linux-mcookie \
> +    util-linux-bash-completion \
> +    util-linux-hwclock \
> +    "
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPh5aIACgkQN1Ujt2V2gBzTdACfSt1tHhHzxN4j/rMNJHS26d0h
nosAnj/8fKElKojqdUzl2/KbdtoibqoE
=Hjup
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
