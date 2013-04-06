Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UOQZR-0003dj-Sx
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 12:42:07 +0200
Received: by mail-ea0-f180.google.com with SMTP id d10so1523916eaj.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 03:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=vxWbJNUTeVTXOQy4IWiJDifhVJWHqYuPbXmRJ8bSPcE=;
	b=lUa6MNjuO9wF6H8Xzc2qM6bmyoB9b2hCc284agA5HPj3aMs/pfWzq1JL30PNTRsHUM
	zHXGtg8HklAXR0VzrukfK/zf/IcWX+i7FOjLyM/b1z3kuZiWbrpKLdtl+A8fePZNI/np
	Ym5mFmy7q/0V8nEgiWDGIkRK1l+m+8s3Bc2p31RtDG6kPB5FglinrNc+tXtA9z8tmAlB
	i8x4MdDZ/mW9DQIj4rPIrh51NhKt1HGaULXEYILi/GtalLoMghM71g/4VDZ3L38MYhAZ
	jYDwcsbKNNe/VqniiuhKVR6Fqwbo7qfkW2WA7YBjq/a0HMEncC4pvtGRcI+icvX7c9oZ
	cEXg==
X-Received: by 10.14.173.196 with SMTP id v44mr28125294eel.29.1365243890330;
	Sat, 06 Apr 2013 03:24:50 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id q42sm20118091eem.14.2013.04.06.03.24.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 03:24:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365201484-3514-1-git-send-email-kirgene@gmail.com>
Date: Sat, 6 Apr 2013 12:24:50 +0200
Message-Id: <230587AC-FD28-420F-8DED-B6AADBD5DE28@dominion.thruhere.net>
References: <1365201484-3514-1-git-send-email-kirgene@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQmou9sKV7sZ5kgJYeM1Af0qZckJh01A7pWM1eVPI0ePunUHpfrR43W2l9kx2jPjSlmAGVua
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: added python-systemd package generation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Apr 2013 10:42:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 apr. 2013, om 00:38 heeft Yevhen Kyriukha <kirgene@gmail.com> het =
volgende geschreven:

> ---
> meta/recipes-core/systemd/systemd_199.bb |   20 ++++++++++++++++----
> 1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_199.bb =
b/meta/recipes-core/systemd/systemd_199.bb
> index e574548..00daf99 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -15,7 +15,13 @@ DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', =
'pam', 'libpam', '', d)}"
>=20
> SECTION =3D "base/shell"
>=20
> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d =
pythonnative python-dir
> +
> +# need to export these variables for python-config to work
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
>=20
> SRC_URI =3D =
"http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>            file://touchscreen.rules \
> @@ -44,11 +50,13 @@ LDFLAGS_libc-uclibc_append =3D " -lrt"
>=20
> GTKDOC_DOCDIR =3D "${S}/docs/"
>=20
> -PACKAGECONFIG ??=3D "xz"
> +PACKAGECONFIG ??=3D "xz python"
> # Sign the journal for anti-tampering
> PACKAGECONFIG[gcrypt] =3D "--enable-gcrypt,--disable-gcrypt,libgcrypt"
> # Compress the journal
> PACKAGECONFIG[xz] =3D "--enable-xz,--disable-xz,xz"
> +# Use python-systemd
> +PACKAGECONFIG[python] =3D "--with-python,--without-python,python"
>=20
> CACHED_CONFIGUREVARS =3D "ac_cv_path_KILL=3D${base_bindir}/kill"
>=20
> @@ -65,7 +73,6 @@ EXTRA_OECONF =3D " --with-rootprefix=3D${base_prefix} =
\
>                  --disable-tcpwrap \
>                  --enable-split-usr \
>                  --disable-microhttpd \
> -                 --without-python \

--with-python ?

>                  --with-sysvrcnd-path=3D${sysconfdir} \
>                  ac_cv_path_KILL=3D${base_bindir}/kill \
>                "
> @@ -114,7 +121,7 @@ python populate_packages_prepend (){
> }
> PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
>=20
> -PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs =
${PN}-analyze ${PN}-kernel-install"
> +PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs =
${PN}-analyze ${PN}-kernel-install python-${PN} python-${PN}-dbg =
python-${PN}-staticdev"
>=20
> USERADD_PACKAGES =3D "${PN}"
> GROUPADD_PARAM_${PN} =3D "-r lock; -r systemd-journal"
> @@ -124,6 +131,11 @@ FILES_${PN}-analyze =3D =
"${base_bindir}/systemd-analyze"
> FILES_${PN}-initramfs =3D "/init"
> RDEPENDS_${PN}-initramfs =3D "${PN}"
>=20
> +FILES_python-${PN} =3D "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* =
${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
> +RDEPENDS_python-${PN} =3D "python-core python-datetime python-logging =
python-syslog"
> +FILES_python-${PN}-staticdev =3D =
"${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"

Do libtool archives belong in -staticdev?


> +FILES_python-${PN}-dbg =3D =
"${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
> +
> FILES_${PN}-gui =3D "${bindir}/systemadm"
>=20
> FILES_${PN}-vconsole-setup =3D =
"${systemd_unitdir}/systemd-vconsole-setup \
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



