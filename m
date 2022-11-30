Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F62BC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 21:10:16 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.24725.1669842609067128448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 13:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nl3KVj5Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 68A7D240008;
	Wed, 30 Nov 2022 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669842607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JO8dTiJsRjmIQYuJ5DsIeJ1fFJS4d2pBKJClWRfQ6rI=;
	b=nl3KVj5YjuYKFFTwR2n42CSw3kXToZ76KKeHzgtoAv/2JOaUewYakddW4ve4UWIVqYypZv
	FRitYDSN+IVef0yEAGYLWAb5+YVKOrSoONkR+tOufytU5CjSmBG9ORwmGQGXQbKglpMkmP
	8wq++xnNU2NNHpsPw36PFAfcNd7rF8E+4/wnpaVEn8BMHD3cGquXbApAr0fNxblSJD0FoQ
	BdtVhPnrbjicvV8twyHvXwNd9VzBFSzuOvNgN5vHZfP7AHLNOWNyEbDfNtVNuAA9nah5QZ
	lJspSQnNdaO0JaRgHtrunRdDYjpuDEamyUldK/MKqu60cQnTjIotoXFfc/1DIQ==
Date: Wed, 30 Nov 2022 22:10:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv8 3/4] gtk4: import recipe from meta-gnome
Message-ID: <Y4fGrcXzncz1dg0b@mail.local>
References: <20221130053450.95655-1-f_l_k@t-online.de>
 <20221130053450.95655-3-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130053450.95655-3-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 21:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174030

Hello,

This one popped up:

| Program gi-docgen found: NO
| 
| ../gtk-4.6.7/docs/reference/meson.build:4:0: ERROR: Program 'gi-docgen' not found or not executable

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3817/steps/11/logs/stdio

On 30/11/2022 06:34:49+0100, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-gnome/gtk+/gtk4_4.6.7.bb | 142 ++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk4_4.6.7.bb
> 
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb b/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb
> new file mode 100644
> index 0000000000..c71be23a7d
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb
> @@ -0,0 +1,142 @@
> +SUMMARY = "Multi-platform toolkit for creating GUIs"
> +DESCRIPTION = "GTK is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
> +set of widgets, GTK is suitable for projects ranging from small one-off projects to complete application suites."
> +HOMEPAGE = "http://www.gtk.org"
> +BUGTRACKER = "https://bugzilla.gnome.org/"
> +SECTION = "libs"
> +
> +DEPENDS = " \
> +    sassc-native \
> +    glib-2.0 \
> +    libepoxy \
> +    graphene \
> +    cairo \
> +    pango \
> +    atk \
> +    jpeg \
> +    libpng \
> +    librsvg \
> +    tiff \
> +    gdk-pixbuf-native gdk-pixbuf \
> +"
> +
> +LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = " \
> +    file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
> +    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
> +    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
> +    file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
> +"
> +
> +MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
> +
> +SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "effd2e7c4b5e2a5c7fad43e0f24adea68baa4092abb0b752caff278e6bb010e8"
> +
> +S = "${WORKDIR}/gtk-${PV}"
> +
> +inherit meson gettext pkgconfig gtk-doc update-alternatives gsettings features_check gobject-introspection
> +
> +# TBD: nativesdk
> +# gobject-introspection.bbclass pins introspection off for nativesk. As long as
> +# we do not remove this wisdom or hack gtk4, it is not possible to build
> +# nativesdk-gtk4
> +BBCLASSEXTEND = "native"
> +
> +GSETTINGS_PACKAGE:class-native = ""
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +GIR_MESON_ENABLE_FLAG = 'enabled'
> +GIR_MESON_DISABLE_FLAG = 'disabled'
> +GTKDOC_MESON_OPTION = 'gtk_doc'
> +
> +EXTRA_OEMESON = " -Dbuild-tests=false"
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
> +PACKAGECONFIG:class-native = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +
> +PACKAGECONFIG[x11] = "-Dx11-backend=true,-Dx11-backend=false,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes xinerama"
> +PACKAGECONFIG[wayland] = "-Dwayland-backend=true,-Dwayland-backend=false,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
> +PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups"
> +PACKAGECONFIG[colord] = "-Dcolord=enabled,-Dcolord=disabled,colord"
> +# gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
> +PACKAGECONFIG[gstreamer] = "-Dmedia-gstreamer=enabled,-Dmedia-gstreamer=disabled,gstreamer1.0-plugins-bad"
> +PACKAGECONFIG[tracker] = "-Dtracker=enabled,-Dtracker=disabled,tracker"
> +
> +
> +do_compile:prepend() {
> +    export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
> +}
> +
> +
> +PACKAGES =+ "${PN}-demo"
> +LIBV = "4.0.0"
> +
> +FILES:${PN}-demo = " \
> +    ${datadir}/applications/org.gtk.Demo4.desktop \
> +    ${datadir}/applications/org.gtk.IconBrowser4.desktop \
> +    ${datadir}/applications/org.gtk.WidgetFactory4.desktop \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.Demo4*.* \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.IconBrowser4*.* \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.WidgetFactory4*.* \
> +    ${bindir}/gtk4-demo \
> +    ${bindir}/gtk4-demo-application \
> +    ${bindir}/gtk4-icon-browser \
> +    ${bindir}/gtk4-widget-factory \
> +"
> +
> +FILES:${PN}:append = " \
> +    ${datadir}/glib-2.0/schemas/ \
> +    ${datadir}/gtk-4.0/emoji/ \
> +    ${datadir}/metainfo/ \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \
> +    ${libdir}/gtk-4.0/${LIBV}/printbackends \
> +    ${bindir}/gtk4-update-icon-cache \
> +    ${bindir}/gtk4-launch \
> +"
> +
> +FILES:${PN}-dev += " \
> +    ${datadir}/gtk-4.0/gtk4builder.rng \
> +    ${datadir}/gtk-4.0/include \
> +    ${datadir}/gtk-4.0/valgrind \
> +    ${datadir}/gettext/its \
> +    ${bindir}/gtk4-builder-tool \
> +    ${bindir}/gtk4-encode-symbolic-svg \
> +    ${bindir}/gtk4-query-settings \
> +"
> +
> +GTKBASE_RRECOMMENDS ?= " \
> +    liberation-fonts \
> +    gdk-pixbuf-loader-png \
> +    gdk-pixbuf-loader-jpeg \
> +    gdk-pixbuf-loader-gif \
> +    gdk-pixbuf-loader-xpm \
> +    shared-mime-info \
> +    adwaita-icon-theme-symbolic \
> +"
> +
> +GTKBASE_RRECOMMENDS:class-native ?= ""
> +
> +GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
> +
> +RRECOMMENDS:${PN} = "${GTKBASE_RRECOMMENDS}"
> +RRECOMMENDS:${PN}:libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
> +RDEPENDS:${PN}-dev += "${@bb.utils.contains("PACKAGECONFIG", "wayland", "wayland-protocols", "", d)}"
> +
> +PACKAGES_DYNAMIC += "^gtk4-printbackend-.*"
> +python populate_packages:prepend () {
> +    import os.path
> +
> +    gtk_libdir = d.expand('${libdir}/gtk-3.0/${LIBV}')
> +    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
> +
> +    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$', 'gtk4-printbackend-%s', 'GTK printbackend module for %s')
> +
> +    if (d.getVar('DEBIAN_NAMES')):
> +        d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-4.0')
> +}
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173993): https://lists.openembedded.org/g/openembedded-core/message/173993
> Mute This Topic: https://lists.openembedded.org/mt/95352832/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

