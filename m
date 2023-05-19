Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B52C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 15:50:59 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.29954.1684511454752967572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 08:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jTp2Kdkz;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5529fcf9d43so986897eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 08:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684511454; x=1687103454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkQYzcZXAPw/sl+2pt74NF8CGedHNZTHa+3MvKiPwaE=;
        b=jTp2KdkzmZUJP+6iuXl6nyXYkuUcmUCQBFzvS7hEKRj/Z1jw01Z/d8pEgd50HQMUv8
         1NjoNnNd6UUNkLYlbGPYTJ3FzF7wXx4ym+f8nfPnNKu//jlscFcYDy5Z/QLfD61luNQw
         O5jTwDW7IOJYottGc/NdfTy68B6leZHhmpsedxuBHNWbkwXsAFEj2+YmD4mqxehkrkYH
         qyxzZa/VEI/fbjJfkkrlokx+Omq33JhuT2/ESVJdmBLbTcUFEmOeWiQb2zp1l1GhCvtr
         3Ib3QrlgkHZ0tnOvP4M+EV9CvthSlFxcIzeVWiATVSnQ9YlA2RgK4nCQh58Z7fIeIQhD
         KUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684511454; x=1687103454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkQYzcZXAPw/sl+2pt74NF8CGedHNZTHa+3MvKiPwaE=;
        b=hilTX5xo1WAdGJn4Bv2iLJY4xpuHagOFEjoaDcnKoQePCNNYqJN/vvd/LTPUxkjkm/
         e4ABrMJyK0ryspZU78LUyjNetQ5FJSbiHRr/ItVMwT8IZCrQA7hGMLYfpCXcSXCOxj8w
         rPt2l6J8T6GVmAV9hN2YSR7aUtroMz6I2VseUaoEDeyngUWkoh/IAiWbyaQc0USsDN5l
         uQKkvdMWLvUTLjqLv8zyG98gp3lRtwis5s1XctO8ztgxYZecAv38jPakfe5rr3Gk/sxg
         Y+FP9c996qMI4oOXDER37lXtDzmexdpux5fpREQUFoS7FhYS6ZAjpVFnLYNEul9ehl/U
         dMFg==
X-Gm-Message-State: AC+VfDzR1ezy9mbk0/YhwECensRfuJk/+4HrsRlIvOZYrFvOePr729u2
	d/QGHJ0RgaJNu2ND3GTke4IhsiHysTn0fQNwd2oc0ZdYbD8=
X-Google-Smtp-Source: ACHHUZ63JfXkdQ3AG3Eug4IA0G5/08Q/GrUQvZp4rIXY92DTAAbLpibYcMBAeL/8putCa7i3Gk+py1tMbcu9708Aiyw=
X-Received: by 2002:a4a:2211:0:b0:54c:ab15:a609 with SMTP id
 f17-20020a4a2211000000b0054cab15a609mr876608ooa.9.1684511453753; Fri, 19 May
 2023 08:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <1684284787-11933-1-git-send-email-qiutt@fujitsu.com> <202305191427507b253457@mail.local>
In-Reply-To: <202305191427507b253457@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 May 2023 08:50:27 -0700
Message-ID: <CAMKF1spsN31-Cz9kJZ5FFEnj8naj5FGO7hvrY=tzCfZxgZhdYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] kbd: Add ptest support
To: alexandre.belloni@bootlin.com
Cc: "qiutt@fujitsu.com" <qiutt@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 15:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181559

On Fri, May 19, 2023 at 7:27=E2=80=AFAM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This doesn't build:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6024/s=
teps/12/logs/stdio
>
> | make[1]: Entering directory '/home/pokybuild/yocto-worker/genericx86-al=
t/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/build/tests/libtswr=
ap'
> | /bin/bash ../../libtool  --tag=3DCC   --mode=3Dcompile i686-poky-linux-=
gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-prote=
ctor-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=
=3Dformat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroot=3D/=
home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-po=
ky-linux/kbd/2.5.1-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../kbd-2.5=
.1/tests/libtswrap -I../..   -I../../../kbd-2.5.1/tests/libtswrap -I.   -g =
-O0 -O2 -D_FORTIFY_SOURCE=3D2  -O2 -pipe -g -feliminate-unused-debug-types =
-fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/buil=
d/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/=
2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/=
build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/=
debug/kbd/2.5.1-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/gener=
icx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/build=3D/us=
r/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker=
/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/build=
=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-=
worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0=
/recipe-sysroot=3D  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/gener=
icx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysr=
oot=3D  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/bu=
ild/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot-native=
=3D  -Waggregate-return -Wall -Wcast-align -Wconversion -Wdisabled-optimiza=
tion -Wextra -Wmissing-declarations -Wmissing-format-attribute -Wmissing-no=
return -Wmissing-prototypes -Wpointer-arith -Wredundant-decls -Wshadow -Wst=
rict-prototypes -Wwrite-strings -c -o ioctl.lo ../../../kbd-2.5.1/tests/lib=
tswrap/ioctl.c
> | libtool: compile:  i686-poky-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcor=
e2 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2=
 -Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_=
FILE_OFFSET_BITS=3D64 --sysroot=3D/home/pokybuild/yocto-worker/genericx86-a=
lt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot -DH=
AVE_CONFIG_H -I. -I../../../kbd-2.5.1/tests/libtswrap -I../.. -I../../../kb=
d-2.5.1/tests/libtswrap -I. -g -O0 -O2 -D_FORTIFY_SOURCE=3D2 -O2 -pipe -g -=
feliminate-unused-debug-types -fmacro-prefix-map=3D/home/pokybuild/yocto-wo=
rker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/k=
bd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild=
/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2=
.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fmacro-prefix-map=3D/home/=
pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-li=
nux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/=
home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-po=
ky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-ma=
p=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-=
32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D -fmacro-prefix-map=3D/home/pok=
ybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux=
/kbd/2.5.1-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-=
worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0=
/recipe-sysroot-native=3D -Waggregate-return -Wall -Wcast-align -Wconversio=
n -Wdisabled-optimization -Wextra -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith -Wredundan=
t-decls -Wshadow -Wstrict-prototypes -Wwrite-strings -c ../../../kbd-2.5.1/=
tests/libtswrap/ioctl.c  -fPIC -DPIC -o .libs/ioctl.o
> | ../../../kbd-2.5.1/tests/libtswrap/ioctl.c: In function 'print_kbsentry=
':
> | ../../../kbd-2.5.1/tests/libtswrap/ioctl.c:257:55: warning: format '%ld=
' expects argument of type 'long int', but argument 3 has type 'size_t' {ak=
a 'unsigned int'} [-Wformat=3D]
> |   257 |         dprintf(outfd, "\t\tunsigned char kb_string[%ld] =3D {\=
n", sz);
> |       |                                                     ~~^        =
  ~~
> |       |                                                       |        =
  |
> |       |                                                       long int =
  size_t {aka unsigned int}
> |       |                                                     %d
> | /bin/bash ../../libtool  --tag=3DCC   --mode=3Dlink i686-poky-linux-gcc=
  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protecto=
r-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dfo=
rmat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroot=3D/home/=
pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-li=
nux/kbd/2.5.1-r0/recipe-sysroot  -g -O0 -O2 -D_FORTIFY_SOURCE=3D2  -O2 -pip=
e -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/home/pokybuild/yo=
cto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.=
1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/po=
kybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linu=
x/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fmacro-prefix-map=
=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-3=
2-poky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-pref=
ix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/c=
ore2-32-poky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebu=
g-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/=
work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D  -fmacro-prefix-map=
=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-3=
2-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pok=
ybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux=
/kbd/2.5.1-r0/recipe-sysroot-native=3D  -Waggregate-return -Wall -Wcast-ali=
gn -Wconversion -Wdisabled-optimization -Wextra -Wmissing-declarations -Wmi=
ssing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-ar=
ith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wwrite-strings -export-=
symbols-regex ^ioctl -version-info 1:0:0 -rpath /nowhere -Wl,-O1 -Wl,--hash=
-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/home/pokybuild/yocto-wor=
ker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kb=
d-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild=
/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2=
.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fmacro-prefix-map=3D/home=
/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-l=
inux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-3=
2-poky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-pref=
ix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/c=
ore2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky=
-linux/kbd/2.5.1-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybuild=
/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2=
.5.1-r0/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now -o libtswrap.la  ioct=
l.lo -ldl
> | libtool: link: i686-poky-linux-gcc-nm  .libs/ioctl.o   | sed -n -e 's/^=
.*[     ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[         ][      ]*\([_A-Za-z][_A-Za=
-z0-9]*\)$/\1 \2 \2/p' | sed '/ __gnu_lto/d' | sed 's/.* //' | sort | uniq =
> .libs/libtswrap.exp
> | libtool: link: /home/pokybuild/yocto-worker/genericx86-alt/build/build/=
tmp/hosttools/grep -E -e "^ioctl" ".libs/libtswrap.exp" > ".libs/libtswrap.=
expT"
> | libtool: link: mv -f ".libs/libtswrap.expT" ".libs/libtswrap.exp"
> | libtool: link: echo "{ global:" > .libs/libtswrap.ver
> | libtool: link:  cat .libs/libtswrap.exp | sed -e "s/\(.*\)/\1;/" >> .li=
bs/libtswrap.ver
> | libtool: link:  echo "local: *; };" >> .libs/libtswrap.ver
> | libtool: link:  i686-poky-linux-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 =
-Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_F=
ILE_OFFSET_BITS=3D64 --sysroot=3D/home/pokybuild/yocto-worker/genericx86-al=
t/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot -sha=
red  -fPIC -DPIC  .libs/ioctl.o   -ldl  -m32 -march=3Dcore2 -mtune=3Dcore2 =
-msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 --sysroot=3D/home/pokybu=
ild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kb=
d/2.5.1-r0/recipe-sysroot -g -O0 -O2 -O2 -g -fmacro-prefix-map=3D/home/poky=
build/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/=
kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/=
home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-po=
ky-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fmacro-prefi=
x-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/co=
re2-32-poky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-=
prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/wo=
rk/core2-32-poky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fd=
ebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/t=
mp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D -fmacro-prefix-m=
ap=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2=
-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/po=
kybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linu=
x/kbd/2.5.1-r0/recipe-sysroot-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-al=
t/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/sr=
c/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/gene=
ricx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd-2.5.1=
=3D/usr/src/debug/kbd/2.5.1-r0 -fmacro-prefix-map=3D/home/pokybuild/yocto-w=
orker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/=
build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild/yo=
cto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.=
1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybui=
ld/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd=
/2.5.1-r0/recipe-sysroot=3D -fmacro-prefix-map=3D/home/pokybuild/yocto-work=
er/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/rec=
ipe-sysroot=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86=
-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot-n=
ative=3D -Wl,-z -Wl,relro -Wl,-z -Wl,now   -Wl,-soname -Wl,libtswrap.so.1 -=
Wl,-version-script -Wl,.libs/libtswrap.ver -o .libs/libtswrap.so.1.0.0
> | /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-=
32-poky-linux/kbd/2.5.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/..=
/../libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ld:.libs/libtswrap.v=
er:2: syntax error in VERSION script
> | collect2: error: ld returned 1 exit status
>
> This also warns:
>
> WARNING: kbd-2.5.1-r0 do_package_qa: QA Issue: supports ptests but is not=
 included in oe-core's ptest-packagelists.inc [missing-ptest]
>
>

Seeing the same errors with clang

https://errors.yoctoproject.org/Errors/Details/704724/


> On 17/05/2023 08:53:07+0800, qiutt@fujitsu.com wrote:
> > From: Qiu Tingting <qiutt@fujitsu.com>
> >
> > Add a ptest for kbd
> > - It is taking around 1s to execute with kvm, so added it to PTESTS_FAS=
T
> > - It contains libkeymap unit tests(27 cases) and libkbdfile unit tests(=
13 cases)
> >
> > Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> > ---
> >  meta/recipes-core/kbd/files/run-ptest | 11 +++++
> >  meta/recipes-core/kbd/kbd_2.5.1.bb    | 71 ++++++++++++++++++++++++++-
> >  2 files changed, 81 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-core/kbd/files/run-ptest
> >
> > diff --git a/meta/recipes-core/kbd/files/run-ptest b/meta/recipes-core/=
kbd/files/run-ptest
> > new file mode 100644
> > index 0000000000..3b154c4d73
> > --- /dev/null
> > +++ b/meta/recipes-core/kbd/files/run-ptest
> > @@ -0,0 +1,11 @@
> > +#!/bin/sh
> > +
> > +# Define test work dir
> > +WORKDIR=3D@PTEST_PATH@/tests/
> > +
> > +# Run test
> > +cd ${WORKDIR}
> > +
> > +./testsuite -k unittest | sed -e '/[0-9]:/s/://' \
> > +    -e '/ ok/s/^/PASS: /;/ FAILED/s/^/FAIL: /;/ skipped/s/^/SKIP: /' \
> > +    -e '/ ok/s/ ok.*//;/ skipped/s/ skipped.*//;/ FAILED/s/ FAILED.*//=
'
> > diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd=
/kbd_2.5.1.bb
> > index 7662b8f685..943cd8a6ba 100644
> > --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> > +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> > @@ -5,7 +5,7 @@ DESCRIPTION =3D "The kbd project contains tools for man=
aging Linux console (Linux
> >  LICENSE =3D "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> >
> > -inherit autotools gettext pkgconfig
> > +inherit autotools gettext pkgconfig ptest
> >
> >  DEPENDS +=3D "flex-native"
> >
> > @@ -14,6 +14,7 @@ RPROVIDES:${PN} =3D "console-tools"
> >  RCONFLICTS:${PN} =3D "console-tools"
> >
> >  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
> > +           file://run-ptest \
> >             "
> >
> >  SRC_URI[sha256sum] =3D "ccdf452387a6380973d2927363e9cbb939fa2068915a6f=
937ff9d24522024683"
> > @@ -45,3 +46,71 @@ ALTERNATIVE:${PN} =3D "chvt deallocvt fgconsole open=
vt showkey \
> >  ALTERNATIVE_PRIORITY =3D "100"
> >
> >  BBCLASSEXTEND =3D "native"
> > +
> > +do_compile_ptest() {
> > +    # update DATADIR in Makefile
> > +    sed -i 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \=
\,g' ${B}/tests/libkeymap/Makefile
> > +    sed -i 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \=
\,g' ${B}/tests/helpers/Makefile
> > +    sed -i 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \=
\,g' ${B}/tests/libkbdfile/Makefile
> > +
> > +    # recompile tests
> > +    oe_runmake -C ${B}/tests/ clean
> > +    oe_runmake -C ${B}/tests/
> > +}
> > +
> > +do_install_ptest() {
> > +    # install files from build directory
> > +    install -d ${D}${PTEST_PATH}/tests/
> > +    install --mode=3D755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
> > +    install --mode=3D755 ${B}/tests/testsuite ${D}${PTEST_PATH}/tests/
> > +    install -d ${D}${PTEST_PATH}/tests/libkeymap/
> > +    find ${B}/tests/libkeymap/ -type f -not -name "*.o" -not -name "Ma=
kefile" \
> > +        -exec install --mode=3D755 {} ${D}${PTEST_PATH}/tests/libkeyma=
p/ \;
> > +    install -d ${D}${PTEST_PATH}/tests/helpers/
> > +    find ${B}/tests/helpers/ -type f -not -name "*.o" -not -name "Make=
file" \
> > +        -exec install --mode=3D755 {} ${D}${PTEST_PATH}/tests/helpers/=
 \;
> > +    install -d ${D}${PTEST_PATH}/tests/libkbdfile/
> > +    find ${B}/tests/libkbdfile/ -type f -not -name "*.o" -not -name "M=
akefile" \
> > +        -exec install --mode=3D755 {} ${D}${PTEST_PATH}/tests/libkbdfi=
le/ \;
> > +    install -d ${D}${PTEST_PATH}/src/
> > +    install --mode=3D755 ${B}/src/loadkeys ${D}${PTEST_PATH}/src/
> > +
> > +    # install files from src/data directory
> > +    install -d ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
> > +    install ${S}/data/keymaps/i386/qwerty/defkeymap.map ${D}${PTEST_PA=
TH}/data/keymaps/i386/qwerty/
> > +
> > +    # install files from src/tests/data directory
> > +    install -d ${D}${PTEST_PATH}/tests/data/
> > +    install -d ${D}${PTEST_PATH}/tests/data/libkeymap/
> > +    install ${S}/tests/data/libkeymap/* ${D}${PTEST_PATH}/tests/data/l=
ibkeymap/
> > +    install -d ${D}${PTEST_PATH}/tests/data/alt-is-meta/
> > +    install ${S}/tests/data/alt-is-meta/* ${D}${PTEST_PATH}/tests/data=
/alt-is-meta/
> > +    install -d ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
> > +    install ${S}/tests/data/bkeymap-2.0.4/* ${D}${PTEST_PATH}/tests/da=
ta/bkeymap-2.0.4/
> > +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
> > +    install ${S}/tests/data/dumpkeys-mktable/* ${D}${PTEST_PATH}/tests=
/data/dumpkeys-mktable/
> > +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
> > +    install ${S}/tests/data/dumpkeys-fulltable/* ${D}${PTEST_PATH}/tes=
ts/data/dumpkeys-fulltable/
> > +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefon=
ts/
> > +    install ${S}/tests/data/findfile/test_1/consolefonts/* ${D}${PTEST=
_PATH}/tests/data/findfile/test_1/consolefonts/
> > +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/in=
clude/
> > +    install ${S}/tests/data/findfile/test_0/keymaps/test0.map ${D}${PT=
EST_PATH}/tests/data/findfile/test_0/keymaps/
> > +    install ${S}/tests/data/findfile/test_0/keymaps/include/* ${D}${PT=
EST_PATH}/tests/data/findfile/test_0/keymaps/include/
> > +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i3=
86/include/
> > +    install ${S}/tests/data/findfile/test_0/keymaps/i386/include/* ${D=
}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
> > +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i3=
86/qwerty/
> > +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwerty/* ${D}=
${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
> > +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i3=
86/qwertz/
> > +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwertz/* ${D}=
${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
> > +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
> > +    install ${S}/tests/data/keymaps/i386/qwerty/* ${D}${PTEST_PATH}/te=
sts/data/keymaps/i386/qwerty/
> > +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
> > +    install ${S}/tests/data/keymaps/i386/include/* ${D}${PTEST_PATH}/t=
ests/data/keymaps/i386/include/
> > +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/include/
> > +    install ${S}/tests/data/keymaps/include/* ${D}${PTEST_PATH}/tests/=
data/keymaps/include/
> > +
> > +
> > +    # update PTEST_PATH in run-ptest and atconfig
> > +    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptes=
t
> > +    sed -i -e 's,${B},${PTEST_PATH},g' -e 's,/\.\./kbd-2.5.1,,g' ${D}$=
{PTEST_PATH}/tests/atconfig
> > +}
> > --
> > 2.25.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181552): https://lists.openembedded.org/g/openembedde=
d-core/message/181552
> Mute This Topic: https://lists.openembedded.org/mt/98939715/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

