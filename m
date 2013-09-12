Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA9060C0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 12:22:47 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so5199078eae.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 05:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3c/JxgzDjl53kz5w9aOViK/tYJ3IMROk0eO4/wn4UtM=;
	b=UVpetc6JSY5SpfvkA0G4Ic6HdzWfN5pl4NQuLNLMHNKHK0Pt/LFhPCfoJ+z/R1xPBF
	JOrkzoHW10GFetTDKD6kSHlbzo0Ap0eQZH7FoVOaEYMcw5w4OqIj8pxadqZBkAEJ43sR
	RoK6c/tTw/7WzBuCIPDW6sdTmEdnPac5IRdQQTS/GQFThL1SaVpv48eT41hEYtnDBYyM
	qXfskJVcEP6u5NmJ625wTytBLxEW4ZrU7aU3xsG5YW/jKtKXnrTxEhgPTFxZ99v4Zil+
	WZrYSpk3QVXML/pLPBsforiHjoaLq9A5uieBCcRSoLNEGWQWA0onL+9Y9knVxT6Mvw9g
	+vAg==
X-Received: by 10.15.75.73 with SMTP id k49mr10321369eey.36.1378988568622;
	Thu, 12 Sep 2013 05:22:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm5426144eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 05:22:48 -0700 (PDT)
Date: Thu, 12 Sep 2013 14:24:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130912122415.GA11500@jama>
References: <1378983892-7327-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1378983892-7327-1-git-send-email-paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Thu, 12 Sep 2013 12:22:48 -0000
X-Groupsio-MsgNum: 44882
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VSfbCJd5UFatzzNC"
Content-Disposition: inline

--VSfbCJd5UFatzzNC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 12:04:52PM +0100, Paul Eggleton wrote:
> This allows a clean seperation between image outputs from different
> machines, and makes it possible to have convenience symlinks to make
> the output ready to deploy.
>=20
> This did require some surgery in runqemu; if explicit paths to the image
> and kernel are not supplied then DEPLOY_DIR_IMAGE needs to be determined
> from bitbake or set in the environment. However the script does try to
> avoid requiring it unless it really is needed. Corresponding changes
> were made in the automated testing code as well.
>=20
> Based on an RFC patch by Koen Kooi <koen@dominion.thruhere.net>

I use this layout for long time, it's great to see runqemu/qemurunner
getting more robust to support such layout.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/testimage.bbclass    |  1 +
>  meta/conf/bitbake.conf            |  2 +-
>  meta/lib/oeqa/utils/qemurunner.py |  8 +++++-
>  scripts/runqemu                   | 56 +++++++++++++++++++++++++++------=
------
>  4 files changed, 48 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbcl=
ass
> index 4eef0be..c83906d 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -122,6 +122,7 @@ def testimage_main(d):
> =20
>      qemu =3D QemuRunner(machine, rootfs)
>      qemu.tmpdir =3D d.getVar("TMPDIR", True)
> +    qemu.deploy_dir_image =3D d.getVar("DEPLOY_DIR_IMAGE", True)
>      qemu.display =3D d.getVar("BB_ORIGENV", False).getVar("DISPLAY", Tru=
e)
>      qemu.logfile =3D os.path.join(testdir, "qemu_boot_log.%s" % d.getVar=
('DATETIME', True))
>      try:
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2d19d86..0e1a9e2 100644
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
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemu=
runner.py
> index b5c757a..d362ede 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -16,7 +16,7 @@ import bb
> =20
>  class QemuRunner:
> =20
> -    def __init__(self, machine, rootfs, display =3D None, tmpdir =3D Non=
e, logfile =3D None, boottime =3D 400, runqemutime =3D 60):
> +    def __init__(self, machine, rootfs, display =3D None, tmpdir =3D Non=
e, deploy_dir_image =3D None, logfile =3D None, boottime =3D 400, runqemuti=
me =3D 60):
>          # Popen object
>          self.runqemu =3D None
> =20
> @@ -28,6 +28,7 @@ class QemuRunner:
> =20
>          self.display =3D display
>          self.tmpdir =3D tmpdir
> +        self.deploy_dir_image =3D deploy_dir_image
>          self.logfile =3D logfile
>          self.boottime =3D boottime
>          self.runqemutime =3D runqemutime
> @@ -71,6 +72,11 @@ class QemuRunner:
>              return False
>          else:
>              os.environ["OE_TMPDIR"] =3D self.tmpdir
> +        if not os.path.exists(self.deploy_dir_image):
> +            bb.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_di=
r_image)
> +            return False
> +        else:
> +            os.environ["DEPLOY_DIR_IMAGE"] =3D self.deploy_dir_image
> =20
>          self.qemuparams =3D 'bootparams=3D"console=3Dtty1 console=3DttyS=
0,115200n8" qemuparams=3D"-serial tcp:127.0.0.1:%s"' % self.serverport
>          if qemuparams:
> diff --git a/scripts/runqemu b/scripts/runqemu
> index b496785..efab1a2 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -321,9 +321,17 @@ AKITA_DEFAULT_FSTYPE=3Djffs2
>  SPITZ_DEFAULT_KERNEL=3DzImage-spitz.bin
>  SPITZ_DEFAULT_FSTYPE=3Dext3
> =20
> -setup_tmpdir() {
> -    if [ -z "$OE_TMPDIR" ]; then
> -        # Try to get OE_TMPDIR from bitbake
> +setup_path_vars() {
> +    if [ -z "$OE_TMPDIR" ] ; then
> +        PATHS_REQUIRED=3Dtrue
> +    elif [ "$1" =3D "1" -a -z "$DEPLOY_DIR_IMAGE" ] ; then
> +        PATHS_REQUIRED=3Dtrue
> +    else
> +        PATHS_REQUIRED=3Dfalse
> +    fi
> +
> +    if [ "$PATHS_REQUIRED" =3D "true" ]; then
> +        # Try to get the variable values from bitbake
>          type -P bitbake &>/dev/null || {
>              echo "In order for this script to dynamically infer paths";
>              echo "to kernels or filesystem images, you either need";
> @@ -331,21 +339,35 @@ setup_tmpdir() {
>              echo "before running this script" >&2;
>              exit 1; }
> =20
> -        # We have bitbake in PATH, get OE_TMPDIR from bitbake
> -        OE_TMPDIR=3D`MACHINE=3D$MACHINE bitbake -e | grep ^TMPDIR=3D\" |=
 cut -d '=3D' -f2 | cut -d '"' -f2`
> +        # We have bitbake in PATH, get the variable values from bitbake
> +        BITBAKE_ENV_TMPFILE=3D`mktemp runqemu.XXXXXXXXXX`
> +        if [ "$?" !=3D "0" ] ; then
> +            echo "Error: mktemp failed for bitbake environment output"
> +            exit 1
> +        fi
> +
> +        MACHINE=3D$MACHINE bitbake -e > $BITBAKE_ENV_TMPFILE
> +        if [ -z "$OE_TMPDIR" ] ; then
> +            OE_TMPDIR=3D`cat $BITBAKE_ENV_TMPFILE | sed -n 's/^TMPDIR=3D=
\"\(.*\)\"/\1/p'`
> +        fi
> +        if [ -z "$DEPLOY_DIR_IMAGE" ] ; then
> +            DEPLOY_DIR_IMAGE=3D`cat $BITBAKE_ENV_TMPFILE | sed -n 's/^DE=
PLOY_DIR_IMAGE=3D\"\(.*\)\"/\1/p'`
> +        fi
>          if [ -z "$OE_TMPDIR" ]; then
>              # Check for errors from bitbake that the user needs to know =
about
> -            BITBAKE_OUTPUT=3D`bitbake -e | wc -l`
> +            BITBAKE_OUTPUT=3D`cat $BITBAKE_ENV_TMPFILE | wc -l`
>              if [ "$BITBAKE_OUTPUT" -eq "0" ]; then
> -                echo "Error: this script needs to be run from your build=
 directory,"
> -                echo "or you need to explicitly set OE_TMPDIR in your en=
vironment"
> +                echo "Error: this script needs to be run from your build=
 directory, or you need"
> +                echo "to explicitly set OE_TMPDIR and DEPLOY_DIR_IMAGE i=
n your environment"
>              else
>                  echo "There was an error running bitbake to determine TM=
PDIR"
>                  echo "Here is the output from 'bitbake -e':"
> -                bitbake -e
> +                cat $BITBAKE_ENV_TMPFILE
>              fi
> +            rm $BITBAKE_ENV_TMPFILE
>              exit 1
>          fi
> +        rm $BITBAKE_ENV_TMPFILE
>      fi
>  }
> =20
> @@ -355,7 +377,7 @@ setup_sysroot() {
>      # either in an in-tree build scenario or the environment
>      # script wasn't source'd.
>      if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
> -        setup_tmpdir
> +        setup_path_vars
>          BUILD_ARCH=3D`uname -m`
>          BUILD_OS=3D`uname | tr '[A-Z]' '[a-z]'`
>          BUILD_SYS=3D"$BUILD_ARCH-$BUILD_OS"
> @@ -405,9 +427,9 @@ if [ -e "$ROOTFS" -a -z "$FSTYPE" ]; then
>  fi
> =20
>  if [ -z "$KERNEL" -a "x$FSTYPE" !=3D "xvmdk" ]; then
> -    setup_tmpdir
> +    setup_path_vars 1
>      eval kernel_file=3D\$${machine2}_DEFAULT_KERNEL
> -    KERNEL=3D$OE_TMPDIR/deploy/images/$kernel_file
> +    KERNEL=3D$DEPLOY_DIR_IMAGE/$kernel_file
> =20
>      if [ -z "$KERNEL" ]; then
>          error "Unable to determine default kernel for MACHINE [$MACHINE]"
> @@ -428,14 +450,14 @@ fi
>  # Handle cases where a ROOTFS type is given instead of a filename, e.g.
>  # core-image-sato
>  if [ "$LAZY_ROOTFS" =3D "true" ]; then
> -    setup_tmpdir
> -    echo "Assuming $ROOTFS really means $OE_TMPDIR/deploy/images/$ROOTFS=
-$MACHINE.$FSTYPE"
> -    ROOTFS=3D$OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
> +    setup_path_vars 1
> +    echo "Assuming $ROOTFS really means $DEPLOY_DIR_IMAGE/$ROOTFS-$MACHI=
NE.$FSTYPE"
> +    ROOTFS=3D$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
>  fi
> =20
>  if [ -z "$ROOTFS" -a "x$FSTYPE" !=3D "xvmdk" ]; then
> -    setup_tmpdir
> -    T=3D$OE_TMPDIR/deploy/images
> +    setup_path_vars 1
> +    T=3D$DEPLOY_DIR_IMAGE
>      eval rootfs_list=3D\$${machine2}_DEFAULT_ROOTFS
>      findimage $T $MACHINE $FSTYPE
> =20
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VSfbCJd5UFatzzNC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIxsm8ACgkQN1Ujt2V2gBzAlACeLtu1x5bKR36RbF7cANfTQ1Lj
gq0AoLgofI1cIPmszJGJzJxFfB5norOh
=OwYM
-----END PGP SIGNATURE-----

--VSfbCJd5UFatzzNC--
