Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.5042.1608158920608143453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 14:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v5] net-tools: split mii-tool into its own package
Date: Wed, 16 Dec 2020 22:48:37 +0000
Message-Id: <20201216224837.29524-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Move the mii-tool into its own package. Useful for size constrained
systems that only want the mii-tool only.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../net-tools/net-tools_1.60-20181103.bb          | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
index e97731073e8..1784bf9ec24 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
@@ -107,4 +107,17 @@ python __anonymous() {
 }
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native nativesdk"
+NETTOOLS_PACKAGES = "${PN}-mii-tool"
+
+PACKAGE_BEFORE_PN = "${NETTOOLS_PACKAGES}"
+RDEPENDS_${PN} += "${NETTOOLS_PACKAGES}"
+
+FILES_${PN}-mii-tool = "${base_sbindir}/mii-tool"
+
+ALTERNATIVE_${PN}_remove = "mii-tool"
+
+ALTERNATIVE_${PN}-mii-tool = "mii-tool"
+ALTERNATIVE_TARGET[mii-tool] = "${base_sbindir}/mii-tool"
+ALTERNATIVE_LINK_NAME[mii-tool] = "${base_sbindir}/mii-tool"
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
2.17.1

