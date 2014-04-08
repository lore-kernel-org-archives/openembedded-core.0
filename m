Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-b21.telenor.se (smtprelay-b21.telenor.se
	[195.54.99.212])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEF765D45
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 06:50:47 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id CE996C6E8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 08:50:47 +0200 (CEST)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AoYVADubQ1NT4zlmPGdsb2JhbAANTINBg2G5ThiGZlEigRADAQEBATiCWgEBAQECAQEBASBLCwULCw4KAgImAgInARsUBhOHcQ0IpzR2oicXgSmNDjMHgm81gRQElgWCV4E0lD4
X-IPAS-Result: AoYVADubQ1NT4zlmPGdsb2JhbAANTINBg2G5ThiGZlEigRADAQEBATiCWgEBAQECAQEBASBLCwULCw4KAgImAgInARsUBhOHcQ0IpzR2oicXgSmNDjMHgm81gRQElgWCV4E0lD4
X-IronPort-AV: E=Sophos;i="4.97,816,1389740400"; d="scan'208";a="857428602"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.117]) ([83.227.57.102])
	by ipb1.telenor.se with ESMTP; 08 Apr 2014 08:50:47 +0200
References: <53430460.4080608@emagii.com> <20140407201730.GF3370@denix.org>
In-Reply-To: <20140407201730.GF3370@denix.org>
Mime-Version: 1.0 (1.0)
Message-Id: <710791F9-9387-4DE3-939E-C0AFF4D87E1B@emagii.com>
X-Mailer: iPad Mail (9B176)
From: Ulf Samuelsson <openembedded-core@emagii.com>
Date: Tue, 8 Apr 2014 08:50:47 +0200
To: Denys Dmytriyenko <denis@denix.org>
Cc: "ulf@emagii.com" <ulf@emagii.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain-sdk LDFLAGS fails for ARMv7 (beagleboard)
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
X-List-Received-Date: Tue, 08 Apr 2014 06:50:53 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Clearing LDFLAGS allows U-Boot to build.

Now trying to build a busybox with static linking, but the SDK only provides=
 the lib<x>.so=20
and not the lib<x>.a static libraries.=20

Any easy way to make it include both?

Best Regards
Ulf Samuelsson

7 apr 2014 kl. 22:17 skrev Denys Dmytriyenko <denis@denix.org>:

> On Mon, Apr 07, 2014 at 10:02:40PM +0200, Ulf Samuelsson wrote:
>> Trying to build an SDK for the Beaglebone
>>=20
>> $ git clone git://git.yoctoproject.org/poky
>> $ cd poky
>> $ git checkout -b dora origin/dora
>>=20
>> $ . oe-init-build-env
>>=20
>> MACHINE is set to "beagleboard" in local.conf
>=20
> It's not critical to your case, but in general beagleboard !=3D beaglebone=
...
>=20
> And cutting to the chase - U-boot recipe in OE clears CFLAGS, LDFLAGS and=20=

> CPPFLAGS before building it...
>=20
>=20
>> $ ./environment-angstrom-v2013.06
>>=20
>> $ bitbake meta-toolchain-sdk
>>=20
>> SDK is generated, and installed in /opt/poky/1.5.1 (default)
>>=20
>> The toolchain environment file is "sourced"
>>=20
>> Then I try to build U-Boot-13.10 (with a minor patch)
>>=20
>>=20
>> $ make am335x_boneblack_config
>>=20
>> $ make
>>=20
>> After compiling a number of file, the linking of a library fails:
>>=20
>> arm-poky-linux-gnueabi-ld.bfd -Wl,-O1 -Wl,--hash-style=3Dgnu
>> -Wl,--as-needed   -r -o libcommon.o  cmd_bdinfo.o cmd_boot.o
>> cmd_bootm.o cmd_console.o cmd_dfu.o cmd_disk.o cmd_echo.o
>> cmd_eeprom.o cmd_exit.o cmd_ext2.o cmd_ext4.o cmd_fat.o cmd_fdt.o
>> cmd_fs.o cmd_gpio.o cmd_help.o cmd_i2c.o cmd_itest.o cmd_load.o
>> cmd_mem.o cmd_misc.o cmd_mmc.o cmd_net.o cmd_nvedit.o cmd_pcmcia.o
>> cmd_sf.o cmd_source.o cmd_spi.o cmd_spl.o cmd_test.o cmd_usb.o
>> cmd_version.o cmd_ximg.o command.o console.o dlmalloc.o env_attr.o
>> env_callback.o env_common.o env_flags.o env_mmc.o exports.o
>> fdt_support.o flash.o hash.o hush.o image-fdt.o image.o main.o
>> memsize.o miiphyutil.o s_record.o splash.o stdio.o usb.o usb_hub.o
>> usb_storage.o xyzModem.o
>> arm-poky-linux-gnueabi-ld.bfd: unrecognized option '-Wl,-O1'
>> arm-poky-linux-gnueabi-ld.bfd: use the --help option for usage informatio=
n
>> make[1]: *** [libcommon.o] Fel 1
>> make[1]: L=C3=A4mnar katalogen
>> "/home/ulf/felabs/sysdev/bootloader/u-boot-2013.10/common"
>> make: *** [common/libcommon.o] Fel 2
>>=20
>> -------------------
>> The environment looks like:
>> -------------------------------------------------------------------------=
----------------------------------------------------------------------------=
----------------------
>> export PATH=3D/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin:/opt/=
poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi:$PAT=
H
>> export PKG_CONFIG_SYSROOT_DIR=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-=
poky-linux-gnueabi
>> export PKG_CONFIG_PATH=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-li=
nux-gnueabi/usr/lib/pkgconfig
>> export CONFIG_SITE=3D/opt/poky/1.5.1/site-config-armv7a-vfp-neon-poky-lin=
ux-gnueabi
>> export CC=3D"arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a
>> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/poky=
/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
>> export CXX=3D"arm-poky-linux-gnueabi-g++  -march=3Darmv7-a
>> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/poky=
/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
>> export CPP=3D"arm-poky-linux-gnueabi-gcc -E  -march=3Darmv7-a
>> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/poky=
/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
>> export AS=3D"arm-poky-linux-gnueabi-as "
>> export LD=3D"arm-poky-linux-gnueabi-ld --sysroot=3D/opt/poky/1.5.1/sysroo=
ts/armv7a-vfp-neon-poky-linux-gnueabi"
>> export GDB=3Darm-poky-linux-gnueabi-gdb
>> export STRIP=3Darm-poky-linux-gnueabi-strip
>> export RANLIB=3Darm-poky-linux-gnueabi-ranlib
>> export OBJCOPY=3Darm-poky-linux-gnueabi-objcopy
>> export OBJDUMP=3Darm-poky-linux-gnueabi-objdump
>> export AR=3Darm-poky-linux-gnueabi-ar
>> export NM=3Darm-poky-linux-gnueabi-nm
>> export M4=3Dm4
>> export TARGET_PREFIX=3Darm-poky-linux-gnueabi-
>> export CONFIGURE_FLAGS=3D"--target=3Darm-poky-linux-gnueabi
>> --host=3Darm-poky-linux-gnueabi --build=3Dx86_64-linux --with-libtool-sys=
root=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
>> export CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types"
>> export CXXFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types -fpermiss=
ive"
>> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed"
>> export CPPFLAGS=3D""
>> export OECORE_NATIVE_SYSROOT=3D"/opt/poky/1.5.1/sysroots/x86_64-pokysdk-l=
inux"
>> export OECORE_TARGET_SYSROOT=3D"/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-=
poky-linux-gnueabi"
>> export OECORE_ACLOCAL_OPTS=3D"-I
>> /opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/share/aclocal"
>> export OECORE_DISTRO_VERSION=3D"1.5.1"
>> export OECORE_SDK_VERSION=3D"1.5.1"
>> export PYTHONHOME=3D/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr
>> export ARCH=3Darm
>> export CROSS_COMPILE=3Darm-poky-linux-gnueabi-
>> -------------------------------------------------------------------------=
----------------------------------------------------------------------------=
----------------------------
>>=20
>> Notable is:
>> export LD=3D"arm-poky-linux-gnueabi-ld --sysroot=3D/opt/poky/1.5.1/sysroo=
ts/armv7a-vfp-neon-poky-linux-gnueabi"
>> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed"
>>=20
>> =46rom the error message I see:
>> "arm-poky-linux-gnueabi-ld.bfd -Wl,-O1 ..."
>>=20
>> Note that $(CROSS_COMPILE)-ld.bfd is used, not $(CROSS_COMPILE)-ld
>>=20
>> so the linker is linking with $(LDFLAGS) which contains switches to
>> be passed to the compiler, and bombs
>>=20
>> Changing LD to:
>> export LD=3D"arm-poky-linux-gnueabi-gcc --sysroot=3D/opt/poky/1.5.1/sysro=
ots/armv7a-vfp-neon-poky-linux-gnueabi"
>>=20
>> Does not help, still you get the same error message with
>> $(CROSS_COMPILE)-ld.bfd called with "-Wl,..." arguments.
>>=20
>> Only when I am setting LDFLAGS=3D"", E.E: not passing arguments to I
>> can compile U-Boot.
>>=20
>> It looks like the toolchain does not handle compiler linker flags
>> correctly and passes the arguments without parsing to the linker.
>>=20
>>=20
>> If you use the SDK, Is it wrong to do=3D
>>=20
>> ${LD} ${LDFLAGS} ??
>>=20
>> U-Boot does this in several places?
>>=20
>> Using the poky installation to
>>=20
>> bitbake core-image-minimal
>>=20
>> will complete the build of U-Boot-2013.07, but does not pass these option=
s.
>>=20
>> arm-poky-linux-gnueabi-ld.bfd  -r -o /home/ulf/felabs/sysdev/poky/build/t=
mp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8=
-r0/git/spl/common/libcommon.o /home/ulf/felabs/sysdev/poky/build/tmp/work/b=
eagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/s=
pl/common/cmd_nvedit.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboa=
rd-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/commo=
n/console.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-lin=
ux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/dlmalloc.=
o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi=
/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/env_common.o /home/=
ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/=
v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/env_nand.o /home/ulf/felabs=
/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+g=
itAUTOINC+62c175fbb8-r0/git/spl/common/image-fdt.o /home/ulf/felabs/sysdev/p=
oky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC=
+62c175fbb8-r0/git/spl/common/image.o /home/ulf/felabs/sysdev/poky/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r=
0/git/spl/common/memsize.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagl=
eboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/c=
ommon/stdio.o
>>=20
>>=20
>> --=20
>> Best Regards
>> Ulf Samuelsson
>> eMagii
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

