Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF4A7669F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 00:33:35 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so138610965pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 17:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=LXwT+RTVcGMv48aCLQ3R65sYvn72151C2J7wr3Pvv/4=;
	b=Ika31BuYnkg4jQIKxjq8OntsY2lXasGLcCgtZsdP47+yRlppGgWxeX7PHOYlB9TwUt
	I4R5c4f29Ur8pqJ0tVCSCO2nHNrTnC2F0U+zEulAPznnjih46Gerbakjs+rHJd2NtCdz
	mryW+xPZcRK7UWu2l9AtUfRSBfWdiJfk0bnCnz6cv3FbSXNY6pyVwNQFm1BtpXe9LlC8
	tzZWYrV3a8RddfPkAvn5MdlS6KM8FO/3HXd5MDuLrqmRZFEWA7WtPAE1DnQ8Rb87bS19
	tNTakOdO70EWWG3fLOPOGvWyV56C5WRljM8XVZAkhJYou/5TFLzBu+qJEizc4WbXEoxw
	1QDA==
X-Received: by 10.69.27.37 with SMTP id jd5mr13432307pbd.76.1441758816341;
	Tue, 08 Sep 2015 17:33:36 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ddf:eeff:d299:213f?
	([2601:646:8601:4580:4ddf:eeff:d299:213f])
	by smtp.gmail.com with ESMTPSA id
	fu4sm4789731pbb.59.2015.09.08.17.33.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Sep 2015 17:33:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441714733.22688.71.camel@pbcl.net>
Date: Tue, 8 Sep 2015 17:33:31 -0700
Message-Id: <4A95CF70-E636-4211-B505-EAEDE5D9EA7D@gmail.com>
References: <D2E79685-E16A-4941-BB7B-E7F21E250DD2@axis.com>
	<1441714733.22688.71.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.2104)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: 32 bit time_t in openembedded
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
X-List-Received-Date: Wed, 09 Sep 2015 00:33:37 -0000
X-Groupsio-MsgNum: 70873
Content-Type: multipart/signed;
	boundary="Apple-Mail=_78EB4A4B-B210-4624-BB60-77CA69FDE8C7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_78EB4A4B-B210-4624-BB60-77CA69FDE8C7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 8, 2015, at 5:18 AM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Tue, 2015-09-08 at 13:44 +0200, Umut Tezduyar Lindskog wrote:
>> Can 32 bits ISA handle year 2038 problem in openembedded?
>=20
> Not generically.  But this is not an OE-level problem; the issue is =
more
> that the underlying libraries and kernel ABIs are not currently
> Y2038-safe.  Fixing this is not really within the scope of OE and is
> more a matter for the respective upstream maintainers to deal with.
>=20
> See for example some previous discussion of the linux kernel
> implications at http://lwn.net/Articles/643407/
>=20
>> Our ISA is 32 bits and we are using relatively new kernel with
>> relatively old glibc (2.15). We are using RTC chips which come with a
>> random date/time initialized. We started seeing boot problems in
>> systemd if the random value of RTC is newer than 2038.
>=20
> If this is all you're concerned about and you don't seriously expect
> your product to be still in use in 2038 then you could add a sanity
> check at bootup to reset the clock to some reasonable default if the
> value in the RTC is either known to be in the past or is implausibly =
far
> in the future.
>=20
> If you do need full Y2038 support (which wouldn't be totally
> unreasonable, given that the end of the epoch is now less than 25 =
years
> away and at least some of us will probably live long enough to see =
it!)
> then you would need to do some more substantial development work and =
you
> should probably contact linux-kernel and/or libc-alpha in the first
> instance.  Or update to a natively 64-bit system.
>=20

there might be a possibility of writing a compatibility handling of =
32bit time_t and switch to using
64bit time_t even on 32bit systems much like netbsd or openbsd. There =
are patches floating around for kernel
try them out.

> p.
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_78EB4A4B-B210-4624-BB60-77CA69FDE8C7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXvfl4ACgkQuwUzVZGdMxShEgCfSAy/c2DI2eHMwTHndz8VdSvC
xKUAnRVLagiUkJl1yMrQD1C/cgtn0kaN
=WeJ4
-----END PGP SIGNATURE-----

--Apple-Mail=_78EB4A4B-B210-4624-BB60-77CA69FDE8C7--
