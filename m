Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.960.1585808803508136454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 23:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0326QNZJ018547
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Apr 2020 23:26:33 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Apr 2020 23:26:12 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] dhcp: add RDEPENDS for dhcp-client
Date: Thu, 2 Apr 2020 14:26:09 +0800
Message-ID: <1585808769-176932-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585808769-176932-1-git-send-email-mingli.yu@windriver.com>
References: <1585808769-176932-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add iproute2 RDEPENDS for dhcp-client as
/sbin/dhclient-systemd-wrapper which called
by dhclient.service depends on ip command which
provided by iproute2 package when systemd enabled
in DISTRO_FEATURES.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index c4697be..d46130d 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -100,6 +100,7 @@ do_install_append () {
 PACKAGES += "dhcp-libs dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
 
 PACKAGES_remove = "${PN}"
+RDEPENDS_${PN}-client += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'iproute2', '', d)}"
 RDEPENDS_${PN}-dev = ""
 RDEPENDS_${PN}-staticdev = ""
 FILES_${PN}-libs = "${libdir}/libdhcpctl.so.0* ${libdir}/libomapi.so.0* ${libdir}/libdhcp.so.0*"
-- 
2.7.4

