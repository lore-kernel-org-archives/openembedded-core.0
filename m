Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4791B7C8B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 08:32:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 444nlh0SDLz5w
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 09:32:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1550737952;
	bh=A6WrCYIY4MfFW6lnRHLW53xDaRvEe4Nzhymvq8385BI=;
	h=From:To:Subject:Date:From;
	b=h42tB46YIGN73EYJ11FRzvrMiFX8FlknVUF092MXVXGv8O4sK966HrdpsG7uEDNOn
	8KXXbH03LqStcM0lJIdSxVN17GCjJ6WGQcHAz24w5E64cggCNKU1nbx4XT7EXHyggU
	WPXUP9xL7zaE5wlgd4bMSOh7lXCiEou2LCJU28bYh1HWsyM7wWRXYnxSMJRyekwFDT
	UdpxdaQbpGBlr51viGf40tcCMDsmDk8VzcOJ+hYrzJ62SqRLI55tcFBMe7G5nrr933
	N1xP0HjLuSGXVo49I0B1sI4J7VivMK7+QnVD15mFf+Djj3F1Vv4B6WhnWzHZxiXV9g
	KMHZtTJracgU0B8XXzz+vlJsLt17+Jwt9haTBV+NwvAM8sMmZX9+//xDV2dF3fmDBO
	B9m89PLJZN/oyOMs4xtNVRzJ4Mcb+U0Ww8hr3Td16NmA1GAQw8WA3Y7yiCTgwfzUL9
	LZIFDFKpBJ8PVl121j2tWFAizxw1TbVPZXBn4J4a3co1KlyayG3UHN+Z6aRvT5W6SE
	2nCiv8ZM8oDafB+1ihFG7QfYATObxRHgGysTfutm3z2qQpGGag1naiVT0SO0+0n08a
	8MYSdI9iK8b5TRSua2i3igEaNj2hZcm6kBzM9f9jrORaIx2zAHbpd+CK0InO3qZFSR
	a0o9fEfqm0IflXQ4D0pAGr7I=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 10:32:32 +0200
Message-Id: <20190221083232.29419-2-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lighttpd: Use the upstream lighttpd.service
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
X-List-Received-Date: Thu, 21 Feb 2019 08:32:32 -0000

We shipped an old version that was missing several fixes.

A minor incompatibility is that this moves
/etc/lighttpd.conf -> /etc/lighttpd/lighttpd.conf

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/lighttpd/lighttpd/lighttpd         |  2 +-
 meta/recipes-extended/lighttpd/lighttpd/lighttpd.service | 12 ------------
 meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb        |  9 ++++-----
 3 files changed, 5 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/lighttpd.service

diff --git a/meta/recipes-extended/lighttpd/lighttpd/lighttpd b/meta/recipes-extended/lighttpd/lighttpd/lighttpd
index bf89a60b7d..82fbaa523b 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/lighttpd
+++ b/meta/recipes-extended/lighttpd/lighttpd/lighttpd
@@ -4,7 +4,7 @@ PATH=/sbin:/bin:/usr/sbin:/usr/bin
 DAEMON=/usr/sbin/lighttpd
 NAME=lighttpd
 DESC="Lighttpd Web Server"
-OPTS="-f /etc/lighttpd.conf"
+OPTS="-f /etc/lighttpd/lighttpd.conf"
 
 case "$1" in
   start)
diff --git a/meta/recipes-extended/lighttpd/lighttpd/lighttpd.service b/meta/recipes-extended/lighttpd/lighttpd/lighttpd.service
deleted file mode 100644
index 66a907aa17..0000000000
--- a/meta/recipes-extended/lighttpd/lighttpd/lighttpd.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=Lightning Fast Webserver With Light System Requirements
-After=network.target
-
-[Service]
-ExecStartPre=@SBINDIR@/lighttpd -t -f @SYSCONFDIR@/lighttpd.conf
-ExecStart=@SBINDIR@/lighttpd -D -f @SYSCONFDIR@/lighttpd.conf
-ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
-
-[Install]
-WantedBy=multi-user.target
-
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
index a58faa17be..a0b350f358 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
@@ -16,7 +16,6 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
-        file://lighttpd.service \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
@@ -57,13 +56,13 @@ INITSCRIPT_PARAMS = "defaults 70"
 SYSTEMD_SERVICE_${PN} = "lighttpd.service"
 
 do_install_append() {
-	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
+	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
 	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
-	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}/lighttpd
 	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
 
 	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${S}/doc/systemd/lighttpd.service ${D}${systemd_unitdir}/system
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 		-e 's,@BASE_BINDIR@,${base_bindir},g' \
@@ -75,7 +74,7 @@ do_install_append() {
 
 FILES_${PN} += "${sysconfdir} /www"
 
-CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
+CONFFILES_${PN} = "${sysconfdir}/lighttpd/lighttpd.conf"
 
 PACKAGES_DYNAMIC += "^lighttpd-module-.*"
 
-- 
2.11.0


