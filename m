Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCBAC00528
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:55:47 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.10018.1691052942669338622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bAfwe0kb;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fbf09a9139so1245623e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691052941; x=1691657741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rEI5rt7BnI12RqiO2pKsvMMIzcXA4ksnFwgV5jWQEM=;
        b=bAfwe0kbvA9QDXpKox24jwVH+LGKJjkaiRaqmrNGzQdCNYd3rdJzCTmzF+lWKWenh5
         +BhV5INyVjtzWgMWLe3GKgeF70yKj7u0fBJ/ecxuEt7QvJycdkn45DpgYSTeglz2eDpX
         fxIt96OwyBz0X0ODP7Frv9n40xMsogSxmQzSIK55ogh7RM1eY80HVnGBHCVMJuGLpjz8
         LQ9NSy/xXSvSgvdKZnBPST5V3G/VoFh0XvlzpTcf2ma1PmCX9LuEoaClHE4Dyw0Blfn1
         Sb2dis2nWiKXkcOshOgc+dBuptORB4E+PwX/RS8k8+vWEoDLVtz9KZYoXzliQnek2+UD
         hfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691052941; x=1691657741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rEI5rt7BnI12RqiO2pKsvMMIzcXA4ksnFwgV5jWQEM=;
        b=a+Zuv/NG0sVGBljzgFIxPWZmTz+9ORU8ejMHQEwDmNOwt2kTExOcQo4AwOTmLSuMkk
         dLe/h5SfnosISGXks5xQ2ujQbWpNLxe+GajzVPS6Hf+bBf+1hVVgn3mONwpitnKc0NOK
         2KlQJwvPuCCalcrbt3Gsbb2S4vLx64Iw00kasWjiHW8t4ElKbiGwNuIymBIPaHr8LzyG
         +svU+tFSUMOGN1kzA2ZAiQ/+MjYtbA2xGMW2F4sgSfK4UU6RZS4vYkjHB/vY9pBFXypS
         UNWvL8AtkfWunpD/g0mrF2TOk1ZujrIJ4pJo+sFJe0B5pBiX3cX2WjVdX8QGvbS96Fdd
         aQ9Q==
X-Gm-Message-State: ABy/qLbNO/M1nVNdJeSxUr0q39cjfX0KAmhtvsh5yLdEcFAlWpPnLXBv
	cmg3zSQDGB59y3q7Sj4NyBkTA54EvEQ5B3VlUDg=
X-Google-Smtp-Source: APBJJlGCxT0o0NDyB0tKiP9ommh5MdBpGurGnWTouHVkD+b4myeRz+sCXRrK67dCiMXpFMvhRiZzMhagxGW0O+1OjNw=
X-Received: by 2002:ac2:5bd0:0:b0:4fe:3724:fdb1 with SMTP id
 u16-20020ac25bd0000000b004fe3724fdb1mr6457868lfn.41.1691052940482; Thu, 03
 Aug 2023 01:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230801132957.401557-1-zboszor@gmail.com> <20230802134131db3e0b1e@mail.local>
 <e4dcb013-25f0-63f8-4713-8d4b71757cb4@gmail.com> <CANNYZj_WpBs=f0thUNdEgBi9G-VepAF-_hf2gxsRP1mOjD1vtA@mail.gmail.com>
 <ffd0b874-711a-abc8-0445-2884e24f8a3b@gmail.com> <1777D06DC603E04E.27883@lists.openembedded.org>
In-Reply-To: <1777D06DC603E04E.27883@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Aug 2023 10:55:29 +0200
Message-ID: <CANNYZj9-hp6r89=tpW3XXpF1tSL4=s4YTUSmUsFN=cAwLz1Rhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] rpm: Allow setting platform macro settings externally
To: alex.kanavin@gmail.com
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 08:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185467

A couple more observations:
the content of usr/lib/rpm/platform/qemux86_64-linux/macros is not at
all specific to qemu. In fact, the only significant difference with
upstream's x86_64-linux/macros is where the libraries go (lib vs
lib64).

So the machine name is needed only for the file location, and
therefore we can install it somewhere else where it would be picked up
without having to rely on MACHINE_ARCH. There's a whole menu of
options in lib/rpmrc.c:

        macrofiles =3D rstrscat(NULL, confdir, "/macros", ":",
                                confdir, "/macros.d/macros.*", ":",
                                confdir, "/platform/%{_target}/macros", ":"=
,
                                confdir, "/fileattrs/*.attr", ":",
                                confdir, "/" RPMCANONVENDOR "/macros", ":",
                                etcconfdir, SYSCONFDIR "/rpm/macros.*", ":"=
,
                                etcconfdir, SYSCONFDIR "/rpm/macros", ":",
                                etcconfdir, SYSCONFDIR
"/rpm/%{_target}/macros", ":", NULL);

I think placing the macros into one of those should work. Can you verify?

Alex

On Thu, 3 Aug 2023 at 09:55, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> I applied the patch and checked what the difference in install tree
> is. I see that the only difference is addition of
> usr/lib/rpm/platform/qemux86_64-linux/macros
>
> I'd like to step back for a bit, and clarify:
>
> What is the mechanism at runtime for finding that file? How does rpm
> tooling arrive at the path it needs to read? How is 'qemux86_64-linux'
> computed? Are there alternative locations that macros are also taken
> from?
>
> And once that is clarified, the next question would be:
> Can we instruct rpm to read macros from a default location for a
> self-hosted target?
>
> You might also just teach that developer who is unwilling to learn new
> stuff to write recipes. It's about the same amount of effort as
> writing rpm .spec files :)
>
> Alex
>
>
>
> On Thu, 3 Aug 2023 at 08:09, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbos=
zor@gmail.com> wrote:
> >
> > 2023. 08. 02. 21:54 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > > I think the culprit is the usage of MACHINE_ARCH. You can't have that
> > > in regular recipes, as that makes them machine-specific, rather than
> > > tune (i.e. architecture) specific.
> >
> > So, how to fix it?
> >
> > Would putting this into the rpm recipe be enough and acceptable?
> >
> > PACKAGE_ARCH =3D "${MACHINE_ARCHJ}"
> >
> > Reasoning: the patch that makes rpm carry the
> > $MACHINE_ARCH}-linux platform specific macros file
> > does make rpm machine-specific.
> >
> > >
> > > Alex
> > >
> > > On Wed, 2 Aug 2023 at 21:28, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <=
zboszor@gmail.com> wrote:
> > >> Some clues please. What does this error mean? How to solve it?
> > >>
> > >> 2023. 08. 02. 15:41 keltez=C3=A9ssel, Alexandre Belloni =C3=ADrta:
> > >>> Hello,
> > >>>
> > >>> This causes
> > >>> sstatetests.SStateHashSameSigs3.test_sstate_sametune_samesigs to fa=
il:
> > >>>
> > >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5=
572/steps/14/logs/stdio
> > >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5=
538/steps/14/logs/stdio
> > >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5=
547/steps/15/logs/stdio
> > >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5=
495/steps/14/logs/stdio
> > >>>
> > >>> On 01/08/2023 15:29:57+0200, Zoltan Boszormenyi wrote:
> > >>>> Feed platform settings to installplatform externally. Based on the=
 patch
> > >>>> submitted under https://github.com/rpm-software-management/rpm/pul=
l/2585
> > >>>>
> > >>>> Patch against INSTALL was backported for rpm 4.18.1
> > >>>>
> > >>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gma=
il.com>
> > >>>> ---
> > >>>>    ...atform-macro-settings-externally-258.patch | 119 +++++++++++=
+++++++
> > >>>>    meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 +++
> > >>>>    2 files changed, 139 insertions(+)
> > >>>>    create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-s=
etting-platform-macro-settings-externally-258.patch
> > >>>>
> > >>>> diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-pl=
atform-macro-settings-externally-258.patch b/meta/recipes-devtools/rpm/file=
s/0001-Allow-setting-platform-macro-settings-externally-258.patch
> > >>>> new file mode 100644
> > >>>> index 0000000000..a32ce38533
> > >>>> --- /dev/null
> > >>>> +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-=
macro-settings-externally-258.patch
> > >>>> @@ -0,0 +1,119 @@
> > >>>> +From e58c607dcdb303ff3ba1b22fd23eb20e374b6ed3 Mon Sep 17 00:00:00=
 2001
> > >>>> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=
=3DC3=3DA9nyi?=3D
> > >>>> + <zboszor@gmail.com>
> > >>>> +Date: Fri, 28 Jul 2023 12:16:56 +0200
> > >>>> +Subject: [PATCH] Allow setting platform macro settings externally=
 (#2585)
> > >>>> +MIME-Version: 1.0
> > >>>> +Content-Type: text/plain; charset=3DUTF-8
> > >>>> +Content-Transfer-Encoding: 8bit
> > >>>> +
> > >>>> +* Allow setting platform macro settings externally
> > >>>> +
> > >>>> +By default, rpm installs a series of default platforms based on
> > >>>> +the CPU architecture names in subdirectories called
> > >>>> +
> > >>>> +    /usr/lib/platform/<arch>-<os>
> > >>>> +
> > >>>> +This is enough for regular Linux distributions. However, some
> > >>>> +distributions may use more specific platform names that refer to
> > >>>> +particular computer systems, like SBCs or specific CPU tuning whe=
n
> > >>>> +compiling.
> > >>>> +
> > >>>> +If the platform subdirectory does not exist in /usr/lib/platform
> > >>>> +then rpmbuild does not work.
> > >>>> +
> > >>>> +Allow creating such custom platform subdirectory with feeding
> > >>>> +the necessary data using external variables: RPM_CUSTOM_ARCH,
> > >>>> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
> > >>>> +and RPM_CUSTOM_CANONCOLOR
> > >>>> +
> > >>>> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gm=
ail.com>
> > >>>> +Upstream-Status: Backport [https://github.com/rpm-software-manage=
ment/rpm/commit/fde03ae33d55b160a31a6c54946880dcdf8fd0d6]
> > >>>> +
> > >>>> +---------
> > >>>> +
> > >>>> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gm=
ail.com>
> > >>>> +Co-authored-by: Florian Festi <ffesti@redhat.com>
> > >>>> +---
> > >>>> + INSTALL         | 37 +++++++++++++++++++++++++++++++++++++
> > >>>> + installplatform |  9 ++++++++-
> > >>>> + 2 files changed, 45 insertions(+), 1 deletion(-)
> > >>>> +
> > >>>> +diff --git a/INSTALL b/INSTALL
> > >>>> +index 13d0d8a83..5e035cf6a 100644
> > >>>> +--- a/INSTALL
> > >>>> ++++ b/INSTALL
> > >>>> +@@ -148,6 +148,43 @@ and then install with:
> > >>>> +
> > >>>> +     make install
> > >>>> +
> > >>>> ++
> > >>>> ++By default, rpm installs a series of default platforms based on =
the CPU
> > >>>> ++architecture names in subdirectories called
> > >>>> ++
> > >>>> ++    /usr/lib/platform/<arch>-<os>
> > >>>> ++
> > >>>> ++This is enough for many distributions. However, some distributio=
ns
> > >>>> ++may use more specific platform names that refer to particular co=
mputer
> > >>>> ++systems, like SBCs or specific CPU tuning when compiling. Exampl=
es of such
> > >>>> ++platform names are: "genericx86_64", "intel_skylake_64", "raspbe=
rrypi_armv7",
> > >>>> ++"raspberrypi_armv8", etc.
> > >>>> ++
> > >>>> ++If the platform name is put into /etc/rpm/platform, then rpmbuil=
d uses it
> > >>>> ++and the only macros file rpmbuild looks for is
> > >>>> ++
> > >>>> ++    /usr/lib/platform/`cat /etc/rpm/platform`-<os>/macros
> > >>>> ++
> > >>>> ++If this file does not exist, many rpm macros will not have their=
 expected
> > >>>> ++values set and e.g. %configure will fail when trying to run rpmb=
uild.
> > >>>> ++
> > >>>> ++To allow creating the macros file for such a custom platform, th=
e shell
> > >>>> ++variables listed below must be set. If RPM_CUSTOM_ARCH is not se=
t, the rest
> > >>>> ++is ignored.
> > >>>> ++
> > >>>> ++    export RPM_CUSTOM_ARCH=3Dgenericx86_64
> > >>>> ++    export RPM_CUSTOM_ISANAME=3Dx86
> > >>>> ++    export RPM_CUSTOM_ISABITS=3D64
> > >>>> ++    export RPM_CUSTOM_CANONARCH=3Dx86_64
> > >>>> ++    export RPM_CUSTOM_CANONCOLOR=3D0 # to use /usr/lib for %_lib=
dir
> > >>>> ++    export RPM_CUSTOM_CANONCOLOR=3D3 # to use /usr/lib64 for %_l=
ibdir
> > >>>> ++
> > >>>> ++    make install
> > >>>> ++
> > >>>> ++This also creates and installs the new platform file e.g.
> > >>>> ++/usr/lib/platform/genericx86_64-linux/macros
> > >>>> ++
> > >>>> ++
> > >>>> + Rpm comes with an automated self-test suite. The test-suite reli=
es heavily
> > >>>> + on fakechroot (https://github.com/dex4er/fakechroot/) and cannot=
 be executed
> > >>>> + without it. Provided that fakechroot was found during configure,
> > >>>> +diff --git a/installplatform b/installplatform
> > >>>> +index a5ad7c5b8..59f57697b 100755
> > >>>> +--- a/installplatform
> > >>>> ++++ b/installplatform
> > >>>> +@@ -11,7 +11,7 @@ VENDOR=3D"${4}"
> > >>>> + OS=3D"${5}"
> > >>>> + RPMRC_GNU=3D"${6}"
> > >>>> +
> > >>>> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
> > >>>> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM=
_CUSTOM_ARCH:+custom}; do
> > >>>> +   RPMRC_OPTFLAGS=3D"`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
> > >>>> +   RPMRC_OPTFLAGS=3D"`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
> > >>>> +   case $RPMRC_OPTFLAGS in
> > >>>> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | =
cut -d: -f2`; do
> > >>>> +   CANONCOLOR=3D
> > >>>> +   FILTER=3Dcat
> > >>>> +   case "${ARCH}" in
> > >>>> ++    custom)
> > >>>> ++   ARCH=3D$RPM_CUSTOM_ARCH
> > >>>> ++   ISANAME=3D$RPM_CUSTOM_ISANAME
> > >>>> ++   ISABITS=3D$RPM_CUSTOM_ISABITS
> > >>>> ++   CANONARCH=3D$RPM_CUSTOM_CANONARCH
> > >>>> ++   CANONCOLOR=3D$RPM_CUSTOM_CANONCOLOR
> > >>>> ++    ;;
> > >>>> +     sparc64*)
> > >>>> +    ISANAME=3Dsparc
> > >>>> +    ISABITS=3D64
> > >>>> +--
> > >>>> +2.41.0
> > >>>> +
> > >>>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipe=
s-devtools/rpm/rpm_4.18.1.bb
> > >>>> index 95a9e92f96..0b8ebebb51 100644
> > >>>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > >>>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > >>>> @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-manag=
ement/rpm;branch=3Drpm-4.18.x;protoc
> > >>>>               file://0001-python-Use-Py_hash_t-instead-of-long-in-=
hdr_hash.patch \
> > >>>>               file://fix-declaration.patch \
> > >>>>               file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patc=
h \
> > >>>> +           file://0001-Allow-setting-platform-macro-settings-exte=
rnally-258.patch \
> > >>>>               "
> > >>>>
> > >>>>    PE =3D "1"
> > >>>> @@ -128,10 +129,29 @@ do_install:append:class-nativesdk() {
> > >>>>       EOF
> > >>>>    }
> > >>>>
> > >>>> +def rpm_isaname(d):
> > >>>> +    import re
> > >>>> +    arch =3D d.getVar('TARGET_ARCH')
> > >>>> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
> > >>>> +        return "x86"
> > >>>> +    # Add more platform tweaks for ISANAME as needed
> > >>>> +    return arch
> > >>>> +
> > >>>> +# Add the custom BSP platform "macros" file
> > >>>> +do_install:prepend:class-target() {
> > >>>> +    export RPM_CUSTOM_ARCH=3D"${MACHINE_ARCH}"
> > >>>> +    export RPM_CUSTOM_ISANAME=3D"${@rpm_isaname(d)}"
> > >>>> +    export RPM_CUSTOM_ISABITS=3D"${SITEINFO_BITS}"
> > >>>> +    export RPM_CUSTOM_CANONARCH=3D"${TARGET_ARCH}"
> > >>>> +    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is use=
d for a 64-bit platform
> > >>>> +    export RPM_CUSTOM_CANONCOLOR=3D"${@bb.utils.contains('DISTRO_=
FEATURES', 'multilib', '3', '0', d)}"
> > >>>> +}
> > >>>> +
> > >>>>    # Rpm's make install creates var/tmp which clashes with base-fi=
les packaging
> > >>>>    do_install:append:class-target() {
> > >>>>        rm -rf ${D}/var
> > >>>>    }
> > >>>> +
> > >>>>    do_install:append:class-nativesdk() {
> > >>>>        rm -rf ${D}${SDKPATHNATIVE}/var
> > >>>>        # Ensure find-debuginfo is located correctly inside SDK
> > >>>> --
> > >>>> 2.41.0
> > >>>>
> > >>>>
> > >>>>
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185462): https://lists.openembedded.org/g/openembedde=
d-core/message/185462
> Mute This Topic: https://lists.openembedded.org/mt/100483574/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

