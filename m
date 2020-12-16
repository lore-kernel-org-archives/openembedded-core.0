Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.11111.1608137116119543045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 08:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v3] iproute2: split ip to individual package
Date: Wed, 16 Dec 2020 16:45:10 +0000
Message-Id: <20201216164510.9823-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Move the ip tool into its own package. Useful for size constrained
systems that only want the ip tool.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../iproute2/iproute2.inc                     | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 403d264308c..c7a3d547dae 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -46,32 +46,75 @@ do_install () {
 # The .so files in iproute2-tc are modules, not traditional libraries
 INSANE_SKIP_${PN}-tc = "dev-so"
 
-PACKAGES =+ "\
+IPROUTE2_PACKAGES =+ "\
+    ${PN}-bridge \
     ${PN}-devlink \
     ${PN}-genl \
+    ${PN}-ifcfg \
     ${PN}-ifstat \
+    ${PN}-ip \
+    ${PN}-lib \
     ${PN}-lnstat \
     ${PN}-nstat \
+    ${PN}-rdma \
+    ${PN}-routef \
+    ${PN}-routel \
+    ${PN}-rtmon \
+    ${PN}-rtpr \
     ${PN}-rtacct \
     ${PN}-ss \
     ${PN}-tc \
     ${PN}-tipc \
 "
+RDEPENDS_${PN}-bridge = "${PN}-lib"
+RDEPENDS_${PN}-devlink = "${PN}-lib"
+RDEPENDS_${PN}-genl = "${PN}-lib"
+RDEPENDS_${PN}-ifcfg = "${PN}-lib"
+RDEPENDS_${PN}-ifstat = "${PN}-lib"
+RDEPENDS_${PN}-ip = "${PN}-lib"
+RDEPENDS_${PN}-lib = "${PN}-lib"
+RDEPENDS_${PN}-lnstat = "${PN}-lib"
+RDEPENDS_${PN}-nstat = "${PN}-lib"
+RDEPENDS_${PN}-rdma = "${PN}-lib"
+RDEPENDS_${PN}-routef = "${PN}-lib"
+RDEPENDS_${PN}-routel = "${PN}-lib"
+RDEPENDS_${PN}-rtmon = "${PN}-lib"
+RDEPENDS_${PN}-rtpr = "${PN}-lib"
+RDEPENDS_${PN}-rtacct = "${PN}-lib"
+RDEPENDS_${PN}-ss = "${PN}-lib"
+RDEPENDS_${PN}-tc = "${PN}-lib"
+RDEPENDS_${PN}-tipc = "${PN}-lib"
 
+PACKAGES += "${IPROUTE2_PACKAGES}"
+RDEPENDS_${PN} += "${IPROUTE2_PACKAGES}"
+ALLOW_EMPTY_${PN} = "1"
+
+FILES_${PN} = ""
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
 FILES_${PN}-ss = "${base_sbindir}/ss"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
 FILES_${PN}-devlink = "${base_sbindir}/devlink"
+FILES_${PN}-rdma = "${base_sbindir}/rdma"
+FILES_${PN}-routef = "${base_sbindir}/routef"
+FILES_${PN}-rtpr = "${base_sbindir}/rtpr"
+FILES_${PN}-rtmon = "${base_sbindir}/rtmon"
+FILES_${PN}-routel = "${base_sbindir}/routel"
+FILES_${PN}-bridge = "${base_sbindir}/bridge"
+FILES_${PN}-ifcfg = "${base_sbindir}/ifcfg"
+FILES_${PN}-ip = "${base_sbindir}/ip.${BPN} ${sysconfdir}"
+FILES_${PN}-lib = "${localstatedir}"
+
 
-ALTERNATIVE_${PN} = "ip"
+ALTERNATIVE_${PN}-ip = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
 ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.17.1

