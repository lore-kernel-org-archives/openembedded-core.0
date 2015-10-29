Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 24E8573CC7;
	Thu, 29 Oct 2015 15:42:37 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so46033222pac.3;
	Thu, 29 Oct 2015 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=1sv62GivlyS/SokGsrnD3+kT7C9wZdU7xhciurwWI+o=;
	b=ObfTKQrw0obBazXfeo0UHH1KlChUkmUntVS0Cy6pudgSWSwhXDqJ7I9Q2me4YELxvR
	SYIkHGublWtj8Lt7VdRSShcVxw6dxN/CgyDcWBg5DAuYj2UwmZRuvd/aTtaeG799neI2
	/q6d2h2hJg0i4Yu2FWixQu1KmAslu3R3YG9yK71dBamJB3+xjGoENKd+/y8LHs6C/k5/
	UoUEzqDoa+Zzz97jvmwMAKUZjWI2ZBy8Pu8Ijl8sJQR63NxANCArOVF2MSkMamn11uEM
	5YRLV+ilPvVY+Vjqx5PXMsUygKbocaYZNKJc9tJ25vyusAfHIAz28ulGsNNkE2SYpamC
	/7RQ==
X-Received: by 10.68.165.194 with SMTP id za2mr2612312pbb.72.1446133357530;
	Thu, 29 Oct 2015 08:42:37 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:6965:30d8:7236:17cb?
	([2601:646:8601:4580:6965:30d8:7236:17cb])
	by smtp.gmail.com with ESMTPSA id n1sm3095369pap.7.2015.10.29.08.42.36
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Oct 2015 08:42:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Thu, 29 Oct 2015 08:42:31 -0700
Message-Id: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Martin Jansa <Openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
X-Mailer: Apple Mail (2.3096.5)
Subject: State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Thu, 29 Oct 2015 15:42:38 -0000
X-Groupsio-MsgNum: 72740
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C0428F87-7D62-493C-A891-83A5D35B4D4B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C0428F87-7D62-493C-A891-83A5D35B4D4B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi All,

I would like to get everyone=E2=80=99s opinion on the libcs we maintain =
in OE-Core, as of now, we have

glibc + cross localedef + kconfig patches which are left overs from =
eglibc days
uclibc - which is more of less unmaintained

Its a significant effort to keep forward porting the kconfig changes =
since it touches everywhere in glibc, (I do it in my local glibc tree)
almost every week there is a commit in upstream glibc which breaks the =
kconfig patches, I know there are distribution profiles
like poky-tiny which uses glibc in this capacity, and may be then their =
are other custom one=E2=80=99s made on top, I would like us to not carry =
major
patches which almost makes our component a fork due to obvious =
maintenance cost. I think there is viable alternatives to tiny libcs in =
musl now.

I would like to make a proposal for 2.1 release where

1. Drop kconfig support in glibc and we become inline with upstream
2. Move musl support to OE-Core from meta-musl
3. Drop uclibc or leave it in current broken state, I would like to pull =
it out into a layer in meta-openembedded and we can leave the core =
plumbing as it is in OE-Core
4. Poky-tiny switches to use musl

may other disto=E2=80=99s have moved to using musl as system C library =
e.g. alpine linux, openwrt, and I am also deploying it in  real products
its pretty mature and well maintained with very healthy community around =
it. Right now meta-musl is capable of building and running
core-image-sato/core-image-weston for all supported Qemu arches in =
OE-Core, the amount of software it can build is no less than uclibc
support in OE-Core.

if collectively we think, this is a good move then I can work on all of =
above items in early phases of 2.1 so we can settle any
outstanding issues, due to the shuffle especially in poky-tiny

Thoughts ?

-Khem

--Apple-Mail=_C0428F87-7D62-493C-A891-83A5D35B4D4B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYyPmwACgkQuwUzVZGdMxRdBQCggUE4bS/ecLiOtzMoGIU6lFNt
RNYAmwbOGyB9N2/ZGK2jJGyL6Q51wPCd
=ljpM
-----END PGP SIGNATURE-----

--Apple-Mail=_C0428F87-7D62-493C-A891-83A5D35B4D4B--
