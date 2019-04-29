Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id D663D7DBCA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:43:41 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 26so14544959wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=380WDrcEzDEI1/Gomz6ZHkd9T4+eT3sDio0rVfP4dGM=;
	b=igHnI8RiABLS1ozZK8NbtwuOQW/temtYgufFVu9wagtFK03YykKckLpQCBUcwZfHV7
	FcaIAQU7bmNGckiS5TkWkUjg/wTpAy9xCmEhlSzGwi7SN9Gr2zgcDJ9wn36EWmEehlEN
	S3dYM5HYfyWy1KOi8ziNiq/K4fH8cyM3iqr/7DoadrL3FZmFqpX7Ahh9I5FlsQaAlNPP
	ZHQOdQNiRzA6q6WKH5fe4Cd2/wi1YA7H7F3mUAcSwchFZWFEoSKOL/kBW8nsjb9/IbTz
	InLangALrtOFBh6fExxC+n58dY7lV8UO9qBEbz/2GLL4tjgfkKibh3oNnxBSJQLnffEU
	nHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=380WDrcEzDEI1/Gomz6ZHkd9T4+eT3sDio0rVfP4dGM=;
	b=lqkquudmCNX1JyGByk8Cz8e3vmtU7PNR9KaILw5vKaquiSfOLxJ+pEiFkSZMppBFvm
	6UXobD4R/FfYSrPVz19+2M3TcqfS3qugaVhd/mXKT3sFq+MOp/aXpUOC9SjL0Eug6G+b
	9Pkma7fnjsn13OF76IS2TvaR04T5PzQOVAzqpkK2qRWPjEaf3Razaudd1PkZXSqL6mqB
	BcvxZFtKxpuXyPI+WEeCQ3NydVu3ECAcxqJ+Etx6u1qZZDEaYClTSEk82rjBj5F9I9/O
	GPipi0oL6TSZbFxnNuxFQwuce65vmIg/BuuXbPlFb43eRYp8ZTfSgXvlIP2Qdz7UmBGX
	+YqA==
X-Gm-Message-State: APjAAAU5f34DGqcv23g26SKZlVg/876aAAfivG1ri8rHREFK1bm5GVbj
	E0WFvYN1m0DEwSqYJMNdw2gZaNu2lPA=
X-Google-Smtp-Source: APXvYqyf/OO0LvKF74WiBzdTv3oPLfkvyNR56HjtPxv3yOTbgn94ZX+X4tOEfSw1MK0oUBRMr5y6Sw==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr16627328wmc.130.1556549022155; 
	Mon, 29 Apr 2019 07:43:42 -0700 (PDT)
Received: from localhost.localdomain ([89.197.133.108])
	by smtp.gmail.com with ESMTPSA id y70sm9452860wmc.8.2019.04.29.07.43.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 07:43:41 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 15:43:21 +0100
Message-Id: <20190429144325.63744-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429144325.63744-1-alex.kiernan@gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
Subject: [PATCH v5 2/6] systemd: do not create machine-id
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
X-List-Received-Date: Mon, 29 Apr 2019 14:43:42 -0000

From: Jonas Bonn <jonas@norrbonn.se>

There is no reason to have an emtpy machine-id as part of the systemd
package.  Either:

i)  the filesystem is writable and the file will be created
automatically; or
ii) the filesystem is read-only, in which case the empty machine-id file
should be created as part of the read-only-rootfs tweaks.

Note we need a default distribution preset policy of "enable nothing" in
order to avoid all units being activated as part of `systemctl
preset-all`.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v5:
- install default preset distribution policy of "enable nothing"
- rebased for systemd 242

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


