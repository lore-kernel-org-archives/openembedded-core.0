Return-Path: <ayaka@soulik.info>
X-Greylist: delayed 576 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Jan 2020 11:31:46 UTC
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAC37CDE4
	for <openembedded-core@openembedded.org>;
	Mon,  6 Jan 2020 11:31:46 +0000 (UTC)
Received: from [192.168.10.83] (unknown [112.10.171.7])
	by kozue.soulik.info (Postfix) with ESMTPSA id 799471012AA;
	Mon,  6 Jan 2020 20:22:18 +0900 (JST)
Mime-Version: 1.0 (1.0)
From: ayaka <ayaka@soulik.info>
X-Mailer: iPad Mail (16D57)
In-Reply-To: <1578308259-3821-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Date: Mon, 6 Jan 2020 19:22:02 +0800
Message-Id: <2A135E9E-4D02-4850-9EFE-E1CB999AF096@soulik.info>
References: <1578308259-3821-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: openembedded-core@openembedded.org
Subject: Re: [zeus] tune-cortexa72-cortexa53: Add tunes
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
X-List-Received-Date: Mon, 06 Jan 2020 11:31:47 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Jan 6, 2020, at 6:57 PM, Manjukumar Matha <manjukumar.harthikote-math=
a@xilinx.com> wrote:
>=20
> From: Joshua Watt <jpewhacker@gmail.com>
>=20
> Adds tunes for Cortex-A72 Cortex-A53 big.LITTLE SoCs (with and without
> crypto extensions), e.g. Rockchip RK3399
I wonder whether adding an extra script to handle those big little tunes w=
ould be better or there would be endless combines for them
>=20
> (From OE-Core rev: 78a555b324c30b2970eaa046c5d86de7980e678a)
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> .../machine/include/tune-cortexa72-cortexa53.inc   | 23 ++++++++++++++++=
++++++
> 1 file changed, 23 insertions(+)
> create mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.in=
c
>=20
> diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/me=
ta/conf/machine/include/tune-cortexa72-cortexa53.inc
> new file mode 100644
> index 0000000..0d43531
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> @@ -0,0 +1,23 @@
> +DEFAULTTUNE ?=3D "cortexa72-cortexa53"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +TUNEVALID[cortexa72-cortexa53] =3D "Enable big.LITTLE Cortex-A72.Cortex=
-A53 specific processor optimizations"
> +
> +TUNECONFLICTS[aarch64] =3D "armv4 armv5 armv6 armv7 armv7a"
> +
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72=
-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
> +
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cort=
exa53", " -mtune=3Dcortex-a72.cortex-a53", "", d)}"
> +
> +# cortexa72.cortexa53 implies crc support
> +AVAILTUNES +=3D "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
> +ARMPKGARCH_tune-cortexa72-cortexa53                  =3D "cortexa72-cor=
texa53"
> +ARMPKGARCH_tune-cortexa72-cortexa53-crypto           =3D "cortexa72-cor=
texa53"
> +TUNE_FEATURES_tune-cortexa72-cortexa53               =3D "${TUNE_FEATUR=
ES_tune-armv8a-crc}"
> +TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        =3D "${TUNE_FEATUR=
ES_tune-armv8a-crc-crypto}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         =3D "${PACKAGE_EXT=
RA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  =3D "${PACKAGE_EXT=
RA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-cr=
ypto"
> +BASE_LIB_tune-cortexa72-cortexa53                    =3D "lib64"
> +BASE_LIB_tune-cortexa72-cortexa53-crypto             =3D "lib64"
> +
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


