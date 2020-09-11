Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.4028.1599788744413242686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08B1jXct029350
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 18:45:39 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Sep 2020 18:45:33 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/1] dhcpcd: 9.1.4 -> 9.2.0
Date: Fri, 11 Sep 2020 09:45:29 +0800
Message-ID: <20200911014529.5996-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200911014529.5996-1-kai.kang@windriver.com>
References: <20200911014529.5996-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade dhcpcd from 9.1.4 to 9.2.0. And add systemd services files
dhcpcd.service and dhcpcd@.service from Fedora:

https://src.fedoraproject.org/rpms/dhcpcd/tree/master

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{dhcpcd_9.1.4.bb => dhcpcd_9.2.0.bb}      | 19 +++++++++++++++----
 .../dhcpcd/files/dhcpcd.service               | 10 ++++++++++
 .../dhcpcd/files/dhcpcd@.service              | 15 +++++++++++++++
 3 files changed, 40 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.1.4.bb => dhcpcd_9.2.0.bb} (61%)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
similarity index 61%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
index defd3420f0..292cb5b008 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
@@ -11,12 +11,17 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9674cc803c5d71306941e6e8b5c002f2"
 
 UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
-SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
-           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
+SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
+           file://dhcpcd.service \
+           file://dhcpcd@.service \
+           "
 
-SRC_URI[sha256sum] = "5fe133e5497d8af6d26bd6e6b8dd48ab12d124d6cc4cefe6de6536ff97f76820"
+SRC_URI[sha256sum] = "fcb2d19672d445bbfd38678fdee4f556ef967a3ea6bd81092d10545df2cb9666"
 
-inherit pkgconfig autotools-brokensep
+inherit pkgconfig autotools-brokensep systemd
+
+SYSTEMD_SERVICE_${PN} = "dhcpcd.service"
 
 PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
@@ -25,4 +30,10 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
 
 EXTRA_OECONF = "--enable-ipv4"
 
+do_install_append () {
+    # install systemd unit files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/dhcpcd*.service ${D}${systemd_unitdir}/system
+}
+
 FILES_${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
diff --git a/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service b/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
new file mode 100644
index 0000000000..86b5a43c37
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=A minimalistic network configuration daemon with DHCPv4, rdisc and DHCPv6 support
+Wants=network.target
+Before=network.target
+
+[Service]
+ExecStart=/usr/sbin/dhcpcd -q --nobackground
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service b/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
new file mode 100644
index 0000000000..c81bb05ea5
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=dhcpcd on %I
+Wants=network.target
+Before=network.target
+BindsTo=sys-subsystem-net-devices-%i.device
+After=sys-subsystem-net-devices-%i.device
+
+[Service]
+Type=forking
+PIDFile=/run/dhcpcd-%I.pid
+ExecStart=/usr/sbin/dhcpcd -q %I
+ExecStop=/usr/sbin/dhcpcd -x %I
+
+[Install]
+WantedBy=multi-user.target
-- 
2.17.1

