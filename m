Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.7473.1600915320063846423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 19:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08O2fCPE010617
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 19:41:33 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 23 Sep
 2020 19:41:17 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>
Subject: [PATCH V3] dhcpcd: set service to conflict with connman
Date: Thu, 24 Sep 2020 10:41:14 +0800
Message-ID: <20200924024114.23741-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <dbad1eb0150a238cb46c129d55d45d026e5142b2.camel@linuxfoundation.org>
References: <dbad1eb0150a238cb46c129d55d45d026e5142b2.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

As the default network manager, connman has its own internal DHCP
implement. If run dhcpcd and connman simultaneously, they may conflict
with each other.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/dhcpcd/files/dhcpcd.service  | 1 +
 meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service b/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
index 86b5a43c37..bbed6d85c4 100644
--- a/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
+++ b/meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
@@ -2,6 +2,7 @@
 Description=A minimalistic network configuration daemon with DHCPv4, rdisc and DHCPv6 support
 Wants=network.target
 Before=network.target
+Conflicts=connman.service
 
 [Service]
 ExecStart=/usr/sbin/dhcpcd -q --nobackground
diff --git a/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service b/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
index 3543e6c3d2..389b076c38 100644
--- a/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
+++ b/meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service
@@ -4,6 +4,7 @@ Wants=network.target
 Before=network.target
 BindsTo=sys-subsystem-net-devices-%i.device
 After=sys-subsystem-net-devices-%i.device
+Conflicts=connman.service
 
 [Service]
 Type=forking
-- 
2.17.1

