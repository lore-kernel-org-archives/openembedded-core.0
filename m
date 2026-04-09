Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C478F364BE
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 21:29:45 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143236.1775770178768900260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 14:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g4ckVuGb;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso1446328e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 14:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775770177; cv=none;
        d=google.com; s=arc-20240605;
        b=dVT9fQOLobrzpulT2XJsZaOxEEubIUKX0gvIN/KIYsJOJ1jX0gmTZLWd+uEiTCOK9B
         pIk4EBlcscE20n9Aw+V7vNAScGdgOlREqAq/donwaeg0vCJZwKPzKebwFkoXB2ebojN3
         8hDZTFH57Pm4h8neK77VHc4TKqbBfZlA5N10WYMZmjEvDzINSU/GOGP6GzCiUfRZTDXQ
         gXRWU5G99bU9B4fY5htvhdSWmqIdO5fXYY3BByexiV6Zmg3JlmdW2PkHl+ifl3fJxO08
         WEfOv0V1/mPgDp5ujj2ZCwJ+TqcXYxq0/nGJU9aVShXJAVPibC5gfA3CBxHuTOPOrkhh
         Edzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zGRbJ/l3Dgzo2pMk4ITipV1L++et4zEbZdzqfq5Sc8w=;
        fh=ipws0wG+k0OA3kXqbycnQoCJAD8PbitcTEukBC/jmQo=;
        b=Y06vYZLqc6h2+FrLXF7l0NBRdyP8lsF1Vyz32UT/r5IzZPGLU2NafM3WZMMc0I9pdU
         KI9ZndWsFPaU4FGkqZKxGXN9N35SmSOTIlPzesjMlIcG9msw3eteUPWSNBvmzyWZTZkm
         TD2bJGy6SIgxsaaFJ7FuHI8L/ZNqCDdxQ/SDoq4C2DD/8s3703hjeDM4hLFAj5mK6m0T
         q8HfI9b0IbmyBCl4yficx3hiixOj/s9/n0zFWqqxMuqUTJFJ0xycLKnSR3W8ClrbcLpA
         XDAKWcc5unyENGOQMHWP6ixfk7R4cpFv/+lVdxQLJJAQcGSLeYwSJSVHcLnNaIdGf7p2
         mXDQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775770177; x=1776374977; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGRbJ/l3Dgzo2pMk4ITipV1L++et4zEbZdzqfq5Sc8w=;
        b=g4ckVuGbIyQCNf+HpyAFSjwmfhh44fUNqWYICA/+3ObCumdLlZOdR2ngjzPjmf3iQc
         VCPrfa/6lzKBbALdqeQnKMSUAwFGgoW4bltmRsF3LWCpLnic0+YCjr712oV0ZsUng9Z8
         i9vc1+O0prwn3InxHWeBlEIlE7O5HLXJTvTK0wv/KtFV2tf7pCAm/z/f+qXil/fqf4WC
         qZr+pXwfML7pWdjBHDWrsghhQ8Vnp97lpXNBABMxtLauTTjUt8btkBoTdKe/JxjRx4Cm
         2sWP4dXXXGbo0plipv5iHwi3WuzbOk+h1lDzzznqOt0kWt4zNCKep481+6OL5Z27mDA4
         56AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770177; x=1776374977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zGRbJ/l3Dgzo2pMk4ITipV1L++et4zEbZdzqfq5Sc8w=;
        b=SbjiPwD2FwmH/gW39WlRXj3/WORjXCS8sD8huVb5UCKRsEIc2m6Yw8rQSTH4SI/nm+
         aArQ3EJNjDVvSEGOZevq4ph9jUrN3/EGi2t6Er6sN2Fwg383qFnhBTW1QWRRVjsJZjk6
         q2ZKScib3tTm92FfByK5xovl23lweLFdtDw4AUJJqDXezJ1wXpGY+FJDBiObsM3+IRcr
         mIr5LiG5JT435EYiPfcUrA0d0hM9TPxrPE9tATGjp76SYX6FFtMkSobGzRaCKi2y+IEP
         adB7jxoSbbB0UlG50NBwOWyh1EcQAp9udfLJcsuWHVaGseyrsMvhTdL7mcWr9JsbUMHj
         4w4A==
X-Gm-Message-State: AOJu0Yw9C3MbLR+fbogTvaFgUmHhTZfpRHVyYd89Z73q04wDf8kMM2mm
	YQVF9k8CblY2J+2ModfdeC7E2QXmp621omG9wUlqHMaQ/UVsvpcjqsqZXVbgbYGNjhPUVaM7gGz
	0fozvzVLYQ3vzqXLmzC2ZLpx/+pBVW0w=
X-Gm-Gg: AeBDieuApCPKFufQR3vHNJs02EvOcQESYtTqiz9SYy/4mzk2qEKKvwYm8bpU6h8/hGW
	nENcCzidWyHFLIFiXFwOvmln/bglsuLnWU/uaQuK008npbE8Q4/ajS1/Q/OrYFcIcuArfV8JjHB
	mI7qEOvUHZIRDEfY11XdU+PE4szg6PeDjbJnot9LIFveO+p0Q4StG2Zt9XiMxvxOpK545qFZp0T
	teQvETpWK9JbsKa6QG3RIL3/Z+F4DKiNYr4NKO0NbJdbMZOHCuegWwwtxcxdU9CGMWx5rSTt6oZ
	QDB1VqV+JA==
X-Received: by 2002:a05:6512:39d6:b0:5a2:babe:3da0 with SMTP id
 2adb3069b0e04-5a3ef6ff102mr197245e87.9.1775770176232; Thu, 09 Apr 2026
 14:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com> <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr>
In-Reply-To: <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Apr 2026 23:29:23 +0200
X-Gm-Features: AQROBzBugHREfhTWJ2szB4olJDOJsoDMuVNv2aGgmuATNei4x7POOu_blTC578E
Message-ID: <CA+chaQdA95XBr+n+-Zm2dE9sxFiaAjhthSpGvP-g+N60yj=MJQ@mail.gmail.com>
Subject: Re: [OE-core] [whinlatter][PATCH 1/9] dtc: backport fix for build
 with glibc-2.43
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 21:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234949

On Thu, Apr 9, 2026 at 9:17=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openembedded.o=
rg wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
> > https://errors.yoctoproject.org/Errors/Details/903983/
> >
> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98overlay=
_fixup_phandle=E2=80=99:
> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment dis=
cards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
> >       |                     ^
> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment dis=
cards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
> >   434 |                 sep =3D memchr(name, ':', fixup_len);
> >       |                     ^
> > cc1: all warnings being treated as errors
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
>
> Hello,
>
> I've started a whinlatter bringup build on the new Ubuntu 26.04 worker
> with this series applied:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/96/builds/23
>
> It got 2 errors (Other errors are most likely consequences of these ones)=
:
>
> ERROR: shadow-native-4.18.0-r0 do_configure: configure failed:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/23/st=
eps/12/logs/stdio line 6269:
> | checking for crypt in -lcrypt... no
> | configure: error: crypt() not found
> | NOTE: The following config.log files may provide further information.
> | NOTE: /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64-l=
inux/shadow-native/4.18.0/build/config.log
> | ERROR: configure failed
> | WARNING: exit code 1 from a shell command.
> NOTE: recipe shadow-native-4.18.0-r0: task do_configure: Failed

Hello,

for shadow please read
https://lists.openembedded.org/g/openembedded-core/message/234119 the
important part:
"libcrypt-dev is no longer installed as a dependency in my minimal docker i=
mage"
I guess it's now missing on your ubuntu-26.04 host as well.
It used to be typically installed by build-essential -> libc6-dev ->
libcrypt-dev but not anymore since 2.42-7:

25.10 questing with 2.42-0ubuntu3.1:
https://packages.ubuntu.com/questing/libc6-dev
26.04 resolute with 2.43-2ubuntu1:
https://packages.ubuntu.com/resolute/libc6-dev

https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.43-2ubun=
tu1/changelog:
...
glibc (2.42-7) unstable; urgency=3Dmedium

  [ Aurelien Jarno ]
  * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcrypt-dev
    dependency from libc6-dev. Thanks to Helmut Grohne for proposing that,
    doing an archive rebuild and filling the bug reports.
  * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemTap stati=
c
    probes.
  * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the removal o=
f
    the obsolete termio interface.  Closes: #1124068.
  * debian/rules.d/debhelper.mk: ensure that linker scripts work even when
    /usr is unmerged.  Closes: #1120508
  * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
    source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: drop
    unpack-message-for-{orig,source} overrides, fixed in lintian 2.128.0.
  * debian/control.in/main: drop Rules-Requires-Root: no, this is now the
    default.
  * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32}: remov=
e
    the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
  * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixed wrt
    GLIBC_ABI_GNU_TLS.

 -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 +0100
...


I'll have a look at virglrenderer-native tomorrow. khem already fixed it in=
:
https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/3f0f775edb2df5e=
a54c37863286ad565ccddb276
https://git.openembedded.org/openembedded-core/commit/?id=3D8e85dc6b7f5f766=
8a610b5fd3754c716f0af65b0
https://git.openembedded.org/openembedded-core/commit/?id=3D5ff5aac9ed9e53a=
2e06515cc480c7d89a8aa3171
will add a backport in whinlatter and possibly scarthgap as well.

Regards,

> ERROR: virglrenderer-native-1.1.1-r0 do_compile: Execution of '/srv/pokyb=
uild/yocto-worker/bringup/build/build/tmp/work/x86_64-linux/virglrenderer-n=
ative/1.1.1/temp/run.do_compile.2048675' failed with exit code 1
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/23/st=
eps/12/logs/stdio line 29545:
> | [4/57] gcc -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer=
-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sourc=
es/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/m=
esa/util -fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wa=
ll -Winvalid-pch -Wextra -Wpedantic -std=3Dgnu11 -Werror=3Denum-int-mismatc=
h -Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes -Wer=
ror=3Dpedantic -Wmissing-prototypes -Werror=3Dincompatible-pointer-types -W=
error=3Dint-to-pointer-cast -Werror=3Dswitch -Wno-overlength-strings -Wno-m=
issing-field-initializers -Werror=3Dformat -fvisibility=3Dhidden -fno-stric=
t-aliasing -imacros /srv/pokybuild/yocto-worker/bringup/build/build/tmp/wor=
k/x86_64-linux/virglrenderer-native/1.1.1/build/config.h -DHAVE_CONFIG_H=3D=
1 -isystem/srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64-l=
inux/virglrenderer-native/1.1.1/recipe-sysroot-native/usr/include -O2 -pipe=
 -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_math.c.o -MF src/mesa/l=
ibmesa.a.p/util_u_math.c.o.d -o src/mesa/libmesa.a.p/util_u_math.c.o -c ../=
sources/virglrenderer-1.1.1/src/mesa/util/u_math.c
> | FAILED: [code=3D1] src/mesa/libmesa.a.p/util_u_math.c.o
> | gcc -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/=
src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virg=
lrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/uti=
l -fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wall -Win=
valid-pch -Wextra -Wpedantic -std=3Dgnu11 -Werror=3Denum-int-mismatch -Werr=
or=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes -Werror=3Dp=
edantic -Wmissing-prototypes -Werror=3Dincompatible-pointer-types -Werror=
=3Dint-to-pointer-cast -Werror=3Dswitch -Wno-overlength-strings -Wno-missin=
g-field-initializers -Werror=3Dformat -fvisibility=3Dhidden -fno-strict-ali=
asing -imacros /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86=
_64-linux/virglrenderer-native/1.1.1/build/config.h -DHAVE_CONFIG_H=3D1 -is=
ystem/srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64-linux/=
virglrenderer-native/1.1.1/recipe-sysroot-native/usr/include -O2 -pipe -fPI=
C -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_math.c.o -MF src/mesa/libmes=
a.a.p/util_u_math.c.o.d -o src/mesa/libmesa.a.p/util_u_math.c.o -c ../sourc=
es/virglrenderer-1.1.1/src/mesa/util/u_math.c
> | In file included from ../sources/virglrenderer-1.1.1/src/mesa/compat/c1=
1/threads.h:64,
> |                  from ../sources/virglrenderer-1.1.1/src/mesa/util/u_th=
read.h:35,
> |                  from ../sources/virglrenderer-1.1.1/src/mesa/util/u_cp=
u_detect.h:40,
> |                  from ../sources/virglrenderer-1.1.1/src/mesa/util/u_ma=
th.c:32:
> | ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/threads_posix.h:54:9=
: warning: =E2=80=98ONCE_FLAG_INIT=E2=80=99 redefined
> |    54 | #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
> |       |         ^~~~~~~~~~~~~~
> | In file included from /usr/include/stdlib.h:1191,
> |                  from ../sources/virglrenderer-1.1.1/src/mesa/compat/c1=
1/threads_posix.h:29:
> | /usr/include/x86_64-linux-gnu/bits/types/once_flag.h:25:9: note: this i=
s the location of the previous definition
> |    25 | #define ONCE_FLAG_INIT __ONCE_FLAG_INIT
> |       |         ^~~~~~~~~~~~~~
> | ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/threads_posix.h:69:2=
5: error: conflicting types for =E2=80=98once_flag=E2=80=99; have =E2=80=98=
pthread_once_t=E2=80=99 {aka =E2=80=98int=E2=80=99}
> |    69 | typedef pthread_once_t  once_flag;
> |       |                         ^~~~~~~~~
> | /usr/include/x86_64-linux-gnu/bits/types/once_flag.h:24:21: note: previ=
ous declaration of =E2=80=98once_flag=E2=80=99 with type =E2=80=98once_flag=
=E2=80=99
> |    24 | typedef __once_flag once_flag;
> |       |                     ^~~~~~~~~
> | ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/threads_posix.h:94:1=
: error: conflicting types for =E2=80=98call_once=E2=80=99; have =E2=80=98v=
oid(int *, void (*)(void))=E2=80=99
> |    94 | call_once(once_flag *flag, void (*func)(void))
> |       | ^~~~~~~~~
> | /usr/include/stdlib.h:1195:13: note: previous declaration of =E2=80=98c=
all_once=E2=80=99 with type =E2=80=98void(once_flag *, void (*)(void))=E2=
=80=99
> |  1195 | extern void call_once (once_flag *__flag, void (*__func)(void))=
;
> |       |             ^~~~~~~~~
>
> Regards,
>
> --
> Yoann Congal
> Smile ECS
>

