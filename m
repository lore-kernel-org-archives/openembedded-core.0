Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC18601DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:05:19 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r5JH5HEW019579; 
	Wed, 19 Jun 2013 12:05:19 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2013 22:05:42 +0500
Message-Id: <1371661542-4958-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] [v2] [dylan] lighttpd: Enabling with systemd
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
X-List-Received-Date: Wed, 19 Jun 2013 17:05:19 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

- Remove dependency on systemd layer
- Use lighttpd service type 'simple' rather than 'oneshot'

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../lighttpd/files/lighttpd.service                |   12 ++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   11 ++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

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
index df6ce97..d73a76a 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
@@ -5,7 +5,6 @@ BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
 
-
 SECTION = "net"
 DEPENDS = "zlib libpcre"
 RDEPENDS_${PN} += " \
@@ -18,10 +17,15 @@ RDEPENDS_${PN} += " \
 
 PR = "r0"
 
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "lighttpd.service"
+
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
+        file://lighttpd.service \
         "
 
 SRC_URI[md5sum] = "8e2d4ae8e918d4de1aeb9842584d170b"
@@ -49,6 +53,11 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
+    fi
 }
 
 FILES_${PN} += "${sysconfdir} /www"
-- 
1.7.9.5


