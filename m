Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 073D273FC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 16:04:57 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so17504091pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=VdORYpp4MJBNuhxfRc6rybSV4jjm8NQx/r4sBnpp1yk=;
	b=rlTc0jrPWR1QJYL1bUvtbbSwqotZ+cp1gHCfB8zZJr2r2ziKKP7RAdCvyRjszbccdF
	K0OqkJF9wZZps89ZQxcudxR44ArXwTFWpdK1uLW61KoNNC8qN4JM97XViougLxYe3Pka
	VuBei7FDnCBUnTBs+yVB7qqOMnkA/l3GxpFUZTSDjGFd3YD4HzPiVyQiTe4GDT9uwVmR
	D5Dz4KFz5GpwSbrcJ7QaHDqwCxi2j8/p7dwZ8E8y67lGnCuaQwnF6ptvxi181pvp7sTg
	uecDdxyARH5hwasJ/tsYM0OVc4tqSXjsjbqR8FmeypUNK4ZYRk8JsH0PsYLTa8WqeH4V
	rsxA==
X-Received: by 10.66.141.171 with SMTP id rp11mr29422543pab.44.1431446698681; 
	Tue, 12 May 2015 09:04:58 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:ccd0:4222:99ed:8bcf?
	([2601:9:3580:84c:ccd0:4222:99ed:8bcf])
	by mx.google.com with ESMTPSA id
	kh6sm16640030pbc.50.2015.05.12.09.04.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 May 2015 09:04:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431432169.30971.126.camel@linuxfoundation.org>
Date: Tue, 12 May 2015 09:04:56 -0700
Message-Id: <3DB15CAE-351B-4608-824C-C67AEB370233@gmail.com>
References: <1431432169.30971.126.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc5: Add back g++ sysroot patch
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
X-List-Received-Date: Tue, 12 May 2015 16:05:00 -0000
X-Groupsio-MsgNum: 65458
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C78F7C95-4548-4190-82A9-244D05DEC71F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C78F7C95-4548-4190-82A9-244D05DEC71F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 12, 2015, at 5:02 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> Without this, g++/c++ compilation doesn't work on target due to =
missing
> header files. Automated sanity tests fail. Add back the gcc4 patch to
> address this.


ah thanks for this. I was about to start looking at it.

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-5.1.inc =
b/meta/recipes-devtools/gcc/gcc-5.1.inc
> index 305736b..1d64f9e 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.1.inc
> @@ -69,6 +69,7 @@ SRC_URI =3D "\
>            =
file://0035-Dont-link-the-plugins-with-libgomp-explicitly.patch \
>            =
file://0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
>            file://0037-pr65779.patch \
> +           file://0038-fix-g++-sysroot.patch \
>           "
>=20
> #S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
> diff --git =
a/meta/recipes-devtools/gcc/gcc-5.1/0038-fix-g++-sysroot.patch =
b/meta/recipes-devtools/gcc/gcc-5.1/0038-fix-g++-sysroot.patch
> new file mode 100644
> index 0000000..f024dd5
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-5.1/0038-fix-g++-sysroot.patch
> @@ -0,0 +1,44 @@
> +Portions of
> +
> +http://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg26013.html
> +
> +are not upstreamed yet. So lets keep missing pieces.
> +
> +Upstream-Status: Pending
> +
> +Without this, compiling something simple like #include <limits> on =
target
> +with c++ test.cpp fails unable to find the header. strace shows it =
looking in
> +usr/include/xxxx rather than /usr/include/xxxx
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: gcc-4.8.1/gcc/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.8.1.orig/gcc/configure.ac	2013-07-15 15:55:49.488399132 =
-0700
> ++++ gcc-4.8.1/gcc/configure.ac	2013-07-15 16:02:31.772406679 =
-0700
> +@@ -148,7 +148,9 @@
> + if test "${with_sysroot+set}" =3D set; then
> +   gcc_gxx_without_sysroot=3D`expr "${gcc_gxx_include_dir}" : =
"${with_sysroot}"'\(.*\)'`
> +   if test "${gcc_gxx_without_sysroot}"; then
> +-    gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
> ++    if test x${with_sysroot} !=3D x/; then
> ++      gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
> ++    fi
> +     gcc_gxx_include_dir_add_sysroot=3D1
> +   fi
> + fi
> +Index: gcc-4.8.1/gcc/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.8.1.orig/gcc/configure	2013-07-15 15:55:49.472399132 =
-0700
> ++++ gcc-4.8.1/gcc/configure	2013-07-15 16:02:31.780406680 -0700
> +@@ -3325,7 +3325,9 @@
> + if test "${with_sysroot+set}" =3D set; then
> +   gcc_gxx_without_sysroot=3D`expr "${gcc_gxx_include_dir}" : =
"${with_sysroot}"'\(.*\)'`
> +   if test "${gcc_gxx_without_sysroot}"; then
> +-    gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
> ++    if test x${with_sysroot} !=3D x/; then
> ++      gcc_gxx_include_dir=3D"${gcc_gxx_without_sysroot}"
> ++    fi
> +     gcc_gxx_include_dir_add_sysroot=3D1
> +   fi
> + fi
>=20
>=20


--Apple-Mail=_C78F7C95-4548-4190-82A9-244D05DEC71F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVSJKgACgkQuwUzVZGdMxSiQQCdGxr7hgVEt+2nApoFj6mV/OAG
tw0An2I2D5kc+6n3aNlGzhCHzamIsdcP
=PIw7
-----END PGP SIGNATURE-----

--Apple-Mail=_C78F7C95-4548-4190-82A9-244D05DEC71F--
