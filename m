Return-Path: <noor_ahsan@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id EC5F96ABED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 08:06:52 +0000 (UTC)
Received: from pkl-ahsann-ubuntu.mgc.mentorg.com ([137.202.157.70])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r6586pbZ000954; 
	Fri, 5 Jul 2013 03:06:52 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 13:06:47 +0500
Message-Id: <1373011607-16614-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] lighttpd: Add systemd support.
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
X-List-Received-Date: Fri, 05 Jul 2013 08:06:53 -0000

From: Noor <noor_ahsan@mentor.com>

* Enable lighttpd with systemd support.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../lighttpd/files/lighttpd.service                |   12 +++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   21 ++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/files/lighttpd.service b/meta/recipes-extended/lighttpd/files/lighttpd.service
new file mode 100644
index 0000000..a5333b6
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/files/lighttpd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Lightning Fast Webserver With Light System Requirements
+After=network.target
+
+[Service]
+ExecStartPre=/usr/sbin/lighttpd -t -f /etc/lighttpd.conf
+ExecStart=/usr/sbin/lighttpd -D -f /etc/lighttpd.conf
+ExecReload=/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
index df6ce97..93f7a39 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
+        file://lighttpd.service \
         "
 
 SRC_URI[md5sum] = "8e2d4ae8e918d4de1aeb9842584d170b"
@@ -39,19 +40,31 @@ EXTRA_OECONF = " \
              --disable-static \
 "
 
-inherit autotools pkgconfig update-rc.d gettext
+inherit autotools pkgconfig update-rc.d gettext systemd
 
 INITSCRIPT_NAME = "lighttpd"
 INITSCRIPT_PARAMS = "defaults 70"
 
+SYSTEMD_SERVICE_${PN} = "lighttpd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+
 do_install_append() {
-    install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
-    install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
+    
+    install -d ${D}${sysconfdir} ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
     install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
+    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
+    else
+         install -d ${D}${systemd_unitdir}/system
+         install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
+    fi
+
 }
 
-FILES_${PN} += "${sysconfdir} /www"
+FILES_${PN} += "${sysconfdir} /www ${systemd_unitdir}"
 
 CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
 
-- 
1.7.9.5


