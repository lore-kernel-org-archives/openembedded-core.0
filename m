Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id A4C5D6A94D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 07:08:02 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so2868112pbb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=tt8kEroyu7fTIQqHBLZwBPFhmDV6x49cXX6pogx+6SM=;
	b=qdl05UT5L9JqkXGwiEM3R7MxZTPuJcYCrRcK29jEC6Km6Xd1TYXr2kTtsuH54RXuP6
	YkC30Hiiez2utHbclmzjyAuCxiAm09zwiTn1uY/FM+52c8US0pLl2/bHdxDiSe/JokuQ
	/Az/o1iYQyTZcpZKTrUoDkv7ymW44lj60+PT9Z6EAInSgUe20mGzpVmMeov81YEXLhz2
	EnJ2B4uJlLBfIQggtVMGSIwUk+0km/0RGl6ERag9NqIKLUoKv2Nj5SVPWz33FFdU8yg2
	0wInc9aObSJXl7oJsXZUbo0m3WjC0kjbVOJLEfM2CsQzaBLbq5Z96rd7ru3sd7IU4ewe
	9FXg==
X-Received: by 10.66.25.70 with SMTP id a6mr2252983pag.68.1378451284415;
	Fri, 06 Sep 2013 00:08:04 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	kz4sm1802221pbc.39.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 00:08:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1378415843.32427.84.camel@ted>
Date: Fri, 6 Sep 2013 00:08:03 -0700
Message-Id: <165EE9CC-A70F-4416-8743-BE00BF7B8B93@gmail.com>
References: <1378415843.32427.84.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] gcc-runtime: Hacks for libgfortran with gcc-4.8
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
X-List-Received-Date: Fri, 06 Sep 2013 07:08:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 5, 2013, at 2:17 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> These are the hacks I needed to make libgfortran build. This is ugly, =
no
> argument from me. We could probably get better results if we patch
> configure and libtool to stop doing nasty things. I've probably taken
> this as far as I'd want to though, not being a particular fan of
> fortran...
>=20
> Khem: Any thoughts on this?
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc =
b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 2599760..395623f 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -18,6 +18,9 @@ RUNTIMETARGET =3D "libssp libstdc++-v3 libgomp"
> # libmudflap
> # libgfortran
>=20
> +DEPENDS_append =3D " chrpath-replacement-native"
> +EXTRANATIVEPATH +=3D "chrpath-native"
> +
> do_configure () {
> 	export CXX=3D"${CXX} -nostdinc++ -nostdlib++"
> 	mtarget=3D`echo ${MULTIMACH_TARGET_SYS} | sed -e =
s#-${SDKPKGSUFFIX}##`
> @@ -30,6 +33,11 @@ do_configure () {
> 		cd ${B}/$target/$d/
> 		chmod a+x ${S}/$d/configure
> 		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> +		# Ugly hack, libgfortran configure looks for =
../libquadmath/libquadmath.la

Maybe we should explicitly --enable-libquadmath in gcc-cross when =
fortran is asked for in RUNTIMETARGETS
might avoid some of below.

>=20
> +		# so we need to compile it before configure
> +		if [ "$d" =3D "libquadmath" ]; then
> +			oe_runmake MULTIBUILDTOP=3D${B}/$target/$d/
> +		fi
> 	done
> }
>=20
> @@ -38,6 +46,16 @@ do_compile () {
> 	for d in libgcc ${RUNTIMETARGET}; do
> 		cd ${B}/$target/$d/
> 		oe_runmake MULTIBUILDTOP=3D${B}/$target/$d/
> +		if [ "$d" =3D "libgfortran" ]; then
> +			# libtool needs libdir to match the final =
installation directory which configure
> +			# sets from output from this command (e.g. both =
set to /usr/lib/../lib
> +			# It also adds bogus RPATHS which we have to =
delete
> +			fulllibdir=3D`$CC -print-multi-os-directory`
> +			if [ $fulllibdir !=3D "." ]; then
> +				sed -i -e =
"s#relink_command=3D.*#relink_command=3D#" =
${B}/$target/$d/libgfortran.la
> +				chrpath -d `readlink -f =
${B}/$target/$d/.libs/libgfortran.so`
> +			fi
> +		fi

hmm remind me but I think we use unmodified libtool that comes with gcc =
IIRC. if we used libtool-cross then this could
be fixed there

> 	done
> }
>=20
>=20
>=20
>=20


