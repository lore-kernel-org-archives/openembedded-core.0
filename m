Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5523E7C410
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 08:38:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3H8ccgW010565
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 01:38:49 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 17 Apr 2019 01:38:27 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2019 16:38:26 +0800
Message-ID: <1555490306-29097-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541388536-121953-1-git-send-email-changqing.li@windriver.com>
References: <1541388536-121953-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4] dbus: fix ptest failure
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
X-List-Received-Date: Wed, 17 Apr 2019 08:38:59 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. since one bug in run-ptest, testcase test-bus have never been
actually run (althrough it's result is PASS).

After commit 0828850, test-bus can actually run but it
did not install:
  test-service, test-shell-service, test-segfault, and
  dbus-daemon-launch-helper-test
Add the configure flag:
  --enable-embedded-tests
to generate binary dbus-daemon-launch-helper-test, then install
them so that test-bus will now pass.

2. fix testcase test-dbus-daemon failed
we enable --enable-verbose-mode in recipe dbus-test, and don't
enable it in recipe dbus. This will make below test code get
unexpect result of have_verbose and assert.
disable --enable-verbose-mode for recipe dbus-test to fix it.

 #ifdef DBUS_ENABLE_STATS
  g_assert_true (have_stats);
 #else
  g_assert_false (have_stats);
 #endif

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.12.bb | 13 ++++++++++---
 meta/recipes-core/dbus/dbus/run-ptest       | 16 ++++++++++++----
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.12.bb b/meta/recipes-core/dbus/dbus-test_1.12.12.bb
index f413192..0502c44 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.12.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.12.bb
@@ -33,13 +33,14 @@ EXTRA_OECONF = "--enable-tests \
                 --enable-installed-tests \
                 --enable-checks \
                 --enable-asserts \
-                --enable-verbose-mode \
                 --enable-largefile \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-dbus-test-dir=${PTEST_PATH} \
-                ${EXTRA_OECONF_X}"
+                ${EXTRA_OECONF_X} \
+                --enable-embedded-tests \
+             "
 
 EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 
@@ -50,6 +51,7 @@ PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
+PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
 
 do_install() {
     :
@@ -58,12 +60,17 @@ do_install() {
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/test
 	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay \
-	   variant uid-permissions syntax spawn sd-activation names monitor message fdpass "
+	   variant uid-permissions syntax spawn sd-activation names monitor message fdpass service shell-service"
 	for i in $l; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
 
 	l="bus bus-system bus-launch-helper"
 	for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
 
+	install -d ${D}${PTEST_PATH}/bus
+	install ${B}/bus/.libs/dbus-daemon-launch-helper-test ${D}${PTEST_PATH}/bus
+
+	install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
+
 	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
 	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
 
diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
index 353ba1e..cf2e68f 100755
--- a/meta/recipes-core/dbus/dbus/run-ptest
+++ b/meta/recipes-core/dbus/dbus/run-ptest
@@ -17,8 +17,16 @@ export LD_LIBRARY_PATH=@PTEST_PATH@/test/.libs
 files=`ls test/test-*`
 
 for i in $files
-	do
-		./$i ./test/data >/dev/null
-		output
-	done
+do
+     #these programs are used by testcase test-bus, don't run here
+     if [ $i = "test/test-service" ] \
+        || [ $i = "test/test-shell-service" ] \
+        || [ $i = "test/test-segfault" ]
+     then
+         continue
+     fi
+
+     ./$i ./test/data >/dev/null 2>&1
+     output
+done 
 
-- 
2.7.4


