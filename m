Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.5336.1623923170869895449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 02:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uqQej+7l;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id l25so2637577vsb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 02:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5XlMPt/DqMixwMdviaauYvkdBEL3xmywQEUe/+YZiHY=;
        b=uqQej+7lGeYRGyVVEaDvHCsMRsrKgTE/fMZNSL2GKBcQp/Iy2OMXSSe86+dfT86HHN
         omyJBqQMakmDiBTUfEY9C8oEZYqpa4q7bGVbjZ8blz6y6eSBjXIbkXGat7J3ix16Vffc
         0y9a3DG2zlsEAiCmdYVEiQBgTiyjQlS9Yrklnf8JuybK0K/vefMpFKrnKkqtancThTjq
         EFx1nuAJURemJMEk2jRgNbV8D42JpGkjRhk6RUVoT2uFglb3vgySCk5LWmrCyqeOSIJm
         lVvLCevd0WO4gZKYmpT88fnRZCz8COn4i5Bi2bgQ3300mMc5N6SHlCkRuyUtiwK1yljk
         uSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5XlMPt/DqMixwMdviaauYvkdBEL3xmywQEUe/+YZiHY=;
        b=IZc/ooXN3kV8AtMtHUsxRfvp8yjn9/Zuq1VNk7HR+vyS5bniy7Bet+w7pthylw5t3F
         zIF4MNDtf/lUwpWaPEpHtusavBDigiiX4FeQvRjfPUFNgPWdTctjlbOUcke+2Ku2t8j9
         VFxADZWq5V9kPmwhn0CYoURU6gdZ2n42mb7+TAGnZ/CFsYb5UiMvH39USvHWoVT7RDM2
         HvDO7RUHaZt02eDktufy5JPjTsnYQpBkIYVzd0ZHv/15E8tsfxEqgtd3mWWMHrM0frra
         ZqbL9wI/6c9TvAMXERfECydvYQoRxAiI5zRsdXwnyGec/g1RohYn3CLe3WkT0zaIhYZA
         0DpQ==
X-Gm-Message-State: AOAM531wWT4yLoHFJUV1XZtMZzEMF9Jy83okm/XXoi/APu96JM65kD7u
	MzFGbahDh9KicvhRUhKNL+EGORsQfvKLDUeK/+EKXCF0/Oc=
X-Google-Smtp-Source: ABdhPJzAq3xfQm0HAfhiktl8JuQZSiDL2pvdnHX3SfNChjvxhlKRXSasjUPlLJe/CTV7WQdt0KkbZsNg3kMJzl/be9I=
X-Received: by 2002:a05:6102:23dc:: with SMTP id x28mr3465796vsr.31.1623923169867;
 Thu, 17 Jun 2021 02:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
 <20210604091030.1380877-5-alex.kanavin@gmail.com> <2d5a058a-ec9b-d466-d1ac-a5e45e4da489@windriver.com>
In-Reply-To: <2d5a058a-ec9b-d466-d1ac-a5e45e4da489@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 17 Jun 2021 11:45:58 +0200
Message-ID: <CANNYZj_uJyS1CtB9=dK2mALvsq4CE0h52P=vjNw1tMnRNUPfaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] perl: split perl-cross into its own recipe
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aebaa205c4f313fc"

--000000000000aebaa205c4f313fc
Content-Type: text/plain; charset="UTF-8"

You need to bitbake clean the perl directory, so that perl isn't patched
twice. There might be ways to fix this, but it's not really a pressing
issue.

Alex

On Thu, 17 Jun 2021 at 11:15, Yu, Mingli <mingli.yu@windriver.com> wrote:

> Hi Alex,
>
> After this change, there comes below failure such as below:
> $ bitbake perl-native
>
> Make a change as below
> $ git diff
> diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> index b77bbd1fd4..4c5e35ab80 100644
> --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> @@ -33,6 +33,7 @@ do_compile () {
>   do_install_class-native() {
>       mkdir -p ${D}/${datadir}/perl-cross/
>       cp -rf ${S}/* ${D}/${datadir}/perl-cross/
> +    echo "test" > ${D}/${datadir}/perl-cross/testfile
>   }
>
> $ bitbake perl-native
> | NOTE: make -j 48
> | make crosspatch
> | make[1]: Entering directory
>
> '/buildarea1/myu2/wr_build/wr1021_20210616_perl/build/tmp-glibc/work/x86_64-linux/perl-native/5.34.0-r0/perl-5.34.0'
> | patch -p1 -i cnf/diffs/perl5-5.34.0/time-hires.patch && touch
> cnf/diffs/perl5-5.34.0/time-hires.applied
> | patch -p1 -i cnf/diffs/perl5-5.34.0/xconfig.patch && touch
> cnf/diffs/perl5-5.34.0/xconfig.applied
> | patch -p1 -i cnf/diffs/perl5-5.34.0/posix-makefile.patch && touch
> cnf/diffs/perl5-5.34.0/posix-makefile.applied
> | File dist/Time-HiRes/Makefile.PL is read-only; trying to patch anyway
> | patching file dist/Time-HiRes/Makefile.PL
> | Reversed (or previously applied) patch detected!  Assume -R? [n]
> | Apply anyway? [n]
> | Skipping patch.
> | 4 out of 4 hunks ignored -- saving rejects to file
> dist/Time-HiRes/Makefile.PL.rej
> | patch -p1 -i cnf/diffs/perl5-5.34.0/test-commonsense.patch && touch
> cnf/diffs/perl5-5.34.0/test-commonsense.applied
> | File perl.h is read-only; trying to patch anyway
> | patching file perl.h
> | Reversed (or previously applied) patch detected!  Assume -R? [n]
> | Apply anyway? [n]
> | Skipping patch.
> | 1 out of 1 hunk ignored -- saving rejects to file perl.h.rej
> | make[1]: *** [Makefile:64: cnf/diffs/perl5-5.34.0/time-hires.applied]
> Error 1
> [snip]
>
> Thanks,
>
> On 6/4/21 5:10 PM, Alexander Kanavin wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > As perl and perl-cross need to be updated (and patches rebased)
> > in lockstep, devtool upgrade (and therefore AUH) can't cope with it.
> > Manually updating is still possible, but painful.
> >
> > Split determinism.patch into perl and perl-cross parts, move the
> > rest of the perl-cross patches.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   meta/conf/distro/include/maintainers.inc      |  1 +
> >   ...h-do-not-hardcode-prefix-lib-as-libr.patch |  0
> >   ...h-do-not-quote-the-argument-to-comma.patch |  0
> >   ...oss-add-LDFLAGS-when-linking-libperl.patch |  0
> >   .../perl-cross/files/README.md                | 29 ++++++++++++
> >   .../perl-cross/files/determinism.patch        | 46 +++++++++++++++++++
> >   .../perl-cross/perlcross_1.3.5.bb             | 36 +++++++++++++++
> >   .../perl/files/determinism.patch              | 23 ----------
> >   meta/recipes-devtools/perl/perl_5.32.1.bb     | 17 ++-----
> >   9 files changed, 116 insertions(+), 36 deletions(-)
> >   rename meta/recipes-devtools/{perl =>
> perl-cross}/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
> (100%)
> >   rename meta/recipes-devtools/{perl =>
> perl-cross}/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
> (100%)
> >   rename meta/recipes-devtools/{perl =>
> perl-cross}/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
> (100%)
> >   create mode 100644 meta/recipes-devtools/perl-cross/files/README.md
> >   create mode 100644
> meta/recipes-devtools/perl-cross/files/determinism.patch
> >   create mode 100644 meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index ee118209db..6024d57717 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -558,6 +558,7 @@ RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <
> Qi.Chen@windriver.com>"
> >   RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >   RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com
> >"
> >   RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com
> >"
> > +RECIPE_MAINTAINER_pn-perl-cross = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >   RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@arm.com>"
> >   RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
> >   RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
> > diff --git
> a/meta/recipes-devtools/perl/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
> b/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
> > similarity index 100%
> > rename from
> meta/recipes-devtools/perl/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
> > rename to
> meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
> > diff --git
> a/meta/recipes-devtools/perl/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
> b/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
> > similarity index 100%
> > rename from
> meta/recipes-devtools/perl/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
> > rename to
> meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
> > diff --git
> a/meta/recipes-devtools/perl/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
> b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
> > similarity index 100%
> > rename from
> meta/recipes-devtools/perl/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
> > rename to
> meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
> > diff --git a/meta/recipes-devtools/perl-cross/files/README.md
> b/meta/recipes-devtools/perl-cross/files/README.md
> > new file mode 100644
> > index 0000000000..93217245c8
> > --- /dev/null
> > +++ b/meta/recipes-devtools/perl-cross/files/README.md
> > @@ -0,0 +1,29 @@
> > +**perl-cross** provides configure script, top-level Makefile
> > +and some auxiliary files for [perl](http://www.perl.org),
> > +with the primary emphasis on cross-compiling the source.
> > +
> > +    # Get perl and perl-cross sources
> > +    curl -L -O http://www.cpan.org/src/5.0/perl-5.24.1.tar.gz
> > +    curl -L -O
> https://github.com/arsv/perl-cross/releases/download/1.1.3/perl-cross-1.1.3.tar.gz
> > +
> > +    # Unpack perl-cross over perl, overwriting Makefile
> > +    tar -zxf perl-5.24.1.tar.gz
> > +    cd perl-5.24.1
> > +    tar --strip-components=1 -zxf ../perl-cross-1.1.3.tar.gz
> > +
> > +    # Proceed as usual with most autoconfed packages
> > +    ./configure --target=arm-linux-gnueabi --prefix=/usr -Duseshrplib
> > +    make -j4
> > +    make DESTDIR=/path/to/staging/dir install
> > +
> > +Unlike mainline Perl, this configure never runs any target executables,
> > +relying solely on compile/link tests and pre-defined hints.
> > +On the flip side, it is only meant to run on resonably sane modern unix
> systems.
> > +
> > +Check [project pages](http://arsv.github.io/perl-cross/) for more info.
> > +In particular, [configure usage](
> http://arsv.github.io/perl-cross/usage.html)
> > +lists available configure options.
> > +
> > +Perl-cross is a free software licensed under the same terms
> > +as the original perl source.
> > +See LICENSE, Copying and Artistic files.
> > diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch
> b/meta/recipes-devtools/perl-cross/files/determinism.patch
> > new file mode 100644
> > index 0000000000..e9bf752bcb
> > --- /dev/null
> > +++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
> > @@ -0,0 +1,46 @@
> > +Fixes to make the perl build reproducible:
> > +
> > +a) Remove the \n from configure_attr.sh since it gets quoted
> differently depending on
> > +   whether the shell is bash or dash which can cause the test result to
> be incorrect.
> > +   Reported upstream: https://github.com/arsv/perl-cross/issues/87
> > +
> > +b) Sort the order of the module lists from configure_mods.sh since
> otherwise
> > +   the result isn't the same leading to makefile differences.
> > +   Reported upstream: https://github.com/arsv/perl-cross/issues/88
> > +
> > +c) Sort the Encode::Byte byte_t.fnm file output (and the makefile
> depends whilst
> > +   there for good measure)
> > +   This needs to go to upstream perl (not done)
> > +
> > +d) Use bash for perl-cross configure since otherwise trnl gets set to
> "\n" with bash
> > +   and "" with dash
> > +   Reported upstream: https://github.com/arsv/perl-cross/issues/87
> > +
> > +RP 2020/2/7
> > +
> > +Upstream-Status: Pending [75% submitted]
> > +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> > +
> > +Index: perl-5.30.1/cnf/configure_mods.sh
> > +===================================================================
> > +--- perl-5.30.1.orig/cnf/configure_mods.sh
> > ++++ perl-5.30.1/cnf/configure_mods.sh
> > +@@ -82,7 +82,7 @@ extonlyif() {
> > + }
> > +
> > + definetrimspaces() {
> > +-      v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//'`
> > ++      v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//'
> | xargs -n1 | LANG=C sort | xargs`
> > +       define $1 "$v"
> > + }
> > +
> > +Index: perl-5.30.1/cnf/configure
> > +===================================================================
> > +--- perl-5.30.1.orig/cnf/configure
> > ++++ perl-5.30.1/cnf/configure
> > +@@ -1,4 +1,4 @@
> > +-#!/bin/sh
> > ++#!/bin/bash
> > +
> > + base=${0%/*}; test -z "$base" && base=.
> > +
> > diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
> b/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
> > new file mode 100644
> > index 0000000000..9509313b86
> > --- /dev/null
> > +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY = "Perl-cross build system"
> > +HOMEPAGE = "https://github.com/arsv/perl-cross"
> > +DESCRIPTION = "perl-cross provides configure script, top-level Makefile
> and some auxiliary files for perl, \
> > +with the primary emphasis on cross-compiling the source."
> > +SECTION = "devel"
> > +LICENSE = "Artistic-1.0 | GPL-1.0+"
> > +# README.md is taken from
> https://github.com/arsv/perl-cross/blob/master/README.md
> > +# but is not provided inside the release tarballs
> > +LIC_FILES_CHKSUM =
> "file://${WORKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
> > +
> > +SRC_URI = "
> https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-cross
> \
> > +           file://README.md \
> > +
>  file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
> > +
>  file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
> > +
>  file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
> > +           file://determinism.patch \
> > +"
> > +UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
> > +
> > +SRC_URI[perl-cross.sha256sum] =
> "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
> > +
> > +S = "${WORKDIR}/perl-cross-${PV}"
> > +
> > +do_configure () {
> > +}
> > +
> > +do_compile () {
> > +}
> > +
> > +do_install() {
> > +    mkdir -p ${D}/${datadir}/perl-cross/
> > +    cp -rfp ${S}/* ${D}/${datadir}/perl-cross/
> > +}
> > +
> > +BBCLASSEXTEND = "native"
> > +
> > diff --git a/meta/recipes-devtools/perl/files/determinism.patch
> b/meta/recipes-devtools/perl/files/determinism.patch
> > index ccdd52a0d0..aa85ccef10 100644
> > --- a/meta/recipes-devtools/perl/files/determinism.patch
> > +++ b/meta/recipes-devtools/perl/files/determinism.patch
> > @@ -21,19 +21,6 @@ RP 2020/2/7
> >   Upstream-Status: Pending [75% submitted]
> >   Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> >
> > -Index: perl-5.30.1/cnf/configure_mods.sh
> > -===================================================================
> > ---- perl-5.30.1.orig/cnf/configure_mods.sh
> > -+++ perl-5.30.1/cnf/configure_mods.sh
> > -@@ -82,7 +82,7 @@ extonlyif() {
> > - }
> > -
> > - definetrimspaces() {
> > --      v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//'`
> > -+      v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//'
> | xargs -n1 | LANG=C sort | xargs`
> > -       define $1 "$v"
> > - }
> > -
> >   Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
> >   ===================================================================
> >   --- perl-5.30.1.orig/cpan/Encode/Byte/Makefile.PL
> > @@ -56,13 +43,3 @@ Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
> >        {
> >            print FILELIST $self->catfile($dir,$file) . "\n";
> >        }
> > -Index: perl-5.30.1/cnf/configure
> > -===================================================================
> > ---- perl-5.30.1.orig/cnf/configure
> > -+++ perl-5.30.1/cnf/configure
> > -@@ -1,4 +1,4 @@
> > --#!/bin/sh
> > -+#!/bin/bash
> > -
> > - base=${0%/*}; test -z "$base" && base=.
> > -
> > diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb
> b/meta/recipes-devtools/perl/perl_5.32.1.bb
> > index b28040c7fb..01db924a73 100644
> > --- a/meta/recipes-devtools/perl/perl_5.32.1.bb
> > +++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
> > @@ -9,18 +9,14 @@ LIC_FILES_CHKSUM =
> "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
> >
> >
> >   SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
> > -
> https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;name=perl-cross
> \
> >              file://perl-rdepends.txt \
> > -
>  file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
> >
> file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
> >
> file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
> >              file://errno_ver.diff \
> >              file://native-perlinc.patch \
> > -
>  file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
> >              file://perl-dynloader.patch \
> > -
>  file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
> >              file://0002-Constant-Fix-up-shebang.patch \
> > -           file://determinism.patch  \
> > +           file://determinism.patch \
> >              "
> >   SRC_URI_append_class-native = " \
> >              file://perl-configpm-switch.patch \
> > @@ -30,13 +26,12 @@ SRC_URI_append_class-target = " \
> >   "
> >
> >   SRC_URI[perl.sha256sum] =
> "03b693901cd8ae807231b1787798cf1f2e0b8a56218d07b7da44f784a7caeb2c"
> > -SRC_URI[perl-cross.sha256sum] =
> "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
> >
> >   S = "${WORKDIR}/perl-${PV}"
> >
> >   inherit upstream-version-is-even update-alternatives
> >
> > -DEPENDS += "zlib virtual/crypt"
> > +DEPENDS += "perlcross-native zlib virtual/crypt"
> >
> >   PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
> >
> > @@ -47,12 +42,8 @@ PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
> >   # Don't generate comments in enc2xs output files. They are not
> reproducible
> >   export ENC2XS_NO_COMMENTS = "1"
> >
> > -do_unpack_append() {
> > -    bb.build.exec_func('do_copy_perlcross', d)
> > -}
> > -
> > -do_copy_perlcross() {
> > -    cp -rfp ${WORKDIR}/perl-cross*/* ${S}
> > +do_configure_prepend() {
> > +    cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
> >   }
> >
> >   do_configure_class-target() {
> > --
> > 2.31.1
> >
> >
> >
> > 
> >
>

--000000000000aebaa205c4f313fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to bitbake clean the perl directory, so that=
 perl isn&#39;t patched twice. There might be ways to fix this, but it&#39;=
s not really a pressing issue.</div><div><br></div><div>Alex<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, 17 Jun 2021 at 11:15, Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@windriv=
er.com">mingli.yu@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi Alex,<br>
<br>
After this change, there comes below failure such as below:<br>
$ bitbake perl-native<br>
<br>
Make a change as below<br>
$ git diff<br>
diff --git a/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_=
1.3.6.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a> <br>
b/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.bb" r=
el=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a><br>
index b77bbd1fd4..4c5e35ab80 100644<br>
--- a/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.b=
b" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a><br>
+++ b/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.b=
b" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a><br>
@@ -33,6 +33,7 @@ do_compile () {<br>
=C2=A0 do_install_class-native() {<br>
=C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/${datadir}/perl-cross/<br>
=C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/* ${D}/${datadir}/perl-cross/<br>
+=C2=A0 =C2=A0 echo &quot;test&quot; &gt; ${D}/${datadir}/perl-cross/testf=
ile<br>
=C2=A0 }<br>
<br>
$ bitbake perl-native<br>
| NOTE: make -j 48<br>
| make crosspatch<br>
| make[1]: Entering directory <br>
&#39;/buildarea1/myu2/wr_build/wr1021_20210616_perl/build/tmp-glibc/work/x=
86_64-linux/perl-native/5.34.0-r0/perl-5.34.0&#39;<br>
| patch -p1 -i cnf/diffs/perl5-5.34.0/time-hires.patch &amp;&amp; touch <b=
r>
cnf/diffs/perl5-5.34.0/time-hires.applied<br>
| patch -p1 -i cnf/diffs/perl5-5.34.0/xconfig.patch &amp;&amp; touch <br>
cnf/diffs/perl5-5.34.0/xconfig.applied<br>
| patch -p1 -i cnf/diffs/perl5-5.34.0/posix-makefile.patch &amp;&amp; touc=
h <br>
cnf/diffs/perl5-5.34.0/posix-makefile.applied<br>
| File dist/Time-HiRes/Makefile.PL is read-only; trying to patch anyway<br=
>
| patching file dist/Time-HiRes/Makefile.PL<br>
| Reversed (or previously applied) patch detected!=C2=A0 Assume -R? [n]<br=
>
| Apply anyway? [n]<br>
| Skipping patch.<br>
| 4 out of 4 hunks ignored -- saving rejects to file <br>
dist/Time-HiRes/Makefile.PL.rej<br>
| patch -p1 -i cnf/diffs/perl5-5.34.0/test-commonsense.patch &amp;&amp; to=
uch <br>
cnf/diffs/perl5-5.34.0/test-commonsense.applied<br>
| File perl.h is read-only; trying to patch anyway<br>
| patching file perl.h<br>
| Reversed (or previously applied) patch detected!=C2=A0 Assume -R? [n]<br=
>
| Apply anyway? [n]<br>
| Skipping patch.<br>
| 1 out of 1 hunk ignored -- saving rejects to file perl.h.rej<br>
| make[1]: *** [Makefile:64: cnf/diffs/perl5-5.34.0/time-hires.applied] <b=
r>
Error 1<br>
[snip]<br>
<br>
Thanks,<br>
<br>
On 6/4/21 5:10 PM, Alexander Kanavin wrote:<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt; <br>
&gt; As perl and perl-cross need to be updated (and patches rebased)<br>
&gt; in lockstep, devtool upgrade (and therefore AUH) can&#39;t cope with =
it.<br>
&gt; Manually updating is still possible, but painful.<br>
&gt; <br>
&gt; Split determinism.patch into perl and perl-cross parts, move the<br>
&gt; rest of the perl-cross patches.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=
=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0...h-do-not-hardcode-prefix-lib-as-libr.patch |=C2=A0 0<b=
r>
&gt;=C2=A0 =C2=A0...h-do-not-quote-the-argument-to-comma.patch |=C2=A0 0<b=
r>
&gt;=C2=A0 =C2=A0...oss-add-LDFLAGS-when-linking-libperl.patch |=C2=A0 0<b=
r>
&gt;=C2=A0 =C2=A0.../perl-cross/files/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 ++++++++++++<br>
&gt;=C2=A0 =C2=A0.../perl-cross/files/determinism.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 46 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../perl-cross/<a href=3D"http://perlcross_1.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">perlcross_1.3.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 36 +++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../perl/files/determinism.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 23 ----------<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.32.1.=
bb" rel=3D"noreferrer" target=3D"_blank">perl_5.32.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0| 17 ++-----<br>
&gt;=C2=A0 =C2=A09 files changed, 116 insertions(+), 36 deletions(-)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/{perl =3D&gt; perl-cross}/fi=
les/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch (100%)<=
br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/{perl =3D&gt; perl-cross}/fi=
les/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch (100%)<=
br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/{perl =3D&gt; perl-cross}/fi=
les/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch (100%)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/perl-cross/files=
/README.md<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/perl-cross/files=
/determinism.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/perl-cross/<a hr=
ef=3D"http://perlcross_1.3.5.bb" rel=3D"noreferrer" target=3D"_blank">perlc=
ross_1.3.5.bb</a><br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dis=
tro/include/maintainers.inc<br>
&gt; index ee118209db..6024d57717 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -558,6 +558,7 @@ RECIPE_MAINTAINER_pn-pciutils =3D &quot;Chen Qi &=
lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windr=
iver.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-pcmanfm =3D &quot;Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-perf =3D &quot;Bruce Ashfield &lt;<a=
 href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@=
gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-perl =3D &quot;Alexander Kanavin &lt=
;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@g=
mail.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-perl-cross =3D &quot;Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-piglit =3D &quot;Ross Burton &lt;<a =
href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</=
a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-pigz =3D &quot;Hongxu Jia &lt;<a hre=
f=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windrive=
r.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-pinentry =3D &quot;Armin Kuster &lt;=
<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.=
com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/perl/files/0001-configure_path.sh-=
do-not-hardcode-prefix-lib-as-libr.patch b/meta/recipes-devtools/perl-cross=
/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/perl/files/0001-configure_path.sh-d=
o-not-hardcode-prefix-lib-as-libr.patch<br>
&gt; rename to meta/recipes-devtools/perl-cross/files/0001-configure_path.=
sh-do-not-hardcode-prefix-lib-as-libr.patch<br>
&gt; diff --git a/meta/recipes-devtools/perl/files/0001-configure_tool.sh-=
do-not-quote-the-argument-to-comma.patch b/meta/recipes-devtools/perl-cross=
/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/perl/files/0001-configure_tool.sh-d=
o-not-quote-the-argument-to-comma.patch<br>
&gt; rename to meta/recipes-devtools/perl-cross/files/0001-configure_tool.=
sh-do-not-quote-the-argument-to-comma.patch<br>
&gt; diff --git a/meta/recipes-devtools/perl/files/0001-perl-cross-add-LDF=
LAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/00=
01-perl-cross-add-LDFLAGS-when-linking-libperl.patch<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/perl/files/0001-perl-cross-add-LDFL=
AGS-when-linking-libperl.patch<br>
&gt; rename to meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-=
LDFLAGS-when-linking-libperl.patch<br>
&gt; diff --git a/meta/recipes-devtools/perl-cross/files/README.md b/meta/=
recipes-devtools/perl-cross/files/README.md<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..93217245c8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/perl-cross/files/README.md<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +**perl-cross** provides configure script, top-level Makefile<br>
&gt; +and some auxiliary files for [perl](<a href=3D"http://www.perl.org" =
rel=3D"noreferrer" target=3D"_blank">http://www.perl.org</a>),<br>
&gt; +with the primary emphasis on cross-compiling the source.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Get perl and perl-cross sources<br>
&gt; +=C2=A0 =C2=A0 curl -L -O <a href=3D"http://www.cpan.org/src/5.0/perl=
-5.24.1.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.cpan.org/sr=
c/5.0/perl-5.24.1.tar.gz</a><br>
&gt; +=C2=A0 =C2=A0 curl -L -O <a href=3D"https://github.com/arsv/perl-cro=
ss/releases/download/1.1.3/perl-cross-1.1.3.tar.gz" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/arsv/perl-cross/releases/download/1.1.3/pe=
rl-cross-1.1.3.tar.gz</a><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Unpack perl-cross over perl, overwriting Makefile<br=
>
&gt; +=C2=A0 =C2=A0 tar -zxf perl-5.24.1.tar.gz<br>
&gt; +=C2=A0 =C2=A0 cd perl-5.24.1<br>
&gt; +=C2=A0 =C2=A0 tar --strip-components=3D1 -zxf ../perl-cross-1.1.3.ta=
r.gz<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Proceed as usual with most autoconfed packages<br>
&gt; +=C2=A0 =C2=A0 ./configure --target=3Darm-linux-gnueabi --prefix=3D/u=
sr -Duseshrplib<br>
&gt; +=C2=A0 =C2=A0 make -j4<br>
&gt; +=C2=A0 =C2=A0 make DESTDIR=3D/path/to/staging/dir install<br>
&gt; +<br>
&gt; +Unlike mainline Perl, this configure never runs any target executabl=
es,<br>
&gt; +relying solely on compile/link tests and pre-defined hints.<br>
&gt; +On the flip side, it is only meant to run on resonably sane modern u=
nix systems.<br>
&gt; +<br>
&gt; +Check [project pages](<a href=3D"http://arsv.github.io/perl-cross/" =
rel=3D"noreferrer" target=3D"_blank">http://arsv.github.io/perl-cross/</a>)=
 for more info.<br>
&gt; +In particular, [configure usage](<a href=3D"http://arsv.github.io/pe=
rl-cross/usage.html" rel=3D"noreferrer" target=3D"_blank">http://arsv.githu=
b.io/perl-cross/usage.html</a>)<br>
&gt; +lists available configure options.<br>
&gt; +<br>
&gt; +Perl-cross is a free software licensed under the same terms<br>
&gt; +as the original perl source.<br>
&gt; +See LICENSE, Copying and Artistic files.<br>
&gt; diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch=
 b/meta/recipes-devtools/perl-cross/files/determinism.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e9bf752bcb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/perl-cross/files/determinism.patch<br>
&gt; @@ -0,0 +1,46 @@<br>
&gt; +Fixes to make the perl build reproducible:<br>
&gt; +<br>
&gt; +a) Remove the \n from configure_attr.sh since it gets quoted differe=
ntly depending on<br>
&gt; +=C2=A0 =C2=A0whether the shell is bash or dash which can cause the t=
est result to be incorrect.<br>
&gt; +=C2=A0 =C2=A0Reported upstream: <a href=3D"https://github.com/arsv/p=
erl-cross/issues/87" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/arsv/perl-cross/issues/87</a><br>
&gt; +<br>
&gt; +b) Sort the order of the module lists from configure_mods.sh since o=
therwise<br>
&gt; +=C2=A0 =C2=A0the result isn&#39;t the same leading to makefile diffe=
rences.<br>
&gt; +=C2=A0 =C2=A0Reported upstream: <a href=3D"https://github.com/arsv/p=
erl-cross/issues/88" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/arsv/perl-cross/issues/88</a><br>
&gt; +<br>
&gt; +c) Sort the Encode::Byte byte_t.fnm file output (and the makefile de=
pends whilst<br>
&gt; +=C2=A0 =C2=A0there for good measure)<br>
&gt; +=C2=A0 =C2=A0This needs to go to upstream perl (not done)<br>
&gt; +<br>
&gt; +d) Use bash for perl-cross configure since otherwise trnl gets set t=
o &quot;\n&quot; with bash<br>
&gt; +=C2=A0 =C2=A0and &quot;&quot; with dash<br>
&gt; +=C2=A0 =C2=A0Reported upstream: <a href=3D"https://github.com/arsv/p=
erl-cross/issues/87" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/arsv/perl-cross/issues/87</a><br>
&gt; +<br>
&gt; +RP 2020/2/7<br>
&gt; +<br>
&gt; +Upstream-Status: Pending [75% submitted]<br>
&gt; +Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a=
><br>
&gt; +<br>
&gt; +Index: perl-5.30.1/cnf/configure_mods.sh<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- perl-5.30.1.orig/cnf/configure_mods.sh<br>
&gt; ++++ perl-5.30.1/cnf/configure_mods.sh<br>
&gt; +@@ -82,7 +82,7 @@ extonlyif() {<br>
&gt; + }<br>
&gt; +<br>
&gt; + definetrimspaces() {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 v=3D`echo &quot;$2&quot; | sed -r -e &#39;s/\s=
+/ /g&#39; -e &#39;s/^\s+//&#39; -e &#39;s/\s+$//&#39;`<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 v=3D`echo &quot;$2&quot; | sed -r -e &#39;s/\s=
+/ /g&#39; -e &#39;s/^\s+//&#39; -e &#39;s/\s+$//&#39; | xargs -n1 | LANG=
=3DC sort | xargs`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0define $1 &quot;$v&quot;<br>
&gt; + }<br>
&gt; +<br>
&gt; +Index: perl-5.30.1/cnf/configure<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- perl-5.30.1.orig/cnf/configure<br>
&gt; ++++ perl-5.30.1/cnf/configure<br>
&gt; +@@ -1,4 +1,4 @@<br>
&gt; +-#!/bin/sh<br>
&gt; ++#!/bin/bash<br>
&gt; +<br>
&gt; + base=3D${0%/*}; test -z &quot;$base&quot; &amp;&amp; base=3D.<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/perl-cross/<a href=3D"http://perlc=
ross_1.3.5.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.5.bb</a> =
b/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.5.bb" re=
l=3D"noreferrer" target=3D"_blank">perlcross_1.3.5.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9509313b86<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.=
3.5.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.5.bb</a><br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +SUMMARY =3D &quot;Perl-cross build system&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/arsv/perl-cross" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/arsv/perl-cross</a>&q=
uot;<br>
&gt; +DESCRIPTION =3D &quot;perl-cross provides configure script, top-leve=
l Makefile and some auxiliary files for perl, \<br>
&gt; +with the primary emphasis on cross-compiling the source.&quot;<br>
&gt; +SECTION =3D &quot;devel&quot;<br>
&gt; +LICENSE =3D &quot;Artistic-1.0 | GPL-1.0+&quot;<br>
&gt; +# README.md is taken from <a href=3D"https://github.com/arsv/perl-cr=
oss/blob/master/README.md" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/arsv/perl-cross/blob/master/README.md</a><br>
&gt; +# but is not provided inside the release tarballs<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/README.md;md5=3D252fcce=
2026b765fee1ad74d2fb07a3b&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://github.com/arsv/perl-cross/rele=
ases/download/$%7BPV%7D/perl-cross-$%7BPV%7D.tar.gz;name=3Dperl-cross" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/arsv/perl-cross/relea=
ses/download/${PV}/perl-cross-${PV}.tar.gz;name=3Dperl-cross</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://README.md \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure_tool.=
sh-do-not-quote-the-argument-to-comma.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-perl-cross-add-=
LDFLAGS-when-linking-libperl.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure_path.=
sh-do-not-hardcode-prefix-lib-as-libr.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://determinism.patch \<=
br>
&gt; +&quot;<br>
&gt; +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/arsv/perl=
-cross/releases/" rel=3D"noreferrer" target=3D"_blank">https://github.com/a=
rsv/perl-cross/releases/</a>&quot;<br>
&gt; +<br>
&gt; +SRC_URI[perl-cross.sha256sum] =3D &quot;91c66f6b2b99fccfd4fee14660b6=
77380b0c98f9456359e91449798c2ad2ef25&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/perl-cross-${PV}&quot;<br>
&gt; +<br>
&gt; +do_configure () {<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_compile () {<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 mkdir -p ${D}/${datadir}/perl-cross/<br>
&gt; +=C2=A0 =C2=A0 cp -rfp ${S}/* ${D}/${datadir}/perl-cross/<br>
&gt; +}<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/met=
a/recipes-devtools/perl/files/determinism.patch<br>
&gt; index ccdd52a0d0..aa85ccef10 100644<br>
&gt; --- a/meta/recipes-devtools/perl/files/determinism.patch<br>
&gt; +++ b/meta/recipes-devtools/perl/files/determinism.patch<br>
&gt; @@ -21,19 +21,6 @@ RP 2020/2/7<br>
&gt;=C2=A0 =C2=A0Upstream-Status: Pending [75% submitted]<br>
&gt;=C2=A0 =C2=A0Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfounda=
tion.org</a><br>
&gt; <br>
&gt; -Index: perl-5.30.1/cnf/configure_mods.sh<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- perl-5.30.1.orig/cnf/configure_mods.sh<br>
&gt; -+++ perl-5.30.1/cnf/configure_mods.sh<br>
&gt; -@@ -82,7 +82,7 @@ extonlyif() {<br>
&gt; - }<br>
&gt; -<br>
&gt; - definetrimspaces() {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 v=3D`echo &quot;$2&quot; | sed -r -e &#39;s/\s=
+/ /g&#39; -e &#39;s/^\s+//&#39; -e &#39;s/\s+$//&#39;`<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 v=3D`echo &quot;$2&quot; | sed -r -e &#39;s/\s=
+/ /g&#39; -e &#39;s/^\s+//&#39; -e &#39;s/\s+$//&#39; | xargs -n1 | LANG=
=3DC sort | xargs`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0define $1 &quot;$v&quot;<br>
&gt; - }<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL<br>
&gt;=C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
&gt;=C2=A0 =C2=A0--- perl-5.30.1.orig/cpan/Encode/Byte/Makefile.PL<br>
&gt; @@ -56,13 +43,3 @@ Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print FILELIST $self-&gt;cat=
file($dir,$file) . &quot;\n&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -Index: perl-5.30.1/cnf/configure<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- perl-5.30.1.orig/cnf/configure<br>
&gt; -+++ perl-5.30.1/cnf/configure<br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#!/bin/sh<br>
&gt; -+#!/bin/bash<br>
&gt; -<br>
&gt; - base=3D${0%/*}; test -z &quot;$base&quot; &amp;&amp; base=3D.<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.32.1=
.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.32.1.bb</a> b/meta/recipes=
-devtools/perl/<a href=3D"http://perl_5.32.1.bb" rel=3D"noreferrer" target=
=3D"_blank">perl_5.32.1.bb</a><br>
&gt; index b28040c7fb..01db924a73 100644<br>
&gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.32.1.bb" re=
l=3D"noreferrer" target=3D"_blank">perl_5.32.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.32.1.bb" re=
l=3D"noreferrer" target=3D"_blank">perl_5.32.1.bb</a><br>
&gt; @@ -9,18 +9,14 @@ LIC_FILES_CHKSUM =3D &quot;file://Copying;md5=3D5b1=
22a36d0f6dc55279a0ebc69f3c60b \<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;<a href=3D"https://www.cpan.org/src/5.0=
/perl-$%7BPV%7D.tar.gz;name=3Dperl" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.c=
om/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;name=3Dp=
erl-cross" rel=3D"noreferrer" target=3D"_blank">https://github.com/arsv/per=
l-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;name=3Dperl-cross</=
a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://perl-rdepends.=
txt \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure_tool.=
sh-do-not-quote-the-argument-to-comma.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ExtUtils-=
MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Somehow-t=
his-module-breaks-through-the-perl-wrapper-.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://errno_ver.diff=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://native-perlinc=
.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-perl-cross-add-=
LDFLAGS-when-linking-libperl.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://perl-dynloader=
.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure_path.=
sh-do-not-hardcode-prefix-lib-as-libr.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Constant-=
Fix-up-shebang.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://determinism.patch=C2=
=
=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://determinism.patch \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI_append_class-native =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://perl-configpm-=
switch.patch \<br>
&gt; @@ -30,13 +26,12 @@ SRC_URI_append_class-target =3D &quot; \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0SRC_URI[perl.sha256sum] =3D &quot;03b693901cd8ae807231b17=
87798cf1f2e0b8a56218d07b7da44f784a7caeb2c&quot;<br>
&gt; -SRC_URI[perl-cross.sha256sum] =3D &quot;91c66f6b2b99fccfd4fee14660b6=
77380b0c98f9456359e91449798c2ad2ef25&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/perl-${PV}&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0inherit upstream-version-is-even update-alternatives<br>
&gt; <br>
&gt; -DEPENDS +=3D &quot;zlib virtual/crypt&quot;<br>
&gt; +DEPENDS +=3D &quot;perlcross-native zlib virtual/crypt&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0PERL_LIB_VER =3D &quot;${@&#39;.&#39;.join(d.getVar(&#39;=
PV&#39;).split(&#39;.&#39;)[0:2])}.0&quot;<br>
&gt; <br>
&gt; @@ -47,12 +42,8 @@ PACKAGECONFIG[gdbm] =3D &quot;,-Ui_gdbm,gdbm&quot;=
<br>
&gt;=C2=A0 =C2=A0# Don&#39;t generate comments in enc2xs output files. The=
y are not reproducible<br>
&gt;=C2=A0 =C2=A0export ENC2XS_NO_COMMENTS =3D &quot;1&quot;<br>
&gt; <br>
&gt; -do_unpack_append() {<br>
&gt; -=C2=A0 =C2=A0 bb.build.exec_func(&#39;do_copy_perlcross&#39;, d)<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_copy_perlcross() {<br>
&gt; -=C2=A0 =C2=A0 cp -rfp ${WORKDIR}/perl-cross*/* ${S}<br>
&gt; +do_configure_prepend() {<br>
&gt; +=C2=A0 =C2=A0 cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}<br=
>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0do_configure_class-target() {<br>
&gt; --<br>
&gt; 2.31.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000aebaa205c4f313fc--
