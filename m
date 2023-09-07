Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C90EC875A
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 19:58:56 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.23406.1694116734113780904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 12:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HzGtxkz7;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-501bef6e0d3so2285509e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 12:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694116732; x=1694721532; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gq8QQTxbWrjQprs67iJCQu2Y3TegSPa9na2XmGapGs=;
        b=HzGtxkz72r/ox3VNUM5emNydgIJkbNl9UDh3x4cwAbcMHjdtH7UxEdfqSac9jxaYD+
         qq1I0pZYFJIKbfKYZ21amT2gEvbOB++sbtp/9RT6XYda6dtE9nELaX05//otJX4VcZEf
         QbsxtnnNRYy+b0DV8v13QgBjsnLtocqK5XsYFXeGBbxYpx1Wb9X4A+xoreiNggzyznH9
         CAlnjGDJa/UH7lv6Ik9sWdjPzYlkVi9DxcDDxeclW3WYQ5z8Z/uV65IUz/5V67LImllU
         VmqwTTyDZqMQ7fz+Lxt+aeAFe0zsFGZpg/zQEVgE+HRuIWv0OAsDiptZS1UZMzSup5DH
         CpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694116732; x=1694721532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gq8QQTxbWrjQprs67iJCQu2Y3TegSPa9na2XmGapGs=;
        b=AEB1slW8bAlDSkcnTAEpu63Qb2+4CzC3K9NBp1lpjlIm4dXG9mYLAIs+1Njux/UHHr
         Lx7oZzLNh31pT7d4Q3tDcWhSfwoOPvul1v7FYzDIFi3h/ySB/lrQ1qNYED8IBQ1epOW/
         p5HDMypZtuQaK1pRjVk1qCpnPp5Lkl2w2uLKE6CRgwqPO/diWJC9zUvkv2TAGgjYcKhS
         YcCTNf3AhzlORdtQnblLn+4aC5WvlwHNnik7cH0423llMsipwd7bedaQPaeRG/THsZ8u
         NlPFVm0BvR14CqRgFGqySKQ4C6O7Tew5FHMx6vxrrW62Ua3QC1lKmTRw13he39pBTZ4n
         XgYQ==
X-Gm-Message-State: AOJu0YxoavQn8BXj7if2GkQqPPZbijuTFo+1a3X93A+edoFjmaeKCc2o
	BU2WvSBsmO3kfek0iake2kwoL04XIX5Z/0Yv5O0=
X-Google-Smtp-Source: AGHT+IEKvJ1MOi0zayJkyY5Kj+IYlDsLqLxt6Onow1LlAkVqkaaomXU7tTI1557oXXnqg8ooVTlCO8VjFoKSWbVbVPA=
X-Received: by 2002:ac2:5446:0:b0:500:9d4a:89ff with SMTP id
 d6-20020ac25446000000b005009d4a89ffmr288969lfn.62.1694116731802; Thu, 07 Sep
 2023 12:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-2-alex@linutronix.de>
 <CAMKF1sr9BdQCEnH5qV3Xg2GOQN=xuJt7cz-7+hLftY2jU-tWsw@mail.gmail.com>
In-Reply-To: <CAMKF1sr9BdQCEnH5qV3Xg2GOQN=xuJt7cz-7+hLftY2jU-tWsw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Sep 2023 21:58:40 +0200
Message-ID: <CANNYZj_7NSzjsL1UgejHrtK29QnFpn3qvD8AmSVcri8L4wQ1og@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/17] gettext: upgrade 0.21.1 -> 0.22
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 19:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187396

Probably same issue as
https://git.yoctoproject.org/poky/tree/meta/recipes-extended/procps/procps/=
0001-po-fr.po-address-failures-with-gettext-0.22.patch
?


Alex

On Thu, 7 Sept 2023 at 21:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> fontforge fails due to this see -
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3095/st=
eps/15/logs/stdio
>
> cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/build/po
> && /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/recipe-sysroot-native/usr/bin/msgfmt
> --check -o /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native=
/20230101/build/po/fr.mo
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:294:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 3, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:305:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 4, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:7435:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:19927:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:19935:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:19970:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:19986:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:20459:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:21045:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:21443:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:21772:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:24553:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:24564:
> 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> the directive number 2, the argument size specifier is invalid.
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/r=
ecipe-sysroot-native/usr/bin/msgfmt:
> found 13 fatal errors
>
> On Wed, Sep 6, 2023 at 9:56=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com> wrote:
> >
> > Drop autoconf-2.73.patch as upstream did update the gnulib.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../gettext-0.21.1/autoconf-2.73.patch        | 50 -------------------
> >  ...21.1.bb =3D> gettext-minimal-native_0.22.bb} |  0
> >  .../COPYING                                   |  0
> >  meta/recipes-core/gettext/gettext-sources.inc |  2 +-
> >  ...t-env.in-do-not-add-C-CXX-parameters.patch |  0
> >  ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  0
> >  .../parallel.patch                            |  0
> >  .../{gettext-0.21.1 =3D> gettext}/run-ptest     |  0
> >  .../serial-tests-config.patch                 |  0
> >  .../use-pkgconfig.patch                       |  0
> >  .../{gettext_0.21.1.bb =3D> gettext_0.22.bb}    |  3 +-
> >  11 files changed, 3 insertions(+), 52 deletions(-)
> >  delete mode 100644 meta/recipes-core/gettext/gettext-0.21.1/autoconf-2=
.73.patch
> >  rename meta/recipes-core/gettext/{gettext-minimal-native_0.21.1.bb =3D=
> gettext-minimal-native_0.22.bb} (100%)
> >  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-=
minimal}/COPYING (100%)
> >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/0001-in=
it-env.in-do-not-add-C-CXX-parameters.patch (100%)
> >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/0001-te=
sts-autopoint-3-unset-MAKEFLAGS.patch (100%)
> >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/paralle=
l.patch (100%)
> >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/run-pte=
st (100%)
> >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/serial-=
tests-config.patch (100%)
> >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/use-pkg=
config.patch (100%)
> >  rename meta/recipes-core/gettext/{gettext_0.21.1.bb =3D> gettext_0.22.=
bb} (99%)
> >
> > diff --git a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.pat=
ch b/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> > deleted file mode 100644
> > index ae5b2491bb8..00000000000
> > --- a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -The gnulib largefile macro needs updating to work with autoconf 2.73. =
Rather
> > -than the full code:
> > -
> > -https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=
=3Df91f633858cf132e50924224c50d6264a92caabb
> > -
> > -Just tweak the exiting code to work with 2.73. The next gettext upgrad=
e should
> > -update to new gnulib
> > -
> > -Upstream-Status: Inappropriate
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > -Index: gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- gettext-0.21.1.orig/gettext-runtime/gnulib-m4/largefile.m4
> > -+++ gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
> > -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> > - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69=
:
> > - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10=
.5,
> > - # or configures them incorrectly in some cases.
> > --m4_version_prereq([2.70], [], [
> > -+m4_version_prereq([2.73], [], [
> > -
> > - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> > - # -------------------------------
> > -Index: gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- gettext-0.21.1.orig/gettext-tools/gnulib-m4/largefile.m4
> > -+++ gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
> > -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> > - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69=
:
> > - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10=
.5,
> > - # or configures them incorrectly in some cases.
> > --m4_version_prereq([2.70], [], [
> > -+m4_version_prereq([2.73], [], [
> > -
> > - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> > - # -------------------------------
> > -Index: gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- gettext-0.21.1.orig/libtextstyle/gnulib-m4/largefile.m4
> > -+++ gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
> > -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> > - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69=
:
> > - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10=
.5,
> > - # or configures them incorrectly in some cases.
> > --m4_version_prereq([2.70], [], [
> > -+m4_version_prereq([2.73], [], [
> > -
> > - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> > - # -------------------------------
> > diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb=
 b/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb
> > rename to meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
> > diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING b=
/meta/recipes-core/gettext/gettext-minimal/COPYING
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING
> > rename to meta/recipes-core/gettext/gettext-minimal/COPYING
> > diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recip=
es-core/gettext/gettext-sources.inc
> > index da2860fbc85..b4fb6479161 100644
> > --- a/meta/recipes-core/gettext/gettext-sources.inc
> > +++ b/meta/recipes-core/gettext/gettext-sources.inc
> > @@ -1,4 +1,4 @@
> >  HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
> >  SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
> >             "
> > -SRC_URI[sha256sum] =3D "e8c3650e1d8cee875c4f355642382c1df83058bd5a11ee=
8555c0cf276d646d45"
> > +SRC_URI[sha256sum] =3D "49f089be11b490170bbf09ed2f51e5f5177f55be4cc665=
04a5861820e0fb06ab"
> > diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-=
do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext/0001-=
init-env.in-do-not-add-C-CXX-parameters.patch
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-d=
o-not-add-C-CXX-parameters.patch
> > rename to meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add=
-C-CXX-parameters.patch
> > diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopo=
int-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-=
autopoint-3-unset-MAKEFLAGS.patch
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoi=
nt-3-unset-MAKEFLAGS.patch
> > rename to meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unse=
t-MAKEFLAGS.patch
> > diff --git a/meta/recipes-core/gettext/gettext-0.21.1/parallel.patch b/=
meta/recipes-core/gettext/gettext/parallel.patch
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-0.21.1/parallel.patch
> > rename to meta/recipes-core/gettext/gettext/parallel.patch
> > diff --git a/meta/recipes-core/gettext/gettext-0.21.1/run-ptest b/meta/=
recipes-core/gettext/gettext/run-ptest
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-0.21.1/run-ptest
> > rename to meta/recipes-core/gettext/gettext/run-ptest
> > diff --git a/meta/recipes-core/gettext/gettext-0.21.1/serial-tests-conf=
ig.patch b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-0.21.1/serial-tests-confi=
g.patch
> > rename to meta/recipes-core/gettext/gettext/serial-tests-config.patch
> > diff --git a/meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.pat=
ch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patc=
h
> > rename to meta/recipes-core/gettext/gettext/use-pkgconfig.patch
> > diff --git a/meta/recipes-core/gettext/gettext_0.21.1.bb b/meta/recipes=
-core/gettext/gettext_0.22.bb
> > similarity index 99%
> > rename from meta/recipes-core/gettext/gettext_0.21.1.bb
> > rename to meta/recipes-core/gettext/gettext_0.22.bb
> > index a3eb3bba541..71e84521b0d 100644
> > --- a/meta/recipes-core/gettext/gettext_0.21.1.bb
> > +++ b/meta/recipes-core/gettext/gettext_0.22.bb
> > @@ -30,7 +30,6 @@ SRC_URI +=3D " \
> >             file://serial-tests-config.patch \
> >             file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
> >             file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
> > -           file://autoconf-2.73.patch \
> >             "
> >
> >  inherit autotools texinfo pkgconfig ptest
> > @@ -201,6 +200,8 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D "\
> >      glibc-charmap-euc-kr \
> >      glibc-gconv-euc-jp \
> >      glibc-charmap-euc-jp \
> > +    glibc-gconv-gb18030 \
> > +    glibc-charmap-gb18030 \
> >      locale-base-de-de \
> >      locale-base-fr-fr \
> >  "
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#187324): https://lists.openembedded.org/g/openembed=
ded-core/message/187324
> > Mute This Topic: https://lists.openembedded.org/mt/101197336/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

