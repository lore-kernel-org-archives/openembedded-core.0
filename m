Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 726B7766C8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 07:31:15 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so20033634pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Aug 2015 00:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7En/CCgoHWNsXQf7yXPZnRryndyM0aD/goR2kUjG/qw=;
	b=ZWAHtvT6aLdkdy/nQD0yigk/SdXldrOB6Ld/LmzzN4cYT+4pg/3ALj+eODUxqJU5/G
	6FDRYwOvGhMw2pQQPdMMF7s/fRLsUYxzzGpYoRNGK2r6EJ1TNm87DG4dV1FqbFJRPaI6
	FBRR1A5vv9Kdl4SKEwbKE8IiCkg62sll1aI55fAKQA+IAOG/kRnf4UHkg5pbUyBjH84G
	CO5XTLMOGXjcYuqhO5SGWjYQ1z2fK243NOApAYtvqScUEAc0NN+kOASAu/USUFr1ZtV+
	1iLH1j2a/9DQl3oVC+vaeE36e6tfnQQqFvHPsU9ZzytmzIZn+kro0Ido2ivxyWeeDqG3
	5qhg==
X-Received: by 10.70.12.100 with SMTP id x4mr22131799pdb.65.1439105475845;
	Sun, 09 Aug 2015 00:31:15 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id p1sm15678353pdb.3.2015.08.09.00.31.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 09 Aug 2015 00:31:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1439103829.30467.93.camel@linuxfoundation.org>
Date: Sun, 9 Aug 2015 00:31:10 -0700
Message-Id: <37380D15-6A67-405F-ACFF-7E03F6843595@gmail.com>
References: <1439103829.30467.93.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Add error handling for unexpected tap devices
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
X-List-Received-Date: Sun, 09 Aug 2015 07:31:16 -0000
X-Groupsio-MsgNum: 69168
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FC416D38-157F-4053-A370-5AF81E4C1D1B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FC416D38-157F-4053-A370-5AF81E4C1D1B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 9, 2015, at 12:03 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> In theory the code reduces the tap device number to an integer. This
> patch adds error checking to ensure that does happen and that the =
script
> exits if something unexpected happens.
>=20

I see these patches are already on master. Are you sending them again by =
mistake for review or something else ?

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 03b40d8..0ace485 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -253,6 +253,14 @@ else
>=20
>=20
>         n0=3D$(echo $TAP | sed 's/tap//')
> +
> +        case $n0 in
> +            ''|*[!0-9]*)
> +                echo "Error Couldn't turn $TAP into an interface =
number?"
> +                exit 1
> +                ;;
> +        esac
> +
>         n1=3D$(($n0 * 2 + 1))
>         n2=3D$(($n1 + 1))
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_FC416D38-157F-4053-A370-5AF81E4C1D1B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXHAcEACgkQuwUzVZGdMxTeWwCglMrN1qs1Hy+f3F+gIvgHiwEE
PXMAnAkN0veX/diF8nOEwsxDE/nwEHB4
=YROu
-----END PGP SIGNATURE-----

--Apple-Mail=_FC416D38-157F-4053-A370-5AF81E4C1D1B--
