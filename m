Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4vVn-0004c6-Az
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 17:09:27 +0200
Received: by pbcwy7 with SMTP id wy7so3709885pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=uKea1kp09AmBqirGGZpU9La0KdDI2R1OxJFuWv+k2bY=;
	b=PP5YNaRmS0GK7+S+TY3bma7ojFczSh6WDGeA4TYLtBt2zZSbtksvUxmQUH4GO4kMDq
	wsZS1cKYwsHxyRTwSzDG2Hi5J5037IDPxLPlRo8irwz/V/HYElvklxeFsJ7OJFEMtZIi
	XcspVneAfzGZIPxETDDhYydkPcXgT9QtkPryHLt9HnHvlHtR45uWv69YU2K9vCsuulpV
	OxnVKLeqN/ViR7zRj+q1jBIyrc7QNYxyrLiZTfJIptH/zoyZmijAvurcDErHtPI2nbI/
	DbQ8c9jmMO/tvaec25iTz996zExgvAc217L+UWMdPp5ZZOzLz9UsiWX3Hxcjls8QyWvQ
	E/KA==
Received: by 10.68.191.97 with SMTP id gx1mr13362660pbc.149.1345820238932;
	Fri, 24 Aug 2012 07:57:18 -0700 (PDT)
Received: from [192.168.1.67] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id iu10sm8454007pbc.45.2012.08.24.07.57.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 07:57:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1345817543.14369.70.camel@ted>
Date: Fri, 24 Aug 2012 07:57:17 -0700
Message-Id: <394E54E4-815B-42CD-BFA2-5CDE2744B1FB@gmail.com>
References: <1345817543.14369.70.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1486)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.7: Add fix for libtool rpath problems
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
X-List-Received-Date: Fri, 24 Aug 2012 15:09:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 24, 2012, at 7:12 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> This avoids problems with libstdc++ having bad rpaths =
(/usr/lib/../.lib)
> in its .la file. See the patch for more information.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc =
b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 36ce1be..84c230c 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
> require gcc-common.inc
>=20
> -PR =3D "r10"
> +PR =3D "r11"
>=20
> # Third digit in PV should be incremented after a minor release
> # happens from this branch on gcc e.g. currently its 4.7.1
> @@ -74,6 +74,7 @@ SRC_URI =3D =
"git://github.com/mirrors/gcc.git;branch=3D${BRANCH};protocol=3Dgit \
> 	   file://gcc-argument-list-too-long.patch \
> 	   file://fix-g++-sysroot.patch \
> 	   file://disablesdt.patch \
> +	   file://libtool.patch \
> 	  "
>=20
> S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7/libtool.patch =
b/meta/recipes-devtools/gcc/gcc-4.7/libtool.patch
> new file mode 100644
> index 0000000..9580b23
> --- a/dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.7/libtool.patch
> @@ -0,0 +1,29 @@
> +libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../lib =
for qemux86-64
> +when running on am x86_64 build host.
> +
> +This patch stops this speading to libdir in the libstdc++.la file =
within libtool.
> +Aguably, it shouldn't be passing this into libtool in the first place =
but
> +for now this resolves the nastiest problems this causes.
> +
> +func_normal_abspath would resolve an empty path to `pwd` so we need
> +to filter the zero case.
> +
> +RP 2012/8/24
> +
> +Upstream-Status: Pending
> +
> +Index: git/ltmain.sh
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/ltmain.sh	2012-08-24 11:45:58.597087961 +0000
> ++++ git/ltmain.sh	2012-08-24 12:18:37.961042581 +0000
> +@@ -6359,6 +6359,10 @@
> + 	func_warning "ignoring multiple \`-rpath's for a libtool =
library"
> +=20
> +       install_libdir=3D"$1"
> ++      if test -n "$install_libdir"; then
> ++	func_normal_abspath "$install_libdir"
> ++	install_libdir=3D$func_normal_abspath_result
> ++      fi
> +=20

this looks ok to me. Did we post the libtool patch upstream ?

> +       oldlibs=3D
> +       if test -z "$rpath"; then
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



