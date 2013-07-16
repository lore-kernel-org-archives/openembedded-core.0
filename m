Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id DF3A66A464
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 08:21:18 +0000 (UTC)
Message-ID: <51E5027D.6050003@communistcode.co.uk>
Date: Tue, 16 Jul 2013 09:21:17 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Toolchain Issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jul 2013 08:21:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Morning everyone,

I'm trying to create a custom toolchain and sdk for a development board 
and I'm having some issues.

I create my toolchain with the following method:

bitbake image -c populate_sdk

When I try to compile u-boot with the sdk, I recieve the following error:

     Configuring for socfpga_cyclone5 board...
     make[1]: *** [/mnt/SSD/socfpga/u-boot-socfpga.git/spl/u-boot-spl] 
Error 1
     make: *** [spl/u-boot-spl.bin] Error 2
     make: *** [u-boot] Error 1
     arm-oecore-linux-gnueabi-size: './u-boot': No such file
     arm-oecore-linux-gnueabi-ld.bfd: cannot find -lgcc
     make[1]: *** [/mnt/SSD/socfpga/u-boot-socfpga.git/spl/u-boot-spl] 
Error 1
     make: *** [spl/u-boot-spl.bin] Error 2
     make: *** Waiting for unfinished jobs....
     arm-oecore-linux-gnueabi-ld.bfd: cannot find -lgcc
     make: *** [u-boot] Error 1

So I took a look at the gcc -v and it gives me:

[09:14:40 jack u-boot-socfpga.git]$ arm-oecore-linux-gnueabi-gcc -v | 
grep custom
Using built-in specs.
COLLECT_GCC=arm-oecore-linux-gnueabi-gcc
COLLECT_LTO_WRAPPER=/mnt/SSD/socfpga/custom-sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/bin/cortexa9hf-vfp-neon-oecore-linux-gnueabi/../../libexec/cortexa9hf-vfp-neon-oecore-linux-gnueabi/gcc/arm-oecore-linux-gnueabi/4.8.1/lto-wrapper
Target: arm-oecore-linux-gnueabi
Configured with: 
/mnt/SSD/oe-r0005/altera-r0005/tmp/work-shared/gcc-4.8.1-r0/gcc-4.8.1/configure 
--build=x86_64-linux --host=x86_64-oecore-linux 
--target=arm-oecore-linux-gnueabi 
--prefix=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr 
--exec_prefix=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr 
--bindir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/bin/cortexa9hf-vfp-neon-oecore-linux-gnueabi 
--sbindir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/bin/cortexa9hf-vfp-neon-oecore-linux-gnueabi 
--libexecdir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/libexec/cortexa9hf-vfp-neon-oecore-linux-gnueabi 
--datadir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/share 
--sysconfdir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/etc 
--sharedstatedir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/com 
--localstatedir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/var 
--libdir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/lib/cortexa9hf-vfp-neon-oecore-linux-gnueabi 
--includedir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/include 
--oldincludedir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/include 
--infodir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/share/info 
--mandir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/x86_64-oecore-linux/usr/share/man 
--disable-silent-rules --disable-dependency-tracking 
--with-libtool-sysroot=/mnt/SSD/oe-r0005/altera-r0005/tmp/sysroots/x86_64-nativesdk-oecore-linux 
--with-gnu-ld --enable-shared --enable-languages=c,c++ 
--enable-threads=posix --enable-multilib --enable-c99 --enable-long-long 
--enable-symvers=gnu --enable-libstdcxx-pch 
--program-prefix=arm-oecore-linux-gnueabi- --without-local-prefix 
--enable-target-optspace --enable-lto --enable-libssp 
--disable-bootstrap --disable-libmudflap --with-system-zlib 
--with-linker-hash-style=gnu --enable-linker-build-id --with-ppl=no 
--with-cloog=no --enable-checking=release --enable-cheaders=c_global 
--with-float=hard 
--with-gxx-include-dir=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/cortexa9hf-vfp-neon-oecore-linux-gnueabi/usr/include/c++ 
--with-build-time-tools=/mnt/SSD/oe-r0005/altera-r0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/bin 
--with-sysroot=/mnt/SSD/r0005sdk/1.0-20130715/sysroots/cortexa9hf-vfp-neon-oecore-linux-gnueabi 
--with-build-sysroot=/mnt/SSD/oe-r0005/altera-r0005/tmp/sysroots/socfpga_cyclone5 
--disable-libunwind-exceptions --disable-libssp --disable-libgomp 
--disable-libmudflap 
--with-mpfr=/mnt/SSD/oe-r0005/altera-r0005/tmp/sysroots/x86_64-nativesdk-oecore-linux 
--with-mpc=/mnt/SSD/oe-r0005/altera-r0005/tmp/sysroots/x86_64-nativesdk-oecore-linux 
--enable-nls
Thread model: posix
gcc version 4.8.1 (GCC)

Now, my toolchain is located in the directory:

/mnt/SSD/socfpga/custom-sdk/1.0-20130715

So, why does most of the GCC version info mention the default directory of:

/mnt/SSD/r0005sdk/1.0-20130715

Is this a bug, or just a quirk? If it's a quirk then why can't u-boot 
find -lgcc on compile?

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--

