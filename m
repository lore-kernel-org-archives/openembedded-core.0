Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 335B861005
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 18:12:49 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8RICjsB022961; 
	Fri, 27 Sep 2013 13:12:49 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2013 23:14:15 +0500
Message-Id: <1380305655-5492-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] opkg: Use systemd service for first boot configuration
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
X-List-Received-Date: Fri, 27 Sep 2013 18:12:49 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Currently opkg uses a script to configure packages during first time boot.
This script is present in rcS.d and when 'sysvinit' is disabled this
script doesn't execute. For systemd only distros this newly added service
will run the opkg configure during first boot only.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-devtools/opkg/opkg.inc                |   21 ++++++++++++++++++--
 .../opkg/opkg/opkg-configure.service               |   17 ++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    1 +
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index afe6cb0..3d56886 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -16,7 +16,13 @@ do_configure_prepend() {
 	sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
 }
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd
+
+python () {
+    if 'sysvinit' not in d.getVar("DISTRO_FEATURES", True).split():
+        pn = d.getVar('PN', True)
+        d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'opkg-configure.service')
+}
 
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR = "${target_localstatedir}/lib"
@@ -49,6 +55,16 @@ FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
 do_install_append() {
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
+
+	if ${@base_contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/
+		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+			-e 's,@BINDIR@,${bindir},g' \
+			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
+			${D}${systemd_unitdir}/system/opkg-configure.service
+	fi
 }
 
 do_install_append_class-native() {
@@ -59,7 +75,8 @@ do_install_append_class-native() {
 
 pkg_postinst_${PN} () {
 #!/bin/sh
-if [ "x$D" != "x" ] && [ -f $D${OPKGLIBDIR}/opkg/status ]; then
+if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)} && \
+	[ "x$D" != "x" ] && [ -f $D${OPKGLIBDIR}/opkg/status ]; then
 	install -d $D${sysconfdir}/rcS.d
 
 	# this happens at S98 where our good 'ole packages script used to run
diff --git a/meta/recipes-devtools/opkg/opkg/opkg-configure.service b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
new file mode 100644
index 0000000..a1c3a31
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=Opkg first boot configure
+DefaultDependencies=no
+After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
+Before=sysinit.target
+
+[Service]
+Type=oneshot
+EnvironmentFile=-@SYSCONFDIR@/default/postinst
+ExecStart=@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/opkg-cl configure > $LOGFILE 2>&1; else @BINDIR@/opkg-cl configure; fi"
+ExecStartPost=@BASE_BINDIR@/systemctl disable opkg-configure.service
+StandardOutput=syslog
+RemainAfterExit=No
+
+[Install]
+WantedBy=basic.target
+WantedBy=sysinit.target
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index bc10491..cd0485f 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -3,6 +3,7 @@ require opkg.inc
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://no-install-recommends.patch \
            file://add-exclude.patch \
+           file://opkg-configure.service \
 "
 
 S = "${WORKDIR}/trunk"
-- 
1.7.9.5


