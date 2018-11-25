Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id ECB336C68D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 19:46:05 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id o10so14010332edt.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 11:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gvq9JMf8IeK95/maRSXcksq0QtSkOFO/tSzhL3oSy/s=;
	b=Qbs0KhmT2EaOTc9zhhQyPKT8CVOdbTVfZEZ5o+/iKa6azboNYNEdQ2vZIUXoabv8Yd
	GJTp6a6jzd+x7KUv7ovMiq6XO3MMsSZgcrJBVOtKdg4hFecelWhA6CmCkUFKeUMRjhCD
	YOf5nlyzKRFn7wk7hcqisGb/MewdBGp+E0Or4mS3FC0hoTKPTwRs5M5zDJrLxbHex9QV
	jRnm4ye3wdrZ0QpQmpsShm/Ug/aGst6omiZRDKoW/UPuUGPZaSbKBse0ZORZhM5HpCXT
	PmqryUUdcYYMKzlpFYcdEJxSfWxkFAaIAUo56kquYqZuEDecQPxZc+SKuATuPw0RSdVC
	kJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gvq9JMf8IeK95/maRSXcksq0QtSkOFO/tSzhL3oSy/s=;
	b=gKUkqrmKRherszcWxTS+wqWQ3HfbFch1J0nSqw9jPZJnazahaJgl4hK+QjxOXtIZpg
	EOmdkkpYybDcPY3j36xUCZ5DkD1UCGKEI6DRQO9nicOLGdKALstdl50qrwZZ5RxzOzAA
	vqUNq2G/+YMvlwbvyabAVXjKVD5+z70IOJBsg7SIzq2YCso2O5gV6CCvIFKI1DwgVRBD
	gxJOaygwe8FxDxvoCcyyyiP8yuantULdj6xRRjOWBsfn9eXgY3qDYnGJhYvxikAhyNL7
	lI3bLJ+12Rv2V9hDSofymJOSgEmY5zf6G6XtFRNypDtH+MH7ixiQPTyMfIxSjuUj37We
	qXvw==
X-Gm-Message-State: AGRZ1gIHpAYonwEDOHyMZoVPVI6V1o91LxZ5gxeZ8Cpk/2HF1CRejOs9
	XxBVfT+ebl9kNYSC5OL/S44fQPzb
X-Google-Smtp-Source: AJdET5fLSOt1gTBW3MBP+9tKokUMBgwu3Ig9zdj5rBbw35PhmbLT1kHp7SEgFaaFTH6Plu3dbYR3WQ==
X-Received: by 2002:a17:906:c7c9:: with SMTP id
	dc9-v6mr17690399ejb.232.1543175165954; 
	Sun, 25 Nov 2018 11:46:05 -0800 (PST)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27])
	by smtp.gmail.com with ESMTPSA id b2sm7879750ede.30.2018.11.25.11.46.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Nov 2018 11:46:05 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Nov 2018 20:45:03 +0100
Message-Id: <20181125194503.24555-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181125194503.24555-1-adrian.freihofer@gmail.com>
References: <20181125194503.24555-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/1] systemd: fix PN-container package splitting
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
X-List-Received-Date: Sun, 25 Nov 2018 19:46:06 -0000
Content-Transfer-Encoding: 8bit

- Fix package splitting for services installed with
  systemd-container. Some files have been installed with systemd
  package instead of systemd-container package. (*.service,
  *.socket, *.html...)
- Split journal-upload, journal-remote, journal-gatewayd into
  separate packages. These services are not strictly related to
  nspawn containers. Remote logging is now possible without
  installing all the container stuff.
- systemd-container package rrecommends journal-upload, journal-
  remote, journal-gatewayd packages.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 61 ++++++++++++++++++++----
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index e19a8babce..c53ce0d78e 100644
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
@@ -397,6 +436,12 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
                         "
 
+RRECOMMENDS_${PN}-container += "\
+                         ${PN}-journal-upload \
+                         ${PN}-journal-remote \
+                         ${PN}-journal-gatewayd \
+                        "
+
 FILES_${PN}-extra-utils = "\
                         ${base_bindir}/systemd-escape \
                         ${base_bindir}/systemd-inhibit \
-- 
2.19.1


