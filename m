Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UVdKl-0000F4-SL
	for Openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 09:44:44 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 767EF4B0182
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 09:26:57 +0200 (CEST)
Date: Fri, 26 Apr 2013 09:26:55 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Message-ID: <20130426092655.1d0ffdb2@e6520eb>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: dylan: meta-toolchain and u-boot : "cannot find -lgcc"
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
X-List-Received-Date: Fri, 26 Apr 2013 07:44:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

here is a problem I met while trying to build u-boot with a toolchain
generated using dylan.

steps to reproduce :
- bitbake meta-toolchain for an armv5t target

- install the sdk to a custom path ($HOME/oecore-x86_64/ for example
  instead of /usr/local/oecore-x86_64/

- get u-boot :
git clone git://git.denx.de/u-boot.git
source ~/oecore-x86_64/environment-setup-armv5te-oe-linux-gnueabi
make LDFLAGS="" ARCH=arm CROSS_COMPILE=arm-oe-linux-gnueabi-
  da850evm_config
make LDFLAGS="" ARCH=arm CROSS_COMPILE=arm-oe-linux-gnueabi-

you will get :
arm-oe-linux-gnueabi-gcc -E -g  -Os   -fno-common -ffixed-r8 -msoft-float  -D__KERNEL__ -ffunction-sections -fdata-sections -DCONFIG_SYS_TEXT_BASE=0xc1080000 -DCONFIG_SPL_TEXT_BASE=0x80000000 -DCONFIG_SPL_PAD_TO=0 -DCONFIG_SPL_BUILD -I/data/testdylan/tmp/u-boot/include -fno-builtin -ffreestanding -nostdinc -isystem /data/testdylan/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/armv5te-oe-linux-gnueabi/../../lib/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.7.2/include -pipe  -DCONFIG_ARM -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -march=armv5te -include /data/testdylan/tmp/u-boot/include/u-boot/u-boot.lds.h -include /data/testdylan/tmp/u-boot/include/config.h -DCPUDIR=arch/arm/cpu/arm926ejs  -I/data/testdylan/tmp/u-boot/spl/. -ansi -D__ASSEMBLY__ -P - < /data/testdylan/tmp/u-boot/board/davinci/da8xxevm/u-boot-spl-da850evm.lds > /data/testdylan/tmp/u-boot/spl/u-boot-spl.lds
cd /data/testdylan/tmp/u-boot/spl/ && arm-oe-linux-gnueabi-ld.bfd  -T /data/testdylan/tmp/u-boot/spl/u-boot-spl.lds --gc-sections -Bstatic -Ttext 0x80000000 arch/arm/cpu/arm926ejs/start.o --start-group arch/arm/cpu/arm926ejs/davinci/libdavinci.o arch/arm/cpu/arm926ejs/libarm926ejs.o arch/arm/lib/libarm.o board/davinci/da8xxevm/libda8xxevm.o common/libcommon.o common/spl/libspl.o drivers/mtd/spi/libspi_flash.o drivers/serial/libserial.o drivers/spi/libspi.o lib/libgeneric.o --end-group /data/testdylan/tmp/u-boot/spl/arch/arm/lib/eabi_compat.o -L . -lgcc -Map u-boot-spl.map -o u-boot-spl
arm-oe-linux-gnueabi-ld.bfd: cannot find -lgcc

this can be fixed by installing the sdk to it's standard path
(/usr/local/oecore-x86_64/ in the present case).

Is that an expected behaviour (as the sdk is primarly designed to build
applications) or can that be fixed during the sdk relocation ?

Thanks,
Eric


