Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1T2MNr-0005gS-SG
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:14:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7HD2fQ8023471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 06:02:41 -0700 (PDT)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 17 Aug 2012 06:02:40 -0700
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 16:02:30 +0300
Message-ID: <fe8f0c9d64b8fb123545d8afcd7891c6d6d90728.1345208249.git.andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1345208249.git.andrei.gherzan@windriver.com>
References: <cover.1345208249.git.andrei.gherzan@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 2/2] dbus-tests: Add separate recipe for building dbus-tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 13:14:40 -0000
Content-Type: text/plain

While compiling dbus with tests, dbus and dbus-glib are needed.
To compile dbus-glib, dbus is needed (obviously). The only solution
(to compile dbus with tests) is to create a new recipe where to
compile dbus with --enable-tests --enable-embedded-tests, skip write
to sysroot (noexec) and just package dbus-tests.
A bash wrapper to run all tests is included.

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 meta/recipes-core/dbus/dbus-tests/run_test.sh |   22 +++++++++
 meta/recipes-core/dbus/dbus-tests_1.4.20.bb   |   64 +++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-core/dbus/dbus-tests/run_test.sh
 create mode 100644 meta/recipes-core/dbus/dbus-tests_1.4.20.bb

diff --git a/meta/recipes-core/dbus/dbus-tests/run_test.sh b/meta/recipes-core/dbus/dbus-tests/run_test.sh
new file mode 100755
index 0000000..90abad2
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-tests/run_test.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+# Tests location
+export DBUS_TEST_HOMEDIR=/usr/lib/dbus-tests
+# Tests data location
+export DBUS_TEST_DATA=${DBUS_TEST_HOMEDIR}/test/data
+
+TESTS=" \
+	bus/bus-test \
+	bus/bus-test-system \
+	dbus/dbus-test \
+	bus/bus-test-launch-helper \
+	test/shell-test \
+	test/test-corrupt \
+	test/test-dbus-daemon \
+	test/test-loopback \
+	test/test-marshal \
+	test/test-relay \
+	test/test-syslog \
+	test/test-refs"
+
+${DBUS_TEST_HOMEDIR}/test/dbus-test-runner ${DBUS_TEST_HOMEDIR} ${TESTS}
diff --git a/meta/recipes-core/dbus/dbus-tests_1.4.20.bb b/meta/recipes-core/dbus/dbus-tests_1.4.20.bb
new file mode 100644
index 0000000..0e7d272
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-tests_1.4.20.bb
@@ -0,0 +1,64 @@
+FILESEXTRAPATHS_append := "${THISDIR}/dbus-${PV}"
+include recipes-core/dbus/dbus.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "79eca2f2c1894ac347acce128314428b"
+SRC_URI[sha256sum] = "103bdcd261a13140730b5fa69f56a98ab5c89ba3f0116ea62fcfd639520d5aaf"
+
+DEPENDS += "python-pygobject-native python-dbus-native dbus-glib dbus"
+RDEPENDS_${PN} = "dbus-x11"
+RPROVIDES_${PN} = ""
+
+TEST_PATH = "${libdir}/${BPN}"
+
+EXTRA_OECONF += "--enable-tests --enable-embedded-tests --enable-verbose-mode --with-dbus-test-dir=${TEST_PATH}"
+
+export DBUS_GLIB_CFLAGS="-I${STAGING_DIR_HOST}${includedir}/dbus-1.0"
+export DBUS_GLIB_LIBS="-ldbus-glib-1"
+
+S = "${WORKDIR}/dbus-${PV}"
+
+# Add test wrapper
+SRC_URI += "file://run_test.sh"
+
+# We don't want to overwrite dbus in sysroot. Just want to package the tests
+do_populate_sysroot[noexec] = "1"
+
+PACKAGES = "${PN}-dbg ${PN}"
+
+FILES_${PN} = "${TEST_PATH}"
+FILES_${PN}-dbg = "${TEST_PATH}/bus/.debug \
+		   ${TEST_PATH}/dbus/.debug \
+		   ${TEST_PATH}/test/.debug \
+		   /usr/src/debug"
+
+BUS_TESTS = "bus-test bus-test-system bus-test-launch-helper dbus-daemon-launch-helper-test"
+DBUS_TESTS = "dbus-test"
+TEST = "dbus-test-runner spawn-test .libs/test-dbus-daemon .libs/test-loopback test-sleep-forever \
+	test-segfault shell-test test-exit .libs/test-marshal test-refs test-shell-service \
+	.libs/test-corrupt test-syslog test-names .libs/test-relay test-service"
+
+do_install () {
+	install -d ${D}/${TEST_PATH}/test/data
+	install -d ${D}/${TEST_PATH}/dbus
+	install -d ${D}/${TEST_PATH}/bus
+
+	cp -r ${S}/test/data/* ${D}/${TEST_PATH}/test/data
+
+	for file in ${BUS_TESTS}; do
+		install -m 766 ${S}/bus/${file} ${D}/${TEST_PATH}/bus
+	done
+
+	for file in ${DBUS_TESTS}; do
+		install -m 766 ${S}/dbus/${file} ${D}/${TEST_PATH}/dbus
+	done
+
+	for file in ${TEST}; do
+		install -m 766 ${S}/test/${file} ${D}/${TEST_PATH}/test
+	done
+
+	install -m 766 ${WORKDIR}/run_test.sh ${D}/${TEST_PATH}
+}
+
+BBCLASSEXTEND = ""
-- 
1.7.5.4



