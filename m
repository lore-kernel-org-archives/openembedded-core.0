Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.1165.1608060918462634711
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
From: "Sinan Kaya" <okaya@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v3] sudo: split into smaller tools package
Date: Tue, 15 Dec 2020 19:35:06 +0000
Message-Id: <20201215193506.13053-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Allow to include whether we want sudo, visudo, sudoreplay
or cvtsudoers tools.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-extended/sudo/sudo_1.9.3p1.bb | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
index ba61a7f2472..0ea72caf790 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
@@ -44,6 +44,28 @@ do_install_append () {
 	rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
 }
 
-FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
                     ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
+
+PACKAGES += "${PN}-cvtsudoers"
+PACKAGES += "${PN}-sudoreplay"
+PACKAGES += "${PN}-visudo"
+PACKAGES += "${PN}-sudo"
+PACKAGES += "${PN}-lib"
+
+RDEPENDS_${PN}-cvtsudoers = "${PN}-lib"
+RDEPENDS_${PN}-sudo = "${PN}-lib"
+RDEPENDS_${PN}-sudoreplay = "${PN}-lib"
+RDEPENDS_${PN}-visudo = "${PN}-lib"
+
+PROVIDES += "${PACKAGES}"
+RRECOMMENDS_${PN} += "${PACKAGES}"
+
+ALLOW_EMPTY_${PN} = "1"
+
+FILES_${PN} = ""
+FILES_${PN}-cvtsudoers = "${bindir}/cvtsudoers"
+FILES_${PN}-sudoreplay = "${bindir}/sudoreplay"
+FILES_${PN}-sudo = "${bindir}/sudo ${bindir}/sudoedit"
+FILES_${PN}-visudo = "${sbindir}/visudo"
+FILES_${PN}-lib = "${localstatedir} ${libexecdir} ${sysconfdir} ${libdir}"
-- 
2.17.1

