Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E109EC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 14:47:47 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.23910.1705675667319898904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 06:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOWM6XM7;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bb9d54575cso523828b6e.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 06:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705675666; x=1706280466; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOOU3n0ETI2vDV6rkRvr+4EM9l6ZLtSw3cqPrYGNdO4=;
        b=mOWM6XM7kAjq6e4O6dAHro3rhZezZ5VME/QbmkXvr38CSGV3AFua06vV8xV9eGydOQ
         Dv0wQI4G0ZAGG4szK336ufdLUUO3kzlezmSsQ/nDdo0wpIo/5eMexY+S+f3U0trmg3hO
         LxFjn7msP6Wu4myrUWY5DN/nBvIdqsF55nJxy6N1L0eb1oerMTlIaHV3Y9LncQexXb2n
         lJ1DJY0UteRZYBkekgjrjjjNwQ5b0fASl2pDw0jHtKC2S86YEay8/DmPu/jAlOI4nyNN
         9gJLatb0Auu1OC88cGKvoCAcpmM3zXdST+t/aNJZd9GzRw4209d/uJx8nmwpSPwYX/wC
         1gRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705675666; x=1706280466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOOU3n0ETI2vDV6rkRvr+4EM9l6ZLtSw3cqPrYGNdO4=;
        b=ASzvtUObbUjUK6NHCp/1hrPDgra7kSgdzzmxmdHKdOUe4/TFP9Wp61szFMlYrQO42L
         8OdK+rKYul4LkaesKPFEF084UjoruBH/HrYf7HQku0oh6l07Iq/trvAzEMJko/w3QtbW
         FpIz1qLo29MFMG8TWxHpo2RWW3Mx2wqxLrr2X0iNW24IIq7drKA5S+v28ZRDXbDKGcMz
         xLjaZowG0qgyhXGBpNM5RCK22z4LJ8dd6hJVvQtAS0hJmSm22jkC3E5Zw9IDotzmtXux
         SHzfvW2/sGsgzwciVitTwzsXw/D1yJVwHhVbb1jOVcsnlfEyE1ru0XL5t3p5+CrYdQTN
         gbQg==
X-Gm-Message-State: AOJu0YxK8xgTnglzBAKAGwRfKU/QbDHUVDq5ztjibAMrUd+FSECRJnoB
	tNwaUkSMwhunppBII0Wm9syE2tjVLcKDUSSwK4SLNERxJ8nRIH481bT9Uq9llBlhZ4tq5K+Z71p
	EgWrowBf8ZIdVNY+XJK5QPZLf8q/SD9V2VRM=
X-Google-Smtp-Source: AGHT+IGEnY4hhSvsjhabqd83PYKCMfHcwDVt3a2F4fN+7A3E/qDZB7QsspFx/C9mrP6j/8ZlENXVKlbd+AwddeaBSXo=
X-Received: by 2002:a05:6871:2302:b0:210:9977:ba5b with SMTP id
 sf2-20020a056871230200b002109977ba5bmr2448473oab.119.1705675666064; Fri, 19
 Jan 2024 06:47:46 -0800 (PST)
MIME-Version: 1.0
References: <20240116195353.3362079-1-raj.khem@gmail.com> <5cdc6851-8dc5-40d8-81ec-0660257e54f0@skyrain.eu>
 <CAMKF1sodvmZVho3qP2X10EJE8MAFxhJ03HevN4JwxG7nFVqkOg@mail.gmail.com> <48009bc5-118f-4ccf-9278-354b3445b27e@skyrain.eu>
In-Reply-To: <48009bc5-118f-4ccf-9278-354b3445b27e@skyrain.eu>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Jan 2024 06:47:20 -0800
Message-ID: <CAMKF1sq=5y83bJEAQEibM+UZByZ04D1bYTNzEmjOB95Oojw0oA@mail.gmail.com>
Subject: Re: [OE-core] [RFT][PATCH] glibc: Upgrade to 2.39
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 14:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194051

On Thu, Jan 18, 2024 at 11:22=E2=80=AFPM Andrej Valek <andrej.v@skyrain.eu>=
 wrote:
>
> Hello Raj,
>
> I will try to take a look on this today. Is the patch the same as here
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dyoe/mut&id=3Dc0594e=
def0d2108860421d0cfd460993264e18c3
> ? Means, if I can take it from there.

yes. Keep an eye on yoe/mut, as I am updating it there

>
> Thanks,
> Andy
>
> On 17.01.2024 08:20, Khem Raj wrote:
> > On Tue, Jan 16, 2024 at 11:10=E2=80=AFPM Andrej Valek <andrej.v@skyrain=
.eu> wrote:
> >> Hello Raj,
> >>
> >> Don't forget to change the glibc-version.inc too and try to make a
> >> optimization/cleaning like I proposed here:
> >> https://lists.openembedded.org/g/openembedded-core/message/193572 ;).
> > yeah CVEs list will need cleaning anyway as it will be verson bump. But=
 if
> > you turn your suggestion into a patch I can include it in patchset.
> >
> >> Regards,
> >> Andy
> >>
> >> On 16.01.2024 20:53, Khem Raj wrote:
> >>> Upgrade localdef to get glibc 2.39 build fixes
> >>> Details of release [1]
> >>>
> >>> [1] https://sourceware.org/glibc/wiki/Release/2.39
> >>>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>>    meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >>>    ...2.38.bb =3D> cross-localedef-native_2.39.bb} |  0
> >>>    meta/recipes-core/glibc/glibc-common.inc      |  2 +-
> >>>    ...bc-locale_2.38.bb =3D> glibc-locale_2.39.bb} |  0
> >>>    ...bc-mtrace_2.38.bb =3D> glibc-mtrace_2.39.bb} |  0
> >>>    ...-scripts_2.38.bb =3D> glibc-scripts_2.39.bb} |  0
> >>>    ...tsuite_2.38.bb =3D> glibc-testsuite_2.39.bb} |  0
> >>>    meta/recipes-core/glibc/glibc-version.inc     |  8 ++--
> >>>    ...ests_2.38.bb =3D> glibc-y2038-tests_2.39.bb} |  0
> >>>    ...dd-hardlink-resolver-from-util-linux.patch |  2 +-
> >>>    ...-fix-ups-hardlink-to-make-it-compile.patch |  2 +-
> >>>    ...Look-for-host-system-ld.so.cache-as-.patch |  8 ++--
> >>>    ...Fix-buffer-overrun-with-a-relocated-.patch |  4 +-
> >>>    ...Raise-the-size-of-arrays-containing-.patch | 22 ++++-----
> >>>    ...k-glibc-Allow-64-bit-atomics-for-x86.patch |  4 +-
> >>>    ...Make-relocatable-install-for-locales.patch | 10 ++--
> >>>    ...Fall-back-to-faccessat-on-faccess2-r.patch |  4 +-
> >>>    ...the-path-sets-wrong-config-variables.patch |  2 +-
> >>>    ...ss-building-and-testing-instructions.patch |  2 +-
> >>>    ...glibc-Help-bootstrap-cross-toolchain.patch |  4 +-
> >>>    ...eglibc-Resolve-__fpscr_values-on-SH4.patch |  4 +-
> >>>    ...port-cross-locale-generation-support.patch | 46 +++++++++------=
----
> >>>    ...-archive-uses-a-hard-coded-locale-pa.patch |  4 +-
> >>>    ...Do-not-ask-compiler-for-finding-arch.patch |  2 +-
> >>>    ...y-the-header-between-arm-and-aarch64.patch |  4 +-
> >>>    ...h-printf-builtin-in-nscd-init-script.patch |  2 +-
> >>>    ...igure.ac-Set-libc_cv_rootsbindir-onl.patch |  2 +-
> >>>    ...ell-interpreter-overridable-in-tzsel.patch |  6 +--
> >>>    ...Use-bin-sh-default-shell-interpreter.patch |  2 +-
> >>>    ...d-failed-in-unprivileged-process-BZ-.patch |  6 +--
> >>>    ...build-time-paths-in-the-output-binar.patch |  6 +--
> >>>    ...e-Pass-mcpu-along-with-march-to-dete.patch |  5 +-
> >>>    ...Bump-__GLIBC_MINOR__-to-39-on-master.patch | 25 ++++++++++
> >>>    .../glibc/{glibc_2.38.bb =3D> glibc_2.39.bb}    |  1 +
> >>>    34 files changed, 106 insertions(+), 85 deletions(-)
> >>>    rename meta/recipes-core/glibc/{cross-localedef-native_2.38.bb =3D=
> cross-localedef-native_2.39.bb} (100%)
> >>>    rename meta/recipes-core/glibc/{glibc-locale_2.38.bb =3D> glibc-lo=
cale_2.39.bb} (100%)
> >>>    rename meta/recipes-core/glibc/{glibc-mtrace_2.38.bb =3D> glibc-mt=
race_2.39.bb} (100%)
> >>>    rename meta/recipes-core/glibc/{glibc-scripts_2.38.bb =3D> glibc-s=
cripts_2.39.bb} (100%)
> >>>    rename meta/recipes-core/glibc/{glibc-testsuite_2.38.bb =3D> glibc=
-testsuite_2.39.bb} (100%)
> >>>    rename meta/recipes-core/glibc/{glibc-y2038-tests_2.38.bb =3D> gli=
bc-y2038-tests_2.39.bb} (100%)
> >>>    create mode 100644 meta/recipes-core/glibc/glibc/0024-features.h-B=
ump-__GLIBC_MINOR__-to-39-on-master.patch
> >>>    rename meta/recipes-core/glibc/{glibc_2.38.bb =3D> glibc_2.39.bb} =
(98%)
> >>>
> >>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/=
distro/include/tcmode-default.inc
> >>> index 3720a4c5b86..977fb316107 100644
> >>> --- a/meta/conf/distro/include/tcmode-default.inc
> >>> +++ b/meta/conf/distro/include/tcmode-default.inc
> >>> @@ -20,7 +20,7 @@ GCCVERSION ?=3D "13.%"
> >>>    SDKGCCVERSION ?=3D "${GCCVERSION}"
> >>>    BINUVERSION ?=3D "2.41%"
> >>>    GDBVERSION ?=3D "14.%"
> >>> -GLIBCVERSION ?=3D "2.38%"
> >>> +GLIBCVERSION ?=3D "2.39%"
> >>>    LINUXLIBCVERSION ?=3D "6.6%"
> >>>    QEMUVERSION ?=3D "8.1%"
> >>>    GOVERSION ?=3D "1.20%"
> >>> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.38.bb b=
/meta/recipes-core/glibc/cross-localedef-native_2.39.bb
> >>> similarity index 100%
> >>> rename from meta/recipes-core/glibc/cross-localedef-native_2.38.bb
> >>> rename to meta/recipes-core/glibc/cross-localedef-native_2.39.bb
> >>> diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-=
core/glibc/glibc-common.inc
> >>> index be33c29857c..5b62884a017 100644
> >>> --- a/meta/recipes-core/glibc/glibc-common.inc
> >>> +++ b/meta/recipes-core/glibc/glibc-common.inc
> >>> @@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET:armv6 =3D "arm"
> >>>    #
> >>>    COMPATIBLE_HOST:libc-musl:class-target =3D "null"
> >>>
> >>> -PV =3D "2.38"
> >>> +PV =3D "2.39+git"
> >>> diff --git a/meta/recipes-core/glibc/glibc-locale_2.38.bb b/meta/reci=
pes-core/glibc/glibc-locale_2.39.bb
> >>> similarity index 100%
> >>> rename from meta/recipes-core/glibc/glibc-locale_2.38.bb
> >>> rename to meta/recipes-core/glibc/glibc-locale_2.39.bb
> >>> diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.38.bb b/meta/reci=
pes-core/glibc/glibc-mtrace_2.39.bb
> >>> similarity index 100%
> >>> rename from meta/recipes-core/glibc/glibc-mtrace_2.38.bb
> >>> rename to meta/recipes-core/glibc/glibc-mtrace_2.39.bb
> >>> diff --git a/meta/recipes-core/glibc/glibc-scripts_2.38.bb b/meta/rec=
ipes-core/glibc/glibc-scripts_2.39.bb
> >>> similarity index 100%
> >>> rename from meta/recipes-core/glibc/glibc-scripts_2.38.bb
> >>> rename to meta/recipes-core/glibc/glibc-scripts_2.39.bb
> >>> diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.38.bb b/meta/r=
ecipes-core/glibc/glibc-testsuite_2.39.bb
> >>> similarity index 100%
> >>> rename from meta/recipes-core/glibc/glibc-testsuite_2.38.bb
> >>> rename to meta/recipes-core/glibc/glibc-testsuite_2.39.bb
> >>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes=
-core/glibc/glibc-version.inc
> >>> index 5f24a108267..278576eb285 100644
> >>> --- a/meta/recipes-core/glibc/glibc-version.inc
> >>> +++ b/meta/recipes-core/glibc/glibc-version.inc
> >>> @@ -1,7 +1,7 @@
> >>> -SRCBRANCH ?=3D "release/2.38/master"
> >>> -PV =3D "2.38+git"
> >>> -SRCREV_glibc ?=3D "1e04dcec491bd8f48b5b74ce3e8414132578a645"
> >>> -SRCREV_localedef ?=3D "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
> >>> +SRCBRANCH ?=3D "master"
> >>> +PV =3D "2.39+git"
> >>> +SRCREV_glibc ?=3D "9d94997b5f9445afd4f2bccc5fa60ff7c4361ec1"
> >>> +SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
> >>>
> >>>    GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3D=
https"
> >>>
> >>> diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.38.bb b/meta=
/recipes-core/glibc/glibc-y2038-tests_2.39.bb
> >>> similarity index 100%
> >>> rename from meta/recipes-core/glibc/glibc-y2038-tests_2.38.bb
> >>> rename to meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
> >>> diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlin=
k-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-local=
edef-Add-hardlink-resolver-from-util-linux.patch
> >>> index eb3da94b8ba..4f919078dd0 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resol=
ver-from-util-linux.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resol=
ver-from-util-linux.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 7c06ca59b47ce06f785b9fce7b9e9d675d5b6e10 Mon Sep 17 00:00:00 20=
01
> >>> +From 544d23dea91b2be793c805b9e4bce8cd1d28121f Mon Sep 17 00:00:00 20=
01
> >>>    From: Jason Wessel <jason.wessel@windriver.com>
> >>>    Date: Sat, 7 Dec 2019 09:59:22 -0800
> >>>    Subject: [PATCH] localedef: Add hardlink resolver from util-linux
> >>> diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-har=
dlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localed=
ef-fix-ups-hardlink-to-make-it-compile.patch
> >>> index 2dc4634dd5c..7c8fa973ec3 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-t=
o-make-it-compile.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-t=
o-make-it-compile.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 9ff5200eb16e9c89ca8da89d7e07975d082a13b0 Mon Sep 17 00:00:00 20=
01
> >>> +From ebb1e37285ab541135005cfe945b7a58e4b95040 Mon Sep 17 00:00:00 20=
01
> >>>    From: Jason Wessel <jason.wessel@windriver.com>
> >>>    Date: Sat, 7 Dec 2019 10:01:37 -0800
> >>>    Subject: [PATCH] localedef: fix-ups hardlink to make it compile
> >>> diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-=
for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-=
nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
> >>> index f2602d0e567..bd4b5aa98b3 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-hos=
t-system-ld.so.cache-as-.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-hos=
t-system-ld.so.cache-as-.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 0d996c5600603a67f0265e870511cdd18dbaa8a6 Mon Sep 17 00:00:00 20=
01
> >>> +From 9770abfda8e85fe027f95871bc03450d05b1e2c8 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 18 Mar 2015 01:48:24 +0000
> >>>    Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache=
 as well
> >>> @@ -30,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     1 file changed, 8 insertions(+), 8 deletions(-)
> >>>
> >>>    diff --git a/elf/dl-load.c b/elf/dl-load.c
> >>> -index 9a87fda9c9..0a6fa9b8f0 100644
> >>> +index ce8fdea302..1f502eb026 100644
> >>>    --- a/elf/dl-load.c
> >>>    +++ b/elf/dl-load.c
> >>> -@@ -2102,6 +2102,14 @@ _dl_map_object (struct link_map *loader, cons=
t char *name,
> >>> +@@ -2105,6 +2105,14 @@ _dl_map_object (struct link_map *loader, cons=
t char *name,
> >>>                 }
> >>>             }
> >>>
> >>> @@ -48,7 +48,7 @@ index 9a87fda9c9..0a6fa9b8f0 100644
> >>>     #ifdef USE_LDCONFIG
> >>>           if (fd =3D=3D -1
> >>>          && (__glibc_likely ((mode & __RTLD_SECURE) =3D=3D 0)
> >>> -@@ -2160,14 +2168,6 @@ _dl_map_object (struct link_map *loader, cons=
t char *name,
> >>> +@@ -2163,14 +2171,6 @@ _dl_map_object (struct link_map *loader, cons=
t char *name,
> >>>        }
> >>>     #endif
> >>>
> >>> diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-b=
uffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-=
nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
> >>> index 974312367e8..19fc561a068 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-o=
verrun-with-a-relocated-.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-o=
verrun-with-a-relocated-.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From c3492719b2deaf3339eefb1ab30f4337e592ed80 Mon Sep 17 00:00:00 20=
01
> >>> +From 587b92ff99e6d8f59c461ee8beecae39d8818f7e Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 18 Mar 2015 01:50:00 +0000
> >>>    Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a reloca=
ted SDK
> >>> @@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     1 file changed, 12 insertions(+)
> >>>
> >>>    diff --git a/elf/dl-load.c b/elf/dl-load.c
> >>> -index 0a6fa9b8f0..3a23dc618c 100644
> >>> +index 1f502eb026..c4a543fb00 100644
> >>>    --- a/elf/dl-load.c
> >>>    +++ b/elf/dl-load.c
> >>>    @@ -1802,7 +1802,19 @@ open_path (const char *name, size_t namelen=
, int mode,
> >>> diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise=
-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-=
nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
> >>> index 086e0c6f143..55892417f49 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-si=
ze-of-arrays-containing-.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-si=
ze-of-arrays-containing-.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From e874dacbfdb06520240887e9077c58006ee33f87 Mon Sep 17 00:00:00 20=
01
> >>> +From 49caf586b80ba030a0ee4af9f6128ff2979ea636 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 18 Mar 2015 01:51:38 +0000
> >>>    Subject: [PATCH] nativesdk-glibc: Raise the size of arrays contain=
ing dl paths
> >>> @@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     8 files changed, 15 insertions(+), 10 deletions(-)
> >>>
> >>>    diff --git a/elf/dl-cache.c b/elf/dl-cache.c
> >>> -index 804bf23222..d99501c389 100644
> >>> +index 85f3f179ed..cc55887c56 100644
> >>>    --- a/elf/dl-cache.c
> >>>    +++ b/elf/dl-cache.c
> >>>    @@ -352,6 +352,10 @@ search_cache (const char *string_table, uint3=
2_t string_table_size,
> >>> @@ -41,7 +41,7 @@ index 804bf23222..d99501c389 100644
> >>>     _dl_cache_libcmp (const char *p1, const char *p2)
> >>>     {
> >>>    diff --git a/elf/dl-load.c b/elf/dl-load.c
> >>> -index 3a23dc618c..563e703096 100644
> >>> +index c4a543fb00..27fb70f09b 100644
> >>>    --- a/elf/dl-load.c
> >>>    +++ b/elf/dl-load.c
> >>>    @@ -117,8 +117,8 @@ enum { ncapstr =3D 1, max_capstrlen =3D 0 };
> >>> @@ -56,7 +56,7 @@ index 3a23dc618c..563e703096 100644
> >>>       SYSTEM_DIRS_LEN
> >>>     };
> >>>    diff --git a/elf/dl-usage.c b/elf/dl-usage.c
> >>> -index 98f0b0d027..ab4f76e1fe 100644
> >>> +index 5baac4ba8e..60097ad0e2 100644
> >>>    --- a/elf/dl-usage.c
> >>>    +++ b/elf/dl-usage.c
> >>>    @@ -25,6 +25,8 @@
> >>> @@ -68,7 +68,7 @@ index 98f0b0d027..ab4f76e1fe 100644
> >>>     void
> >>>     _dl_usage (const char *argv0, const char *wrong_option)
> >>>     {
> >>> -@@ -184,7 +186,7 @@ setting environment variables (which would be in=
herited by subprocesses).\n\
> >>> +@@ -185,7 +187,7 @@ setting environment variables (which would be in=
herited by subprocesses).\n\
> >>>       --list                list all dependencies and how they are re=
solved\n\
> >>>       --verify              verify that given object really is a dyna=
mically linked\n\
> >>>                             object we can handle\n\
> >>> @@ -77,7 +77,7 @@ index 98f0b0d027..ab4f76e1fe 100644
> >>>       --library-path PATH   use given PATH instead of content of the =
environment\n\
> >>>                             variable LD_LIBRARY_PATH\n\
> >>>       --glibc-hwcaps-prepend LIST\n\
> >>> -@@ -203,7 +205,7 @@ setting environment variables (which would be in=
herited by subprocesses).\n\
> >>> +@@ -204,7 +206,7 @@ setting environment variables (which would be in=
herited by subprocesses).\n\
> >>>     \n\
> >>>     This program interpreter self-identifies as: " RTLD "\n\
> >>>     ",
> >>> @@ -87,7 +87,7 @@ index 98f0b0d027..ab4f76e1fe 100644
> >>>       print_hwcaps_subdirectories (state);
> >>>       _exit (EXIT_SUCCESS);
> >>>    diff --git a/elf/interp.c b/elf/interp.c
> >>> -index ae21ae0cb3..b168e6da66 100644
> >>> +index 8b705824bf..7d094829f3 100644
> >>>    --- a/elf/interp.c
> >>>    +++ b/elf/interp.c
> >>>    @@ -18,5 +18,5 @@
> >>> @@ -98,7 +98,7 @@ index ae21ae0cb3..b168e6da66 100644
> >>>    +const char __invoke_dynamic_linker__[4096] __attribute__ ((sectio=
n (".interp")))
> >>>       =3D RUNTIME_LINKER;
> >>>    diff --git a/elf/ldconfig.c b/elf/ldconfig.c
> >>> -index d26eef1fb4..e5af6e5c01 100644
> >>> +index b64c54b53e..caf7001745 100644
> >>>    --- a/elf/ldconfig.c
> >>>    +++ b/elf/ldconfig.c
> >>>    @@ -150,6 +150,8 @@ static struct argp argp =3D
> >>> @@ -111,7 +111,7 @@ index d26eef1fb4..e5af6e5c01 100644
> >>>     static error_t
> >>>     parse_opt (int key, char *arg, struct argp_state *state)
> >>>    diff --git a/elf/rtld.c b/elf/rtld.c
> >>> -index a91e2a4471..56d816d4d9 100644
> >>> +index 4f494b792e..d1c1252188 100644
> >>>    --- a/elf/rtld.c
> >>>    +++ b/elf/rtld.c
> >>>    @@ -190,6 +190,7 @@ dso_name_valid_for_suid (const char *p)
> >>> @@ -123,7 +123,7 @@ index a91e2a4471..56d816d4d9 100644
> >>>     static void
> >>>     audit_list_init (struct audit_list *list)
> >>>    diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
> >>> -index ee9e97e1bd..01a99382d0 100644
> >>> +index 1063c31a2b..57fa832e52 100644
> >>>    --- a/iconv/gconv_conf.c
> >>>    +++ b/iconv/gconv_conf.c
> >>>    @@ -35,7 +35,7 @@
> >>> @@ -136,7 +136,7 @@ index ee9e97e1bd..01a99382d0 100644
> >>>     /* Type to represent search path.  */
> >>>     struct path_elem
> >>>    diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache=
.h
> >>> -index bd39ff7fb7..38f9e2ad57 100644
> >>> +index 919e49ffc8..cd3f8ba94b 100644
> >>>    --- a/sysdeps/generic/dl-cache.h
> >>>    +++ b/sysdeps/generic/dl-cache.h
> >>>    @@ -34,10 +34,6 @@
> >>> diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow=
-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesd=
k-glibc-Allow-64-bit-atomics-for-x86.patch
> >>> index 421afdca1ca..56eaaed4b7c 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit=
-atomics-for-x86.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit=
-atomics-for-x86.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 76eaf7340a7f9063ab1ad2d7c6c0e205f22f544c Mon Sep 17 00:00:00 20=
01
> >>> +From 3a94365c730d174a3c30c6d9282e6ca12d9ad091 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Thu, 31 Dec 2015 14:35:35 -0800
> >>>    Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
> >>> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     1 file changed, 1 insertion(+), 6 deletions(-)
> >>>
> >>>    diff --git a/sysdeps/x86/atomic-machine.h b/sysdeps/x86/atomic-mac=
hine.h
> >>> -index 95663099e4..4d81efc51a 100644
> >>> +index cfd395087b..28a937c468 100644
> >>>    --- a/sysdeps/x86/atomic-machine.h
> >>>    +++ b/sysdeps/x86/atomic-machine.h
> >>>    @@ -26,19 +26,14 @@
> >>> diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-=
relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-=
nativesdk-glibc-Make-relocatable-install-for-locales.patch
> >>> index 64243b10981..54c085a7144 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocat=
able-install-for-locales.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocat=
able-install-for-locales.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From ef8bb46455d602cb00caf59b2044a9a23b240cc2 Mon Sep 17 00:00:00 20=
01
> >>> +From 296bdde0683aa55cdea0fd0cab05ff8fbc462b17 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Fri, 3 Aug 2018 09:55:12 -0700
> >>>    Subject: [PATCH] nativesdk-glibc: Make relocatable install for loc=
ales
> >>> @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     4 files changed, 8 insertions(+), 7 deletions(-)
> >>>
> >>>    diff --git a/locale/findlocale.c b/locale/findlocale.c
> >>> -index 1b7034348b..939d4fd613 100644
> >>> +index 8d6e4e33e3..bfe74f241d 100644
> >>>    --- a/locale/findlocale.c
> >>>    +++ b/locale/findlocale.c
> >>>    @@ -55,7 +55,7 @@ struct __locale_data *const _nl_C[] attribute_hi=
dden =3D
> >>> @@ -41,7 +41,7 @@ index 1b7034348b..939d4fd613 100644
> >>>       else
> >>>         /* We really have to load some data.  First see whether the n=
ame is
> >>>    diff --git a/locale/loadarchive.c b/locale/loadarchive.c
> >>> -index 5b857d5d24..e642912e2a 100644
> >>> +index 452e3eb6e3..c7467aec42 100644
> >>>    --- a/locale/loadarchive.c
> >>>    +++ b/locale/loadarchive.c
> >>>    @@ -42,7 +42,7 @@
> >>> @@ -54,7 +54,7 @@ index 5b857d5d24..e642912e2a 100644
> >>>     /* Size of initial mapping window, optimal if large enough to
> >>>        cover the header plus the initial locale.  */
> >>>    diff --git a/locale/localeinfo.h b/locale/localeinfo.h
> >>> -index 8bbf281427..7a930079a5 100644
> >>> +index ed698faef1..f7efc288a5 100644
> >>>    --- a/locale/localeinfo.h
> >>>    +++ b/locale/localeinfo.h
> >>>    @@ -347,7 +347,7 @@ _nl_lookup_word (locale_t l, int category, int=
 item)
> >>> @@ -67,7 +67,7 @@ index 8bbf281427..7a930079a5 100644
> >>>     /* Load the locale data for CATEGORY from the file specified by *=
NAME.
> >>>        If *NAME is "", use environment variables as specified by POSI=
X, and
> >>>    diff --git a/locale/programs/locale.c b/locale/programs/locale.c
> >>> -index 1d1a9b2f00..d9ed395b39 100644
> >>> +index c7ee1874e8..8281e32236 100644
> >>>    --- a/locale/programs/locale.c
> >>>    +++ b/locale/programs/locale.c
> >>>    @@ -631,6 +631,7 @@ nameentcmp (const void *a, const void *b)
> >>> diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-=
back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0008-=
nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
> >>> index 38dca83b1b4..096764009a1 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to=
-faccessat-on-faccess2-r.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to=
-faccessat-on-faccess2-r.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 7f05e35c675a6d1af2144b4cfbabab250de43f38 Mon Sep 17 00:00:00 20=
01
> >>> +From 70da806febac8b2eead6ddc32451bbc1787a1d7d Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Sat, 6 Mar 2021 14:48:56 -0800
> >>>    Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on facces=
s2 returns
> >>> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     1 file changed, 5 insertions(+), 1 deletion(-)
> >>>
> >>>    diff --git a/sysdeps/unix/sysv/linux/faccessat.c b/sysdeps/unix/sy=
sv/linux/faccessat.c
> >>> -index 0ccbd778b5..9df1a0fe12 100644
> >>> +index 2fa57fd63d..4d0d5ff0c4 100644
> >>>    --- a/sysdeps/unix/sysv/linux/faccessat.c
> >>>    +++ b/sysdeps/unix/sysv/linux/faccessat.c
> >>>    @@ -30,7 +30,11 @@ __faccessat (int fd, const char *file, int mode=
, int flag)
> >>> diff --git a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-s=
ets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0009-yes-w=
ithin-the-path-sets-wrong-config-variables.patch
> >>> index 61fdcb08167..364e5cfde82 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wro=
ng-config-variables.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wro=
ng-config-variables.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 70e721856c3ebf6ae0ea84b828396bd2af090acf Mon Sep 17 00:00:00 20=
01
> >>> +From 2192588942c5bc3b5fa10fc6d7433923f42e9ba0 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 18 Mar 2015 00:31:06 +0000
> >>>    Subject: [PATCH] 'yes' within the path sets wrong config variables
> >>> diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building=
-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0010-eglibc=
-Cross-building-and-testing-instructions.patch
> >>> index ffbe138ff1c..d7f15c1cfa2 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-te=
sting-instructions.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-te=
sting-instructions.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 9625e90bdf35774c71f1e566e73d435e38c04171 Mon Sep 17 00:00:00 20=
01
> >>> +From ce8b13bdf488058754fce573754cea0b022c37e2 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 18 Mar 2015 00:42:58 +0000
> >>>    Subject: [PATCH] eglibc: Cross building and testing instructions
> >>> diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap=
-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-boo=
tstrap-cross-toolchain.patch
> >>> index 88017bd29b0..82a32926555 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-=
toolchain.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-=
toolchain.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From cf2126b2d6e073137a3a7d9bcc261e0a760a82da Mon Sep 17 00:00:00 20=
01
> >>> +From 65b79161b9e2848a174d3519a03348884f182975 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 18 Mar 2015 00:49:28 +0000
> >>>    Subject: [PATCH] eglibc: Help bootstrap cross toolchain
> >>> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     create mode 100644 include/stubs-bootstrap.h
> >>>
> >>>    diff --git a/Makefile b/Makefile
> >>> -index c6d4817a9e..b4b0e23560 100644
> >>> +index 7052b46df8..46073abaa8 100644
> >>>    --- a/Makefile
> >>>    +++ b/Makefile
> >>>    @@ -79,9 +79,18 @@ subdir-dirs =3D include
> >>> diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpsc=
r_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-_=
_fpscr_values-on-SH4.patch
> >>> index fee020cc4cc..e726a9e76fe 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_value=
s-on-SH4.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_value=
s-on-SH4.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 61948c02226acea68d34313cc6286ee1ab44a98c Mon Sep 17 00:00:00 20=
01
> >>> +From 07a5fa22a9a8bbd43982c1b35132f8c2d5276bfe Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 18 Mar 2015 00:55:53 +0000
> >>>    Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
> >>> @@ -33,7 +33,7 @@ index 3ad702e165..931985b5d6 100644
> >>>         # a*
> >>>         alphasort64;
> >>>    diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sy=
sv/linux/sh/sysdep.S
> >>> -index 9d85ff99a0..6bda921ca3 100644
> >>> +index d5d8c5e033..f356d02077 100644
> >>>    --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
> >>>    +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
> >>>    @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
> >>> diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-c=
ross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0013-e=
glibc-Forward-port-cross-locale-generation-support.patch
> >>> index 60bcab0fecd..f36b7f6f4cc 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-lo=
cale-generation-support.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-lo=
cale-generation-support.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From befa58c48a8ba664e7bbdfcf22e2a15efa2e0d17 Mon Sep 17 00:00:00 20=
01
> >>> +From 33e9867758e830e19d181d5a0aa7f2f3cc4a08b3 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 18 Mar 2015 01:33:49 +0000
> >>>    Subject: [PATCH] eglibc: Forward port cross locale generation supp=
ort
> >>> @@ -7,7 +7,7 @@ Upstream-Status: Pending
> >>>
> >>>    Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>    ---
> >>> - locale/Makefile               |  3 +-
> >>> + locale/Makefile               |  1 +
> >>>     locale/catnames.c             | 46 +++++++++++++++++++++++++++
> >>>     locale/localeinfo.h           |  2 +-
> >>>     locale/programs/charmap-dir.c |  6 ++++
> >>> @@ -19,23 +19,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     locale/programs/locfile.c     |  5 ++-
> >>>     locale/programs/locfile.h     | 59 ++++++++++++++++++++++++++++++=
+++--
> >>>     locale/setlocale.c            | 29 -----------------
> >>> - 12 files changed, 167 insertions(+), 68 deletions(-)
> >>> + 12 files changed, 166 insertions(+), 67 deletions(-)
> >>>     create mode 100644 locale/catnames.c
> >>>
> >>>    diff --git a/locale/Makefile b/locale/Makefile
> >>> -index d7036b0855..ed795e2710 100644
> >>> +index 2810f28605..05f847f9a6 100644
> >>>    --- a/locale/Makefile
> >>>    +++ b/locale/Makefile
> >>> -@@ -26,7 +26,8 @@ headers            =3D langinfo.h locale.h bits/lo=
cale.h \
> >>> -               bits/types/locale_t.h bits/types/__locale_t.h
> >>> - routines    =3D setlocale findlocale loadlocale loadarchive \
> >>> -               localeconv nl_langinfo nl_langinfo_l mb_cur_max \
> >>> --              newlocale duplocale freelocale uselocale
> >>> -+              newlocale duplocale freelocale uselocale \
> >>> -+              catnames
> >>> - tests               =3D tst-C-locale tst-locname tst-duplocale
> >>> - tests-container     =3D tst-localedef-path-norm
> >>> - categories  =3D ctype messages monetary numeric time paper name \
> >>> +@@ -30,6 +30,7 @@ headers =3D \
> >>> +   locale.h \
> >>> +   # headers
> >>> + routines =3D \
> >>> ++    catnames \
> >>> +   duplocale \
> >>> +   findlocale \
> >>> +   freelocale \
> >>>    diff --git a/locale/catnames.c b/locale/catnames.c
> >>>    new file mode 100644
> >>>    index 0000000000..538f3f5edb
> >>> @@ -89,7 +87,7 @@ index 0000000000..538f3f5edb
> >>>    +    [LC_ALL] =3D sizeof ("LC_ALL") - 1
> >>>    +  };
> >>>    diff --git a/locale/localeinfo.h b/locale/localeinfo.h
> >>> -index 7a930079a5..05d7848d29 100644
> >>> +index f7efc288a5..6ef082eb25 100644
> >>>    --- a/locale/localeinfo.h
> >>>    +++ b/locale/localeinfo.h
> >>>    @@ -246,7 +246,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
> >>> @@ -102,7 +100,7 @@ index 7a930079a5..05d7848d29 100644
> >>>     # define NL_CURRENT_INDIRECT       1
> >>>     #endif
> >>>    diff --git a/locale/programs/charmap-dir.c b/locale/programs/charm=
ap-dir.c
> >>> -index 9582f2d167..8f9f3f582c 100644
> >>> +index 36504f238d..56ee97e61b 100644
> >>>    --- a/locale/programs/charmap-dir.c
> >>>    +++ b/locale/programs/charmap-dir.c
> >>>    @@ -18,7 +18,9 @@
> >>> @@ -148,7 +146,7 @@ index 9582f2d167..8f9f3f582c 100644
> >>>       return NULL;
> >>>     }
> >>>    diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-col=
late.c
> >>> -index 2c9f540bf1..c937cfd2ab 100644
> >>> +index 5048adbd9f..4232834ead 100644
> >>>    --- a/locale/programs/ld-collate.c
> >>>    +++ b/locale/programs/ld-collate.c
> >>>    @@ -352,7 +352,7 @@ new_element (struct locale_collate_t *collate,=
 const char *mbs, size_t mbslen,
> >>> @@ -197,7 +195,7 @@ index 2c9f540bf1..c937cfd2ab 100644
> >>>                         =3D=3D runp->wcnext->wcs[runp->nwcs - 1] + 1)=
);
> >>>
> >>>    diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype=
.c
> >>> -index d285b72611..4bf01fa3db 100644
> >>> +index eb6e7e145c..14736d1cac 100644
> >>>    --- a/locale/programs/ld-ctype.c
> >>>    +++ b/locale/programs/ld-ctype.c
> >>>    @@ -914,7 +914,7 @@ ctype_output (struct localedef_t *locale, cons=
t struct charmap_t *charmap,
> >>> @@ -279,7 +277,7 @@ index d285b72611..4bf01fa3db 100644
> >>>              srunp =3D srunp->next;
> >>>            }
> >>>    diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
> >>> -index a590b013b3..5ed4fa0f59 100644
> >>> +index 1abff3cf53..8a2f2b820a 100644
> >>>    --- a/locale/programs/ld-time.c
> >>>    +++ b/locale/programs/ld-time.c
> >>>    @@ -219,8 +219,10 @@ No definition for %s category found"), "LC_TI=
ME");
> >>> @@ -348,7 +346,7 @@ index a590b013b3..5ed4fa0f59 100644
> >>>
> >>>
> >>>    diff --git a/locale/programs/linereader.c b/locale/programs/linere=
ader.c
> >>> -index f8c49ac06f..ddda006037 100644
> >>> +index 61373d2657..7ec5726377 100644
> >>>    --- a/locale/programs/linereader.c
> >>>    +++ b/locale/programs/linereader.c
> >>>    @@ -776,7 +776,7 @@ get_string (struct linereader *lr, const struc=
t charmap_t *charmap,
> >>> @@ -361,7 +359,7 @@ index f8c49ac06f..ddda006037 100644
> >>>       lr_buffer_init (&lrb);
> >>>
> >>>    diff --git a/locale/programs/localedef.c b/locale/programs/localed=
ef.c
> >>> -index 1b751bb7be..c255e2b436 100644
> >>> +index 907bb5fb25..3106529043 100644
> >>>    --- a/locale/programs/localedef.c
> >>>    +++ b/locale/programs/localedef.c
> >>>    @@ -108,6 +108,7 @@ void (*argp_program_version_hook) (FILE *, str=
uct argp_state *) =3D print_version;
> >>> @@ -407,7 +405,7 @@ index 1b751bb7be..c255e2b436 100644
> >>>           force_output =3D 1;
> >>>           break;
> >>>    diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
> >>> -index e3eef59295..711d6fbea0 100644
> >>> +index 6c6ebf2dd6..cc02ab82bf 100644
> >>>    --- a/locale/programs/locfile.c
> >>>    +++ b/locale/programs/locfile.c
> >>>    @@ -543,6 +543,9 @@ compare_files (const char *filename1, const ch=
ar *filename2, size_t size,
> >>> @@ -430,7 +428,7 @@ index e3eef59295..711d6fbea0 100644
> >>>
> >>>     /* Record that FILE's next element is the 32-bit integer VALUE.  =
*/
> >>>    diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
> >>> -index 5caf5c348f..76856a32c2 100644
> >>> +index 3afb0a8d29..46785374e8 100644
> >>>    --- a/locale/programs/locfile.h
> >>>    +++ b/locale/programs/locfile.h
> >>>    @@ -70,6 +70,8 @@ extern void write_all_categories (struct localed=
ef_t *definitions,
> >>> @@ -519,7 +517,7 @@ index 5caf5c348f..76856a32c2 100644
> >>>    +
> >>>     #endif /* locfile.h */
> >>>    diff --git a/locale/setlocale.c b/locale/setlocale.c
> >>> -index 6a902faa50..17413f0a9c 100644
> >>> +index 7bd27e5398..2f194bad7c 100644
> >>>    --- a/locale/setlocale.c
> >>>    +++ b/locale/setlocale.c
> >>>    @@ -63,35 +63,6 @@ static char *const _nl_current_used[] =3D
> >>> diff --git a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-arch=
ive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0014-=
localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
> >>> index 3e7d5b74c1b..daeff7b0653 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-use=
s-a-hard-coded-locale-pa.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-use=
s-a-hard-coded-locale-pa.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 653b0631f80f17abe01957c06ef8a8d5d189b789 Mon Sep 17 00:00:00 20=
01
> >>> +From f4b1d6429298c0f8a2aa29ff559eb2093ea0188f Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Fri, 3 Aug 2018 09:42:06 -0700
> >>>    Subject: [PATCH] localedef --add-to-archive uses a hard-coded loca=
le path
> >>> @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     1 file changed, 25 insertions(+), 10 deletions(-)
> >>>
> >>>    diff --git a/locale/programs/locarchive.c b/locale/programs/locarc=
hive.c
> >>> -index 71fd9f34fa..cd3eb90ad5 100644
> >>> +index 8d79a1b6d1..6dc7ecd4e7 100644
> >>>    --- a/locale/programs/locarchive.c
> >>>    +++ b/locale/programs/locarchive.c
> >>>    @@ -339,12 +339,24 @@ enlarge_archive (struct locarhandle *ah, con=
st struct locarhead *head)
> >>> diff --git a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-co=
mpiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0015-powerpc-=
Do-not-ask-compiler-for-finding-arch.patch
> >>> index ff49a71bb21..8dd1f0a6567 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-=
for-finding-arch.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-=
for-finding-arch.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From fae5ee7d7b9dca2f25684a99f7046042d870235f Mon Sep 17 00:00:00 20=
01
> >>> +From 2d064c0c1243ea0bf405909285d7cddca92cf097 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Fri, 7 Aug 2020 14:31:16 -0700
> >>>    Subject: [PATCH] powerpc: Do not ask compiler for finding arch
> >>> diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-=
header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-w=
ordsize.h-Unify-the-header-between-arm-and-aarch64.patch
> >>> index b7b4046efc3..066c3b1ea29 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-=
between-arm-and-aarch64.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-=
between-arm-and-aarch64.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 91a7848698ce6c96c646f3a170714ee71eab6884 Mon Sep 17 00:00:00 20=
01
> >>> +From b1c374f7ede81a98f2d02def2c7ca17f1001f7cb Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Fri, 15 May 2020 17:05:45 -0700
> >>>    Subject: [PATCH] wordsize.h: Unify the header between arm and aarc=
h64
> >>> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     create mode 120000 sysdeps/arm/bits/wordsize.h
> >>>
> >>>    diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bit=
s/wordsize.h
> >>> -index 04d4be9519..63876a7830 100644
> >>> +index 118e59172d..b4b0692eb5 100644
> >>>    --- a/sysdeps/aarch64/bits/wordsize.h
> >>>    +++ b/sysdeps/aarch64/bits/wordsize.h
> >>>    @@ -17,12 +17,16 @@
> >>> diff --git a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-pri=
ntf-builtin-in-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-=
Replace-echo-with-printf-builtin-in-nscd-init-script.patch
> >>> index f2ed8210815..d8c0b1b4add 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-bui=
ltin-in-nscd-init-script.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-bui=
ltin-in-nscd-init-script.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 63611cfd3b25f3656db168aee41a5850ac769dfc Mon Sep 17 00:00:00 20=
01
> >>> +From 0aac3b8ee5b13e289b6969da51de384443286a5b Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Thu, 31 Dec 2015 14:33:02 -0800
> >>>    Subject: [PATCH] Replace echo with printf builtin in nscd init scr=
ipt
> >>> diff --git a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure=
.ac-Set-libc_cv_rootsbindir-onl.patch b/meta/recipes-core/glibc/glibc/0018-=
sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
> >>> index 12a460664f0..c81f82f4335 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set=
-libc_cv_rootsbindir-onl.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set=
-libc_cv_rootsbindir-onl.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 912ccb5001ffa5355caff09354558e89e9aa937b Mon Sep 17 00:00:00 20=
01
> >>> +From 7a25d4796411f22f824742092a4c2a08df99752d Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 18 Mar 2015 00:27:10 +0000
> >>>    Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir=
 only if its
> >>> diff --git a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-i=
nterpreter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0019-=
timezone-Make-shell-interpreter-overridable-in-tzsel.patch
> >>> index 359b1c37e5e..d724c3e968d 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpre=
ter-overridable-in-tzsel.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpre=
ter-overridable-in-tzsel.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 1d518ac57b00a3335f80f10f899c1bc24a0ddbf5 Mon Sep 17 00:00:00 20=
01
> >>> +From 6aa1b835d95482287851e02abd3a406cbd0ef8c7 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Thu, 9 Dec 2021 15:14:42 -0800
> >>>    Subject: [PATCH] timezone: Make shell interpreter overridable in t=
zselect.ksh
> >>> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     2 files changed, 10 insertions(+)
> >>>
> >>>    diff --git a/Makeconfig b/Makeconfig
> >>> -index 77d7fd14df..e253046861 100644
> >>> +index 85e00cef94..643724108a 100644
> >>>    --- a/Makeconfig
> >>>    +++ b/Makeconfig
> >>>    @@ -309,6 +309,15 @@ ifndef sysincludedir
> >>> @@ -34,7 +34,7 @@ index 77d7fd14df..e253046861 100644
> >>>     # Commands to install files.
> >>>     ifndef INSTALL_DATA
> >>>    diff --git a/timezone/Makefile b/timezone/Makefile
> >>> -index 0306c0bca9..4dfdcebdb7 100644
> >>> +index d7acb387ba..ec79326f66 100644
> >>>    --- a/timezone/Makefile
> >>>    +++ b/timezone/Makefile
> >>>    @@ -136,6 +136,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpf=
x)config.make
> >>> diff --git a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-=
sh-default-shell-interpreter.patch b/meta/recipes-core/glibc/glibc/0020-tzs=
elect.ksh-Use-bin-sh-default-shell-interpreter.patch
> >>> index 9a1bfdd6af3..08c60a271b4 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-defa=
ult-shell-interpreter.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-defa=
ult-shell-interpreter.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 7274541782927394852712ba0c8dfd67bd9b8b5b Mon Sep 17 00:00:00 20=
01
> >>> +From ef47e6199986c4951e681ed74f064042db1ae2e1 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Wed, 15 Dec 2021 21:47:53 -0800
> >>>    Subject: [PATCH] tzselect.ksh: Use /bin/sh default shell interpret=
er
> >>> diff --git a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-fai=
led-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0021-=
fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> >>> index 3b567cc9ab1..d57dce125c7 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-=
unprivileged-process-BZ-.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-=
unprivileged-process-BZ-.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From 4a1bff4c1e34ad9b596a7ba44ab61f4c9d00097b Mon Sep 17 00:00:00 20=
01
> >>> +From 7254706544be5100843fc0a332e836fccffc9ef1 Mon Sep 17 00:00:00 20=
01
> >>>    From: Hongxu Jia <hongxu.jia@windriver.com>
> >>>    Date: Sun, 29 Aug 2021 20:49:16 +0800
> >>>    Subject: [PATCH] fix create thread failed in unprivileged process =
[BZ #28287]
> >>> @@ -72,10 +72,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>>    diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/un=
ix/sysv/linux/clone-internal.c
> >>> -index 790739cfce..8d24d04917 100644
> >>> +index 40ef30303f..f97b1f6900 100644
> >>>    --- a/sysdeps/unix/sysv/linux/clone-internal.c
> >>>    +++ b/sysdeps/unix/sysv/linux/clone-internal.c
> >>> -@@ -106,7 +106,7 @@ __clone_internal (struct clone_args *cl_args,
> >>> +@@ -98,7 +98,7 @@ __clone_internal (struct clone_args *cl_args,
> >>>     #ifdef HAVE_CLONE3_WRAPPER
> >>>       int saved_errno =3D errno;
> >>>       int ret =3D __clone3_internal (cl_args, func, arg);
> >>> diff --git a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build=
-time-paths-in-the-output-binar.patch b/meta/recipes-core/glibc/glibc/0022-=
Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
> >>> index 55c81f38aa3..b527ddffc83 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-p=
aths-in-the-output-binar.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-p=
aths-in-the-output-binar.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From e61792fc978f9b8a9c790be468fbf97828ac8ae9 Mon Sep 17 00:00:00 20=
01
> >>> +From d39779afc72d34f87f052097592008cc38e20615 Mon Sep 17 00:00:00 20=
01
> >>>    From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>>    Date: Sun, 24 Jul 2022 07:07:29 -0700
> >>>    Subject: [PATCH] Avoid hardcoded build time paths in the output bi=
naries
> >>> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>     1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>>    diff --git a/support/Makefile b/support/Makefile
> >>> -index 917a858bd1..17a747c8c7 100644
> >>> +index 362a51f882..56d2b37058 100644
> >>>    --- a/support/Makefile
> >>>    +++ b/support/Makefile
> >>> -@@ -227,9 +227,9 @@ libsupport-inhibit-o +=3D .o
> >>> +@@ -228,9 +228,9 @@ libsupport-inhibit-o +=3D .o
> >>>     endif
> >>>
> >>>     CFLAGS-support_paths.c =3D \
> >>> diff --git a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pas=
s-mcpu-along-with-march-to-dete.patch b/meta/recipes-core/glibc/glibc/0023-=
aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
> >>> index 7be9fc981d6..816471a8287 100644
> >>> --- a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-=
along-with-march-to-dete.patch
> >>> +++ b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-=
along-with-march-to-dete.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From d836f008a96aa9b2e88c7b394bfc110542e57176 Mon Sep 17 00:00:00 20=
01
> >>> +From f761f5ca2d453e11d34fc7d552dab4a0e189dae9 Mon Sep 17 00:00:00 20=
01
> >>>    From: Khem Raj <raj.khem@gmail.com>
> >>>    Date: Fri, 4 Aug 2023 09:34:50 -0700
> >>>    Subject: [PATCH] aarch64/configure: Pass -mcpu along with -march t=
o detect sve
> >>> @@ -51,6 +51,3 @@ index 8a708f2ef4..b6a146d2be 100644
> >>>       libc_cv_aarch64_sve_asm=3Dyes
> >>>     else
> >>>       libc_cv_aarch64_sve_asm=3Dno
> >>> ---
> >>> -2.41.0
> >>> -
> >>> diff --git a/meta/recipes-core/glibc/glibc/0024-features.h-Bump-__GLI=
BC_MINOR__-to-39-on-master.patch b/meta/recipes-core/glibc/glibc/0024-featu=
res.h-Bump-__GLIBC_MINOR__-to-39-on-master.patch
> >>> new file mode 100644
> >>> index 00000000000..0553d85963f
> >>> --- /dev/null
> >>> +++ b/meta/recipes-core/glibc/glibc/0024-features.h-Bump-__GLIBC_MINO=
R__-to-39-on-master.patch
> >>> @@ -0,0 +1,25 @@
> >>> +From 42f76558232659956aded7ae1c02f4be0a4d2f7f Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Sun, 30 Jul 2023 13:27:11 -0700
> >>> +Subject: [PATCH] features.h: Bump __GLIBC_MINOR__ to 39 on master
> >>> +
> >>> +Upstream-Status: Inappropriate [Development only]
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + include/features.h | 2 +-
> >>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/include/features.h b/include/features.h
> >>> +index 1c38393fed..fc164d332a 100644
> >>> +--- a/include/features.h
> >>> ++++ b/include/features.h
> >>> +@@ -492,7 +492,7 @@
> >>> + /* Major and minor version number of the GNU C library package.  Us=
e
> >>> +    these macros to test for features in specific releases.  */
> >>> + #define     __GLIBC__       2
> >>> +-#define     __GLIBC_MINOR__ 38
> >>> ++#define     __GLIBC_MINOR__ 39
> >>> +
> >>> + #define __GLIBC_PREREQ(maj, min) \
> >>> +     ((__GLIBC__ << 16) + __GLIBC_MINOR__ >=3D ((maj) << 16) + (min)=
)
> >>> diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-cor=
e/glibc/glibc_2.39.bb
> >>> similarity index 98%
> >>> rename from meta/recipes-core/glibc/glibc_2.38.bb
> >>> rename to meta/recipes-core/glibc/glibc_2.39.bb
> >>> index 32ccb888f0f..3d783e4cee1 100644
> >>> --- a/meta/recipes-core/glibc/glibc_2.38.bb
> >>> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> >>> @@ -51,6 +51,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH=
};name=3Dglibc \
> >>>               file://0021-fix-create-thread-failed-in-unprivileged-pr=
ocess-BZ-.patch \
> >>>               file://0022-Avoid-hardcoded-build-time-paths-in-the-out=
put-binar.patch \
> >>>               file://0023-aarch64-configure-Pass-mcpu-along-with-marc=
h-to-dete.patch \
> >>> +           file://0024-features.h-Bump-__GLIBC_MINOR__-to-39-on-mast=
er.patch \
> >>>    "
> >>>    S =3D "${WORKDIR}/git"
> >>>    B =3D "${WORKDIR}/build-${TARGET_SYS}"
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#193873): https://lists.openembedded.org/g/openemb=
edded-core/message/193873
> >>> Mute This Topic: https://lists.openembedded.org/mt/103770754/3619876
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [andrej.v@skyrain.eu]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
>

