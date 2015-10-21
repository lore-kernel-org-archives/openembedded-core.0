Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC5975D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 17:41:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id AEB25600816
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Oct 2015 19:41:07 +0200
Message-Id: <c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] cups: explicitly configure with systemd when needed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Oct 2015 17:41:21 -0000

Add PACKAGECONFIG for systemd, enable it when systemd is enabled
in DISTRO_FEATURES. Pass the correct path to systemd units,
ensure they're installed into the package.

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
---
I hope this patch will be merged before jethro is released :)

 meta/recipes-extended/cups/cups.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2c34da9..ad980fc 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -24,10 +24,12 @@ GROUPADD_PARAM_${PN} = "--system lpadmin"
 SYSTEMD_SERVICE_${PN} = "cups.socket cups.path cups.service"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 
 EXTRA_OECONF = " \
@@ -100,6 +102,7 @@ FILES_${PN} += "${libdir}/cups/backend \
 		${libdir}/cups/monitor \
 		${libdir}/cups/notifier \
 		${libdir}/cups/daemon \
+		${systemd_system_unitdir} \
 	       "
 
 FILES_${PN}-lib = "${libdir}/libcups.so.*"
-- 
2.1.4


