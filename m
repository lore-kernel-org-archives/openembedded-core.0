Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.15655.1588626103976780555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 14:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LMRhLgt/;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id z7so418773qvl.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 14:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TkhUdHkl0QofsvVfHQuIOTGj+x/BmlIC9C7tzKgmTYY=;
        b=LMRhLgt/WqxtJ3Xo7xMdKmBRO1zmrRsLLoECoSHJsrn5NUr4mxIc3h0AmCWEmkIs9C
         YYXN6o7Jr1jl8ihcXS5fDhVcYmWardnbLXJ5/QxAZIviMGUDBJwutCvJZuVzqSE83KR5
         2fx+MGPAPtZ4kwxmxNq1e5J+i4NSo8tb+hX8+ADj8ATAWexFYCAIT96LwfdD/oJI+eb3
         BBI7C3x2dQ9K6JJ54jt/DBwTSTsdi8WafVwoG7prN3JBvbPnOo2INSIfkJCO3xBzhN33
         Ecm3z10KIvLQoHMZMxOxreFNm4g0cCR72cWzHFC1hDKRczahpd55fv0LJLsKQqbHZLxF
         7Q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TkhUdHkl0QofsvVfHQuIOTGj+x/BmlIC9C7tzKgmTYY=;
        b=mkkigtO1rdYWV8HzE2oy9lt3f6Ztf2Nh9lm8PqxqVle4hQbIbNkTQsf6RGDONJLOUC
         twJHgMh7ym77q0tYTknqV+By5VetR+/pIi270BAX9XgG1/bO/BYlPm4WYiZEfVWMF/+2
         QrQwIPudvRV6GnXqGDBijA33/ytPWfSlPVCyh8hKMV8o7Vt6+C22iOJe9GVkFVlRf/Of
         OokChqvfzVrr4ieq8JMDyDL8pAoYxIyj8WDDcwih2knqEJqDGeLwQJO/H9zv0xiYbOH6
         tNmNcGBf1Z56sCPJG/ENifI6Fk4lHWjBfscsM1Ix2dtnq7Uxq0MrY86K8DiEClrwE52b
         vnPQ==
X-Gm-Message-State: AGi0PuYZudZqov7cOBrj7LdBg8P12MO1xYMkdU2HWPA/xzcY/6yBTKPn
	19n6VF6eBzif1oec3a/jWb/9bRdHX4PA4jQUSDuCdAzrqu4=
X-Google-Smtp-Source: APiQypI1ZCpqVsDsxPSnNoKd2VVIxcjS3TLQjT3vRBgcVgPl8LAD2YEuTB0itNgaRpedAnVGZOimvO/2NarhFt5R3+E=
X-Received: by 2002:ad4:4182:: with SMTP id e2mr9754qvp.61.1588626102487; Mon,
 04 May 2020 14:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200503162559.946-1-alex.kanavin@gmail.com> <20200503162559.946-8-alex.kanavin@gmail.com>
In-Reply-To: <20200503162559.946-8-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 4 May 2020 14:01:16 -0700
Message-ID: <CAMKF1soShHWQoJp_XOzsU2Ud0ELTo4AMGMg58K5QmoLmu_PUdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/17] avahi: merge avahi-ui into the main recipe
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

remmina from meta-oe depends on avahi-ui so anyway its fixable by
changing the dependency but then it fails to find needed gtk3 support,
please take a look

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/331

On Sun, May 3, 2020 at 9:26 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> The split was building the same code twice, awkward to maintain,
> and causing issues with upgrades.
>
> Disabling the gtk bits can be easily done through the standard
> PACKAGECONFIG mechanism when needed.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  .../avahi/avahi-ui_0.7.bb                     | 54 ----------
>  meta/recipes-connectivity/avahi/avahi.inc     | 86 ----------------
>  meta/recipes-connectivity/avahi/avahi_0.7.bb  | 98 ++++++++++++++++++-
>  4 files changed, 95 insertions(+), 144 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
>  delete mode 100644 meta/recipes-connectivity/avahi/avahi.inc
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 340cda3300..54b3c5678c 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -57,7 +57,6 @@ RECIPE_MAINTAINER_pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
> -RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-babeltrace2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
> deleted file mode 100644
> index 1510a0ef4f..0000000000
> --- a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -require avahi.inc
> -
> -inherit features_check
> -ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> -
> -DEPENDS += "avahi"
> -
> -AVAHI_GTK = "gtk3"
> -
> -S = "${WORKDIR}/avahi-${PV}"
> -
> -PACKAGES += "${PN}-utils avahi-discover"
> -
> -FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
> -FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
> -FILES_avahi-discover = "${datadir}/applications/avahi-discover.desktop \
> -                        ${datadir}/avahi/interfaces/avahi-discover.ui \
> -                        ${bindir}/avahi-discover-standalone \
> -                        "
> -
> -do_install_append () {
> -       rm ${D}${sysconfdir} -rf
> -       if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
> -               if [ "${nonarch_base_libdir}" != "${base_libdir}" ];then
> -                   rm ${D}${nonarch_base_libdir} -rf
> -               fi
> -        else
> -               rm ${D}${base_libdir} -rf
> -        fi
> -       rm ${D}${systemd_unitdir} -rf
> -       # The ${systemd_unitdir} is /lib/systemd, so we need rmdir /lib,
> -       # but not ${base_libdir} here. And the /lib may not exist
> -       # whithout systemd.
> -       [ ! -d ${D}/lib ] || rmdir ${D}/lib --ignore-fail-on-non-empty
> -       rm ${D}${bindir}/avahi-b*
> -       rm ${D}${bindir}/avahi-p*
> -       rm ${D}${bindir}/avahi-r*
> -       rm ${D}${bindir}/avahi-s*
> -       rm ${D}${includedir}/avahi-c* -rf
> -       rm ${D}${includedir}/avahi-g* -rf
> -       rm ${D}${libdir}/libavahi-c*
> -       rm ${D}${libdir}/libavahi-g*
> -       rm ${D}${libdir}/pkgconfig/avahi-c*
> -       rm ${D}${libdir}/pkgconfig/avahi-g*
> -       rm ${D}${sbindir} -rf
> -       rm ${D}${datadir}/avahi/a*
> -       rm ${D}${datadir}/locale/ -rf
> -       rm ${D}${datadir}/dbus* -rf
> -       rm ${D}${mandir}/man1/a*
> -       rm ${D}${mandir}/man5 -rf
> -       rm ${D}${mandir}/man8 -rf
> -        rm ${D}${libdir}/girepository-1.0/ -rf
> -        rm ${D}${datadir}/gir-1.0/ -rf
> -}
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> deleted file mode 100644
> index 94fe6a16b6..0000000000
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -SUMMARY = "Avahi IPv4LL network address configuration daemon"
> -DESCRIPTION = 'Avahi is a fully LGPL framework for Multicast DNS Service Discovery. It \
> -allows programs to publish and discover services and hosts running on a local network \
> -with no specific configuration. This tool implements IPv4LL, "Dynamic Configuration of \
> -IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP address \
> -configuration from the link-local 169.254.0.0/16 range without the need for a central \
> -server.'
> -AUTHOR = "Lennart Poettering <lennart@poettering.net>"
> -HOMEPAGE = "http://avahi.org"
> -BUGTRACKER = "https://github.com/lathiat/avahi/issues"
> -SECTION = "network"
> -
> -# major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts and
> -# python scripts are under GPLv2+
> -LICENSE = "GPLv2+ & LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
> -                    file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
> -                    file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
> -                    file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
> -                    file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
> -
> -SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
> -           file://fix-CVE-2017-6519.patch \
> -           "
> -
> -UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
> -SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
> -SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
> -
> -DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
> -
> -# For gtk related PACKAGECONFIGs: gtk, gtk3
> -AVAHI_GTK ?= ""
> -
> -PACKAGECONFIG ??= "dbus ${AVAHI_GTK}"
> -PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
> -PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
> -PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
> -PACKAGECONFIG[libdns_sd] = "--enable-compat-libdns_sd --enable-dbus,,dbus"
> -
> -inherit autotools pkgconfig gettext gobject-introspection
> -
> -EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
> -             --disable-stack-protector \
> -             --disable-gdbm \
> -             --disable-mono \
> -             --disable-monodoc \
> -             --disable-qt3 \
> -             --disable-qt4 \
> -             --disable-python \
> -             --disable-doxygen-doc \
> -             --enable-manpages \
> -             ${EXTRA_OECONF_SYSVINIT} \
> -             ${EXTRA_OECONF_SYSTEMD} \
> -           "
> -
> -# The distro choice determines what init scripts are installed
> -EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
> -EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
> -
> -do_configure_prepend() {
> -    sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
> -
> -    # This m4 file will get in the way of our introspection.m4 with special cross-compilation fixes
> -    rm "${S}/common/introspection.m4" || true
> -}
> -
> -do_compile_prepend() {
> -    export GIR_EXTRA_LIBS_PATH="${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
> -}
> -
> -RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
> -
> -do_install() {
> -       autotools_do_install
> -       rm -rf ${D}/run
> -       rm -rf ${D}${datadir}/dbus-1/interfaces
> -       test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
> -       rm -rf ${D}${libdir}/avahi
> -}
> -
> -PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "libdns_sd", "libavahi-compat-libdnssd", "", d)}"
> -
> -FILES_libavahi-compat-libdnssd = "${libdir}/libdns_sd.so.*"
> -
> -RPROVIDES_libavahi-compat-libdnssd = "libdns-sd"
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
> index 24523c7f81..b25cffa3cd 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
> @@ -1,4 +1,89 @@
> -require avahi.inc
> +SUMMARY = "Avahi IPv4LL network address configuration daemon"
> +DESCRIPTION = 'Avahi is a fully LGPL framework for Multicast DNS Service Discovery. It \
> +allows programs to publish and discover services and hosts running on a local network \
> +with no specific configuration. This tool implements IPv4LL, "Dynamic Configuration of \
> +IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP address \
> +configuration from the link-local 169.254.0.0/16 range without the need for a central \
> +server.'
> +AUTHOR = "Lennart Poettering <lennart@poettering.net>"
> +HOMEPAGE = "http://avahi.org"
> +BUGTRACKER = "https://github.com/lathiat/avahi/issues"
> +SECTION = "network"
> +
> +# major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts and
> +# python scripts are under GPLv2+
> +LICENSE = "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
> +                    file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
> +                    file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
> +                    file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
> +                    file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
> +
> +SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
> +           file://fix-CVE-2017-6519.patch \
> +           "
> +
> +UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
> +SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
> +SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
> +
> +DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
> +
> +# For gtk related PACKAGECONFIGs: gtk, gtk3
> +AVAHI_GTK ?= "gtk3"
> +
> +PACKAGECONFIG ??= "dbus ${AVAHI_GTK}"
> +PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
> +PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
> +PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
> +PACKAGECONFIG[libdns_sd] = "--enable-compat-libdns_sd --enable-dbus,,dbus"
> +
> +inherit autotools pkgconfig gettext gobject-introspection
> +
> +EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
> +             --disable-stack-protector \
> +             --disable-gdbm \
> +             --disable-mono \
> +             --disable-monodoc \
> +             --disable-qt3 \
> +             --disable-qt4 \
> +             --disable-python \
> +             --disable-doxygen-doc \
> +             --enable-manpages \
> +             ${EXTRA_OECONF_SYSVINIT} \
> +             ${EXTRA_OECONF_SYSTEMD} \
> +           "
> +
> +# The distro choice determines what init scripts are installed
> +EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
> +EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
> +
> +do_configure_prepend() {
> +    sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
> +
> +    # This m4 file will get in the way of our introspection.m4 with special cross-compilation fixes
> +    rm "${S}/common/introspection.m4" || true
> +}
> +
> +do_compile_prepend() {
> +    export GIR_EXTRA_LIBS_PATH="${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
> +}
> +
> +RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
> +
> +do_install() {
> +       autotools_do_install
> +       rm -rf ${D}/run
> +       rm -rf ${D}${datadir}/dbus-1/interfaces
> +       test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
> +       rm -rf ${D}${libdir}/avahi
> +}
> +
> +PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "libdns_sd", "libavahi-compat-libdnssd", "", d)}"
> +
> +FILES_libavahi-compat-libdnssd = "${libdir}/libdns_sd.so.*"
> +
> +RPROVIDES_libavahi-compat-libdnssd = "libdns-sd"
>
>  SRC_URI += "file://00avahi-autoipd \
>             file://99avahi-autoipd \
> @@ -8,7 +93,13 @@ SRC_URI += "file://00avahi-autoipd \
>
>  inherit update-rc.d systemd useradd
>
> -PACKAGES =+ "libavahi-gobject avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd avahi-utils"
> +PACKAGES =+ "libavahi-gobject avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd avahi-utils avahi-discover avahi-ui"
> +
> +FILES_avahi-ui = "${libdir}/libavahi-ui*.so.*"
> +FILES_avahi-discover = "${datadir}/applications/avahi-discover.desktop \
> +                        ${datadir}/avahi/interfaces/avahi-discover.ui \
> +                        ${bindir}/avahi-discover-standalone \
> +                        "
>
>  LICENSE_libavahi-gobject = "LGPLv2.1+"
>  LICENSE_avahi-daemon = "LGPLv2.1+"
> @@ -46,7 +137,7 @@ FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
>                          ${sysconfdir}/init.d/avahi-dnsconfd"
>  FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
>  FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*  ${libdir}/girepository-1.0/Avahi*.typelib"
> -FILES_avahi-utils = "${bindir}/avahi-*"
> +FILES_avahi-utils = "${bindir}/avahi-* ${bindir}/b* ${datadir}/applications/b*"
>
>  RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV})"
>  RDEPENDS_${PN}-dev += "${@["", " libavahi-client (= ${EXTENDPKGV})"][bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, d)]}"
> @@ -89,3 +180,4 @@ if [ -z "$D" ]; then
>         killall -q -HUP dbus-daemon || true
>  fi
>  }
> +
> --
> 2.26.1
>
> 
