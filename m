Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38B66712AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsOWJ004011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:54:00 +0800
Message-ID: <50321ac97381f5d3aea180c0b6506747a5c392c3.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/26] cups: add systemd support
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:24 -0000
Content-Type: text/plain

Add systemd unit files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc          | 18 +++++++++++++++++-
 meta/recipes-extended/cups/cups/cups.path    |  8 ++++++++
 meta/recipes-extended/cups/cups/cups.service | 10 ++++++++++
 meta/recipes-extended/cups/cups/cups.socket  |  8 ++++++++
 4 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cups/cups/cups.path
 create mode 100644 meta/recipes-extended/cups/cups/cups.service
 create mode 100644 meta/recipes-extended/cups/cups/cups.socket

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index d29b875..42a4b46 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -8,15 +8,20 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
            file://cups-no-gcrypt.patch \
+           file://cups.socket \
+           file://cups.path \
+           file://cups.service \
 	  "
 
 LEAD_SONAME = "libcupsdriver.so"
 
-inherit autotools-brokensep binconfig useradd
+inherit autotools-brokensep binconfig useradd systemd
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system lpadmin"
 
+SYSTEMD_SERVICE_${PN} = "cups.socket cups.path cups.service"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
@@ -71,6 +76,17 @@ fakeroot do_install () {
 	# Remove /var/run from package as cupsd will populate it on startup
 	rm -fr ${D}/${localstatedir}/run
 	rmdir ${D}/${libdir}/${BPN}/driver
+
+	# Remove sysinit script and symlinks
+	rm -rf ${D}${sysconfdir}/init.d/
+	rm -rf ${D}${sysconfdir}/rc*
+
+	# Install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/cups.socket ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/cups.path ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/cups.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/cups.service
 }
 
 python do_package_append() {
diff --git a/meta/recipes-extended/cups/cups/cups.path b/meta/recipes-extended/cups/cups/cups.path
new file mode 100644
index 0000000..de8cc57
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/cups.path
@@ -0,0 +1,8 @@
+[Unit]
+Description=CUPS Printer Service Spool
+
+[Path]
+PathExistsGlob=/var/spool/cups/d*
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/cups/cups/cups.service b/meta/recipes-extended/cups/cups/cups.service
new file mode 100644
index 0000000..7d3e839
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/cups.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=CUPS Printing Service
+
+[Service]
+ExecStart=@SBINDIR@/cupsd -f
+PrivateTmp=true
+
+[Install]
+Also=cups.socket cups.path
+WantedBy=printer.target
diff --git a/meta/recipes-extended/cups/cups/cups.socket b/meta/recipes-extended/cups/cups/cups.socket
new file mode 100644
index 0000000..3314870
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/cups.socket
@@ -0,0 +1,8 @@
+[Unit]
+Description=CUPS Printing Service Sockets
+
+[Socket]
+ListenStream=/var/run/cups/cups.sock
+
+[Install]
+WantedBy=sockets.target
-- 
1.9.1


