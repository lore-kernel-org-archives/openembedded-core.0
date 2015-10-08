Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id BB4C165C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 01:46:22 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so37834513pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Oct 2015 18:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Oj/XbL5Ny02sjRu3ym0Uk6t725/MSaWx8B7jL6xlx0s=;
	b=KSuXnCritShbXBBtqqkuyQByUEE7Ae2oT3MOTUjMJFMdU+YIyNWS1IdOUeAHBVSxM+
	CAqh3XjCVDrVWBG5c3tHqAzJGrQqHoEX2bhsYGlR/LmwmrfRExTaxQlu8HFBHOQYP5qc
	vh6cq7i84ltq1V4BMaIey6128TDztmZ/TaDppzwP2UYporZPLNDwhnpKl0eCE8SzxuUv
	1WZ1e9Sc6tK4c0zXZiqznybGRusxjTeyUX6MRUTaFWUvXEgSuR1eSU0q8M/UJkaYs4fv
	HGjRzavi1MQAhYmOU2w1PX4xd5s509yrU0AkDfxHJXdFVKfeErQ4pVdweEEGMR1ysQGR
	Jggw==
X-Received: by 10.67.5.102 with SMTP id cl6mr4989350pad.4.1444268783327;
	Wed, 07 Oct 2015 18:46:23 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:787e:b3a8:cb23:6c63?
	([2601:646:8601:4580:787e:b3a8:cb23:6c63])
	by smtp.gmail.com with ESMTPSA id
	xo2sm11824401pbb.48.2015.10.07.18.46.22
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Oct 2015 18:46:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3095\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56151883.7000304@topic.nl>
Date: Wed, 7 Oct 2015 18:46:19 -0700
Message-Id: <75FC5F07-596F-403F-9A25-8BF14FEFBB91@gmail.com>
References: <56151883.7000304@topic.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Mailer: Apple Mail (2.3095)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] Adding machine-specific default packages to an image
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
X-List-Received-Date: Thu, 08 Oct 2015 01:46:23 -0000
X-Groupsio-MsgNum: 71978
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4FAC7BBF-3746-4210-A1B0-C932ADF23D1F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4FAC7BBF-3746-4210-A1B0-C932ADF23D1F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 7, 2015, at 6:05 AM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>=20
> Since our boards needs 'some' bitstream in the FPGA to become somewhat =
useful, in the machine.conf I say:
>=20
> MACHINE_FPGA_BITSTREAM ?=3D "fpga-image-miami-florida-gen-reference"
> MACHINE_EXTRA_RRECOMMENDS =3D "${MACHINE_FPGA_BITSTREAM} ..."
>=20
> This puts that into the packagegroup-base-machine RDEPENDS and hence =
it gets installed on the board if you don't specify anything else.
>=20
> However, I want to be able to pick alternative FPGA bitstream =
providers in the image recipe. Without having to define a new machine =
for each and every project=E2=80=A6

would IMAGE_FEATURES help ? IMAGE_FEATURE =3D blue and blue may be car =
for one machine and truck for another.

>=20
> Currently, I do this by forcing packagegroup-base-machine and =
packagegroup-base-distro out of the IMAGE_INSTALL list (for some obscure =
reason, building packagegroup-base-distro also results in building the =
reference bitstream) and then add MACHINE_EXTRA_RRECOMMENDS directly to =
the IMAGE_INSTALL list, so I can set MACHINE_FPGA_BITSTREAM to whichever =
I'd like to have in this image.
>=20
> I was lookign for a way to have the machine configuration inject its =
packages into the IMAGE_INSTALL (or similar) list, so it can easily be =
overridden in an image recipe.
>=20
> Bluntly putting IMAGE_INSTALL+=3D"${MACHINE_FPGA_BITSTREAM}" into the =
machine.conf might work, but doesn't "feel" quite right. But there's =
apparently no other way to do this.
>=20
> An alternative would be to introduce an IMAGE_INSTALL_MACHINE variable =
that gets added to the PACKAGE_INSTALL variable in image.bbclass. That =
would allow machines to inject their desirables into the image instead. =
It's a simple patch, I've pasted it below:
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 86a98bb..90c1c05 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -64,7 +64,8 @@ def check_image_features(d):
>=20
> IMAGE_INSTALL ?=3D ""
> IMAGE_INSTALL[type] =3D "list"
> -export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL} =
${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
> +IMAGE_INSTALL_MACHINE ?=3D ""
> +export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL} =
${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL} ${IMAGE_IN
> PACKAGE_INSTALL_ATTEMPTONLY ?=3D "${FEATURE_INSTALL_OPTIONAL}"
>=20
> # Images are generally built explicitly, do not need to be part of =
world.
>=20
>=20
> Kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>=20
> Please consider the environment before printing this e-mail
>=20
>=20
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4FAC7BBF-3746-4210-A1B0-C932ADF23D1F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYVyu8ACgkQuwUzVZGdMxTRBACgiq8iCqFOKoAJHF1jcCYSgmrp
r4QAn1lZTWu5rH+GNj0jdVtmHqvkewAZ
=QPU9
-----END PGP SIGNATURE-----

--Apple-Mail=_4FAC7BBF-3746-4210-A1B0-C932ADF23D1F--
