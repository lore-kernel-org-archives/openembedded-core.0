Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6FA77155
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 05:17:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8C5HBhU018643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 22:17:12 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 11 Sep 2016 22:17:10 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Sep 2016 13:00:38 +0800
Message-ID: <20160912050038.1077-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH][v5] watchdog: enable systemd support
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
X-List-Received-Date: Mon, 12 Sep 2016 05:17:13 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. inherit systemd, and add two unit files which are from Fedora 23
2. auto load soft dog kernel module

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../watchdog/watchdog/watchdog-ping.service           | 11 +++++++++++
 .../watchdog/watchdog/watchdog.service                | 11 +++++++++++
 meta/recipes-extended/watchdog/watchdog_5.15.bb       | 19 +++++++++++++++++--
 3 files changed, 39 insertions(+), 2 deletions(-)
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
index cedfc04..826e31f 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -13,6 +13,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://watchdog-init.patch \
            file://watchdog-conf.patch \
            file://wd_keepalive.init \
+           file://watchdog-ping.service \
+           file://watchdog.service \
 "
 
 SRC_URI[md5sum] = "678c32f6f35a0492c9c1b76b4aa88828"
@@ -22,7 +24,7 @@ UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools
-inherit update-rc.d
+inherit update-rc.d systemd
 
 DEPENDS_append_libc-musl = " libtirpc "
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
@@ -37,16 +39,29 @@ INITSCRIPT_PARAMS_${PN} = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 INITSCRIPT_NAME_${PN}-keepalive = "wd_keepalive"
 INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
+SYSTEMD_SERVICE_${PN} = "watchdog.service"
+
 do_install_append() {
-	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
+    install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
     install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
 
     # watchdog.conf is provided by the watchdog-config recipe
     rm ${D}${sysconfdir}/watchdog.conf
+
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/watchdog*.service ${D}${systemd_system_unitdir}
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${sysconfdir}/modules-load.d
+        echo "softdog" > ${D}${sysconfdir}/modules-load.d/softdog.conf
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/*.service
+    fi
 }
 
 PACKAGES =+ "${PN}-keepalive"
 
+FILES_${PN} += "${systemd_system_unitdir}/*"
+
 FILES_${PN}-keepalive = " \
     ${sysconfdir}/init.d/wd_keepalive \
     ${sbindir}/wd_keepalive \
-- 
2.8.1


