Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 11CF965E2E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:42:04 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so2740965wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=saSxicVdza+DJGvVl0LSZrjGtFul3DOyKQCV9lFYLCc=;
	b=aYgx5iB9z3cUdOTV/ER3A7o6+AbIt2mnvPTQ4s3xiunu2ZcEJ3iMJAPkf9thc4Kp0C
	dSgfosnOZLpw06cDHuGzB8nfVNEDsGTBrJ43S1uQjt63yxMsBMT2Xg94HpqzFmRXhWpo
	OWI5p6IAEpGW8z+tMm+cmUkm+2L6isS0igwh785MjXquZp7FUYXQzT52okV/GHVQOf93
	leJU+uXoBuHSexE/KRG82nIba0hhA53Ap3dABMcefqkHwVL9gOVVUDaQ0QW1CLa1Xahw
	t12uA6ePwxF4M6FVueUQCMuFI0SDu85y67LOTsnevQ1dSTEMw7xMzpZCxuTaOS+RS4OF
	Bm8A==
X-Received: by 10.180.83.8 with SMTP id m8mr50366273wiy.8.1407336125098;
	Wed, 06 Aug 2014 07:42:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o2sm18931696wij.24.2014.08.06.07.42.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 07:42:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 16:42:34 +0200
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20140806144234.GL14848@jama>
References: <1407259572-35454-1-git-send-email-paul.gortmaker@windriver.com>
	<20140806082154.GB14848@jama> <53E23999.1010809@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53E23999.1010809@windriver.com>
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
X-List-Received-Date: Wed, 06 Aug 2014 14:42:09 -0000
X-Groupsio-MsgNum: 56058
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xb8pJpF45Qg/t7GZ"
Content-Disposition: inline

--Xb8pJpF45Qg/t7GZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 10:20:09AM -0400, Paul Gortmaker wrote:
> On 14-08-06 04:21 AM, Martin Jansa wrote:
> > On Tue, Aug 05, 2014 at 01:26:12PM -0400, Paul Gortmaker wrote:
> >> Currently util-linux is fragmented into lots of small chunks,
> >> and if one is looking to avoid using busybox wholesale, there
> >> is currently no easy way to say "I want all of it".  Here we
> >> create a packagegroup for all of the util-linux chunks, so
> >> that it need not be duplicated by everyone wanting the same
> >> overall goal of removing busybox.
> >=20
> > Why don't you define these as empty packages with just RDEPENDS
> > in util-linux?
>=20
> Sorry, but I'm not quite sure I follow what you mean.  Can you
> provide more detail, or perhaps point at a bb as an example
> implementation of what you have in mind?

e.g. kernel-modules which doesn't contain any files but has RDEPENDS for
all built kernel-module-*.

Similar are python-modules, perl-modules, gst-meta-*, libdrm-drivers,
pango-modules, ..

> Thanks,
> Paul.
> --
>=20
> >=20
> >> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> >>
> >> diff --git a/meta/recipes-core/packagegroups/packagegroup-util-linux.b=
b b/meta/recipes-core/packagegroups/packagegroup-util-linux.bb
> >> new file mode 100644
> >> index 000000000000..54151502b176
> >> --- /dev/null
> >> +++ b/meta/recipes-core/packagegroups/packagegroup-util-linux.bb
> >> @@ -0,0 +1,69 @@
> >> +#
> >> +# Copyright (C) 2014 Wind River
> >> +#
> >> +
> >> +SUMMARY =3D "util-linux Packages"
> >> +DESCRIPTION =3D "Packages created from util-linux"
> >> +PR =3D "r0"
> >> +LICENSE =3D "MIT"
> >> +
> >> +inherit packagegroup
> >> +
> >> +PACKAGES =3D "\
> >> +    packagegroup-util-linux \
> >> +    packagegroup-util-linux-block \
> >> +    packagegroup-util-linux-console \
> >> +    packagegroup-util-linux-uid \
> >> +    packagegroup-util-linux-misc \
> >> +    packagegroup-util-linux-partition \
> >> +    "
> >> +
> >> +RDEPENDS_packagegroup-util-linux =3D "\
> >> +    packagegroup-util-linux-block \
> >> +    packagegroup-util-linux-console \
> >> +    packagegroup-util-linux-uid \
> >> +    packagegroup-util-linux-misc \
> >> +    packagegroup-util-linux-partition \
> >> +    "
> >> +
> >> +RDEPENDS_packagegroup-util-linux-partition =3D "\
> >> +    util-linux-fdisk \
> >> +    util-linux-cfdisk \
> >> +    util-linux-sfdisk \
> >> +    util-linux-partx \
> >> +    "
> >> +
> >> +RDEPENDS_packagegroup-util-linux-console =3D "\
> >> +    util-linux-agetty \
> >> +    util-linux-reset \
> >> +    "
> >> +
> >> +RDEPENDS_packagegroup-util-linux-block =3D " \
> >> +    util-linux-mkfs \
> >> +    util-linux-mkfs.cramfs \
> >> +    util-linux-fsck.cramfs \
> >> +    util-linux-fstrim \
> >> +    util-linux-fsck \
> >> +    util-linux-blkid \
> >> +    util-linux-libblkid \
> >> +    util-linux-umount \
> >> +    util-linux-mount \
> >> +    util-linux-libmount \
> >> +    util-linux-swaponoff \
> >> +    "
> >> +
> >> +RDEPENDS_packagegroup-util-linux-uid =3D "\
> >> +    util-linux-libuuid \
> >> +    util-linux-uuidd \
> >> +    util-linux-uuidgen \
> >> +    util-linux-findfs \
> >> +    "
> >> +
> >> +RDEPENDS_packagegroup-util-linux-misc =3D "\
> >> +    util-linux-losetup \
> >> +    util-linux-readprofile \
> >> +    util-linux-lscpu \
> >> +    util-linux-mcookie \
> >> +    util-linux-bash-completion \
> >> +    util-linux-hwclock \
> >> +    "
> >> --=20
> >> 1.9.1
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Xb8pJpF45Qg/t7GZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPiPtoACgkQN1Ujt2V2gBxvUACff2zjS+bOy+Wl3KWRxBKh3iCY
4MEAn1aMFjDg+tGZpb4S9ip0FLLbaRRY
=g5kO
-----END PGP SIGNATURE-----

--Xb8pJpF45Qg/t7GZ--
