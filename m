Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.244.1608139993955905786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 09:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v6] sudo: split sudo binary into its own package
Date: Wed, 16 Dec 2020 17:33:09 +0000
Message-Id: <20201216173309.30840-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Package just sudo binary into its own package for size concerned
targets.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-extended/sudo/sudo_1.9.3p1.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
index ba61a7f2472..745f71b8504 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
@@ -44,6 +44,16 @@ do_install_append () {
 	rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
 }
 
-FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
                     ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
+
+SUDO_PACKAGES = "${PN}-sudo\
+                 ${PN}-lib"
+
+PACKAGE_BEFORE_PN = "${SUDO_PACKAGES}"
+
+RDEPENDS_${PN}-sudo = "${PN}-lib"
+RDEPENDS_${PN} += "${SUDO_PACKAGES}"
+
+FILES_${PN}-sudo = "${bindir}/sudo ${bindir}/sudoedit"
+FILES_${PN}-lib = "${localstatedir} ${libexecdir} ${sysconfdir} ${libdir} ${nonarch_libdir}"
\ No newline at end of file
-- 
2.17.1

