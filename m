Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyoXJ-000265-2F
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 20:29:45 +0200
Received: by eekb57 with SMTP id b57so1345728eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 11:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=DOmmxqgBaXWnyEV5K/UNwk33R0QpTGLLfa1qC5pI5LU=;
	b=AaXW0nWH4u4SPaPWcReLXa3J9IT7V3dHCtIzMuwmGBLnvjOji0WZkFCX/186ixAOOY
	YuKpeISxzJUtRXAheqSsh5VMbtxw8rU0P42npKuaa9LvdekN3HzrAOpxwqjrDJX/BefT
	lBElvKF862B4oyUSAYgr2NH1yX3lPsA4CDLL7G/4WyCvrIhG62KQvWDVVTc7dlWmmtlH
	v2erNu7h91xP49CNRonPHkG4bSCLcMXfAc6gQZD7OdlcnHimD67q8kmh6row5lRjTVfm
	QqvMR3MilcxFiipN6GMjI1PUSHetw2SN/v/9XIr4OmZAPADkYcrhDixtclnOkBv676+a
	mIbA==
Received: by 10.14.204.72 with SMTP id g48mr18902899eeo.45.1344363478911;
	Tue, 07 Aug 2012 11:17:58 -0700 (PDT)
Received: from [172.20.0.2] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id e7sm22100815eep.2.2012.08.07.11.17.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 11:17:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
Date: Tue, 7 Aug 2012 20:17:58 +0200
Message-Id: <FE4E23C8-61A3-4E09-B529-F99779CA2810@dominion.thruhere.net>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkOaYcf8/N2FgvxoOeiZaUBoEd1D55y/qr+kR9KfZbv3KG/AJ5jg4ZsHs+64EOsBGb4jtll
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 18:29:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 aug. 2012, om 19:31 heeft Yao Zhao <yao.zhao@windriver.com> het =
volgende geschreven:

> In order to fix the QA Issue for libpam which installed to /lib but
> reference /usr/libxx/libz and libcrack, install libz and libcrack
> to /lib.
>=20
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
> meta/recipes-core/zlib/zlib_1.2.7.bb              |    8 ++++++--
> meta/recipes-extended/cracklib/cracklib_2.8.19.bb |    2 ++
> 2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb =
b/meta/recipes-core/zlib/zlib_1.2.7.bb
> index 803fec3..d351437 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.7.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
> @@ -13,7 +13,8 @@ SRC_URI[md5sum] =3D =
"2ab442d169156f34c379c968f3f482dd"
> SRC_URI[sha256sum] =3D =
"49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d378c79d52e9334934"
>=20
> do_configure (){
> -	./configure --prefix=3D${prefix} --shared --libdir=3D${libdir}
> +	#sharedlibdir sets to {libdir} if not set
> +	./configure --prefix=3D${prefix} --shared =
--libdir=3D"${base_libdir}"
> }
>=20
> do_compile (){
> @@ -21,7 +22,10 @@ do_compile (){
> }
>=20
> do_install() {
> -	oe_runmake DESTDIR=3D${D} install
> +	#libz.a installs to libdir, overwrite the env libdir
> +	#install pkgconfig to env libdir/pkgconfig
> +	oe_runmake DESTDIR=3D${D} pkgconfigdir=3D"${libdir}/pkgconfig" \
> +		   libdir=3D"${base_libdir}" install
> }
>=20
> BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb =
b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
> index 2951396..aca6211 100644
> --- a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
> +++ b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
> @@ -15,3 +15,5 @@ SRC_URI[md5sum] =3D =
"ca0ec168d9c6466612204e8dfb2df8a9"
> SRC_URI[sha256sum] =3D =
"7086b0ca23f875c9cd9ea2a993c262384b274dba9c4ea1da845ec8ac290748a9"
>=20
> inherit autotools gettext
> +
> +libdir =3D "${base_libdir}"

Again, missing PR bump and missing buildhistory diffs.=


