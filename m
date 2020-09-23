Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.9548.1600854394250484203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 02:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08N9kOe3004728
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 02:46:24 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 23 Sep
 2020 02:46:23 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross@burtonini.com>, <ricardo@foundries.io>
Subject: [PATCH 1/4] dhcpcd: pass --dbdir to EXTRA_OECONF to set database directory
Date: Wed, 23 Sep 2020 17:45:45 +0800
Message-ID: <20200923094548.13448-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923094548.13448-1-yi.zhao@windriver.com>
References: <20200923094548.13448-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Set --dbdir to /var/lib/dhcpcd rather than /var/db/dhcpcd to satisfy FHS
compliance

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
index 292cb5b008..3e1a83912a 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
@@ -28,7 +28,9 @@ PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
 
-EXTRA_OECONF = "--enable-ipv4"
+EXTRA_OECONF = "--enable-ipv4 \
+                --dbdir=${localstatedir}/lib/${BPN} \
+               "
 
 do_install_append () {
     # install systemd unit files
-- 
2.17.1

