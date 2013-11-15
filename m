Return-Path: <Hongbo.Zhong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33D666D9FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 06:52:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAF6qf7g025459
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 22:52:41 -0800 (PST)
Received: from hzhong.corp.ad.wrs.com (128.224.162.173) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 22:52:40 -0800
From: Zhong Hongbo <hongbo.zhong@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 14:52:58 +0800
Message-ID: <1384498379-30017-1-git-send-email-hongbo.zhong@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [V2 1/2] bluez4: Install the test script
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
X-List-Received-Date: Fri, 15 Nov 2013 06:52:39 -0000
Content-Type: text/plain

From: Zhong Hongbo <hongbo.zhong@windriver.com>

In defalut, the bluez-test script do not be installed in the rootfs.
After the user enable ptest feature, it will be install.

Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
---
 .../bluez/bluez4-4.101/install-test-script.patch   |   42 ++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |   13 +++++-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
new file mode 100644
index 0000000..bd7f31d
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Inappropriate
+
+Install the test scripts to /usr/bin directory
+
+Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
+---
+diff -Nurd bluez-4.101.orig/configure.ac bluez-4.101/configure.ac
+--- bluez-4.101.orig/configure.ac	2013-11-14 17:11:28.249903077 +0800
++++ bluez-4.101/configure.ac	2013-11-14 17:17:18.089902204 +0800
+@@ -61,6 +61,11 @@
+ fi
+ AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
+ 
++AC_ARG_WITH([bluez4testdir],
++    AS_HELP_STRING([--with-bluez4testdir=DIR], [bluez4 script test directory]),
++    [], [with_bluez4testdir=/usr/bin/])
++AC_SUBST([BLUEZ4_TEST_DIR], [$with_bluez4testdir])
++
+ AC_ARG_WITH([udevdir],
+     AS_HELP_STRING([--with-udevdir=DIR], [udev directory]),
+     [], [with_udevdir=/lib/udev/])
+diff -Nurd bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
+--- bluez-4.101.orig/Makefile.tools	2013-11-14 17:11:28.237903079 +0800
++++ bluez-4.101/Makefile.tools	2013-11-14 17:18:11.577902071 +0800
+@@ -227,6 +227,17 @@
+ 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
+ 		test/simple-player test/test-nap
+ 
++bluez4_testdir = @BLUEZ4_TEST_DIR@
++dist_bluez4_test_SCRIPTS = test/sap-client test/hsplay test/hsmicro \
++		test/monitor-bluetooth test/list-devices \
++		test/test-discovery test/test-manager test/test-adapter \
++		test/test-device test/test-service test/test-serial \
++		test/test-telephony test/test-network test/simple-agent \
++		test/simple-service test/simple-endpoint test/test-audio \
++		test/test-input test/test-sap-server test/test-oob \
++		test/test-attrib test/test-proximity test/test-thermometer \
++		test/test-serial-proxy test/test-health test/test-health-sink \
++		test/simple-player test/test-nap
+ if HIDD
+ bin_PROGRAMS += compat/hidd
+ 
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index d6c3e26..e61ba02 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://bluetooth.conf \
             file://fix-udev-paths.patch \
             file://obsolete_automake_macros.patch \
             file://network-fix-network-Connect-method-parameters.patch \
+            file://install-test-script.patch \
 "
 
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
@@ -25,7 +26,7 @@ do_install_append() {
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez"
+PACKAGES =+ "libasound-module-bluez ${PN}-test"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
 FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
@@ -34,6 +35,16 @@ FILES_${PN}-dev += "\
   ${libdir}/alsa-lib/*.la \
 "
 
+RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-test', '', d)}"
+FILES_${PN}-test += "\
+  ${bindir}/test-* \
+  ${bindir}/simple-* \
+  ${bindir}/hsmicro \
+  ${bindir}/hsplay \
+  ${bindir}/list-devices \
+  ${bindir}/monitor-bluetooth \
+"
+
 FILES_${PN}-dbg += "\
   ${libdir}/bluetooth/plugins/.debug \
   ${libdir}/*/.debug \
-- 
1.7.9.5


