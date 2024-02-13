Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF56BC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 16:26:15 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.15817.1707841565629287693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 08:26:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V9PU2i8e;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51176eb6a4bso4644520e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707841564; x=1708446364; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JO6BAsAnArtoa+b/4WKpfznrVBZcWe1bSa4JLb9uCU=;
        b=V9PU2i8eqNkVtU+KNHXKv46au1QWbfHYlgU4y7IsLzQQ4OpWaoKNZ2sEPhMRraaoni
         yUM7ZQCikWGn8vYE1VqmVJB3SrlYONkCT3vrxL20rqaDbXOEcihCWvneemkSfHx9PMd0
         k9LkkX4XY7r3RwfAlrz2p4ukbIWj+wNrGDCo5dwkUgIOdGkQq/ZQIMzxn7+1StLlC/QL
         ikxuwQzes5oABgKZoy41xo4DRyOt8KmcY6jGcIXApMnb5tKvDuQWc6hu3PdRSbqb5B1H
         I7QWnBl1d9yPVd3y35KWbr+ekcLNS3ub5fBnuJwHbEDo8hbHV9Gs1BSOJY2boXt0zk7x
         APdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707841564; x=1708446364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JO6BAsAnArtoa+b/4WKpfznrVBZcWe1bSa4JLb9uCU=;
        b=I00/Yz+mc/TsXN90LsvoX0BPFcL7xSjddf4MX1CCDAcTPwZhzxME+RFXXn6shFV6p7
         T9VWjJp8Se8jHFQZuVx0hvKLfF5kRLGMfcsjUurkQV8YZ1sA0pBhTHvaFXaeatTbteYM
         Cne8HMNDj6xHSbNA8NYUFSS9LZoxd2By5Bi4BDxw+mZGNx/+FKlnPzMPRfhsVwBpZvuQ
         DMJaXhlq1hYro8YaiYj1UNClMgIR3pimHOvgamTqYdOv1wHjtYGO/QqTqnaeEinrJLnC
         CeXketOXXYRqy/zqx2ZUlIR+vtVEmNFuvtJWhVJrVnk2KY8TWrJv4XPYPhpis4p7Itye
         ZkSA==
X-Forwarded-Encrypted: i=1; AJvYcCXM+hSXNDXbg7odVzjzHtmSGT9xo6HJpXCvGKrQS7aWVOSWrmjThQPHXVFmI8Xauka877CXPJ3/Wbrk4VImH4ASWEAe26xbsIvsPdYcnc2JdfXOoHIwy5J+
X-Gm-Message-State: AOJu0Yy2Ye/FZtsIy92gSqSgUFEcHf9nGZ94jylJbtwjbw9SOZIZU/iy
	pcsFAuW3+fiHrIi7yh1HM5P7VregCf2jFA0uuwqiJWlBd+8gltfPoihaq2p+6Zaxmy0UJHkc6ML
	2odcB4Xe1tXMcmBoJ3cWex0bwGps=
X-Google-Smtp-Source: AGHT+IHV3S3bjO1xN7cNI3L4s5UNzpjFMp/QDio5WcA9TfCoF60sBpthR10REI/jdsaUSgex2ijAjdAay2FNAbtglyw=
X-Received: by 2002:ac2:4303:0:b0:511:974a:3cb with SMTP id
 l3-20020ac24303000000b00511974a03cbmr16524lfh.67.1707841562747; Tue, 13 Feb
 2024 08:26:02 -0800 (PST)
MIME-Version: 1.0
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
 <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com> <bef4a38f-aa1e-d57b-e23-f3a059ebe313@crashcourse.ca>
 <CAO5Uq5Qyr7ca2rcVtRs4seSyKid58J3ZGhRHuynm-AFYgM1PXw@mail.gmail.com>
 <ac14ca2-ef63-6ee-d01b-c4ed4b65d78@crashcourse.ca> <CAO5Uq5TYipCFncPuQFBXOr4BtLUDnsXGNr5w5OsyWjxXMpEZsQ@mail.gmail.com>
 <F448E74E-3EF8-4AED-B7C9-C61F300C0C44@arm.com> <fcc9143-8ba4-7f-f9bd-b059c774d8c6@crashcourse.ca>
In-Reply-To: <fcc9143-8ba4-7f-f9bd-b059c774d8c6@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 13 Feb 2024 16:25:48 +0000
Message-ID: <CAO5Uq5RPHi_z72j74L+h0p1MMpSCEVVPOvsZDrAyVdmW8201Dg@mail.gmail.com>
Subject: Re: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 16:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195416

On Tue, Feb 13, 2024 at 11:21=E2=80=AFAM Robert P. J. Day <rpjday@crashcour=
se.ca> wrote:
>
>
> On Mon, 12 Feb 2024, Ross Burton wrote:
>
> > On 12 Feb 2024, at 15:00, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > > PTEST_ENABLED is just set in ptest.bbclass:
> > >
> > > PTEST_ENABLED =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '=
1', '0', d)}"
> > > PTEST_ENABLED:class-native =3D ""
> > > PTEST_ENABLED:class-nativesdk =3D ""
> > > PTEST_ENABLED:class-cross-canadian =3D ""
> > >
> > > I'd argue checking PTEST_ENABLED is the right way.
> >
> > Agreed, I=E2=80=99ve done exactly what you said before: ptest globally =
is
> > off, but I can turn it on for specific recipes.  Or turn it on
> > globally but then off for specific recipes.
> >
> > Ross
>
>   here's just a first pass through oe-core, want to make sure this is
> the first stage of cleanup people are talking about. if so, will
> submit officially (straightforward replacement):
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index 828f618cda..e6240430db 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1371,7 +1371,7 @@ python do_qa_patch() {
>          return False
>
>      srcdir =3D d.getVar('S')
> -    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d)=
:
> +    if not bb.utils.contains('PTEST_ENABLED', '1', True, False, d):
>          pass
>      elif bb.data.inherits_class('ptest', d):
>          bb.note("Package %s QA: skipping unimplemented-ptest: ptest impl=
ementation detected" % d.getVar('PN'))
> diff --git a/meta/classes-recipe/packagegroup.bbclass b/meta/classes-reci=
pe/packagegroup.bbclass
> index cf6fc354a8..742fb99953 100644
> --- a/meta/classes-recipe/packagegroup.bbclass
> +++ b/meta/classes-recipe/packagegroup.bbclass
> @@ -32,7 +32,7 @@ python () {
>      packages =3D d.getVar('PACKAGES').split()
>      if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY') !=3D '1':
>          types =3D ['', '-dbg', '-dev']
> -        if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d)=
:
> +        if bb.utils.contains('PTEST_ENABLED', '1', True, False, d):
>              types.append('-ptest')
>          packages =3D [pkg + suffix for pkg in packages
>                      for suffix in types]
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index 281de4784f..3834b9b9bc 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -28,7 +28,7 @@ TESTIMAGE_FAILED_QA_ARTIFACTS =3D "\
>      ${sysconfdir}/os-release"
>
>  # If some ptests are run and fail, retrieve corresponding directories
> -TESTIMAGE_FAILED_QA_ARTIFACTS +=3D "${@bb.utils.contains('DISTRO_FEATURE=
S', 'ptest', '${libdir}/${MCNAME}/ptest', '', d)}"
> +TESTIMAGE_FAILED_QA_ARTIFACTS +=3D "${@bb.utils.contains('PTEST_ENABLED'=
, '1', '${libdir}/${MCNAME}/ptest', '', d)}"
>
>  # You can set (or append to) TEST_SUITES in local.conf to select the tes=
ts
>  # which you want to run for your target.

Just reading over the classes, I wonder if this change makes sense for
them, or if the DISTRO_FEATURES dance is more appropriate.

> diff --git a/meta/recipes-devtools/lua/lua_5.4.6.bb b/meta/recipes-devtoo=
ls/lua/lua_5.4.6.bb
> index eabfc89575..6420b2231b 100644
> --- a/meta/recipes-devtools/lua/lua_5.4.6.bb
> +++ b/meta/recipes-devtools/lua/lua_5.4.6.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://www.lua.org/"
>
>  SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=3Dtarballsrc \
>             file://lua.pc.in \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.=
lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=3Dtarballtest file://r=
un-ptest ', '', d)} \
> +           ${@bb.utils.contains('PTEST_ENABLED', '1', 'http://www.lua.or=
g/tests/lua-${PV_testsuites}-tests.tar.gz;name=3Dtarballtest file://run-pte=
st ', '', d)} \
>             "
>
>  # if no test suite matches PV release of Lua exactly, download the suite=
 for the closest Lua release.
> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-dev=
tools/perl/perl-ptest.inc
> index e07355d3f5..98d7b1c2a2 100644
> --- a/meta/recipes-devtools/perl/perl-ptest.inc
> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
> @@ -51,7 +51,7 @@ python populate_packages:prepend() {
>      # Put all *.t files from the lib dir in the ptest package
>      # do_split_packages requires a pair of () in the regex, but we have =
nothing
>      # to match, so use an empty pair.
> -    if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
> +    if bb.utils.contains('PTEST_ENABLED', '1', True, False, d):
>          do_split_packages(d, d.expand('${libdir}/perl/${PV}'), r'.*\.t()=
',
>              '${PN}-ptest%s', '%s', recursive=3DTrue, match_path=3DTrue)
>  }
> diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/=
recipes-devtools/python/python3-bcrypt_4.1.2.bb
> index 860f291476..f7a184be9a 100644
> --- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
> +++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8f7bb094c7232b=
058c7e9f2e431f389c"
>  HOMEPAGE =3D "https://pypi.org/project/bcrypt/"
>
>  DEPENDS +=3D "${PYTHON_PN}-cffi-native"
> -LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -=
fuse-ld=3Dbfd', '', d)}"
> +LDFLAGS:append =3D "${@bb.utils.contains('PTEST_ENABLED', '1', ' -fuse-l=
d=3Dbfd', '', d)}"
>
>  SRC_URI[sha256sum] =3D "33313a1200a3ae90b75587ceac502b048b840fc69e7f7a09=
05b5f87fac7a1258"
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/rec=
ipes-devtools/valgrind/valgrind_3.21.0.bb
> index 67a197c509..47a873df31 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>                      file://COPYING.DOCS;md5=3D24ea4c7092233849b439469933=
3b5c56"
>
>  DEPENDS =3D " \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '',=
 d)} \
> +           ${@bb.utils.contains('PTEST_ENABLED', '1', 'boost', '', d)} \
>          "
>
>  SRC_URI =3D "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 =
\
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-=
kernel/linux/linux-yocto-dev.bb
> index c91aa073e8..6490a95c67 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -60,7 +60,7 @@ KERNEL_FEATURES:append:qemuall=3D" cfg/virtio.scc featu=
res/drm-bochs/drm-bochs.scc
>  KERNEL_FEATURES:append:qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
> -KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc", "", d)}"
> -KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("PTEST_ENABLED", "1", =
" features/scsi/scsi-debug.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("PTEST_ENABLED", "1", =
" features/gpio/mockup.scc", "", d)}"
>
>  KERNEL_VERSION_SANITY_SKIP =3D "1"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_6.6.bb
> index af8027c51a..441415f9de 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> @@ -44,5 +44,5 @@ KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES:append:qemuall=3D" cfg/virtio.scc features/drm-bochs/drm=
-bochs.scc"
>  KERNEL_FEATURES:append:qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
> -KERNEL_FEATURES:append =3D "${@bb.utils.contains("DISTRO_FEATURES", "pte=
st", " features/scsi/scsi-debug.scc", "", d)}"
> -KERNEL_FEATURES:append =3D "${@bb.utils.contains("DISTRO_FEATURES", "pte=
st", " features/gpio/mockup.scc", "", d)}"
> +KERNEL_FEATURES:append =3D "${@bb.utils.contains("PTEST_ENABLED", "1", "=
 features/scsi/scsi-debug.scc", "", d)}"
> +KERNEL_FEATURES:append =3D "${@bb.utils.contains("PTEST_ENABLED", "1", "=
 features/gpio/mockup.scc", "", d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 7a47bac057..154cf37bf3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -62,8 +62,8 @@ KERNEL_FEATURES:append:qemuall=3D" cfg/virtio.scc featu=
res/drm-bochs/drm-bochs.scc
>  KERNEL_FEATURES:append:qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
> -KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc", "", d)}"
> -KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("PTEST_ENABLED", "1", =
" features/scsi/scsi-debug.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("PTEST_ENABLED", "1", =
" features/gpio/mockup.scc", "", d)}"
>  KERNEL_FEATURES:append:powerpc =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64 =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/powerpc-debug.scc"
>
> rday



--
Alex Kiernan

