Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.11083.1608137772734038184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 08:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v5] sudo: split into smaller tools package
Date: Wed, 16 Dec 2020 16:56:09 +0000
Message-Id: <20201216165609.28794-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Allow to include whether we want sudo, visudo, sudoreplay
or cvtsudoers tools.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-extended/sudo/sudo_1.9.3p1.bb | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
index ba61a7f2472..2d185d88e4b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
@@ -44,6 +44,34 @@ do_install_append () {
 	rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
 }
 
-FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
                     ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
+
+SUDO_PACKAGES = "${PN}-cvtsudoers"
+SUDO_PACKAGES += "${PN}-sudoreplay"
+SUDO_PACKAGES += "${PN}-logsrvd"
+SUDO_PACKAGES += "${PN}-sendlog"
+SUDO_PACKAGES += "${PN}-visudo"
+SUDO_PACKAGES += "${PN}-sudo"
+SUDO_PACKAGES += "${PN}-lib"
+PACKAGES += "${SUDO_PACKAGES}"
+
+RDEPENDS_${PN}-cvtsudoers = "${PN}-lib"
+RDEPENDS_${PN}-sudo = "${PN}-lib"
+RDEPENDS_${PN}-sudoreplay = "${PN}-lib"
+RDEPENDS_${PN}-logsrvd = "${PN}-lib"
+RDEPENDS_${PN}-sendlog = "${PN}-lib"
+RDEPENDS_${PN}-visudo = "${PN}-lib"
+
+RDEPENDS_${PN} += "${SUDO_PACKAGES}"
+
+ALLOW_EMPTY_${PN} = "1"
+
+FILES_${PN} = ""
+FILES_${PN}-cvtsudoers = "${bindir}/cvtsudoers"
+FILES_${PN}-sudoreplay = "${bindir}/sudoreplay"
+FILES_${PN}-logsrvd = "${sbindir}/sudo_logsrvd"
+FILES_${PN}-sendlog = "${sbindir}/sudo_sendlog"
+FILES_${PN}-sudo = "${bindir}/sudo ${bindir}/sudoedit"
+FILES_${PN}-visudo = "${sbindir}/visudo"
+FILES_${PN}-lib = "${localstatedir} ${libexecdir} ${sysconfdir} ${libdir} ${nonarch_libdir}"
-- 
2.17.1

