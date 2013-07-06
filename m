Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id A8C6869692;
	Sat,  6 Jul 2013 10:51:28 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so1943028eaj.25
	for <multiple recipients>; Sat, 06 Jul 2013 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q48ELXelF+7TVH97/b6SkOO+GSdSPYjKPLZ/UVrkmiU=;
	b=DUrermqHmnaM+zhprR94QAxv2q/DuOpY9+W5/5GUK9JgckilS8UmJj9mw421EYr0zP
	lIs+vJyN85iSSqfbbvuNE/gnImWHPahTb0U4ukwY6L8XrKzTd+CqlkEAgO4+2b/eIrRs
	PQfMcpNDoHR4CTJ80KKtsGDKQ6g95NRfh+d5ULM64oZz2wjQUNba6ImXmz8zX8Qo9eHU
	2Pz56fdlFNq+HK6i0us0KXg6VM4UogJwLXRNA8G6uT2PgPYmKLtWyzYRc8qMFq56HjLH
	NWojg6w9kMYs1DHURkhr6su850w6ldo+IXdUcH1MOaTY25aSw85EfAlgnacu6ZzOl+u1
	RJSg==
X-Received: by 10.14.103.196 with SMTP id f44mr16234761eeg.37.1373107888331;
	Sat, 06 Jul 2013 03:51:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm22342898eeh.15.2013.07.06.03.51.26 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 03:51:27 -0700 (PDT)
Date: Sat, 6 Jul 2013 12:51:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130706105133.GB3288@jama>
References: <20130524130925.B37DE5030A@opal>
MIME-Version: 1.0
In-Reply-To: <20130524130925.B37DE5030A@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Missing binutils-cross dependency Was: [oe-commits] Mike Crowe : kernel.bbclass: Add dependency on binutils
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
X-List-Received-Date: Sat, 06 Jul 2013 10:51:29 -0000
X-Groupsio-MsgNum: 41548
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2013 at 01:09:25PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 37beb7bdab78de5253a894f35afafa34c13a00f5
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D37beb7bdab78de5253a894f35afafa34c13a00f5
>=20
> Author: Mike Crowe <mac@mcrowe.com>
> Date:   Mon May 20 13:22:45 2013 +0100
>=20
> kernel.bbclass: Add dependency on binutils
>=20
> Compiling the Linux kernel requires binutils; kernel.bbclass uses
> INHIBIT_DEFAULT_DEPS so it had better depend on binutils explicitly.
>=20
> (The lack of this dependency isn't always a problem because binutils
> is required to build gcc-cross but if gcc-cross is reconstructed from
> the sstate cache then gcc-cross's dependency on binutils-cross is
> ignored due to being in the safe dependency list in
> setscene_depvalid.)

Isn't this problem in other kinds for recipes as well?

Shouldn't we add virtual/${TARGET_PREFIX}binutils to base.bbclass BASEDEPEN=
DS?

I have recipe where do_compile is failing with
i586-oe-linux-g++ .....
collect2: fatal error: cannot find 'ld'
because binutils-cross.do_populate_sysroot wasn't executed yet

DEPENDS of that package looks correct in bitbake -e:
DEPENDS=3D"pkgconfig-native  virtual/i586-webos-linux-gcc
virtual/i586-webos-linux-compilerlibs virtual/libc  qt4-webos glib-2.0
luna-prefs luna-service2 cjson nyx-lib libpbnjson luna-webkit-api
luna-sysmgr-ipc luna-sysmgr-ipc-messages sqlite3 pmloglib librolegen
serviceinstaller qmake-webos-native"

$ grep "> \"binutils-cross.do_populate_sysroot" task-depends.dot
"gcc-cross.do_configure" -> "binutils-cross.do_populate_sysroot"
"gcc-cross-initial.do_configure" -> "binutils-cross.do_populate_sysroot"
"binutils-cross.do_build" -> "binutils-cross.do_populate_sysroot"

binutils-cross.do_populate_sysroot is executed before first recipe calls
do_package, so this failure isn't very common, but still something we
should fix properly IMHO.

Regards,

> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Acked-by: Phil Blundell <philb@gnu.org>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/classes/kernel.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3320747..0407423 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base module_strip kernel-module-split
> =20
>  PROVIDES +=3D "virtual/kernel"
> -DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cros=
s"
> +DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}g=
cc kmod-native depmodwrapper-cross"
> =20
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS =3D "1"
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHX9rUACgkQN1Ujt2V2gByV2gCguTUo5Sv7Qsi/XfVPGJScA4u0
TmoAoLBNUBAokEkqrwT+TnwT/bnrzpMB
=hI1H
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
