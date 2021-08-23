Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.25364.1629731366967455048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 08:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=SQeJXQ9S;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0DD2482D1C;
	Mon, 23 Aug 2021 17:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1629731364;
	bh=meIJNkeOBdQr3NxWXnRpTJFisy7uOERnyk7HMY4H2iU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQeJXQ9Scc6+xwRkBKoQNFfKD4L9NpafdYc6zzbVeVs4OGDAGa4nx6cWyvvkrUkjN
	 khbUos4F/NuUi3/A5EWgv2SG+eKJzr6FvVitmYq/nxINO1w73hjwpAJHMRSnO77UxQ
	 S4731f+84UJXX7naaC4l0IWyLuKkasT5lZy2nnHCIhDVGg/TDaMLzbqHgEZ9vtQVcj
	 6wWQa8+5MqgvwCH/OV4eJJiITgAapYBUjtni/CbI0aYsfNJbYPgSgD9iPV/4ENJnds
	 2n0gf+10W4CXkVWCUYexAALz7LZu7ZS6SIpUI6T/Oxc0MXattRtLFeKWYQSNNzRf8/
	 O60OL4H2jee/w==
From: "?ukasz Majewski" <lukma@denx.de>
To: poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Cc: Lukasz Majewski <lukma@denx.de>
Subject: [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
Date: Mon, 23 Aug 2021 17:08:53 +0200
Message-Id: <20210823150853.2817-2-lukma@denx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823150853.2817-1-lukma@denx.de>
References: <20210823150853.2817-1-lukma@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

This patch introduces new recipe - namely 'glibc-tests', which
builds and installs glibc test suite to OE/Yocto built image.

It reuses code from already available 'glibc-testsuite' recipe,
which is run with 'bitbake glibc-testsuite -c check' and uses qemu
to execute remotely (via SSH) tests on some emulated machine.

This recipe installs eligible tests on some rootfs image.
Afterwards, either all of them or only time related subset, those
tests can be executed on the real hardware, to facilitate validation
of this platform with for example Y2038 problem compliance.

By default all tests are executed, with 'ptest-runner glibc-tests'.
To test only time related subset - one needs to call:
cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \
ln -s run-ptest-time run-ptest; cd -; ptest-runner glibc-tests

To facilitate debugging, source files are provided by default with
the unstripped debugging symbols. Such approach would reduce the
already complex recipe (as it inherits base glibc one), so there
is no need to also install *-dbg and *-src packages.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 .../distro/include/ptest-packagelists.inc     |   1 +
 meta/recipes-core/glibc/glibc-tests_2.34.bb   | 101 ++++++++++++++++++
 meta/recipes-core/glibc/glibc/run-ptest-all   |  25 +++++
 meta/recipes-core/glibc/glibc/run-ptest-time  |  30 ++++++
 4 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
 create mode 100755 meta/recipes-core/glibc/glibc/run-ptest-all
 create mode 100755 meta/recipes-core/glibc/glibc/run-ptest-time

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 3872bdc942..e460ad1c8b 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -59,6 +59,7 @@ PTESTS_FAST =3D "\
     slang-ptest \
     wayland-ptest \
     zlib-ptest \
+    glibc-tests-ptest \
 "
 PTESTS_FAST:remove:mips64 =3D "qemu-ptest"
 PTESTS_PROBLEMS:append:mips64 =3D "qemu-ptest"
diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb b/meta/recipes-c=
ore/glibc/glibc-tests_2.34.bb
new file mode 100644
index 0000000000..896809f700
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
@@ -0,0 +1,101 @@
+require glibc_${PV}.bb
+require glibc-tests.inc
+
+inherit ptest
+
+SRC_URI:append =3D " \
+	file://run-ptest-all file://run-ptest-time \
+"
+
+SUMMARY =3D "glibc tests to be run with ptest"
+
+# Erase some variables already set by glibc_${PV}
+python __anonymous() {
+       # Remove packages provided by glibc build, we only need a subset =
of them
+       d.setVar("PACKAGES", "${PN}")
+
+       d.setVar("PROVIDES", "${PN}")
+       d.setVar("RPROVIDES", "${PN} glibc-ptest")
+
+       d.setVar("RRECOMMENDS", "")
+}
+
+# Remove any lefovers from original glibc recipe
+RPROVIDES:${PN} =3D "${PN}"
+RRECOMMENDS:${PN} =3D ""
+RDEPENDS:${PN} =3D "sed"
+
+# Just build tests for target - do not run them
+do_check:append () {
+	oe_runmake -i check run-built-tests=3Dno
+}
+addtask do_check after do_compile before do_install_ptest_base
+
+glibc_strip_build_directory () {
+	# Delete all non executable files from build directory
+	find ${B} ! -executable -type f -delete
+
+	# Remove build dynamic libraries and links to them as
+	# those are already installed in the target device
+	find ${B} -type f -name "*.so" -delete
+	find ${B} -type l -name "*.so*" -delete
+
+	# Remove headers (installed with glibc)
+	find ${B} -type f -name "*.h" -delete
+
+	find ${B} -type f -name "isomac" -delete
+	find ${B} -type f -name "annexc" -delete
+}
+
+do_install_ptest_base () {
+	glibc_strip_build_directory
+
+	# Install build test programs to the image
+	install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
+	cp -r ${B}/* ${D}${PTEST_PATH}/tests/glibc-ptest/
+
+	install -d ${D}${PTEST_PATH}
+	cp ${WORKDIR}/run-ptest-* ${D}${PTEST_PATH}/
+
+	# By default run all glibc tests
+	cd ${D}${PTEST_PATH}/
+	ln -s run-ptest-all run-ptest
+}
+
+# The datadir directory is required to allow core (and reused)
+# glibc cleanup function to finish correctly, as this directory
+# is not created for ptests
+stash_locale_package_cleanup:prepend () {
+	mkdir -p ${PKGD}${datadir}
+}
+
+stash_locale_sysroot_cleanup:prepend () {
+	mkdir -p ${SYSROOT_DESTDIR}${datadir}
+}
+
+# Prevent the do_package() task to set 'libc6' prefix
+# for glibc tests related packages
+python populate_packages:prepend () {
+    if d.getVar('DEBIAN_NAMES'):
+        d.setVar('DEBIAN_NAMES', '')
+}
+
+FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
+
+EXCLUDE_FROM_SHLIBS =3D "1"
+
+# Install debug data in .debug and sources in /usr/src/debug
+# It is more handy to have _all_ the sources and symbols in one
+# place (package) as this recipe will be used for validation and
+# debugging.
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug"
+
+# glibc test cases violate by default some Yocto/OE checks (staticdev,
+# textrel)
+# 'debug-files' - add everything (including debug) into one package
+#                 (no need to install/build *-src package)
+INSANE_SKIP:${PN} +=3D "staticdev textrel debug-files rpaths"
+
+deltask do_stash_locale
+do_install[noexec] =3D "1"
+do_populate_sysroot[noexec] =3D "1"
diff --git a/meta/recipes-core/glibc/glibc/run-ptest-all b/meta/recipes-c=
ore/glibc/glibc/run-ptest-all
new file mode 100755
index 0000000000..47bfe5238c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/run-ptest-all
@@ -0,0 +1,25 @@
+#!/bin/sh
+# ptest script for glibc - to run time related tests to
+# facilitate Y2038 validation
+# Run with 'ptest-runner glibc-tests'
+
+output() {
+  retcode=3D$?
+  if [ $retcode -eq 0 ]
+    then echo "PASS: $i"
+  elif [ $retcode -eq 77 ]
+    then echo "SKIP: $i"
+  else echo "FAIL: $i"
+  fi
+}
+
+# Allow altering time on the target
+export GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
+
+tst=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*)
+
+for i in ${tst}
+do
+	$i >/dev/null 2>&1
+	output
+done
diff --git a/meta/recipes-core/glibc/glibc/run-ptest-time b/meta/recipes-=
core/glibc/glibc/run-ptest-time
new file mode 100755
index 0000000000..24dedc6e32
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/run-ptest-time
@@ -0,0 +1,30 @@
+#!/bin/sh
+# ptest script for glibc - to run time related tests to
+# facilitate Y2038 validation
+# Run with 'ptest-runner glibc-tests'
+
+output() {
+  retcode=3D$?
+  if [ $retcode -eq 0 ]
+    then echo "PASS: $i"
+  elif [ $retcode -eq 77 ]
+    then echo "SKIP: $i"
+  else echo "FAIL: $i"
+  fi
+}
+
+# Allow altering time on the target
+export GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
+
+tst_time64=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*-time64)
+
+# Remove '-time64' suffix - those tests are also time
+# related
+tst_time_tmp=3D$(sed -e "s/-time64$//" <<< ${tst_time64})
+tst_time=3D"${tst_time_tmp} ${tst_time64}"
+
+for i in ${tst_time}
+do
+	$i >/dev/null 2>&1
+	output
+done
--=20
2.20.1

