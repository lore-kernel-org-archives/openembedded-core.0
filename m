Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94DB0771E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:32:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7A2WrAH032657
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2016 19:32:53 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 9 Aug 2016 19:32:52 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2016 10:18:34 +0800
Message-ID: <20160810021834.5641-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH][v4] watchdog: enable systemd support
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
X-List-Received-Date: Wed, 10 Aug 2016 02:32:53 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. inherit systemd, and add two unit files which are from Fedora 23
2. auto load soft dog kernel module

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../watchdog/watchdog/watchdog-ping.service              | 11 +++++++++++
 meta/recipes-extended/watchdog/watchdog/watchdog.service | 11 +++++++++++
 meta/recipes-extended/watchdog/watchdog_5.15.bb          | 16 +++++++++++++++-
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog.service

diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
new file mode 100644
index 0000000..44bac9d
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=watchdog daemon for use with ping test / network dependency
+After=network.target
+Conflicts=watchdog.service
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/watchdog
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog.service b/meta/recipes-extended/watchdog/watchdog/watchdog.service
new file mode 100644
index 0000000..c5faa4e
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=watchdog daemon
+# man systemd.special
+# auto added After=basic.target
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/watchdog
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index ee1a893..7ff151c 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -12,6 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch \
            file://watchdog-init.patch \
            file://watchdog-conf.patch \
+           file://watchdog-ping.service \
+           file://watchdog.service \
 "
 
 SRC_URI[md5sum] = "678c32f6f35a0492c9c1b76b4aa88828"
@@ -21,7 +23,7 @@ UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools
-inherit update-rc.d
+inherit update-rc.d systemd
 
 DEPENDS_append_libc-musl = " libtirpc "
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
@@ -33,6 +35,18 @@ INITSCRIPT_PARAMS = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
 RRECOMMENDS_${PN} = "kernel-module-softdog"
 
+SYSTEMD_SERVICE_${PN} = "watchdog.service"
+
 do_install_append() {
 	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/watchdog*.service ${D}${systemd_system_unitdir}
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${sysconfdir}/modules-load.d
+		echo "softdog" > ${D}${sysconfdir}/modules-load.d/softdog.conf
+		sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/*.service
+	fi
 }
+
+FILES_${PN} += "${systemd_system_unitdir}/*"
-- 
2.7.4


