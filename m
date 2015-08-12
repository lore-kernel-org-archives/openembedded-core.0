Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0ECBC767D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 04:35:48 +0000 (UTC)
Received: by pawu10 with SMTP id u10so5734808paw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 21:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=xFVtTBoXA+Qr2N1LHFAGB1lGDnVE/1V8Jq4ws6nj2tc=;
	b=n6Hhor2U8eaqAfDtjwVwbyeg9zrMTmdEawpOttg8ZzFExP7Mnp6GynGXhUx/UN4lDd
	Ke1Gt/CNX+VyJ8xfdlpbzz/lH5QEnMDwqdu8UcTymn/Z7TVlHJJPrnPSriwmib+29iD0
	aegu7tgt8lzXj7N4NFAHIxMNdDw8RhnjxPwfj2L8oNFZnuTCHuel6+OArLGaYQUkgIPh
	rdenJxyHUgyHyUG4eec5FhatzxN2L3gX7sD/6ohzO9QemeG7QxNVYAIIY2qwuo7YqTSL
	Mj/uhBZf12jqoi0N23Js0ZudiZ6XmcBdfru74bpgWsskTve9aHQD+08ED7YhKDsKapK+
	I9uQ==
X-Received: by 10.66.132.16 with SMTP id oq16mr64731654pab.13.1439354148552;
	Tue, 11 Aug 2015 21:35:48 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:902f:c5bd:9646:395e?
	([2601:646:8601:4580:902f:c5bd:9646:395e])
	by smtp.gmail.com with ESMTPSA id
	dr4sm4574935pbc.61.2015.08.11.21.35.47
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Aug 2015 21:35:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150812032630.GF26375@denix.org>
Date: Tue, 11 Aug 2015 21:35:42 -0700
Message-Id: <7151A67B-1A6D-458C-AE94-580834380909@gmail.com>
References: <20150812032630.GF26375@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: oprofile rebuilds for different MACHINES (sstate)
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
X-List-Received-Date: Wed, 12 Aug 2015 04:35:51 -0000
X-Groupsio-MsgNum: 69328
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B9362359-EBD7-43B0-9D41-716293EB5482";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B9362359-EBD7-43B0-9D41-716293EB5482
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 11, 2015, at 8:26 PM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> So, I've been debugging the issue of oprofile rebuilding from one =
MACHINE to
> another (causing PR issues, etc). I was able to trace it down to this =
line:
>=20
> EXTRA_OECONF =3D "--with-kernel=3D${STAGING_KERNEL_DIR}  --without-x =
ac_cv_prog_XSLTPROC=3D"
>=20
> And STAGING_KERNEL_DIR resolves to this:
>=20
> STAGING_KERNEL_DIR =3D =
"${TMPDIR}/work-shared/${MACHINE}/kernel-source"
>=20
> Now, obviously, when MACHINE changes, sstate invalidates do_configure =
and
> rebuilds oprofile.
>=20
> The question is, what is the proper fix in this case - mark oprofile =
as
> machine-specific with PACKAGE_ARCH =3D "${MACHINE_ARCH}", since it =
will be
> configuring and building against (potentially) completely different =
kernel
> tree. So, just mark it explicitly and be safe...
>=20
> Or another option is to tell sstate to ignore changes to the above =
variables
> with this simple line:
>=20
> EXTRA_OECONF[vardepsexclude] =3D "STAGING_KERNEL_DIR"
>=20
> This also does the trick, but I'm a bit worried there could be =
side-effects of
> using oprofile against the wrong kernel... Any recommendations?

Using kernel staging dir is unnecessary here, oprofile=E2=80=99s =
configure is poking for user space APIs
in linux/perf_event.h so linux-libc-headers dependency is enough. and =
use =E2=80=94with-kernel=3D${STAGING_EXECPREFIXDIR}
instead of STAGING_KERNEL_DIR, that should fix it.

-Khem

--Apple-Mail=_B9362359-EBD7-43B0-9D41-716293EB5482
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXKzSIACgkQuwUzVZGdMxTfiwCfbTIso09w31XLC40eKiWd1Bly
Q0EAn25CfA11UzKaWH0RT1iPDCo9/RJS
=YrdS
-----END PGP SIGNATURE-----

--Apple-Mail=_B9362359-EBD7-43B0-9D41-716293EB5482--
