Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23BDC41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 08:30:48 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.2909.1690446643964293621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 01:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VuO0blqs;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b933bbd3eeso9737641fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 01:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690446642; x=1691051442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vq0eowtzxoIqgxcFEtUmM7i5wXg5RFxlbcXDdsf0D4=;
        b=VuO0blqshvA6QRfbTmwre8+LxEf+AmhVajjPwmxaBRWKxIA+D9L7x8C4rYdsd2VnjI
         c+rAH9tZxsYySlQC4FzO0sebeFT8Sh9Hq+PpfqTaAl4+3F25/ZHm36FGLhMsnODBePKM
         6N90Qefjh0U/GRE0RYyLkWMJbOH2J87FYrdveqkvvpKUO9at4ZwnKhqK8aSvr4/6nsAP
         ioo5+kaLvwEgOIMMdNDJBshIklHJAVHl4/HeFYQMl8UFsbzXCM8l8ee3WjapqsTwMYbe
         vcYL3b8pVABLo2VGfTvJ6YLFLxZvKGoCXq/49a62gFNbJYnflY9tGjlMpJHHueTqfEZ9
         Q5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690446642; x=1691051442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vq0eowtzxoIqgxcFEtUmM7i5wXg5RFxlbcXDdsf0D4=;
        b=Sx4eVuWpZSvUGeCxFP6NNMGYocLZ20NUNyZmQgfRjedsA1yT7a8j+u+aR0ErO8r08/
         wRO5LhPcT9koUI2q28KtKdfpJBnY37j+aITamHM40sAe1PP/ziyH1yjiih4+d6rDkSWK
         zHp2EtHqLHuWXwDwUOW3vRcbPZi/EDVryM9SRCYw8pHgR3k9Aek1A7BhYCgZFT4jI0VO
         6e6hI4kwHF4mIOHxZpK24xjGeez2vLmuHTg6/RLTV95K+gjXEivsTXDJ55a07r/rcOOB
         3iFDH9FRBLxiVCY10lI5cv+iKKwXYNeCGkqZ0jkm7oU24L4DYEyyYvRci/k3CeXUtfxU
         ZsTA==
X-Gm-Message-State: ABy/qLaistW+ETEZvo2txQEKnDRZV+RYYkF9wAbSaKNirKyu/0uP5rlf
	y3MSBkDkUO4F5ensFk6SHALjanlKgQBM3g/TCiw=
X-Google-Smtp-Source: APBJJlGP8hdEpPl6wrXi0BOGOsr2lsWEzAKbpIH7waRzkfmljLT+fl/+7zlDmvfAd1OhEgwZQmUQzu7Izs0XCQk061Q=
X-Received: by 2002:a2e:9804:0:b0:2b9:b41a:aa66 with SMTP id
 a4-20020a2e9804000000b002b9b41aaa66mr1387020ljj.20.1690446641666; Thu, 27 Jul
 2023 01:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230725135719.388231-1-zboszor@gmail.com> <CANNYZj9_AbGN9YsahpHVHA8wqingZaKfv-DD_DPGURt4ezPn5Q@mail.gmail.com>
 <17756CA97DEFC46E.21334@lists.openembedded.org> <dfbfb13e-208b-4a63-b0a6-339452184c9c@gmail.com>
In-Reply-To: <dfbfb13e-208b-4a63-b0a6-339452184c9c@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jul 2023 10:30:29 +0200
Message-ID: <CANNYZj-7LvTF9qBuQu_grfX6LAMwQHG6fme8xE2+F-nA=0x7+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm: Allow setting platform macro settings externally
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 08:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184921

I was hoping to get a reaction from Panu (who's the maintainer; Neal
is a contributor), but then I remembered he's a Finn, and this time of
the year all Finns disappear into summer cabins - temperatures above
+20 are still rare in that country, and actual sun in the sky is even
more precious :)

So I'm slightly torn: I don't have anything against the patch, I just
don't want to carry (and maintain) something that upstream rejected.
We've had plenty of such incidents with rpm in the past.

Alex

On Thu, 27 Jul 2023 at 09:32, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> Patch approved with the requested changes.
>
> I sent a v2 with using the approved patch and adding
> the exports only to do_install:class-target because
> that's where it's needed.
>
> 2023. 07. 26. 15:05 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.openem=
bedded.org =C3=ADrta:
> > 2023. 07. 25. 18:30 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> >> I would want to hold this until we have a reaction from upstream.
> >
> > Now we have reaction. Both PRs were closed because they were not
> > against master, my bad. Now reopened against master as
> > https://github.com/rpm-software-management/rpm/pull/2585
> >
> > But there was some real comment here:
> > https://github.com/rpm-software-management/rpm/pull/2580#issuecomment-1=
651647277
> >
> > The discussion may/should be taken to the issue at
> > https://github.com/rpm-software-management/rpm/issues/2578
> >
> >> RPM_CUSTOM_* exports should go to specific tasks where they are needed=
.
> >>
> >> Alex
> >>
> >> On Tue, 25 Jul 2023 at 15:57, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <=
zboszor@gmail.com> wrote:
> >>> Feed platform settings to installplatform externally. Based on the pa=
tch
> >>> submitted under https://github.com/rpm-software-management/rpm/pull/2=
579
> >>>
> >>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >>> ---
> >>>   ...ng-plaform-macro-settings-externally.patch | 56 ++++++++++++++++=
+++
> >>>   meta/recipes-devtools/rpm/rpm_4.18.1.bb       | 17 ++++++
> >>>   2 files changed, 73 insertions(+)
> >>>   create mode 100644
> >>> meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-sett=
ings-externally.patch
> >>>
> >>> diff --git
> >>> a/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-se=
ttings-externally.patch
> >>> b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-se=
ttings-externally.patch
> >>>
> >>> new file mode 100644
> >>> index 0000000000..8b3220f114
> >>> --- /dev/null
> >>> +++
> >>> b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-se=
ttings-externally.patch
> >>> @@ -0,0 +1,56 @@
> >>> +From 320f4f3861dad70342f065004311eac143d6522d Mon Sep 17 00:00:00 20=
01
> >>> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> >>> + <zboszor@gmail.com>
> >>> +Date: Tue, 25 Jul 2023 10:56:44 +0200
> >>> +Subject: [PATCH] Allow setting plaform macro settings externally
> >>> +MIME-Version: 1.0
> >>> +Content-Type: text/plain; charset=3DUTF-8
> >>> +Content-Transfer-Encoding: 8bit
> >>> +
> >>> +Yocto has their own way to set the platform names via BSPs
> >>> +(Board Support Packages). These names are more specific than
> >>> +basic CPU architectures, and such a platform name ends up in
> >>> +/etc/rpm/platform but the corresponding subdirectory under
> >>> +/usr/lib/rpm/platform does not exist.
> >>> +
> >>> +Allow creating such custom platform subdirectory with feeding
> >>> +the necessary data using external variables: RPM_CUSTOM_ARCH,
> >>> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
> >>> +and RPM_CUSTOM_CANONCOLOR
> >>> +
> >>> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail=
.com>
> >>> +Upstream-Status: Submitted [https://github.com/rpm-software-manageme=
nt/rpm/pull/2579]
> >>> +---
> >>> + installplatform | 9 ++++++++-
> >>> + 1 file changed, 8 insertions(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/installplatform b/installplatform
> >>> +index a5ad7c5b8..59f57697b 100755
> >>> +--- a/installplatform
> >>> ++++ b/installplatform
> >>> +@@ -11,7 +11,7 @@ VENDOR=3D"${4}"
> >>> + OS=3D"${5}"
> >>> + RPMRC_GNU=3D"${6}"
> >>> +
> >>> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
> >>> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`
> >>> ${RPM_CUSTOM_ARCH:+custom}; do
> >>> +   RPMRC_OPTFLAGS=3D"`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
> >>> +   RPMRC_OPTFLAGS=3D"`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
> >>> +   case $RPMRC_OPTFLAGS in
> >>> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut=
 -d: -f2`; do
> >>> +   CANONCOLOR=3D
> >>> +   FILTER=3Dcat
> >>> +   case "${ARCH}" in
> >>> ++    custom)
> >>> ++      ARCH=3D$RPM_CUSTOM_ARCH
> >>> ++      ISANAME=3D$RPM_CUSTOM_ISANAME
> >>> ++      ISABITS=3D$RPM_CUSTOM_ISABITS
> >>> ++      CANONARCH=3D$RPM_CUSTOM_CANONARCH
> >>> ++      CANONCOLOR=3D$RPM_CUSTOM_CANONCOLOR
> >>> ++    ;;
> >>> +     sparc64*)
> >>> +       ISANAME=3Dsparc
> >>> +       ISABITS=3D64
> >>> +--
> >>> +2.41.0
> >>> +
> >>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> >>> b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> >>> index 95a9e92f96..bc036fc843 100644
> >>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> >>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> >>> @@ -40,6 +40,7 @@ SRC_URI =3D
> >>> "git://github.com/rpm-software-management/rpm;branch=3Drpm-4.18.x;pro=
toc
> >>> file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
> >>>              file://fix-declaration.patch \
> >>> file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
> >>> + file://0001-Allow-setting-plaform-macro-settings-externally.patch \
> >>>              "
> >>>
> >>>   PE =3D "1"
> >>> @@ -103,6 +104,21 @@ WRAPPER_TOOLS =3D " \
> >>>      ${libdir}/rpm/rpmdeps \
> >>>   "
> >>>
> >>> +def rpm_isaname(d):
> >>> +    import re
> >>> +    arch =3D d.getVar('TARGET_ARCH')
> >>> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
> >>> +        return "x86"
> >>> +    # Add more platform tweaks for ISANAME as needed
> >>> +    return arch
> >>> +
> >>> +export RPM_CUSTOM_ARCH =3D "${MACHINE_ARCH}"
> >>> +export RPM_CUSTOM_ISANAME =3D "${@rpm_isaname(d)}"
> >>> +export RPM_CUSTOM_ISABITS =3D "${SITEINFO_BITS}"
> >>> +export RPM_CUSTOM_CANONARCH =3D "${TARGET_ARCH}"
> >>> +# CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a=
 64-bit platform
> >>> +export RPM_CUSTOM_CANONCOLOR =3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'multilib',
> >>> '3', '0', d)}"
> >>> +
> >>>   do_configure:prepend() {
> >>>           mkdir -p ${S}/build-aux
> >>>   }
> >>> @@ -132,6 +148,7 @@ do_install:append:class-nativesdk() {
> >>>   do_install:append:class-target() {
> >>>       rm -rf ${D}/var
> >>>   }
> >>> +
> >>>   do_install:append:class-nativesdk() {
> >>>       rm -rf ${D}${SDKPATHNATIVE}/var
> >>>       # Ensure find-debuginfo is located correctly inside SDK
> >>> --
> >>> 2.41.0
> >>>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184883): https://lists.openembedded.org/g/openembed=
ded-core/message/184883
> > Mute This Topic: https://lists.openembedded.org/mt/100350661/3617728
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
zboszor@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

