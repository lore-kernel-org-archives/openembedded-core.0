Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8F38F605F4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 20:17:45 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3O00CZZGD78Y50@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 07 Apr 2014 15:17:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C237B201AC; Mon,
	07 Apr 2014 16:17:30 -0400 (EDT)
Date: Mon, 07 Apr 2014 16:17:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: ulf@emagii.com
Message-id: <20140407201730.GF3370@denix.org>
References: <53430460.4080608@emagii.com>
MIME-version: 1.0
In-reply-to: <53430460.4080608@emagii.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 07 Apr 2014 20:17:47 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: quoted-printable

On Mon, Apr 07, 2014 at 10:02:40PM +0200, Ulf Samuelsson wrote:
> Trying to build an SDK for the Beaglebone
>=20
> $ git clone git://git.yoctoproject.org/poky
> $ cd poky
> $ git checkout -b dora origin/dora
>=20
> $ . oe-init-build-env
>=20
> MACHINE is set to "beagleboard" in local.conf

It's not critical to your case, but in general beagleboard !=3D beaglebone.=
=2E.

And cutting to the chase - U-boot recipe in OE clears CFLAGS, LDFLAGS and=
=20
CPPFLAGS before building it...


> $ ./environment-angstrom-v2013.06
>=20
> $ bitbake meta-toolchain-sdk
>=20
> SDK is generated, and installed in /opt/poky/1.5.1 (default)
>=20
> The toolchain environment file is "sourced"
>=20
> Then I try to build U-Boot-13.10 (with a minor patch)
>=20
>=20
> $ make am335x_boneblack_config
>=20
> $ make
>=20
> After compiling a number of file, the linking of a library fails:
>=20
> arm-poky-linux-gnueabi-ld.bfd -Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed   -r -o libcommon.o  cmd_bdinfo.o cmd_boot.o
> cmd_bootm.o cmd_console.o cmd_dfu.o cmd_disk.o cmd_echo.o
> cmd_eeprom.o cmd_exit.o cmd_ext2.o cmd_ext4.o cmd_fat.o cmd_fdt.o
> cmd_fs.o cmd_gpio.o cmd_help.o cmd_i2c.o cmd_itest.o cmd_load.o
> cmd_mem.o cmd_misc.o cmd_mmc.o cmd_net.o cmd_nvedit.o cmd_pcmcia.o
> cmd_sf.o cmd_source.o cmd_spi.o cmd_spl.o cmd_test.o cmd_usb.o
> cmd_version.o cmd_ximg.o command.o console.o dlmalloc.o env_attr.o
> env_callback.o env_common.o env_flags.o env_mmc.o exports.o
> fdt_support.o flash.o hash.o hush.o image-fdt.o image.o main.o
> memsize.o miiphyutil.o s_record.o splash.o stdio.o usb.o usb_hub.o
> usb_storage.o xyzModem.o
> arm-poky-linux-gnueabi-ld.bfd: unrecognized option '-Wl,-O1'
> arm-poky-linux-gnueabi-ld.bfd: use the --help option for usage information
> make[1]: *** [libcommon.o] Fel 1
> make[1]: L=E4mnar katalogen
> "/home/ulf/felabs/sysdev/bootloader/u-boot-2013.10/common"
> make: *** [common/libcommon.o] Fel 2
>=20
> -------------------
> The environment looks like:
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------
> export PATH=3D/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin:/opt/=
poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi:$PA=
TH
> export PKG_CONFIG_SYSROOT_DIR=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-=
poky-linux-gnueabi
> export PKG_CONFIG_PATH=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-li=
nux-gnueabi/usr/lib/pkgconfig
> export CONFIG_SITE=3D/opt/poky/1.5.1/site-config-armv7a-vfp-neon-poky-lin=
ux-gnueabi
> export CC=3D"arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a
> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/poky=
/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
> export CXX=3D"arm-poky-linux-gnueabi-g++  -march=3Darmv7-a
> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/poky=
/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
> export CPP=3D"arm-poky-linux-gnueabi-gcc -E  -march=3Darmv7-a
> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/poky=
/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
> export AS=3D"arm-poky-linux-gnueabi-as "
> export LD=3D"arm-poky-linux-gnueabi-ld --sysroot=3D/opt/poky/1.5.1/sysroo=
ts/armv7a-vfp-neon-poky-linux-gnueabi"
> export GDB=3Darm-poky-linux-gnueabi-gdb
> export STRIP=3Darm-poky-linux-gnueabi-strip
> export RANLIB=3Darm-poky-linux-gnueabi-ranlib
> export OBJCOPY=3Darm-poky-linux-gnueabi-objcopy
> export OBJDUMP=3Darm-poky-linux-gnueabi-objdump
> export AR=3Darm-poky-linux-gnueabi-ar
> export NM=3Darm-poky-linux-gnueabi-nm
> export M4=3Dm4
> export TARGET_PREFIX=3Darm-poky-linux-gnueabi-
> export CONFIGURE_FLAGS=3D"--target=3Darm-poky-linux-gnueabi
> --host=3Darm-poky-linux-gnueabi --build=3Dx86_64-linux --with-libtool-sys=
root=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
> export CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types"
> export CXXFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types -fpermiss=
ive"
> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed"
> export CPPFLAGS=3D""
> export OECORE_NATIVE_SYSROOT=3D"/opt/poky/1.5.1/sysroots/x86_64-pokysdk-l=
inux"
> export OECORE_TARGET_SYSROOT=3D"/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-=
poky-linux-gnueabi"
> export OECORE_ACLOCAL_OPTS=3D"-I
> /opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/share/aclocal"
> export OECORE_DISTRO_VERSION=3D"1.5.1"
> export OECORE_SDK_VERSION=3D"1.5.1"
> export PYTHONHOME=3D/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr
> export ARCH=3Darm
> export CROSS_COMPILE=3Darm-poky-linux-gnueabi-
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------
>=20
> Notable is:
> export LD=3D"arm-poky-linux-gnueabi-ld --sysroot=3D/opt/poky/1.5.1/sysroo=
ts/armv7a-vfp-neon-poky-linux-gnueabi"
> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed"
>=20
> From the error message I see:
> "arm-poky-linux-gnueabi-ld.bfd -Wl,-O1 ..."
>=20
> Note that $(CROSS_COMPILE)-ld.bfd is used, not $(CROSS_COMPILE)-ld
>=20
> so the linker is linking with $(LDFLAGS) which contains switches to
> be passed to the compiler, and bombs
>=20
> Changing LD to:
> export LD=3D"arm-poky-linux-gnueabi-gcc --sysroot=3D/opt/poky/1.5.1/sysro=
ots/armv7a-vfp-neon-poky-linux-gnueabi"
>=20
> Does not help, still you get the same error message with
> $(CROSS_COMPILE)-ld.bfd called with "-Wl,..." arguments.
>=20
> Only when I am setting LDFLAGS=3D"", E.E: not passing arguments to I
> can compile U-Boot.
>=20
> It looks like the toolchain does not handle compiler linker flags
> correctly and passes the arguments without parsing to the linker.
>=20
>=20
> If you use the SDK, Is it wrong to do=3D
>=20
> ${LD} ${LDFLAGS} ??
>=20
> U-Boot does this in several places?
>=20
> Using the poky installation to
>=20
>  bitbake core-image-minimal
>=20
> will complete the build of U-Boot-2013.07, but does not pass these option=
s.
>=20
> arm-poky-linux-gnueabi-ld.bfd  -r -o /home/ulf/felabs/sysdev/poky/build/t=
mp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb=
8-r0/git/spl/common/libcommon.o /home/ulf/felabs/sysdev/poky/build/tmp/work=
/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/gi=
t/spl/common/cmd_nvedit.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagl=
eboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/=
common/console.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-po=
ky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/dl=
malloc.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux=
-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/env_common=
=2Eo /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnu=
eabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/env_nand.o /ho=
me/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/image-fdt.o /home/ulf/=
felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v20=
13.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/image.o /home/ulf/felabs/sysd=
ev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAU=
TOINC+62c175fbb8-r0/git/spl/common/memsize.o /home/ulf/felabs/sysdev/poky/b=
uild/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c=
175fbb8-r0/git/spl/common/stdio.o
>=20
>=20
> --=20
> Best Regards
> Ulf Samuelsson
> eMagii
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

