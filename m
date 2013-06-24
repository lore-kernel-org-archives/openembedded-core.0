Return-Path: <Bjoern.Stenberg@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 0FD756A8CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 14:52:23 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 24 Jun 2013 16:52:21 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 9D64A28838E;
	Mon, 24 Jun 2013 16:52:21 +0200 (CEST)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 16:52:21 +0200
Message-ID: <1372085541-6480-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH] busybox: Add ptest
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
X-List-Received-Date: Mon, 24 Jun 2013 14:52:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Install busybox test suite and run it as ptest.

Signed-off-by: Anders Roxell <anders.roxell@enea.com>
Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-core/busybox/busybox.inc       |    2 +-
 meta/recipes-core/busybox/busybox_1.20.2.bb |    7 +++++++
 meta/recipes-core/busybox/files/run-ptest   |    7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/files/run-ptest

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index c8908b0..4963912 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -41,7 +41,7 @@ CONFFILES_${PN}-mdev =3D "${sysconfdir}/mdev.conf"
=20
 RRECOMMENDS_${PN} =3D "${PN}-syslog ${PN}-udhcpc"
=20
-inherit cml1 systemd update-rc.d
+inherit cml1 systemd update-rc.d ptest
=20
 # internal helper
 def busybox_cfg(feature, features, tokens, cnf, rem):
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-cor=
e/busybox/busybox_1.20.2.bb
index 07d722d..9336671 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -34,6 +34,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \
            file://strict-atime.patch \
            file://fail_on_no_media.patch \
            file://busybox-sulogin-empty-root-password.patch \
+           file://run-ptest \
            file://inetd.conf \
            file://inetd"
=20
@@ -41,3 +42,9 @@ SRC_URI[tarball.md5sum] =3D "e025414bc6cd79579cc7a32a45d3=
ae1c"
 SRC_URI[tarball.sha256sum] =3D "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583=
bd545d8789d27cf39b6882"
=20
 EXTRA_OEMAKE +=3D "V=3D1 ARCH=3D${TARGET_ARCH} CROSS_COMPILE=3D${TARGET_PR=
EFIX} SKIP_STRIP=3Dy"
+
+do_install_ptest () {
+        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
+        cp ${B}/.config      ${D}${PTEST_PATH}/
+        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+}
diff --git a/meta/recipes-core/busybox/files/run-ptest b/meta/recipes-core/=
busybox/files/run-ptest
new file mode 100644
index 0000000..3608a8e
--- /dev/null
+++ b/meta/recipes-core/busybox/files/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+current_dir=3D$(readlink -f $0)
+export bindir=3D$(dirname $current_dir)
+
+cd testsuite || exit 1
+./runtest -v | sed -r 's/^(SKIPPED|UNTESTED):/SKIP:/'
--=20
1.7.10.4


