Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TbCNt-0002EI-7s
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 16:38:41 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 21 Nov 2012 16:23:32 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id AF599291438;
	Wed, 21 Nov 2012 16:23:32 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2012 16:23:09 +0100
Message-ID: <1353511391-60570-3-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1353511391-60570-1-git-send-email-bjst@enea.com>
References: <1353511391-60570-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 2/4] New recipe: ptest-runner
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
X-List-Received-Date: Wed, 21 Nov 2012 15:38:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This recipe installs a simple shell script which searches for all installed
ptests on the rootfs and runs each test in sequence.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/conf/bitbake.conf                             |    2 +-
 .../ptest-runner/files/ptest-runner                |   16 ++++++++++++++++
 .../ptest-runner/ptest-runner_1.0.bb               |   17 ++++++++++++++++=
+
 3 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/ptest-runner/files/ptest-runner
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 783ca37..64014d3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -225,7 +225,7 @@ This package contains ELF symbols and related sources f=
or debugging purposes."
=20
 SUMMARY_${PN}-ptest ?=3D "${SUMMARY} - Package test files"
 DESCRIPTION_${PN}-ptest ?=3D "${DESCRIPTION}  \
-This package contains test directory with the name ${PTEST_NAME} for packa=
ge test purposes."
+This package contains a test directory ${PTEST_PATH} for package test purp=
oses."
=20
 SUMMARY_${PN}-dev ?=3D "${SUMMARY} - Development files"
 DESCRIPTION_${PN}-dev ?=3D "${DESCRIPTION}  \
diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/re=
cipes-support/ptest-runner/files/ptest-runner
new file mode 100644
index 0000000..4f3c7ce
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+echo "START: $0"
+cd /usr/lib
+for x in *
+do
+    if [ -x "/usr/lib/$x/ptest/run-ptest" ]; then
+       date "+%Y-%m-%dT%H:%M"
+        echo "BEGIN: $x"
+        cd /usr/lib/$x/ptest
+        ./run-ptest
+        echo "END: $x"
+       date "+%Y-%m-%dT%H:%M"
+    fi
+done
+echo "STOP: $0"
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb b/meta/r=
ecipes-support/ptest-runner/ptest-runner_1.0.bb
new file mode 100644
index 0000000..6b866d4
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb
@@ -0,0 +1,17 @@
+SRC_URI +=3D "file://ptest-runner"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285e=
c7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788=
c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+do_install () {
+    mkdir -p ${D}${bindir}
+    install -m 0755 ${WORKDIR}/ptest-runner ${D}${bindir}
+}
+
+do_patch[noexec] =3D "1"
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+do_build[noexec] =3D "1"
--=20
1.7.5.4



