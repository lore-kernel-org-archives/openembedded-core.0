Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9774DEC875B
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 20:15:26 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.23779.1694117724160810519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 13:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Lxq7bIOa;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1a1fa977667so1103169fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 13:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694117723; x=1694722523; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m025YjgGAAaiMFMaF7jpD4CpqcJwoKgAKGTeP31CqY8=;
        b=Lxq7bIOaSilAq9ZabRViyPg6NsOFMfvuNakuerrFbrOfjv5k0WVgVXkHl7u5rarEsJ
         WS0yLlzp4PFxyIcla0qfV4V8btk7YgOxxSBeS+2771uyOJLkHkUnsZBf6VcUP1dhCTAP
         Yie/w5xXZK0DA24Rkdu9nAG0Lgq4I1zUrVByK/dkUzOhixkSCddr9RAZ6tqsZaThrlcS
         7V7VqrenvBTYcb/zEXJcHgmhgAq6MLa2uIkiHOlNvz63TyDcCI2kbiz5iHzRI4Bi3cZj
         EYzb7YdIHLJrLeE3dGHMtBS8QHKPL4Hh0163EGxKHVE4TpYVZOmfkNhcH3an3SZrh7eY
         GcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694117723; x=1694722523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m025YjgGAAaiMFMaF7jpD4CpqcJwoKgAKGTeP31CqY8=;
        b=eo2nynuN5iklKIWDKTIXob/or3b6n0LJdHa6iwDWwcnAsqo2wI0YnPAdt/5cqYAjyR
         2FAv2E1OM9MNzH4NEjn/6g+mqy5vAZ+SzlffLernxndZPh9TjW87BDkZZkoqmWtDlzhQ
         WtzgyS8bbjv1yeEv7Iv7dyv1OM/aUtsYaGxY8xrrurbGzS2pOAfynS3HG5YA9XrPzLLL
         siIz29qWOhhdtMNg8lvxSP/pWNc0kz09zUebDMIiEGWWKesMHal8kUFmFyMAr7GRxBLx
         t8Y7T1svnzmx+S2IB7Q1mLBVl4A+hCW/T8wkCobPBZVR5TYLSYqnxndSFtTBxLLfUVGX
         MgTw==
X-Gm-Message-State: AOJu0YxAk1Kv0S2LLi16yPx/trFIj3f0LnsADTTcNf8BGbvP/eKrlJuW
	IyGXZtPi2I8jQ0rYDrn5m2Oy7Gm+MX94ISKp2cI=
X-Google-Smtp-Source: AGHT+IHyofCY2tyeuFFntqaMuT/Apse1aRofV8KkFnrdo7oCcongIO08XgWCvMut/hG3aP+u6NtHYLVYYo0i6rSraXg=
X-Received: by 2002:a05:6870:91d0:b0:1b0:5bf7:3bb6 with SMTP id
 c16-20020a05687091d000b001b05bf73bb6mr734224oaf.28.1694117723104; Thu, 07 Sep
 2023 13:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-2-alex@linutronix.de>
 <CAMKF1sr9BdQCEnH5qV3Xg2GOQN=xuJt7cz-7+hLftY2jU-tWsw@mail.gmail.com> <CANNYZj_7NSzjsL1UgejHrtK29QnFpn3qvD8AmSVcri8L4wQ1og@mail.gmail.com>
In-Reply-To: <CANNYZj_7NSzjsL1UgejHrtK29QnFpn3qvD8AmSVcri8L4wQ1og@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2023 13:15:12 -0700
Message-ID: <CAMKF1so=qEqT9QEYhPhSdBPe+zKh_WY+s3RJRVmdjZJGpp13Bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/17] gettext: upgrade 0.21.1 -> 0.22
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000017e8ab0604ca8555"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 20:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187397

--00000000000017e8ab0604ca8555
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 7, 2023 at 12:58 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Probably same issue as
>
> https://git.yoctoproject.org/poky/tree/meta/recipes-extended/procps/procp=
s/0001-po-fr.po-address-failures-with-gettext-0.22.patch
> ?
>

Yeah I have sent a patch to fix this. IMO it would be good to excercise
mera-oe AB job to catch such issues with version upgrade series so we know
what needs work on other layers


>
> Alex
>
> On Thu, 7 Sept 2023 at 21:12, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > fontforge fails due to this see -
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3095/st=
eps/15/logs/stdio
> >
> > cd
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/b=
uild/po
> > &&
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/r=
ecipe-sysroot-native/usr/bin/msgfmt
> > --check -o
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/b=
uild/po/fr.mo
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:294:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 3, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:305:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 4, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:7435:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:19927:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:19935:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:19970:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:19986:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:20459:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:21045:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:21443:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:21772:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:24553:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/g=
it/po/fr.po:24564:
> > 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
> > the directive number 2, the argument size specifier is invalid.
> >
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/r=
ecipe-sysroot-native/usr/bin/msgfmt:
> > found 13 fatal errors
> >
> > On Wed, Sep 6, 2023 at 9:56=E2=80=AFAM Alexander Kanavin <alex.kanavin@=
gmail.com>
> wrote:
> > >
> > > Drop autoconf-2.73.patch as upstream did update the gnulib.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  .../gettext-0.21.1/autoconf-2.73.patch        | 50 -----------------=
--
> > >  ...21.1.bb =3D> gettext-minimal-native_0.22.bb} |  0
> > >  .../COPYING                                   |  0
> > >  meta/recipes-core/gettext/gettext-sources.inc |  2 +-
> > >  ...t-env.in-do-not-add-C-CXX-parameters.patch |  0
> > >  ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  0
> > >  .../parallel.patch                            |  0
> > >  .../{gettext-0.21.1 =3D> gettext}/run-ptest     |  0
> > >  .../serial-tests-config.patch                 |  0
> > >  .../use-pkgconfig.patch                       |  0
> > >  .../{gettext_0.21.1.bb =3D> gettext_0.22.bb}    |  3 +-
> > >  11 files changed, 3 insertions(+), 52 deletions(-)
> > >  delete mode 100644
> meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> > >  rename meta/recipes-core/gettext/{gettext-minimal-native_0.21.1.bb
> =3D> gettext-minimal-native_0.22.bb} (100%)
> > >  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> gettext-minimal}/COPYING (100%)
> > >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> gettext}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)
> > >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> gettext}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
> > >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> gettext}/parallel.patch (100%)
> > >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> gettext}/run-ptest (100%)
> > >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> gettext}/serial-tests-config.patch (100%)
> > >  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> gettext}/use-pkgconfig.patch (100%)
> > >  rename meta/recipes-core/gettext/{gettext_0.21.1.bb =3D>
> gettext_0.22.bb} (99%)
> > >
> > > diff --git
> a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> b/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> > > deleted file mode 100644
> > > index ae5b2491bb8..00000000000
> > > --- a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> > > +++ /dev/null
> > > @@ -1,50 +0,0 @@
> > > -The gnulib largefile macro needs updating to work with autoconf 2.73=
.
> Rather
> > > -than the full code:
> > > -
> > > -
> https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=3D=
f91f633858cf132e50924224c50d6264a92caabb
> > > -
> > > -Just tweak the exiting code to work with 2.73. The next gettext
> upgrade should
> > > -update to new gnulib
> > > -
> > > -Upstream-Status: Inappropriate
> > > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > -
> > > -Index: gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
> > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > ---- gettext-0.21.1.orig/gettext-runtime/gnulib-m4/largefile.m4
> > > -+++ gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
> > > -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> > > - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.=
69:
> > > - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X
> 10.5,
> > > - # or configures them incorrectly in some cases.
> > > --m4_version_prereq([2.70], [], [
> > > -+m4_version_prereq([2.73], [], [
> > > -
> > > - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> > > - # -------------------------------
> > > -Index: gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
> > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > ---- gettext-0.21.1.orig/gettext-tools/gnulib-m4/largefile.m4
> > > -+++ gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
> > > -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> > > - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.=
69:
> > > - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X
> 10.5,
> > > - # or configures them incorrectly in some cases.
> > > --m4_version_prereq([2.70], [], [
> > > -+m4_version_prereq([2.73], [], [
> > > -
> > > - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> > > - # -------------------------------
> > > -Index: gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
> > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > ---- gettext-0.21.1.orig/libtextstyle/gnulib-m4/largefile.m4
> > > -+++ gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
> > > -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> > > - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.=
69:
> > > - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X
> 10.5,
> > > - # or configures them incorrectly in some cases.
> > > --m4_version_prereq([2.70], [], [
> > > -+m4_version_prereq([2.73], [], [
> > > -
> > > - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> > > - # -------------------------------
> > > diff --git a/meta/recipes-core/gettext/
> gettext-minimal-native_0.21.1.bb b/meta/recipes-core/gettext/
> gettext-minimal-native_0.22.bb
> > > similarity index 100%
> > > rename from meta/recipes-core/gettext/gettext-minimal-native_0.21.1.b=
b
> > > rename to meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
> > > diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING
> b/meta/recipes-core/gettext/gettext-minimal/COPYING
> > > similarity index 100%
> > > rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING
> > > rename to meta/recipes-core/gettext/gettext-minimal/COPYING
> > > diff --git a/meta/recipes-core/gettext/gettext-sources.inc
> b/meta/recipes-core/gettext/gettext-sources.inc
> > > index da2860fbc85..b4fb6479161 100644
> > > --- a/meta/recipes-core/gettext/gettext-sources.inc
> > > +++ b/meta/recipes-core/gettext/gettext-sources.inc
> > > @@ -1,4 +1,4 @@
> > >  HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
> > >  SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
> > >             "
> > > -SRC_URI[sha256sum] =3D
> "e8c3650e1d8cee875c4f355642382c1df83058bd5a11ee8555c0cf276d646d45"
> > > +SRC_URI[sha256sum] =3D
> "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"
> > > diff --git
> a/meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do-not-add-C-=
CXX-parameters.patch
> b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-par=
ameters.patch
> > > similarity index 100%
> > > rename from
> meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do-not-add-C-CX=
X-parameters.patch
> > > rename to
> meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-param=
eters.patch
> > > diff --git
> a/meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoint-3-unset-M=
AKEFLAGS.patch
> b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAG=
S.patch
> > > similarity index 100%
> > > rename from
> meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoint-3-unset-MAK=
EFLAGS.patch
> > > rename to
> meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.=
patch
> > > diff --git a/meta/recipes-core/gettext/gettext-0.21.1/parallel.patch
> b/meta/recipes-core/gettext/gettext/parallel.patch
> > > similarity index 100%
> > > rename from meta/recipes-core/gettext/gettext-0.21.1/parallel.patch
> > > rename to meta/recipes-core/gettext/gettext/parallel.patch
> > > diff --git a/meta/recipes-core/gettext/gettext-0.21.1/run-ptest
> b/meta/recipes-core/gettext/gettext/run-ptest
> > > similarity index 100%
> > > rename from meta/recipes-core/gettext/gettext-0.21.1/run-ptest
> > > rename to meta/recipes-core/gettext/gettext/run-ptest
> > > diff --git
> a/meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config.patch
> b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
> > > similarity index 100%
> > > rename from
> meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config.patch
> > > rename to meta/recipes-core/gettext/gettext/serial-tests-config.patch
> > > diff --git
> a/meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch
> b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
> > > similarity index 100%
> > > rename from
> meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch
> > > rename to meta/recipes-core/gettext/gettext/use-pkgconfig.patch
> > > diff --git a/meta/recipes-core/gettext/gettext_0.21.1.bb
> b/meta/recipes-core/gettext/gettext_0.22.bb
> > > similarity index 99%
> > > rename from meta/recipes-core/gettext/gettext_0.21.1.bb
> > > rename to meta/recipes-core/gettext/gettext_0.22.bb
> > > index a3eb3bba541..71e84521b0d 100644
> > > --- a/meta/recipes-core/gettext/gettext_0.21.1.bb
> > > +++ b/meta/recipes-core/gettext/gettext_0.22.bb
> > > @@ -30,7 +30,6 @@ SRC_URI +=3D " \
> > >             file://serial-tests-config.patch \
> > >             file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
> > >             file://0001-init-env.in-do-not-add-C-CXX-parameters.patch=
 \
> > > -           file://autoconf-2.73.patch \
> > >             "
> > >
> > >  inherit autotools texinfo pkgconfig ptest
> > > @@ -201,6 +200,8 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D "\
> > >      glibc-charmap-euc-kr \
> > >      glibc-gconv-euc-jp \
> > >      glibc-charmap-euc-jp \
> > > +    glibc-gconv-gb18030 \
> > > +    glibc-charmap-gb18030 \
> > >      locale-base-de-de \
> > >      locale-base-fr-fr \
> > >  "
> > > --
> > > 2.30.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#187324):
> https://lists.openembedded.org/g/openembedded-core/message/187324
> > > Mute This Topic: https://lists.openembedded.org/mt/101197336/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--00000000000017e8ab0604ca8555
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Sep 7, 2023 at 12:58 PM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Probably same issue as<br>
<a href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-extended/pro=
cps/procps/0001-po-fr.po-address-failures-with-gettext-0.22.patch" rel=3D"n=
oreferrer" target=3D"_blank">https://git.yoctoproject.org/poky/tree/meta/re=
cipes-extended/procps/procps/0001-po-fr.po-address-failures-with-gettext-0.=
22.patch</a><br>
?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah I have sent=
 a patch to fix this. IMO it would be good to excercise mera-oe AB job to c=
atch such issues with version upgrade series so we know what needs work on =
other layers</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
<br>
Alex<br>
<br>
On Thu, 7 Sept 2023 at 21:12, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; fontforge fails due to this see -<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/=
builds/3095/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3095/steps/15/=
logs/stdio</a><br>
&gt;<br>
&gt; cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023=
0101/build/po<br>
&gt; &amp;&amp; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-nat=
ive/20230101/recipe-sysroot-native/usr/bin/msgfmt<br>
&gt; --check -o /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-nat=
ive/20230101/build/po/fr.mo<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:294:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 3, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:305:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 4, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:7435:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:19927:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:19935:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:19970:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:19986:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:20459:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:21045:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:21443:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:21772:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:24553:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/git/po/fr.po:24564:<br>
&gt; &#39;msgstr&#39; is not a valid C format string, unlike &#39;msgid&#39=
;. Reason: In<br>
&gt; the directive number 2, the argument size specifier is invalid.<br>
&gt; /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2023010=
1/recipe-sysroot-native/usr/bin/msgfmt:<br>
&gt; found 13 fatal errors<br>
&gt;<br>
&gt; On Wed, Sep 6, 2023 at 9:56=E2=80=AFAM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Drop autoconf-2.73.patch as upstream did update the gnulib.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linut=
ronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../gettext-0.21.1/autoconf-2.73.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 50 -------------------<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://21.1.bb" rel=3D"noreferrer" target=3D"=
_blank">21.1.bb</a> =3D&gt; <a href=3D"http://gettext-minimal-native_0.22.b=
b" rel=3D"noreferrer" target=3D"_blank">gettext-minimal-native_0.22.bb</a>}=
 |=C2=A0 0<br>
&gt; &gt;=C2=A0 .../COPYING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 0<br>
&gt; &gt;=C2=A0 meta/recipes-core/gettext/gettext-sources.inc |=C2=A0 2 +-<=
br>
&gt; &gt;=C2=A0 ...t-env.in-do-not-add-C-CXX-parameters.patch |=C2=A0 0<br>
&gt; &gt;=C2=A0 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |=C2=A0 0<br>
&gt; &gt;=C2=A0 .../parallel.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt; &gt;=C2=A0 .../{gettext-0.21.1 =3D&gt; gettext}/run-ptest=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 0<br>
&gt; &gt;=C2=A0 .../serial-tests-config.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; &gt;=C2=A0 .../use-pkgconfig.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; &gt;=C2=A0 .../{<a href=3D"http://gettext_0.21.1.bb" rel=3D"noreferrer=
" target=3D"_blank">gettext_0.21.1.bb</a> =3D&gt; <a href=3D"http://gettext=
_0.22.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.22.bb</a>}=C2=A0 =
=C2=A0 |=C2=A0 3 +-<br>
&gt; &gt;=C2=A0 11 files changed, 3 insertions(+), 52 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/gettext/gettext-0.21.1=
/autoconf-2.73.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/gettext/{<a href=3D"http://gettext=
-minimal-native_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-min=
imal-native_0.21.1.bb</a> =3D&gt; <a href=3D"http://gettext-minimal-native_=
0.22.bb" rel=3D"noreferrer" target=3D"_blank">gettext-minimal-native_0.22.b=
b</a>} (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =
=3D&gt; gettext-minimal}/COPYING (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.21.1 =3D&gt; ge=
ttext}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.21.1 =3D&gt; ge=
ttext}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.21.1 =3D&gt; ge=
ttext}/parallel.patch (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.21.1 =3D&gt; ge=
ttext}/run-ptest (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.21.1 =3D&gt; ge=
ttext}/serial-tests-config.patch (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.21.1 =3D&gt; ge=
ttext}/use-pkgconfig.patch (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/gettext/{<a href=3D"http://gettext=
_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.21.1.bb</a> =3D&=
gt; <a href=3D"http://gettext_0.22.bb" rel=3D"noreferrer" target=3D"_blank"=
>gettext_0.22.bb</a>} (99%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.=
73.patch b/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index ae5b2491bb8..00000000000<br>
&gt; &gt; --- a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patc=
h<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,50 +0,0 @@<br>
&gt; &gt; -The gnulib largefile macro needs updating to work with autoconf =
2.73. Rather<br>
&gt; &gt; -than the full code:<br>
&gt; &gt; -<br>
&gt; &gt; -<a href=3D"https://git.savannah.gnu.org/cgit/gnulib.git/commit/m=
4/largefile.m4?id=3Df91f633858cf132e50924224c50d6264a92caabb" rel=3D"norefe=
rrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/gnulib.git/commit=
/m4/largefile.m4?id=3Df91f633858cf132e50924224c50d6264a92caabb</a><br>
&gt; &gt; -<br>
&gt; &gt; -Just tweak the exiting code to work with 2.73. The next gettext =
upgrade should<br>
&gt; &gt; -update to new gnulib<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt; &gt; -Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.or=
g</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -Index: gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- gettext-0.21.1.orig/gettext-runtime/gnulib-m4/largefile.m4<b=
r>
&gt; &gt; -+++ gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4<br>
&gt; &gt; -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],<br>
&gt; &gt; - # with _TIME_BITS.=C2=A0 Also, work around a problem in autocon=
f &lt;=3D 2.69:<br>
&gt; &gt; - # AC_SYS_LARGEFILE does not configure for large inodes on Mac O=
S X 10.5,<br>
&gt; &gt; - # or configures them incorrectly in some cases.<br>
&gt; &gt; --m4_version_prereq([2.70], [], [<br>
&gt; &gt; -+m4_version_prereq([2.73], [], [<br>
&gt; &gt; -<br>
&gt; &gt; - # _AC_SYS_LARGEFILE_TEST_INCLUDES<br>
&gt; &gt; - # -------------------------------<br>
&gt; &gt; -Index: gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- gettext-0.21.1.orig/gettext-tools/gnulib-m4/largefile.m4<br>
&gt; &gt; -+++ gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4<br>
&gt; &gt; -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],<br>
&gt; &gt; - # with _TIME_BITS.=C2=A0 Also, work around a problem in autocon=
f &lt;=3D 2.69:<br>
&gt; &gt; - # AC_SYS_LARGEFILE does not configure for large inodes on Mac O=
S X 10.5,<br>
&gt; &gt; - # or configures them incorrectly in some cases.<br>
&gt; &gt; --m4_version_prereq([2.70], [], [<br>
&gt; &gt; -+m4_version_prereq([2.73], [], [<br>
&gt; &gt; -<br>
&gt; &gt; - # _AC_SYS_LARGEFILE_TEST_INCLUDES<br>
&gt; &gt; - # -------------------------------<br>
&gt; &gt; -Index: gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- gettext-0.21.1.orig/libtextstyle/gnulib-m4/largefile.m4<br>
&gt; &gt; -+++ gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4<br>
&gt; &gt; -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],<br>
&gt; &gt; - # with _TIME_BITS.=C2=A0 Also, work around a problem in autocon=
f &lt;=3D 2.69:<br>
&gt; &gt; - # AC_SYS_LARGEFILE does not configure for large inodes on Mac O=
S X 10.5,<br>
&gt; &gt; - # or configures them incorrectly in some cases.<br>
&gt; &gt; --m4_version_prereq([2.70], [], [<br>
&gt; &gt; -+m4_version_prereq([2.73], [], [<br>
&gt; &gt; -<br>
&gt; &gt; - # _AC_SYS_LARGEFILE_TEST_INCLUDES<br>
&gt; &gt; - # -------------------------------<br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext-=
minimal-native_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-mini=
mal-native_0.21.1.bb</a> b/meta/recipes-core/gettext/<a href=3D"http://gett=
ext-minimal-native_0.22.bb" rel=3D"noreferrer" target=3D"_blank">gettext-mi=
nimal-native_0.22.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/gettext/<a href=3D"http://gettext-m=
inimal-native_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-minim=
al-native_0.21.1.bb</a><br>
&gt; &gt; rename to meta/recipes-core/gettext/<a href=3D"http://gettext-min=
imal-native_0.22.bb" rel=3D"noreferrer" target=3D"_blank">gettext-minimal-n=
ative_0.22.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/COP=
YING b/meta/recipes-core/gettext/gettext-minimal/COPYING<br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/COPY=
ING<br>
&gt; &gt; rename to meta/recipes-core/gettext/gettext-minimal/COPYING<br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta=
/recipes-core/gettext/gettext-sources.inc<br>
&gt; &gt; index da2860fbc85..b4fb6479161 100644<br>
&gt; &gt; --- a/meta/recipes-core/gettext/gettext-sources.inc<br>
&gt; &gt; +++ b/meta/recipes-core/gettext/gettext-sources.inc<br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/g=
ettext/gettext.html" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.or=
g/software/gettext/gettext.html</a>&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/gettext/gettext-${PV}.tar.g=
z \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;e8c3650e1d8cee875c4f355642382c1df83=
058bd5a11ee8555c0cf276d646d45&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;49f089be11b490170bbf09ed2f51e5f5177=
f55be4cc66504a5861820e0fb06ab&quot;<br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-init-e=
nv.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext=
/0001-init-env.in-do-not-add-C-CXX-parameters.patch<br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/gettext/gettext-0.21.1/0001-init-en=
v.in-do-not-add-C-CXX-parameters.patch<br>
&gt; &gt; rename to meta/recipes-core/gettext/gettext/0001-init-env.in-do-n=
ot-add-C-CXX-parameters.patch<br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-tests-=
autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-=
tests-autopoint-3-unset-MAKEFLAGS.patch<br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/gettext/gettext-0.21.1/0001-tests-a=
utopoint-3-unset-MAKEFLAGS.patch<br>
&gt; &gt; rename to meta/recipes-core/gettext/gettext/0001-tests-autopoint-=
3-unset-MAKEFLAGS.patch<br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/gettext-0.21.1/parallel.pa=
tch b/meta/recipes-core/gettext/gettext/parallel.patch<br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/gettext/gettext-0.21.1/parallel.pat=
ch<br>
&gt; &gt; rename to meta/recipes-core/gettext/gettext/parallel.patch<br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/gettext-0.21.1/run-ptest b=
/meta/recipes-core/gettext/gettext/run-ptest<br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/gettext/gettext-0.21.1/run-ptest<br=
>
&gt; &gt; rename to meta/recipes-core/gettext/gettext/run-ptest<br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/gettext-0.21.1/serial-test=
s-config.patch b/meta/recipes-core/gettext/gettext/serial-tests-config.patc=
h<br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/gettext/gettext-0.21.1/serial-tests=
-config.patch<br>
&gt; &gt; rename to meta/recipes-core/gettext/gettext/serial-tests-config.p=
atch<br>
&gt; &gt; diff --git a/meta/recipes-core/gettext/gettext-0.21.1/use-pkgconf=
ig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch<br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfi=
g.patch<br>
&gt; &gt; rename to meta/recipes-core/gettext/gettext/use-pkgconfig.patch<b=
r>
&gt; &gt; diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_=
0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.21.1.bb</a> b/met=
a/recipes-core/gettext/<a href=3D"http://gettext_0.22.bb" rel=3D"noreferrer=
" target=3D"_blank">gettext_0.22.bb</a><br>
&gt; &gt; similarity index 99%<br>
&gt; &gt; rename from meta/recipes-core/gettext/<a href=3D"http://gettext_0=
.21.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.21.1.bb</a><br>
&gt; &gt; rename to meta/recipes-core/gettext/<a href=3D"http://gettext_0.2=
2.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.22.bb</a><br>
&gt; &gt; index a3eb3bba541..71e84521b0d 100644<br>
&gt; &gt; --- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.21.1.=
bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.21.1.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.22.bb=
" rel=3D"noreferrer" target=3D"_blank">gettext_0.22.bb</a><br>
&gt; &gt; @@ -30,7 +30,6 @@ SRC_URI +=3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://serial-test=
s-config.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-=
autopoint-3-unset-MAKEFLAGS.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-init-e=
nv.in-do-not-add-C-CXX-parameters.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://autoconf-2.73.pa=
tch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit autotools texinfo pkgconfig ptest<br>
&gt; &gt; @@ -201,6 +200,8 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D &q=
uot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 glibc-charmap-euc-kr \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 glibc-gconv-euc-jp \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 glibc-charmap-euc-jp \<br>
&gt; &gt; +=C2=A0 =C2=A0 glibc-gconv-gb18030 \<br>
&gt; &gt; +=C2=A0 =C2=A0 glibc-charmap-gb18030 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 locale-base-de-de \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 locale-base-fr-fr \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.30.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#187324): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/187324" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/187324</a><b=
r>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101=
197336/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/101197336/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--00000000000017e8ab0604ca8555--

