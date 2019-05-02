Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D7B3A7D777
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:10:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c5so5242159wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 14:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sqUx7ATSR7vb87GRiYSLhziDHrrhR/EDbK17I0UPPmg=;
	b=VgnY3PBfqmR6PBTvOVg5T/amCkAWF0kI2R2tO2LPUSJ4USaho7BigmHNWiOa/SEuA6
	hnesxZqZYMogmyOzYSZBpbzE55DIuUCRgp3facExVEFO5TOvkzW+y05efXtJ3a6WZZoX
	jWEipH3pEeAnlglnTm8oUelcELj1iZrh8XORXcHIvC3Xo6fjXEL+bcV57NGwAxIQtMJG
	BK1WoYZPsSHJnvvdcTUaGUBBoaT0+BrsurJhrArK3Gxx08tdDJ9/dktFm+ip2pOVD1iu
	Djla/XalyySKEezO12XqBEiF4srBuaC30G29zsV3PvZ/kq7JtCVJk+nUb4Mtm+4Ywj7e
	2clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sqUx7ATSR7vb87GRiYSLhziDHrrhR/EDbK17I0UPPmg=;
	b=aMZ8jkKa8ogHGazLYFFRqHbBOf7IXDF3yPMXiAU8Hh1RZXEb2X6NFfd/rzzn2UH2U7
	vELLT3UtDGS3sTGc2TIXVHb4RFLaynKIsiyBG61yCYbwsx1GyZohw56GxRliq7yGh+bb
	pdz7N2mj7TUbcTJNTNK+tDGHQPcoacZT6EBX+amgp41kws2B+BX/g/Vnc9UIInhKQzMw
	8CHwCmPd67L3Y1Rflsg+lSmU22QLSaSSlPfOLZLm5SMEsOuJ+HqtU/87Y77xnSdNxHhQ
	QxsVBhC07oYPQeYdKNxK4FBRqxp0a+7bLuvtDLgEaYejoHtYH3hvE9g7hPtqtkREiDEJ
	54sQ==
X-Gm-Message-State: APjAAAUjUJB6y9+WiKGD6e3RO+CBZWsI2wlo1GVNh7IwGjsSgAg7fmQP
	+QDeVLisLTk0kkFxS98+FtDOpThy
X-Google-Smtp-Source: APXvYqx//+B+jOB2acbqV4kCRpbX95a40L0LyTuez8yV9FwdD0sKJ3o75rM3EuYQodHVU5hfqSn17Q==
X-Received: by 2002:a5d:430f:: with SMTP id h15mr4204995wrq.132.1556831407453; 
	Thu, 02 May 2019 14:10:07 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id y184sm523486wmg.7.2019.05.02.14.10.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 14:10:06 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 22:09:40 +0100
Message-Id: <20190502210944.62696-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502210944.62696-1-alex.kiernan@gmail.com>
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
Subject: [PATCH v6 2/6] systemd: do not create machine-id
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
X-List-Received-Date: Thu, 02 May 2019 21:10:08 -0000

From: Jonas Bonn <jonas@norrbonn.se>

There is no reason to have an emtpy machine-id as part of the systemd
package.  Either:

i)  the filesystem is writable and the file will be created
automatically; or
ii) the filesystem is read-only, in which case the empty machine-id file
should be created as part of the read-only-rootfs tweaks.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v6: None
Changes in v5:
- install default preset distribution policy of "enable nothing"

 meta/classes/rootfs-postcommands.bbclass            | 6 ++++++
 meta/recipes-core/systemd/systemd-conf_242.bb       | 9 ++-------
 meta/recipes-core/systemd/systemd/99-default.preset | 1 +
 meta/recipes-core/systemd/systemd_242.bb            | 6 +++++-
 4 files changed, 14 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/99-default.preset

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index bde58ad6cd36..89f8efd32363 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -126,6 +126,12 @@ read_only_rootfs_hook () {
 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
 		fi
 	fi
+
+	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
+	# Create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+		touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
+	fi
 }
 
 #
diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb b/meta/recipes-core/systemd/systemd-conf_242.bb
index 9bb27fd96d9c..7fe2e1105bef 100644
--- a/meta/recipes-core/systemd/systemd-conf_242.bb
+++ b/meta/recipes-core/systemd/systemd-conf_242.bb
@@ -7,14 +7,13 @@ DefaultTimeoutStartSec setting."
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CONFFILES_${PN} = "${sysconfdir}/machine-id \
-${sysconfdir}/systemd/coredump.conf \
+CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
 ${sysconfdir}/systemd/journald.conf \
 ${sysconfdir}/systemd/logind.conf \
 ${sysconfdir}/systemd/system.conf \
 ${sysconfdir}/systemd/user.conf"
 
-FILES_${PN} = "${sysconfdir}/machine-id ${sysconfdir}/systemd"
+FILES_${PN} = "${sysconfdir}/systemd"
 
 do_configure[noexec] = '1'
 do_compile[noexec] = '1'
@@ -23,10 +22,6 @@ do_install() {
 	rm -rf ${D}/${sysconfdir}/systemd
 	install -d ${D}/${sysconfdir}/systemd
 
-	# Create machine-id
-	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
-	touch ${D}${sysconfdir}/machine-id
-
 	install -m 0644 ${S}/src/coredump/coredump.conf ${D}${sysconfdir}/systemd/coredump.conf
 
 	install -m 0644 ${S}/src/journal/journald.conf ${D}${sysconfdir}/systemd/journald.conf
diff --git a/meta/recipes-core/systemd/systemd/99-default.preset b/meta/recipes-core/systemd/systemd/99-default.preset
new file mode 100644
index 000000000000..1f29b50597f0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/99-default.preset
@@ -0,0 +1 @@
+disable *
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 9f194f2b6ca1..7d1b0ec13a44 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
+           file://99-default.preset \
            "
 
 # patches needed by musl
@@ -277,7 +278,6 @@ do_install() {
 	fi
 
 	# conf files are handled by systemd-conf
-	rm -f ${D}${sysconfdir}/machine-id
 	rm -f ${D}${sysconfdir}/systemd/coredump.conf
 	rm -f ${D}${sysconfdir}/systemd/journald.conf
 	rm -f ${D}${sysconfdir}/systemd/logind.conf
@@ -287,6 +287,10 @@ do_install() {
 	# duplicate udevadm for postinst script
 	install -d ${D}${libexecdir}
 	ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
+
+	# install default policy for presets
+	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
+	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
 }
 
 
-- 
2.17.1


