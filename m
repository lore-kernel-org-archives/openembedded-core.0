Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id BA31373217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 01:28:04 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so6052828pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 18:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=XM6AohVg8HCEpJX8mqvSDSRBA57LXFe65vsbLlGNGDQ=;
	b=iKFKWvBSV/SZOGfJGh3mixoDLotKu4qKM0dcFNCUYlE1Eow8lGR38AQxyuF1KwKM44
	ki2f5Frh+sGc2eOjWmu6Yzuk2vxBXO6nTBMtycxe4NZIVtB5hV2zYCWdP+XRrJ6WGDwg
	gpXdTVCxvllTfls7xO1D0n8uX3ohHnSKaxk5Bxe2e+wbcd2aAjpW/0/vNO0av/KRFicL
	WHSQkDNOG7AnA3Ouwb3KhuBok/WpZbqgcW0cLyjIXuD2gJHvy/ahbi0EFBxoVd9esI+H
	920DpRflxJwpH9D8RJ/zqMqi/pvCXoY9/qx2ZIZdsMm//H5tm8bBPO5PX4SIQX7buXn0
	bxqA==
X-Received: by 10.68.239.69 with SMTP id vq5mr2417115pbc.111.1440638884669;
	Wed, 26 Aug 2015 18:28:04 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1183:c1:9996:5a2a?
	([2601:646:8601:4580:1183:c1:9996:5a2a])
	by smtp.gmail.com with ESMTPSA id m4sm327205pda.90.2015.08.26.18.28.03
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Aug 2015 18:28:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440621320-22747-1-git-send-email-ross.burton@intel.com>
Date: Wed, 26 Aug 2015 18:27:59 -0700
Message-Id: <3A1BA03C-27A2-44A3-96A1-987BC62575D5@gmail.com>
References: <1440621320-22747-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] byacc: fix compilation on Ubuntu 14.04
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
X-List-Received-Date: Thu, 27 Aug 2015 01:28:07 -0000
X-Groupsio-MsgNum: 70118
Content-Type: multipart/signed;
	boundary="Apple-Mail=_82C553DD-AB42-472C-8D03-C67AE29DD9FF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_82C553DD-AB42-472C-8D03-C67AE29DD9FF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 26, 2015, at 1:35 PM, Ross Burton <ross.burton@intel.com> =
wrote:
>=20
> Ubuntu defaults to passing _FORTIFY_SOURCE=3D2 which breaks byacc as =
it doesn't
> pass enough arguments to open():
>=20
> inlined from 'open_tmpfile' at byacc-20150711/main.c:588:5:
> /usr/include/x86_64-linux-gnu/bits/fcntl2.h:50:24: error: call to =
'__open_missing_mode' declared with attribute error:
> open with O_CREAT in second argument needs 3 arguments
>=20
> Add a mode of 0666 to fix this.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-extended/byacc/byacc.inc              |  4 +++-
> meta/recipes-extended/byacc/byacc/byacc-open.patch | 13 +++++++++++++
> 2 files changed, 16 insertions(+), 1 deletion(-)
> create mode 100644 meta/recipes-extended/byacc/byacc/byacc-open.patch
>=20
> diff --git a/meta/recipes-extended/byacc/byacc.inc =
b/meta/recipes-extended/byacc/byacc.inc
> index fae9e25..f9f8d6b 100644
> --- a/meta/recipes-extended/byacc/byacc.inc
> +++ b/meta/recipes-extended/byacc/byacc.inc
> @@ -5,7 +5,9 @@ programming language."
> SECTION =3D "devel"
> LICENSE =3D "PD"
>=20
> -SRC_URI =3D "ftp://invisible-island.net/byacc/byacc-${PV}.tgz"
> +SRC_URI =3D "ftp://invisible-island.net/byacc/byacc-${PV}.tgz \
> +           file://byacc-open.patch"
> +
> EXTRA_OECONF +=3D "--program-transform-name=3D's,^,b,'"
>=20
> BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-extended/byacc/byacc/byacc-open.patch =
b/meta/recipes-extended/byacc/byacc/byacc-open.patch
> new file mode 100644
> index 0000000..9160543
> --- /dev/null
> +++ b/meta/recipes-extended/byacc/byacc/byacc-open.patch
> @@ -0,0 +1,13 @@
> +diff --git a/main.c b/main.c
> +index 620ce3f..82071a4 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -526,7 +526,7 @@ my_mkstemp(char *temp)
> +     }
> +     if ((name =3D tempnam(dname, fname)) !=3D 0)
> +     {
> +-	fd =3D open(name, O_CREAT | O_EXCL | O_RDWR);
> ++      fd =3D open(name, O_CREAT | O_EXCL | O_RDWR, 0666);


hmm its cryptic may be you can use (S_IRUSR|S_IWUSR) instead of 0666 and =
add ore flags if it needs.
and the patch will need upstreaming status.

> + 	strcpy(temp, name);
> +     }
> +     else
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_82C553DD-AB42-472C-8D03-C67AE29DD9FF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXeZ6IACgkQuwUzVZGdMxTbDgCghpBRPhMBeye4xNKl9TfFfgQn
S6cAnjV5weDrhid+H858LJMHFPibi3tK
=a/sy
-----END PGP SIGNATURE-----

--Apple-Mail=_82C553DD-AB42-472C-8D03-C67AE29DD9FF--
