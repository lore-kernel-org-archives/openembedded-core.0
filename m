Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 056B560107
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 09:43:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA99hBD9000947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Nov 2018 01:43:21 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 01:42:36 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Nov 2018 17:42:34 +0800
Message-ID: <1541756554-194955-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] update-rc.d.bbclass: remove preinst and remove -f for postinst
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
X-List-Received-Date: Fri, 09 Nov 2018 09:43:31 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

*preinst use "-f remove" to remove any links in the /etc/rcrunlevel.d
 but this will make user cannot keep previous config by default after
 upgrade

 eg: user disable one service before upgrade, after upgrade, service
 could be started since during preinst, all link have been deleted, so
 postinst may create the link to start service.

 remove preinst to keep previous links, so that after upgrade, if any
 link existed for the package, postinst will not create new start/stop
 links.

 (note: patch of support enable/disable function of update-rc.d send
 to yocto mail list today)

*remove -f for postinst, previously, recipe keepalived use remove during
 postinst, so need this -f, but remove in postinst is not proper, recipe
 keepalived have fixed this problem, so remove -f.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/update-rc.d.bbclass | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 265c4be..1366fee 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -20,28 +20,14 @@ def use_updatercd(d):
         return '[ -n "$D" -o ! -d /run/systemd/system ]'
     return 'true'
 
-updatercd_preinst() {
-if ${@use_updatercd(d)} && [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
-	${INIT_D_DIR}/${INITSCRIPT_NAME} stop || :
-fi
-if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -n "$D" ]; then
-		OPT="-f -r $D"
-	else
-		OPT="-f"
-	fi
-	update-rc.d $OPT ${INITSCRIPT_NAME} remove
-fi
-}
-
 PACKAGE_WRITE_DEPS += "update-rc.d-native"
 
 updatercd_postinst() {
 if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
-		OPT="-f -r $D"
+		OPT="-r $D"
 	else
-		OPT="-f -s"
+		OPT="-s"
 	fi
 	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 fi
@@ -79,7 +65,7 @@ python __anonymous() {
 PACKAGESPLITFUNCS_prepend = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'populate_packages_updatercd ', '', d)}"
 PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
 
-populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
+populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_postinst"
 populate_packages_updatercd[vardepsexclude] += "OVERRIDES"
 
 python populate_packages_updatercd () {
@@ -95,7 +81,7 @@ python populate_packages_updatercd () {
             d.appendVar('RDEPENDS_' + pkg, ' %sinitd-functions' % (mlprefix))
 
     def update_rcd_package(pkg):
-        bb.debug(1, 'adding update-rc.d calls to preinst/postinst/prerm/postrm for %s' % pkg)
+        bb.debug(1, 'adding update-rc.d calls to postinst/prerm/postrm for %s' % pkg)
 
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES")
@@ -103,12 +89,6 @@ python populate_packages_updatercd () {
 
         update_rcd_auto_depend(pkg)
 
-        preinst = d.getVar('pkg_preinst_%s' % pkg)
-        if not preinst:
-            preinst = '#!/bin/sh\n'
-        preinst += localdata.getVar('updatercd_preinst')
-        d.setVar('pkg_preinst_%s' % pkg, preinst)
-
         postinst = d.getVar('pkg_postinst_%s' % pkg)
         if not postinst:
             postinst = '#!/bin/sh\n'
-- 
2.7.4


