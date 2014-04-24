Return-Path: <Mylene.Josserand@navocap.com>
Received: from mallaury.nerim.net (smtp-104-thursday.noc.nerim.net
	[178.132.17.104])
	by mail.openembedded.org (Postfix) with ESMTP id 3E68665D99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:56:19 +0000 (UTC)
Received: from mail.navocap.com (navocap-sdsl-19-50.cnt.nerim.net
	[213.215.19.50])
	by mallaury.nerim.net (Postfix) with ESMTPS id BDAF015344B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 11:56:18 +0200 (CEST)
Received: from COURRIER2014.nvp.local (192.168.200.2) by
	courrier2014.nvp.local (192.168.200.2) with Microsoft SMTP Server (TLS)
	id 15.0.775.38; Thu, 24 Apr 2014 11:55:54 +0200
Received: from COURRIER2014.nvp.local ([fe80::888a:1763:2a1b:ad8a]) by
	courrier2014.nvp.local ([fe80::888a:1763:2a1b:ad8a%14]) with mapi id
	15.00.0775.031; Thu, 24 Apr 2014 11:55:54 +0200
From: Mylene Josserand <Mylene.Josserand@navocap.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: kernel-yocto.bbclass : commas missing to use custom defconfig
Thread-Index: AQHPX6J3i3MfeBF9U0CfnskY72n/YA==
Date: Thu, 24 Apr 2014 09:55:53 +0000
Message-ID: <6e38b70bb3d84cb08af610496d2723ed@courrier2014.nvp.local>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.200.116]
MIME-Version: 1.0
Subject: kernel-yocto.bbclass : commas missing to use custom defconfig
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
X-List-Received-Date: Thu, 24 Apr 2014 09:56:23 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi everyone,=0A=
=0A=
=0A=
I am new to Open Embedded / Yocto and I am currently configure it to genera=
te custom kernel Linux and rootfs.=0A=
For configuration information, I am using the Angstrom distribution and I a=
m on Dora branch. =0A=
=0A=
Here my OE configs :=0A=
=0A=
=0A=
Build Configuration:=0A=
BB_VERSION        =3D "1.20.0"=0A=
BUILD_SYS         =3D "i686-linux"=0A=
NATIVELSBSTRING   =3D "Debian-7.4"=0A=
TARGET_SYS        =3D "arm-angstrom-linux-gnueabi"=0A=
MACHINE           =3D "navocap-thelma7"=0A=
DISTRO            =3D "angstrom"=0A=
DISTRO_VERSION    =3D "v2013.12"=0A=
TUNE_FEATURES     =3D "armv5 thumb dsp"=0A=
TARGET_FPU        =3D "soft"=0A=
meta-angstrom     =3D "angstrom-v2013.12-yocto1.5:dab3707b49b38112a9768a4c1=
1b6d19266d9dadb"=0A=
meta-oe           =0A=
toolchain-layer   =0A=
meta-networking   =3D "angstrom-staging-yocto1.5:4cc4b35f8ce68b38ebb5b84764=
8e2176a92cf6fc"=0A=
meta-java         =3D "dora:07f90e1615457edcadd2d9412048695823290f80"=0A=
meta-qt5          =3D "dora:d7ebb534535a22981dac2af34f4cd9c9b37f0296"=0A=
meta-systemd      =3D "angstrom-staging-yocto1.5:4cc4b35f8ce68b38ebb5b84764=
8e2176a92cf6fc"=0A=
meta-linaro       =0A=
meta-linaro-toolchain =3D "dora:ec262e6952804a417ab7112c807a6af1dc6a2f8b"=
=0A=
meta-navocap      =3D "master:2335db58cc49df0ff5e66c4e0fc152b7c7e3f832"=0A=
meta              =3D "angstrom-staging-yocto1.5:a4a399613625908ace8698d7ee=
ba4224cd122cb8"=0A=
=0A=
=0A=
I had some problems with the kernel recipe that - I think - I have resolved=
.=0A=
I use a "custom" kernel source so I created a new kernel recipe (inherited =
kernel and required recipes-kernel/linux/linux-yocto.inc) and configured it=
 to use my patches and my defconfig. =0A=
The patches were applied but not the defconfig file. I know that the best w=
ay (according to Yocto Kernel Manual) is to use fragments but as I already =
have a defconfig for my kernel, I did not want to spend time to split my de=
fconfig into fragments.=0A=
=0A=
I have found this post : https://lists.yoctoproject.org/pipermail/yocto/201=
3-October/016584.html but it did not solve my problem. I have always anothe=
r .config in my build kernel directory even if in the ${WORKDIR} it was my =
own defconfig.=0A=
=0A=
With some investigations, I found where is my problem.=0A=
In fact, the problem was during the "configme" task where the "merge-config=
.sh" failed. The merge-log.txt says :=0A=
=0A=
make[2]: *** No rule to make target `alldefconfig'.  Stop.=0A=
make[1]: *** [alldefconfig] Error 2=0A=
make: *** [sub-make] Error 2=0A=
=0A=
=0A=
So, I searched and the configuration of "configme" and so "merge-config.sh"=
 was passed via the "kernel-yocto.bbclass". The commit git.openembedded.org=
/openembedded-core/commit/?h=3Ddora&id=3D644f2e525b910b9ff8d9aaa33f11eba3fe=
fa7c85 permits to use the "allnoconfig" in case of defconfig files but, for=
 me, it was never used because it used the "KCONFIG_MODE". I looked to KCON=
FIG_MODE and it was empty so it should go to the "else" statement and use t=
he "allnoconfig". =0A=
And that how I found that some commas is missing in the line :=0A=
=0A=
=0A=
if [ -n ${KCONFIG_MODE} ]; then=0A=
=0A=
=0A=
I added it :=0A=
=0A=
=0A=
if [ -n "${KCONFIG_MODE}" ]; then=0A=
=0A=
=0A=
And now, I have the "allnoconfig" option and I have my own .config in the b=
uild kernel directory.=0A=
=0A=
I looked to other branch (master), and I still see the commas missing so I =
though that, maybe, nobody noticed this. So here I am ! =0A=
I don't know if it must be patched or something else (I am new so I don't k=
now how it works), but I wanted to share it.=0A=
=0A=
=0A=
If you need more information, do not hesitate.=0A=
Thank you in advance.=0A=
=0A=
=0A=
Best regards,=0A=
=0A=
=0A=
Mylene JOSSERAND=0A=

