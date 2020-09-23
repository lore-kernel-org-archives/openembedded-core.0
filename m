Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.9567.1600854462897016970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 02:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08N9kbhm009334
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 02:46:57 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 23 Sep
 2020 02:46:29 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross@burtonini.com>, <ricardo@foundries.io>
Subject: [PATCH 2/4] dhcpcd: set --runstatedir to /run
Date: Wed, 23 Sep 2020 17:45:46 +0800
Message-ID: <20200923094548.13448-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923094548.13448-1-yi.zhao@windriver.com>
References: <20200923094548.13448-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Set --runstatedir to /run/dhcpcd rather than /var/run/dhcpcd

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb       | 1 +
 meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
index 3e1a83912a..557e15128e 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
@@ -30,6 +30,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
 
 EXTRA_OECONF = "--enable-ipv4 \
                 --dbdir=${localstatedir}/lib/${BPN} \
+                --runstatedir=/run \
                "
 
 do_install_append () {
diff --git a/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service b/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
index c81bb05ea5..3543e6c3d2 100644
--- a/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
+++ b/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
@@ -7,7 +7,7 @@ After=sys-subsystem-net-devices-%i.device
 
 [Service]
 Type=forking
-PIDFile=/run/dhcpcd-%I.pid
+PIDFile=/run/dhcpcd/%I.pid
 ExecStart=/usr/sbin/dhcpcd -q %I
 ExecStop=/usr/sbin/dhcpcd -x %I
 
-- 
2.17.1

