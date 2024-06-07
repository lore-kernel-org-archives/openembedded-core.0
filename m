Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9A6C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 22:51:54 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.56713.1717800709230521555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 15:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gw+pCmOR;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebd61d2071so530851fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 15:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717800707; x=1718405507; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFkmbvEPL/zd4BZwfbzvEiHehUh8AEKjmCtVzvW3/4U=;
        b=gw+pCmORsU/n9M4cDRjagRT/FI4ElNkmfnj0Iedn0T1eJ62QOmrEK6u4iK3HKERlsw
         VIPKrXi1DqSLHsqhQsWL+hBpAUob0D/Lyd34BF+D4IBDvR1fDngYDKNzSepeC7KzEfir
         5H34UdMHH79Sn/9VI7Q6uhxs0fMzeJO8qxB9Ru/FOIskAQNsbjuHC0bcCBPOtex3xv0C
         WGyzf3GB9CzQsNSxFdQsGvxfFXEFmBCnq2ftWL5bAIoYI4AkJtjrwpIPE12Kp1PiqWG7
         ilCdUrcLwQMnIEOJ07tNUgJW7WsNkiAnXzOBmLZcjYhVkNynSW6lc/Qu1EaFBfpjw52Q
         mYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717800707; x=1718405507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFkmbvEPL/zd4BZwfbzvEiHehUh8AEKjmCtVzvW3/4U=;
        b=buBXS0Od0ipZxlodAFFnwgFD1ySB+EeLxSD68bVa+nHj1crOrcI5TNigQ3hZ+OGK76
         ILJ7SQF5mrppFtsYxOqauk0oSC6XYykpZZn3kphWyX3gjdr7aZnoYbr4+GCn/b0CvmN1
         JSOTrwCQ1eQG9nPgaw3UURKQK1wXDMQDWlrNxEpD2vuE0OgStI/QGlBQkTRJKSXuXBVe
         KEUAkE34AkGSHnAmi9O/DXZmyji/pUJWkfoSD3pzuk0dXXw6SLLDnzuOTAF2Pp3YsMIO
         3Amvhy14JCTOda7imfwwrktlFSasPJ36T3IsG9g+0FNqT9tlHLm3OYjsXp+L5LpObL6t
         ZIig==
X-Forwarded-Encrypted: i=1; AJvYcCXWN6hjERuFlRsnxfjfg5qzgltmRW33i+uIPe5GzbNevcxWoK09J1Pm1WjHtWzsw2XXbuzP/DalM78XNzc92ARkdPIjYiE8FtFB1TC5FjynwhFHB8OQ3DZR
X-Gm-Message-State: AOJu0YwahYxbPYcB03hRKWs9qM0KXCE7M6fDTI8ZxQgIwIheSFdtxY9Y
	k5qTmWhaqsp140z+Ot9IwVxyW+zSouoaenhHNE8DwrrncmO4p8WD9mUnUBQGkCtdIJI7pA5G3i9
	05B+wgqUdfkOE0A8V41VOtH0W0gw=
X-Google-Smtp-Source: AGHT+IF+qRDp4xQljcc5nePPbM2Eb3QbAe190b9pXH/x9xf88OK0NUgkTiVPkKvF293ijkp2L7w/wWGlXTD2be9DctM=
X-Received: by 2002:a2e:9e81:0:b0:2ea:e00d:cd52 with SMTP id
 38308e7fff4ca-2eae00dd3aemr18180161fa.7.1717800706967; Fri, 07 Jun 2024
 15:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240606105641.882362-1-simit.ghane@lge.com> <20240607223540bfeafc2c@mail.local>
 <17D6DA59940DBD3E.31248@lists.openembedded.org>
In-Reply-To: <17D6DA59940DBD3E.31248@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 8 Jun 2024 00:51:26 +0200
Message-ID: <CA+chaQe8CKtvoYC8yFzWyxSOZCuVn-b+p+4YQkkfPe-GBVUX5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3] libgcrypt: Fix building error with '-O2' in
 sysroot path
To: martin.jansa@gmail.com
Cc: alexandre.belloni@bootlin.com, "simit.ghane" <simit.ghane@lge.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 22:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200449

On Sat, Jun 8, 2024 at 12:46=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> > > +-o_flag_munging =3D sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-=
Ofast/-O0/g'
> > > ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O=
0 /' -e 's/[[:blank:]]-Ofast/ -O0 /g'
>
> I guess the 1-9 should have stayed in this one (now it no longer
> replaces -O1 with -O0) and also the "/g" got missing, so it replaced
> the first -O* on command line, but not the 2nd one which stayed -O2.
>
> To be safe you should add /g to the first sed call as well.
>
> It should be fixed upstream as well as the issue is already in the
> merged version:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibgcrypt.git;a=3Dblobdiff;f=
=3Drandom/Makefile.am;h=3D340df38a798997b975d81a445cbc84cb23f5ea7a;hp=3D0c9=
35a05952b5f1d91ef5992ec090912a77b03d2;hb=3D7d9817ca935a35fe6c8e2c2c7615825f=
a08a3a19;hpb=3D75e9bcccb69a9dea67d90840bd295bbd1749cea3
>

The 1-9 part was already fixed upstream:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibgcrypt.git;a=3Dblobdiff;f=
=3Drandom/Makefile.am;h=3Dc7100ef8b896f321c9f85249184a8e4a2ca38a1e;hp=3D340=
df38a798997b975d81a445cbc84cb23f5ea7a;hb=3D5afadba008918d651afefb842ae123cc=
18454c74;hpb=3D3f5989014a1b7c01aced88897d878ce5105d15df

> Regards,
>
> On Sat, Jun 8, 2024 at 12:35=E2=80=AFAM Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > This seems to fail:
> >
> > | libtool: compile:  arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-ab=
i=3Dhard -mcpu=3Dcortex-a8 -fstack-protector-strong -O0 -D_FORTIFY_SOURCE=
=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64=
 -D_FILE_OFFSET_BITS=3D64 --sysroot=3D/home/pokybuild/yocto-worker/beaglebo=
ne-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.=
10.3/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.10.3/random -I.=
. -I../src -I../../libgcrypt-1.10.3/src -O2 -pipe -g -feliminate-unused-deb=
ug-types -fcanon-prefix-map -fmacro-prefix-map=3D/home/pokybuild/yocto-work=
er/beaglebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/l=
ibgcrypt/1.10.3/libgcrypt-1.10.3=3D/usr/src/debug/libgcrypt/1.10.3 -fdebug-=
prefix-map=3D/home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/wo=
rk/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/libgcrypt-1.10.3=3D/=
usr/src/debug/libgcrypt/1.10.3 -fmacro-prefix-map=3D/home/pokybuild/yocto-w=
orker/beaglebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueab=
i/libgcrypt/1.10.3/build=3D/usr/src/debug/libgcrypt/1.10.3 -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/corte=
xa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/build=3D/usr/src/debug/libgc=
rypt/1.10.3 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone-al=
t/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/=
recipe-sysroot=3D -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beagleb=
one-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1=
.10.3/recipe-sysroot=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/b=
eaglebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgc=
rypt/1.10.3/recipe-sysroot-native=3D -fvisibility=3Dhidden -fno-delete-null=
-pointer-checks -Wall -c ../../libgcrypt-1.10.3/random/rndjent.c  -fPIC -DP=
IC -o .libs/rndjent.o
> > | In file included from ../../libgcrypt-1.10.3/random/rndjent.c:99:
> > | ../../libgcrypt-1.10.3/random/jitterentropy-base.c:58:3: error: #erro=
r "The CPU Jitter random number generator must not be compiled with optimiz=
ations. See documentation. Use the compiler switch -O0 for compiling jitter=
entropy.c."
> > |    58 |  #error "The CPU Jitter random number generator must not be c=
ompiled with optimizations. See documentation. Use the compiler switch -O0 =
for compiling jitterentropy.c."
> > |       |   ^~~~~
> > | make[2]: *** [Makefile:775: rndjent.lo] Error 1
> > | make[2]: Leaving directory '/home/pokybuild/yocto-worker/beaglebone-a=
lt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3=
/build/random'
> > | make[1]: *** [Makefile:500: all-recursive] Error 1
> > | make[1]: Leaving directory '/home/pokybuild/yocto-worker/beaglebone-a=
lt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3=
/build'
> > | make: *** [Makefile:432: all] Error 2
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > NOTE: recipe libgcrypt-1.10.3-r0: task do_compile: Failed
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/8078=
/steps/11/logs/stdio
> >
> >
> >
> > On 06/06/2024 16:26:41+0530, simit.ghane wrote:
> > > Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
> > > respectively when compiling cipher and random in the filesystem
> > > paths as well if they happen to contain '-O2' or '-Ofast
> > >
> > > If we are cross compiling libgcrypt and sysroot contains such
> > > characters, we would
> > > get compile errors because the sysroot path has been modified.
> > >
> > > Fix this by adding blank spaces and tabs before the original matching
> > > pattern in the sed command.
> > >
> > > It is difficult to control -O1 for cipher and -O0 for random
> > > at the same time in OE environment along with patch file.
> > > So, keeping same change as it is.
> > >
> > > Signed-off-by: simit.ghane <simit.ghane@lge.com>
> > > ---
> > > v3: No change
> > >
> > >  ...ilding-error-with-O2-in-sysroot-path.patch | 52 +++++++++++++----=
--
> > >  1 file changed, 36 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-=
building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcry=
pt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
> > > index cf9ebfb3e6..339bc9c563 100644
> > > --- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-buildin=
g-error-with-O2-in-sysroot-path.patch
> > > +++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-buildin=
g-error-with-O2-in-sysroot-path.patch
> > > @@ -1,31 +1,38 @@
> > > -From 0f66e796a8522e1043dda03b88d5f6feae839d16 Mon Sep 17 00:00:00 20=
01
> > > -From: Chen Qi <Qi.Chen@windriver.com>
> > > -Date: Wed, 16 Aug 2017 10:44:41 +0800
> > > -Subject: [PATCH] libgcrypt: fix building error with '-O2' in sysroot=
 path
> > > +From 7d9817ca935a35fe6c8e2c2c7615825fa08a3a19 Mon Sep 17 00:00:00 20=
01
> > > +From: "simit.ghane" <simit.ghane@lge.com>
> > > +Date: Tue, 7 May 2024 14:09:03 +0530
> > > +Subject: [PATCHV2] Fix building error with '-O2' in sysroot path
> > >
> > > -Upstream-Status: Pending
> > > +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?=
p=3Dlibgcrypt.git;a=3Dcommit;h=3D7d9817ca935a35fe6c8e2c2c7615825fa08a3a19]
> > > +
> > > +* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
> > > +* random/Makefile.am (o_flag_munging): Ditto.
> > > +--
> > > +
> > > +Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0=
'
> > > +respectively when compiling cipher and random in the filesystem
> > > +paths as well if they happen to contain '-O2' or '-Ofast
> > >
> > > -Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
> > > -compiling cipher.
> > >  If we are cross compiling libgcrypt and sysroot contains such
> > >  characters, we would
> > >  get compile errors because the sysroot path has been modified.
> > >
> > > -Fix this by adding blank spaces before and after the original matchi=
ng
> > > -pattern in the
> > > -sed command.
> > > +Fix this by adding blank spaces and tabs before the original matchin=
g
> > > +pattern in the sed command.
> > >
> > > -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +Signed-off-by: simit.ghane <simit.ghane@lge.com>
> > >
> > > -Rebase to 1.8.0
> > > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > > +ChangeLog entries added by wk
> > >
> > > +Note that there is also the configure option --disable-O-flag-mungin=
g;
> > > +see the README.
> > >  ---
> > >   cipher/Makefile.am | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > + random/Makefile.am | 2 +-
> > > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > >  diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> > > -index c3d642b..88c883a 100644
> > > +index c3d642b2ac..f1c3971c40 100644
> > >  --- a/cipher/Makefile.am
> > >  +++ b/cipher/Makefile.am
> > >  @@ -153,7 +153,7 @@ gost-s-box: gost-s-box.c
> > > @@ -33,7 +40,20 @@ index c3d642b..88c883a 100644
> > >
> > >   if ENABLE_O_FLAG_MUNGING
> > >  -o_flag_munging =3D sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-O=
fast/-O1/g'
> > > -+o_flag_munging =3D sed -e 's/ -O\([2-9sgz][2-9sgz]*\) / -O1 /' -e '=
s/ -Ofast / -O1 /g'
> > > ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O=
1 /' -e 's/[[:blank:]]-Ofast/ -O1 /g'
> > > + else
> > > + o_flag_munging =3D cat
> > > + endif
> > > +diff --git a/random/Makefile.am b/random/Makefile.am
> > > +index 0c935a0595..340df38a79 100644
> > > +--- a/random/Makefile.am
> > > ++++ b/random/Makefile.am
> > > +@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy=
-base-user.h
> > > +
> > > + # The rndjent module needs to be compiled without optimization.  */
> > > + if ENABLE_O_FLAG_MUNGING
> > > +-o_flag_munging =3D sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-=
Ofast/-O0/g'
> > > ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O=
0 /' -e 's/[[:blank:]]-Ofast/ -O0 /g'
> > >   else
> > >   o_flag_munging =3D cat
> > >   endif
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200448): https://lists.openembedded.org/g/openembedde=
d-core/message/200448
> Mute This Topic: https://lists.openembedded.org/mt/106520599/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

