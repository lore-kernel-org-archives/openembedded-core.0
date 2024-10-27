Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96428D13580
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 20:06:25 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.36630.1730059582319861029
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 13:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1NKQexo;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a0c160b94so4000809e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 13:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730059580; x=1730664380; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuyyuuwOPPxOZ6DB5AcVpY7qSoXBSJECS5+ouMiotRY=;
        b=U1NKQexoWz8brZpb04i9lMul9MkSACNwAwLIfUqP0gp3s2sfFC1BAj+TCQD53onovn
         b+Vc2lkrMOoX7WdapZtGh4kfouo4sTS4SOY7WYHyCY+L15y8pUJ+aMP3vcy6QsttiVTS
         ZEPssx1Rv4MZE0mjAz6N8QFCLaqu/Ih4VbrjBxZ6ekoBqW+sWrZey66oOpjzw9hnGpzS
         pc4fcstssBdtL5Zkt1qTcNNQgvOX8HnfBAMdg/MJDiQGvJ/vY1F82Kb2iOaG59nZw1Km
         dtDsjTShWPrO24XyqmM9A2lGREVp9L4hbiwPw5B17LKc2PDMpK4wwGGtAwfbhmyk36UH
         dBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059580; x=1730664380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuyyuuwOPPxOZ6DB5AcVpY7qSoXBSJECS5+ouMiotRY=;
        b=r76VBzVmthyJkh85U/D+VMiVHTv6GNK/aMi+ohmarkLUfONLyJFrdSDEI70Q8JOIcT
         U7Vp9AdQ1Q1xU0GPFTiO2X/SZXTiRzj0cV+MxJnyfZ104jI2Y0FWDA1CZFgB3weEsp5M
         AugLCge4UT9xrw4iLdV+sabHPA4CjskZSNx8r48K8ZnUDCWrnT9PiGUIjSRR89yv8Hic
         TGezNKQgofkJp+sCgZ0kF9bbi2gNXWvfpBshpgXIrFaXNSvG6fUGNtnooaF2xFCNcuI+
         d2z9uM8vseTp8UHAkjYfcrLYc85Qbqp2GKbfzggbbhiSvaS6aN72K34rzHk6P1eystgl
         zYIg==
X-Gm-Message-State: AOJu0YxSyXJtyoyaLbvAfApVcck0mRb8VCEazB7k36SaQAjQmOKZiPeV
	d0g6bnVJDwcYRaVhKYxqv/Qy6kNTkj23NdToDfuxy7YIRuDd/dhWu/AGL6EYNepF/8b3oxvViq3
	SteIGOVpr5XiAgg8xAV1YeJ0rV3A=
X-Google-Smtp-Source: AGHT+IEvjzFg0xtSt79uuDpTbG8pNdHhh39WLuXt5msrgF8ZyJjnYuq85fkv+rQaHeJODccZJPLGafN5yVztv9TieZE=
X-Received: by 2002:a05:6512:3993:b0:536:a52d:f94b with SMTP id
 2adb3069b0e04-53b348c107bmr1975989e87.8.1730059579963; Sun, 27 Oct 2024
 13:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241027170119.2876289-1-martin.jansa@gmail.com> <CAOSpxdbdVd5e1HbQgK9cZpJBU-YP9JJRL=AUQ8M41XXiPrWEGA@mail.gmail.com>
In-Reply-To: <CAOSpxdbdVd5e1HbQgK9cZpJBU-YP9JJRL=AUQ8M41XXiPrWEGA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 27 Oct 2024 21:06:07 +0100
Message-ID: <CA+chaQdYSGOe4P8vDGEitWpypKVG-xmcCoe_Vg8bvRoyWqfwyA@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] xmlto: backport a patch to fix build with
 gcc-14 on host
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 20:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206413

Hi Steve,

thanks, will try to reproduce it somehow.

The command line in my successful build looks the same (so it might be
something in ylwrap itself):

DEBUG: Executing python function autotools_aclocals
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
DEBUG: Python function autotools_aclocals finished
DEBUG: Executing shell function do_compile
NOTE: make -j 70 -l 140
make  all-am
make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.28-r0/build=
'
/bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l
lex.yy.c xmlif/xmlif.c -- flex
gcc  -DHAVE_CONFIG_H -I. -I../xmlto-0.0.28
-isystemwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-native/usr/=
include
 -isystemwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-native/usr=
/include
-O2 -pipe -c -o xmlif/xmlif.o xmlif/xmlif.c
gcc   -isystemwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-nativ=
e/usr/include
-O2 -pipe  -Lwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-native=
/usr/lib

-Lwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-native/lib
                      -Wl,--enable-new-dtags
-Wl,-rpath-link,work/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-nat=
ive/usr/lib

-Wl,-rpath-link,work/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-nat=
ive/lib

-Wl,-rpath,work/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-native/u=
sr/lib

-Wl,-rpath,work/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-native/l=
ib
                        -Wl,-O1 -Wl,--allow-shlib-undefined
-Wl,--dynamic-linker=3Dsysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.=
so.2
-o xmlif/xmlif xmlif/xmlif.o
make[1]: Leaving directory 'work/x86_64-linux/xmlto-native/0.0.28-r0/build'
DEBUG: Shell function do_compile finished

And I was building it on ubuntu-24.10 while your error is from
ubuntu-22.04 and poky-altcfg, will try with older ubuntu and then with
altcfg to see if I happen to reproduce it locally.

On Sun, Oct 27, 2024 at 8:54=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> Unfortunately I'm getting an autobuilder failure with this patch:
>
> https://errors.yoctoproject.org/Errors/Details/810853/
>
> Steve
>
> On Sun, Oct 27, 2024 at 10:01=E2=80=AFAM Martin Jansa <martin.jansa@gmail=
.com> wrote:
> >
> > * need to add dependency on flex-native because now when the
> >   .l file is modified by the .patch file it will try to regenerate
> >   the c code and fail:
> >
> > | make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.28-r0=
/build'
> > | /bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l .c xml=
if/xmlif.c -- /bin/bash 'work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0=
.28/missing' flex
> > | work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing: line 8=
1: flex: command not found
> > | WARNING: 'flex' is missing on your system.
> > |          You should only need it if you modified a '.l' file.
> > |          You may want to install the Fast Lexical Analyzer package:
> > |          <https://github.com/westes/flex>
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  ...001-Fix-return-type-of-main-function.patch | 42 +++++++++++++++++++
> >  .../0001-fix-Wimplicit-int-for-ifsense.patch  | 33 +++++++++++++++
> >  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |  4 +-
> >  3 files changed, 78 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-r=
eturn-type-of-main-function.patch
> >  create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-W=
implicit-int-for-ifsense.patch
> >
> > diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-t=
ype-of-main-function.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-=
Fix-return-type-of-main-function.patch
> > new file mode 100644
> > index 0000000000..f28f1fb56a
> > --- /dev/null
> > +++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-=
main-function.patch
> > @@ -0,0 +1,42 @@
> > +From 6347e1b9da2140acdd55e3e7ac1199456793e17c Mon Sep 17 00:00:00 2001
> > +From: Thomas Kuehne <thomas@kuehne.cn>
> > +Date: Sat, 11 Dec 2021 20:56:00 +0000
> > +Subject: [PATCH] Fix return type of main function
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Fixes:
> > +xmlif/xmlif.l:242:1: warning: return type defaults to =E2=80=98int=E2=
=80=99 [-Wimplicit-int]
> > +  242 | main(int argc, char *argv[])
> > +      | ^~~~
> > +
> > +Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
> > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > +Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/8e34f087b=
f410bcc5fe445933d6ad9bae54f24b5?branch=3Dmaster]
> > +---
> > + xmlif/xmlif.l | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
> > +index ac42136..78a62bc 100644
> > +--- a/xmlif/xmlif.l
> > ++++ b/xmlif/xmlif.l
> > +@@ -239,7 +239,7 @@ WS         [ \t\n]*
> > +
> > + int yywrap() {exit(0);};
> > +
> > +-main(int argc, char *argv[])
> > ++int main(int argc, char *argv[])
> > + {
> > +     int i;
> > +
> > +@@ -265,7 +265,7 @@ main(int argc, char *argv[])
> > +           exit(1);
> > +       }
> > +
> > +-    yylex();
> > ++    return yylex();
> > + }
> > +
> > + /*
> > diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplici=
t-int-for-ifsense.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix=
-Wimplicit-int-for-ifsense.patch
> > new file mode 100644
> > index 0000000000..d5c25ba08a
> > --- /dev/null
> > +++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-f=
or-ifsense.patch
> > @@ -0,0 +1,33 @@
> > +From 1375e2df75530cd198bd16ac3de38e2b0d126276 Mon Sep 17 00:00:00 2001
> > +From: Thomas Kuehne <thomas@kuehne.cn>
> > +Date: Sat, 11 Dec 2021 21:10:41 +0100
> > +Subject: [PATCH] fix -Wimplicit-int for ifsense
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +fixes:
> > +xmlif/xmlif.l:46:8: warning: type defaults to =E2=80=98int=E2=80=99 in=
 declaration of =E2=80=98ifsense=E2=80=99 [-Wimplicit-int]
> > +   46 | static ifsense;                 /* sense of last `if' or unles=
s seen */
> > +      |        ^~~~~~~
> > +
> > +Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
> > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > +Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/1375e2df7=
5530cd198bd16ac3de38e2b0d126276?branch=3Dmaster
> > +---
> > + xmlif/xmlif.l | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
> > +index ac42136..6e5970e 100644
> > +--- a/xmlif/xmlif.l
> > ++++ b/xmlif/xmlif.l
> > +@@ -43,7 +43,7 @@
> > +
> > + static char **selections;     /* selection tokens */
> > + static int nselections;               /* number of selections */
> > +-static ifsense;                       /* sense of last `if' or unless=
 seen */
> > ++static int ifsense;           /* sense of last `if' or unless seen */
> > + static char *attribute;               /* last attribute scanned */
> > +
> > + struct stack_t {
> > diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes=
-devtools/xmlto/xmlto_0.0.28.bb
> > index 5cb9a4c57b..2c9ee27f82 100644
> > --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> > +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> > @@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf3365=
9b29e73d4adb9f9f6552"
> >
> >  SRC_URI =3D "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz \
> >             file://configure.in-drop-the-test-of-xmllint-and-xsltproc.p=
atch \
> > +           file://0001-Fix-return-type-of-main-function.patch \
> > +           file://0001-fix-Wimplicit-int-for-ifsense.patch \
> >  "
> >  SRC_URI[md5sum] =3D "a1fefad9d83499a15576768f60f847c6"
> >  SRC_URI[sha256sum] =3D "2f986b7c9a0e9ac6728147668e776d405465284e13c74d=
4146c9cbc51fd8aad3"
> > @@ -16,7 +18,7 @@ inherit autotools
> >
> >  CLEANBROKEN =3D "1"
> >
> > -DEPENDS =3D "libxml2-native"
> > +DEPENDS =3D "libxml2-native flex-native"
> >
> >  RDEPENDS:${PN} =3D "docbook-xml-dtd4 \
> >                    docbook-xsl-stylesheets \
> > --
> > 2.47.0
> >

