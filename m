Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEA5F364B3
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 19:17:29 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.140331.1775762240888421220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 12:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NoF7XNSw;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-483487335c2so13573505e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775762239; x=1776367039; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCnnrxykJQZYa3Lp1iwr1DrwEnjxjkV3j9iK2uVaOa4=;
        b=NoF7XNSwEjt8ClPnspZIrKMp9sfzPp+cT1503icL402zVtYWy86rr1Bno3iQk8AnSj
         3gEPzzi45wzT/wivL2D28lUfWDoER/nN88nKQ3XLT5tXuQEWsUKxeF9jIKzfVxCJbkIJ
         0tlxK8NIDTqQF2rjimKd54VZSzz+/kxGl++Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775762239; x=1776367039;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCnnrxykJQZYa3Lp1iwr1DrwEnjxjkV3j9iK2uVaOa4=;
        b=BL8Nx4eiPjEtS7KJ9fMEllj+tojfGq/ScUcrFDZxI/jnuxRYxs2+oT5A9LJMVodW0W
         /OAczSCd4jbXiDf5vzMLbhA0hBYmZbuHg0cEL1mHohjOA1nQb9061tfct17LPGlI5/M+
         nb5ZqtPuiVb5r0FnCfhQIYutjs5JU8a/IkurssE87icmiUbTouA2WAI2ldkxZHICVWMQ
         XGuI5JRqZ72Xx70lPOGBH4XZiG2RRCp92i65jPx9OcLpOnB+qen66yTnv4XvpwfYoyMk
         5e4WyVu/AqGcEV4W6g94cmCUPz6bJjF6HbedDw4e9murHTA+E8erOq80tfodkwNd3Miq
         1d/g==
X-Forwarded-Encrypted: i=1; AJvYcCWcSvzFUVcLa1AhjWDO3i0ZI5z5hGUcrthXbRymrUd8p1Uu6f249FvEYomtAaAgovibzTXsZW3sjT+plO9IgMaHUQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1W3enhRWLMuOD11Tl6DhXivG86FZz2JdQvuZ30kVfgqJND7mU
	f17KYRAbNsxe9AQLqYwhHBBtYmTqMF1aBG4gbXUm+HNmHQCf3Rj5WMGuP86/h+ZrP3o=
X-Gm-Gg: AeBDieuU4eiUrbeNhERSDvwv+6IlbuMSlkDqnIKrU12gATw0r8tsdo9JPHU0FTlWVSA
	WInMudRhvL0Rbjsezjc3hLKn2nuG9U9TnC7Rull92z8RgVefxu5JkDOP3omQsuI76+xys7X+GI1
	ruQpo0n0F44C4okvKSh6upU52yH/TpZJRsmgi/7XPCURvnGKgK2vipfVFZ73T1mRpQGtMeDnN4t
	ZplN0zWFTn/QT5WOfO5oJdti6bArypNmEqwT4sMsJEe94uRIrIdDBh5gdqZtSNGqjtIhBeA/q+9
	uwJF7AEYXlmz3FETdBPfA1MWVVPY4mQnwQvBl699RQC7jo50CnVRALzCeuFlO7GuBl4eDpXL2uq
	LS3h2vY5L90atyC+ZhGZqo5EmbnpMHdzHilkMapXmD5AUTp36sAILhyghPaJI/XhzqmZxLZRDvZ
	HMLxG+BdAs1pUD65QJIqPDzmLJjFi/atRfP+YptGsBhyJvwR+8CVl2AHya1Y4/hClpWqq7mkDm/
	cwAkFJuRTPLhEb+udZ4PHpiAA==
X-Received: by 2002:a05:600c:8b16:b0:488:a916:14a8 with SMTP id 5b1f17b1804b1-488d67e3773mr945325e9.10.1775762239004;
        Thu, 09 Apr 2026 12:17:19 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e468c5sm1141175f8f.20.2026.04.09.12.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 12:17:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 21:17:16 +0200
Message-Id: <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH 1/9] dtc: backport fix for build
 with glibc-2.43
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
To: <martin.jansa@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
In-Reply-To: <20260409152839.2894434-1-martin.jansa@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 19:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234942

On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openembedded.org=
 wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
> https://errors.yoctoproject.org/Errors/Details/903983/
>
> ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98overlay_f=
ixup_phandle=E2=80=99:
> ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment disca=
rds =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3Dd=
iscarded-qualifiers]
>   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
>       |                     ^
> ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment disca=
rds =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3Dd=
iscarded-qualifiers]
>   434 |                 sep =3D memchr(name, ':', fixup_len);
>       |                     ^
> cc1: all warnings being treated as errors
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Hello,

I've started a whinlatter bringup build on the new Ubuntu 26.04 worker
with this series applied:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/96/builds/23

It got 2 errors (Other errors are most likely consequences of these ones):

ERROR: shadow-native-4.18.0-r0 do_configure: configure failed:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/23/step=
s/12/logs/stdio line 6269:
| checking for crypt in -lcrypt... no
| configure: error: crypt() not found
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64-lin=
ux/shadow-native/4.18.0/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
NOTE: recipe shadow-native-4.18.0-r0: task do_configure: Failed

ERROR: virglrenderer-native-1.1.1-r0 do_compile: Execution of '/srv/pokybui=
ld/yocto-worker/bringup/build/build/tmp/work/x86_64-linux/virglrenderer-nat=
ive/1.1.1/temp/run.do_compile.2048675' failed with exit code 1
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/23/step=
s/12/logs/stdio line 29545:
| [4/57] gcc -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1=
.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources=
/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mes=
a/util -fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wall=
 -Winvalid-pch -Wextra -Wpedantic -std=3Dgnu11 -Werror=3Denum-int-mismatch =
-Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes -Werro=
r=3Dpedantic -Wmissing-prototypes -Werror=3Dincompatible-pointer-types -Wer=
ror=3Dint-to-pointer-cast -Werror=3Dswitch -Wno-overlength-strings -Wno-mis=
sing-field-initializers -Werror=3Dformat -fvisibility=3Dhidden -fno-strict-=
aliasing -imacros /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/=
x86_64-linux/virglrenderer-native/1.1.1/build/config.h -DHAVE_CONFIG_H=3D1 =
-isystem/srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64-lin=
ux/virglrenderer-native/1.1.1/recipe-sysroot-native/usr/include -O2 -pipe -=
fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_math.c.o -MF src/mesa/lib=
mesa.a.p/util_u_math.c.o.d -o src/mesa/libmesa.a.p/util_u_math.c.o -c ../so=
urces/virglrenderer-1.1.1/src/mesa/util/u_math.c
| FAILED: [code=3D1] src/mesa/libmesa.a.p/util_u_math.c.o
| gcc -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/sr=
c/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglr=
enderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util =
-fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wall -Winva=
lid-pch -Wextra -Wpedantic -std=3Dgnu11 -Werror=3Denum-int-mismatch -Werror=
=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes -Werror=3Dped=
antic -Wmissing-prototypes -Werror=3Dincompatible-pointer-types -Werror=3Di=
nt-to-pointer-cast -Werror=3Dswitch -Wno-overlength-strings -Wno-missing-fi=
eld-initializers -Werror=3Dformat -fvisibility=3Dhidden -fno-strict-aliasin=
g -imacros /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64-=
linux/virglrenderer-native/1.1.1/build/config.h -DHAVE_CONFIG_H=3D1 -isyste=
m/srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64-linux/virg=
lrenderer-native/1.1.1/recipe-sysroot-native/usr/include -O2 -pipe -fPIC -p=
thread -MD -MQ src/mesa/libmesa.a.p/util_u_math.c.o -MF src/mesa/libmesa.a.=
p/util_u_math.c.o.d -o src/mesa/libmesa.a.p/util_u_math.c.o -c ../sources/v=
irglrenderer-1.1.1/src/mesa/util/u_math.c
| In file included from ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/=
threads.h:64,
|                  from ../sources/virglrenderer-1.1.1/src/mesa/util/u_thre=
ad.h:35,
|                  from ../sources/virglrenderer-1.1.1/src/mesa/util/u_cpu_=
detect.h:40,
|                  from ../sources/virglrenderer-1.1.1/src/mesa/util/u_math=
.c:32:
| ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/threads_posix.h:54:9: =
warning: =E2=80=98ONCE_FLAG_INIT=E2=80=99 redefined
|    54 | #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
|       |         ^~~~~~~~~~~~~~
| In file included from /usr/include/stdlib.h:1191,
|                  from ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/=
threads_posix.h:29:
| /usr/include/x86_64-linux-gnu/bits/types/once_flag.h:25:9: note: this is =
the location of the previous definition
|    25 | #define ONCE_FLAG_INIT __ONCE_FLAG_INIT
|       |         ^~~~~~~~~~~~~~
| ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/threads_posix.h:69:25:=
 error: conflicting types for =E2=80=98once_flag=E2=80=99; have =E2=80=98pt=
hread_once_t=E2=80=99 {aka =E2=80=98int=E2=80=99}
|    69 | typedef pthread_once_t  once_flag;
|       |                         ^~~~~~~~~
| /usr/include/x86_64-linux-gnu/bits/types/once_flag.h:24:21: note: previou=
s declaration of =E2=80=98once_flag=E2=80=99 with type =E2=80=98once_flag=
=E2=80=99
|    24 | typedef __once_flag once_flag;
|       |                     ^~~~~~~~~
| ../sources/virglrenderer-1.1.1/src/mesa/compat/c11/threads_posix.h:94:1: =
error: conflicting types for =E2=80=98call_once=E2=80=99; have =E2=80=98voi=
d(int *, void (*)(void))=E2=80=99
|    94 | call_once(once_flag *flag, void (*func)(void))
|       | ^~~~~~~~~
| /usr/include/stdlib.h:1195:13: note: previous declaration of =E2=80=98cal=
l_once=E2=80=99 with type =E2=80=98void(once_flag *, void (*)(void))=E2=80=
=99
|  1195 | extern void call_once (once_flag *__flag, void (*__func)(void));
|       |             ^~~~~~~~~

Regards,

--=20
Yoann Congal
Smile ECS


