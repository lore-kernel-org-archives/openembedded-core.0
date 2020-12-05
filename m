Received: from outbound-relay8.guardedhost.com (outbound-relay8.guardedhost.com [216.239.133.208])
 by mx.groups.io with SMTP id smtpd.web10.1545.1607156600165580208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Dec 2020 00:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.208, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (mx04.guardedhost.com [IPv6:2607:fe90:1:1::55:1])
	by outbound-relay5.guardedhost.com (Postfix) with ESMTP id 4Cp2dg3MF6z8Tc;
	Sat,  5 Dec 2020 08:23:19 +0000 (GMT)
Received: from alaperry-ubuntu-build.43vr1hlvonre5le4v1ueig2kyb.xx.internal.cloudapp.net (unknown [52.151.43.11])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPSA id 4Cp2df396Mz30Lq;
	Sat,  5 Dec 2020 08:23:18 +0000 (GMT)
From: "Alan Perry" <alanp@snowmoose.com>
To: openembedded-core@lists.openembedded.org
Cc: Alan Perry <alanp@snowmoose.com>
Subject: [PATCH v2 1/2] iproute2: install tools to mirror install under Debian/Ubuntu
Date: Sat,  5 Dec 2020 08:22:45 +0000
Message-Id: <20201205082246.14954-1-alanp@snowmoose.com>
X-Mailer: git-send-email 2.17.1
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: 21492984-36D3-11EB-A7FF-961406491BCE
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx4.omnis.com
X-Virus-Status: Clean

Many scripts exist that expect the iproute2 tools to be found in
the same directories where they are found in Debian or Ubuntu.
For the iproute2 tools included in the iproute2 recipe, move
them to those directories or create links there.. Also, add
bash-completion files as is done by Debian and Ubuntu.

Signed-off-by: Alan Perry <alanp@snowmoose.com>
---
 .../iproute2/iproute2.inc                     | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 403d264308..de5c63a6e3 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -41,6 +41,23 @@ do_install () {
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
+    if [ "${base_sbindir}" != "${sbindir}" ]; then
+        install -d ${D}${sbindir}
+        mv ${D}${base_sbindir}/genl ${D}${sbindir}/genl
+    fi
 }
 
 # The .so files in iproute2-tc are modules, not traditional libraries
@@ -59,7 +76,8 @@ PACKAGES =+ "\
 "
 
 FILES_${PN}-tc = "${base_sbindir}/tc* \
-                  ${libdir}/tc/*.so"
+                  ${libdir}/tc/*.so \
+                  ${datadir}/bash-completion/completions/tc"
 FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
                       ${base_sbindir}/ctstat \
                       ${base_sbindir}/rtstat"
@@ -69,7 +87,8 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
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

