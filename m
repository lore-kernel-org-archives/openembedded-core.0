Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBC071C70
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:20 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 145E8B88DCE; Thu,  8 Dec 2016 22:48:00 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:53 +0100
Message-Id: <1481233677-27298-30-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 29/33] dpkg: always install dpkg-configure.service
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:20 -0000

systemd.bbclass handles everything based on DISTRO_FEATURES.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 09c962e..40cfc45 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -9,11 +9,7 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
 
 inherit autotools gettext perlnative pkgconfig systemd
 
-python () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
-        d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'dpkg-configure.service')
-}
+SYSTEMD_SERVICE_${PN} = "dpkg-configure.service"
 
 export PERL = "${bindir}/perl"
 PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
@@ -49,15 +45,13 @@ do_install_append_class-native() {
 }
 
 do_install_append () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
-		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/dpkg-configure.service ${D}${systemd_unitdir}/system/
-		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-			-e 's,@BINDIR@,${bindir},g' \
-			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
-			${D}${systemd_unitdir}/system/dpkg-configure.service
-	fi
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/dpkg-configure.service ${D}${systemd_unitdir}/system
+    sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
+        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+        -e 's,@BINDIR@,${bindir},g' \
+        -e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
+        -i ${D}${systemd_unitdir}/system/dpkg-configure.service
 }
 
 PACKAGES =+ "dpkg-perl dselect libdpkg-perl start-stop-daemon update-alternatives-dpkg"
-- 
2.7.4


