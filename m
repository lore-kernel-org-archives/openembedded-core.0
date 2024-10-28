Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E040D3399E
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 16:01:02 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.55577.1730131254926243157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 09:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kmjKb0W0;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e2918664a3fso3832836276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730131254; x=1730736054; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DhtB8Jwv2sIjcTy7gn2Ngj01cRAu/FZBS+ia1lE6OQ=;
        b=kmjKb0W0roS7JPd5CFXfxBCziMRaCVBt4aW0/6C41Gup53NYlvEP/5MHvq/I9hW80n
         tpnDbhtw9JI4zmFoHEBL20EAvsiBq6han4ZK7n+3/Qer8UQkhpDUtJfkwDylQe4iYMMO
         xGLmnn5HvXcS5WiRHfsHHXHgVy7HlZ05JBynMQxbaDHF5OR+oT+hBe6hIudRk2A6QAnv
         ZoQMr6b0AAH1IzwmyfrjUxN26PziL6V5l8EoHPl5l+kitYLO1UAXNLm+jCfnG6XQcM0l
         55eHC9yXpN+2+bre6TLA037iTQnbaIxXP1zngf5t+FTeXpk6KAlSYyJ8hCMwXGUNSfua
         O5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730131254; x=1730736054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DhtB8Jwv2sIjcTy7gn2Ngj01cRAu/FZBS+ia1lE6OQ=;
        b=ZncC7bgByV222cIHn0oJ0U2nrsOVfdwOXfWf5XD0Z0i6ZnKf+hI4koRTGj8tTECQeW
         1H1ZkAPgLG8iF2OSjX8tiXHSzK2w/G61d29PZIGv3k8Ntcpl9ZBc/875KsmJwylQ4NxH
         kMz6yfwa4s2vw7l6VV92zLCt+pykJusaQ7S7n0wsr4fwCMl65zSvnDhC+guFbPz+gzk4
         5g/zvX+3bg9MCRZbUL4NnrQo0Z/C/+DHV1FYJFpFAVnUIOLK7ZkWPnn3CgsWwITSNvRQ
         FPn3CN3F/uPUnTvfqRxOb5mQYSldCchK1BDha/tVSfbUHjxg1eFaIzPPkK9BdpGiuplL
         5NqQ==
X-Gm-Message-State: AOJu0YyOoRvgYZx/I1wevC95ruBGM8A7ka7bzeZtALBTgxycPUM8TLMd
	w/UUXf4NIgvi64EdYzO7GRGz+bi1DgB1BidKgKzj1bmVxrSPO0sI7PvgOepi2+IO9UpjnuPFXCr
	UjnrBkOF2lOSTVAtpIo4cHxluWpzQtB6nPCUKLw==
X-Google-Smtp-Source: AGHT+IH4TWKGSTdu2/1S3CT5aZ2HxNjzxgRpGFZ8v864CEo1kLtHKG5t2a2nri2isCNMlqZ/8I7ZgofAC2kN+ntlBI0=
X-Received: by 2002:a05:6902:1587:b0:e30:6fde:c49c with SMTP id
 3f1490d57ef6-e30bc6291d8mr130383276.7.1730131253686; Mon, 28 Oct 2024
 09:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241027170119.2876289-1-martin.jansa@gmail.com>
 <CAOSpxdbdVd5e1HbQgK9cZpJBU-YP9JJRL=AUQ8M41XXiPrWEGA@mail.gmail.com>
 <18026806371753EE.19860@lists.openembedded.org> <CA+chaQfgHV99s7xJH7nwf4UrohB4M8kLWJ0kM-o92jK1K47cyw@mail.gmail.com>
In-Reply-To: <CA+chaQfgHV99s7xJH7nwf4UrohB4M8kLWJ0kM-o92jK1K47cyw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 28 Oct 2024 09:00:42 -0700
Message-ID: <CAOSpxdbnVTHKCCerUQRf=_nbytmw8JfagQGX2Sj15J0yTYstag@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] xmlto: backport a patch to fix build
 with gcc-14 on host
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 16:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206450

On Sun, Oct 27, 2024 at 2:06=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Not sure what else could be different on autobuilder, passed here with
> poky and poky-altcfg in ubuntu-22.04 as well:

I can't reproduce locally either :-(

The autobuilder isn't usable right now, but when it becomes available
I will try again there.

Steve

>
> poky/build $ bitbake -c cleansstate xmlto-native; bitbake -k xmlto-native
> Loading cache: 100%
> |########################################################################=
###########################################################################=
#######################################################|
> Time: 0:00:00
> Loaded 1646 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.0.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky-altcfg"
> DISTRO_VERSION       =3D "4.0.22"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "kirkstone:3632209ffafd2a7ca636fcf994b0da2fed3f1=
8f2"
>
> Initialising tasks: 100%
> |########################################################################=
###########################################################################=
##################################################|
> Time: 0:00:00
> Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0%
> match, 0% complete)
> NOTE: No setscene tasks
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be
> rerun and all succeeded.
> Loading cache: 100%
> |########################################################################=
###########################################################################=
#######################################################|
> Time: 0:00:00
> Loaded 1646 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.0.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky-altcfg"
> DISTRO_VERSION       =3D "4.0.22"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "kirkstone:3632209ffafd2a7ca636fcf994b0da2fed3f1=
8f2"
>
> Initialising tasks: 100%
> |########################################################################=
###########################################################################=
##################################################|
> Time: 0:00:00
> Sstate summary: Wanted 3 Local 0 Mirrors 0 Missed 3 Current 68 (0%
> match, 95% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 317 tasks of which 306 didn't need to
> be rerun and all succeeded.
>
> poky/build $ lsb_release -a
> No LSB modules are available.
> Distributor ID: Ubuntu
> Description:    Ubuntu 22.04 LTS
> Release:        22.04
> Codename:       jammy
>
> On Sun, Oct 27, 2024 at 9:06=E2=80=AFPM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Hi Steve,
> >
> > thanks, will try to reproduce it somehow.
> >
> > The command line in my successful build looks the same (so it might be
> > something in ylwrap itself):
> >
> > DEBUG: Executing python function autotools_aclocals
> > DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> > 'bit-64', 'x86_64-linux', 'common']
> > DEBUG: Python function autotools_aclocals finished
> > DEBUG: Executing shell function do_compile
> > NOTE: make -j 70 -l 140
> > make  all-am
> > make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.28-r0/b=
uild'
> > /bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l
> > lex.yy.c xmlif/xmlif.c -- flex
> > gcc  -DHAVE_CONFIG_H -I. -I../xmlto-0.0.28
> > -isystemwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-native/=
usr/include
> >  -isystemwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-native=
/usr/include
> > -O2 -pipe -c -o xmlif/xmlif.o xmlif/xmlif.c
> > gcc   -isystemwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-n=
ative/usr/include
> > -O2 -pipe  -Lwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-na=
tive/usr/lib
> >
> > -Lwork/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-native/lib
> >                       -Wl,--enable-new-dtags
> > -Wl,-rpath-link,work/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot=
-native/usr/lib
> >
> > -Wl,-rpath-link,work/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot=
-native/lib
> >
> > -Wl,-rpath,work/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-nati=
ve/usr/lib
> >
> > -Wl,-rpath,work/x86_64-linux/xmlto-native/0.0.28-r0/recipe-sysroot-nati=
ve/lib
> >                         -Wl,-O1 -Wl,--allow-shlib-undefined
> > -Wl,--dynamic-linker=3Dsysroots-uninative/x86_64-linux/lib/ld-linux-x86=
-64.so.2
> > -o xmlif/xmlif xmlif/xmlif.o
> > make[1]: Leaving directory 'work/x86_64-linux/xmlto-native/0.0.28-r0/bu=
ild'
> > DEBUG: Shell function do_compile finished
> >
> > And I was building it on ubuntu-24.10 while your error is from
> > ubuntu-22.04 and poky-altcfg, will try with older ubuntu and then with
> > altcfg to see if I happen to reproduce it locally.
> >
> > On Sun, Oct 27, 2024 at 8:54=E2=80=AFPM Steve Sakoman <steve@sakoman.co=
m> wrote:
> > >
> > > Unfortunately I'm getting an autobuilder failure with this patch:
> > >
> > > https://errors.yoctoproject.org/Errors/Details/810853/
> > >
> > > Steve
> > >
> > > On Sun, Oct 27, 2024 at 10:01=E2=80=AFAM Martin Jansa <martin.jansa@g=
mail.com> wrote:
> > > >
> > > > * need to add dependency on flex-native because now when the
> > > >   .l file is modified by the .patch file it will try to regenerate
> > > >   the c code and fail:
> > > >
> > > > | make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.2=
8-r0/build'
> > > > | /bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l .c=
 xmlif/xmlif.c -- /bin/bash 'work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto=
-0.0.28/missing' flex
> > > > | work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing: li=
ne 81: flex: command not found
> > > > | WARNING: 'flex' is missing on your system.
> > > > |          You should only need it if you modified a '.l' file.
> > > > |          You may want to install the Fast Lexical Analyzer packag=
e:
> > > > |          <https://github.com/westes/flex>
> > > >
> > > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > > ---
> > > >  ...001-Fix-return-type-of-main-function.patch | 42 +++++++++++++++=
++++
> > > >  .../0001-fix-Wimplicit-int-for-ifsense.patch  | 33 +++++++++++++++
> > > >  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |  4 +-
> > > >  3 files changed, 78 insertions(+), 1 deletion(-)
> > > >  create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-F=
ix-return-type-of-main-function.patch
> > > >  create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-f=
ix-Wimplicit-int-for-ifsense.patch
> > > >
> > > > diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-retu=
rn-type-of-main-function.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0=
001-Fix-return-type-of-main-function.patch
> > > > new file mode 100644
> > > > index 0000000000..f28f1fb56a
> > > > --- /dev/null
> > > > +++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type=
-of-main-function.patch
> > > > @@ -0,0 +1,42 @@
> > > > +From 6347e1b9da2140acdd55e3e7ac1199456793e17c Mon Sep 17 00:00:00 =
2001
> > > > +From: Thomas Kuehne <thomas@kuehne.cn>
> > > > +Date: Sat, 11 Dec 2021 20:56:00 +0000
> > > > +Subject: [PATCH] Fix return type of main function
> > > > +MIME-Version: 1.0
> > > > +Content-Type: text/plain; charset=3DUTF-8
> > > > +Content-Transfer-Encoding: 8bit
> > > > +
> > > > +Fixes:
> > > > +xmlif/xmlif.l:242:1: warning: return type defaults to =E2=80=98int=
=E2=80=99 [-Wimplicit-int]
> > > > +  242 | main(int argc, char *argv[])
> > > > +      | ^~~~
> > > > +
> > > > +Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
> > > > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > > +Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/8e34f=
087bf410bcc5fe445933d6ad9bae54f24b5?branch=3Dmaster]
> > > > +---
> > > > + xmlif/xmlif.l | 4 ++--
> > > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
> > > > +index ac42136..78a62bc 100644
> > > > +--- a/xmlif/xmlif.l
> > > > ++++ b/xmlif/xmlif.l
> > > > +@@ -239,7 +239,7 @@ WS         [ \t\n]*
> > > > +
> > > > + int yywrap() {exit(0);};
> > > > +
> > > > +-main(int argc, char *argv[])
> > > > ++int main(int argc, char *argv[])
> > > > + {
> > > > +     int i;
> > > > +
> > > > +@@ -265,7 +265,7 @@ main(int argc, char *argv[])
> > > > +           exit(1);
> > > > +       }
> > > > +
> > > > +-    yylex();
> > > > ++    return yylex();
> > > > + }
> > > > +
> > > > + /*
> > > > diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimp=
licit-int-for-ifsense.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001=
-fix-Wimplicit-int-for-ifsense.patch
> > > > new file mode 100644
> > > > index 0000000000..d5c25ba08a
> > > > --- /dev/null
> > > > +++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-i=
nt-for-ifsense.patch
> > > > @@ -0,0 +1,33 @@
> > > > +From 1375e2df75530cd198bd16ac3de38e2b0d126276 Mon Sep 17 00:00:00 =
2001
> > > > +From: Thomas Kuehne <thomas@kuehne.cn>
> > > > +Date: Sat, 11 Dec 2021 21:10:41 +0100
> > > > +Subject: [PATCH] fix -Wimplicit-int for ifsense
> > > > +MIME-Version: 1.0
> > > > +Content-Type: text/plain; charset=3DUTF-8
> > > > +Content-Transfer-Encoding: 8bit
> > > > +
> > > > +fixes:
> > > > +xmlif/xmlif.l:46:8: warning: type defaults to =E2=80=98int=E2=80=
=99 in declaration of =E2=80=98ifsense=E2=80=99 [-Wimplicit-int]
> > > > +   46 | static ifsense;                 /* sense of last `if' or u=
nless seen */
> > > > +      |        ^~~~~~~
> > > > +
> > > > +Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
> > > > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > > +Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/1375e=
2df75530cd198bd16ac3de38e2b0d126276?branch=3Dmaster
> > > > +---
> > > > + xmlif/xmlif.l | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
> > > > +index ac42136..6e5970e 100644
> > > > +--- a/xmlif/xmlif.l
> > > > ++++ b/xmlif/xmlif.l
> > > > +@@ -43,7 +43,7 @@
> > > > +
> > > > + static char **selections;     /* selection tokens */
> > > > + static int nselections;               /* number of selections */
> > > > +-static ifsense;                       /* sense of last `if' or un=
less seen */
> > > > ++static int ifsense;           /* sense of last `if' or unless see=
n */
> > > > + static char *attribute;               /* last attribute scanned *=
/
> > > > +
> > > > + struct stack_t {
> > > > diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/rec=
ipes-devtools/xmlto/xmlto_0.0.28.bb
> > > > index 5cb9a4c57b..2c9ee27f82 100644
> > > > --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> > > > +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> > > > @@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf=
33659b29e73d4adb9f9f6552"
> > > >
> > > >  SRC_URI =3D "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz =
\
> > > >             file://configure.in-drop-the-test-of-xmllint-and-xsltpr=
oc.patch \
> > > > +           file://0001-Fix-return-type-of-main-function.patch \
> > > > +           file://0001-fix-Wimplicit-int-for-ifsense.patch \
> > > >  "
> > > >  SRC_URI[md5sum] =3D "a1fefad9d83499a15576768f60f847c6"
> > > >  SRC_URI[sha256sum] =3D "2f986b7c9a0e9ac6728147668e776d405465284e13=
c74d4146c9cbc51fd8aad3"
> > > > @@ -16,7 +18,7 @@ inherit autotools
> > > >
> > > >  CLEANBROKEN =3D "1"
> > > >
> > > > -DEPENDS =3D "libxml2-native"
> > > > +DEPENDS =3D "libxml2-native flex-native"
> > > >
> > > >  RDEPENDS:${PN} =3D "docbook-xml-dtd4 \
> > > >                    docbook-xsl-stylesheets \
> > > > --
> > > > 2.47.0
> > > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#206413): https://lists.openembedded.org/g/openembed=
ded-core/message/206413
> > Mute This Topic: https://lists.openembedded.org/mt/109242697/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

