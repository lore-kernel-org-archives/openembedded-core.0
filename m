Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6761C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 09:02:07 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.8843.1686301317295491225
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 02:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=eCQ48Smg;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1686301318;
  x=1717837318;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version:content-transfer-encoding;
  bh=qlp7OgexZUYUpn/8A+z+2QS9G5qRe3cYKkao2ukL3TQ=;
  b=eCQ48SmgjvHCXmGtu2xWLCx2vXTeiAWgJ66qbAua4LXwL6qa3qG6Jbyr
   JhM0EiORsw85keII8Xdp4TQC/g/pBSmxMFa+W4rcLtRI5Pb8dOaXkMwi4
   oOjA85WQZVawZhaCKOduGpyZO4CrCi3sjqxCmVyeLm9aPZw7W8Mu9EJac
   jvBkWnx2GKpUuZ7yErhRhnAYIO6AVvOytdGK6+q+F+wx3+rndgujm/rP2
   PEUAi0SiSeWCfj1PbmcvPvgCPdRLpBMsItQSLUFcMDZMv7XPQugs80kZI
   ce2Yfc+gRsR1jrTWFb5PLsw5oPUapGpItuPKX7TnSB4ORQIezMdPwWQCC
   Q==;
References: <1685430318-27100-1-git-send-email-qiutt@fujitsu.com>
 <2023053022173136587677@mail.local> <jwqlegtf4l5.fsf@axis.com>
 <OS3PR01MB9515C26FA2F04840238E0933BA51A@OS3PR01MB9515.jpnprd01.prod.outlook.com>
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: "Tingting Qiu (Fujitsu)" <qiutt@fujitsu.com>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V3] kbd: Add ptest support
Date: Fri, 9 Jun 2023 10:56:07 +0200
Organization: Axis Communications AB
In-Reply-To: <OS3PR01MB9515C26FA2F04840238E0933BA51A@OS3PR01MB9515.jpnprd01.prod.outlook.com>
Message-ID: <jwqh6rhf1q5.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182548


Hi,

I did not bother to patch the tests for 64 bit time as the they were not
run by ptest at that time.  They required changes like those in your
patch.

I just wanted to give you a hint as to why the tests did not build on
the autobuilder: 64-bit time was enabled.  You probably don't have that
locally, and for now the code will have to build and run for both 32 and
64 bit targets both with and without 64 bit time enabled.

The v4 patch does not seem to have any fixes for 64 bit time, am I
missing something?

/Ola

On Fri, Jun 09 2023, Tingting Qiu (Fujitsu) wrote:

> Hi, Ola
>
>> -----Original Message-----
>> From: Ola x Nilsson <ola.x.nilsson@axis.com>
>> Sent: Friday, June 9, 2023 3:59 PM
>> To: alexandre.belloni@bootlin.com
>> Cc: Qiu, Tingting/=E4=BB=87 =E5=A9=B7=E5=A9=B7 <qiutt@fujitsu.com>; Alex=
andre Belloni via
>> lists.openembedded.org
>> <alexandre.belloni=3Dbootlin.com@lists.openembedded.org>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH V3] kbd: Add ptest support
>>=20
>>=20
>> I sent in a patch (which was merged) to disable these tests as they do n=
ot build
>> with
>> -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64.
> I guess your patch is "kbd: Don't build tests".
> Because of building fail, do not support ptest of kbd.
> Why do not do a little change for supporting ptest?
> Could you look at the following patch?
> https://lists.openembedded.org/g/openembedded-core/topic/patch_v4_kbd_add=
_ptest/99258821
>
> Best,
> Qiu Tingting
>>=20
>> /Ola
>>=20
>> On Wed, May 31 2023, Alexandre Belloni via lists.openembedded.org wrote:
>>=20
>> > Hello,
>> >
>> >
>> > This still fails to build:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/607
>> > 1/steps/12/logs/errors
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/607
>> > 9/steps/11/logs/errors
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7219
>> > /steps/11/logs/errors
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/615
>> > 1/steps/11/logs/errors
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/7244
>> > /steps/11/logs/errors
>> >
>> >
>> > | make[1]: Entering directory
>> '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8
>> hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build/tests/libtswrap'
>> > | /bin/bash ../../libtool --tag=3DCC --mode=3Dcompile
>> > arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-abi=3Dhard
>> -mcpu=3Dcortex-a8
>> > -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
>> > -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64
>> > -D_FILE_OFFSET_BITS=3D64
>> >
>> --sysroot=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/wor
>> k
>> > /cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
>> > -DHAVE_CONFIG_H -I. -I../../../kbd-2.5.1/tests/libtswrap -I../..
>> > -I../../../kbd-2.5.1/tests/libtswrap -I.  -g -O0 -O2
>> > -D_FORTIFY_SOURCE=3D2 -O2 -pipe -g -feliminate-unused-debug-types
>> > -fcanon-prefix-map
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot-native=3D -Waggregate-return -Wall -Wcast-align -Wconversion
>> > -Wdisabled-optimization -Wextra -Wmissing-declarations
>> > -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes
>> > -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes
>> > -Wwrite-strings -c -o ioctl.lo
>> > ../../../kbd-2.5.1/tests/libtswrap/ioctl.c
>> > | libtool: compile: arm-poky-linux-gnueabi-gcc -mfpu=3Dneon
>> > -mfloat-abi=3Dhard -mcpu=3Dcortex-a8 -fstack-protector-strong -O2
>> > -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security
>> -Werror=3Dformat-security
>> > -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64
>> >
>> --sysroot=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/wor
>> k
>> > /cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
>> > -DHAVE_CONFIG_H -I. -I../../../kbd-2.5.1/tests/libtswrap
>> > -I../.. -I../../../kbd-2.5.1/tests/libtswrap -I. -g -O0 -O2
>> > -D_FORTIFY_SOURCE=3D2 -O2 -pipe -g -feliminate-unused-debug-types
>> > -fcanon-prefix-map
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot-native=3D -Waggregate-return -Wall -Wcast-align -Wconversion
>> > -Wdisabled-optimization -Wextra -Wmissing-declarations
>> > -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes
>> > -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes
>> > -Wwrite-strings -c ../../../kbd-2.5.1/tests/libtswrap/ioctl.c -fPIC
>> > -DPIC -o .libs/ioctl.o
>> > | ../../../kbd-2.5.1/tests/libtswrap/ioctl.c: In function 'print_kbsen=
try':
>> > | ../../../kbd-2.5.1/tests/libtswrap/ioctl.c:257:55: warning: format '=
%ld'
>> expects argument of type 'long int', but argument 3 has type 'size_t' {a=
ka
>> 'unsigned int'} [-Wformat=3D]
>> > |   257 |         dprintf(outfd, "\t\tunsigned char kb_string[%ld] =3D=
 {\n",
>> sz);
>> > |       |                                                     ~~^
>> ~~
>> > |       |                                                       |
>> |
>> > |       |                                                       long i=
nt
>> size_t {aka unsigned int}
>> > |       |                                                     %d
>> > | /bin/bash ../../libtool --tag=3DCC --mode=3Dlink
>> > arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-abi=3Dhard
>> -mcpu=3Dcortex-a8
>> > -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
>> > -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64
>> > -D_FILE_OFFSET_BITS=3D64
>> >
>> --sysroot=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/wor
>> k
>> > /cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
>> > -g -O0 -O2 -D_FORTIFY_SOURCE=3D2 -O2 -pipe -g
>> > -feliminate-unused-debug-types -fcanon-prefix-map
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot-native=3D -Waggregate-return -Wall -Wcast-align -Wconversion
>> > -Wdisabled-optimization -Wextra -Wmissing-declarations
>> > -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes
>> > -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes
>> > -Wwrite-strings -export-symbols-regex ^ioctl -version-info 1:0:0
>> > -rpath /nowhere -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
>> > -fcanon-prefix-map
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot-native=3D -Wl,-z,relro,-z,now -o libtswrap.la ioctl.lo -ldl
>> > | libtool: link: arm-poky-linux-gnueabi-gcc-nm .libs/ioctl.o | sed -n
>> > -e 's/^.*[ ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[ ][
>> > ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | sed '/ __gnu_lto/d' | sed
>> > 's/.* //' | sort | uniq > .libs/libtswrap.exp
>> > | libtool: link:
>> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/hosttools/grep
>> -E -e "^ioctl" ".libs/libtswrap.exp" > ".libs/libtswrap.expT"
>> > | libtool: link: mv -f ".libs/libtswrap.expT" ".libs/libtswrap.exp"
>> > | libtool: link: echo "{ global:" > .libs/libtswrap.ver
>> > | libtool: link:  cat .libs/libtswrap.exp | sed -e "s/\(.*\)/\1;/" >>
>> > | .libs/libtswrap.ver
>> > | libtool: link:  echo "local: *; };" >> .libs/libtswrap.ver
>> > | libtool: link: arm-poky-linux-gnueabi-gcc -mfpu=3Dneon
>> > -mfloat-abi=3Dhard -mcpu=3Dcortex-a8 -fstack-protector-strong -O2
>> > -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security
>> -Werror=3Dformat-security
>> > -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64
>> >
>> --sysroot=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/wor
>> k
>> > /cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
>> > -shared -fPIC -DPIC .libs/ioctl.o -ldl -mfpu=3Dneon -mfloat-abi=3Dhard
>> > -mcpu=3Dcortex-a8 -fstack-protector-strong -O2
>> >
>> --sysroot=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/wor
>> k
>> > /cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
>> > -g -O0 -O2 -O2 -g -fcanon-prefix-map
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot-native=3D
>> > -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/u
>> > sr/src/debug/kbd/2.5.1-r0
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/s
>> > rc/debug/kbd/2.5.1-r0
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot=3D
>> >
>> -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil
>> d
>> >
>> /tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysro
>> > ot-native=3D -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-soname
>> > -Wl,libtswrap.so.1 -Wl,-version-script -Wl,.libs/libtswrap.ver -o
>> > .libs/libtswrap.so.1.0.0
>> > |
>> >
>> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8
>> hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native/usr/bin/ar
>> m-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-li
>> nux-gnueabi/13.1.1/ld:.libs/libtswrap.ver:2:
>> > syntax error in VERSION script
>> > | collect2: error: ld returned 1 exit status
>> > | make[1]: Leaving directory
>> '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8
>> hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build/tests/libtswrap'
>> > | make[1]: *** [Makefile:390: libtswrap.la] Error 1
>> > | make: *** [Makefile:421: all-recursive] Error 1
>> > | make: Leaving directory
>> '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8
>> hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build/tests'
>> > | ERROR: oe_runmake failed
>> >
>> > On 30/05/2023 15:05:18+0800, qiutt@fujitsu.com wrote:
>> >> From: Qiu Tingting <qiutt@fujitsu.com>
>> >>
>> >> Add a ptest for kbd
>> >> - It is taking around 1s to execute with kvm, so added it to
>> >> PTESTS_FAST
>> >> - It contains libkeymap unit tests(27 cases) and libkbdfile unit
>> >> tests(13 cases)
>> >>
>> >> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
>> >> ---
>> >>  .../distro/include/ptest-packagelists.inc     |  1 +
>> >>  meta/recipes-core/kbd/files/run-ptest         | 11 +++
>> >>  meta/recipes-core/kbd/kbd_2.5.1.bb            | 71
>> ++++++++++++++++++-
>> >>  3 files changed, 82 insertions(+), 1 deletion(-)  create mode 100644
>> >> meta/recipes-core/kbd/files/run-ptest
>> >>
>> >> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
>> >> b/meta/conf/distro/include/ptest-packagelists.inc
>> >> index faa9bd6983..366c048cc8 100644
>> >> --- a/meta/conf/distro/include/ptest-packagelists.inc
>> >> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>> >> @@ -26,6 +26,7 @@ PTESTS_FAST =3D "\
>> >>      gzip \
>> >>      json-c \
>> >>      json-glib \
>> >> +    kbd \
>> >>      libconvert-asn1-perl \
>> >>      liberror-perl \
>> >>      libgpg-error\
>> >> diff --git a/meta/recipes-core/kbd/files/run-ptest
>> >> b/meta/recipes-core/kbd/files/run-ptest
>> >> new file mode 100644
>> >> index 0000000000..3b154c4d73
>> >> --- /dev/null
>> >> +++ b/meta/recipes-core/kbd/files/run-ptest
>> >> @@ -0,0 +1,11 @@
>> >> +#!/bin/sh
>> >> +
>> >> +# Define test work dir
>> >> +WORKDIR=3D@PTEST_PATH@/tests/
>> >> +
>> >> +# Run test
>> >> +cd ${WORKDIR}
>> >> +
>> >> +./testsuite -k unittest | sed -e '/[0-9]:/s/://' \
>> >> +    -e '/ ok/s/^/PASS: /;/ FAILED/s/^/FAIL: /;/ skipped/s/^/SKIP: /'=
 \
>> >> +    -e '/ ok/s/ ok.*//;/ skipped/s/ skipped.*//;/ FAILED/s/ FAILED.*=
//'
>> >> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >> b/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >> index 7662b8f685..ba7236f67c 100644
>> >> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >> @@ -5,7 +5,7 @@ DESCRIPTION =3D "The kbd project contains tools for
>> >> managing Linux console (Linux  LICENSE =3D "GPL-2.0-or-later"
>> >>  LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>> >>
>> >> -inherit autotools gettext pkgconfig
>> >> +inherit autotools gettext pkgconfig ptest
>> >>
>> >>  DEPENDS +=3D "flex-native"
>> >>
>> >> @@ -14,6 +14,7 @@ RPROVIDES:${PN} =3D "console-tools"
>> >>  RCONFLICTS:${PN} =3D "console-tools"
>> >>
>> >>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz
>> \
>> >> +           file://run-ptest \
>> >>             "
>> >>
>> >>  SRC_URI[sha256sum] =3D
>> "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
>> >> @@ -45,3 +46,71 @@ ALTERNATIVE:${PN} =3D "chvt deallocvt fgconsole
>> >> openvt showkey \  ALTERNATIVE_PRIORITY =3D "100"
>> >>
>> >>  BBCLASSEXTEND =3D "native"
>> >> +
>> >> +do_compile_ptest() {
>> >> +    # update DATADIR in Makefile
>> >> +    sed -i
>> 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \\,g'
>> ${B}/tests/libkeymap/Makefile
>> >> +    sed -i
>> 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \\,g'
>> ${B}/tests/helpers/Makefile
>> >> +    sed -i
>> 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\"
>> >> +\\,g' ${B}/tests/libkbdfile/Makefile
>> >> +
>> >> +    # recompile tests
>> >> +    oe_runmake -C ${B}/tests/ clean
>> >> +    oe_runmake -C ${B}/tests/
>> >> +}
>> >> +
>> >> +do_install_ptest() {
>> >> +    # install files from build directory
>> >> +    install -d ${D}${PTEST_PATH}/tests/
>> >> +    install --mode=3D755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
>> >> +    install --mode=3D755 ${B}/tests/testsuite
>> ${D}${PTEST_PATH}/tests/
>> >> +    install -d ${D}${PTEST_PATH}/tests/libkeymap/
>> >> +    find ${B}/tests/libkeymap/ -type f -not -name "*.o" -not -name
>> "Makefile" \
>> >> +        -exec install --mode=3D755 {}
>> ${D}${PTEST_PATH}/tests/libkeymap/ \;
>> >> +    install -d ${D}${PTEST_PATH}/tests/helpers/
>> >> +    find ${B}/tests/helpers/ -type f -not -name "*.o" -not -name
>> "Makefile" \
>> >> +        -exec install --mode=3D755 {}
>> ${D}${PTEST_PATH}/tests/helpers/ \;
>> >> +    install -d ${D}${PTEST_PATH}/tests/libkbdfile/
>> >> +    find ${B}/tests/libkbdfile/ -type f -not -name "*.o" -not -name
>> "Makefile" \
>> >> +        -exec install --mode=3D755 {}
>> ${D}${PTEST_PATH}/tests/libkbdfile/ \;
>> >> +    install -d ${D}${PTEST_PATH}/src/
>> >> +    install --mode=3D755 ${B}/src/loadkeys ${D}${PTEST_PATH}/src/
>> >> +
>> >> +    # install files from src/data directory
>> >> +    install -d ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
>> >> +    install ${S}/data/keymaps/i386/qwerty/defkeymap.map
>> >> + ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
>> >> +
>> >> +    # install files from src/tests/data directory
>> >> +    install -d ${D}${PTEST_PATH}/tests/data/
>> >> +    install -d ${D}${PTEST_PATH}/tests/data/libkeymap/
>> >> +    install ${S}/tests/data/libkeymap/*
>> ${D}${PTEST_PATH}/tests/data/libkeymap/
>> >> +    install -d ${D}${PTEST_PATH}/tests/data/alt-is-meta/
>> >> +    install ${S}/tests/data/alt-is-meta/*
>> ${D}${PTEST_PATH}/tests/data/alt-is-meta/
>> >> +    install -d ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
>> >> +    install ${S}/tests/data/bkeymap-2.0.4/*
>> ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
>> >> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
>> >> +    install ${S}/tests/data/dumpkeys-mktable/*
>> ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
>> >> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
>> >> +    install ${S}/tests/data/dumpkeys-fulltable/*
>> ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
>> >> +    install -d
>> ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts/
>> >> +    install ${S}/tests/data/findfile/test_1/consolefonts/*
>> ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts/
>> >> +    install -d
>> ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/include/
>> >> +    install ${S}/tests/data/findfile/test_0/keymaps/test0.map
>> ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/
>> >> +    install ${S}/tests/data/findfile/test_0/keymaps/include/*
>> ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/include/
>> >> +    install -d
>> ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
>> >> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/include/*
>> ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
>> >> +    install -d
>> ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
>> >> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwerty/*
>> ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
>> >> +    install -d
>> ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
>> >> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwertz/*
>> ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
>> >> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
>> >> +    install ${S}/tests/data/keymaps/i386/qwerty/*
>> ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
>> >> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
>> >> +    install ${S}/tests/data/keymaps/i386/include/*
>> ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
>> >> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/include/
>> >> +    install ${S}/tests/data/keymaps/include/*
>> >> + ${D}${PTEST_PATH}/tests/data/keymaps/include/
>> >> +
>> >> +
>> >> +    # update PTEST_PATH in run-ptest and atconfig
>> >> +    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g"
>> ${D}${PTEST_PATH}/run-ptest
>> >> +    sed -i -e 's,${B},${PTEST_PATH},g' -e 's,/\.\./kbd-2.5.1,,g'
>> >> +${D}${PTEST_PATH}/tests/atconfig }
>> >> --
>> >> 2.25.1

