Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00B4E9905E
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:19:29 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152492.1775812765892676615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 02:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TtwnovNn;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d02a71526so1079463f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775812764; x=1776417564; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kstQ9bSVFc+NZ2Pov8AXDhL00VUn5CK5Ogt0qEg2n0U=;
        b=TtwnovNnc7dpSjfpLxSiqxUEEpGb9RD15ft1anh5yq7DjcjVZUmF5F8Bu+tbnkEVxf
         Wrnh3xzvLkArCNl7Td6OL3gh6tpNcK/NrsNq1SM1ULq21cHUc7dns6unPdRfJOteGjMn
         Tc7Z5g/tN7hQOZwOUGxT+3CUR2tc6P7uwVL84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775812764; x=1776417564;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kstQ9bSVFc+NZ2Pov8AXDhL00VUn5CK5Ogt0qEg2n0U=;
        b=NWO1PDZF51cg3OtZKSnfIZSC37PNF8Cagq6cvhxERurfOh6ayz+IBAgdRkUFunIYcb
         jLSDtkCxs5z4Q8vmbRxyloVxlc3we7LFxM9vaNPGDT8orh4TxHQrSg1aDU9lJYK+7dhp
         HdDwrx1elKtIUzwIVfI8zj4AqC6+P20AGHEG2ozsiEmX+MGImOYEF8q/fMZcTu4oezGC
         BKHFX73ktZ3jTEHJYXosd9G5NwUJP68KPHhT61LUg3qsLNsVaGRGZqcbXgrtHfs6GUcM
         p+OZBtwOQESLuyVxxa56DfMHtGtgpWJRnjRKSl6fllHK5nKjrBpSIx7jDVZqf1kyDUGM
         jjdw==
X-Gm-Message-State: AOJu0Yx7D28a6nHvmJ6M1MAQiF2zPTZNqgZ0omZ9rUJFjFD0byJXc2qE
	0M5MFwqwwiMMyjybGSDxlb1hQ++GH3ejAzoh7EitXQRVzPOouhafaHQuR7BsZAyEU7M=
X-Gm-Gg: AeBDieu60DZ5WegQrHPcIq0dCExYc3HJb7iAJ/Wpk7iL+p6qmgdBqOvepApaJrGiTfe
	lLL8VDlJ7rOEvdMq4akoAgUkTS5W2s49sKUcPGTweEKAAzorxcENJgucOWoxbwfskfzS0BmkUtw
	FoTTuhFv+8Mihgl45IGh0hkogP9Jjz6tG3EuAR46JcIe7eLSu5XTsGfFcgBHe5rxSgOFrthN1h0
	SnU/1pD+UDgYTWU0Svhaccoh5a0QNJ3c+BUUT9niDZ2FUTnJMxlP2n0/jv/K5H7OivP71pfqj+O
	ou29XKk7u5EJbfhHFaj2yo4+Yj7WqNbdnKM+GuZYXuPTqOFLFHt/Bw92HZ1sZtayJzKoO06BqrK
	rOBgTye/2Go23yd2qCjFW/OwJ7NDj4I5abaHzLVOUd8JoDUX7iYuHCx0f4QofRTTSatX7HuXTQ5
	cw9NR1a8y4lufDYK2GN0BUDDAXG5pufz8y+lf/lQiX7SN+61wdvhz7bPNyyk8Sht2ZwnFNQacxQ
	bLYOIe+do5N+DZN
X-Received: by 2002:a05:6000:2c06:b0:439:a95b:3c43 with SMTP id ffacd0b85a97d-43d6426b475mr3588788f8f.21.1775812764126;
        Fri, 10 Apr 2026 02:19:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00bcd4fc1a1ff2417c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bcd4:fc1a:1ff2:417c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c98fsm6422496f8f.35.2026.04.10.02.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:19:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 11:19:22 +0200
Message-Id: <DHPD34ZDZQ6C.XKSZB09U75KC@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH 1/9] dtc: backport fix for build
 with glibc-2.43
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Paul Barker" <paul@pbarker.dev>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Martin Jansa"
 <martin.jansa@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
 <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr>
 <CA+chaQdA95XBr+n+-Zm2dE9sxFiaAjhthSpGvP-g+N60yj=MJQ@mail.gmail.com>
 <DHPB0K1HXR2T.1N8T3183RMIUJ@smile.fr>
In-Reply-To: <DHPB0K1HXR2T.1N8T3183RMIUJ@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 09:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235000

On Fri Apr 10, 2026 at 9:41 AM CEST, Yoann Congal wrote:
> On Thu Apr 9, 2026 at 11:29 PM CEST, Martin Jansa wrote:
>> On Thu, Apr 9, 2026 at 9:17=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>>>
>>> On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openembedded=
.org wrote:
>>> > From: Martin Jansa <martin.jansa@gmail.com>
>>> >
>>> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
>>> > https://errors.yoctoproject.org/Errors/Details/903983/
>>> >
>>> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98overl=
ay_fixup_phandle=E2=80=99:
>>> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment d=
iscards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
>>> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
>>> >       |                     ^
>>> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment d=
iscards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
>>> >   434 |                 sep =3D memchr(name, ':', fixup_len);
>>> >       |                     ^
>>> > cc1: all warnings being treated as errors
>>> >
>>> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.c=
om>
>>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> > ---
>>>
>>> Hello,
>>>
>>> I've started a whinlatter bringup build on the new Ubuntu 26.04 worker
>>> with this series applied:
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/96/builds/23
>>>
>>> It got 2 errors (Other errors are most likely consequences of these one=
s):
>>>
>>> ERROR: shadow-native-4.18.0-r0 do_configure: configure failed:
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/23/=
steps/12/logs/stdio line 6269:
>>> | checking for crypt in -lcrypt... no
>>> | configure: error: crypt() not found
>>> | NOTE: The following config.log files may provide further information.
>>> | NOTE: /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64=
-linux/shadow-native/4.18.0/build/config.log
>>> | ERROR: configure failed
>>> | WARNING: exit code 1 from a shell command.
>>> NOTE: recipe shadow-native-4.18.0-r0: task do_configure: Failed
>>
>> Hello,
>>
>> for shadow please read
>> https://lists.openembedded.org/g/openembedded-core/message/234119 the
>> important part:
>> "libcrypt-dev is no longer installed as a dependency in my minimal docke=
r image"
>> I guess it's now missing on your ubuntu-26.04 host as well.
>> It used to be typically installed by build-essential -> libc6-dev ->
>> libcrypt-dev but not anymore since 2.42-7:
>>
>> 25.10 questing with 2.42-0ubuntu3.1:
>> https://packages.ubuntu.com/questing/libc6-dev
>> 26.04 resolute with 2.43-2ubuntu1:
>> https://packages.ubuntu.com/resolute/libc6-dev
>>
>> https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.43-2u=
buntu1/changelog:
>> ...
>> glibc (2.42-7) unstable; urgency=3Dmedium
>>
>>   [ Aurelien Jarno ]
>>   * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcrypt-d=
ev
>>     dependency from libc6-dev. Thanks to Helmut Grohne for proposing tha=
t,
>>     doing an archive rebuild and filling the bug reports.
>>   * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemTap st=
atic
>>     probes.
>>   * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the remova=
l of
>>     the obsolete termio interface.  Closes: #1124068.
>>   * debian/rules.d/debhelper.mk: ensure that linker scripts work even wh=
en
>>     /usr is unmerged.  Closes: #1120508
>>   * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
>>     source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: drop
>>     unpack-message-for-{orig,source} overrides, fixed in lintian 2.128.0=
.
>>   * debian/control.in/main: drop Rules-Requires-Root: no, this is now th=
e
>>     default.
>>   * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32}: re=
move
>>     the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
>>   * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixed wrt
>>     GLIBC_ABI_GNU_TLS.
>>
>>  -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 +0100
>> ...
>
> Hello,
>
> In that case, shouldn't we remove "virtual/crypt-native" from ASSUME_PROV=
IDED?
> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.con=
f#n232
>
> I've tried it but then libxcrypt-native fails to build with:
> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c: In function =E2=
=80=98_crypt_crypt_gost_yescrypt_rn=E2=80=99:
> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c:134:16: error: in=
itialization discards =E2=80=98const=E2=80=99 qualifier from pointer target=
 type [-Werror=3Ddiscarded-qualifiers]
> |   134 |   char *hptr =3D strchr ((const char *) intbuf->retval + 3, '$'=
);
> |       |                ^~~~~~
> | cc1: all warnings being treated as errors
>
> It looks like the fixes for that are on master but the patches don't
> apply.
>
> Can you send an update series with those fixes?

I discussed that with Paul. He suggested to add libcrypt-dev as a host
dependency instead. I agree (sorry about the sudden change of heart).

Can you send the yocto-docs patch to do this?

>
> Thanks!
>
>>
>>
>> I'll have a look at virglrenderer-native tomorrow. khem already fixed it=
 in:
>> https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/3f0f775edb2d=
f5ea54c37863286ad565ccddb276
>> https://git.openembedded.org/openembedded-core/commit/?id=3D8e85dc6b7f5f=
7668a610b5fd3754c716f0af65b0
>> https://git.openembedded.org/openembedded-core/commit/?id=3D5ff5aac9ed9e=
53a2e06515cc480c7d89a8aa3171
>> will add a backport in whinlatter and possibly scarthgap as well.
>>
>> Regards,
>>
>>> ERROR: virglrenderer-native-1.1.1-r0 do_compile: Execution of '/srv/pok=
ybuild/yocto-worker/bringup/build/build/tmp/work/x86_64-linux/virglrenderer=
-native/1.1.1/temp/run.do_compile.2048675' failed with exit code 1
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/23/=
steps/12/logs/stdio line 29545:
>>> | [4/57] gcc -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrender=
er-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sou=
rces/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src=
/mesa/util -fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -=
Wall -Winvalid-pch -Wextra -Wpedantic -std=3Dgnu11 -Werror=3Denum-int-misma=
tch -Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes -W=
error=3Dpedantic -Wmissing-prototypes -Werror=3Dincompatible-pointer-types =
-Werror=3Dint-to-pointer-cast -Werror=3Dswitch -Wno-overlength-strings -Wno=
-missing-field-initializers -Werror=3Dformat -fvisibility=3Dhidden -fno-str=
ict-aliasing -imacros /srv/pokybuild/yocto-worker/bringup/build/build/tmp/w=
ork/x86_64-linux/virglrenderer-native/1.1.1/build/config.h -DHAVE_CONFIG_H=
=3D1 -isystem/srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_6=
4-linux/virglrenderer-native/1.1.1/recipe-sysroot-native/usr/include -O2 -p=
ipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_math.c.o -MF src/mes=
a/libmesa.a.p/util_u_math.c.o.d -o src/mesa/libmesa.a.p/util_u_math.c.o -c =
../sources/virglrenderer-1.1.1/src/mesa/util/u_math.c
>>> | FAILED: [code=3D1] src/mesa/libmesa.a.p/util_u_math.c.o
>>> | gcc -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.=
1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/vi=
rglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/u=
til -fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wall -W=
invalid-pch -Wextra -Wpedantic -std=3Dgnu11 -Werror=3Denum-int-mismatch -We=
rror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes -Werror=
=3Dpedantic -Wmissing-prototypes -Werror=3Dincompatible-pointer-types -Werr=
or=3Dint-to-pointer-cast -Werror=3Dswitch -Wno-overlength-strings -Wno-miss=
ing-field-initializers -Werror=3Dformat -fvisibility=3Dhidden -fno-strict-a=
liasing -imacros /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x=
86_64-linux/virglrenderer-native/1.1.1/build/config.h -DHAVE_CONFIG_H=3D1 -=
isystem/srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64-linu=
x/virglrenderer-native/1.1.1/recipe-sysroot-native/usr/include -O2 -pipe -f=
PIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_math.c.o -MF src/mesa/libm=
esa.a.p/util_u_math.c.o.d -o src/mesa/libmesa.a.p/util_u_math.c.o -c ../sou=
rces/virglrenderer-1.1.1/src/mesa/util/u_math.c
>>> | In file included from ../sources/virglrenderer-1.1.1/src/mesa/compat/=
c11/threads.h:64,
>>> |                  from ../sources/virglrenderer-1.1.1/src/mesa/util/u_=
thread.h:35,
>>> |                  from ../sources/virglrenderer-1.1.1/src/mesa/util/u_=
cpu_detect.h:40,
>>> |                  from ../sources/virglrenderer-1.1.1/src/mesa/util/u_=
math.c:32:
>>> | ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/threads_posix.h:54=
:9: warning: =E2=80=98ONCE_FLAG_INIT=E2=80=99 redefined
>>> |    54 | #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
>>> |       |         ^~~~~~~~~~~~~~
>>> | In file included from /usr/include/stdlib.h:1191,
>>> |                  from ../sources/virglrenderer-1.1.1/src/mesa/compat/=
c11/threads_posix.h:29:
>>> | /usr/include/x86_64-linux-gnu/bits/types/once_flag.h:25:9: note: this=
 is the location of the previous definition
>>> |    25 | #define ONCE_FLAG_INIT __ONCE_FLAG_INIT
>>> |       |         ^~~~~~~~~~~~~~
>>> | ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/threads_posix.h:69=
:25: error: conflicting types for =E2=80=98once_flag=E2=80=99; have =E2=80=
=98pthread_once_t=E2=80=99 {aka =E2=80=98int=E2=80=99}
>>> |    69 | typedef pthread_once_t  once_flag;
>>> |       |                         ^~~~~~~~~
>>> | /usr/include/x86_64-linux-gnu/bits/types/once_flag.h:24:21: note: pre=
vious declaration of =E2=80=98once_flag=E2=80=99 with type =E2=80=98once_fl=
ag=E2=80=99
>>> |    24 | typedef __once_flag once_flag;
>>> |       |                     ^~~~~~~~~
>>> | ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/threads_posix.h:94=
:1: error: conflicting types for =E2=80=98call_once=E2=80=99; have =E2=80=
=98void(int *, void (*)(void))=E2=80=99
>>> |    94 | call_once(once_flag *flag, void (*func)(void))
>>> |       | ^~~~~~~~~
>>> | /usr/include/stdlib.h:1195:13: note: previous declaration of =E2=80=
=98call_once=E2=80=99 with type =E2=80=98void(once_flag *, void (*)(void))=
=E2=80=99
>>> |  1195 | extern void call_once (once_flag *__flag, void (*__func)(void=
));
>>> |       |             ^~~~~~~~~
>>>
>>> Regards,
>>>
>>> --
>>> Yoann Congal
>>> Smile ECS
>>>


--=20
Yoann Congal
Smile ECS


