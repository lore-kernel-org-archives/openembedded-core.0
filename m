Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9F43073905
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 16:32:00 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so21273390pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 09:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=mVtUlpAQ4SryEDoqtE/cAjDjAYKt/WVuUvp1D03WJew=;
	b=SL+WUV3nookJWycOfreJUkZ/T8kGTI9CoJ35SU3dWHC0Kt9hHpQnmLGX47pWVQpbSI
	5fBXLV+E4VoMNXYcMTNteoeWwC9M2wjfPzdTdnuWKDavauV+7PpXhsufe0kArZosYq0i
	ZJuAZHWvWSBHzteicatvTbkI/2KCBUVSF6C6Y4tNq9MmpqrRW1H4elRaaV+Sq9N5Vwax
	lWu/LxOFAHglSiqshECF+dpfW/IDOy9XKGq9cFT9wrQCSKDAoYu2jyuetfkU8sqcbNaL
	+uUwDpOJjtiMAofMHqxByyK//sMjJjtMtY+hrNfWaVbP44nlaEDGPXi/9QB+RtcUcr2i
	+KYA==
X-Received: by 10.70.92.47 with SMTP id cj15mr10453587pdb.37.1439483521202;
	Thu, 13 Aug 2015 09:32:01 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:91a9:55b7:6f3a:6b82?
	([2601:647:4c02:370d:91a9:55b7:6f3a:6b82])
	by smtp.gmail.com with ESMTPSA id
	rt6sm3192091pbb.62.2015.08.13.09.32.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Aug 2015 09:32:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1439453357-27173-1-git-send-email-rongqing.li@windriver.com>
Date: Thu, 13 Aug 2015 09:31:54 -0700
Message-Id: <B10AFB1A-9E75-4D2A-8B6D-05DEA467E007@gmail.com>
References: <1439453357-27173-1-git-send-email-rongqing.li@windriver.com>
To: rongqing.li@windriver.com
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc: package nscd related files
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
X-List-Received-Date: Thu, 13 Aug 2015 16:32:04 -0000
X-Groupsio-MsgNum: 69394
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C860D28F-E72A-450F-9302-AD6419CA13E7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C860D28F-E72A-450F-9302-AD6419CA13E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 13, 2015, at 1:09 AM, rongqing.li@windriver.com wrote:
>=20
> From: Roy Li <rongqing.li@windriver.com>
>=20
> install nscd related configuration file, startup files, and package =
them,
> make nscd easy to startup
>=20

please test this change on top of glibc 2.22 recipe upgrade patches =
which are in flight right now

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
> meta/recipes-core/glibc/glibc-package.inc | 37 =
++++++++++++++++++++++++++++++-
> meta/recipes-core/glibc/glibc.inc         |  2 +-
> 2 files changed, 37 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc-package.inc =
b/meta/recipes-core/glibc/glibc-package.inc
> index 8ea5915..5f7c8a9 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -49,7 +49,8 @@ FILES_libsotruss =3D =
"${libdir}/audit/sotruss-lib.so"
> FILES_SOLIBSDEV =3D "${libdir}/lib*${SOLIBSDEV}"
> FILES_${PN}-dev +=3D "${bindir}/rpcgen ${libdir}/*_nonshared.a =
${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
> FILES_${PN}-staticdev +=3D "${libdir}/*.a ${base_libdir}/*.a"
> -FILES_nscd =3D "${sbindir}/nscd*"
> +FILES_nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd =
${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
> +              ${sysconfdir}/nscd.conf =
${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
> FILES_${PN}-mtrace =3D "${bindir}/mtrace"
> FILES_tzcode =3D "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
> FILES_${PN}-utils =3D "${bindir}/* ${sbindir}/*"
> @@ -105,6 +106,29 @@ do_install_append () {
> 			rmdir ${D}${sysconfdir}
> 		fi
> 	fi
> +
> +	if echo ${PN}|grep -q "glibc-initial"; then
> +		return
> +	fi
> +
> +	install -d ${D}${sysconfdir}/init.d
> +	install -d ${D}${localstatedir}/db/nscd
> +	install -m 0755 ${S}/nscd/nscd.init =
${D}${sysconfdir}/init.d/nscd
> +	install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
> +	sed -i "s%daemon%start-stop-daemon --start --exec%g" =
${D}${sysconfdir}/init.d/nscd
> +
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${S}/nscd/nscd.service =
${D}${systemd_unitdir}/system/
> +
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', =
'false', d)}; then
> +		install -d ${D}${sysconfdir}/tmpfiles.d
> +		echo "d /run/nscd 755 root root -" \
> +			> ${D}${sysconfdir}/tmpfiles.d/nscd.conf
> +	else
> +		install -d ${D}${sysconfdir}/default/volatiles
> +		echo "d root root 0755 /var/run/nscd none" \
> +			> ${D}${sysconfdir}/default/volatiles/98_nscd
> +	fi
> }
>=20
> do_install_append_aarch64 () {
> @@ -174,3 +198,14 @@ glibc_package_preprocess () {
> 		rm -rf ${PKGD}${exec_prefix}/lib
> 	fi
> }
> +
> +pkg_postinst_nscd () {
> +	if [ -z "$D" ]; then
> +		if command -v systemd-tmpfiles >/dev/null; then
> +			systemd-tmpfiles --create =
${sysconfdir}/tmpfiles.d/nscd.conf
> +		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; =
then
> +			${sysconfdir}/init.d/populate-volatile.sh update
> +		fi
> +	fi
> +}
> +CONFFILES_nscd=3D"${sysconfdir}/nscd.conf"
> diff --git a/meta/recipes-core/glibc/glibc.inc =
b/meta/recipes-core/glibc/glibc.inc
> index 74ad0b5..03ffb2f 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -41,7 +41,7 @@ DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial =
libgcc-initial linux-libc-headers
> #RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> PROVIDES +=3D "virtual/libintl virtual/libiconv"
> -inherit autotools texinfo distro_features_check
> +inherit autotools texinfo distro_features_check systemd
> require glibc-options.inc
>=20
> # The main purpose of setting this variable is to prevent users from =
accidently
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_C860D28F-E72A-450F-9302-AD6419CA13E7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXMxn4ACgkQuwUzVZGdMxRtLACfVszPRxOMhaa29RQ3FTZwSVj6
n+wAniruag4pzSGDBb6HFII6FqZdBIU9
=oMWw
-----END PGP SIGNATURE-----

--Apple-Mail=_C860D28F-E72A-450F-9302-AD6419CA13E7--
