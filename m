Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id BD8016BD75
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 17:20:12 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so1011504pbb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=i+hpKFI1kIFVFRZCSsOI61dLyeRu4Fv05oT3JScN2NQ=;
	b=kJEq/Kp8m5C33BVVuMcrMOeMyj+iLKSnHvlrZ3QdM46lMGK9uhpAphyghT/fVId2so
	QLptuYBarGmky9ma6g+KDdYYBcz6LBWFlIzZEP7ahRIrAlGI5AUCF9RWm2rgQS4aGGGa
	/XYjx7oiq8ejcp+LdGT0tqpQ3FGIuwX2uJjibF5/Xpq/b0PVFyydS2lP/CL0BNqwV3lV
	BjaCzuohEFOUUAu4Is0ZA36vQttjX7MQTy09bdg/ug5NQTUkxHaIx93BlxtYoDcU2WTT
	2WN6COOwuDOo5i15TAJbZhnVnMNb1DFlTGcnfc6mMwQCrgHSJlmSA6c9n+bRLlKbRvej
	PPxw==
X-Received: by 10.67.12.171 with SMTP id er11mr4722682pad.123.1393608012006;
	Fri, 28 Feb 2014 09:20:12 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id tu3sm18013877pab.1.2014.02.28.09.20.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Feb 2014 09:20:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1393586641.31769.197.camel@ted>
Date: Fri, 28 Feb 2014 09:20:07 -0800
Message-Id: <849DBADC-F51A-406F-BB06-DF28872B3A46@gmail.com>
References: <1393586641.31769.197.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Fix QA warning
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
X-List-Received-Date: Fri, 28 Feb 2014 17:20:12 -0000
X-Groupsio-MsgNum: 50727
Content-Type: multipart/signed;
	boundary="Apple-Mail=_089D2636-6C52-4E43-A8B6-76D447518640";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_089D2636-6C52-4E43-A8B6-76D447518640
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Feb 28, 2014, at 3:24 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> Addresses the warning:
>=20
> WARNING: QA Issue: python3-native: configure was passed unrecognised =
options: --with-wctype-functions
>=20
> since this option was removed in python 3.

indeed.

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb =
b/meta/recipes-devtools/python/python3-native_3.3.3.bb
> index ef33e43..72f7962 100644
> --- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
> @@ -51,6 +51,9 @@ EXTRA_OEMAKE =3D '\
>   ARCH=3D${TARGET_ARCH} \
> '
>=20
> +# No ctypes option for python 3
> +PYTHONLSBOPTS =3D ""
> +
> do_configure_prepend() {
> 	autoreconf --verbose --install --force --exclude=3Dautopoint =
Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
> }
> diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb =
b/meta/recipes-devtools/python/python3_3.3.3.bb
> index 4eb2108..9c3531e 100644
> --- a/meta/recipes-devtools/python/python3_3.3.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.3.3.bb
> @@ -60,6 +60,9 @@ TARGET_CC_ARCH_append_armv7a =3D " -D__SOFTFP__"
> TARGET_CC_ARCH +=3D "-DNDEBUG -fno-inline"
> EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Dyes"
>=20
> +# No ctypes option for python 3
> +PYTHONLSBOPTS =3D ""
> +
> do_configure_prepend() {
> 	rm -f ${S}/Makefile.orig
> 	autoreconf -Wcross --verbose --install --force =
--exclude=3Dautopoint Modules/_ctypes/libffi || bbnote "_ctypes failed =
to autoreconf"
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_089D2636-6C52-4E43-A8B6-76D447518640
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMQxUcACgkQuwUzVZGdMxSlzgCfX6EqApdjLu5UOUbtN8tI8+Kp
HJQAoJUFymWc1ExeH1Z9kp268UyaBmel
=bbpz
-----END PGP SIGNATURE-----

--Apple-Mail=_089D2636-6C52-4E43-A8B6-76D447518640--
