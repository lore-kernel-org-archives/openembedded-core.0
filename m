Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.513.1619395848725369124
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ci6Dv6m8;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id z5so2332266qts.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 17:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C/r+VW1ZPe48ZFvSBMxGt7Pzu1yxi2zmZ7Qyecx7OiM=;
        b=Ci6Dv6m8dsW3LH0uk44eryzbkxT9UUrXfPcqyFd9dsdSwojD59ewUh/aOgU2x35+cL
         QwsTQ8e56+hhswVuxqUn6MtUWivKIyzC6FF/CNuZCg8snGL8zc9FRX5tri9h8ActLSt9
         ukplxFhcH0DgajmmbPTuXqSVeIt5q4t2bojIX0uN+3dgi9exQixHDp3QkDV7xucKuyxV
         0jO0kyhaicu7Yot1QwhiLdgMGRuH+t+Y15mlTyYLfHq7PeXyxOhZnyq3dAPijjG6Nb/4
         pCuUSnOAJw4aWqqdGZ64yehJk4sCjKH57PRt0wVJuOJ9+FcbDAcQwUjIaVP0Ds/e+W5Y
         Zmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C/r+VW1ZPe48ZFvSBMxGt7Pzu1yxi2zmZ7Qyecx7OiM=;
        b=nO9y/9ZYfB4CG3QwF61YKjX74cx5lIBrD0ApiW8J23aCwmwAwA9ktY/kHXLXzUgpvX
         Tw36U0lwGJMkuM/Qi9K+Fe/etqAzO6FrJrQJOhdNRCfdjaAEwK4tJC5+eCKMPQKzOObO
         u55LsyFKAKw8Zsx0Adgk98aIwyCihF0F0tnv+uuQBWeR6Veoe8hUGWsME89k0OqWs2tm
         BbPbJ1Q3K1D8yRweSxrW1ZdDHr1udcreJo1jAXb5md7CObttYq+CgB75s/jqK/iTkG1o
         dPB334EH5cSHcsb0aePN6nwXkdIaIOoyBHWmCCuZlkhQL3K4x9/fzinlTsDLNn1+Eszi
         vJ6Q==
X-Gm-Message-State: AOAM530DSJMYmhK/u8XjLIqUTAnaJ11X6iqdvL3rb2//Nwzew/ckQug6
	O3iPNlqu7jm7TnHDvvyD5em/+0xmXxReD6IoiCx66IymU+Q1vw==
X-Google-Smtp-Source: ABdhPJzq5SIS07YXR57mnmyh/pJG/zNRwcN5GNVqnyrAeiPwIoYeicnceXYWV18njWvVIWwDMeZxm3Ye5sPKZe4FhXc=
X-Received: by 2002:ac8:534a:: with SMTP id d10mr13961894qto.299.1619395847837;
 Sun, 25 Apr 2021 17:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210424155639.1131482-1-akuster808@gmail.com>
 <20210424155639.1131482-2-akuster808@gmail.com> <CAMKF1sqK5+BHjiDcY=JJeueeUHw+3WPpu0hE-4EddpBF0OFvLQ@mail.gmail.com>
 <6e9eb81e-5c30-1176-8ead-b385d9e9c15f@gmail.com>
In-Reply-To: <6e9eb81e-5c30-1176-8ead-b385d9e9c15f@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 25 Apr 2021 17:10:21 -0700
Message-ID: <CAMKF1spjy70QC18FmqM0mToYOjTwwcuDWtaoo57jqaMi0sLHWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] libseccomp: move recipe from meta-security to core
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 25, 2021 at 11:26 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 4/24/21 3:16 PM, Khem Raj wrote:
> > riscv32 is not happy
>
> that is not supported by libseccomp per their supported arch list. I
> came across that yesterday.

I think the problem is when we enable it by default in DISTRO_FEATURES
perhaps we should add an explicit

DISTRO_FEATURES_remove_riscv32 = "seccomp"

in default-distrovars.inc

> >
> > ERROR: Nothing PROVIDES 'libseccomp' (but
> > /home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-core/systemd/systemd_247.6.bb,
> > /home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-support/gnutls/gnutls_3.7.1.bb
> > DEPENDS on or otherwise requires it)
> > libseccomp was skipped: incompatible with host riscv32-yoe-linux (not
> > in COMPATIBLE_HOST)
> I suspect we need to exclude the arch for now. I didn't notice any patch
> to add that yet.
>
> -armin
> >
> > see
> > http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuriscv32/1123/consoleFull
> >
> > On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster <akuster808@gmail.com> wrote:
> >> ptest results:
> >> Regression Test Summary
> >>  tests run: 1404
> >>  tests skipped: 369
> >>  tests passed: 1402
> >>  tests failed: 2
> >>  tests errored: 154
> >>
> >> Add feature_check so that the other recipes who can take
> >> advantage of this funtionality can enable it.
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  .../libseccomp/files/run-ptest                |  4 ++
> >>  .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
> >>  2 files changed, 53 insertions(+)
> >>  create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
> >>  create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> >>
> >> diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
> >> new file mode 100644
> >> index 00000000000..54b4a63cd2c
> >> --- /dev/null
> >> +++ b/meta/recipes-support/libseccomp/files/run-ptest
> >> @@ -0,0 +1,4 @@
> >> +#!/bin/sh
> >> +
> >> +cd tests
> >> +./regression -a
> >> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> >> new file mode 100644
> >> index 00000000000..667d5da8242
> >> --- /dev/null
> >> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> >> @@ -0,0 +1,49 @@
> >> +SUMMARY = "interface to seccomp filtering mechanism"
> >> +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
> >> +SECTION = "security"
> >> +LICENSE = "LGPL-2.1"
> >> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
> >> +
> >> +DEPENDS += "gperf-native"
> >> +
> >> +SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
> >> +
> >> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
> >> +           file://run-ptest \
> >> +           "
> >> +
> >> +COMPATIBLE_HOST_riscv32 = "null"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +inherit autotools-brokensep pkgconfig ptest features_check
> >> +
> >> +REQUIRED_DISTRO_FEATURES = "seccomp"
> >> +
> >> +PACKAGECONFIG ??= ""
> >> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
> >> +
> >> +DISABLE_STATIC = ""
> >> +
> >> +do_compile_ptest() {
> >> +    oe_runmake -C tests check-build
> >> +}
> >> +
> >> +do_install_ptest() {
> >> +    install -d ${D}${PTEST_PATH}/tests
> >> +    install -d ${D}${PTEST_PATH}/tools
> >> +    for file in $(find tests/* -executable -type f); do
> >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >> +    done
> >> +    for file in $(find tests/*.tests -type f); do
> >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >> +    done
> >> +    for file in $(find tools/* -executable -type f); do
> >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> >> +    done
> >> +}
> >> +
> >> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
> >> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
> >> +
> >> +RDEPENDS_${PN}-ptest = "coreutils bash"
> >> --
> >> 2.25.1
> >>
> >>
> >> 
> >>
>
>
