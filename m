Return-Path: <ptsneves@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF9C78B70
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 10:08:54 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l2-v6so5980829wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 03:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=RpZSBJUcobwtHJugCcHEi/YuyArVQOxIAW8nN+GvOG8=;
	b=f8R392psoEu441JCiX04XfAruSpSbkC/qO6a0KcivVYULAa4S2VYWZYau+uDR5oNU1
	GmRrmhvd1mz4UIxW52mptjs83zD3QA0GweHdm1liuRGaJ3RRPC+EnR5yyUuR1YxVc0WE
	RCg0Ce8L8BAOMmUBkPp2Occb4PVJZvpDxq/gaBzd30s99GcIn4ebWE7DJQtgt1F3N0b4
	t0uTPEZEn4FpazIfyh0P6y+zV4BOGAijQNYW/sloq6ickQI9oQLPPe1oNrlKwYhdw75/
	q2K8VQ6uAItev05CA68lxDA8LYgW6/uiQovnrKJYfV47qcaD4PKbd8FhKOla6WbvyH3j
	pp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=RpZSBJUcobwtHJugCcHEi/YuyArVQOxIAW8nN+GvOG8=;
	b=CLRFFvgA8Hob74S8kgQEkDDtr/G6tL4+KLHYJdwrkLjp9EcvKuH/N1eZ6BGiicVNYg
	u+0jU5RnRplmPn9xsJVYQiephswmmvoN/skLrzuGd8AGIk/v0ChK+bH5/bW2K2KmB7S0
	yMT93LwVh9Yl/lYe2ucLLZuO3YuomyWpdHexMyud4g+GJoR/ASsgOX4lMGYkbC6BeOtj
	YBoOuWx/bgp012WuZbF59ajao+wdU2cg199Km8abj1fDmhd3OAPKR5yaB+sHmUruv52T
	UdhCuAPJLboqhM8d2DHsvhlxFp0xeSkyeuZV6pQe38dsLB3YWH2mWpuD2wYV/oNbd9Zd
	ZelA==
X-Gm-Message-State: AOUpUlH5IkOEb/PrUujI8rZQ3BquorhRjwhW+1n4tqmVLjeVYJK6TOAo
	ExXqESuLagAdvhBaxEmF8L516v2px22qr4AsEQ==
X-Google-Smtp-Source: AAOMgpeG8+fp/VX6DNVmyFSDyN4KLee6FYaC75IrJb3UalT94WGqV3Dj7zBfc7Oqmna+NUrg8/UH4vlp/0wu2YbUShw=
X-Received: by 2002:a1c:6b90:: with SMTP id
	a16-v6mr3265155wmi.74.1532167735261; 
	Sat, 21 Jul 2018 03:08:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:e719:0:0:0:0:0 with HTTP; Sat, 21 Jul 2018 03:08:54
	-0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
Date: Sat, 21 Jul 2018 12:08:54 +0200
Message-ID: <CAJO0J4j9an=54P1-Nq4PB9kOU+VP5xasSsVXZpbzAdKcqxR_zQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: u-boot crash on network code hardkernel v2017.05
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
X-List-Received-Date: Sat, 21 Jul 2018 10:08:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

I use a modified version of meta-odroid so that I can build u-boot
from hardkernel v2017.05
(https://github.com/hardkernel/u-boot.git@88af53fbcef8386cb4d5f04c19f4b2bcb69e90ca)

Recently i noticed my u-boot crashes in any network operation (even
ping) if it is compiled by the yocto toolchain. To abstract away any
recipe differences and narrow down my changes to the toolchain, I
cloned the hardkernel repository and made

With Ubuntu 16.04.4 LTS and gcc-arm-linux-gnueabihf package [1]

make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm odroid-xu4_defconfig
make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm
cd ./sdfuse
./sdfuse.sh /dev/mmcblk0

The Odroid successfully boots

On the other hand the exact same commands on the same workspace but
with the PATH set to the yocto recipe-sysroot (sumo) I am able to boot
but upon using a network resource it always hangs as below [2]. This
is exactly the same crash behavior as the one produced by the normal
yocto build.With u-boot built with the yocto toolchain, if i try to
boot from the sd card everything works fine. The only way that the
yocto toolchain seems to impact is in network related operations in
u-boot. I have tried to correct some of the minor warnings that pop up
in both versions. I also tried to build with -O0 but the problem
persists.

[1]
~/Projects/u-boot$ arm-linux-gnueabihf-gcc -v
Using built-in specs.
COLLECT_GCC=arm-linux-gnueabihf-gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc-cross/arm-linux-gnueabihf/5/lto-wrapper
Target: arm-linux-gnueabihf
Configured with: ../src/configure -v --with-pkgversion='Ubuntu/Linaro
5.4.0-6ubuntu1~16.04.9'
--with-bugurl=file:///usr/share/doc/gcc-5/README.Bugs
--enable-languages=c,ada,c++,java,go,d,fortran,objc,obj-c++
--prefix=/usr --program-suffix=-5 --enable-shared
--enable-linker-build-id --libexecdir=/usr/lib
--without-included-gettext --enable-threads=posix --libdir=/usr/lib
--enable-nls --with-sysroot=/ --enable-clocale=gnu
--enable-libstdcxx-debug --enable-libstdcxx-time=yes
--with-default-libstdcxx-abi=new --enable-gnu-unique-object
--disable-libitm --disable-libquadmath --enable-plugin
--with-system-zlib --disable-browser-plugin --enable-java-awt=gtk
--enable-gtk-cairo
--with-java-home=/usr/lib/jvm/java-1.5.0-gcj-5-armhf-cross/jre
--enable-java-home
--with-jvm-root-dir=/usr/lib/jvm/java-1.5.0-gcj-5-armhf-cross
--with-jvm-jar-dir=/usr/lib/jvm-exports/java-1.5.0-gcj-5-armhf-cross
--with-arch-directory=arm
--with-ecj-jar=/usr/share/java/eclipse-ecj.jar --disable-libgcj
--enable-objc-gc --enable-multiarch --enable-multilib
--disable-sjlj-exceptions --with-arch=armv7-a --with-fpu=vfpv3-d16
--with-float=hard --with-mode=thumb --disable-werror --enable-multilib
--enable-checking=release --build=x86_64-linux-gnu
--host=x86_64-linux-gnu --target=arm-linux-gnueabihf
--program-prefix=arm-linux-gnueabihf-
--includedir=/usr/arm-linux-gnueabihf/include
Thread model: posix
gcc version 5.4.0 20160609 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9

[2] TFTP from server 192.168.3.123; our IP address is 192.168.3.71
Filename 'zImage'.
Load address: 0x40008000
Loading: *


Let me know if you have any suggestions.
Paulo Neves

