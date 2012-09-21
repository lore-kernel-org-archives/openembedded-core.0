Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TF6bL-00072l-Fs; Fri, 21 Sep 2012 19:01:15 +0200
Received: by wibhq4 with SMTP id hq4so2005988wib.6
	for <multiple recipients>; Fri, 21 Sep 2012 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=46ZDgTTyZDbLiahuGE/0fIs6RAo8aDZuM0BIi/PHMuk=;
	b=dhe7LSI1OizL+sZp/1FpuI0CTC84KscdddPPPeLLfm1C8wbgbLuoq4jKgDvmUSLZkN
	LwGnK5s37x8jFIQz+sx0XjVF7lkham4PETYxPlUNKnaFLymSpyKyLtJk/DWabXarERao
	tiAQIlJzXIiYZjzYqx0dKNKtv+QquovZav0dxtMKH3Onf9oqAceYvrHvtg2fxG3tR6ih
	uYHI64WVb8mu80wE0cu+qUeHJD1UEuTIlcK5CV9opRxS1ebDBsteJrrMmKbpaWn+YiKZ
	XDOBsL92J+WmAryun3FGhgIg6Ma1YAFc8cCsY1bRf0dQ7V4JmdW9V30jSDYracH80YH2
	fzeg==
Received: by 10.216.236.163 with SMTP id w35mr3245821weq.13.1348246111213;
	Fri, 21 Sep 2012 09:48:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm17557672wib.10.2012.09.21.09.48.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 09:48:30 -0700 (PDT)
Date: Fri, 21 Sep 2012 18:48:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120921164828.GI10268@jama.jama.net>
References: <20120919170333.13AC810336@opal>
MIME-Version: 1.0
In-Reply-To: <20120919170333.13AC810336@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Gherzan : util-linux: Fix bloken swapoff symlink
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
X-List-Received-Date: Fri, 21 Sep 2012 17:01:15 -0000
X-Groupsio-MsgNum: 29651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwxaKO075aXzzOz0"
Content-Disposition: inline

--RwxaKO075aXzzOz0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2012 at 05:03:32PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 0ff32e8fb5463a23af9966afcb58eb00772af65b
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D0ff32e8fb5463a23af9966afcb58eb00772af65b
>=20
> Author: Andrei Gherzan <andrei@gherzan.ro>
> Date:   Mon Sep 17 13:49:58 2012 +0300
>=20
> util-linux: Fix bloken swapoff symlink
>=20
> There were 2 issues with this symlink.
> 1. Is was installed in base_bindidir but packaged in bindir. Fixed to
> be packaged in base_bindir
> 2. The symlink swapoff was created to point to swapon. The problem is
> that swapoff is an alternative so it would end up pointing to
> swapoff.util-linux which was an inexistent file. The fix is to create
> a symlink swapoff.util-linux to swapon.util-linux.
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-core/util-linux/util-linux.inc       |    4 ++--
>  meta/recipes-core/util-linux/util-linux_2.21.2.bb |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 00e5d7c..79e0608 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -46,7 +46,7 @@ FILES_util-linux-agetty =3D "${base_sbindir}/agetty"
>  FILES_util-linux-fdisk =3D "${base_sbindir}/fdisk.${BPN}"
>  FILES_util-linux-cfdisk =3D "${base_sbindir}/cfdisk"
>  FILES_util-linux-sfdisk =3D "${sbindir}/sfdisk"
> -FILES_util-linux-swaponoff =3D "${base_sbindir}/swapon.${BPN} ${sbindir}=
/swapoff.${BPN}"
> +FILES_util-linux-swaponoff =3D "${base_sbindir}/swapon.${BPN} ${base_sbi=
ndir}/swapoff.${BPN}"
>  FILES_util-linux-losetup =3D "${base_sbindir}/losetup.${BPN}"
>  FILES_util-linux-mount =3D "${base_bindir}/mount.${BPN}"
>  FILES_util-linux-mcookie =3D "${bindir}/mcookie"
> @@ -121,7 +121,7 @@ do_install () {
>  	install -d ${D}${sysconfdir}/default/
>  	echo 'MOUNTALL=3D"-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/defaul=
t/mountall
> =20
> -	ln -sf swapon   ${D}${base_sbindir}/swapoff
> +	ln -sf swapon.${BPN}   ${D}${base_sbindir}/swapoff.${BPN}
>  	rm -f ${D}${sbindir}/swapoff
>  }

This looks like correct change, but doesn't provide upgrade path :/
Collected errors:
 * check_data_file_clashes: Package util-linux-swaponoff wants to
 * install file /sbin/swapoff.util-linux
        But that file is already provided by package  * util-linux

Something like
RREPLACES_${PN}-swaponoff =3D "${PN}"
should work but for RPM you probably need to include PV in that too. See
threads:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/02971=
5.html
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/02977=
9.html
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/03001=
4.html
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/02983=
7.html

Cheers,

> =20
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.21.2.bb
> index 0f5fdc6..6ef3163 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION =3D "2.21"
> -PR =3D "r1"
> +PR =3D "r2"
>  require util-linux.inc
> =20
>  # note that `lscpu' is under GPLv3+
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RwxaKO075aXzzOz0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBcmlwACgkQN1Ujt2V2gBwfIQCeNaioXgr24njYXSgIcpMjPUyx
9/gAn3vDYdCdW70lwx377lmv3mhTu8kL
=WXKM
-----END PGP SIGNATURE-----

--RwxaKO075aXzzOz0--
