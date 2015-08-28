Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id B351A76DE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 03:54:20 +0000 (UTC)
Received: by iodt126 with SMTP id t126so80469161iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 20:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=5O2M0ct6NjBjvCHSbVk8AwjxQAyZBHo3NoIsoZ4qpvw=;
	b=Aa4reEMZ0l3pWoPDXkWunOi8CC17dCaoBxZh01+4J6op+V0qzC74l4VpEtCAN/s7ll
	p1bSn/VahJmYINonHnUF15kVpf7RXj6FJQsBAt44GSm5MZwRNu0+En10u+BoHijfGClZ
	E43Xqk6KjDYlgN0sQVXdAwpdalMEFq68nKr0V9cMy9Jb+iClJDx0BQMKL6FRxBF+zLkn
	eiLV9yJycEiagSbxa+EdPJ+Kk04Puzy9re04oPwoFy7NGbG+MHtAwVJJ4TeNm2A/yDKO
	uIkJTAGgpMEtgTcW9WbXZs5XZ9Xg/z8YG6UwsFMzAKF9MnWiyYShVgzIzSZTh+/MWooU
	DtTw==
X-Received: by 10.107.168.214 with SMTP id e83mr11949008ioj.112.1440734060375; 
	Thu, 27 Aug 2015 20:54:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Thu, 27 Aug 2015 20:53:50 -0700 (PDT)
In-Reply-To: <1440666743-12035-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1440666743-12035-1-git-send-email-andrew.shadura@collabora.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 20:53:50 -0700
Message-ID: <CAMKF1so6_ftdkbU5afVrGdnZA9LRDLhktNTgcdnZw2iqrYwSnQ@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] dbus: merge .bb and .inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Aug 2015 03:54:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 2:12 AM, Andrew Shadura
<andrew.shadura@collabora.co.uk> wrote:
> The split is no longer necessary, and only makes it more complicated to
> do changes in external layers.
>
> Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
> ---
>  meta/recipes-core/dbus/dbus.inc       | 170 ----------------------------=
-----
>  meta/recipes-core/dbus/dbus_1.8.20.bb | 171 ++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 170 insertions(+), 171 deletions(-)
>  delete mode 100644 meta/recipes-core/dbus/dbus.inc

can you send patch generated with -M 1

>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbu=
s.inc
> deleted file mode 100644
> index 3971081..0000000
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ /dev/null
> @@ -1,170 +0,0 @@
> -SUMMARY =3D "D-Bus message bus"
> -DESCRIPTION =3D "D-Bus is a message bus system, a simple way for applica=
tions to talk to one another. In addition to interprocess communication, D-=
Bus helps coordinate process lifecycle; it makes it simple and reliable to =
code a \"single instance\" application or daemon, and to launch application=
s and daemons on demand when their services are needed."
> -HOMEPAGE =3D "http://dbus.freedesktop.org"
> -SECTION =3D "base"
> -LICENSE =3D "AFL-2 | GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10dded3b58148f3f1fd804b26354a=
f3e \
> -                    file://dbus/dbus.h;beginline=3D6;endline=3D20;md5=3D=
7755c9d7abccd5dbd25a6a974538bb3c"
> -DEPENDS =3D "expat virtual/libintl"
> -RDEPENDS_dbus_class-native =3D ""
> -RDEPENDS_dbus_class-nativesdk =3D ""
> -PACKAGES +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-p=
test', '', d)}"
> -ALLOW_EMPTY_dbus-ptest =3D "1"
> -RDEPENDS_dbus-ptest_class-target =3D "dbus-test-ptest"
> -
> -SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz=
 \
> -           file://tmpdir.patch \
> -           file://dbus-1.init \
> -           file://os-test.patch \
> -           file://clear-guid_from_server-if-send_negotiate_unix_f.patch =
\
> -"
> -
> -inherit useradd autotools pkgconfig gettext update-rc.d
> -
> -INITSCRIPT_NAME =3D "dbus-1"
> -INITSCRIPT_PARAMS =3D "start 02 5 3 2 . stop 20 0 1 6 ."
> -
> -python __anonymous() {
> -    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,=
 d):
> -        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> -}
> -
> -USERADD_PACKAGES =3D "${PN}"
> -GROUPADD_PARAM_${PN} =3D "-r netdev"
> -USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/lib/dbus \
> -                       --no-create-home --shell /bin/false \
> -                       --user-group messagebus"
> -
> -CONFFILES_${PN} =3D "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus=
-1/session.conf"
> -
> -DEBIANNAME_${PN} =3D "dbus-1"
> -
> -PACKAGES =3D+ "${PN}-lib"
> -
> -OLDPKGNAME =3D "dbus-x11"
> -OLDPKGNAME_class-nativesdk =3D ""
> -
> -# for compatibility
> -RPROVIDES_${PN} =3D "${OLDPKGNAME}"
> -RREPLACES_${PN} +=3D "${OLDPKGNAME}"
> -
> -FILES_${PN} =3D "${bindir}/dbus-daemon* \
> -               ${bindir}/dbus-uuidgen \
> -               ${bindir}/dbus-cleanup-sockets \
> -               ${bindir}/dbus-send \
> -               ${bindir}/dbus-monitor \
> -               ${bindir}/dbus-launch \
> -               ${bindir}/dbus-run-session \
> -               ${libexecdir}/dbus* \
> -               ${sysconfdir} \
> -               ${localstatedir} \
> -               ${datadir}/dbus-1/services \
> -               ${datadir}/dbus-1/system-services \
> -               ${systemd_unitdir}/system/"
> -FILES_${PN}-lib =3D "${libdir}/lib*.so.*"
> -RRECOMMENDS_${PN}-lib =3D "${PN}"
> -FILES_${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-too=
l"
> -
> -pkg_postinst_dbus() {
> -       # If both systemd and sysvinit are enabled, mask the dbus-1 init =
script
> -        if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','tr=
ue','false',d)}; then
> -               if [ -n "$D" ]; then
> -                       OPTS=3D"--root=3D$D"
> -               fi
> -               systemctl $OPTS mask dbus-1.service
> -       fi
> -
> -       if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> -               /etc/init.d/populate-volatile.sh update
> -       fi
> -}
> -
> -EXTRA_OECONF =3D "--disable-tests \
> -                --disable-xml-docs \
> -                --disable-doxygen-docs \
> -                --disable-libaudit \
> -                --disable-systemd \
> -                --without-dbus-glib"
> -
> -EXTRA_OECONF_append_class-native =3D " --disable-selinux"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',=
 '', d)}"
> -PACKAGECONFIG_class-native =3D ""
> -PACKAGECONFIG_class-nativesdk =3D ""
> -
> -# Would like to --enable-systemd but that's a circular build-dependency =
between
> -# systemd<->dbus
> -PACKAGECONFIG[systemd] =3D "--with-systemdsystemunitdir=3D${systemd_unit=
dir}/system/,--without-systemdsystemunitdir"
> -PACKAGECONFIG[x11] =3D "--with-x --enable-x11-autolaunch,--without-x --d=
isable-x11-autolaunch, virtual/libx11 libsm"
> -
> -do_install() {
> -       autotools_do_install
> -
> -       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'f=
alse', d)}; then
> -               install -d ${D}${sysconfdir}/init.d
> -               sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${W=
ORKDIR}/dbus-1.init.sh
> -               install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdi=
r}/init.d/dbus-1
> -       fi
> -
> -       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}; then
> -               for i in dbus.target.wants sockets.target.wants multi-use=
r.target.wants; do \
> -                       install -d ${D}${systemd_unitdir}/system/$i; done
> -               install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socke=
t ${D}${systemd_unitdir}/system/
> -               cd ${D}${systemd_unitdir}/system/dbus.target.wants/
> -               ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/dbus.=
target.wants/dbus.socket
> -               ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/socke=
ts.target.wants/dbus.socket
> -               ln -fs ../dbus.service ${D}${systemd_unitdir}/system/mult=
i-user.target.wants/dbus.service
> -       fi
> -
> -       install -d ${D}${sysconfdir}/default/volatiles
> -       echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none=
" \
> -            > ${D}${sysconfdir}/default/volatiles/99_dbus
> -
> -
> -       mkdir -p ${D}${localstatedir}/lib/dbus
> -
> -       chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
> -
> -       chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> -       chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
> -
> -       # Remove Red Hat initscript
> -       rm -rf ${D}${sysconfdir}/rc.d
> -
> -       # Remove empty testexec directory as we don't build tests
> -       rm -rf ${D}${libdir}/dbus-1.0/test
> -
> -       # Remove /var/run as it is created on startup
> -       rm -rf ${D}${localstatedir}/run
> -}
> -
> -do_install_class-native() {
> -       autotools_do_install
> -
> -       # for dbus-glib-native introspection generation
> -       install -d ${D}${STAGING_DATADIR_NATIVE}/dbus/
> -       # N.B. is below install actually required?
> -       install -m 0644 bus/session.conf ${D}${STAGING_DATADIR_NATIVE}/db=
us/session.conf
> -
> -       # dbus-glib-native and dbus-glib need this xml file
> -       ./bus/dbus-daemon --introspect > ${D}${STAGING_DATADIR_NATIVE}/db=
us/dbus-bus-introspect.xml
> -
> -       # dbus-launch has no X support so lets not install it in case the=
 host
> -       # has a more featured and useful version
> -       rm -f ${D}${bindir}/dbus-launch
> -}
> -
> -do_install_class-nativesdk() {
> -       autotools_do_install
> -
> -       # dbus-launch has no X support so lets not install it in case the=
 host
> -       # has a more featured and useful version
> -       rm -f ${D}${bindir}/dbus-launch
> -
> -       # Remove /var/run to avoid QA error
> -       rm -rf ${D}${localstatedir}/run
> -}
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -INSANE_SKIP_${PN}-ptest +=3D "build-deps"
> diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb b/meta/recipes-core/db=
us/dbus_1.8.20.bb
> index a8f2094..207a018 100644
> --- a/meta/recipes-core/dbus/dbus_1.8.20.bb
> +++ b/meta/recipes-core/dbus/dbus_1.8.20.bb
> @@ -1,4 +1,173 @@
> -include dbus.inc
> +SUMMARY =3D "D-Bus message bus"
> +DESCRIPTION =3D "D-Bus is a message bus system, a simple way for applica=
tions to talk to one another. In addition to interprocess communication, D-=
Bus helps coordinate process lifecycle; it makes it simple and reliable to =
code a \"single instance\" application or daemon, and to launch application=
s and daemons on demand when their services are needed."
> +HOMEPAGE =3D "http://dbus.freedesktop.org"
> +SECTION =3D "base"
> +LICENSE =3D "AFL-2 | GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10dded3b58148f3f1fd804b26354a=
f3e \
> +                    file://dbus/dbus.h;beginline=3D6;endline=3D20;md5=3D=
7755c9d7abccd5dbd25a6a974538bb3c"
> +DEPENDS =3D "expat virtual/libintl"
> +RDEPENDS_dbus_class-native =3D ""
> +RDEPENDS_dbus_class-nativesdk =3D ""
> +PACKAGES +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-p=
test', '', d)}"
> +ALLOW_EMPTY_dbus-ptest =3D "1"
> +RDEPENDS_dbus-ptest_class-target =3D "dbus-test-ptest"
> +
> +SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz=
 \
> +           file://tmpdir.patch \
> +           file://dbus-1.init \
> +           file://os-test.patch \
> +           file://clear-guid_from_server-if-send_negotiate_unix_f.patch =
\
> +"
>
>  SRC_URI[md5sum] =3D "b49890bbabedab3a1c3f4f73c7ff8b2b"
>  SRC_URI[sha256sum] =3D "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c461=
2a469d924b1b703a"
> +
> +inherit useradd autotools pkgconfig gettext update-rc.d
> +
> +INITSCRIPT_NAME =3D "dbus-1"
> +INITSCRIPT_PARAMS =3D "start 02 5 3 2 . stop 20 0 1 6 ."
> +
> +python __anonymous() {
> +    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,=
 d):
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}
> +
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM_${PN} =3D "-r netdev"
> +USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/lib/dbus \
> +                       --no-create-home --shell /bin/false \
> +                       --user-group messagebus"
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus=
-1/session.conf"
> +
> +DEBIANNAME_${PN} =3D "dbus-1"
> +
> +PACKAGES =3D+ "${PN}-lib"
> +
> +OLDPKGNAME =3D "dbus-x11"
> +OLDPKGNAME_class-nativesdk =3D ""
> +
> +# for compatibility
> +RPROVIDES_${PN} =3D "${OLDPKGNAME}"
> +RREPLACES_${PN} +=3D "${OLDPKGNAME}"
> +
> +FILES_${PN} =3D "${bindir}/dbus-daemon* \
> +               ${bindir}/dbus-uuidgen \
> +               ${bindir}/dbus-cleanup-sockets \
> +               ${bindir}/dbus-send \
> +               ${bindir}/dbus-monitor \
> +               ${bindir}/dbus-launch \
> +               ${bindir}/dbus-run-session \
> +               ${libexecdir}/dbus* \
> +               ${sysconfdir} \
> +               ${localstatedir} \
> +               ${datadir}/dbus-1/services \
> +               ${datadir}/dbus-1/system-services \
> +               ${systemd_unitdir}/system/"
> +FILES_${PN}-lib =3D "${libdir}/lib*.so.*"
> +RRECOMMENDS_${PN}-lib =3D "${PN}"
> +FILES_${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-too=
l"
> +
> +pkg_postinst_dbus() {
> +       # If both systemd and sysvinit are enabled, mask the dbus-1 init =
script
> +        if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','tr=
ue','false',d)}; then
> +               if [ -n "$D" ]; then
> +                       OPTS=3D"--root=3D$D"
> +               fi
> +               systemctl $OPTS mask dbus-1.service
> +       fi
> +
> +       if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> +               /etc/init.d/populate-volatile.sh update
> +       fi
> +}
> +
> +EXTRA_OECONF =3D "--disable-tests \
> +                --disable-xml-docs \
> +                --disable-doxygen-docs \
> +                --disable-libaudit \
> +                --disable-systemd \
> +                --without-dbus-glib"
> +
> +EXTRA_OECONF_append_class-native =3D " --disable-selinux"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',=
 '', d)}"
> +PACKAGECONFIG_class-native =3D ""
> +PACKAGECONFIG_class-nativesdk =3D ""
> +
> +# Would like to --enable-systemd but that's a circular build-dependency =
between
> +# systemd<->dbus
> +PACKAGECONFIG[systemd] =3D "--with-systemdsystemunitdir=3D${systemd_unit=
dir}/system/,--without-systemdsystemunitdir"
> +PACKAGECONFIG[x11] =3D "--with-x --enable-x11-autolaunch,--without-x --d=
isable-x11-autolaunch, virtual/libx11 libsm"
> +
> +do_install() {
> +       autotools_do_install
> +
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'f=
alse', d)}; then
> +               install -d ${D}${sysconfdir}/init.d
> +               sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${W=
ORKDIR}/dbus-1.init.sh
> +               install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdi=
r}/init.d/dbus-1
> +       fi
> +
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}; then
> +               for i in dbus.target.wants sockets.target.wants multi-use=
r.target.wants; do \
> +                       install -d ${D}${systemd_unitdir}/system/$i; done
> +               install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socke=
t ${D}${systemd_unitdir}/system/
> +               cd ${D}${systemd_unitdir}/system/dbus.target.wants/
> +               ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/dbus.=
target.wants/dbus.socket
> +               ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/socke=
ts.target.wants/dbus.socket
> +               ln -fs ../dbus.service ${D}${systemd_unitdir}/system/mult=
i-user.target.wants/dbus.service
> +       fi
> +
> +       install -d ${D}${sysconfdir}/default/volatiles
> +       echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none=
" \
> +            > ${D}${sysconfdir}/default/volatiles/99_dbus
> +
> +
> +       mkdir -p ${D}${localstatedir}/lib/dbus
> +
> +       chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
> +
> +       chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> +       chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
> +
> +       # Remove Red Hat initscript
> +       rm -rf ${D}${sysconfdir}/rc.d
> +
> +       # Remove empty testexec directory as we don't build tests
> +       rm -rf ${D}${libdir}/dbus-1.0/test
> +
> +       # Remove /var/run as it is created on startup
> +       rm -rf ${D}${localstatedir}/run
> +}
> +
> +do_install_class-native() {
> +       autotools_do_install
> +
> +       # for dbus-glib-native introspection generation
> +       install -d ${D}${STAGING_DATADIR_NATIVE}/dbus/
> +       # N.B. is below install actually required?
> +       install -m 0644 bus/session.conf ${D}${STAGING_DATADIR_NATIVE}/db=
us/session.conf
> +
> +       # dbus-glib-native and dbus-glib need this xml file
> +       ./bus/dbus-daemon --introspect > ${D}${STAGING_DATADIR_NATIVE}/db=
us/dbus-bus-introspect.xml
> +
> +       # dbus-launch has no X support so lets not install it in case the=
 host
> +       # has a more featured and useful version
> +       rm -f ${D}${bindir}/dbus-launch
> +}
> +
> +do_install_class-nativesdk() {
> +       autotools_do_install
> +
> +       # dbus-launch has no X support so lets not install it in case the=
 host
> +       # has a more featured and useful version
> +       rm -f ${D}${bindir}/dbus-launch
> +
> +       # Remove /var/run to avoid QA error
> +       rm -rf ${D}${localstatedir}/run
> +}
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +INSANE_SKIP_${PN}-ptest +=3D "build-deps"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

