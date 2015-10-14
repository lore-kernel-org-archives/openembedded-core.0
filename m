Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0A396770BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 21:38:51 +0000 (UTC)
Received: by wijp11 with SMTP id p11so2700244wij.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 14:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ZMdjlTtK9+D/ndW2zmtTtvwR3PY4cPrcaobftEp4bwU=;
	b=u7rnO3Pj6ZTrPGiipq/O88/K/S/7xpNVZOb7o73uT29bhYRSkXcJ40QwD+ozY4vXfQ
	KslUYqasNA8hWQ/WF/JjpC4u0Mjb++W/X/O5+Vd9JnMs1o5OqG/NKqYqA+FGrcbxhg7i
	EZa/Jq6XqW7+Ous5jM1qJn4DBp2mqsQMu8FlfIT00d6Bmjsmzt1RsmEIUl7fq7SfiwuD
	oR1tnMDst2ChodZGJY5hoBReZ8ABksYGuwGWp7QHec1w2z8gIWNGrWfO5A3yRDn/4LOU
	E47k0Y9HhvdswzwVfN0qTCoUTyTbAusceZMc7tlfbbJQxQmQVYXcyhc8EmXLiFx0CzZH
	5ldw==
MIME-Version: 1.0
X-Received: by 10.180.86.165 with SMTP id q5mr29803489wiz.52.1444858731076;
	Wed, 14 Oct 2015 14:38:51 -0700 (PDT)
Received: by 10.194.169.6 with HTTP; Wed, 14 Oct 2015 14:38:51 -0700 (PDT)
Date: Wed, 14 Oct 2015 14:38:51 -0700
Message-ID: <CAJ86T=U7+d4niZ=hLgQywS6utiL5YJqw1r0E-+_friceOMm4ZQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: syslinux + gcc 5.2 build error
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
X-List-Received-Date: Wed, 14 Oct 2015 21:38:52 -0000
Content-Type: text/plain; charset=UTF-8

I'm seeing what looks like a gcc bug when building syslinux with
certain combinations of TUNE_CCARGS. A specific combination which
fails is:

  TUNE_CCARGS = " -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
-fschedule-insns"

( ie the default flags set by tune-core2.inc with one additional flag:
-fschedule-insns )

Problem is only seen with gcc 5.2

Compiler error is:

i686-rdk-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
-fschedule-insns
--sysroot=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32
-O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong
-D_FORTIFY_SOURCE=2 -MT zlib/deflate.o -MD -Os -march=i386
-falign-functions=0 -falign-jumps=0 -falign-labels=0 -ffast-math
-fomit-frame-pointer -std=gnu99 -m32 -mpreferred-stack-boundary=2
-fno-stack-protector -fwrapv -freg-struct-return -fPIC -fno-exceptions
-fno-asynchronous-unwind-tables -fno-strict-aliasing
-falign-functions=0 -falign-jumps=0 -falign-labels=0 -falign-loops=0
-g -D__COM32__ -D__FIRMWARE_BIOS__ -nostdinc -iwithprefix include -I.
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/sys
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/../include
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/include/sys
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/core/include
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/sys/module
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/bios/com32/lib//../..
-W -Wall -Wstrict-prototypes -Wpointer-arith -Wwrite-strings
-Wstrict-prototypes -Winline -DDYNAMIC_CRC_TABLE -DPNG_NO_CONSOLE_IO
-DPNG_NO_WRITE_SUPPORTED -DPNG_NO_MNG_FEATURES -DPNG_NO_READ_tIME
-DPNG_NO_WRITE_tIME -mregparm=3 -DREGPARM=3 -c -o zlib/deflate.o
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c

/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:
In function 'deflate':
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:892:1:
error: unable to find a register to spill
 }
 ^
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:892:1:
error: this is the insn:
(insn 745 1859 1860 94 (set (reg:QI 995)
        (mem/j:QI (plus:SI (reg/v/f:SI 965 [orig:676 strm ] [676])
                (const_int 48 [0x30])) [0 strm_54(D)->adler+0 S1
A32])) /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:775
86 {*movqi_internal}
     (nil))
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:892:
confused by earlier errors, bailing out

