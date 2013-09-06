Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6080A6B8EB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 07:01:42 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un15so2844809pbc.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 00:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=xS4fJoBnZ22HEBGNbmFSRaPhKpcLhSHXF1mtbZwPkRs=;
	b=DoZpHGiGNNrAdLfXfqxIAp/Fb7ero2aVaTPnRUyAUaihoE/KzwEV0189lu9SQdMp/d
	k6JKhoBXF6BZw/CsnmG/aNG+76lWQIXA56Yd8j8MXHXv6GG0uA/cWP5C+w0qz9fT3DPp
	/3J/g5F3yNVwooDmLF2pLWYzDbTCyl/2XVwvh0TMxkMz3vE3jJEEkIdDcAj6E7PxCR68
	vPQL4S6iJMEGOfGvXUFjzCavgi3qEk2h+xgGXr5SDBb6s8qMqYZ3UqdyJ3lRFBpYt7/s
	mOhX7GqmFyIkuUQ/GVQwN/t3ObqixVVrCkn4pjNGLeJ1leRIIvFX26/Z89hnan44cQfs
	LbLw==
X-Received: by 10.66.145.166 with SMTP id sv6mr2131297pab.31.1378450904522;
	Fri, 06 Sep 2013 00:01:44 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	bg3sm1758871pbb.44.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 00:01:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1378415685.32427.81.camel@ted>
Date: Fri, 6 Sep 2013 00:01:43 -0700
Message-Id: <226AB507-318D-4718-B69B-4D70A69DADB3@gmail.com>
References: <1378415685.32427.81.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Add packaging for libgfortran (and also tweak others)
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
X-List-Received-Date: Fri, 06 Sep 2013 07:01:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 5, 2013, at 2:14 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> Add packaging for libgfortran and libquadmath as well as tweak the =
packaging
> for libmudflap since it was broken.

Looks good to me.

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc =
b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index b882889..2599760 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -48,6 +48,7 @@ do_install () {
> 		oe_runmake 'DESTDIR=3D${D}' =
MULTIBUILDTOP=3D${B}/$target/$d/ install
> 	done
> 	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
> +	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
> 	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
> 		rmdir --ignore-fail-on-non-empty -p =
${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
> 	fi
> @@ -76,8 +77,13 @@ PACKAGES =3D "\
>   libssp-staticdev \
>   libgfortran \
>   libgfortran-dev \
> +  libgfortran-staticdev \
>   libmudflap \
>   libmudflap-dev \
> +  libmudflap-staticdev \
> +  libquadmath \
> +  libquadmath-dev \
> +  libquadmath-staticdev \
>   libgomp \
>   libgomp-dev \
>   libgomp-staticdev \
> @@ -119,15 +125,30 @@ FILES_libssp-staticdev =3D " \
>=20
> FILES_libgfortran =3D "${libdir}/libgfortran.so.*"
> FILES_libgfortran-dev =3D " \
> -  ${libdir}/libgfortran.a \
> -  ${libdir}/libgfortran.so \
> -  ${libdir}/libgfortranbegin.a"
> +  ${libdir}/libgfortran*.so \
> +  ${libdir}/libgfortran.spec \
> +  ${libdir}/libgfortran.la \
> +  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
> +  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single*"
> +FILES_libgfortran-staticdev =3D " \
> +  ${libdir}/libgfortran.a"
> +
> +INSANE_SKIP_${MLPREFIX}libgfortran-dev =3D "staticdev"
> +
> +FILES_libquadmath =3D "${libdir}/libquadmath*.so.*"
> +FILES_libquadmath-dev =3D "\
> +  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
> +  ${libdir}/libquadmath*.so \
> +  ${libdir}/libquadmath.la"
> +FILES_libquadmath-staticdev =3D "\
> +  ${libdir}/libquadmath.a"
>=20
> FILES_libmudflap =3D "${libdir}/libmudflap*.so.*"
> FILES_libmudflap-dev =3D "\
>   ${libdir}/libmudflap*.so \
> -  ${libdir}/libmudflap*.a \
> -  ${libdir}/libmudflap*.la"
> +  ${libdir}/libmudflap.la"
> +FILES_libmudflap-staticdev =3D "\
> +  ${libdir}/libmudflap.a"
>=20
> FILES_libgomp =3D "${libdir}/libgomp*${SOLIBS}"
> FILES_libgomp-dev =3D "\
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


