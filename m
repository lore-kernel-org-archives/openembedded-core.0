Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id E226860144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 19:26:35 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id q5so10179556wiv.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V38Bk2wqZV6gkeWEbtd93FPz9b3GVpO2NcnCLp7yzXI=;
	b=pf9IhCqzqywrzVe2qTt3idI0zkET8TdyHxqJx68zmRTyyot7zv7jgs3zKjo03AAFSK
	ZWpzwdwUWMwNLx5VyrJvfk9Z+LvGUPd/irM+5vOMjIp92KLOp02RnlOV34j9DEgqIZch
	ZWrPIQP1HZdItl8ThgtHkhheRK26yWRPTW1jDtLyT3uxRBI74GjXW+xv/ClxynexUFh9
	+LsxUXl8/cXzaiL2h+qwbF8goy6kFccBoWK1NiYKOzcVkgMYzmMS7Mcmwh0avKn0q5kE
	y7QZ1KCztDhY0I5QnOfD7DT/BWGNIJ2lIe25nAwsLGe2OF98NqMkYMBsUCPImy1Zhhqy
	29VQ==
X-Received: by 10.194.176.71 with SMTP id cg7mr5416558wjc.132.1411673195909;
	Thu, 25 Sep 2014 12:26:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k10sm3698311wjb.28.2014.09.25.12.26.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Sep 2014 12:26:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Sep 2014 21:27:22 +0200
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140925192722.GP25706@jama>
References: <cover.1403654908.git.sgw@linux.intel.com>
	<e33bb2eefbdda30378a55346ff60fb0fb90baff2.1403654908.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e33bb2eefbdda30378a55346ff60fb0fb90baff2.1403654908.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/10] curl: Convert CURLGNUTL to PACKAGECONFIG
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
X-List-Received-Date: Thu, 25 Sep 2014 19:26:42 -0000
X-Groupsio-MsgNum: 58154
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MWF3YmTHhoLNIVQC"
Content-Disposition: inline

--MWF3YmTHhoLNIVQC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2014 at 05:13:20PM -0700, Saul Wold wrote:
> This will allow for easier configuration of curl for SSL vs gnutls
>=20
> [YOCTO #6329]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-support/curl/curl_7.37.0.bb | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta/recipes-support/curl/curl_7.37.0.bb b/meta/recipes-supp=
ort/curl/curl_7.37.0.bb
> index 1dc4ff3..f6b05a7 100644
> --- a/meta/recipes-support/curl/curl_7.37.0.bb
> +++ b/meta/recipes-support/curl/curl_7.37.0.bb
> @@ -23,6 +23,13 @@ SRC_URI[sha256sum] =3D "24502492de3168b0556d8e1a06f14f=
7589e57b204917d602a572e14239
> =20
>  inherit autotools pkgconfig binconfig multilib_header
> =20
> +PACKAGECONFIG ??=3D "gnutls ${@bb.utils.contains("DISTRO_FEATURES", "ipv=
6", "ipv6", "", d)}"
> +PACKAGECONFIG_class-native =3D "ipv6 ssl"
> +PACKAGECONFIG_class-nativesdk =3D "ipv6"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> +PACKAGECONFIG[ssl] =3D  "--with-ssl, --without-ssl, ,"
> +PACKAGECONFIG[gnutls] =3D  "--with-gnutls=3D${STAGING_LIBDIR}/../, --wit=
hout-gnutls, gnutls,"

Can you look into this floating dependency?

curl-7.37.1: libcurl rdepends on rtmpdump, but it isn't a build dependency?=
 [build-deps]

It seems to spread into more packages (maybe not all through curl):
curlpp-0.7.3: libcurlpp rdepends on rtmpdump, but it isn't a build dependen=
cy? [build-deps]
gst-plugins-bad-0.10.23: gst-plugins-bad-curl rdepends on rtmpdump, but it =
isn't a build dependency? [build-deps]
gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on rtmpdump, but it =
isn't a build dependency? [build-deps]
gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libcrypto, but it=
 isn't a build dependency? [build-deps]
gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libssl, but it is=
n't a build dependency? [build-deps]
gstreamer1.0-plugins-bad-1.4.1: gstreamer1.0-plugins-bad-curl rdepends on r=
tmpdump, but it isn't a build dependency? [build-deps]
libetpan-0.57: libetpan rdepends on rtmpdump, but it isn't a build dependen=
cy? [build-deps]
liboauth-1.0.3: liboauth rdepends on rtmpdump, but it isn't a build depende=
ncy? [build-deps]
strongswan-5.2.0: strongswan rdepends on rtmpdump, but it isn't a build dep=
endency? [build-deps]

> +
>  EXTRA_OECONF =3D "--with-zlib=3D${STAGING_LIBDIR}/../ \
>                  --without-libssh2 \
>                  --with-random=3D/dev/urandom \
> @@ -31,19 +38,8 @@ EXTRA_OECONF =3D "--with-zlib=3D${STAGING_LIBDIR}/../ \
>                  --disable-ldap \
>                  --disable-ldaps \
>                  --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificat=
es.crt \
> -                ${CURLGNUTLS} \
>                  "
> =20
> -CURLGNUTLS =3D " --with-gnutls=3D${STAGING_LIBDIR}/../ --without-ssl"
> -CURLGNUTLS_class-native =3D "--without-gnutls --with-ssl"
> -CURLGNUTLS_class-nativesdk =3D "--without-gnutls --without-ssl"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ip=
v6", "", d)}"
> -PACKAGECONFIG_class-native =3D "ipv6"
> -PACKAGECONFIG_class-nativesdk =3D "ipv6"
> -
> -PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> -
>  do_configure_prepend() {
>  	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
>  }
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MWF3YmTHhoLNIVQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQkbJoACgkQN1Ujt2V2gBxhswCfZorT//qympaRMZFC+psRMian
dE0An2wpfoO4yyOa9+wT4x9S3haWYe4I
=hpAE
-----END PGP SIGNATURE-----

--MWF3YmTHhoLNIVQC--
