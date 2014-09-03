Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D940D713DA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 07:09:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8379biq023251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 00:09:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 00:09:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 15:09:10 +0800
Message-ID: <dbccb785bf878ca5f37c1caa1e53ccff0f7a5c8d.1409728004.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409728004.git.Qi.Chen@windriver.com>
References: <cover.1409728004.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/25] cups: add systemd support
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
X-List-Received-Date: Wed, 03 Sep 2014 07:09:36 -0000
Content-Type: text/plain

Add systemd unit files.

Also remove sysvinit related files if 'sysvinit' is not in
DISTRO_FEATURES.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc          | 20 +++++++++++++++++++-
 meta/recipes-extended/cups/cups/cups.path    |  8 ++++++++
 meta/recipes-extended/cups/cups/cups.service | 10 ++++++++++
 meta/recipes-extended/cups/cups/cups.socket  |  8 ++++++++
 4 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cups/cups/cups.path
 create mode 100644 meta/recipes-extended/cups/cups/cups.service
 create mode 100644 meta/recipes-extended/cups/cups/cups.socket

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 162b3fd..fbdc48e 100644
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
@@ -71,6 +76,19 @@ fakeroot do_install () {
 	# Remove /var/run from package as cupsd will populate it on startup
 	rm -fr ${D}/${localstatedir}/run
 	rmdir ${D}/${libdir}/${BPN}/driver
+
+	# Remove sysinit script and symlinks if sysvinit is not in DISTRO_FEATURES
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)}; then
+	    rm -rf ${D}${sysconfdir}/init.d/
+	    rm -rf ${D}${sysconfdir}/rc*
+	fi
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


