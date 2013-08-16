Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA946B563
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 17:26:52 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r7GHQg7P007660; 
	Fri, 16 Aug 2013 12:26:52 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2013 22:27:42 +0500
Message-Id: <1376674064-14468-2-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 2/4] [v3] lighttpd: Add systemd support
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
X-List-Received-Date: Fri, 16 Aug 2013 17:26:52 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

- Remove dependency on meta-systemd

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../lighttpd/files/lighttpd.service                |   12 ++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   14 ++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

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
index 6635e31..3876fcc 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
+        file://lighttpd.service \
         "
 
 SRC_URI[md5sum] = "8e2d4ae8e918d4de1aeb9842584d170b"
@@ -39,19 +40,28 @@ EXTRA_OECONF = " \
              --disable-static \
 "
 
-inherit autotools pkgconfig update-rc.d gettext
+inherit autotools pkgconfig update-rc.d gettext systemd
 
 INITSCRIPT_NAME = "lighttpd"
 INITSCRIPT_PARAMS = "defaults 70"
 
+SYSTEMD_SERVICE_${PN} = "lighttpd.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
 	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
+	sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/lighttpd.service
+	sed -i 's,/etc/,${sysconfdir}/,g' ${D}${systemd_unitdir}/system/lighttpd.service
+	sed -i 's,/bin/,${base_bindir}/,g' ${D}${systemd_unitdir}/system/lighttpd.service
 }
 
-FILES_${PN} += "${sysconfdir} /www"
+FILES_${PN} += "${sysconfdir} /www ${systemd_unitdir}"
 
 CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
 
-- 
1.7.9.5


