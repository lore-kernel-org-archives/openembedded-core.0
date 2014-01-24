Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5326E721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 10:04:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0OA4HE0018765
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 02:04:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 24 Jan 2014 02:04:17 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jan 2014 18:04:25 +0800
Message-ID: <9c10c09425172cc9ee22d662bc0c1aeabfcaf635.1390557768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390557768.git.Qi.Chen@windriver.com>
References: <cover.1390557768.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] dpkg: use systemd service for first boot configuration
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
X-List-Received-Date: Fri, 24 Jan 2014 10:04:16 -0000
Content-Type: text/plain

Use a systemd service file for first boot configuration for dpkg
based images which has 'package-management' in its IMAGE_FEATURES.

[YOCTO #5719]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc                |   21 ++++++++++++++++++--
 .../dpkg/dpkg/dpkg-configure.service               |   17 ++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |    1 +
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 0ccfd74..044a8eb 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -14,7 +14,13 @@ S = "${WORKDIR}/${BPN}-${PV}"
 
 PARALLEL_MAKE = ""
 
-inherit autotools gettext perlnative pkgconfig
+inherit autotools gettext perlnative pkgconfig systemd
+
+python () {
+    if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        pn = d.getVar('PN', True)
+        d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'dpkg-configure.service')
+}
 
 export PERL = "${bindir}/perl"
 PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
@@ -48,11 +54,22 @@ do_install_append () {
 		mv ${D}${bindir}/update-alternatives ${D}${sbindir}
 		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
 	fi
+
+	if ${@base_contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/dpkg-configure.service ${D}${systemd_unitdir}/system/
+		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+			-e 's,@BINDIR@,${bindir},g' \
+			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
+			${D}${systemd_unitdir}/system/dpkg-configure.service
+	fi
 }
 
 pkg_postinst_${PN} () {
 #!/bin/sh
-if [ "x$D" != "x" ] && [ -f $D/var/lib/dpkg/status ]; then
+if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)} && \
+	[ "x$D" != "x" ] && [ -f $D/var/lib/dpkg/status ]; then
 	install -d $D${sysconfdir}/rcS.d
 
 	# this happens at S98 where our good 'ole packages script used to run
diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service b/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service
new file mode 100644
index 0000000..f0b0789
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=dpkg first boot configure
+DefaultDependencies=no
+After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
+Before=sysinit.target
+
+[Service]
+Type=oneshot
+EnvironmentFile=-@SYSCONFDIR@/default/postinst
+ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/dpkg --configure -a > $LOGFILE 2>&1; else @BINDIR@/dpkg --configure -a; fi"
+ExecStartPost=@BASE_BINDIR@/systemctl disable dpkg-configure.service
+StandardOutput=syslog
+RemainAfterExit=No
+
+[Install]
+WantedBy=basic.target
+WantedBy=sysinit.target
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
index 9e2392c..b27e6f4 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://noman.patch \
             file://remove-tar-no-timestamp.patch \
             file://fix-abs-redefine.patch \
             file://arch_pm.patch \
+            file://dpkg-configure.service \
            "
 
 SRC_URI[md5sum] = "cc25086e1e3bd9512a95f14cfe9002e1"
-- 
1.7.9.5


