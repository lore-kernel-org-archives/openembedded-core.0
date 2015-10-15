Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9016F76E70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 07:03:37 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so26579644wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 00:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=bWgNGDyj7LXF38BHxv2k6FmIZjqYKfvFWLnqOtV47aQ=;
	b=CtlKoQ5dUm4XtaJ8rlzlHQ8GwrWL6c1WJD766D3FNyPHX6BGkczto9iz7OkDhXJfR0
	Z5+TWYS9A8ZwyNYWSCRCI3g1ZARzujzy1z1ApIkErchtaQ/BBIvoVy7IhI+rThX1XxUL
	c6i+/lAUrvvHTZc4k5s8kvIyzrT6t2dBw4f9uRunniLwyVsNKgCJZTbYuOaIDX5DGjeU
	05xBdWEnQGW6yGeza13yHQ2tuNptmwtmwLtL/NbNGIKF1sQp/hjhtDYznfxqFxMk+QAY
	Hz/HhOiMZRdI60kzjuirgvpkdCHtBBmYCOpheqtpB2YiFsLNkFksL0Lfq+kPPMJ0IqF5
	qD5w==
MIME-Version: 1.0
X-Received: by 10.180.187.205 with SMTP id fu13mr9533654wic.81.1444892617385; 
	Thu, 15 Oct 2015 00:03:37 -0700 (PDT)
Received: by 10.194.169.6 with HTTP; Thu, 15 Oct 2015 00:03:37 -0700 (PDT)
In-Reply-To: <4CDE18CB-CAC5-4BE6-9361-89750B612EB1@gmail.com>
References: <CAJ86T=U7+d4niZ=hLgQywS6utiL5YJqw1r0E-+_friceOMm4ZQ@mail.gmail.com>
	<4CDE18CB-CAC5-4BE6-9361-89750B612EB1@gmail.com>
Date: Thu, 15 Oct 2015 00:03:37 -0700
Message-ID: <CAJ86T=X3S1mL573-9g2uv0s892KCNaB3yU4xXUvoprSHfzMTqA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: syslinux + gcc 5.2 build error
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
X-List-Received-Date: Thu, 15 Oct 2015 07:03:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 11:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Oct 14, 2015, at 2:38 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> I'm seeing what looks like a gcc bug when building syslinux with
>> certain combinations of TUNE_CCARGS. A specific combination which
>> fails is:
>>
>>  TUNE_CCARGS =3D " -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3D=
sse
>> -fschedule-insns=E2=80=9D
>
>
> and why would you use -fschedule-insns on something like ia32 with so few=
 general purpose regs
> at disposal ?
> applying any insn schedule opts before machine registers are assigned may=
 not always work.

Mainly just following advice from Intel on tuning for Atom:

  https://software.intel.com/en-us/blogs/2013/05/28/why-should-i-update-gcc=
-x86-compiler-or-gcc-compiler-performance-on-intel-atom-from

I didn't do my own benchmarks so maybe that flag doesn't help much,
but it didn't cause a build failure with gcc 4.9.x.

>>
>> ( ie the default flags set by tune-core2.inc with one additional flag:
>> -fschedule-insns )
>>
>> Problem is only seen with gcc 5.2
>>
>> Compiler error is:
>>
>> i686-rdk-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3D=
sse
>> -fschedule-insns
>> --sysroot=3D/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32
>> -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong
>> -D_FORTIFY_SOURCE=3D2 -MT zlib/deflate.o -MD -Os -march=3Di386
>> -falign-functions=3D0 -falign-jumps=3D0 -falign-labels=3D0 -ffast-math
>> -fomit-frame-pointer -std=3Dgnu99 -m32 -mpreferred-stack-boundary=3D2
>> -fno-stack-protector -fwrapv -freg-struct-return -fPIC -fno-exceptions
>> -fno-asynchronous-unwind-tables -fno-strict-aliasing
>> -falign-functions=3D0 -falign-jumps=3D0 -falign-labels=3D0 -falign-loops=
=3D0
>> -g -D__COM32__ -D__FIRMWARE_BIOS__ -nostdinc -iwithprefix include -I.
>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sy=
slinux/6.03-r0/syslinux-6.03/com32/lib/sys
>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sy=
slinux/6.03-r0/syslinux-6.03/com32/lib/../include
>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sy=
slinux/6.03-r0/syslinux-6.03/com32/include/sys
>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sy=
slinux/6.03-r0/syslinux-6.03/core/include
>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sy=
slinux/6.03-r0/syslinux-6.03/com32/lib/
>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sy=
slinux/6.03-r0/syslinux-6.03/com32/lib/sys/module
>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sy=
slinux/6.03-r0/syslinux-6.03/bios/com32/lib//../..
>> -W -Wall -Wstrict-prototypes -Wpointer-arith -Wwrite-strings
>> -Wstrict-prototypes -Winline -DDYNAMIC_CRC_TABLE -DPNG_NO_CONSOLE_IO
>> -DPNG_NO_WRITE_SUPPORTED -DPNG_NO_MNG_FEATURES -DPNG_NO_READ_tIME
>> -DPNG_NO_WRITE_tIME -mregparm=3D3 -DREGPARM=3D3 -c -o zlib/deflate.o
>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c
>>
>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:
>> In function 'deflate':
>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:892:1:
>> error: unable to find a register to spill
>> }
>> ^
>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:892:1:
>> error: this is the insn:
>> (insn 745 1859 1860 94 (set (reg:QI 995)
>>        (mem/j:QI (plus:SI (reg/v/f:SI 965 [orig:676 strm ] [676])
>>                (const_int 48 [0x30])) [0 strm_54(D)->adler+0 S1
>> A32])) /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-lin=
ux/syslinux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:775
>> 86 {*movqi_internal}
>>     (nil))
>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:892:
>> confused by earlier errors, bailing out
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

