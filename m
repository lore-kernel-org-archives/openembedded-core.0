Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id DC5FB6E3E0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 16:34:39 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id rd3so4742605pab.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 08:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=uraJMV2Y1GgZgROcYsqoTbweUhjg8buVjh+UehExOi8=;
	b=bw46xJmT3JyCSj1vYw2fh2hkpAxH1JM2oO3vG1RMEE30+XQ80DGk5WXfYetS/UB4ky
	QQ1yNixaB9JFO+KznYIEOYSZTwUxPSz/rccCFPShVrBfKgHIlzrgfKft/YjpVrtIi3w+
	I8eYmu6yYsG1gtpK7YFQbEZqr4yvGvcIapakzWrU+MogWlpj+sDyfjIUSWDdUg1w5wte
	aAAaginOWLa2Ibv6Nssw1FdLsXt9X8+2kZfulYk3hDly0tHg/zuKf9FEPAYxOnT1P3+y
	ghFCKqYPMwCrhFpAm0xBeV5vgCqqJBBiTo7ys36HkfiT4qQPsG8M1QqvmS4Dh1kT6Irj
	6hjg==
X-Received: by 10.68.134.98 with SMTP id pj2mr15642268pbb.110.1393086880587;
	Sat, 22 Feb 2014 08:34:40 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	yd4sm32753901pbc.13.2014.02.22.08.34.38 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Feb 2014 08:34:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2119167.FSmXca6tad@peggleto-mobl5.ger.corp.intel.com>
Date: Sat, 22 Feb 2014 08:34:36 -0800
Message-Id: <E43D4A79-222F-4109-A77E-4121AF6DBE94@gmail.com>
References: <1392929845-23411-1-git-send-email-sgw@linux.intel.com>
	<42DC4075-3C8F-4D01-AFDB-82AD3357C709@gmail.com>
	<2119167.FSmXca6tad@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Ensure ROOTFS path is absolute
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
X-List-Received-Date: Sat, 22 Feb 2014 16:34:41 -0000
X-Groupsio-MsgNum: 50445
Content-Type: multipart/signed;
	boundary="Apple-Mail=_97E771B5-0473-4B70-B32C-038365DDCAAA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_97E771B5-0473-4B70-B32C-038365DDCAAA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Feb 22, 2014, at 4:55 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Friday 21 February 2014 21:57:37 Khem Raj wrote:
>> On Feb 20, 2014, at 12:57 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>> There is a problem if a relative path is passed to the kernel for =
NFS
>>> usage
>>> that it will not correctly find it, so ensure that the ROOTFS path =
is
>>> absolute.
>>>=20
>>> [YOCTO #2807]
>>>=20
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>> scripts/runqemu | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>> index 0db7ad6..57c5de4 100755
>>> --- a/scripts/runqemu
>>> +++ b/scripts/runqemu
>>> @@ -462,7 +462,9 @@ if [ -z "$ROOTFS" -a "x$FSTYPE" !=3D "xvmdk" ]; =
then
>>>=20
>>>        error "Unable to determine default rootfs for MACHINE =
[$MACHINE]"
>>>=20
>>>    fi
>>>=20
>>> fi
>>> -# ROOTFS is now set for all cases
>>> +# ROOTFS is now set for all cases, now expand it to be an absolute =
path,
>>> it should exist at this point +
>>> +ROOTFS=3D`realpath $ROOTFS`
>>=20
>> I think this change also means we need to add dependency on realpath =
package
>> as prerequisite for build host.
>=20
> realpath is part of coreutils.

realpath is package of its own not coreutils, at least on ubuntu

> Another alternative would be readlink -f (but=20
> that also appears to be part of coreutils.)


this might be better options since coreutils is more or less
given on any distro

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_97E771B5-0473-4B70-B32C-038365DDCAAA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMI0ZwACgkQuwUzVZGdMxRfdQCfYdqTxrp5pBCopyvpzT2fJubJ
SJ0AnikgRROP1DPyMOhM02Xi3fRN1VH0
=BEHn
-----END PGP SIGNATURE-----

--Apple-Mail=_97E771B5-0473-4B70-B32C-038365DDCAAA--
