Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.9562.1600854446737147724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 02:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08N9lM72012406
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 02:47:23 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 23 Sep
 2020 02:47:22 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross@burtonini.com>, <ricardo@foundries.io>
Subject: [PATCH 4/4] dhcpcd: disable service to start on boot automatically
Date: Wed, 23 Sep 2020 17:45:48 +0800
Message-ID: <20200923094548.13448-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923094548.13448-1-yi.zhao@windriver.com>
References: <20200923094548.13448-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

As the default network manager, connman has its own internal DHCP
implement. The dhcpcd may conflict with connman if the service start on
boot automatically.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
index 4344841b54..dd473cd815 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
@@ -22,6 +22,7 @@ SRC_URI[sha256sum] = "fcb2d19672d445bbfd38678fdee4f556ef967a3ea6bd81092d10545df2
 inherit pkgconfig autotools-brokensep systemd useradd
 
 SYSTEMD_SERVICE_${PN} = "dhcpcd.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
-- 
2.17.1

