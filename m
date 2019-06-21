Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88F7C7E63C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 02:08:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5L28TRE030371
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 19:08:39 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 19:08:18 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2019 10:08:14 +0800
Message-ID: <1561082895-23815-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561082895-23815-1-git-send-email-changqing.li@windriver.com>
References: <1561082895-23815-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] update-rc.d: support enable/disable options
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
X-List-Received-Date: Fri, 21 Jun 2019 02:08:48 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

* update-rc.d has added support of enable/disable options, which are
  expected to keep the previous configuration even after upgrade the packages.
  With support for these options, it will only create start/stop link
  when there are none, or it will keep the previous configuration.

  Our preinst uses "-f remove" to remove any links under the /etc/rcrunlevel.d
  which is conflicting behavior with disable/enable options, so remove it.

  For example, if a user disabled one service before upgrade,
  then after upgrade the service could be started. This happens because during preinst,
  all links have been deleted, then postinst may create the link to start service.

  With this change, we remove preinst and therefore keep the previous links
  so that after upgrade, if a link existed for the package, then the postinst
  will not create new start/stop links.

* remove '-f' for postinst. Previously, the keepalived recipe used 'remove'
  during postinst, so we needed the -f, but now the keepalived recipe has fixed
  this problem, so it's safe to remove '-f'.

[Yocto #12955]

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


