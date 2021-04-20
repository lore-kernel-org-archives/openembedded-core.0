Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web12.36.1618935792718619069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 09:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from misaki.sumomo.pri (unknown [IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id 19E85100788;
	Wed, 21 Apr 2021 01:23:06 +0900 (JST)
From: "Randy Li" <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	contact@emersion.fr,
	kl@kl.wtf,
	ayaka <ayaka@soulik.info>
Subject: [PATCH v2] seatd: add seatd recipe
Date: Wed, 21 Apr 2021 00:22:59 +0800
Message-Id: <20210420162259.179433-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: ayaka <ayaka@soulik.info>

Weston would adapt the libseat for granting privilege and VT switch.
wlroots has merged it.

Signed-off-by: ayaka <ayaka@soulik.info>
---
 .../nativesdk-packagegroup-sdk-host.bb        |  2 -
 ...build-fixup-standalone-without-seatd.patch | 71 +++++++++++++++++++
 meta/recipes-core/seatd/libseat/init          | 50 +++++++++++++
 meta/recipes-core/seatd/libseat_0.5.0.bb      | 43 +++++++++++
 4 files changed, 164 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/seatd/libseat/0001-build-fixup-stan=
dalone-without-seatd.patch
 create mode 100644 meta/recipes-core/seatd/libseat/init
 create mode 100644 meta/recipes-core/seatd/libseat_0.5.0.bb

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-h=
ost.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb
index ae989011f4..3e4e148c45 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -11,8 +11,6 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
=20
 RDEPENDS_${PN} =3D "\
     nativesdk-pkgconfig \
-    nativesdk-qemu \
-    nativesdk-qemu-helper \
     nativesdk-pseudo \
     nativesdk-unfs3 \
     nativesdk-opkg \
diff --git a/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-=
without-seatd.patch b/meta/recipes-core/seatd/libseat/0001-build-fixup-st=
andalone-without-seatd.patch
new file mode 100644
index 0000000000..66e1ac73ab
--- /dev/null
+++ b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without=
-seatd.patch
@@ -0,0 +1,71 @@
+From 084df8ab271ce4b09c1ef5d9c5a859b2d02d20e7 Mon Sep 17 00:00:00 2001
+From: ayaka <ayaka@soulik.info>
+Date: Mon, 19 Apr 2021 22:15:46 +0800
+Subject: [PATCH] build: fixup standalone without seatd
+
+I think that server option means the same thing as seatd, so I
+get rid of it.
+---
+ meson.build       | 10 +++++-----
+ meson_options.txt |  1 -
+ 2 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7a70cb6..a2166c5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -104,10 +104,11 @@ server_files =3D [
+=20
+ with_seatd =3D get_option('seatd') =3D=3D 'enabled'
+ with_builtin =3D get_option('builtin') =3D=3D 'enabled'
+-with_server =3D get_option('server') =3D=3D 'enabled'
+=20
+-if with_seatd
++if with_seatd or with_builtin
+ 	private_files +=3D 'libseat/backend/seatd.c'
++endif
++if with_seatd
+ 	add_project_arguments('-DSEATD_ENABLED=3D1', language: 'c')
+ endif
+=20
+@@ -189,7 +190,7 @@ libseat =3D declare_dependency(
+ 	variables: libseat_vars,
+ )
+=20
+-if with_server
++if with_seatd
+ 	executable(
+ 		'seatd',
+ 		[ server_files, 'seatd/seatd.c' ],
+@@ -221,7 +222,7 @@ foreach name, value : tests
+ 		include_directories: [include_directories('.', 'include')]))
+ endforeach
+=20
+-if with_server
++if with_seatd
+ 	scdoc =3D dependency('scdoc', required: get_option('man-pages'), versi=
on: '>=3D 1.9.7', native: true)
+ else
+ 	scdoc =3D disabler()
+@@ -252,7 +253,6 @@ endif
+ summary({
+ 	'seatd': with_seatd,
+ 	'builtin': with_builtin,
+-	'server': with_server,
+ 	'systemd': logind.found() and logind_provider =3D=3D 'systemd',
+ 	'elogind': logind.found() and logind_provider =3D=3D 'elogind',
+ }, bool_yn: true)
+diff --git a/meson_options.txt b/meson_options.txt
+index 144ce7a..c61d473 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,7 +1,6 @@
+ option('logind', type: 'combo', choices: ['auto', 'disabled', 'elogind'=
, 'systemd'], value: 'auto', description: 'logind support')
+ option('seatd', type: 'combo', choices: ['enabled', 'disabled'], value:=
 'enabled', description: 'seatd support')
+ option('builtin', type: 'combo', choices: ['enabled', 'disabled'], valu=
e: 'disabled', description: 'builtin seatd server')
+-option('server', type: 'combo', choices: ['enabled', 'disabled'], value=
: 'enabled', description: 'seatd server')
+ option('examples', type: 'combo', choices: ['enabled', 'disabled'], val=
ue: 'disabled', description: 'libseat example programs')
+ option('man-pages', type: 'feature', value: 'auto', description: 'Gener=
ate and install man pages')
+ option('defaultpath', type: 'string', value: '', description: 'Default =
location for seatd socket (empty for default)')
+--=20
+2.30.2
+
diff --git a/meta/recipes-core/seatd/libseat/init b/meta/recipes-core/sea=
td/libseat/init
new file mode 100644
index 0000000000..8c9d77255d
--- /dev/null
+++ b/meta/recipes-core/seatd/libseat/init
@@ -0,0 +1,50 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides:          seatd
+# Short-Description: Start seat management daemon
+# Required-Start:    $local_fs $remote_fs
+# Required-Stop:     $local_fs $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+### END INIT INFO
+
+PATH=3D/bin:/usr/bin:/sbin:/usr/sbin
+
+test -x /usr/bin/seatd || exit 0
+
+# For configuration of the init script use the file
+# /etc/default/seatd, do not edit this init script.
+
+seatd_group=3D"seatd"
+
+[ -e /etc/default/seatd ] && . /etc/default/seatd
+
+NAME=3Dseatd
+DAEMON=3D/usr/bin/seatd
+STOP_RETRY_SCHEDULE=3D'TERM/10/forever/KILL/1'
+
+. /etc/init.d/functions
+
+case "$1" in
+  start)
+    start-stop-daemon --start --backgroud --quiet --pidfile /var/run/$NA=
ME.pid \
+	    --exec $DAEMON -- -g $seatd_group
+    ;;
+
+  stop)
+    killproc $NAME
+    ;;
+
+  restart)
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|restart}"
+    exit 1
+
+esac
+
+exit 0
diff --git a/meta/recipes-core/seatd/libseat_0.5.0.bb b/meta/recipes-core=
/seatd/libseat_0.5.0.bb
new file mode 100644
index 0000000000..8067d32a26
--- /dev/null
+++ b/meta/recipes-core/seatd/libseat_0.5.0.bb
@@ -0,0 +1,43 @@
+SUMMARY =3D "Seat management daemon and library"
+HOMEPAGE =3D "https://git.sr.ht/~kennylevinsen/seatd"
+SECTION =3D "base"
+
+DESCRIPTION =3D "A minimal seat management daemon, and a universal seat =
management \
+library. Seat management takes care of mediating access to shared device=
s \
+(graphics, input), without requiring the applications needing access to =
be root."
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;beginline=3D3;md5=3D6a01e8ccc65bea4=
e8bfa79b09ea1444c"
+
+SRCREV =3D "5535c2c3b19b42ebfe4c451600059e9418e401a6"
+SRCBRANCH =3D "master"
+SRC_URI =3D "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttp;branch=
=3D${SRCBRANCH} \
+           file://0001-build-fixup-standalone-without-seatd.patch \
+           file://init"
+
+S =3D "${WORKDIR}/git"
+
+inherit pkgconfig meson useradd update-rc.d
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager'=
, 'systemd', 'systemd', 'seatd', d)}"
+
+PACKAGECONFIG[seatd] =3D "-Dseatd=3Denabled, -Dseatd=3Ddisabled"
+PACKAGECONFIG[systemd] =3D "-Dlogind=3Dsystemd, -Dlogind=3Ddisabled, sys=
temd dbus"
+
+PACKAGES +=3D "seatd"
+
+FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
+FILES_seatd =3D "${bindir}/seatd ${sysconfdir}"
+
+do_install_append() {
+	if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
+		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/seatd
+	fi
+}
+
+INITSCRIPT_NAME =3D "seatd"
+INITSCRIPT_PARAMS =3D "start 8 5 2 . stop 21 0 1 6 ."
+
+USERADD_PACKAGES =3D "seatd"
+
+GROUPADD_PARAM_seatd =3D "-r seatd"
--=20
2.30.2

