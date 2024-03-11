Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E1AC54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 09:02:59 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.58044.1710147776761631929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 02:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cNCKGFJf;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d29111272eso64954081fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710147775; x=1710752575; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=APBnG66kQ38Zzz2Z97yid84HNy/AMSpPGE83UKJLyHE=;
        b=cNCKGFJfic1mnXKZdr+W7OpkqHpV5G+vceGfffA0WZeJ3yFfA1p1B8YZ7sZ55YazZ7
         S4+EX2X0BmkuSnhtMO2NAud/NxM3coNnq9vCQQN5z+3+yqPcirW+cc0Ye245I/WTNiYc
         IMpiszfKsu22Gp1qFzfPLBpDDQXXbQPDf40j/EF8/HgAxxMbpzK3aql/O9ilCik9EnzX
         ++lrApquhrbZSxB17JzGph9gMITaY7SexhaY9lys0/DQRQbi8ofs08jVrFoRh1ABw6a6
         4idctFlziiJHAB03FxeqN69JJQUClHQ9I3iW5qAaBcJF9GYtP6ENrjN7IXKsgbRL1+Zg
         N42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710147775; x=1710752575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APBnG66kQ38Zzz2Z97yid84HNy/AMSpPGE83UKJLyHE=;
        b=pP3zmIlHoEhxxH8z1Rfmhe7AOehpcnT7Y7Dxl5yfiYm1zy1C8zDwXmILXVTlQglm23
         QoVOK8VdKDzn0FzBd7P6EUTD/79csSd8sowu+L3HZ6E1ADwITaJYEUw0n3QfqftXF18I
         B00kfVON/sz8B0CYYxsz7MDK1Ws7Q6zEjs2jGpIHxW8Jelyr+3oDDAp99ljECjE364QN
         7ndplYame6QiiPndO21H9lVZu9OHtIENKDtF8krRhSzGrZmdzvg17eCPBHpnupJXrpoA
         I7kOI7hp1VUAMMvQeisz6ZMnyuk1HI2ZyK9+oad2pikX8WgZ2rYvyNmanJvbMO3jNcf+
         IxmA==
X-Gm-Message-State: AOJu0Yz/EtCFi30i9PUNALhWnHZV8Tewb6NHzsFoSx0j8Nh/Hj7jsOlp
	PJ6voHcjqmPwT5xcngPyA9QZtyuuVW3x+15oSIg0dUG7BC6RngB489oXy1v+bLJ2ngyUCbvze1y
	3v/bRsGi8jJLAk4OmtWSph7k14EWlecdU
X-Google-Smtp-Source: AGHT+IF2LnwIVywfjoeazGuR385RVoBUT7qRSw1Z9nb1Sjw7kVZP2k09Rss4hbTWU4xvormpwWDc2/MIAYre80DIbCg=
X-Received: by 2002:a2e:8007:0:b0:2d3:dcb0:56d9 with SMTP id
 j7-20020a2e8007000000b002d3dcb056d9mr3823574ljg.29.1710147774628; Mon, 11 Mar
 2024 02:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240311072125.214522-1-f_l_k@t-online.de>
In-Reply-To: <20240311072125.214522-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Mar 2024 10:02:42 +0100
Message-ID: <CANNYZj8s_=iRTp+cYS0X9Pb28o9JbpJZM7iVpo-wVsp3TOO5dg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] vala: fix for gtk4 prior to 4.14
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196927

Please split the .bb/.inc merge into a separate commit.


Alex

On Mon, 11 Mar 2024 at 08:21, Markus Volk <f_l_k@t-online.de> wrote:
>
> - add a backport patch to fix compatibility with older gtk4 versions
> - merge .bb and .inc
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-devtools/vala/vala.inc           | 71 -----------------
>  ...tk4-Preserve-compatibility-with-4.14.patch | 39 ++++++++++
>  meta/recipes-devtools/vala/vala_0.56.15.bb    | 76 ++++++++++++++++++-
>  3 files changed, 114 insertions(+), 72 deletions(-)
>  delete mode 100644 meta/recipes-devtools/vala/vala.inc
>  create mode 100644 meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
>
> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
> deleted file mode 100644
> index 0177e86240..0000000000
> --- a/meta/recipes-devtools/vala/vala.inc
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -SUMMARY = "C#-like programming language for easing GObject programming"
> -HOMEPAGE = "http://vala-project.org"
> -DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
> -Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
> -SECTION = "devel"
> -DEPENDS = "bison-native flex-native glib-2.0 gobject-introspection"
> -
> -# Appending libxslt-native to dependencies has an effect
> -# of rebuilding the manual, which is very slow. Let's do this
> -# only when api-documentation distro feature is enabled.
> -DEPENDS:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'libxslt-native', '', d)}"
> -
> -# vala-native contains a native version of vapigen, which we use instead of the target one
> -DEPENDS:append:class-target = " vala-native"
> -BBCLASSEXTEND = "native"
> -LICENSE = "LGPL-2.1-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> -
> -SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> -
> -SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
> -inherit autotools pkgconfig upstream-version-is-even
> -
> -FILES:${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
> -FILES:${PN}-doc += "${datadir}/devhelp"
> -
> -# .gir files from gobject-introspection are installed to ${libdir} when multilib is enabled
> -GIRDIR_OPT = "${@'--girdir=${STAGING_LIBDIR}/gir-1.0' if d.getVar('MULTILIBS') else ''}"
> -
> -do_configure:prepend:class-target() {
> -        # Write out a vapigen wrapper that will be provided by pkg-config file installed in target sysroot
> -        # The wrapper will call a native vapigen
> -        cat > ${B}/vapigen-wrapper << EOF
> -#!/bin/sh
> -vapigen-${SHRT_VER} ${GIRDIR_OPT} "\$@"
> -EOF
> -        chmod +x ${B}/vapigen-wrapper
> -}
> -
> -EXTRA_OECONF += " --disable-valadoc"
> -
> -# Vapigen wrapper needs to be available system-wide, because it will be used
> -# to build vapi files from all other packages with vala support
> -do_install:append:class-target() {
> -        install -d ${D}${bindir_crossscripts}/
> -        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
> -}
> -
> -# Put vapigen wrapper into target sysroot so that it can be used when building
> -# vapi files.
> -SYSROOT_DIRS += "${bindir_crossscripts}"
> -
> -inherit multilib_script
> -MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
> -
> -SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
> -vapigen_sysroot_preprocess() {
> -        # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
> -        # up our wrapper.
> -        sed -i \
> -           -e "s|vapigen=.*|vapigen=${bindir_crossscripts}/vapigen-wrapper|" \
> -           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
> -}
> -
> -SSTATE_SCAN_FILES += "vapigen-wrapper"
> -
> -PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
> -
> -vala_package_preprocess () {
> -       rm -rf ${PKGD}${bindir_crossscripts}
> -}
> diff --git a/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
> new file mode 100644
> index 0000000000..161474086e
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
> @@ -0,0 +1,39 @@
> +From 17349020fb95454d06f827fd555b05248f10a370 Mon Sep 17 00:00:00 2001
> +From: Rico Tzschichholz <ricotz@ubuntu.com>
> +Date: Thu, 7 Mar 2024 17:56:05 +0100
> +Subject: [PATCH] gtk4: Preserve compatibility with < 4.14
> +
> +Don't prefer new accessor methods for Calendar.day/month/year
> +
> +Fixes https://gitlab.gnome.org/GNOME/vala/issues/1531
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vala/-/commit/e0c4ea8c4a0bbf859b5341a7465b395892789d9e]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + vapi/gtk4.vapi                 | 3 +++
> + vapi/metadata/Gtk-4.0.metadata | 5 +++++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/vapi/gtk4.vapi b/vapi/gtk4.vapi
> +index 49f8b2078..51ecea27d 100644
> +--- a/vapi/gtk4.vapi
> ++++ b/vapi/gtk4.vapi
> +@@ -7350,11 +7350,14 @@ namespace Gtk {
> +               [Version (since = "4.14")]
> +               public void set_year (int year);
> +               public void unmark_day (uint day);
> ++              [NoAccessorMethod]
> +               public int day { get; set; }
> ++              [NoAccessorMethod]
> +               public int month { get; set; }
> +               public bool show_day_names { get; set; }
> +               public bool show_heading { get; set; }
> +               public bool show_week_numbers { get; set; }
> ++              [NoAccessorMethod]
> +               public int year { get; set; }
> +               public signal void day_selected ();
> +               public signal void next_month ();
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb b/meta/recipes-devtools/vala/vala_0.56.15.bb
> index dc483b12ba..1f55689c45 100644
> --- a/meta/recipes-devtools/vala/vala_0.56.15.bb
> +++ b/meta/recipes-devtools/vala/vala_0.56.15.bb
> @@ -1,3 +1,77 @@
> -require ${BPN}.inc
> +SUMMARY = "C#-like programming language for easing GObject programming"
> +HOMEPAGE = "http://vala-project.org"
> +DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
> +Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
> +SECTION = "devel"
> +DEPENDS = "bison-native flex-native glib-2.0 gobject-introspection"
>
> +# Appending libxslt-native to dependencies has an effect
> +# of rebuilding the manual, which is very slow. Let's do this
> +# only when api-documentation distro feature is enabled.
> +DEPENDS:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'libxslt-native', '', d)}"
> +
> +# vala-native contains a native version of vapigen, which we use instead of the target one
> +DEPENDS:append:class-target = " vala-native"
> +BBCLASSEXTEND = "native"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> +
> +SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> +
> +SRC_URI = " \
> +       http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz \
> +       file://0001-gtk4-Preserve-compatibility-with-4.14.patch \
> +"
>  SRC_URI[sha256sum] = "535b6452ed310fd5fb5c7dd6794b6213dac3b48e645e5bff3173741ec2cb3f2b"
> +
> +inherit autotools pkgconfig upstream-version-is-even
> +
> +FILES:${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
> +FILES:${PN}-doc += "${datadir}/devhelp"
> +
> +# .gir files from gobject-introspection are installed to ${libdir} when multilib is enabled
> +GIRDIR_OPT = "${@'--girdir=${STAGING_LIBDIR}/gir-1.0' if d.getVar('MULTILIBS') else ''}"
> +
> +do_configure:prepend:class-target() {
> +        # Write out a vapigen wrapper that will be provided by pkg-config file installed in target sysroot
> +        # The wrapper will call a native vapigen
> +        cat > ${B}/vapigen-wrapper << EOF
> +#!/bin/sh
> +vapigen-${SHRT_VER} ${GIRDIR_OPT} "\$@"
> +EOF
> +        chmod +x ${B}/vapigen-wrapper
> +}
> +
> +EXTRA_OECONF += " --disable-valadoc"
> +
> +# Vapigen wrapper needs to be available system-wide, because it will be used
> +# to build vapi files from all other packages with vala support
> +do_install:append:class-target() {
> +        install -d ${D}${bindir_crossscripts}/
> +        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
> +}
> +
> +# Put vapigen wrapper into target sysroot so that it can be used when building
> +# vapi files.
> +SYSROOT_DIRS += "${bindir_crossscripts}"
> +
> +inherit multilib_script
> +MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
> +
> +SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
> +vapigen_sysroot_preprocess() {
> +        # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
> +        # up our wrapper.
> +        sed -i \
> +           -e "s|vapigen=.*|vapigen=${bindir_crossscripts}/vapigen-wrapper|" \
> +           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
> +}
> +
> +SSTATE_SCAN_FILES += "vapigen-wrapper"
> +
> +PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
> +
> +vala_package_preprocess () {
> +       rm -rf ${PKGD}${bindir_crossscripts}
> +}
> +
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196918): https://lists.openembedded.org/g/openembedded-core/message/196918
> Mute This Topic: https://lists.openembedded.org/mt/104858861/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

