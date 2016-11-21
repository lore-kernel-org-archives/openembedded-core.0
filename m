Return-Path: <linus@scypho.com>
Received: from mx-out02.mykolab.com (mx.kolabnow.com [95.128.36.1])
	by mail.openembedded.org (Postfix) with ESMTP id C49AD60190
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 20:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kolabnow.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=6.31
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham
Received: from mx05.mykolab.com (mx05.mykolab.com [10.20.7.161])
	by mx-out02.mykolab.com (Postfix) with ESMTPS id A4D3561771;
	Mon, 21 Nov 2016 21:58:30 +0100 (CET)
Received: from linus by linus.scypho.com with local (Exim 4.87)
	(envelope-from <linus@linus.scypho.com>)
	id 1c8vfY-0000s9-85; Mon, 21 Nov 2016 21:58:28 +0100
From: Linus Wallgren <linus.wallgren@scypho.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 21:57:49 +0100
Message-Id: <20161121205749.3306-1-linus.wallgren@scypho.com>
In-Reply-To: <68b087d8-d920-eb83-8b53-7e561fd419cb@opendreambox.org>
References: <68b087d8-d920-eb83-8b53-7e561fd419cb@opendreambox.org>
Cc: Linus Wallgren <linus.wallgren@scypho.com>
Subject: [PATCHv2] apt-package: Include maintenance scripts
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
X-List-Received-Date: Mon, 21 Nov 2016 20:58:34 -0000

Apt can run multiple tasks daily, such as for example clean, update,
autoclean, unattended-upgrades etc.

[YOCTO #10669]

Signed-off-by: Linus Wallgren <linus.wallgren@scypho.com>
---
 meta/recipes-devtools/apt/apt-package.inc | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index a553aa2..c17048a 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -32,13 +32,19 @@ FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
 	       ${bindir}/apt-config ${bindir}/apt-cache \
 	       ${libdir}/apt ${libdir}/libapt*.so.* \
 	       ${localstatedir} ${sysconfdir} \
-	       ${libdir}/dpkg"
+	       ${libdir}/dpkg \
+	       ${systemd_unitdir}/system \
+           "
 FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
 FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages', True))} \
 		   ${docdir}/apt"
 FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages', True))}"
 FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
 
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "apt-daily.timer"
+
 do_install () {
 	set -x
 	install -d ${D}${bindir}
@@ -75,4 +81,11 @@ do_install () {
 
 	install -d ${D}${includedir}/apt-pkg/
 	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
+
+	install -d ${D}${systemd_unitdir}/system/
+	install -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/
+	install -m 0644 ${S}/debian/apt-daily.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${S}/debian/apt-daily.timer ${D}${systemd_unitdir}/system/
+	install -d ${D}${sysconfdir}/cron.daily/
+	install -m 0755 ${S}/debian/apt.apt-compat.cron.daily ${D}${sysconfdir}/cron.daily/
 }
-- 
2.10.2


