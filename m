Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.4637.1608157544527368917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 14:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v6] procps: split ps and sysctl into individual packages
Date: Wed, 16 Dec 2020 22:25:41 +0000
Message-Id: <20201216222541.6195-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Move the ps and sysctl tools into its own package. Useful for
size constrained systems that only want the ps and/or sysctl tools.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-extended/procps/procps_3.3.16.bb | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
index 2810ebd285a..ef3ac86e97c 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.16.bb
@@ -74,3 +74,28 @@ python __anonymous() {
 # 'ps' isn't suitable for use as a security tool so whitelist this CVE.
 # https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
 CVE_CHECK_WHITELIST += "CVE-2018-1121"
+
+PROCPS_PACKAGES = "${PN}-lib \
+                   ${PN}-ps \
+                   ${PN}-sysctl"
+
+PACKAGE_BEFORE_PN = "${PROCPS_PACKAGES}"
+RDEPENDS_${PN} += "${PROCPS_PACKAGES}"
+
+RDEPENDS_${PN}-ps += "${PN}-lib"
+RDEPENDS_${PN}-sysctl += "${PN}-lib"
+
+FILES_${PN}-lib = "${libdir}"
+FILES_${PN}-ps = "${base_bindir}/ps.${BPN}"
+FILES_${PN}-sysctl = "${base_sbindir}/sysctl.${BPN} ${sysconfdir}/sysctl.conf ${sysconfdir}/sysctl.d"
+
+ALTERNATIVE_${PN}_remove = "ps"
+ALTERNATIVE_${PN}_remove = "sysctl"
+
+ALTERNATIVE_${PN}-ps = "ps"
+ALTERNATIVE_TARGET[ps] = "${base_bindir}/ps"
+ALTERNATIVE_LINK_NAME[ps] = "${base_bindir}/ps"
+
+ALTERNATIVE_${PN}-sysctl = "sysctl"
+ALTERNATIVE_TARGET[sysctl] = "${base_sbindir}/sysctl"
+ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
\ No newline at end of file
-- 
2.17.1

