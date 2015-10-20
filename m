Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 30B9175A38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 03:20:13 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so6504870pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Pa3oHYvg/iTBDOND5UiBmnegTcCc5gB6hIjZRGQ6NZU=;
	b=BeUzDEaKXxKOfuSJRlkolrMYsYnoO/4EgNWfQmInN2ZvWU5MPYqqccs8cLeVczvEN4
	GPLOFfq8xOMRhWR9P77fPZphZppXlVYGBm2YVjX8AYbzvMgBJWb6szGgQvbyeTPr/VNJ
	qdChSMHVAytweQiGPF4Woh7k+OOvnAKrnlEGSVZ+ISj0ApkN2sX5gdK2IhKKqGT4nqSd
	mVBlMT0Fb+kTgjitTVtQ0R9zi655tC7NUGKoZIdKKDcbWl4Va30sSriFzFMMRrR7og2B
	VxUvZVxmV35IksP/CJZCMJ6H5NSsk4tWhH1cZcPRLnjGwneOgcYA6YRE6Rf3JoDQTLlT
	Ekdg==
X-Received: by 10.66.62.198 with SMTP id a6mr1141815pas.42.1445311213952;
	Mon, 19 Oct 2015 20:20:13 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:c43a:7500:299d:6c4e?
	([2601:646:8601:4580:c43a:7500:299d:6c4e])
	by smtp.gmail.com with ESMTPSA id l16sm678682pbq.22.2015.10.19.20.20.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 19 Oct 2015 20:20:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1445309772-4373-1-git-send-email-armccurdy@gmail.com>
Date: Mon, 19 Oct 2015 20:20:03 -0700
Message-Id: <3B495823-4B5B-4DC7-8718-66578F037D27@gmail.com>
References: <1445309772-4373-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3096.4)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python: don't append -D__SOFTFP__ to TARGET_CC_ARCH for armv6/armv7a
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
X-List-Received-Date: Tue, 20 Oct 2015 03:20:17 -0000
X-Groupsio-MsgNum: 72383
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BB3B2990-1EED-40A5-81DD-F7769D5FCCA9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BB3B2990-1EED-40A5-81DD-F7769D5FCCA9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 19, 2015, at 7:56 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Remove obsolete hack which seems to date back to (at least) 2009. It's
> potentially harmful as python TARGET_CC_ARCH flags can leak through to
> other packages via the sysroot _sysconfigdata.py.
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-devtools/python/python3_3.4.3.bb | 5 +----
> meta/recipes-devtools/python/python_2.7.9.bb  | 5 -----
> 2 files changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb =
b/meta/recipes-devtools/python/python3_3.4.3.bb
> index f61d278..a33f10f 100644
> --- a/meta/recipes-devtools/python/python3_3.4.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.4.3.bb
> @@ -56,10 +56,7 @@ CACHED_CONFIGUREVARS =3D "ac_cv_have_chflags=3Dno \
>                 ac_cv_file__dev_ptmx=3Dyes \
>                 ac_cv_file__dev_ptc=3Dno \
> "
> -# The 3 lines below are copied from the libffi recipe, ctypes ships =
its own copy of the libffi sources
> -#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp =
:(
> -TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
> -TARGET_CC_ARCH_append_armv7a =3D " -D__SOFTFP__=E2=80=9D

this is OK although, it would be interesting to know if you build any =
modules that used ctypes.so
even if it did work it seems wrong to pass this flag atleast it should =
check for callconvention=3Dhard

> +

> TARGET_CC_ARCH +=3D "-DNDEBUG -fno-inline"
> EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Dyes"
> EXTRA_OECONF +=3D =
"CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dyn=
load/ --without-ensurepip"
> diff --git a/meta/recipes-devtools/python/python_2.7.9.bb =
b/meta/recipes-devtools/python/python_2.7.9.bb
> index f7e2f27..bc20417 100644
> --- a/meta/recipes-devtools/python/python_2.7.9.bb
> +++ b/meta/recipes-devtools/python/python_2.7.9.bb
> @@ -34,11 +34,6 @@ inherit autotools multilib_header python-dir =
pythonnative
>=20
> CONFIGUREOPTS +=3D " --with-system-ffi "
>=20
> -# The 3 lines below are copied from the libffi recipe, ctypes ships =
its own copy of the libffi sources
> -#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp =
:(
> -TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
> -TARGET_CC_ARCH_append_armv7a =3D " -D__SOFTFP__"
> -
> # The following is a hack until we drop ac_cv_sizeof_off_t from site =
files
> EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'largefile', 'ac_cv_sizeof_off_t=3D8', '', d)} ac_cv_file__dev_ptmx=3Dyes =
ac_cv_file__dev_ptc=3Dno"
>=20
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_BB3B2990-1EED-40A5-81DD-F7769D5FCCA9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYlsuwACgkQuwUzVZGdMxQVhACfcBTlTvSEia0gUaQB9miUROLo
W+EAn1/71WihOQPPOD2lmXjF36+Ru5oT
=KLxU
-----END PGP SIGNATURE-----

--Apple-Mail=_BB3B2990-1EED-40A5-81DD-F7769D5FCCA9--
