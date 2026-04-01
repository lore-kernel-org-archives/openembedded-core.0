Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EF410FCAD2
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 20:33:54 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1354.1775075627106423792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 13:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gbOiaQ1W;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6501d242e3fso213815d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 13:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775075626; cv=none;
        d=google.com; s=arc-20240605;
        b=PtzTDkJ/Y+3cIRmIeh9RK3fUuKCVA/87Mfv2mX0t259O/JcQ+Jur1JX5Aqo2vwWas/
         xHKm8GVrLWYVxLEbEH4Z6/1aiLtV/J6dv1td8vWzJZXazi7Ojh3Xn5OObOFNhS5vLSm2
         49HmJIBRDDHgVbCVNNYkLJJGC9O20TvYMwAAP7OcWuSSupQ3Z+lubDXFgGKA6OLMOLZf
         MGS3z5d4uGX1GZb209c/ulI6rGBebNiHJGwSroiQt0Rs0esCukQetpur/NoSOuRx9tzB
         gr88m8h7kXVaq0olz/3+h6kXCNAimVzdRzNu3w0M6HEXH9DAVldpy/kf5LMMfd+5BDdH
         pFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EVAjuEoZ6CBpyJm/6zdPsdkqvM4hlYqks9j/j2v8jZY=;
        fh=7dR4I8jTai6uatR3gxGQXCKVOxcSmDot2B+5Q38XfCE=;
        b=l0rYBAn8/0pZaFSgSw9WUmTXYoVAY1ZB/GjqPx5U2XHiCS/eoINwFJfDxyw2QNMQLv
         rfRxkJEd+gRdnYHwg2kmumRQPAMnEB7GIB53tUz82Mmb2ED9rLrYBzoDN1uZKoGrv0LN
         T4heKUOPxgbtiAPBx9rrk9VL0TKYtaDj6d6Z1ch6XlqOw0OXhPnkqz+oTW4raIBrRTgS
         /3gXRmgSXw6BB9TJbL4qG0ULsXaI8+u7ggKq7GLyPerP/r81hdPv9tIIRQzAE/eV15fX
         gRIwmfxNoMG9StRIHQId22AZ3q410z8dZgqz/cByvM6KxiNynylLhDk6P84pDgAzdhoG
         p1fg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775075626; x=1775680426; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EVAjuEoZ6CBpyJm/6zdPsdkqvM4hlYqks9j/j2v8jZY=;
        b=gbOiaQ1WNm65Hrh3p34XYEN4+ZjGyJyGY/zbNyAFuOHdh/9slgk07MJM4rFUdvJJ+Q
         L8oS0ae5BTdXGZath7qj2idjHXLNChd6T7uJqaexh/ZIFdE5pH5B0kdt2EmZb+gP7OOf
         gwRjpOM80viA0UBUXAewZITs02tAObEpjsbrZ+ecsBst9Ah0dWjvoVsSTWRiorTqv1sY
         2i67FuURMOkzz3XzzQoSjjV0J5e0pDPVTBBCpFHr/MPcCqJcIzv6X93pPBbh2aI49yq8
         x9St2+KdmZqhXQNFq75g/PDjo/+iP8PHPK6686jgbe0ae7ny8FeBwyFNgxzWEi6EJIcO
         /QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775075626; x=1775680426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVAjuEoZ6CBpyJm/6zdPsdkqvM4hlYqks9j/j2v8jZY=;
        b=JMheTrJCziwzif16W3eBcYsl3vmM/ta1++vX8Kkxp9uvFVgg1lJGkC04vEiAJ/p5eZ
         hiJo/lz23KpBP+CneVfElx2VkysgF9GcOYW3sZUc1X9/ZFe6cUXAgR0s84UkaBNhTrwk
         IA90hn9seQr2Z7tjGpxXyqcYxI5hD8dG9qAe2zvIZh9Ctj8BEV80yFYVQrNM5S/KPGbS
         B0oGTgQmptvL3J8vvnaCne8UhCfoZCJTiN5FllayVud9IWHEGaFyMA98UL/GUlO0dc6e
         5dEN8B7vDrxhSSm6ztvG3DfFn1d+4sB+tOQCWHbaMNAQR/qPOobDNfZrRRaI/0jQNfj+
         tXRw==
X-Gm-Message-State: AOJu0YxQwrbg1v+wf/SdR+PcVjpIZV+oAz6OZQkp4GPeUSmlSW2uMo6c
	MffEptbz1H5nK4Z5JHhyP3f0QlLq1cbQBbw6sfa6bHswEsJvXooqfO5bm6Az083b20hvM05aLQu
	BIoWjvCT3brIOvTeloauD8HVwPH5Q95gec9BH
X-Gm-Gg: ATEYQzwAJt5V4KALgFvLz61+gXWrbbrQAKMZqECsmjAVisZILVTPrSDptt/7zsnyeD8
	IRJimgfsTGxjnQUeM3m2LSzLPeHyXlt2vdJtCinAVJMe/3zxp1A6Px0S8hrc1RPCzc7j9j8S1P4
	v3+Jd7BbSXXNe/7OrpPDJ3EyQBIQeBy7oxkpWYmXD5tR71HotCXdXZGPxDhdCb5cXES/7nC643i
	J1OpGtFLrKmvzDQN0AP/XTk5kyRAgaE+BupGL6nfHlBr5xqVSu7Y3Hy6uXNdxax3zgYhGor+yxX
	MkyzdO4OCO/d2E5MockJPVutSIQxIu3WUSoRcfRgDt8xLIrjzncznIlp33kBugFt6PQdFEaYbBr
	pG4h6ghmsuXQEvAmKtMbzFyAt1YfSho0G7Ps=
X-Received: by 2002:a05:690e:441a:b0:649:aec8:a66a with SMTP id
 956f58d0204a3-6502fcd37ddmr3709176d50.0.1775075625996; Wed, 01 Apr 2026
 13:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260330132825.1784802-1-ross.burton@arm.com> <20260330132825.1784802-3-ross.burton@arm.com>
 <FDFC46B5-DAD2-4885-BA62-AAE6F2389F03@arm.com>
In-Reply-To: <FDFC46B5-DAD2-4885-BA62-AAE6F2389F03@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Apr 2026 13:33:18 -0700
X-Gm-Features: AQROBzBRnPpl7-FKO3bSSB9wSzk6o44Wy2NMxO-FokUrwo8nn5szWi9Kz-AVF38
Message-ID: <CAMKF1soVrVe3C7G4gzQA5-w07NA+yctDiNED_YpwPObdorYeOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] autoconf: upgrade to 2.73
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000231649064e6c005e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 20:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234459

--000000000000231649064e6c005e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

btw. This version of autotools enforces C23 standard for C code (
-std=3Dgnu23 ), while good in general for code hygiene, it will push portin=
g
work for these packages.
since it is going to break quite a few of them, I ran a build including
meta-e and the count is 30-35

On Mon, Mar 30, 2026 at 6:32=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Note that I did a test build on the AB and there was one failure:
>
> | In file included from ./base/genconf.c:18:
> | ./base/stdpre.h:350:13: error: two or more data types in declaration
> specifiers
> |   350 | typedef int bool;
> |       |             ^~~~
>
>
> This was building native code in the cross build, on alma8.
>
> I=E2=80=99m not sure if this was a weird bug that has existed for some ti=
me on
> some hosts but uninative hides it, or the same but new with autoconf 2.73=
.
>
> I shall look into this, but I wanted to get the patches on the list.
>
> Ross
>
> > On 30 Mar 2026, at 14:28, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > man-host-perl.patch and autoreconf-exclude.patch are now upstream.
> >
> > Remove a hunk from autotest-automake-result-format.patch that has no
> > purpose.
> >
> > License-Update: postal address changed.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> > .../autoconf/autoreconf-exclude.patch         | 121 ------------------
> > .../autotest-automake-result-format.patch     |  15 ---
> > .../autoconf/autoconf/man-host-perl.patch     |  31 -----
> > .../{autoconf_2.72.bb =3D> autoconf_2.73.bb}    |  19 +--
> > 4 files changed, 7 insertions(+), 179 deletions(-)
> > delete mode 100644
> meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
> > delete mode 100644
> meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
> > rename meta/recipes-devtools/autoconf/{autoconf_2.72.bb =3D>
> autoconf_2.73.bb} (81%)
> >
> > diff --git
> a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
> b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
> > deleted file mode 100644
> > index 28141962008..00000000000
> > --- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
> > +++ /dev/null
> > @@ -1,121 +0,0 @@
> > -From 1a50157aa11da48921200a0d8d4308863716eab0 Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@intel.com>
> > -Date: Thu, 12 Mar 2020 17:25:23 +0000
> > -Subject: [PATCH] autoreconf-exclude.patch
> > -
> > -Upstream-Status: Inappropriate [oe specific]
> > -
> > ----
> > - bin/autoreconf.in | 26 ++++++++++++++++++++++++++
> > - 1 file changed, 26 insertions(+)
> > -
> > -diff --git a/bin/autoreconf.in b/bin/autoreconf.in
> > -index 98ebab6..937f758 100644
> > ---- a/bin/autoreconf.in
> > -+++ b/bin/autoreconf.in
> > -@@ -83,6 +83,7 @@ Operation modes:
> > -   -i, --install            copy missing standard auxiliary files
> > -       --no-recursive       don't rebuild sub-packages
> > -   -s, --symlink            with -i, install symbolic links instead of
> copies
> > -+  -x, --exclude=3DSTEPS      steps we should not run
> > -   -m, --make               when applicable, re-run ./configure && mak=
e
> > -   -W, --warnings=3DCATEGORY  report the warnings falling in CATEGORY
> > -                            (comma-separated list accepted)
> > -@@ -141,6 +142,10 @@ my $run_make =3D 0;
> > - # Recurse into subpackages
> > - my $recursive =3D 1;
> > -
> > -+# Steps to exclude
> > -+my @exclude;
> > -+my @ex;
> > -+
> > - ## ---------- ##
> > - ## Routines.  ##
> > - ## ---------- ##
> > -@@ -161,6 +166,7 @@ sub parse_args ()
> > -  'B|prepend-include=3Ds' =3D> \@prepend_include,
> > -  'i|install'            =3D> \$install,
> > -  's|symlink'            =3D> \$symlink,
> > -+    'x|exclude=3Ds'          =3D> \@exclude,
> > -  'm|make'               =3D> \$run_make,
> > -  'recursive!'           =3D> \$recursive);
> > -
> > -@@ -170,6 +176,8 @@ sub parse_args ()
> > -   parse_WARNINGS;
> > -   parse_warnings @warning;
> > -
> > -+  @exclude =3D map { split /,/ } @exclude;
> > -+
> > -   # Even if the user specified a configure.ac, trim to get the
> > -   # directory, and look for configure.ac again.  Because (i) the code
> > -   # is simpler, and (ii) we are still able to diagnose simultaneous
> > -@@ -493,8 +501,11 @@ sub autoreconf_current_directory ($)
> > -     }
> > -   else
> > -     {
> > -+      @ex =3D grep (/^autopoint$/, @exclude);
> > -+      if ($#ex =3D=3D -1) {
> > -       xsystem_hint ("autopoint is needed because this package uses
> Gettext",
> > -                     $autopoint);
> > -+      }
> > -     }
> > -
> > -
> > -@@ -691,9 +702,12 @@ sub autoreconf_current_directory ($)
> > - {
> > -  $libtoolize .=3D " --ltdl";
> > - }
> > -+      @ex =3D grep (/^libtoolize$/, @exclude);
> > -+      if ($#ex =3D=3D -1) {
> > -       xsystem_hint ("libtoolize is needed because this package uses
> Libtool",
> > -    $libtoolize);
> > -       $rerun_aclocal =3D 1;
> > -+      }
> > -     }
> > -   else
> > -     {
> > -@@ -730,8 +744,11 @@ sub autoreconf_current_directory ($)
> > -     }
> > -   elsif ($install)
> > -     {
> > -+      @ex =3D grep (/^gtkdocize$/, @exclude);
> > -+      if ($#ex =3D=3D -1) {
> > -       xsystem_hint ("gtkdocize is needed because this package uses
> Gtkdoc",
> > -    $gtkdocize);
> > -+      }
> > -     }
> > -   else
> > -     {
> > -@@ -769,7 +786,10 @@ sub autoreconf_current_directory ($)
> > -   # latter runs the former, and (ii) autoconf is stricter than
> > -   # autoheader.  So all in all, autoconf should give better error
> > -   # messages.
> > -+  @ex =3D grep (/^autoconf$/, @exclude);
> > -+  if ($#ex =3D=3D -1) {
> > -   xsystem ($autoconf);
> > -+  }
> > -
> > -
> > -   # -------------------- #
> > -@@ -790,7 +810,10 @@ sub autoreconf_current_directory ($)
> > -     }
> > -   else
> > -     {
> > -+      @ex =3D grep (/^autoheader$/, @exclude);
> > -+      if ($#ex =3D=3D -1) {
> > -       xsystem ($autoheader);
> > -+      }
> > -     }
> > -
> > -
> > -@@ -807,7 +830,10 @@ sub autoreconf_current_directory ($)
> > -       # We should always run automake, and let it decide whether it
> shall
> > -       # update the file or not.  In fact, the effect of '$force' is
> already
> > -       # included in '$automake' via '--no-force'.
> > -+      @ex =3D grep (/^automake$/, @exclude);
> > -+      if ($#ex =3D=3D -1) {
> > -       xsystem ($automake);
> > -+      }
> > -     }
> > -
> > -   # ---------------------------------------------------- #
> > diff --git
> a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format=
.patch
> b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format=
.patch
> > index 38725574bac..d88e16b52fb 100644
> > ---
> a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format=
.patch
> > +++
> b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format=
.patch
> > @@ -34,21 +34,6 @@ index bf18866..8097523 100644
> >      [[0-9] | [0-9][0-9] | [0-9][0-9][0-9] | [0-9][0-9][0-9][0-9]])
> >   at_fn_validate_ranges at_option
> >   AS_VAR_APPEND([at_groups], ["$at_option$as_nl"])
> > -@@ -728,10 +735,10 @@ m4_divert_push([HELP_MODES])dnl
> > - cat <<_ATEOF || at_write_fail=3D1
> > -
> > - Operation modes:
> > --  -h, --help     print the help message, then exit
> > --  -V, --version  print version number, then exit
> > --  -c, --clean    remove all the files this test suite might create an=
d
> exit
> > --  -l, --list     describes all the tests, or the selected TESTS
> > -+  -h, --help      print the help message, then exit
> > -+  -V, --version   print version number, then exit
> > -+  -c, --clean     remove all the files this test suite might create
> and exit
> > -+  -l, --list      describes all the tests, or the selected TESTS
> > - _ATEOF
> > - m4_divert_pop([HELP_MODES])dnl
> > - m4_wrap([m4_divert_push([HELP_TUNING_BEGIN])dnl
> > @@ -757,6 +764,7 @@ Execution tuning:
> >    -d, --debug    inhibit clean up and top-level logging
> >  [                 default for debugging scripts]
> > diff --git a/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patc=
h
> b/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
> > deleted file mode 100644
> > index 0f49583a641..00000000000
> > --- a/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From 1c033f2a23941c46d88b9ac279f87bf2c6e99499 Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@arm.com>
> > -Date: Wed, 15 Jul 2020 16:03:21 +0100
> > -Subject: [PATCH] Don't use the target perl when regenerating the man
> pages.
> > -
> > -Upstream-Status: Inappropriate
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > ----
> > - man/local.mk | 3 +--
> > - 1 file changed, 1 insertion(+), 2 deletions(-)
> > -
> > -diff --git a/man/local.mk b/man/local.mk
> > -index 775c131..ba94753 100644
> > ---- a/man/local.mk
> > -+++ b/man/local.mk
> > -@@ -77,13 +77,12 @@ SUFFIXES +=3D .w .1
> > - @echo "Updating man page $@"
> > - $(MKDIR_P) $(@D)
> > - PATH=3D"$(top_srcdir)/man$(PATH_SEPARATOR)$$PATH"; \
> > -- PERL=3D"$(PERL)"; \
> > - PACKAGE_NAME=3D"$(PACKAGE_NAME)"; \
> > - VERSION=3D"$(VERSION)"; \
> > - RELEASE_YEAR=3D"$(RELEASE_YEAR)"; \
> > - top_srcdir=3D"$(top_srcdir)"; \
> > - channeldefs_pm=3D"$(channeldefs_pm)"; \
> > -- export PATH PERL PACKAGE_NAME VERSION RELEASE_YEAR; \
> > -+ export PATH PACKAGE_NAME VERSION RELEASE_YEAR; \
> > - export top_srcdir channeldefs_pm; \
> > - $(HELP2MAN) \
> > -    --include=3D$(srcdir)/$*.x \
> > diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> b/meta/recipes-devtools/autoconf/autoconf_2.73.bb
> > similarity index 81%
> > rename from meta/recipes-devtools/autoconf/autoconf_2.72.bb
> > rename to meta/recipes-devtools/autoconf/autoconf_2.73.bb
> > index b599f270c79..2dd8fb27721 100644
> > --- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> > +++ b/meta/recipes-devtools/autoconf/autoconf_2.73.bb
> > @@ -8,27 +8,22 @@ SECTION =3D "devel"
> > DEPENDS =3D "m4-native autoconf-native automake-native gnu-config-nativ=
e
> help2man-native"
> > DEPENDS:remove:class-native =3D "autoconf-native automake-native
> help2man-native"
> >
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb7fbaa3=
ef16c
> \
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12=
a6dce
> \
> >    file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e440464"
> >
> > SRC_URI =3D " \
> >            ${GNU_MIRROR}/autoconf/${BP}.tar.gz \
> >            file://program_prefix.patch \
> > -           file://autoreconf-exclude.patch \
> >            file://remove-usr-local-lib-from-m4.patch \
> >            file://preferbash.patch \
> >            file://autotest-automake-result-format.patch \
> > -           file://man-host-perl.patch \
> > "
> > SRC_URI:append:class-native =3D " file://no-man.patch"
> >
> > -SRC_URI[sha256sum] =3D
> "afb181a76e1ee72832f6581c0eddf8df032b83e2e0239ef79ebedc4467d92d6e"
> > +SRC_URI[sha256sum] =3D
> "259ddfa3bddc799cfb81489cc0f17dfdf1bd6d1505dda53c0f45ff60d6a4f9a7"
> >
> > -# Remove this when upgrading past 2.72, as package managers sort 2.72e
> (the
> > -# fifth release candidate) after 2.72.
> > -PKGV =3D "2.72e+really${PV}"
> > -
> > -RDEPENDS:${PN} =3D "m4 gnu-config \
> > +RDEPENDS:${PN} =3D "m4 \
> > +  gnu-config \
> >  perl \
> >  perl-module-bytes \
> >  perl-module-carp \
> > @@ -45,13 +40,13 @@ RDEPENDS:${PN} =3D "m4 gnu-config \
> >  perl-module-file-spec \
> >  perl-module-file-spec-unix \
> >  perl-module-file-stat \
> > -                  perl-module-file-temp \
> > +  perl-module-file-temp \
> >  perl-module-getopt-long \
> >  perl-module-io-file \
> > -                  perl-module-list-util \
> > +  perl-module-list-util \
> >  perl-module-overloading \
> >  perl-module-posix \
> > -                  perl-module-scalar-util \
> > +  perl-module-scalar-util \
> >  perl-module-symbol \
> >  perl-module-thread-queue \
> >  perl-module-threads \
> > --
> > 2.43.0
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234237):
> https://lists.openembedded.org/g/openembedded-core/message/234237
> Mute This Topic: https://lists.openembedded.org/mt/118578414/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000231649064e6c005e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">btw. This=C2=A0version of autotools enforces C23 standard =
for C code ( -std=3Dgnu23 ), while good in general for code hygiene, it wil=
l push porting work for=C2=A0these packages.<div>since it is going to break=
 quite a few of them, I ran a build including meta-e and the count is 30-35=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 30, 2026 at 6:32=E2=80=AFAM Ross =
Burton via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org">ar=
m.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Note that I did a test build on the AB and ther=
e was one failure:<br>
<br>
| In file included from ./base/genconf.c:18:<br>
| ./base/stdpre.h:350:13: error: two or more data types in declaration spec=
ifiers<br>
|=C2=A0 =C2=A0350 | typedef int bool;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~<br>
<br>
<br>
This was building native code in the cross build, on alma8.<br>
<br>
I=E2=80=99m not sure if this was a weird bug that has existed for some time=
 on some hosts but uninative hides it, or the same but new with autoconf 2.=
73.<br>
<br>
I shall look into this, but I wanted to get the patches on the list.<br>
<br>
Ross<br>
<br>
&gt; On 30 Mar 2026, at 14:28, Ross Burton via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" targ=
et=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; man-host-perl.patch and autoreconf-exclude.patch are now upstream.<br>
&gt; <br>
&gt; Remove a hunk from autotest-automake-result-format.patch that has no<b=
r>
&gt; purpose.<br>
&gt; <br>
&gt; License-Update: postal address changed.<br>
&gt; <br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt; .../autoconf/autoreconf-exclude.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 121 ------------------<br>
&gt; .../autotest-automake-result-format.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
5 ---<br>
&gt; .../autoconf/autoconf/man-host-perl.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 3=
1 -----<br>
&gt; .../{<a href=3D"http://autoconf_2.72.bb" rel=3D"noreferrer" target=3D"=
_blank">autoconf_2.72.bb</a> =3D&gt; <a href=3D"http://autoconf_2.73.bb" re=
l=3D"noreferrer" target=3D"_blank">autoconf_2.73.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 19 +--<br>
&gt; 4 files changed, 7 insertions(+), 179 deletions(-)<br>
&gt; delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-=
exclude.patch<br>
&gt; delete mode 100644 meta/recipes-devtools/autoconf/autoconf/man-host-pe=
rl.patch<br>
&gt; rename meta/recipes-devtools/autoconf/{<a href=3D"http://autoconf_2.72=
.bb" rel=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a> =3D&gt; <a h=
ref=3D"http://autoconf_2.73.bb" rel=3D"noreferrer" target=3D"_blank">autoco=
nf_2.73.bb</a>} (81%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclud=
e.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch<=
br>
&gt; deleted file mode 100644<br>
&gt; index 28141962008..00000000000<br>
&gt; --- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch=
<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,121 +0,0 @@<br>
&gt; -From 1a50157aa11da48921200a0d8d4308863716eab0 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -Date: Thu, 12 Mar 2020 17:25:23 +0000<br>
&gt; -Subject: [PATCH] autoreconf-exclude.patch<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [oe specific]<br>
&gt; -<br>
&gt; ----<br>
&gt; - bin/<a href=3D"http://autoreconf.in" rel=3D"noreferrer" target=3D"_b=
lank">autoreconf.in</a> | 26 ++++++++++++++++++++++++++<br>
&gt; - 1 file changed, 26 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/bin/<a href=3D"http://autoreconf.in" rel=3D"noreferrer" =
target=3D"_blank">autoreconf.in</a> b/bin/<a href=3D"http://autoreconf.in" =
rel=3D"noreferrer" target=3D"_blank">autoreconf.in</a><br>
&gt; -index 98ebab6..937f758 100644<br>
&gt; ---- a/bin/<a href=3D"http://autoreconf.in" rel=3D"noreferrer" target=
=3D"_blank">autoreconf.in</a><br>
&gt; -+++ b/bin/<a href=3D"http://autoreconf.in" rel=3D"noreferrer" target=
=3D"_blank">autoreconf.in</a><br>
&gt; -@@ -83,6 +83,7 @@ Operation modes:<br>
&gt; -=C2=A0 =C2=A0-i, --install=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
opy missing standard auxiliary files<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0--no-recursive=C2=A0 =C2=A0 =C2=A0 =C2=A0d=
on&#39;t rebuild sub-packages<br>
&gt; -=C2=A0 =C2=A0-s, --symlink=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 w=
ith -i, install symbolic links instead of copies<br>
&gt; -+=C2=A0 -x, --exclude=3DSTEPS=C2=A0 =C2=A0 =C2=A0 steps we should not=
 run<br>
&gt; -=C2=A0 =C2=A0-m, --make=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0when applicable, re-run ./configure &amp;&amp; make<br>
&gt; -=C2=A0 =C2=A0-W, --warnings=3DCATEGORY=C2=A0 report the warnings fall=
ing in CATEGORY<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (comma-separated list accepted)<br>
&gt; -@@ -141,6 +142,10 @@ my $run_make =3D 0;<br>
&gt; - # Recurse into subpackages<br>
&gt; - my $recursive =3D 1;<br>
&gt; - <br>
&gt; -+# Steps to exclude<br>
&gt; -+my @exclude;<br>
&gt; -+my @ex;<br>
&gt; -+<br>
&gt; - ## ---------- ##<br>
&gt; - ## Routines.=C2=A0 ##<br>
&gt; - ## ---------- ##<br>
&gt; -@@ -161,6 +166,7 @@ sub parse_args ()<br>
&gt; -=C2=A0 &#39;B|prepend-include=3Ds&#39; =3D&gt; \@prepend_include,<br>
&gt; -=C2=A0 &#39;i|install&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D&gt; \$install,<br>
&gt; -=C2=A0 &#39;s|symlink&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D&gt; \$symlink,<br>
&gt; -+=C2=A0 =C2=A0 &#39;x|exclude=3Ds&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D&gt; \@exclude,<br>
&gt; -=C2=A0 &#39;m|make&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D&gt; \$run_make,<br>
&gt; -=C2=A0 &#39;recursive!&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D&gt; \$recursive);<br>
&gt; - <br>
&gt; -@@ -170,6 +176,8 @@ sub parse_args ()<br>
&gt; -=C2=A0 =C2=A0parse_WARNINGS;<br>
&gt; -=C2=A0 =C2=A0parse_warnings @warning;<br>
&gt; - <br>
&gt; -+=C2=A0 @exclude =3D map { split /,/ } @exclude;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0# Even if the user specified a <a href=3D"http://configu=
re.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>, trim to get t=
he<br>
&gt; -=C2=A0 =C2=A0# directory, and look for <a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> again.=C2=A0 Becaus=
e (i) the code<br>
&gt; -=C2=A0 =C2=A0# is simpler, and (ii) we are still able to diagnose sim=
ultaneous<br>
&gt; -@@ -493,8 +501,11 @@ sub autoreconf_current_directory ($)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 @ex =3D grep (/^autopoint$/, @exclude);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ($#ex =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0xsystem_hint (&quot;autopoint is needed be=
cause this package uses Gettext&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$autopoint);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; - <br>
&gt; -@@ -691,9 +702,12 @@ sub autoreconf_current_directory ($)<br>
&gt; - {<br>
&gt; -=C2=A0 $libtoolize .=3D &quot; --ltdl&quot;;<br>
&gt; - }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 @ex =3D grep (/^libtoolize$/, @exclude);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ($#ex =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0xsystem_hint (&quot;libtoolize is needed b=
ecause this package uses Libtool&quot;,<br>
&gt; -=C2=A0 =C2=A0 $libtoolize);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$rerun_aclocal =3D 1;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -@@ -730,8 +744,11 @@ sub autoreconf_current_directory ($)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0elsif ($install)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 @ex =3D grep (/^gtkdocize$/, @exclude);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ($#ex =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0xsystem_hint (&quot;gtkdocize is needed be=
cause this package uses Gtkdoc&quot;,<br>
&gt; -=C2=A0 =C2=A0 $gtkdocize);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -@@ -769,7 +786,10 @@ sub autoreconf_current_directory ($)<br>
&gt; -=C2=A0 =C2=A0# latter runs the former, and (ii) autoconf is stricter =
than<br>
&gt; -=C2=A0 =C2=A0# autoheader.=C2=A0 So all in all, autoconf should give =
better error<br>
&gt; -=C2=A0 =C2=A0# messages.<br>
&gt; -+=C2=A0 @ex =3D grep (/^autoconf$/, @exclude);<br>
&gt; -+=C2=A0 if ($#ex =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0xsystem ($autoconf);<br>
&gt; -+=C2=A0 }<br>
&gt; - <br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0# -------------------- #<br>
&gt; -@@ -790,7 +810,10 @@ sub autoreconf_current_directory ($)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 @ex =3D grep (/^autoheader$/, @exclude);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ($#ex =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0xsystem ($autoheader);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; - <br>
&gt; -@@ -807,7 +830,10 @@ sub autoreconf_current_directory ($)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# We should always run automake, and let i=
t decide whether it shall<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# update the file or not.=C2=A0 In fact, t=
he effect of &#39;$force&#39; is already<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# included in &#39;$automake&#39; via &#39=
;--no-force&#39;.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 @ex =3D grep (/^automake$/, @exclude);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ($#ex =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0xsystem ($automake);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0# ---------------------------------------------------- #=
<br>
&gt; diff --git a/meta/recipes-devtools/autoconf/autoconf/autotest-automake=
-result-format.patch b/meta/recipes-devtools/autoconf/autoconf/autotest-aut=
omake-result-format.patch<br>
&gt; index 38725574bac..d88e16b52fb 100644<br>
&gt; --- a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result=
-format.patch<br>
&gt; +++ b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result=
-format.patch<br>
&gt; @@ -34,21 +34,6 @@ index bf18866..8097523 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [[0-9] | [0-9][0-9] | [0-9][0-9][0-9] | [0-9][0-9]=
[0-9][0-9]])<br>
&gt;=C2=A0 =C2=A0at_fn_validate_ranges at_option<br>
&gt;=C2=A0 =C2=A0AS_VAR_APPEND([at_groups], [&quot;$at_option$as_nl&quot;])=
<br>
&gt; -@@ -728,10 +735,10 @@ m4_divert_push([HELP_MODES])dnl<br>
&gt; - cat &lt;&lt;_ATEOF || at_write_fail=3D1<br>
&gt; - <br>
&gt; - Operation modes:<br>
&gt; --=C2=A0 -h, --help=C2=A0 =C2=A0 =C2=A0print the help message, then ex=
it<br>
&gt; --=C2=A0 -V, --version=C2=A0 print version number, then exit<br>
&gt; --=C2=A0 -c, --clean=C2=A0 =C2=A0 remove all the files this test suite=
 might create and exit<br>
&gt; --=C2=A0 -l, --list=C2=A0 =C2=A0 =C2=A0describes all the tests, or the=
 selected TESTS<br>
&gt; -+=C2=A0 -h, --help=C2=A0 =C2=A0 =C2=A0 print the help message, then e=
xit<br>
&gt; -+=C2=A0 -V, --version=C2=A0 =C2=A0print version number, then exit<br>
&gt; -+=C2=A0 -c, --clean=C2=A0 =C2=A0 =C2=A0remove all the files this test=
 suite might create and exit<br>
&gt; -+=C2=A0 -l, --list=C2=A0 =C2=A0 =C2=A0 describes all the tests, or th=
e selected TESTS<br>
&gt; - _ATEOF<br>
&gt; - m4_divert_pop([HELP_MODES])dnl<br>
&gt; - m4_wrap([m4_divert_push([HELP_TUNING_BEGIN])dnl<br>
&gt; @@ -757,6 +764,7 @@ Execution tuning:<br>
&gt;=C2=A0 =C2=A0 -d, --debug=C2=A0 =C2=A0 inhibit clean up and top-level l=
ogging<br>
&gt;=C2=A0 [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d=
efault for debugging scripts]<br>
&gt; diff --git a/meta/recipes-devtools/autoconf/autoconf/man-host-perl.pat=
ch b/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 0f49583a641..00000000000<br>
&gt; --- a/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,31 +0,0 @@<br>
&gt; -From 1c033f2a23941c46d88b9ac279f87bf2c6e99499 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=
=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; -Date: Wed, 15 Jul 2020 16:03:21 +0100<br>
&gt; -Subject: [PATCH] Don&#39;t use the target perl when regenerating the =
man pages.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - man/<a href=3D"http://local.mk" rel=3D"noreferrer" target=3D"_blank"=
>local.mk</a> | 3 +--<br>
&gt; - 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/man/<a href=3D"http://local.mk" rel=3D"noreferrer" targe=
t=3D"_blank">local.mk</a> b/man/<a href=3D"http://local.mk" rel=3D"noreferr=
er" target=3D"_blank">local.mk</a><br>
&gt; -index 775c131..ba94753 100644<br>
&gt; ---- a/man/<a href=3D"http://local.mk" rel=3D"noreferrer" target=3D"_b=
lank">local.mk</a><br>
&gt; -+++ b/man/<a href=3D"http://local.mk" rel=3D"noreferrer" target=3D"_b=
lank">local.mk</a><br>
&gt; -@@ -77,13 +77,12 @@ SUFFIXES +=3D .w .1<br>
&gt; - @echo &quot;Updating man page $@&quot;<br>
&gt; - $(MKDIR_P) $(@D)<br>
&gt; - PATH=3D&quot;$(top_srcdir)/man$(PATH_SEPARATOR)$$PATH&quot;; \<br>
&gt; -- PERL=3D&quot;$(PERL)&quot;; \<br>
&gt; - PACKAGE_NAME=3D&quot;$(PACKAGE_NAME)&quot;; \<br>
&gt; - VERSION=3D&quot;$(VERSION)&quot;; \<br>
&gt; - RELEASE_YEAR=3D&quot;$(RELEASE_YEAR)&quot;; \<br>
&gt; - top_srcdir=3D&quot;$(top_srcdir)&quot;; \<br>
&gt; - channeldefs_pm=3D&quot;$(channeldefs_pm)&quot;; \<br>
&gt; -- export PATH PERL PACKAGE_NAME VERSION RELEASE_YEAR; \<br>
&gt; -+ export PATH PACKAGE_NAME VERSION RELEASE_YEAR; \<br>
&gt; - export top_srcdir channeldefs_pm; \<br>
&gt; - $(HELP2MAN) \<br>
&gt; -=C2=A0 =C2=A0 --include=3D$(srcdir)/$*.x \<br>
&gt; diff --git a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf=
_2.72.bb" rel=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a> b/meta/=
recipes-devtools/autoconf/<a href=3D"http://autoconf_2.73.bb" rel=3D"norefe=
rrer" target=3D"_blank">autoconf_2.73.bb</a><br>
&gt; similarity index 81%<br>
&gt; rename from meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_=
2.72.bb" rel=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a><br>
&gt; rename to meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.=
73.bb" rel=3D"noreferrer" target=3D"_blank">autoconf_2.73.bb</a><br>
&gt; index b599f270c79..2dd8fb27721 100644<br>
&gt; --- a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.72.b=
b" rel=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a><br>
&gt; +++ b/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.73.b=
b" rel=3D"noreferrer" target=3D"_blank">autoconf_2.73.bb</a><br>
&gt; @@ -8,27 +8,22 @@ SECTION =3D &quot;devel&quot;<br>
&gt; DEPENDS =3D &quot;m4-native autoconf-native automake-native gnu-config=
-native help2man-native&quot;<br>
&gt; DEPENDS:remove:class-native =3D &quot;autoconf-native automake-native =
help2man-native&quot;<br>
&gt; <br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb=
7fbaa3ef16c \<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D570a9b3749dd0463a1778=
803b12a6dce \<br>
&gt;=C2=A0 =C2=A0 file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e440464&q=
uot;<br>
&gt; <br>
&gt; SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GNU_MIRROR}/autoconf/${BP}.=
tar.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://program_prefix.patch \=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://autoreconf-exclude.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove-usr-local-lib-f=
rom-m4.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://preferbash.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autotest-automake-resu=
lt-format.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-host-perl.patch \=
<br>
&gt; &quot;<br>
&gt; SRC_URI:append:class-native =3D &quot; file://no-man.patch&quot;<br>
&gt; <br>
&gt; -SRC_URI[sha256sum] =3D &quot;afb181a76e1ee72832f6581c0eddf8df032b83e2=
e0239ef79ebedc4467d92d6e&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;259ddfa3bddc799cfb81489cc0f17dfdf1bd6d15=
05dda53c0f45ff60d6a4f9a7&quot;<br>
&gt; <br>
&gt; -# Remove this when upgrading past 2.72, as package managers sort 2.72=
e (the<br>
&gt; -# fifth release candidate) after 2.72.<br>
&gt; -PKGV =3D &quot;2.72e+really${PV}&quot;<br>
&gt; -<br>
&gt; -RDEPENDS:${PN} =3D &quot;m4 gnu-config \<br>
&gt; +RDEPENDS:${PN} =3D &quot;m4 \<br>
&gt; +=C2=A0 gnu-config \<br>
&gt;=C2=A0 perl \<br>
&gt;=C2=A0 perl-module-bytes \<br>
&gt;=C2=A0 perl-module-carp \<br>
&gt; @@ -45,13 +40,13 @@ RDEPENDS:${PN} =3D &quot;m4 gnu-config \<br>
&gt;=C2=A0 perl-module-file-spec \<br>
&gt;=C2=A0 perl-module-file-spec-unix \<br>
&gt;=C2=A0 perl-module-file-stat \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-m=
odule-file-temp \<br>
&gt; +=C2=A0 perl-module-file-temp \<br>
&gt;=C2=A0 perl-module-getopt-long \<br>
&gt;=C2=A0 perl-module-io-file \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-m=
odule-list-util \<br>
&gt; +=C2=A0 perl-module-list-util \<br>
&gt;=C2=A0 perl-module-overloading \<br>
&gt;=C2=A0 perl-module-posix \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-m=
odule-scalar-util \<br>
&gt; +=C2=A0 perl-module-scalar-util \<br>
&gt;=C2=A0 perl-module-symbol \<br>
&gt;=C2=A0 perl-module-thread-queue \<br>
&gt;=C2=A0 perl-module-threads \<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#234237): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/234237" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/234237</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118578414/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118578414/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000231649064e6c005e--

