Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8FA6B8D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 08:27:49 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so2760913ead.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gcDa+82yPTwVyUXYv6kPQREreZ4bQ95jcgGfOW5OHgU=;
	b=OFbEfgmrv/ynpZaGQiexhRv2LwXSbXZG/54vRx75wZp5rl9fGY5d3XFwA/7xtMPmA8
	5mn1esVRWBZSMnDjSzSRizFLl2U4oxmorzvSGM42pEPuVO26nj+O/4vGSV1Q6uF8Nr/v
	f3pyGclbG4zQGWPzgiw3A9U4oWdUVj1fuCI7eGOnSNYK4wqgqqr8TcwZHAIN5F2WLjvZ
	t/2YLLKwv1pE9jBEXJZS0tmARP+8nxbAE1Jh29sBw57Wb27KMuqjeQjREeA3s+PGLOL7
	WGYshbt9CwqJnTsC77FoQeWOQD3jLRNH3RCkkYBnUiTB9GVEtr5M1WnmAVlAM5BJJNTi
	alCA==
X-Received: by 10.15.54.72 with SMTP id s48mr1540969eew.58.1377678470019;
	Wed, 28 Aug 2013 01:27:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm35306400eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 01:27:49 -0700 (PDT)
Date: Wed, 28 Aug 2013 10:29:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130828082900.GG3544@jama>
References: <1365581101-3810-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1365581101-3810-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCHv2] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Wed, 28 Aug 2013 08:27:50 -0000
X-Groupsio-MsgNum: 44179
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vsHhinrhaqUzFcVS"
Content-Disposition: inline

--vsHhinrhaqUzFcVS
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

Is there some reason why this patch didn't make it into 1.5?

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

--vsHhinrhaqUzFcVS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIdtMwACgkQN1Ujt2V2gBwpDgCgk+Kmyi2ODk/tORqSwsv5jn1o
trsAoI6efQAK8eZ5g8n6bWfimAIbKHrD
=4JPB
-----END PGP SIGNATURE-----

--vsHhinrhaqUzFcVS--
