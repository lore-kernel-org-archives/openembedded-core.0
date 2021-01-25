Received: from outbound-relay8.guardedhost.com (outbound-relay8.guardedhost.com [216.239.133.208])
 by mx.groups.io with SMTP id smtpd.web12.33500.1611559314241960888
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 23:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.208, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (mx02.guardedhost.com [IPv6:2607:fe90:1:1::53:1])
	by outbound-relay5.guardedhost.com (Postfix) with ESMTP id 4DPLsF5Mpyz8Tx;
	Mon, 25 Jan 2021 07:21:53 +0000 (GMT)
Received: from alaperry-ubuntu-build.43vr1hlvonre5le4v1ueig2kyb.xx.internal.cloudapp.net (unknown [52.151.43.11])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPSA id 4DPLsD6TB8z30M2;
	Mon, 25 Jan 2021 07:21:52 +0000 (GMT)
From: "Alan Perry" <alanp@snowmoose.com>
To: openembedded-core@lists.openembedded.org
Cc: Alan Perry <alanp@snowmoose.com>
Subject: [PATCH v2] iproute2: Add subpackage for rdma command
Date: Mon, 25 Jan 2021 07:21:19 +0000
Message-Id: <20210125072119.10063-1-alanp@snowmoose.com>
X-Mailer: git-send-email 2.17.1
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: FF93369E-5EDD-11EB-8241-D7E9943AA0FD
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx2.omnis.com
X-Virus-Status: Clean

The rdma command is part of iproute2 and is used to query or set the RDMA
configuration where applicable. This patch adds options to build it
and include it.

Signed-off-by: Alan Perry <alanp@snowmoose.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 6a5dafaa35..6c8eea6799 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -19,8 +19,9 @@ PACKAGECONFIG ??= "tipc elf devlink"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 PACKAGECONFIG[elf] = ",,elfutils,"
 PACKAGECONFIG[devlink] = ",,libmnl,"
+PACKAGECONFIG[rdma] = ",,libmnl,"
 
-IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}"
+IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc rdma', d)}"
 
 EXTRA_OEMAKE = "\
     CC='${CC}' \
@@ -59,6 +60,7 @@ IPROUTE2_PACKAGES =+ "\
     ${PN}-ss \
     ${PN}-tc \
     ${PN}-tipc \
+    ${PN}-rdma \
 "
 
 PACKAGE_BEFORE_PN = "${IPROUTE2_PACKAGES}"
@@ -77,6 +79,7 @@ FILES_${PN}-nstat = "${base_sbindir}/nstat"
 FILES_${PN}-ss = "${base_sbindir}/ss"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
 FILES_${PN}-devlink = "${base_sbindir}/devlink"
+FILES_${PN}-rdma = "${base_sbindir}/rdma"
 
 ALTERNATIVE_${PN}-ip = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-- 
2.17.1

