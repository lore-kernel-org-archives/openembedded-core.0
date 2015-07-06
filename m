Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id C7FDA65CCC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:09:43 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so170630081wid.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IOeKdCfFbcQPKZqJyc2pa9KYTbBGo/IVFoUcgCmvp+Q=;
	b=ZeCwshyRI8HIGW4Ep99n5jUyS1k86EDLFNV3BfELftkUFYbpGJCDPeqEpZXgtFdTG6
	4JYFcfEL/fNEDHLl5l+/aDiOw2rkTvACciVjPHGQ4/Gy61sbZfCbysxdQjlYXqb4b8ug
	xiwJHDeflahbzzu9OuFiteCKgKVIVSoZw3pWtVQp/WiP6kBgdwUE0nsWS4ssRMyp9ZoN
	th18MjNmPqj42d1EXKCq/aUAD6U4nlPn2uky9imRiz0NWn/WVSc9+wnyth8Q6BZ8PB7y
	u6TzhkHnMrFTAim4lQ3UIv/lkp6AVrnajtrOeNRwG5N9i95voM+v0gwTuDJix/Hu+br6
	raGw==
X-Received: by 10.180.187.167 with SMTP id ft7mr92385614wic.26.1436213383163; 
	Mon, 06 Jul 2015 13:09:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k16sm29808114wjr.7.2015.07.06.13.09.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jul 2015 13:09:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Jul 2015 22:10:18 +0200
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <20150706201018.GD2436@jama>
References: <cover.1436177709.git.alejandro.hernandez@linux.intel.com>
	<41e68bf09d809269524babaae2911a7c41e38351.1436177709.git.alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <41e68bf09d809269524babaae2911a7c41e38351.1436177709.git.alejandro.hernandez@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] opkg-build: Ignore tar error due to hardlinks issue when creating ipk files
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
X-List-Received-Date: Mon, 06 Jul 2015 20:09:48 -0000
X-Groupsio-MsgNum: 67571
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline

--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2015 at 10:17:19AM +0000, Alejandro Hernandez wrote:
> If a the number of hard links decreases or increases while creating
> the tar files used for an ipk package, tar fails with error code 1,
> if this is the case we ignore the error and continue to create the ipk fi=
le
>=20
> [YOCTO #7933]
>=20
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  .../opkg-utils/opkg-utils/tar_ignore_error.patch   | 47 ++++++++++++++++=
++++++
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  4 +-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignor=
e_error.patch
>=20
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error=
=2Epatch b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.pat=
ch
> new file mode 100644
> index 0000000..4bcae4954
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
> @@ -0,0 +1,47 @@
> +If a the number of hard links decreases or increases while creating
> +the tar files used for an ipk package, tar fails with error code 1:
> +
> +| DEBUG: Executing python function do_package_ipk
> +| tar: ./usr/src/debug/gperf/3.0.4-r0/gperf-3.0.4/src/main.cc: file chan=
ged as we read it
> +NOTE: recipe gperf-3.0.4-r0: task do_package_write_ipk: Failed
> +ERROR: Task 6539 (recipes-extended/gperf/gperf_3.0.4.bb, do_package_writ=
e_ipk) failed with exit code '1'
> +
> +
> +We detect if the error code produced by tar is 1 and in this case ignore=
 it.
> +
> +This a similar behavior to the one on dpkg:
> +http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D40731942515e=
c8d80c727ad561174986d4f05818
> +
> +Upsteam-Status: Inappropriate

Typo and why is it inappropriate? Looks like bugfix to me, even for
issue which usually happens in OE way of using opkg-build.

> +
> +Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> +
> +
> +Index: git/opkg-build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/opkg-build
> ++++ git/opkg-build
> +@@ -250,8 +250,21 @@ tmp_dir=3D$dest_dir/IPKG_BUILD.$$
> + mkdir $tmp_dir
> +=20
> + echo $CONTROL > $tmp_dir/tarX
> +-( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -cz $tarformat -f $tmp_di=
r/data.tar.gz . )
> +-( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/contro=
l.tar.gz . )
> ++
> ++
> ++# Ignore error code 1, caused by modifying the number of hard links whi=
le creating the tar file
> ++rc=3D0
> ++( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -cz $tarformat -f $tmp_di=
r/data.tar.gz . ) || rc=3D$?
> ++if [[ $rc -ne 1 ]] && [[ $rc -ne 0 ]] ;then
> ++        exit $rc=20
> ++fi
> ++
> ++rc=3D0
> ++( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/contro=
l.tar.gz . ) || rc=3D$?
> ++if [[ $rc -ne 1 ]] && [[ $rc -ne 0 ]] ;then
> ++        exit $rc
> ++fi
> ++
> + rm $tmp_dir/tarX
> +=20
> + echo "2.0" > $tmp_dir/debian-binary
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils_git.bb
> index 2800a5d..74b974d 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -10,7 +10,9 @@ PROVIDES +=3D "virtual/update-alternatives"
>  SRCREV =3D "53274f087565fd45d8452c5367997ba6a682a37a"
>  PV =3D "0.1.8+git${SRCPV}"
> =20
> -SRC_URI =3D "git://git.yoctoproject.org/opkg-utils"
> +SRC_URI =3D "git://git.yoctoproject.org/opkg-utils "=20
> +
> +SRC_URI_append_class-native =3D "file://tar_ignore_error.patch"

Add leading space in append not in original SRC_URI variable.

Why is it applied only for native anyway?

> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.8.4.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWa4KkACgkQN1Ujt2V2gBwY8QCdHU45LRzipkVKfptgebHRdo3R
3+cAoKJXzSoXMzFaYioOYtSCvZdx/mCv
=lIwb
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
