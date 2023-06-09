Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC96C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 08:00:17 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.8060.1686297609871716421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 01:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PZaLHMaf;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1686297610;
  x=1717833610;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=ylrJssZApGB6nqrYQCWq3srpEQoK5fbEuI0F1jhKRIo=;
  b=PZaLHMafYk35bau38thPSfbxegZUggIxJKYY6M7rFvcae2kNX5FhTGyz
   n5XH/qIrTIdIlrYe8eI+JDbmuO97rHRm10uCQzvXk6mihtNnKFGZBaE4Q
   V4FyB4Hjzv8guaIwrw8XYr1W0X6LULih4KdDEnkBVUmn8RdfUpjG390NR
   ltap0dpVBT7VngffdKBJRUckituOqDiqVZkVAkVryDTUj5z48oa0C/ZmO
   QpLX+YkW83+e2G4ycKJjjfMO2LXrW9SzIHQaL8sJ0afPk/bM7i7PAT/zL
   rmlU/Pjy5EhMuRkeSlEVNH/TunLAlCl7hLW021ITySLtOWvoZ/UpxSHjF
   Q==;
References: <1685430318-27100-1-git-send-email-qiutt@fujitsu.com>
 <2023053022173136587677@mail.local>
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: <alexandre.belloni@bootlin.com>
CC: "qiutt@fujitsu.com" <qiutt@fujitsu.com>, "Alexandre Belloni via
 lists.openembedded.org"
	<alexandre.belloni=bootlin.com@lists.openembedded.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V3] kbd: Add ptest support
Date: Fri, 9 Jun 2023 09:58:59 +0200
Organization: Axis Communications AB
In-Reply-To: <2023053022173136587677@mail.local>
Message-ID: <jwqlegtf4l5.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 08:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182544


I sent in a patch (which was merged) to disable these tests as they do not build with
-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64.

/Ola

On Wed, May 31 2023, Alexandre Belloni via lists.openembedded.org wrote:

> Hello,
>
>
> This still fails to build:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6071/steps/12/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6079/steps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7219/steps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/6151/steps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/7244/steps/11/logs/errors
>
>
> | make[1]: Entering directory '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build/tests/libtswrap'
> | /bin/bash ../../libtool --tag=CC --mode=compile
> arm-poky-linux-gnueabi-gcc -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a8
> -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security -D_TIME_BITS=64
> -D_FILE_OFFSET_BITS=64
> --sysroot=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
> -DHAVE_CONFIG_H -I. -I../../../kbd-2.5.1/tests/libtswrap -I../..
> -I../../../kbd-2.5.1/tests/libtswrap -I.  -g -O0 -O2
> -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types
> -fcanon-prefix-map
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=
> -Waggregate-return -Wall -Wcast-align -Wconversion
> -Wdisabled-optimization -Wextra -Wmissing-declarations
> -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes
> -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes
> -Wwrite-strings -c -o ioctl.lo
> ../../../kbd-2.5.1/tests/libtswrap/ioctl.c
> | libtool: compile: arm-poky-linux-gnueabi-gcc -mfpu=neon
> -mfloat-abi=hard -mcpu=cortex-a8 -fstack-protector-strong -O2
> -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64
> --sysroot=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
> -DHAVE_CONFIG_H -I. -I../../../kbd-2.5.1/tests/libtswrap
> -I../.. -I../../../kbd-2.5.1/tests/libtswrap -I. -g -O0 -O2
> -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types
> -fcanon-prefix-map
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=
> -Waggregate-return -Wall -Wcast-align -Wconversion
> -Wdisabled-optimization -Wextra -Wmissing-declarations
> -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes
> -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes
> -Wwrite-strings -c ../../../kbd-2.5.1/tests/libtswrap/ioctl.c -fPIC
> -DPIC -o .libs/ioctl.o
> | ../../../kbd-2.5.1/tests/libtswrap/ioctl.c: In function 'print_kbsentry':
> | ../../../kbd-2.5.1/tests/libtswrap/ioctl.c:257:55: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
> |   257 |         dprintf(outfd, "\t\tunsigned char kb_string[%ld] = {\n", sz);
> |       |                                                     ~~^          ~~
> |       |                                                       |          |
> |       |                                                       long int   size_t {aka unsigned int}
> |       |                                                     %d
> | /bin/bash ../../libtool --tag=CC --mode=link
> arm-poky-linux-gnueabi-gcc -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a8
> -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security -D_TIME_BITS=64
> -D_FILE_OFFSET_BITS=64
> --sysroot=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
> -g -O0 -O2 -D_FORTIFY_SOURCE=2 -O2 -pipe -g
> -feliminate-unused-debug-types -fcanon-prefix-map
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=
> -Waggregate-return -Wall -Wcast-align -Wconversion
> -Wdisabled-optimization -Wextra -Wmissing-declarations
> -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes
> -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes
> -Wwrite-strings -export-symbols-regex ^ioctl -version-info 1:0:0
> -rpath /nowhere -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -fcanon-prefix-map
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=
> -Wl,-z,relro,-z,now -o libtswrap.la ioctl.lo -ldl
> | libtool: link: arm-poky-linux-gnueabi-gcc-nm .libs/ioctl.o | sed -n
> -e 's/^.*[ ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[ ][
> ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | sed '/ __gnu_lto/d' | sed
> 's/.* //' | sort | uniq > .libs/libtswrap.exp
> | libtool: link: /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/hosttools/grep -E -e "^ioctl" ".libs/libtswrap.exp" > ".libs/libtswrap.expT"
> | libtool: link: mv -f ".libs/libtswrap.expT" ".libs/libtswrap.exp"
> | libtool: link: echo "{ global:" > .libs/libtswrap.ver
> | libtool: link:  cat .libs/libtswrap.exp | sed -e "s/\(.*\)/\1;/" >> .libs/libtswrap.ver
> | libtool: link:  echo "local: *; };" >> .libs/libtswrap.ver
> | libtool: link: arm-poky-linux-gnueabi-gcc -mfpu=neon
> -mfloat-abi=hard -mcpu=cortex-a8 -fstack-protector-strong -O2
> -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64
> --sysroot=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
> -shared -fPIC -DPIC .libs/ioctl.o -ldl -mfpu=neon -mfloat-abi=hard
> -mcpu=cortex-a8 -fstack-protector-strong -O2
> --sysroot=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot
> -g -O0 -O2 -O2 -g -fcanon-prefix-map
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=/usr/src/debug/kbd/2.5.1-r0
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fmacro-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
> -fdebug-prefix-map=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=
> -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-soname -Wl,libtswrap.so.1
> -Wl,-version-script -Wl,.libs/libtswrap.ver -o
> .libs/libtswrap.so.1.0.0
> |
> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/13.1.1/ld:.libs/libtswrap.ver:2:
> syntax error in VERSION script
> | collect2: error: ld returned 1 exit status
> | make[1]: Leaving directory '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build/tests/libtswrap'
> | make[1]: *** [Makefile:390: libtswrap.la] Error 1
> | make: *** [Makefile:421: all-recursive] Error 1
> | make: Leaving directory '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build/tests'
> | ERROR: oe_runmake failed
>
> On 30/05/2023 15:05:18+0800, qiutt@fujitsu.com wrote:
>> From: Qiu Tingting <qiutt@fujitsu.com>
>> 
>> Add a ptest for kbd
>> - It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
>> - It contains libkeymap unit tests(27 cases) and libkbdfile unit tests(13 cases)
>> 
>> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
>> ---
>>  .../distro/include/ptest-packagelists.inc     |  1 +
>>  meta/recipes-core/kbd/files/run-ptest         | 11 +++
>>  meta/recipes-core/kbd/kbd_2.5.1.bb            | 71 ++++++++++++++++++-
>>  3 files changed, 82 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-core/kbd/files/run-ptest
>> 
>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
>> index faa9bd6983..366c048cc8 100644
>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>> @@ -26,6 +26,7 @@ PTESTS_FAST = "\
>>      gzip \
>>      json-c \
>>      json-glib \
>> +    kbd \
>>      libconvert-asn1-perl \
>>      liberror-perl \
>>      libgpg-error\
>> diff --git a/meta/recipes-core/kbd/files/run-ptest b/meta/recipes-core/kbd/files/run-ptest
>> new file mode 100644
>> index 0000000000..3b154c4d73
>> --- /dev/null
>> +++ b/meta/recipes-core/kbd/files/run-ptest
>> @@ -0,0 +1,11 @@
>> +#!/bin/sh
>> +
>> +# Define test work dir
>> +WORKDIR=@PTEST_PATH@/tests/
>> +
>> +# Run test
>> +cd ${WORKDIR}
>> +
>> +./testsuite -k unittest | sed -e '/[0-9]:/s/://' \
>> +    -e '/ ok/s/^/PASS: /;/ FAILED/s/^/FAIL: /;/ skipped/s/^/SKIP: /' \
>> +    -e '/ ok/s/ ok.*//;/ skipped/s/ skipped.*//;/ FAILED/s/ FAILED.*//'
>> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
>> index 7662b8f685..ba7236f67c 100644
>> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
>> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
>> @@ -5,7 +5,7 @@ DESCRIPTION = "The kbd project contains tools for managing Linux console (Linux
>>  LICENSE = "GPL-2.0-or-later"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>  
>> -inherit autotools gettext pkgconfig
>> +inherit autotools gettext pkgconfig ptest
>>  
>>  DEPENDS += "flex-native"
>>  
>> @@ -14,6 +14,7 @@ RPROVIDES:${PN} = "console-tools"
>>  RCONFLICTS:${PN} = "console-tools"
>>  
>>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
>> +           file://run-ptest \
>>             "
>>  
>>  SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
>> @@ -45,3 +46,71 @@ ALTERNATIVE:${PN} = "chvt deallocvt fgconsole openvt showkey \
>>  ALTERNATIVE_PRIORITY = "100"
>>  
>>  BBCLASSEXTEND = "native"
>> +
>> +do_compile_ptest() {
>> +    # update DATADIR in Makefile
>> +    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkeymap/Makefile
>> +    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/helpers/Makefile
>> +    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkbdfile/Makefile
>> +
>> +    # recompile tests
>> +    oe_runmake -C ${B}/tests/ clean
>> +    oe_runmake -C ${B}/tests/
>> +}
>> +
>> +do_install_ptest() {
>> +    # install files from build directory
>> +    install -d ${D}${PTEST_PATH}/tests/
>> +    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
>> +    install --mode=755 ${B}/tests/testsuite ${D}${PTEST_PATH}/tests/
>> +    install -d ${D}${PTEST_PATH}/tests/libkeymap/
>> +    find ${B}/tests/libkeymap/ -type f -not -name "*.o" -not -name "Makefile" \
>> +        -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/libkeymap/ \;
>> +    install -d ${D}${PTEST_PATH}/tests/helpers/
>> +    find ${B}/tests/helpers/ -type f -not -name "*.o" -not -name "Makefile" \
>> +        -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/helpers/ \;
>> +    install -d ${D}${PTEST_PATH}/tests/libkbdfile/
>> +    find ${B}/tests/libkbdfile/ -type f -not -name "*.o" -not -name "Makefile" \
>> +        -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/libkbdfile/ \;
>> +    install -d ${D}${PTEST_PATH}/src/
>> +    install --mode=755 ${B}/src/loadkeys ${D}${PTEST_PATH}/src/
>> +
>> +    # install files from src/data directory
>> +    install -d ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
>> +    install ${S}/data/keymaps/i386/qwerty/defkeymap.map ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
>> +
>> +    # install files from src/tests/data directory
>> +    install -d ${D}${PTEST_PATH}/tests/data/
>> +    install -d ${D}${PTEST_PATH}/tests/data/libkeymap/
>> +    install ${S}/tests/data/libkeymap/* ${D}${PTEST_PATH}/tests/data/libkeymap/
>> +    install -d ${D}${PTEST_PATH}/tests/data/alt-is-meta/
>> +    install ${S}/tests/data/alt-is-meta/* ${D}${PTEST_PATH}/tests/data/alt-is-meta/
>> +    install -d ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
>> +    install ${S}/tests/data/bkeymap-2.0.4/* ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
>> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
>> +    install ${S}/tests/data/dumpkeys-mktable/* ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
>> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
>> +    install ${S}/tests/data/dumpkeys-fulltable/* ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
>> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts/
>> +    install ${S}/tests/data/findfile/test_1/consolefonts/* ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts/
>> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/include/
>> +    install ${S}/tests/data/findfile/test_0/keymaps/test0.map ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/
>> +    install ${S}/tests/data/findfile/test_0/keymaps/include/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/include/
>> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
>> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/include/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
>> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
>> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwerty/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
>> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
>> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwertz/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
>> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
>> +    install ${S}/tests/data/keymaps/i386/qwerty/* ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
>> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
>> +    install ${S}/tests/data/keymaps/i386/include/* ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
>> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/include/
>> +    install ${S}/tests/data/keymaps/include/* ${D}${PTEST_PATH}/tests/data/keymaps/include/
>> +
>> +
>> +    # update PTEST_PATH in run-ptest and atconfig
>> +    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
>> +    sed -i -e 's,${B},${PTEST_PATH},g' -e 's,/\.\./kbd-2.5.1,,g' ${D}${PTEST_PATH}/tests/atconfig
>> +}
>> -- 
>> 2.25.1
>> 
>
>> 
>> 
>> 


-- 
Ola x Nilsson

