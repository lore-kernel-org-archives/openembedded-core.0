Received: from outbound-relay9.guardedhost.com (outbound-relay9.guardedhost.com [216.239.133.221])
 by mx.groups.io with SMTP id smtpd.web09.3028.1608762612611064552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 14:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.221, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (mx03.guardedhost.com [IPv6:2607:fe90:1:1::54:1])
	by outbound-relay1.guardedhost.com (Postfix) with ESMTP id 4D1SZW6QGMz4x7yG;
	Wed, 23 Dec 2020 22:30:11 +0000 (GMT)
Received: from alaperry-ubuntu-build.43vr1hlvonre5le4v1ueig2kyb.xx.internal.cloudapp.net (unknown [52.151.43.11])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPSA id 4D1SZW0yQNz2xpy;
	Wed, 23 Dec 2020 22:30:11 +0000 (GMT)
From: "Alan Perry" <alanp@snowmoose.com>
To: openembedded-core@lists.openembedded.org
Cc: Alan Perry <alanp@snowmoose.com>
Subject: [PATCH] iproute2: Add subpackage for rdma command
Date: Wed, 23 Dec 2020 22:29:50 +0000
Message-Id: <20201223222950.15239-1-alanp@snowmoose.com>
X-Mailer: git-send-email 2.17.1
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: 6B71F082-456E-11EB-8489-8B021E24E163
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx3.omnis.com
X-Virus-Status: Clean

The rdma command is part of iproute2 and is used to query or set the RDMA
configuration where applicable. This patch makes it available as an
iproute2 subpackage.

Signed-off-by: Alan Perry <alanp@snowmoose.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 7a22fe9252..85e9212eab 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -15,12 +15,13 @@ inherit update-alternatives bash-completion pkgconfig
 
 CLEANBROKEN = "1"
 
-PACKAGECONFIG ??= "tipc elf devlink"
+PACKAGECONFIG ??= "tipc elf devlink rdma"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 PACKAGECONFIG[elf] = ",,elfutils,"
 PACKAGECONFIG[devlink] = ",,libmnl,"
+PACKAGECONFIG[rdma] = ",,libmnl,"
 
-IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}"
+IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink rdma tipc', d)}"
 
 EXTRA_OEMAKE = "\
     CC='${CC}' \
@@ -58,6 +59,7 @@ PACKAGES =+ "\
     ${PN}-ss \
     ${PN}-tc \
     ${PN}-tipc \
+    ${PN}-rdma \
 "
 
 FILES_${PN}-tc = "${base_sbindir}/tc* \
@@ -72,6 +74,7 @@ FILES_${PN}-nstat = "${base_sbindir}/nstat"
 FILES_${PN}-ss = "${base_sbindir}/ss"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
 FILES_${PN}-devlink = "${base_sbindir}/devlink"
+FILES_${PN}-rdma = "${base_sbindir}/rdma"
 
 ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-- 
2.17.1

