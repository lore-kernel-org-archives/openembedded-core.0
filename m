Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U8BHl-0005ni-Fj
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 16:08:41 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 20 Feb 2013 15:52:30 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 0FF9F2831B8;
	Wed, 20 Feb 2013 15:52:30 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 15:52:03 +0100
Message-ID: <1361371923-11971-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <CAC1BbcQ5dY8G5qsu6LSx2J9MdW8ePqE7eFhf7g0LoxRS726qKA@mail.gmail.com>
References: <CAC1BbcQ5dY8G5qsu6LSx2J9MdW8ePqE7eFhf7g0LoxRS726qKA@mail.gmail.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: Daniel Dai <daniel.dai@enea.com>
Subject: [PATCH 1/8 v2] busybox: Add ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 15:08:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Daniel Dai <daniel.dai@enea.com>


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-core/busybox/busybox.inc       |    2 +-
 meta/recipes-core/busybox/busybox_1.20.2.bb |   10 ++++++++++
 meta/recipes-core/busybox/files/run-ptest   |    7 +++++++
 3 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/run-ptest

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index fc6ca91..85851dd 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -37,7 +37,7 @@ CONFFILES_${PN}-mdev =3D "${sysconfdir}/mdev.conf"
=20
 RRECOMMENDS_${PN} =3D "${PN}-syslog ${PN}-udhcpc"
=20
-inherit cml1 update-rc.d
+inherit cml1 update-rc.d ptest
=20
 # internal helper
 def busybox_cfg(feature, features, tokens, cnf, rem):
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-cor=
e/busybox/busybox_1.20.2.bb
index 783261e..b2e5d47 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -28,9 +28,19 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-${=
PV}.tar.bz2;name=3Dtarball \
            file://fix-for-spurious-testsuite-failure.patch \
            file://busybox-1.20.2-kernel_ver.patch \
            file://stat-usr-bin.patch \
+           file://run-ptest \
            file://testsuite-du-du-k-works-fix-false-positive.patch"
=20
 SRC_URI[tarball.md5sum] =3D "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] =3D "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583=
bd545d8789d27cf39b6882"
=20
 EXTRA_OEMAKE +=3D "V=3D1 ARCH=3D${TARGET_ARCH} CROSS_COMPILE=3D${TARGET_PR=
EFIX} SKIP_STRIP=3Dy"
+
+do_install_append () {
+    if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+        ptest_do_install
+        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
+        cp ${B}/.config      ${D}${PTEST_PATH}/
+        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+    fi
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
1.7.5.4



