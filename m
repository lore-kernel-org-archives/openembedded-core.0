Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6543C001E0
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 07:55:56 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.9140.1691049354530058395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 00:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FZUMtuzH;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fe28f92d8eso1118603e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 00:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691049352; x=1691654152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7S2EBAdwMWbra5jsMq05fjJdUnp5FZrlwyD6xZiPig=;
        b=FZUMtuzHl2tW9BcHFi2nvPDfhb0Iw7OxGJ+ftxhjqQBiLtT5KoAn+nYR06//OklPfT
         yb3Ym4C0MggfSCzFXq3UFlSXsVusNzRC/4Zyv7HDwxbS/Zxu0H0FXLqmJzFLTFW5624R
         wepycIxQ/YkNPHg1aCscwajF2URI4V6/0KJI/SrqjH/m3J3m90t3fvs7AYxkOzmZDtMf
         y+nlokcOdGdQqRhr22p6YCO0ZIvu8tAIHaouB1rN+CJIrUVDBzx7jhW+l1AO2ARocs3M
         h3B19WBisHRnrEiRs6pVuqUQ4dUtLlg6DtM0iHt8JFNBIwn4OmWoGF53vQwdWNJjqiku
         0p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691049352; x=1691654152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7S2EBAdwMWbra5jsMq05fjJdUnp5FZrlwyD6xZiPig=;
        b=O+ZAvCwQSqsTcBJU4Sb6z5oQLJrwctmx0gR1iXZfWLAB+Wo1nC6hKvydrnPIeKNO+s
         to/TnI++aboi8PcQQeqkzas9Ys9ILX9F9/Kft+3+hoHZ3qQTyjIJFl8qpFVCn3hYoiLc
         xcgDp2sch7a8OuMVOY/5IAQ51DfhaFWAQA4XHWdSfl8S2DRfC4lOAnT+KjfNWTSJupfr
         u65a7/EPqs5MvMS+gkpZehNAe5xGqvFMJoyCF35dwSM6fX/MVb+UtJloxqw5VGx3vt38
         mnrGyt1nrswg3qWnmelXP4owS3LKDhYSWIuxZPVGTRV4UdN3lCF5B9wvGoOQ/0u+Wqvf
         LpUQ==
X-Gm-Message-State: ABy/qLZSfZrUza3Tu/WrnPyobk2OgbJonlcwxxDII7UiYgzEfJx127Ho
	OUbQeAEmTUlzGkmcYA/lfFJtADP4WhANL0Fawbc=
X-Google-Smtp-Source: APBJJlEdo5rUnu7uQCIkNxCKbobPgq48l0r67WPVg0AdQEvQTpd2OVX1h6G1FSY70RQCWqzWDd5ueugHCG3HJ2hTu80=
X-Received: by 2002:a19:2d42:0:b0:4fb:8948:2b8e with SMTP id
 t2-20020a192d42000000b004fb89482b8emr6387703lft.8.1691049352169; Thu, 03 Aug
 2023 00:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230801132957.401557-1-zboszor@gmail.com> <20230802134131db3e0b1e@mail.local>
 <e4dcb013-25f0-63f8-4713-8d4b71757cb4@gmail.com> <CANNYZj_WpBs=f0thUNdEgBi9G-VepAF-_hf2gxsRP1mOjD1vtA@mail.gmail.com>
 <ffd0b874-711a-abc8-0445-2884e24f8a3b@gmail.com>
In-Reply-To: <ffd0b874-711a-abc8-0445-2884e24f8a3b@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Aug 2023 09:55:40 +0200
Message-ID: <CANNYZj-hE=Cct9bLOhy_kWA9NZqnpUAJ3ZTXW2RnoXzz65B1fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] rpm: Allow setting platform macro settings externally
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185462

I applied the patch and checked what the difference in install tree
is. I see that the only difference is addition of
usr/lib/rpm/platform/qemux86_64-linux/macros

I'd like to step back for a bit, and clarify:

What is the mechanism at runtime for finding that file? How does rpm
tooling arrive at the path it needs to read? How is 'qemux86_64-linux'
computed? Are there alternative locations that macros are also taken
from?

And once that is clarified, the next question would be:
Can we instruct rpm to read macros from a default location for a
self-hosted target?

You might also just teach that developer who is unwilling to learn new
stuff to write recipes. It's about the same amount of effort as
writing rpm .spec files :)

Alex



On Thu, 3 Aug 2023 at 08:09, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
>
> 2023. 08. 02. 21:54 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > I think the culprit is the usage of MACHINE_ARCH. You can't have that
> > in regular recipes, as that makes them machine-specific, rather than
> > tune (i.e. architecture) specific.
>
> So, how to fix it?
>
> Would putting this into the rpm recipe be enough and acceptable?
>
> PACKAGE_ARCH =3D "${MACHINE_ARCHJ}"
>
> Reasoning: the patch that makes rpm carry the
> $MACHINE_ARCH}-linux platform specific macros file
> does make rpm machine-specific.
>
> >
> > Alex
> >
> > On Wed, 2 Aug 2023 at 21:28, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zb=
oszor@gmail.com> wrote:
> >> Some clues please. What does this error mean? How to solve it?
> >>
> >> 2023. 08. 02. 15:41 keltez=C3=A9ssel, Alexandre Belloni =C3=ADrta:
> >>> Hello,
> >>>
> >>> This causes
> >>> sstatetests.SStateHashSameSigs3.test_sstate_sametune_samesigs to fail=
:
> >>>
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/557=
2/steps/14/logs/stdio
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/553=
8/steps/14/logs/stdio
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/554=
7/steps/15/logs/stdio
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/549=
5/steps/14/logs/stdio
> >>>
> >>> On 01/08/2023 15:29:57+0200, Zoltan Boszormenyi wrote:
> >>>> Feed platform settings to installplatform externally. Based on the p=
atch
> >>>> submitted under https://github.com/rpm-software-management/rpm/pull/=
2585
> >>>>
> >>>> Patch against INSTALL was backported for rpm 4.18.1
> >>>>
> >>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail=
.com>
> >>>> ---
> >>>>    ...atform-macro-settings-externally-258.patch | 119 +++++++++++++=
+++++
> >>>>    meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 +++
> >>>>    2 files changed, 139 insertions(+)
> >>>>    create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-set=
ting-platform-macro-settings-externally-258.patch
> >>>>
> >>>> diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-plat=
form-macro-settings-externally-258.patch b/meta/recipes-devtools/rpm/files/=
0001-Allow-setting-platform-macro-settings-externally-258.patch
> >>>> new file mode 100644
> >>>> index 0000000000..a32ce38533
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-ma=
cro-settings-externally-258.patch
> >>>> @@ -0,0 +1,119 @@
> >>>> +From e58c607dcdb303ff3ba1b22fd23eb20e374b6ed3 Mon Sep 17 00:00:00 2=
001
> >>>> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC=
3=3DA9nyi?=3D
> >>>> + <zboszor@gmail.com>
> >>>> +Date: Fri, 28 Jul 2023 12:16:56 +0200
> >>>> +Subject: [PATCH] Allow setting platform macro settings externally (=
#2585)
> >>>> +MIME-Version: 1.0
> >>>> +Content-Type: text/plain; charset=3DUTF-8
> >>>> +Content-Transfer-Encoding: 8bit
> >>>> +
> >>>> +* Allow setting platform macro settings externally
> >>>> +
> >>>> +By default, rpm installs a series of default platforms based on
> >>>> +the CPU architecture names in subdirectories called
> >>>> +
> >>>> +    /usr/lib/platform/<arch>-<os>
> >>>> +
> >>>> +This is enough for regular Linux distributions. However, some
> >>>> +distributions may use more specific platform names that refer to
> >>>> +particular computer systems, like SBCs or specific CPU tuning when
> >>>> +compiling.
> >>>> +
> >>>> +If the platform subdirectory does not exist in /usr/lib/platform
> >>>> +then rpmbuild does not work.
> >>>> +
> >>>> +Allow creating such custom platform subdirectory with feeding
> >>>> +the necessary data using external variables: RPM_CUSTOM_ARCH,
> >>>> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
> >>>> +and RPM_CUSTOM_CANONCOLOR
> >>>> +
> >>>> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmai=
l.com>
> >>>> +Upstream-Status: Backport [https://github.com/rpm-software-manageme=
nt/rpm/commit/fde03ae33d55b160a31a6c54946880dcdf8fd0d6]
> >>>> +
> >>>> +---------
> >>>> +
> >>>> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmai=
l.com>
> >>>> +Co-authored-by: Florian Festi <ffesti@redhat.com>
> >>>> +---
> >>>> + INSTALL         | 37 +++++++++++++++++++++++++++++++++++++
> >>>> + installplatform |  9 ++++++++-
> >>>> + 2 files changed, 45 insertions(+), 1 deletion(-)
> >>>> +
> >>>> +diff --git a/INSTALL b/INSTALL
> >>>> +index 13d0d8a83..5e035cf6a 100644
> >>>> +--- a/INSTALL
> >>>> ++++ b/INSTALL
> >>>> +@@ -148,6 +148,43 @@ and then install with:
> >>>> +
> >>>> +     make install
> >>>> +
> >>>> ++
> >>>> ++By default, rpm installs a series of default platforms based on th=
e CPU
> >>>> ++architecture names in subdirectories called
> >>>> ++
> >>>> ++    /usr/lib/platform/<arch>-<os>
> >>>> ++
> >>>> ++This is enough for many distributions. However, some distributions
> >>>> ++may use more specific platform names that refer to particular comp=
uter
> >>>> ++systems, like SBCs or specific CPU tuning when compiling. Examples=
 of such
> >>>> ++platform names are: "genericx86_64", "intel_skylake_64", "raspberr=
ypi_armv7",
> >>>> ++"raspberrypi_armv8", etc.
> >>>> ++
> >>>> ++If the platform name is put into /etc/rpm/platform, then rpmbuild =
uses it
> >>>> ++and the only macros file rpmbuild looks for is
> >>>> ++
> >>>> ++    /usr/lib/platform/`cat /etc/rpm/platform`-<os>/macros
> >>>> ++
> >>>> ++If this file does not exist, many rpm macros will not have their e=
xpected
> >>>> ++values set and e.g. %configure will fail when trying to run rpmbui=
ld.
> >>>> ++
> >>>> ++To allow creating the macros file for such a custom platform, the =
shell
> >>>> ++variables listed below must be set. If RPM_CUSTOM_ARCH is not set,=
 the rest
> >>>> ++is ignored.
> >>>> ++
> >>>> ++    export RPM_CUSTOM_ARCH=3Dgenericx86_64
> >>>> ++    export RPM_CUSTOM_ISANAME=3Dx86
> >>>> ++    export RPM_CUSTOM_ISABITS=3D64
> >>>> ++    export RPM_CUSTOM_CANONARCH=3Dx86_64
> >>>> ++    export RPM_CUSTOM_CANONCOLOR=3D0 # to use /usr/lib for %_libdi=
r
> >>>> ++    export RPM_CUSTOM_CANONCOLOR=3D3 # to use /usr/lib64 for %_lib=
dir
> >>>> ++
> >>>> ++    make install
> >>>> ++
> >>>> ++This also creates and installs the new platform file e.g.
> >>>> ++/usr/lib/platform/genericx86_64-linux/macros
> >>>> ++
> >>>> ++
> >>>> + Rpm comes with an automated self-test suite. The test-suite relies=
 heavily
> >>>> + on fakechroot (https://github.com/dex4er/fakechroot/) and cannot b=
e executed
> >>>> + without it. Provided that fakechroot was found during configure,
> >>>> +diff --git a/installplatform b/installplatform
> >>>> +index a5ad7c5b8..59f57697b 100755
> >>>> +--- a/installplatform
> >>>> ++++ b/installplatform
> >>>> +@@ -11,7 +11,7 @@ VENDOR=3D"${4}"
> >>>> + OS=3D"${5}"
> >>>> + RPMRC_GNU=3D"${6}"
> >>>> +
> >>>> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
> >>>> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_C=
USTOM_ARCH:+custom}; do
> >>>> +   RPMRC_OPTFLAGS=3D"`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
> >>>> +   RPMRC_OPTFLAGS=3D"`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
> >>>> +   case $RPMRC_OPTFLAGS in
> >>>> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cu=
t -d: -f2`; do
> >>>> +   CANONCOLOR=3D
> >>>> +   FILTER=3Dcat
> >>>> +   case "${ARCH}" in
> >>>> ++    custom)
> >>>> ++   ARCH=3D$RPM_CUSTOM_ARCH
> >>>> ++   ISANAME=3D$RPM_CUSTOM_ISANAME
> >>>> ++   ISABITS=3D$RPM_CUSTOM_ISABITS
> >>>> ++   CANONARCH=3D$RPM_CUSTOM_CANONARCH
> >>>> ++   CANONCOLOR=3D$RPM_CUSTOM_CANONCOLOR
> >>>> ++    ;;
> >>>> +     sparc64*)
> >>>> +    ISANAME=3Dsparc
> >>>> +    ISABITS=3D64
> >>>> +--
> >>>> +2.41.0
> >>>> +
> >>>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-=
devtools/rpm/rpm_4.18.1.bb
> >>>> index 95a9e92f96..0b8ebebb51 100644
> >>>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> >>>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> >>>> @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-managem=
ent/rpm;branch=3Drpm-4.18.x;protoc
> >>>>               file://0001-python-Use-Py_hash_t-instead-of-long-in-hd=
r_hash.patch \
> >>>>               file://fix-declaration.patch \
> >>>>               file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch =
\
> >>>> +           file://0001-Allow-setting-platform-macro-settings-extern=
ally-258.patch \
> >>>>               "
> >>>>
> >>>>    PE =3D "1"
> >>>> @@ -128,10 +129,29 @@ do_install:append:class-nativesdk() {
> >>>>       EOF
> >>>>    }
> >>>>
> >>>> +def rpm_isaname(d):
> >>>> +    import re
> >>>> +    arch =3D d.getVar('TARGET_ARCH')
> >>>> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
> >>>> +        return "x86"
> >>>> +    # Add more platform tweaks for ISANAME as needed
> >>>> +    return arch
> >>>> +
> >>>> +# Add the custom BSP platform "macros" file
> >>>> +do_install:prepend:class-target() {
> >>>> +    export RPM_CUSTOM_ARCH=3D"${MACHINE_ARCH}"
> >>>> +    export RPM_CUSTOM_ISANAME=3D"${@rpm_isaname(d)}"
> >>>> +    export RPM_CUSTOM_ISABITS=3D"${SITEINFO_BITS}"
> >>>> +    export RPM_CUSTOM_CANONARCH=3D"${TARGET_ARCH}"
> >>>> +    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is used =
for a 64-bit platform
> >>>> +    export RPM_CUSTOM_CANONCOLOR=3D"${@bb.utils.contains('DISTRO_FE=
ATURES', 'multilib', '3', '0', d)}"
> >>>> +}
> >>>> +
> >>>>    # Rpm's make install creates var/tmp which clashes with base-file=
s packaging
> >>>>    do_install:append:class-target() {
> >>>>        rm -rf ${D}/var
> >>>>    }
> >>>> +
> >>>>    do_install:append:class-nativesdk() {
> >>>>        rm -rf ${D}${SDKPATHNATIVE}/var
> >>>>        # Ensure find-debuginfo is located correctly inside SDK
> >>>> --
> >>>> 2.41.0
> >>>>
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#185245): https://lists.openembedded.org/g/openem=
bedded-core/message/185245
> >>>> Mute This Topic: https://lists.openembedded.org/mt/100483574/3617179
> >>>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [alexandre.belloni@bootlin.com]
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>
>

