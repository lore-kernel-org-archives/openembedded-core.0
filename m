Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web09.54.1619718038836489287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 10:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from misaki.sumomo.pri (unknown [IPv6:2001:470:b30d:2:c404:15ff:0:d19])
	by kozue.soulik.info (Postfix) with ESMTPA id BBA49100BE2;
	Fri, 30 Apr 2021 02:40:26 +0900 (JST)
From: "Randy Li" <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	jpewhacker@gmail.com,
	ayaka <ayaka@soulik.info>
Subject: [PATCH v4] seatd: add seatd recipe
Date: Fri, 30 Apr 2021 01:40:27 +0800
Message-Id: <20210429174028.58294-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Seat management takes care of mediating access to shared
devices (graphics, input), without requiring the applications
needing access to be root.

Signed-off-by: ayaka <ayaka@soulik.info>
---
 meta/recipes-core/seatd/libseat/init     | 50 ++++++++++++++++++++++++
 meta/recipes-core/seatd/libseat_0.5.0.bb | 42 ++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-core/seatd/libseat/init
 create mode 100644 meta/recipes-core/seatd/libseat_0.5.0.bb

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
index 0000000000..fb637d5ca7
--- /dev/null
+++ b/meta/recipes-core/seatd/libseat_0.5.0.bb
@@ -0,0 +1,42 @@
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
+SRCREV =3D "355cc9c944a29d29736de84e782a2e91168f1a59"
+SRCBRANCH =3D "master"
+SRC_URI =3D "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttp;branch=
=3D${SRCBRANCH} \
+           file://init"
+
+S =3D "${WORKDIR}/git"
+
+inherit pkgconfig meson useradd update-rc.d
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager'=
, 'systemd', 'systemd', 'seatd', d)}"
+
+PACKAGECONFIG[seatd] =3D "-Dseatd=3Denabled -Dserver=3Denabled, -Dseatd=3D=
disabled -Dserver=3Ddisabled"
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

