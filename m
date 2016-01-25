Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6EDB75D4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 02:49:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0P2noag025577
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 18:49:50 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 24 Jan 2016 18:49:49 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jan 2016 10:48:47 +0800
Message-ID: <1453690127-24751-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] [v2] watchdog: enable systemd support
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
X-List-Received-Date: Mon, 25 Jan 2016 02:49:51 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. inherit systemd, and add two unit files which are from Fedora 23
2. auto load soft dog kernel module

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../watchdog/watchdog/watchdog-ping.service             | 12 ++++++++++++
 .../recipes-extended/watchdog/watchdog/watchdog.service | 12 ++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.14.bb         | 17 ++++++++++++++++-
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog.service

diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
new file mode 100644
index 0000000..fce6e12
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=watchdog daemon for use with ping test / network dependency
+After=network.target
+Conflicts=watchdog.service
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/watchdog
+ControlGroup=cpu:/
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog.service b/meta/recipes-extended/watchdog/watchdog/watchdog.service
new file mode 100644
index 0000000..f945bc9
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=watchdog daemon
+# man systemd.special
+# auto added After=basic.target
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/watchdog
+ControlGroup=cpu:/
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb b/meta/recipes-extended/watchdog/watchdog_5.14.bb
index fc717bc..9e21075 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
@@ -14,6 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
 	   file://watchdog-init.patch \
 	   file://watchdog-conf.patch \
 	   file://0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch \
+	   file://watchdog-ping.service \
+	   file://watchdog.service \
 "
 
 SRC_URI[md5sum] = "5b2dba0c593942f4acc100bca0d560c4"
@@ -23,7 +25,7 @@ UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools
-inherit update-rc.d
+inherit update-rc.d systemd
 
 DEPENDS_append_libc-musl = " libtirpc "
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
@@ -34,6 +36,19 @@ INITSCRIPT_PARAMS = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
 RRECOMMENDS_${PN} = "kernel-module-softdog"
 
+
+SYSTEMD_SERVICE_${PN} = "watchdog.service"
+
 do_install_append() {
 	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/watchdog*.service ${D}${systemd_unitdir}/system
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${sysconfdir}/modules-load.d
+		echo "softdog" > ${D}${sysconfdir}/modules-load.d/softdog.conf
+		sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*.service
+	fi
 }
+
+FILES_${PN} += "${systemd_unitdir}/system/*"
-- 
1.9.1


