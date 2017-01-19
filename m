Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0ECE371DE8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrRYL005705; Thu, 19 Jan 2017 22:53:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HsrRlg92j4wW; Thu, 19 Jan 2017 22:53:29 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrNdK005650
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:24 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa7-0004h6-Hk; Thu, 19 Jan 2017 22:53:23 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:52:44 +0000
Message-Id: <1484866395-17971-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/33] classes/package*: Add support for PACKAGE_WRITE_DEPS
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:32 -0000

Add a new variable to allow markup of postinstall (and preinst)
script dependnecies on native/cross tools.

If your postinstall can execute at rootfs creation time rather than on
target but depends on a native tool in order to execute, you need to
list that tool in PACKAGE_WRITE_DEPENDS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass     | 8 ++++++++
 meta/classes/package_deb.bbclass | 1 +
 meta/classes/package_ipk.bbclass | 1 +
 meta/classes/package_rpm.bbclass | 1 +
 4 files changed, 11 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 568b85c..0068a50 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -54,6 +54,14 @@ ALL_MULTILIB_PACKAGE_ARCHS = "${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"
 # rpm is used for the per-file dependency identification
 PACKAGE_DEPENDS += "rpm-native"
 
+
+# If your postinstall can execute at rootfs creation time rather than on
+# target but depends on a native/cross tool in order to execute, you need to
+# list that tool in PACKAGE_WRITE_DEPENDS. Target package dependencies belong
+# in the package dependencies as normal, this is just for native/cross support
+# tools at rootfs build time.
+PACKAGE_WRITE_DEPS ??= ""
+
 def legitimize_package_name(s):
     """
     Make sure package names are legitimate strings
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 68eca61..6ce008f 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -351,6 +351,7 @@ python do_package_write_deb () {
 do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[umask] = "022"
+do_package_write_deb[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
 addtask package_write_deb after do_packagedata do_package
 
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 7018a60..039b6ab 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -291,6 +291,7 @@ python do_package_write_ipk () {
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[umask] = "022"
+do_package_write_ipk[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
 addtask package_write_ipk after do_packagedata do_package
 
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b9f049e..c978ec5 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -772,6 +772,7 @@ python do_package_write_rpm () {
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[umask] = "022"
+do_package_write_rpm[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
 addtask package_write_rpm after do_packagedata do_package
 
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
-- 
2.7.4


