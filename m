Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B032571C3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 20:19:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 12:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,402,1515484800"; d="scan'208";a="34589381"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2018 12:19:27 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 12:19:26 -0800
Message-Id: <1519762766-20100-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] dbus-test_1.12.2: various fixes
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
X-List-Received-Date: Tue, 27 Feb 2018 20:19:26 -0000

The result of running dbus-test-ptest was a series of
various segfaults, interpreted as FAILs. This was a direct consequence
of the test suite loading the installed shared library libdbus-1.so, not the
one built along the test suite.

While we normally want to test against the installed libraries, we cannot
do this in this case as the test suite expects a library that is configured/compiled
differently from the installed one. We could configure the installed library
identically as the test suite expects, (and there should be no issues), however
this is not desirable for performance reasons.

Hence we need to use the library built along with the test suite.
Of course, running the test suite against its own library does not
test the installed library, however they are both built from the same
sources so that can give us some kind of indication.

The following changes were made:

1. Configure the test library as close as possible to the installed one,
   with some additional configuration options that are needed for testing.
   (Use dbus_1.12.2.bb recipe as a template)
2. Include the shared libraries in the package, use LD_LIBRARY_PATH during
   testing to load them instead of the installed ones.
3. Add a few more tests. (There are still some additional tests built that
   are not used, but they would have to be special-cased).
4. When evaluating the test results, differentiate between "FAIL" and "SKIP"

[YOCTO #10841]
[YOCTO #12277]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.2.bb | 30 ++++++++++++++++++++++++++----
 meta/recipes-core/dbus/dbus/run-ptest      | 20 +++++++++++++++++---
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.2.bb b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
index c3891a3..a6a5ca2 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.2.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
@@ -34,25 +34,47 @@ EXTRA_OECONF = "--enable-tests \
                 --enable-checks \
                 --enable-asserts \
                 --enable-verbose-mode \
+                --enable-largefile \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
-                --disable-systemd \
-                --without-systemdsystemunitdir \
                 --with-dbus-test-dir=${PTEST_PATH} \
                 ${EXTRA_OECONF_X}"
 
+EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
+PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
+
 do_install() {
     :
 }
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/test
-	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay"
+	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay \
+	   variant uid-permissions syntax spawn sd-activation names monitor message fdpass "
 	for i in $l; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
+
 	l="bus bus-system bus-launch-helper"
 	for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
-	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
+
 	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
+	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
+
+	install -d ${D}${PTEST_PATH}/test/.libs
+	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
+
+	# Remove build host references...
+	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf \) -type f -exec \
+		sed -i \
+		 -e 's:${B}:${PTEST_PATH}:g' \
+		 {} +
 }
+
 RDEPENDS_${PN}-ptest += "bash"
diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
index c72d083..8a8970e 100755
--- a/meta/recipes-core/dbus/dbus/run-ptest
+++ b/meta/recipes-core/dbus/dbus/run-ptest
@@ -1,10 +1,24 @@
 #!/bin/sh
 
 output() {
-  if [ $? -eq 0 ]
+  retcode=$?
+  if [ $retcode -eq 0 ]
     then echo "PASS: $i"
-    else echo "FAIL: $i"
+  elif [ $retcode -eq 77 ]
+    then echo "SKIP: $i"
+  else echo "FAIL: $i"
   fi
 }
 
-for i in `ls test/test-*`; do ./$i ./test/data DBUS_TEST_HOMEDIR=./test >/dev/null; output; done
+export DBUS_TEST_HOMEDIR=./test
+export XDG_RUNTIME_DIR=./test
+export LD_LIBRARY_PATH=/usr/lib/dbus-test/ptest/test/.libs
+
+files=`ls test/test-*`
+
+for i in $files
+	do
+		./$i ./test/data >/dev/null
+		output
+	done
+
-- 
2.7.4


