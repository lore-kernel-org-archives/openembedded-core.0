Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.9474.1600161332325958244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08F9FVXT020121
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 02:15:31 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 15 Sep
 2020 02:15:30 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] dhcpcd: add --dbdir and --disable-privesp to EXTRA_OECONF
Date: Tue, 15 Sep 2020 17:15:23 +0800
Message-ID: <20200915091523.31005-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

* Disable service start at boot time. This may conflict with connman.
* Set --dbdir to /var/lib/dhcpcd rather than /var/db/dhcpcd to satisfy
  FHS compliance.
* Pass --disable-privsep to configure to eliminate dhcpcd start warning:
  no such user dhcpcd.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
index 292cb5b008..4b5f4d7766 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
@@ -22,13 +22,14 @@ SRC_URI[sha256sum] = "fcb2d19672d445bbfd38678fdee4f556ef967a3ea6bd81092d10545df2
 inherit pkgconfig autotools-brokensep systemd
 
 SYSTEMD_SERVICE_${PN} = "dhcpcd.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
 
-EXTRA_OECONF = "--enable-ipv4"
+EXTRA_OECONF = "--enable-ipv4 --disable-privsep --dbdir=${localstatedir}/lib/${BPN}"
 
 do_install_append () {
     # install systemd unit files
-- 
2.17.1

