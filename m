Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id E1CCA73CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 16:40:07 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so59405709pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=CMoyOj3xCjXMtQK7oiXwmbC60+V5y9lsThTTdBcp8wI=;
	b=CeXbZTDk/EGsi1dv26vIRogISsMSTGzFdU/Ytw9iIlrEbsnx2hMrpm6Pq6aylRs8To
	3S5ldHoOMCPMtWHw+orn4AzjL1B2v1CxP3fmVVX2nfoxrmgucNpfF2fUu28mnjsN0s9G
	ZxkfwCEkwhswahw/5y0OjtM8N7D9mBmkz789T/LCqUkrKEpH2CtIvfq9OvhTKP9Cvu+R
	RiesgM8A/b1Q2TaEvxi6p3BgdLDHwuwXI/kp5l1Yrx7i6lN0rLqYSUJyFuuPQ/tCdTG8
	inVQUTRxMq82Hy431hu8RZ3yvlBnS3TGVA60TrySSZmZ6KR6VemV1I37IOUTA5n6Y+9E
	Rg+w==
X-Received: by 10.66.190.6 with SMTP id gm6mr9111608pac.27.1444322407444;
	Thu, 08 Oct 2015 09:40:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:2d9c:769f:3849:5092?
	([2601:646:8601:4580:2d9c:769f:3849:5092])
	by smtp.gmail.com with ESMTPSA id
	w9sm46444167pbt.29.2015.10.08.09.40.06
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Oct 2015 09:40:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3095\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
Date: Thu, 8 Oct 2015 09:40:02 -0700
Message-Id: <32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
	<6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
X-Mailer: Apple Mail (2.3095)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
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
X-List-Received-Date: Thu, 08 Oct 2015 16:40:11 -0000
X-Groupsio-MsgNum: 72016
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B93B193C-E961-43F6-AAF9-901A70ADA06E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B93B193C-E961-43F6-AAF9-901A70ADA06E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 8, 2015, at 9:07 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>=20
>=20
>> Am 08.10.2015 um 16:46 schrieb Khem Raj <raj.khem@gmail.com>:
>>=20
>>=20
>>> On Oct 8, 2015, at 7:33 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>=20
>>>=20
>>> [Icedtee Ticket #2153] -- see =
http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=3D2153
>>>=20
>>> This patch prevents gcc generate code on ARM5e accessing 64 bit =
values, because gcc doesn't ensure they're 64 bit aligned.
>>> Accessing a 64 bit value from a 32 bit alignment causes segmentation =
faults.
>>>=20
>>> Patch is taken from =
https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/gcc/0001-ARMv5-=
disable-LDRD-STRD.patch
>>=20
>> Can you try using -mfix-cortex-m3-ldrd, does that help ?
>=20
> Well, I have a marvel-kirkwood - I'll give it a shot but don't know =
whether it works at all.
>=20
>> The patch is a workaround to gcc, as it seems real problem is in =
defining instruction constraints
>> please open a gcc bug for this.
>=20
> Dunno whether I want to have all that stress. When neither ARCH linux =
guys did that nor Icedtea
> maintainers, how could I succeed there?
>=20
> Best I can do is (if -mfix-cortex-m3-ldrd doesn't help), keep it =
private. When -mfix-cortex-m3-ldrd
> helps, is adding it to ./meta/conf/machine/include/tune-arm926ejs.inc =
a sane approach?

This might be OK. Although I would like to see it fixed in right way in =
gcc, we don=E2=80=99t want to carry patches
that are not accepted upstream. We already have 60 odd patches and we =
should reduce them if possible.

--Apple-Mail=_B93B193C-E961-43F6-AAF9-901A70ADA06E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYWnGUACgkQuwUzVZGdMxSKqQCcDwn1zVhIEUdtJYmDnEXbtTWH
35YAn2wezvHpapE0hPiLT8KONgZ8L5jE
=mI+G
-----END PGP SIGNATURE-----

--Apple-Mail=_B93B193C-E961-43F6-AAF9-901A70ADA06E--
