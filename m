Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA477C54791
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 19:36:27 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.19597.1710012981939404866
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 11:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QFU8zRR6;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29baec5f751so1240170a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 11:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710012981; x=1710617781; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WybMUts3UFSBwudFbNXmW3iH4qUEj1ZtRV1qhvccCWU=;
        b=QFU8zRR6TfWWUPv44djiOzWMKHmCetdatgn6vzntl9mY7twIYk5Xh17P8Kp/JMH5rY
         rItJ3wAI8QJpc/1CXR1g+rD2ZlF6DnqDkiVtYPO2fq+pRmz8cdtA4AkpydsvB8WJHyei
         54SnZxyCyUsFYOHNT5YugjttRk9qgNQHDvBKjnJ/Pz8c1WvpTYeiWjmKMnbs77xGNpFK
         XPISA1dSdTbpQh1p8Y1gmCYvmh94YGix3w1OShT0NnNVoqE/IzRATlykfXQQS+yLHG0E
         gvMSiUZ+xlpNz9sTHiKZVhdRMXBqBAyGquj0e9/j3Q3vr0/9GGZ51TFOhvtxwbxJtHKb
         R56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012981; x=1710617781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WybMUts3UFSBwudFbNXmW3iH4qUEj1ZtRV1qhvccCWU=;
        b=hY6baZfDSWFSn2LZ4HszwOJmn7/PahgeghMoMDOEkUSqlG6Ce5TNIA2sGTO8WSaf3b
         85RtyHZvSzoO6BLFMS4gqdsyiTn9eJcYkY4W7vG8qkThiQwEUqNMAj/e0jKw1TuI26oe
         Gu+emMgZUV4WgSMuQetR/y9HZyx4g9izJJlPJfdPEFXXThVUvkSMBSAX9kczERjYnHpY
         /TTCf6mf34fKoaIeTKFlHpHcy5td8CFDMyqP3qs81zCw3ssyCTSGRjLXVM8sbR7/+vu5
         wxmFRDNOcd1+HlCc8t3zoN1eNIArpsoCGUAFZrwDeO0PLhHb54/dlTMYjRWlOKw9UbiR
         wcxA==
X-Gm-Message-State: AOJu0YyvIC+1QCI4YdOGXfvW/PyxU9LcXFu9/3IWokPYbCT3F7IP1Gx6
	YoHf9vGwS7iaxNoKExEpbfpK3J04cDJWymDff3UuInKmTnuj+bC1t63jIuMZ+NjOfhiaA9fUMz0
	+2kp6fZynOd4yVMXfUT7KBRB3vtY=
X-Google-Smtp-Source: AGHT+IGcU4tXd8C3319+8/LOBqj1ngAxLL7iJl5Bxb8oqNcKVDpa4HN/e15D/sByGsIvRGaMmi9ZTpjryvKYQPjOCyc=
X-Received: by 2002:a17:90a:fe10:b0:29a:ee6f:58cc with SMTP id
 ck16-20020a17090afe1000b0029aee6f58ccmr3754947pjb.6.1710012981103; Sat, 09
 Mar 2024 11:36:21 -0800 (PST)
MIME-Version: 1.0
References: <f43b9b3-8c6e-d352-ca9d-7b7228c0b09e@crashcourse.ca>
In-Reply-To: <f43b9b3-8c6e-d352-ca9d-7b7228c0b09e@crashcourse.ca>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 9 Mar 2024 14:36:09 -0500
Message-ID: <CADkTA4O0oLu9FYRrHfb4GCWzwXBj5XF4XuxUOYDS5W-VE0nGCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest: test for PTEST_ENABLED instead of DISTRO_FEATURES
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 19:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196871

On Sat, Mar 9, 2024 at 5:29=E2=80=AFAM Robert P. J. Day <rpjday@crashcourse=
.ca> wrote:
>
>
> As ptest.bbclass defines the more intuitive ptest-related variable:
>

The ptest bbclass is in classes-recipe, while the distro feature is in
the global conf space.

They aren't really equivalent from that point of view.

The kernel bbclasses don't inherit ptest at all (and don't need to), so
using it in the kernel recipes won't actually do anything (except always
make sure the ptest options are not enabled).

Cheers,

Bruce


>   PTEST_ENABLED =3D
>     "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
>
> modify a number of obvious recipe ptest checks to use that simpler
> form.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   i did a simple textual substitution so as long as that's all that's
> needed, this should work.
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index e963001d09..bb01fa7466 100644
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
> index 93fa645f33..4e6ca5e074 100644
> --- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
> +++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8f7bb094c7232b=
058c7e9f2e431f389c"
>  HOMEPAGE =3D "https://pypi.org/project/bcrypt/"
>
>  DEPENDS +=3D "python3-cffi-native"
> -LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -=
fuse-ld=3Dbfd', '', d)}"
> +LDFLAGS:append =3D "${@bb.utils.contains('PTEST_ENABLED', '1', ' -fuse-l=
d=3Dbfd', '', d)}"
>
>  SRC_URI[sha256sum] =3D "33313a1200a3ae90b75587ceac502b048b840fc69e7f7a09=
05b5f87fac7a1258"
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/rec=
ipes-devtools/valgrind/valgrind_3.22.0.bb
> index 74ac7ec9d5..c0f3784261 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
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
> index bd3e5a9406..dce9339643 100644
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
est", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("PTEST_ENABLED", "1", =
" features/scsi/scsi-debug.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("PTEST_ENABLED", "1", =
" features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
>
>  KERNEL_VERSION_SANITY_SKIP =3D "1"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_6.6.bb
> index e80594b45e..acf90b8f99 100644
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
st", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
> +KERNEL_FEATURES:append =3D "${@bb.utils.contains("PTEST_ENABLED", "1", "=
 features/scsi/scsi-debug.scc", "", d)}"
> +KERNEL_FEATURES:append =3D "${@bb.utils.contains("PTEST_ENABLED", "1", "=
 features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 0f62dea29a..c7e411b5fd 100644
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
est", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("PTEST_ENABLED", "1", =
" features/scsi/scsi-debug.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("PTEST_ENABLED", "1", =
" features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
>  KERNEL_FEATURES:append:powerpc =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64 =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/powerpc-debug.scc"
>
>
>
>
> --
>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196868): https://lists.openembedded.org/g/openembedde=
d-core/message/196868
> Mute This Topic: https://lists.openembedded.org/mt/104825491/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

