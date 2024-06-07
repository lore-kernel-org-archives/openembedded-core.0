Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041F3C27C55
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 22:46:34 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.56360.1717800385705284323
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 15:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cer2x1Je;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b9d062526so2935313e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 15:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717800384; x=1718405184; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeetoP3HheVESOCOx5DxWOKPufOLdC1S5t8i8lHlqz4=;
        b=Cer2x1JeI8+MemjmJcW82e41JWpRlsgHPGux+5tcVJ6ZaFomoqg4LCbHqsPETU/+Mf
         /OPfnbqfsOsJWH37kFZ9nFNFjh54D4U9GFIeyF+JbxQD2zpQVPUup0fqUONHr58x1DJA
         SGrt8NisJp8IjnwpC+eKej/8+SRrY24bsBt7HxsvGJ6Po33IcNHLXUmUlj9MAReTl3vk
         RSjWsS5NqmXCdMtlJ+3HiVVQuTZ26blefeaeKjto/J1kQpmLEh38l07mSyrFiB5IAIP7
         7OB/UtU2xDKdaxUbgQ/DOp1W8NUeAihmlkkf7biKMeLqZ7DAbmsqrrq4AP+TDPBlRo/9
         o5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717800384; x=1718405184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeetoP3HheVESOCOx5DxWOKPufOLdC1S5t8i8lHlqz4=;
        b=ofQ0hzpZ5CUuSUS4ePLUYRy6z/akrebxVazJ+pOiegS/Mykck3YXYAqz9i0LqnO81S
         F33L8hcj0j2ysuhGJ+yv9Z52VTeh3vtibz9H+kSJ25YeYR6xGWt1TOf/PR5dh7gipg26
         VM4Sk9H2dE+7Fw+M5qaomiUWzlcQlou/Th7F6c5cekEMt84GolXDTWE6EiJzo3zgUftZ
         8tFAGESC4aa88dVTMzWILZfkoKHItElhGOmVGH1SijJ9xH3DxGZFOcIBHYDs396HWh0P
         qgmjnfEQYa+Q6lKk2GFdZWfHo23zMsbfadLbaKlau7F2gOpPaVPHUzA7X2sgFQgL/k5X
         v7XA==
X-Forwarded-Encrypted: i=1; AJvYcCUrfwb/mGkee3h69flrWVhSoM1ABfRkbS3MgiB6FZ66b6wFtBdT8jMYk8/n4QhjGqSOT4rpdrvei40se461LcxrKpHW/PcKj9kF0VFn9JC0AnUShJhxZVkW
X-Gm-Message-State: AOJu0YwtyahyzY4hGTHOhTygW/5FF/QsGOggHvXDx0Q78uOjwEGqzgLW
	Zba2iHZNnXYfTjr2rNE2bQ/YcqOCjtjA3ssvGA/xWtOGI4VqIO0/Q7ZKjIldkWI4czVj13PT9VI
	70gWKnPuhW1nw6whVwA7poZfcUPw=
X-Google-Smtp-Source: AGHT+IEgKnBUydnf73Evn2t4eOW2Y2ilSaL11x8n/reBFeAKztFfSNdzg2ePjZ95rS07BIOTxBj7WZQYCGj2URbot1k=
X-Received: by 2002:a05:6512:10cd:b0:52c:7f7f:dc1f with SMTP id
 2adb3069b0e04-52c7f7fdd4bmr88060e87.61.1717800383341; Fri, 07 Jun 2024
 15:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240606105641.882362-1-simit.ghane@lge.com> <20240607223540bfeafc2c@mail.local>
In-Reply-To: <20240607223540bfeafc2c@mail.local>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 8 Jun 2024 00:46:03 +0200
Message-ID: <CA+chaQd6Asbq9R9oeHd06szRL9u8DLmj-v-0xGpm-nA2g5XQ4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3] libgcrypt: Fix building error with '-O2' in
 sysroot path
To: alexandre.belloni@bootlin.com
Cc: "simit.ghane" <simit.ghane@lge.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 22:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200448

> > +-o_flag_munging =3D sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Of=
ast/-O0/g'
> > ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 =
/' -e 's/[[:blank:]]-Ofast/ -O0 /g'

I guess the 1-9 should have stayed in this one (now it no longer
replaces -O1 with -O0) and also the "/g" got missing, so it replaced
the first -O* on command line, but not the 2nd one which stayed -O2.

To be safe you should add /g to the first sed call as well.

It should be fixed upstream as well as the issue is already in the
merged version:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibgcrypt.git;a=3Dblobdiff;f=
=3Drandom/Makefile.am;h=3D340df38a798997b975d81a445cbc84cb23f5ea7a;hp=3D0c9=
35a05952b5f1d91ef5992ec090912a77b03d2;hb=3D7d9817ca935a35fe6c8e2c2c7615825f=
a08a3a19;hpb=3D75e9bcccb69a9dea67d90840bd295bbd1749cea3

Regards,

On Sat, Jun 8, 2024 at 12:35=E2=80=AFAM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> This seems to fail:
>
> | libtool: compile:  arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-abi=
=3Dhard -mcpu=3Dcortex-a8 -fstack-protector-strong -O0 -D_FORTIFY_SOURCE=3D=
2 -Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 -D=
_FILE_OFFSET_BITS=3D64 --sysroot=3D/home/pokybuild/yocto-worker/beaglebone-=
alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.=
3/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.10.3/random -I.. -=
I../src -I../../libgcrypt-1.10.3/src -O2 -pipe -g -feliminate-unused-debug-=
types -fcanon-prefix-map -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/=
beaglebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libg=
crypt/1.10.3/libgcrypt-1.10.3=3D/usr/src/debug/libgcrypt/1.10.3 -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/=
cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/libgcrypt-1.10.3=3D/usr=
/src/debug/libgcrypt/1.10.3 -fmacro-prefix-map=3D/home/pokybuild/yocto-work=
er/beaglebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/l=
ibgcrypt/1.10.3/build=3D/usr/src/debug/libgcrypt/1.10.3 -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/cortexa=
8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/build=3D/usr/src/debug/libgcry=
pt/1.10.3 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone-alt/=
build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/re=
cipe-sysroot=3D -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebon=
e-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.1=
0.3/recipe-sysroot=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/bea=
glebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcry=
pt/1.10.3/recipe-sysroot-native=3D -fvisibility=3Dhidden -fno-delete-null-p=
ointer-checks -Wall -c ../../libgcrypt-1.10.3/random/rndjent.c  -fPIC -DPIC=
 -o .libs/rndjent.o
> | In file included from ../../libgcrypt-1.10.3/random/rndjent.c:99:
> | ../../libgcrypt-1.10.3/random/jitterentropy-base.c:58:3: error: #error =
"The CPU Jitter random number generator must not be compiled with optimizat=
ions. See documentation. Use the compiler switch -O0 for compiling jitteren=
tropy.c."
> |    58 |  #error "The CPU Jitter random number generator must not be com=
piled with optimizations. See documentation. Use the compiler switch -O0 fo=
r compiling jitterentropy.c."
> |       |   ^~~~~
> | make[2]: *** [Makefile:775: rndjent.lo] Error 1
> | make[2]: Leaving directory '/home/pokybuild/yocto-worker/beaglebone-alt=
/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/b=
uild/random'
> | make[1]: *** [Makefile:500: all-recursive] Error 1
> | make[1]: Leaving directory '/home/pokybuild/yocto-worker/beaglebone-alt=
/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/b=
uild'
> | make: *** [Makefile:432: all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> NOTE: recipe libgcrypt-1.10.3-r0: task do_compile: Failed
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/8078/s=
teps/11/logs/stdio
>
>
>
> On 06/06/2024 16:26:41+0530, simit.ghane wrote:
> > Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
> > respectively when compiling cipher and random in the filesystem
> > paths as well if they happen to contain '-O2' or '-Ofast
> >
> > If we are cross compiling libgcrypt and sysroot contains such
> > characters, we would
> > get compile errors because the sysroot path has been modified.
> >
> > Fix this by adding blank spaces and tabs before the original matching
> > pattern in the sed command.
> >
> > It is difficult to control -O1 for cipher and -O0 for random
> > at the same time in OE environment along with patch file.
> > So, keeping same change as it is.
> >
> > Signed-off-by: simit.ghane <simit.ghane@lge.com>
> > ---
> > v3: No change
> >
> >  ...ilding-error-with-O2-in-sysroot-path.patch | 52 +++++++++++++------
> >  1 file changed, 36 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-bu=
ilding-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt=
/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
> > index cf9ebfb3e6..339bc9c563 100644
> > --- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-=
error-with-O2-in-sysroot-path.patch
> > +++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-=
error-with-O2-in-sysroot-path.patch
> > @@ -1,31 +1,38 @@
> > -From 0f66e796a8522e1043dda03b88d5f6feae839d16 Mon Sep 17 00:00:00 2001
> > -From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Wed, 16 Aug 2017 10:44:41 +0800
> > -Subject: [PATCH] libgcrypt: fix building error with '-O2' in sysroot p=
ath
> > +From 7d9817ca935a35fe6c8e2c2c7615825fa08a3a19 Mon Sep 17 00:00:00 2001
> > +From: "simit.ghane" <simit.ghane@lge.com>
> > +Date: Tue, 7 May 2024 14:09:03 +0530
> > +Subject: [PATCHV2] Fix building error with '-O2' in sysroot path
> >
> > -Upstream-Status: Pending
> > +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=
=3Dlibgcrypt.git;a=3Dcommit;h=3D7d9817ca935a35fe6c8e2c2c7615825fa08a3a19]
> > +
> > +* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
> > +* random/Makefile.am (o_flag_munging): Ditto.
> > +--
> > +
> > +Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
> > +respectively when compiling cipher and random in the filesystem
> > +paths as well if they happen to contain '-O2' or '-Ofast
> >
> > -Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
> > -compiling cipher.
> >  If we are cross compiling libgcrypt and sysroot contains such
> >  characters, we would
> >  get compile errors because the sysroot path has been modified.
> >
> > -Fix this by adding blank spaces before and after the original matching
> > -pattern in the
> > -sed command.
> > +Fix this by adding blank spaces and tabs before the original matching
> > +pattern in the sed command.
> >
> > -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +Signed-off-by: simit.ghane <simit.ghane@lge.com>
> >
> > -Rebase to 1.8.0
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +ChangeLog entries added by wk
> >
> > +Note that there is also the configure option --disable-O-flag-munging;
> > +see the README.
> >  ---
> >   cipher/Makefile.am | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > + random/Makefile.am | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> > -index c3d642b..88c883a 100644
> > +index c3d642b2ac..f1c3971c40 100644
> >  --- a/cipher/Makefile.am
> >  +++ b/cipher/Makefile.am
> >  @@ -153,7 +153,7 @@ gost-s-box: gost-s-box.c
> > @@ -33,7 +40,20 @@ index c3d642b..88c883a 100644
> >
> >   if ENABLE_O_FLAG_MUNGING
> >  -o_flag_munging =3D sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofa=
st/-O1/g'
> > -+o_flag_munging =3D sed -e 's/ -O\([2-9sgz][2-9sgz]*\) / -O1 /' -e 's/=
 -Ofast / -O1 /g'
> > ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 =
/' -e 's/[[:blank:]]-Ofast/ -O1 /g'
> > + else
> > + o_flag_munging =3D cat
> > + endif
> > +diff --git a/random/Makefile.am b/random/Makefile.am
> > +index 0c935a0595..340df38a79 100644
> > +--- a/random/Makefile.am
> > ++++ b/random/Makefile.am
> > +@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-b=
ase-user.h
> > +
> > + # The rndjent module needs to be compiled without optimization.  */
> > + if ENABLE_O_FLAG_MUNGING
> > +-o_flag_munging =3D sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Of=
ast/-O0/g'
> > ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 =
/' -e 's/[[:blank:]]-Ofast/ -O0 /g'
> >   else
> >   o_flag_munging =3D cat
> >   endif
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
> View/Reply Online (#200447): https://lists.openembedded.org/g/openembedde=
d-core/message/200447
> Mute This Topic: https://lists.openembedded.org/mt/106520599/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

