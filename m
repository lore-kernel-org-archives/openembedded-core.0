Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96A356E746
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 02:23:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0K2N1Yv009073
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 18:23:01 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 19 Jan 2014 18:23:01 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 10:23:02 +0800
Message-ID: <6d96cc0ba2fd492a3779169fdf687a76658f0bdf.1390184362.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390184362.git.Qi.Chen@windriver.com>
References: <cover.1390184362.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 4/5] distcc: add systemd support
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
X-List-Received-Date: Mon, 20 Jan 2014 02:23:00 -0000
Content-Type: text/plain

Add systemd support for distcc.

These unit files mainly use the same files in Fedora 20 as a reference.

[YOCTO #4420]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/distcc/distcc_3.1.bb         |   14 +++++++++++---
 meta/recipes-devtools/distcc/files/default         |    5 +++++
 meta/recipes-devtools/distcc/files/distccd.service |   11 +++++++++++
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/distcc/files/distccd.service

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index e351a58..c3cbd05 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -22,12 +22,13 @@ SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
            file://separatebuilddir.patch \
            file://default \
            file://distccmon-gnome.desktop \
-           file://distcc"
+           file://distcc \
+           file://distccd.service"
 
 SRC_URI[md5sum] = "a1a9d3853df7133669fffec2a9aab9f3"
 SRC_URI[sha256sum] = "f55dbafd76bed3ce57e1bbcdab1329227808890d90f4c724fcd2d53f934ddd89"
 
-inherit autotools pkgconfig update-rc.d useradd
+inherit autotools pkgconfig update-rc.d useradd systemd
 
 EXTRA_OECONF += "--disable-Werror PYTHON=/dev/null"
 
@@ -40,11 +41,17 @@ USERADD_PARAM_${PN} = "--system \
 
 INITSCRIPT_NAME = "distcc"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "distccd.service"
+
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
     install -d ${D}${sysconfdir}/default
     install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/distccd.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/distccd.service
     ${DESKTOPINSTALL}
 }
 DESKTOPINSTALL = ""
@@ -58,7 +65,8 @@ FILES_${PN} = " ${sysconfdir} \
 		${bindir}/distcc \
     ${bindir}/lsdistcc \
 		${bindir}/distccd \
-		${bindir}/distccmon-text"
+		${bindir}/distccmon-text \
+		${systemd_unitdir}/system/distccd.service"
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/distcc"
 
diff --git a/meta/recipes-devtools/distcc/files/default b/meta/recipes-devtools/distcc/files/default
index 95290f8..63c4159 100644
--- a/meta/recipes-devtools/distcc/files/default
+++ b/meta/recipes-devtools/distcc/files/default
@@ -17,3 +17,8 @@ STARTDISTCC="true"
 # ALLOWEDNETS="127.0.0.1"
 
 ALLOWEDNETS="192.168.7.0/24"
+
+#
+# OPTIONS is used for the systemd service file
+#
+OPTIONS="--allow 192.168.7.0/24"
diff --git a/meta/recipes-devtools/distcc/files/distccd.service b/meta/recipes-devtools/distcc/files/distccd.service
new file mode 100644
index 0000000..0253ddf
--- /dev/null
+++ b/meta/recipes-devtools/distcc/files/distccd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Distccd A Distributed Compilation Server
+After=network.target
+
+[Service]
+User=distcc
+EnvironmentFile=-/etc/default/distcc
+ExecStart=@BINDIR@/distccd --verbose --no-detach --daemon $OPTIONS
+
+[Install]
+WantedBy=multi-user.target
-- 
1.7.9.5


