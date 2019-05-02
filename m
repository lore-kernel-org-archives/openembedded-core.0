Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 411C37D744
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:10:09 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p16so4389477wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 14:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8/gWCfkv7Ydj0Mh+aAhq8jThhePkm7lupMwjPTIivCE=;
	b=Kx6hSTZX53/RbmnE7jU/fc2yc14ZS5Eyp+RBIMR05wcS59Q4/iao9GN1CDp3LaAwME
	YiX6OVNJlf60OCXF6KzGsMpCvsmv6wE37KZy2Rvl2AmGenJmhSh3WY4NMrp7zTDPzPdR
	/nKA0GdHRIU+uZZ+KlTokRYNzmvQdtp3kFdI1FwEuyLh+DFNxzEvoh/ZwZFQQn2fXnr8
	M3+exTaRbfP8c0LwYm6tUd2uuV00bJ1AqkhpUFx9gZHNHxmU/fAeWakNMBfu9RsCgl5p
	XadUYZxslKT3In1Qj7r6fYoGBfo3zQW7OQ7QNfSNcz+X2g8hjX4Bmo5i16TNHCOCXfs3
	6HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8/gWCfkv7Ydj0Mh+aAhq8jThhePkm7lupMwjPTIivCE=;
	b=jCjJ8S2EvVeH0FfpvzIyFMGieZ8qc/q3XUliCwYlbOikXb/OSehpZM4ADo6UcC3HSq
	SZSxNIVBwf9dbo7PYUWlmAXFHCfBT7D2TTtkuHHbTCb3Td/Ei4khF3XFPFLQ7cKJ9bUx
	T7Cb0vrGM+BJr+4hIttudys8Rrp8hnUJ6YTDkqUb6iogl9Wzh277ixKhhlKRJQVlZP9Z
	NOyyKSRkKU2i4HqkmCEBLNGonBKgFHta6pJKPI8HKTr/JjnUEZFDU2hL/HOiEFGGJHjh
	MkMSZruDfGu9rBJ+w3BLYdN+fViu+QcVKXsGiAvujz367PzHKgB+UNTff6bPyoRqrtgy
	jwHw==
X-Gm-Message-State: APjAAAUgEmDKTCIlvFigez9rREyzMtTSU+y5wXCbt7TrjKyYXRjPmsTS
	qDQuPpAlO8jHxceElK/m/bYYts33
X-Google-Smtp-Source: APXvYqyjvb88sdmwnxwYQSmZWZ/qzChmz1dPgjbWn5tXWneZbF9np9MZAR1pc222YhbeOiLnD8+UWA==
X-Received: by 2002:a1c:2104:: with SMTP id h4mr3740202wmh.146.1556831409863; 
	Thu, 02 May 2019 14:10:09 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id y184sm523486wmg.7.2019.05.02.14.10.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 14:10:09 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 22:09:41 +0100
Message-Id: <20190502210944.62696-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502210944.62696-1-alex.kiernan@gmail.com>
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
Cc: Alex Kiernan <alex.kiernan@hivehome.com>
Subject: [PATCH v6 3/6] systemd-conf: simplify creation of machine-specific configuration
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
X-List-Received-Date: Thu, 02 May 2019 21:10:09 -0000

From: Alex Kiernan <alex.kiernan@hivehome.com>

The configuration files that systemd installs are just skeletons
detailing the available options and their default values.  The
recommended means of changing the configuration is to provide snippets
in configuration directories.  For example, journald.conf settings are
best set in /usr/lib/system.d/journald.conf.d/ and can be overridden by
the user by providing overriding snippets in
/etc/systemd/journald.conf.d/.

The systemd-conf package is just providing machine-specific overrides
for some systemd defaults.

This patch restores the installation of config files by systemd and
reduces systemd-conf to just providing the config snippets in
/usr/lib/systemd/*.conf.d.  This simpilfies the systemd-conf recipe
considerably since it now just sets up a couple of text files and
doesn't even need access to the systemd source anymore.

License-Update: configuration snippets licensing is independent of
systemd licensing

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v6:
- switch configuration to simple overrides in /usr/lib/systemd/*.conf.d
- make systemd RRECOMMENDS rather than RDEPENDS on systemd-conf

Changes in v5: None

 .../systemd/systemd-conf/journald.conf        |  3 +
 .../systemd/systemd-conf/logind.conf          |  2 +
 .../systemd/systemd-conf/system.conf          |  2 +
 .../systemd/systemd-conf/system.conf-qemuall  |  3 +
 meta/recipes-core/systemd/systemd-conf_242.bb | 56 +++++++------------
 meta/recipes-core/systemd/systemd_242.bb      | 19 ++++---
 6 files changed, 41 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd-conf/journald.conf
 create mode 100644 meta/recipes-core/systemd/systemd-conf/logind.conf
 create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf
 create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf-qemuall

diff --git a/meta/recipes-core/systemd/systemd-conf/journald.conf b/meta/recipes-core/systemd/systemd-conf/journald.conf
new file mode 100644
index 000000000000..fd4d969fa7c3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-conf/journald.conf
@@ -0,0 +1,3 @@
+[Journal]
+ForwardToSyslog=yes
+RuntimeMaxUse=64M
diff --git a/meta/recipes-core/systemd/systemd-conf/logind.conf b/meta/recipes-core/systemd/systemd-conf/logind.conf
new file mode 100644
index 000000000000..bf7f6920fa70
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-conf/logind.conf
@@ -0,0 +1,2 @@
+[Login]
+KillUserProcesses=yes
diff --git a/meta/recipes-core/systemd/systemd-conf/system.conf b/meta/recipes-core/systemd/systemd-conf/system.conf
new file mode 100644
index 000000000000..554cab26c244
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-conf/system.conf
@@ -0,0 +1,2 @@
+[Manager]
+DefaultMemoryAccounting=yes
diff --git a/meta/recipes-core/systemd/systemd-conf/system.conf-qemuall b/meta/recipes-core/systemd/systemd-conf/system.conf-qemuall
new file mode 100644
index 000000000000..741be27cb44c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-conf/system.conf-qemuall
@@ -0,0 +1,3 @@
+[Manager]
+# Change DefaultTimeoutStartSec from 90s to 240s
+DefaultTimeoutStartSec = 240s
diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb b/meta/recipes-core/systemd/systemd-conf_242.bb
index 7fe2e1105bef..96beea53a73a 100644
--- a/meta/recipes-core/systemd/systemd-conf_242.bb
+++ b/meta/recipes-core/systemd/systemd-conf_242.bb
@@ -1,48 +1,32 @@
-require systemd.inc
-
 SUMMARY = "Systemd system configuration"
 DESCRIPTION = "Systemd may require slightly different configuration for \
 different machines.  For example, qemu machines require a longer \
 DefaultTimeoutStartSec setting."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
-${sysconfdir}/systemd/journald.conf \
-${sysconfdir}/systemd/logind.conf \
-${sysconfdir}/systemd/system.conf \
-${sysconfdir}/systemd/user.conf"
-
-FILES_${PN} = "${sysconfdir}/systemd"
-
-do_configure[noexec] = '1'
-do_compile[noexec] = '1'
+SRC_URI = "\
+    file://journald.conf \
+    file://logind.conf \
+    file://system.conf \
+    file://system.conf-qemuall \
+"
 
 do_install() {
-	rm -rf ${D}/${sysconfdir}/systemd
-	install -d ${D}/${sysconfdir}/systemd
-
-	install -m 0644 ${S}/src/coredump/coredump.conf ${D}${sysconfdir}/systemd/coredump.conf
-
-	install -m 0644 ${S}/src/journal/journald.conf ${D}${sysconfdir}/systemd/journald.conf
-	# Enable journal to forward message to syslog daemon
-	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
-	# Set the maximium size of runtime journal to 64M as default
-	sed -i -e 's/.*RuntimeMaxUse.*/RuntimeMaxUse=64M/' ${D}${sysconfdir}/systemd/journald.conf
-
-	install -m 0644 ${S}/src/login/logind.conf.in ${D}${sysconfdir}/systemd/logind.conf
-	# Set KILL_USER_PROCESSES to yes
-	sed -i -e 's/@KILL_USER_PROCESSES@/yes/' ${D}${sysconfdir}/systemd/logind.conf
-
-	install -m 0644 ${S}/src/core/system.conf.in ${D}${sysconfdir}/systemd/system.conf
-	# Set MEMORY_ACCOUNTING_DEFAULT to yes
-	sed -i -e 's/@MEMORY_ACCOUNTING_DEFAULT@/yes/' ${D}${sysconfdir}/systemd/system.conf
-
-	install -m 0644 ${S}/src/core/user.conf ${D}${sysconfdir}/systemd/user.conf
+	install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
+	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
+	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
 }
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install_append_qemuall() {
-	# Change DefaultTimeoutStartSec from 90s to 240s
-	echo "DefaultTimeoutStartSec = 240s" >> ${D}${sysconfdir}/systemd/system.conf
+	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
 }
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} = "\
+    ${systemd_unitdir}/journald.conf.d/ \
+    ${systemd_unitdir}/logind.conf.d/ \
+    ${systemd_unitdir}/system.conf.d/ \
+"
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 7d1b0ec13a44..a6b39d57e8f9 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -277,13 +277,6 @@ do_install() {
 		fi
 	fi
 
-	# conf files are handled by systemd-conf
-	rm -f ${D}${sysconfdir}/systemd/coredump.conf
-	rm -f ${D}${sysconfdir}/systemd/journald.conf
-	rm -f ${D}${sysconfdir}/systemd/logind.conf
-	rm -f ${D}${sysconfdir}/systemd/system.conf
-	rm -f ${D}${sysconfdir}/systemd/user.conf
-
 	# duplicate udevadm for postinst script
 	install -d ${D}${libexecdir}
 	ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
@@ -486,6 +479,15 @@ FILES_${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-cgroups-agent \
 "
 
+CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
+	${sysconfdir}/systemd/journald.conf \
+	${sysconfdir}/systemd/logind.conf \
+	${sysconfdir}/systemd/system.conf \
+	${sysconfdir}/systemd/user.conf \
+	${sysconfdir}/systemd/resolved.conf \
+	${sysconfdir}/systemd/timesyncd.conf \
+"
+
 FILES_${PN} = " ${base_bindir}/* \
                 ${base_sbindir}/shutdown \
                 ${base_sbindir}/halt \
@@ -549,7 +551,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
-RDEPENDS_${PN} += "volatile-binds update-rc.d systemd-conf"
+RDEPENDS_${PN} += "volatile-binds update-rc.d"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'libnss-myhostname', '', d)}"
 
 RRECOMMENDS_${PN} += "systemd-extra-utils \
@@ -557,6 +559,7 @@ RRECOMMENDS_${PN} += "systemd-extra-utils \
                       e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
                       os-release \
+                      systemd-conf \
 "
 
 INSANE_SKIP_${PN} += "dev-so libdir"
-- 
2.17.1


