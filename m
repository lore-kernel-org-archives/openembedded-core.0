Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URQe6-0007kj-QA
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 19:23:24 +0200
Received: by mail-ee0-f42.google.com with SMTP id d4so1855549eek.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=u8CGYTFpSxsaJ9BWW7PvI5tGsdBNbWVR13F4V7Rz+kk=;
	b=ZDSb7dWFhjtRtPxRHSWtm9zVHpmrqe9O0Nc9+/MVh4YgMY9wOa9KeKfGXM/FoNEOUn
	diULijiqSybSKHo0vkovUyUGx+M6ER0XCQrLASkaAxJKL2PthaK5h6MN+jyJ4/sQ1nNu
	TXeiyNdRUxEUoGOy02sP1gAIoRhLiX6YZF1kdfd56FL0AO/v66LlZa3k/a3UVlzTrPP6
	MFhgNzcmyMTrYxL3j+pW2t1FknBGMpOa4c4GSTa6Hwq5rCp93xyaIovwJXPk7/ldCVpR
	b7inZ/2h9vWTXInl5CG/Nddy/mguTWpkrEWQj0VVTaFZyMdhMtjtGLILaUsrJ4pk2a2o
	T5gg==
X-Received: by 10.15.31.197 with SMTP id y45mr52776295eeu.18.1365959151431;
	Sun, 14 Apr 2013 10:05:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b47sm2901298eez.2.2013.04.14.10.05.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 10:05:50 -0700 (PDT)
Date: Sun, 14 Apr 2013 19:05:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130414170556.GH2475@jama>
References: <1365581101-3810-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1365581101-3810-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCHv2] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Sun, 14 Apr 2013 17:23:24 -0000
X-List-Received-Date: Sun, 14 Apr 2013 17:23:24 -0000
X-Groupsio-MsgNum: 37877
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFBW6CQlri5Qm8JQ"
Content-Disposition: inline

--nFBW6CQlri5Qm8JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 10:05:01AM +0200, Koen Kooi wrote:
> This allows a clean seperation between all image outputs and making it po=
ssible to have convinience symlinks to make it ready to deploy. And while i=
t isn't a valid reason, it must be mentioned: BSP layers which do use conve=
nience symlinks already don't step on files owned by others anymore.
>=20
> I assumed this was the default behaviour in OE-classic, but as it turns o=
ut every DISTRO set it to deploy/images/$MACHINE on its own.
>=20
> Code inspections shows that the all references to the image deploy dir in=
 classes and scripts in OE-core do the right thing and parse the DEPLOY_DIR=
_IMAGE variable, except runqemu.

I'm not using runqemu scripts, but the change looks OK:

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/conf/bitbake.conf |  2 +-
>  scripts/runqemu        | 37 ++++++++++++++++++++++++++++++++++---
>  2 files changed, 35 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index cd5d61e..0540766 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -379,7 +379,7 @@ DEPLOY_DIR_TAR =3D "${DEPLOY_DIR}/tar"
>  DEPLOY_DIR_IPK =3D "${DEPLOY_DIR}/ipk"
>  DEPLOY_DIR_RPM =3D "${DEPLOY_DIR}/rpm"
>  DEPLOY_DIR_DEB =3D "${DEPLOY_DIR}/deb"
> -DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images"
> +DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
>  DEPLOY_DIR_TOOLS =3D "${DEPLOY_DIR}/tools"
> =20
>  PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 8ed1226..94aa054 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -339,6 +339,34 @@ setup_tmpdir() {
>      fi
>  }
> =20
> +setup_deploydir() {
> +    if [ -z "$DEPLOY_DIR_IMAGE" ]; then
> +        # Try to get DEPLOY_DIR_IMAGE from bitbake
> +        type -P bitbake &>/dev/null || {
> +            echo "In order for this script to dynamically infer paths";
> +            echo "to kernels or filesystem images, you either need";
> +            echo "bitbake in your PATH or to source oe-init-build-env";
> +            echo "before running this script" >&2;
> +            exit 1; }
> +
> +        # We have bitbake in PATH, get DEPLOY_DIR_IMAGE from bitbake
> +        OE_TMPDIR=3D`MACHINE=3D$MACHINE bitbake -e | sed -n 's/^DEPLOY_D=
IR_IMAGE=3D\"\(.*\)\"/\1/p'`
> +        if [ -z "$DEPLOY_DIR_IMAGE" ]; then
> +            # Check for errors from bitbake that the user needs to know =
about
> +            BITBAKE_OUTPUT=3D`bitbake -e | wc -l`
> +            if [ "$BITBAKE_OUTPUT" -eq "0" ]; then
> +                echo "Error: this script needs to be run from your build=
 directory,"
> +                echo "or you need to explicitly set DEPLOY_DIR_IMAGE in =
your environment"
> +            else
> +                echo "There was an error running bitbake to determine DE=
PLOY_DIR_IMAGE"
> +                echo "Here is the output from 'bitbake -e':"
> +                bitbake -e
> +            fi
> +            exit 1
> +        fi
> +    fi
> +}
> +
>  setup_sysroot() {
>      # Toolchain installs set up $OECORE_NATIVE_SYSROOT in their
>      # environment script. If that variable isn't set, we're
> @@ -395,8 +423,9 @@ fi
> =20
>  if [ -z "$KERNEL" -a "x$FSTYPE" !=3D "xvmdk" ]; then
>      setup_tmpdir
> +    setup_deploydir
>      eval kernel_file=3D\$${machine2}_DEFAULT_KERNEL
> -    KERNEL=3D$OE_TMPDIR/deploy/images/$kernel_file
> +    KERNEL=3D$DEPLOY_DIR_IMAGE/$kernel_file
> =20
>      if [ -z "$KERNEL" ]; then
>          error "Unable to determine default kernel for MACHINE [$MACHINE]"
> @@ -418,13 +447,15 @@ fi
>  # core-image-sato
>  if [ "$LAZY_ROOTFS" =3D "true" ]; then
>      setup_tmpdir
> +    setup_deploydir
>      echo "Assuming $ROOTFS really means $OE_TMPDIR/deploy/images/$ROOTFS=
-$MACHINE.$FSTYPE"
> -    ROOTFS=3D$OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
> +    ROOTFS=3D$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
>  fi
> =20
>  if [ -z "$ROOTFS" -a "x$FSTYPE" !=3D "xvmdk" ]; then
>      setup_tmpdir
> -    T=3D$OE_TMPDIR/deploy/images
> +    setup_deploydir
> +    T=3D$DEPLOY_DIR_IMAGE
>      eval rootfs_list=3D\$${machine2}_DEFAULT_ROOTFS
>      findimage $T $MACHINE $FSTYPE
> =20
> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFBW6CQlri5Qm8JQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFq4fQACgkQN1Ujt2V2gBz/MACeMPpfHPXwEN4Ss+7HFJh1MahQ
AkwAn0d7ncgcpSY9FHq16iZTDZRWwLLg
=JTXN
-----END PGP SIGNATURE-----

--nFBW6CQlri5Qm8JQ--
