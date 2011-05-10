Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJo0d-0006jf-Ev
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:33:59 +0200
Received: by wwi18 with SMTP id 18so3440821wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:31:13 -0700 (PDT)
Received: by 10.227.128.208 with SMTP id l16mr8508430wbs.61.1305037873338;
	Tue, 10 May 2011 07:31:13 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	bd8sm4433373wbb.14.2011.05.10.07.31.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:31:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <0a007e99bacaaf9afaf3641635724fdb78974770.1305035617.git.richard.purdie@linuxfoundation.org>
Date: Tue, 10 May 2011 16:31:10 +0200
Message-Id: <3299F82E-BAF4-4CB9-9269-4CB36045E385@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<0a007e99bacaaf9afaf3641635724fdb78974770.1305035617.git.richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/6] distro: Add defaultsetup.conf, a set of default configuration providing sane overrridable default for commonly used options
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
X-List-Received-Date: Tue, 10 May 2011 14:33:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende geschreven:

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> The intent is to allow distros to share common core config but still =
allow
> customisations. The core should work with no distro set but users
> can still customise in any ways needed.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/conf/bitbake.conf                             |    4 +-
> meta/conf/distro/defaultsetup.conf                 |   23 ++++++++++
> .../include/{poky-eglibc.inc =3D> tclibc-eglibc.inc} |    6 ++-
> .../include/{poky-glibc.inc =3D> tclibc-glibc.inc}   |    6 ++-
> .../include/{poky-uclibc.inc =3D> tclibc-uclibc.inc} |    4 ++
> .../{poky-default.inc =3D> tcmode-default.inc}       |   13 +++---
> meta/conf/distro/poky.conf                         |   46 =
+++++--------------
> 7 files changed, 54 insertions(+), 48 deletions(-)
> create mode 100644 meta/conf/distro/defaultsetup.conf
> rename meta/conf/distro/include/{poky-eglibc.inc =3D> =
tclibc-eglibc.inc} (92%)
> rename meta/conf/distro/include/{poky-glibc.inc =3D> tclibc-glibc.inc} =
(91%)
> rename meta/conf/distro/include/{poky-uclibc.inc =3D> =
tclibc-uclibc.inc} (86%)
> rename meta/conf/distro/include/{poky-default.inc =3D> =
tcmode-default.inc} (85%)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d843e70..ce74a9b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -627,9 +627,7 @@ include conf/build/${BUILD_SYS}.conf
> include conf/target/${TARGET_SYS}.conf
> include conf/machine/${MACHINE}.conf
> include conf/machine-sdk/${SDKMACHINE}.conf
> -include conf/distro/include/default-providers.inc
> -include conf/distro/include/default-versions.inc
> -include conf/distro/include/world-broken.inc
> +include conf/distro/defaultsetup.conf
> include conf/distro/${DISTRO}.conf

Please include it after $DISTRO, otherwise ?=3D in $DISTRO won't work as =
intended.

> include conf/documentation.conf
> require conf/sanity.conf
> diff --git a/meta/conf/distro/defaultsetup.conf =
b/meta/conf/distro/defaultsetup.conf
> new file mode 100644
> index 0000000..af5ef7b
> --- /dev/null
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -0,0 +1,23 @@
> +include conf/distro/include/default-providers.inc
> +include conf/distro/include/default-versions.inc
> +include conf/distro/include/world-broken.inc
> +
> +TARGET_VENDOR ?=3D "-oecore"
> +
> +TARGET_FPU_arm ?=3D "soft"
> +TARGET_FPU_armeb ?=3D "soft"

Something more elaborate would be better, this is what angstrom has:

conf/distro/include/angstrom.inc:TARGET_FPU_arm =3D "soft"
conf/distro/include/angstrom.inc:TARGET_FPU_armeb =3D "soft"
conf/distro/include/angstrom.inc:TARGET_FPU_ixp4xx =3D "soft"
conf/distro/include/angstrom.inc:TARGET_FPU_ppc405 =3D "soft"
conf/distro/include/angstrom.inc:TARGET_FPU_armv6 =3D "hard"
conf/distro/include/angstrom.inc:TARGET_FPU_armv6-novfp =3D "soft"
conf/distro/include/angstrom.inc:TARGET_FPU_armv7a =3D "hard"
conf/distro/include/angstrom.inc:TARGET_FPU_ppc603e =3D "hard"

you really want to use hard (don't confuse it with hardfp) on armv7a.

> +INHERIT_INSANE ?=3D "insane"

excellent!

>=20
> --- a/meta/conf/distro/include/poky-eglibc.inc
> +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> @@ -2,6 +2,10 @@
> # eglibc specific configuration
> #
>=20
> +TARGET_OS =3D "linux"
> +TARGET_OS_arm =3D "linux-gnueabi"
> +TARGET_OS_armeb =3D "linux-gnueabi"

Maybe something like angstroms version:

TARGET_OS =3D "linux"
TARGET_OS .=3D "${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in =
['arm', 'armeb']]}"
TARGET_OS .=3D =
"${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in =
['ppce500', 'ppce500v2']]}"

or the sane-toolchain version:

def compute_os_portion_of_target_triplet (d):
    import bb
    arm_eabi_unsupported_arches =3D "armv1 armv2 armv3"
    ppc_spe_supporting_arches =3D "ppce500v2 ppce500"
    gnu_suffix =3D ""
    if bb.data.getVar('LIBC', d, 1) =3D=3D "uclibc":
        libc_suffix =3D "uclibc"
    else:
        libc_suffix =3D ""

    if bb.data.getVar('TARGET_ARCH',d,1) in ['bfin']:
        if libc_suffix is not "uclibc":
            bb.fatal("bfin is not supported on glibc/eglibc. Please =
choose uclibc")
        else:
            os_suffix =3D "uclinux"
    else:
        os_suffix =3D "linux"
    bparch =3D bb.data.getVar('BASE_PACKAGE_ARCH', d,1)

    if bb.data.getVar('DISTRO_FEATURES',d,1) is not None and \
    bparch is not None:
        if 'eabi' in bb.data.getVar('DISTRO_FEATURES',d,1).split() and \
        bb.data.getVar('TARGET_ARCH', d, 1) in [ 'arm', 'armeb' ]:
            if bparch in arm_eabi_unsupported_arches.split():
                bb.fatal("DISTRO requested EABI but selected machine =
does not support EABI")
                abi_suffix =3D ""
            else:
                if libc_suffix is not "uclibc":
                    gnu_suffix =3D "gnu"
                abi_suffix =3D "eabi"
        elif bparch in ppc_spe_supporting_arches.split():
            if libc_suffix is not "uclibc":
                gnu_suffix =3D "gnu"
            abi_suffix =3D "spe"
        else:
            abi_suffix =3D ""
    else:
        bb.note("DISTRO_FEATURES is not set abi suffix not set")
        abi_suffix =3D ""

    if bb.data.getVar('TOOLCHAIN_BRAND', d, 1) is not None and \
    "csl" in bb.data.getVar('TOOLCHAIN_BRAND', d, 1):
        gnu_suffix =3D "gnu"

    if libc_suffix + gnu_suffix + abi_suffix is not "":
        return os_suffix + "-" + libc_suffix + gnu_suffix + abi_suffix
    else:
        return os_suffix

> diff --git a/meta/conf/distro/include/poky-default.inc =
b/meta/conf/distro/include/tcmode-default.inc
> similarity index 85%
> rename from meta/conf/distro/include/poky-default.inc
> rename to meta/conf/distro/include/tcmode-default.inc
> index 91985b3..909d802 100644
> --- a/meta/conf/distro/include/poky-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -1,18 +1,16 @@

> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D =
"${POKYLIBC}"
> +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D =
"${TCLIBC}"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D =
"binutils-cross"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D =
"gcc-cross-initial"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D =
"gcc-cross-intermediate"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "gcc-cross"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "gcc-cross"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs =3D =
"gcc-runtime"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D =
"${POKYLIBC}-initial"
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-for-gcc-nativesdk ?=3D =
"${POKYLIBC}-nativesdk"
> +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D =
"${TCLIBC}-initial"
> +PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-for-gcc-nativesdk ?=3D =
"${TCLIBC}-nativesdk"

Angstrom has this for *libc:

# The things *libc can provide.
PREFERRED_PROVIDER_virtual/libc =3D "${TCLIBC}"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D =
"${TCLIBC}-initial"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "${TCLIBC}"

# And the same as above for the nativesdk
PREFERRED_PROVIDER_virtual/libc-nativesdk =3D "${TCLIBC}-nativesdk"
PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-nativesdk =3D =
"${TCLIBC}-initial-nativesdk"
PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-for-gcc-nativesdk =3D =
"${TCLIBC}-nativesdk"

I needed the initial-nativesdk for meta-toolchain, but I can't recall =
the exact problem

regards,

Koen=


