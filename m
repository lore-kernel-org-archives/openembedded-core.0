Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id F14BF6C43C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 22:33:19 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id f4so242932edq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Lv6UVdH9imh0YJEkDbkO/MVOTO8D5+JP2NaForP29B4=;
	b=QIr4DVuVDlHcPborEu74JsVL24h0I85qCG88ewm4l7pAlPFA3gcu7AR5csPoDVcdVw
	/qcDZjpmYY2EbwAMxai/1mXPGWLP/EsoM1L4vpsyIUlKIctDIT6lzHOf1BxwkgD7eTRQ
	MGPO/tQI/516G9q6BdfZPoG4xiIHPnMjFvxcFKwjp18as6/Ll/t1y+JhIqWtMkC7fNEK
	Ao8UjvWorwJUiz7HnyH/Q9CGgWpm9yjU1uKyJsRNwHrNnKbZXFDArsiFcZpYA4pBLyDJ
	dkmicZNkyLQk+jzg39xadh7RPl/rxv4USp+po6c7TLOZkhbDms7+L1Kys0t6GmXSz6B6
	SLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Lv6UVdH9imh0YJEkDbkO/MVOTO8D5+JP2NaForP29B4=;
	b=RySwYp+KN2G24LQ4o1Ag/R7ES0hrfH1lwcFJkTfy5hC0bD97FsX8lpixW1OYMxjm6m
	/DPRXsK8PyD2a0cY9jCKwm7leVd7BVjwBcwpuxn9XWyJwhRcOv0JVxezRgLXQ2kAKIrk
	dFyRlQ62oT5eS/Gora/X5TnHUwqahzkJ4aYrHeUytWJ4dz9hgtbOlsY9cGuK9SIbjbCV
	YGgygcIMoEdrw8NS/CcSRKqu0IR3fR18o+pKNMCGLSt1h+m2X7hXAP7nXwJkJygKlQzf
	LUU1I9KV7FToawq9uK3ez/OmmncEQ0omc0WD5cHG2l0CHjg2u6/DavYogspQeJZHlAIR
	EdLw==
X-Gm-Message-State: AA+aEWZZqRWccBY51se1FTHMaGwtokRk9UC8lR81NSorcByqIuL3a/+C
	M/rHHyChIMwKrLHve/+aOjM3V6NZKi4=
X-Google-Smtp-Source: AFSGD/WeYhERUIbFwoqrsmttUb8DHuI3K6epk+5xgNjoh6bogrzxu4i+ZZf0OouW67caLqKC77aWuQ==
X-Received: by 2002:a50:b349:: with SMTP id r9-v6mr3624edd.284.1542666800149; 
	Mon, 19 Nov 2018 14:33:20 -0800 (PST)
Received: from localhost.localdomain (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	n12-v6sm6926273ejl.13.2018.11.19.14.33.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 14:33:19 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 23:33:08 +0100
Message-Id: <20181119223308.47590-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: fix PN-container package splitting
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
X-List-Received-Date: Mon, 19 Nov 2018 22:33:20 -0000

From: Adrian Freihofer <adrian.freihofer@scs.ch>

- Fix package splitting for services installed with
  systemd-container. Some files have been installed with systemd
  package instead of systemd-container package. (*.service,
  *.socket, *.html...)
- Split journal-upload, journal-remote, journal-gatewayd into
  separate packages. These services are not strictly related to
  nspawn containers. Remote logging is now possible without
  installing all the container stuff.
- systemd-container package rdepends on the new packages to
  maintain 100% backwards compatibility. But nspawn does not
  really depend on them. rrecommends would be fine as well.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 56 ++++++++++++++++++++----
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index e19a8babce..0755d15c4b 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -240,6 +240,9 @@ do_install() {
 	# Delete journal README, as log can be symlinked inside volatile.
 	rm -f ${D}/${localstatedir}/log/README
 
+	# journal-remote creates this at start
+	rm -rf ${D}/${localstatedir}/log/journal/remote
+
 	install -d ${D}${systemd_unitdir}/system/graphical.target.wants
 	install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
 	install -d ${D}${systemd_unitdir}/system/poweroff.target.wants
@@ -310,19 +313,35 @@ PACKAGES =+ "\
     ${PN}-zsh-completion \
     ${PN}-xorg-xinitrc \
     ${PN}-container \
+    ${PN}-journal-gatewayd \
+    ${PN}-journal-upload \
+    ${PN}-journal-remote \
     ${PN}-extra-utils \
 "
 
 SUMMARY_${PN}-container = "Tools for containers and VMs"
 DESCRIPTION_${PN}-container = "Systemd tools to spawn and manage containers and virtual machines."
 
-SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)}"
+SUMMARY_${PN}-journal-gatewayd = "HTTP server for journal events"
+DESCRIPTION_${PN}-journal-gatewayd = "systemd-journal-gatewayd serves journal events over the network. Clients must connect using HTTP. The server listens on port 19531 by default."
+
+SUMMARY_${PN}-journal-upload = "Send journal messages over the network"
+DESCRIPTION_${PN}-journal-upload = "systemd-journal-upload uploads journal entries to a specified URL."
+
+SUMMARY_${PN}-journal-remote = "Receive journal messages over the network"
+DESCRIPTION_${PN}-journal-remote = "systemd-journal-remote is a command to receive serialized journal events and store them to journal files."
+
+SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', '', '${PN}-journal-remote', '', d)} \
+"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
-USERADD_PACKAGES = "${PN} ${PN}-extra-utils"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-remote;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d / -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
+USERADD_PACKAGES = "${PN} ${PN}-extra-utils ${PN}-journal-gateway ${PN}-journal-upload ${PN}-journal-remote"
+USERADD_PARAM_${PN}-journal-gateway += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
+USERADD_PARAM_${PN}-journal-remote += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-remote;', '', d)}"
+USERADD_PARAM_${PN}-journal-upload += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d / -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
@@ -363,6 +382,29 @@ RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
 
+
+FILES_${PN}-journal-gatewayd = "${rootlibexecdir}/systemd/systemd-journal-gatewayd \
+                                ${systemd_system_unitdir}/systemd-journal-gatewayd.service \
+                                ${systemd_system_unitdir}/systemd-journal-gatewayd.socket \
+                                ${systemd_system_unitdir}/sockets.target.wants/systemd-journal-gatewayd.socket \
+                                ${datadir}/systemd/gatewayd/browse.html \
+                               "
+SYSTEMD_SERVICE_${PN}-journal-gatewayd = "systemd-journal-gatewayd.socket"
+
+FILES_${PN}-journal-upload = "${rootlibexecdir}/systemd/systemd-journal-upload \
+                              ${systemd_system_unitdir}/systemd-journal-upload.service \
+                              ${sysconfdir}/systemd/journal-upload.conf \
+                             "
+SYSTEMD_SERVICE_${PN}-journal-upload = "systemd-journal-upload.service"
+
+FILES_${PN}-journal-remote = "${rootlibexecdir}/systemd/systemd-journal-remote \
+                              ${sysconfdir}/systemd/journal-remote.conf \
+                              ${systemd_system_unitdir}/systemd-journal-remote.service \
+                              ${systemd_system_unitdir}/systemd-journal-remote.socket \
+                             "
+SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
+
+
 FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
                          ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
                          ${base_bindir}/machinectl \
@@ -381,9 +423,6 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${systemd_system_unitdir}/var-lib-machines.mount \
                          ${rootlibexecdir}/systemd/systemd-import \
                          ${rootlibexecdir}/systemd/systemd-importd \
-                         ${rootlibexecdir}/systemd/systemd-journal-gatewayd \
-                         ${rootlibexecdir}/systemd/systemd-journal-remote \
-                         ${rootlibexecdir}/systemd/systemd-journal-upload \
                          ${rootlibexecdir}/systemd/systemd-machined \
                          ${rootlibexecdir}/systemd/systemd-pull \
                          ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
@@ -396,6 +435,7 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${datadir}/polkit-1/actions/org.freedesktop.import1.policy \
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
                         "
+RDEPENDS_${PN}-container += "${PN}-journal-upload ${PN}-journal-remote ${PN}-journal-gatewayd"
 
 FILES_${PN}-extra-utils = "\
                         ${base_bindir}/systemd-escape \
-- 
2.17.1


