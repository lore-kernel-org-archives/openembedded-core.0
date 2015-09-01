Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id D739565D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 23:55:47 +0000 (UTC)
Received: by pacwi10 with SMTP id wi10so11309922pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3GSIeKW30heDCpx5hPPNY3CaoA/j36dOcE+z1yfkvj8=;
	b=Y/MZC7+0ZZZkCbqw5nIZGF7bBwYBJ1hHImR846nIXFdVjnmJ3/MdYeehk9BYsyqzpg
	1qUDdp/GMHqwGcL/O2r8OSoebUDeoDcJS9eZvEyrPZ0CGU24OFpjuahZ4XQHg9Zv9Dj+
	bysgU1tu9W9IEhPsRHUMe/JpqAYQoJ347wrAnHnGGXJ/tDlntWwM4/AzxwMj/2sYox3G
	Vqbp6ssqeGcm53u5ZXt9KdEaybJpAuuB98FH9wziOu44P4luFqdFkEzKyI+qGLGPzQW0
	cS0TA7v14jJKYrFGFkyob3qwWwX5TPXS8Lh+1dB/oOVvYgcJpjo2hdZxjqsm5vdgs5wi
	7oxQ==
X-Received: by 10.68.182.3 with SMTP id ea3mr50591465pbc.126.1441151747622;
	Tue, 01 Sep 2015 16:55:47 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:49fd:b69d:583d:d543?
	([2601:646:8601:4580:49fd:b69d:583d:d543])
	by smtp.gmail.com with ESMTPSA id
	iw8sm19405607pbc.21.2015.09.01.16.55.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Sep 2015 16:55:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441142254.24871.22.camel@linuxfoundation.org>
Date: Tue, 1 Sep 2015 16:55:37 -0700
Message-Id: <7B715C23-22C6-4F08-8389-45CCE8EA7D9A@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
	<96e447b0dad1a139b68ee85780055379147ba40f.1440446289.git.raj.khem@gmail.com>
	<1441142254.24871.22.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/17] busybox: Use CC instead of bare LD to be the Linker
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
X-List-Received-Date: Tue, 01 Sep 2015 23:55:49 -0000
X-Groupsio-MsgNum: 70457
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EDBFDBCD-717E-4E42-A3E4-57B79D136B96";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EDBFDBCD-717E-4E42-A3E4-57B79D136B96
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 1, 2015, at 2:17 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
>> =
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linu=
x/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
>> error: applets/built-in.o: unsupported ELF file type 2
>> clang-3.7: error: linker command failed with exit code 1 (use -v to =
see invocation)
>=20
> This breaks DISTRO=3Dpoky-lsb:
>=20
> http://errors.yoctoproject.org/Errors/Details/15705/
>=20
> (searching for busybox shows many other versions of this too)
>=20

OK I think we add -fpie to poky-lsb. is that right ?
now instead of calling ld directly we are calling gcc to do linking so =
we now also get the baggage of CFLAGS since LDFLAG =3D CFLAGS
which is actually correct but in this case we are trying to do partial =
linking so -pie is useless at this stage of linking. So what we need is
to ignore -pie ( add -fno-pie) in LDFLAGS when doing partial linking. I =
will send a reworked patch.

--Apple-Mail=_EDBFDBCD-717E-4E42-A3E4-57B79D136B96
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXmOwEACgkQuwUzVZGdMxR+9gCePYhJHLaEJ7sKH0CjmRtzaz8H
OloAn038r9hkCY33NdQ4F14WHoqNxZeZ
=ta6p
-----END PGP SIGNATURE-----

--Apple-Mail=_EDBFDBCD-717E-4E42-A3E4-57B79D136B96--
