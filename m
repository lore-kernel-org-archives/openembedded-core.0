Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.5319.1608001259235667827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 19:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] iproute2: split ip to invidual package
Date: Tue, 15 Dec 2020 03:00:35 +0000
Message-Id: <20201215030035.6251-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Move the ip tool into its own package. Useful for size constrained
systems that only want the ip tool.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 403d264308c..f8942260a75 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -50,6 +50,7 @@ PACKAGES =+ "\
     ${PN}-devlink \
     ${PN}-genl \
     ${PN}-ifstat \
+    ${PN}-ip \
     ${PN}-lnstat \
     ${PN}-nstat \
     ${PN}-rtacct \
@@ -58,12 +59,16 @@ PACKAGES =+ "\
     ${PN}-tipc \
 "
 
+PROVIDES += "${PACKAGES}"
+RRECOMMENDS_${PN} += "${PACKAGES}"
+
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
 FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
                       ${base_sbindir}/ctstat \
                       ${base_sbindir}/rtstat"
 FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
+FILES_${PN}-ip = "${base_sbindir}/ip.${PN} ${sysconfdir}/iproute2"
 FILES_${PN}-genl = "${base_sbindir}/genl"
 FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
 FILES_${PN}-nstat = "${base_sbindir}/nstat"
@@ -71,7 +76,10 @@ FILES_${PN}-ss = "${base_sbindir}/ss"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
 FILES_${PN}-devlink = "${base_sbindir}/devlink"
 
-ALTERNATIVE_${PN} = "ip"
+ALTERNATIVE_${PN}-ip = "ip"
+ALTERNATIVE_TARGET[ip] = "${base_bindir}/ip.${BPN}"
+ALTERNATIVE_LINK_NAME[ip] = "${base_bindir}/ip"
+
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
 ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.17.1

