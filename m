Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PzvRL-00062M-Dy
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 19:27:23 +0100
Received: by wwb17 with SMTP id 17so2227898wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 11:25:40 -0700 (PDT)
Received: by 10.216.188.201 with SMTP id a51mr417268wen.60.1300299940269;
	Wed, 16 Mar 2011 11:25:40 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id t72sm751570wei.20.2011.03.16.11.25.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 11:25:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <72630e485ee5606ee308b97f58c645662f9e2108.1300297594.git.paul.eggleton@linux.intel.com>
Date: Wed, 16 Mar 2011 19:25:35 +0100
Message-Id: <DBC31B04-026E-4DD8-A9D8-B8F748BE0087@dominion.thruhere.net>
References: <cover.1300297594.git.paul.eggleton@linux.intel.com>
	<72630e485ee5606ee308b97f58c645662f9e2108.1300297594.git.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1082)
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] sanity: detect if bitbake wrapper is not being used or pseudo is broken
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
X-List-Received-Date: Wed, 16 Mar 2011 18:27:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mrt 2011, om 18:49 heeft Paul Eggleton het volgende geschreven:

> From: Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> * Shows a warning during sanity checking if the scripts/bitbake =
wrapper is
>  not being used
> * Check to see if pseudo is working during sanity checking, and if it
>  isn't an error occurs (if we are using the wrapper script and pseudo
>  has been built; otherwise it is a warning).

Do really want to add *more* poky references into oe-core when the goal =
is to remove them?

>=20
> Fixes [YOCTO #653]
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/sanity.bbclass |   25 ++++++++++++++++++++++++-
> scripts/bitbake             |    3 +++
> scripts/poky-env-internal   |    2 +-
> 3 files changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index a6d320b..6e13d2a 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -40,7 +40,26 @@ def check_sanity_tmpdir_change(tmpdir):
> def check_sanity_version_change():
>     # Sanity checks to be done when SANITY_VERSION changes
>     return ""
> -   =20
> +
> +def check_pseudo_wrapper():
> +    import subprocess as sub
> +    # Check if bitbake wrapper is being used
> +    pseudo_build =3D os.environ.get( 'PSEUDO_BUILD' )
> +    if not pseudo_build:
> +        bb.warn("Bitbake has not been run using the bitbake wrapper =
(scripts/bitbake); this is likely because your PATH has been altered =
from that normally set up by the poky-init-build-env script. Not using =
the wrapper may result in failures during package installation, so it is =
highly recommended that you set your PATH back so that the wrapper =
script is being executed.")
> +
> +    if (not pseudo_build) or pseudo_build =3D=3D '2':
> +        # pseudo ought to be working, let's see if it is...
> +        p =3D sub.Popen(['sh', '-c', 'PSEUDO_DISABLED=3D0 id =
-u'],stdout=3Dsub.PIPE,stderr=3Dsub.PIPE)
> +        out, err =3D p.communicate()
> +        if out.rstrip() !=3D '0':
> +            msg =3D "Pseudo is not functioning correctly, which will =
cause failures during package installation. Please check your =
configuration."
> +            if pseudo_build =3D=3D '2':
> +                return msg
> +            else:
> +                bb.warn(msg)
> +    return ""
> +
> def check_create_long_filename(filepath, pathname):
>     testfile =3D os.path.join(filepath, ''.join([`num`[-1] for num in =
xrange(1,200)]))
>     try:
> @@ -187,6 +206,10 @@ def check_sanity(e):
>         missing =3D missing.rstrip(',')
>         messages =3D messages + "Please install following missing =
utilities: %s\n" % missing
>=20
> +    pseudo_msg =3D check_pseudo_wrapper()
> +    if pseudo_msg !=3D "":
> +        messages =3D messages + pseudo_msg + '\n'
> +
>     # Check if DISPLAY is set if IMAGETEST is set
>     if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( =
'IMAGETEST', e.data, True ) =3D=3D 'qemu':
>         messages =3D messages + 'qemuimagetest needs a X desktop to =
start qemu, please set DISPLAY correctly (e.g. DISPLAY=3D:1.0)\n'
> diff --git a/scripts/bitbake b/scripts/bitbake
> index cad4dbe..29e7bcd 100755
> --- a/scripts/bitbake
> +++ b/scripts/bitbake
> @@ -27,6 +27,7 @@ OLDPATH=3D$PATH
> export PATH=3D`echo $PATH | sed s#[^:]*/scripts:##`
> if [ $buildpseudo =3D "1" ]; then
>     echo "Pseudo is not present but is required, building this first =
before the main build"
> +    export PSEUDO_BUILD=3D1
>     bitbake pseudo-native tar-replacement-native -c populate_sysroot
>     ret=3D$?
>     if [ "$ret" !=3D "0" ]; then
> @@ -44,9 +45,11 @@ fi
> BITBAKE=3D`which bitbake`
> export PATH=3D$OLDPATH
> if [ $needpseudo =3D "1" ]; then
> +    export PSEUDO_BUILD=3D2
>     PSEUDOBINDIR=3D`cat $BUILDDIR/pseudodone`
>     PSEUDO_BINDIR=3D$PSEUDOBINDIR =
PSEUDO_LIBDIR=3D$PSEUDOBINDIR/../lib/pseudo/lib =
PSEUDO_PREFIX=3D$PSEUDOBINDIR/../../ PSEUDO_DISABLED=3D1 =
$PSEUDOBINDIR/pseudo $BITBAKE $@
> else
> +    export PSEUDO_BUILD=3D0
>     $BITBAKE $@
> fi
> ret=3D$?
> diff --git a/scripts/poky-env-internal b/scripts/poky-env-internal
> index 724a6e4..5549454 100755
> --- a/scripts/poky-env-internal
> +++ b/scripts/poky-env-internal
> @@ -55,6 +55,6 @@ unset BITBAKEDIR
> export BUILDDIR
> export PATH
>=20
> -export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO POKYMODE POKYLIBC =
http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy =
SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE =
BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED"
> +export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO POKYMODE POKYLIBC =
http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy =
SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE =
BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD"
>=20
> export BBFETCH2=3DTrue
> --=20
> 1.7.1
>=20
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



