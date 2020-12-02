Received: from outbound-relay9.guardedhost.com (outbound-relay9.guardedhost.com [216.239.133.221])
 by mx.groups.io with SMTP id smtpd.web08.318.1606936301384302361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 11:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.221, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (mx04.guardedhost.com [IPv6:2607:fe90:1:1::55:1])
	by outbound-relay1.guardedhost.com (Postfix) with ESMTP id 4CmT984LqCz4xM3D;
	Wed,  2 Dec 2020 19:11:40 +0000 (GMT)
Received: from alaperry-ubuntu-build.43vr1hlvonre5le4v1ueig2kyb.xx.internal.cloudapp.net (unknown [52.151.43.11])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPSA id 4CmT976nqHz30cR;
	Wed,  2 Dec 2020 19:11:39 +0000 (GMT)
From: "Alan Perry" <alanp@snowmoose.com>
To: openembedded-core@lists.openembedded.org
Cc: Alan Perry <alanp@snowmoose.com>
Subject: [PATCH 1/2] iproute2: install tools to mirror install under Debian/Ubuntu
Date: Wed,  2 Dec 2020 19:11:23 +0000
Message-Id: <20201202191124.15903-1-alanp@snowmoose.com>
X-Mailer: git-send-email 2.17.1
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: 35282A5C-34D2-11EB-9213-961406491BCE
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx4.omnis.com
X-Virus-Status: Clean

Many scripts exist that expect the iproute2 tools to be found in
the same directories where they are found in Debian or Ubuntu.
For the iproute2 tools included in the iproute2 recipe, move
them to those directories or create links there. Also, add
bash-completion files as is done by Debian and Ubuntu.

Signed-off-by: Alan Perry <alanp@snowmoose.com>
---
 .../iproute2/iproute2.inc                     | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 403d264308..21f52f80bc 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -41,6 +41,21 @@ do_install () {
     install -d ${D}${datadir}
     mv ${D}/share/* ${D}${datadir}/ || true
     rm ${D}/share -rf || true
+
+    install -d ${D}${base_bindir}
+    ln -s /sbin/ip ${D}${base_bindir}/ip
+    mv ${D}${base_sbindir}/ss ${D}${base_bindir}/ss
+
+    install -d ${D}${bindir}
+    mv ${D}${base_sbindir}/nstat ${D}${bindir}/nstat
+    mv ${D}${base_sbindir}/lnstat ${D}${bindir}/lnstat
+    mv ${D}${base_sbindir}/ctstat ${D}${bindir}/ctstat
+    mv ${D}${base_sbindir}/rtstat ${D}${bindir}/rtstat
+    mv ${D}${base_sbindir}/routef ${D}${bindir}/routef
+    mv ${D}${base_sbindir}/routel ${D}${bindir}/routel
+
+    install -d ${D}${sbindir}
+    mv ${D}${base_sbindir}/genl ${D}${sbindir}/genl
 }
 
 # The .so files in iproute2-tc are modules, not traditional libraries
@@ -59,7 +74,8 @@ PACKAGES =+ "\
 "
 
 FILES_${PN}-tc = "${base_sbindir}/tc* \
-                  ${libdir}/tc/*.so"
+                  ${libdir}/tc/*.so \
+                  ${datadir}/bash-completion/completions/tc"
 FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
                       ${base_sbindir}/ctstat \
                       ${base_sbindir}/rtstat"
@@ -69,7 +85,8 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
 FILES_${PN}-nstat = "${base_sbindir}/nstat"
 FILES_${PN}-ss = "${base_sbindir}/ss"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
-FILES_${PN}-devlink = "${base_sbindir}/devlink"
+FILES_${PN}-devlink = "${base_sbindir}/devlink \
+                       ${datadir}/bash-completion/completions/devlink"
 
 ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-- 
2.17.1

