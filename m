Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QaZgP-0007b3-2B
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Jun 2011 22:42:25 +0200
Received: by wwg12 with SMTP id 12so3119742wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2011 13:38:46 -0700 (PDT)
Received: by 10.227.174.75 with SMTP id s11mr4213308wbz.34.1309034326751;
	Sat, 25 Jun 2011 13:38:46 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	ge4sm2930616wbb.47.2011.06.25.13.38.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Jun 2011 13:38:46 -0700 (PDT)
Message-Id: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sat, 25 Jun 2011 22:38:34 +0200
X-Mailer: Apple Mail (2.936)
Subject: gcc-cross-kernel problems
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
X-List-Received-Date: Sat, 25 Jun 2011 20:42:25 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi,

I was spending some spare cycles on https://github.com/koenkooi/meta-archos 
  and wanted to build the 2.6.22 vendor kernel first before trying to  
the 3.0rc working and I need to use csl 2007q3 as gcc-cross-kernel due  
to bugs in the kernel.

I imported the 2008q1 recipes from OE-core, then changed the SRC_URI  
to have the patches from the 2007q3 recipe in OE classic. It uses  
the .inc files from OE-core. It builds and gives me:

koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/ 
armv7a-angstrom-linux-gnueabi/gcc-cross-kernel-4.2.1-4.2.1+csl- 
arm-2007q3-53-r0/image$ find . | grep bin
./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/ 
usr/bin
./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/ 
usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel-4.2.1
./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/ 
usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel-4.2.1/arm- 
angstrom-linux-gnueabi-gcov
./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/ 
usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel-4.2.1/arm- 
angstrom-linux-gnueabi-gccbug
./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/ 
usr/bin/arm-angstrom-linux-gnueabi-gcc-4.2.1+csl-arm-2007q3-53

But when I do 'MACHINE=archos5 bitbake virtual/kernel -c compile' I get:

| + make -j4 zImage 'CC=ccache arm-angstrom-linux-gnueabi- 
gcc-4.2.1+csl-arm-2007q3-53  -mno-thumb-interwork -mno-thumb -- 
sysroot=/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/ 
archos5' 'LD=arm-angstrom-linux-gnueabi-ld --sysroot=/OE/tentacle/ 
build/tmp-angstrom_2010_x-eglibc/sysroots/archos5  --sysroot=/OE/ 
tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/archos5'
| arm-angstrom-linux-gnueabi-gcc-4.2.1+csl-arm-2007q3-53: No such file  
or directory

And I can't find arm-angstrom-linux-gnueabi-gcc-4.2.1+csl- 
arm-2007q3-53 in sysroots.  When looking at WORKDIR for the gcc:

koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/ 
armv7a-angstrom-linux-gnueabi/gcc-cross-kernel-4.2.1-4.2.1+csl- 
arm-2007q3-53-r0$ find sysroot-destdir/ | grep bin
sysroot-destdir/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/ 
x86_64-linux/usr/bin
sysroot-destdir/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/ 
x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross- 
kernel-4.2.1
sysroot-destdir/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/ 
x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross- 
kernel-4.2.1/arm-angstrom-linux-gnueabi-gcov
sysroot-destdir/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/ 
x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross- 
kernel-4.2.1/arm-angstrom-linux-gnueabi-gccbug

So that's missing the arm-angstrom-linux-gnueabi-gcc-4.2.1+csl- 
arm-2007q3-53 that's actually needed. Does anyone (RP?) know if gcc- 
cross-kernel.inc has been kept upto date with all the toolchain changes?

regards,

Koen


