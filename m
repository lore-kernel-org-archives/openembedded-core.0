Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id B671F73C63
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 19:33:14 +0000 (UTC)
Received: by pdea3 with SMTP id a3so88899256pde.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Ht3GlE/NewvfdYdnwbpJ7eXD47P4nHiZN4MGEP5ufl0=;
	b=0X/AugQ2yDvokzQecXbxNGUV9a7IMvRDAzcwNSo6WNlDRN33V15x15SRZn5kXJRIAX
	uVhms2M23XE7Z/a2S1JK4Pj2EMI4rzd6sgAAdKy73S3MK1QCHZ/yiEKSFzG/76s5oICZ
	Y/WMk1TPCChxcVdbhp8lak5uWY4Bbj9i4C+9yqJyGx560wCetp//gTNSl7vbWh/CQvH/
	9VIRFXGO693sByQe3BPA7z/fPfG3/NpdaDkOAIocY39VFLuImL5x9jqrb617Ta4NHO89
	tRMp11I/KHlHuH91Wr5BSA8DkQ567cWNZ7/qDUOWEH5DdJyQ19dlsFqepDznyJP+xFWh
	ZPTg==
X-Received: by 10.66.156.7 with SMTP id wa7mr38938703pab.99.1428435195956;
	Tue, 07 Apr 2015 12:33:15 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:6173:5e9d:a616:6d78?
	([2601:9:500:ece:6173:5e9d:a616:6d78])
	by mx.google.com with ESMTPSA id gl2sm8762852pbc.52.2015.04.07.12.33.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Apr 2015 12:33:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428418272.14020.467.camel@linuxfoundation.org>
Date: Tue, 7 Apr 2015 12:33:13 -0700
Message-Id: <F8FD5455-119C-4814-8871-320AF0E7B72F@gmail.com>
References: <1428418272.14020.467.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Allow gold to build even when not the default
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
X-List-Received-Date: Tue, 07 Apr 2015 19:33:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 7, 2015, at 7:51 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> It can be useful to have gold available for testing even when its not =
the
> default, therefore build gold by default in all configurations.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils.inc =
b/meta/recipes-devtools/binutils/binutils.inc
> index afb582a..3c65efc 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -73,7 +73,7 @@ EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFIX} =
\
>=20
> LDGOLD_class-native =3D ""
> LDGOLD_class-crosssdk =3D ""
> -LDGOLD ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', =
'--enable-gold=3Ddefault --enable-threads', '', d)}"
> +LDGOLD ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', =
'--enable-gold=3Ddefault --enable-threads', '--enable-gold =
--enable-ld=3Ddefault', d)}=E2=80=9D
>=20

may be enable-gold could be done unconditionally ? and then =
=E2=80=94enable-gold|ld=3Ddefault controlled with ld-is-gold ?
ld-is-gold anyway meant that default linker is gold, it did not mean to =
just build gold, so we are not changing semantics

> # This is necessary due to a bug in the binutils Makefiles
> # EXTRA_OEMAKE =3D "configure-build-libiberty all"
>=20
>=20


