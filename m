Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-b21.telenor.se (smtprelay-b21.telenor.se
	[195.54.99.212])
	by mail.openembedded.org (Postfix) with ESMTP id C47CE6A8F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 20:02:41 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 9EC82C0F1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 22:02:41 +0200 (CEST)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjwbAFQDQ1NT4zlmPGdsb2JhbAANTINBiBq1JIh8AwEBAQE4gxMBBUA9FhgDAgECATEnCAEBh3qoToZPnGGTMASYW5Vx
X-IPAS-Result: AjwbAFQDQ1NT4zlmPGdsb2JhbAANTINBiBq1JIh8AwEBAQE4gxMBBUA9FhgDAgECATEnCAEBh3qoToZPnGGTMASYW5Vx
X-IronPort-AV: E=Sophos;i="4.97,812,1389740400"; d="scan'208";a="857096425"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.102])
	by ipb1.telenor.se with ESMTP; 07 Apr 2014 22:02:41 +0200
Message-ID: <53430460.4080608@emagii.com>
Date: Mon, 07 Apr 2014 22:02:40 +0200
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: meta-toolchain-sdk LDFLAGS fails for ARMv7 (beagleboard)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ulf@emagii.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Apr 2014 20:02:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Trying to build an SDK for the Beaglebone

$ git clone git://git.yoctoproject.org/poky
$ cd poky
$ git checkout -b dora origin/dora

$ . oe-init-build-env

MACHINE is set to "beagleboard" in local.conf

$ ./environment-angstrom-v2013.06

$ bitbake meta-toolchain-sdk

SDK is generated, and installed in /opt/poky/1.5.1 (default)

The toolchain environment file is "sourced"

Then I try to build U-Boot-13.10 (with a minor patch)


$ make am335x_boneblack_config

$ make

After compiling a number of file, the linking of a library fails:

arm-poky-linux-gnueabi-ld.bfd -Wl,-O1 -Wl,--hash-style=gnu 
-Wl,--as-needed   -r -o libcommon.o  cmd_bdinfo.o cmd_boot.o cmd_bootm.o 
cmd_console.o cmd_dfu.o cmd_disk.o cmd_echo.o cmd_eeprom.o cmd_exit.o 
cmd_ext2.o cmd_ext4.o cmd_fat.o cmd_fdt.o cmd_fs.o cmd_gpio.o cmd_help.o 
cmd_i2c.o cmd_itest.o cmd_load.o cmd_mem.o cmd_misc.o cmd_mmc.o 
cmd_net.o cmd_nvedit.o cmd_pcmcia.o cmd_sf.o cmd_source.o cmd_spi.o 
cmd_spl.o cmd_test.o cmd_usb.o cmd_version.o cmd_ximg.o command.o 
console.o dlmalloc.o env_attr.o env_callback.o env_common.o env_flags.o 
env_mmc.o exports.o fdt_support.o flash.o hash.o hush.o image-fdt.o 
image.o main.o memsize.o miiphyutil.o s_record.o splash.o stdio.o usb.o 
usb_hub.o usb_storage.o xyzModem.o
arm-poky-linux-gnueabi-ld.bfd: unrecognized option '-Wl,-O1'
arm-poky-linux-gnueabi-ld.bfd: use the --help option for usage information
make[1]: *** [libcommon.o] Fel 1
make[1]: Lämnar katalogen 
"/home/ulf/felabs/sysdev/bootloader/u-boot-2013.10/common"
make: *** [common/libcommon.o] Fel 2

-------------------
The environment looks like:
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
export 
PATH=/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin:/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi:$PATH
export 
PKG_CONFIG_SYSROOT_DIR=/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi
export 
PKG_CONFIG_PATH=/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/lib/pkgconfig
export 
CONFIG_SITE=/opt/poky/1.5.1/site-config-armv7a-vfp-neon-poky-linux-gnueabi
export CC="arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork 
-mfloat-abi=softfp -mfpu=neon 
--sysroot=/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
export CXX="arm-poky-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork 
-mfloat-abi=softfp -mfpu=neon 
--sysroot=/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
export CPP="arm-poky-linux-gnueabi-gcc -E  -march=armv7-a 
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon 
--sysroot=/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
export AS="arm-poky-linux-gnueabi-as "
export LD="arm-poky-linux-gnueabi-ld 
--sysroot=/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
export GDB=arm-poky-linux-gnueabi-gdb
export STRIP=arm-poky-linux-gnueabi-strip
export RANLIB=arm-poky-linux-gnueabi-ranlib
export OBJCOPY=arm-poky-linux-gnueabi-objcopy
export OBJDUMP=arm-poky-linux-gnueabi-objdump
export AR=arm-poky-linux-gnueabi-ar
export NM=arm-poky-linux-gnueabi-nm
export M4=m4
export TARGET_PREFIX=arm-poky-linux-gnueabi-
export CONFIGURE_FLAGS="--target=arm-poky-linux-gnueabi 
--host=arm-poky-linux-gnueabi --build=x86_64-linux 
--with-libtool-sysroot=/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
export CFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types"
export CXXFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types -fpermissive"
export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
export CPPFLAGS=""
export OECORE_NATIVE_SYSROOT="/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux"
export 
OECORE_TARGET_SYSROOT="/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
export OECORE_ACLOCAL_OPTS="-I 
/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/share/aclocal"
export OECORE_DISTRO_VERSION="1.5.1"
export OECORE_SDK_VERSION="1.5.1"
export PYTHONHOME=/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr
export ARCH=arm
export CROSS_COMPILE=arm-poky-linux-gnueabi-
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Notable is:
export LD="arm-poky-linux-gnueabi-ld 
--sysroot=/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"

 From the error message I see:
"arm-poky-linux-gnueabi-ld.bfd -Wl,-O1 ..."

Note that $(CROSS_COMPILE)-ld.bfd is used, not $(CROSS_COMPILE)-ld

so the linker is linking with $(LDFLAGS) which contains switches to be 
passed to the compiler, and bombs

Changing LD to:
export LD="arm-poky-linux-gnueabi-gcc 
--sysroot=/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"

Does not help, still you get the same error message with
$(CROSS_COMPILE)-ld.bfd called with "-Wl,..." arguments.

Only when I am setting LDFLAGS="", E.E: not passing arguments to I can 
compile U-Boot.

It looks like the toolchain does not handle compiler linker flags 
correctly and passes the arguments without parsing to the linker.


If you use the SDK, Is it wrong to do=

${LD} ${LDFLAGS} ??

U-Boot does this in several places?

Using the poky installation to

  bitbake core-image-minimal

will complete the build of U-Boot-2013.07, but does not pass these options.

arm-poky-linux-gnueabi-ld.bfd  -r -o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/libcommon.o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/cmd_nvedit.o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/console.o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/dlmalloc.o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/env_common.o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/env_nand.o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/image-fdt.o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/image.o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/memsize.o 
/home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/stdio.o


-- 
Best Regards
Ulf Samuelsson
eMagii


