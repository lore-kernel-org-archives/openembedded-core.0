Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.23238.1599747557894470756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 07:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08AEIjxB031562
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 07:19:06 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Sep 2020 07:18:44 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] dhcpcd: 9.1.4 -> 9.2.0
Date: Thu, 10 Sep 2020 22:18:39 +0800
Message-ID: <20200910141839.13600-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade dhcpcd from 9.1.4 to 9.2.0. And add systemd services files
dhcpcd.service and dhcpcd@.service from Fedora:

https://src.fedoraproject.org/rpms/dhcpcd/tree/master

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{dhcpcd_9.1.4.bb => dhcpcd_9.2.0.bb}      | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.1.4.bb => dhcpcd_9.2.0.bb} (60%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
similarity index 60%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
index defd3420f0..151bdf3776 100644
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
 
@@ -25,4 +30,11 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
 
 EXTRA_OECONF = "--enable-ipv4"
 
+do_install_append () {
+    # install systemd unit files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/dhcpcd*.service ${D}${systemd_unitdir}/system
+}
+
+
 FILES_${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
-- 
2.17.1

