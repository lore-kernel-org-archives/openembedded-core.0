Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 34DA671A99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:34:02 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id A3ECAB81614; Wed, 30 Nov 2016 13:27:28 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:27:28 +0100
Message-Id: <1480508848-28371-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] update-rc.d: ignore initscript in prerm and preinst when systemd is active
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
X-List-Received-Date: Wed, 30 Nov 2016 12:34:04 -0000

In hybrid systemd/sysvinit builds, if the recipe inherits systemd and systemd
is installed, we can safely assume that the service gets stopped by the prerm
script fragment from systemd.bbclass. This fixes deinstallation of packages
with initscripts returning errors when no running service was found. The preinst
shouldn't run the initscript either, because postinst will call systemctl restart.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/update-rc.d.bbclass | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 321924b..2c3ef9e 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -11,11 +11,20 @@ INITSCRIPT_PARAMS ?= "defaults"
 
 INIT_D_DIR = "${sysconfdir}/init.d"
 
+def use_updatercd(d):
+    # If the distro supports both sysvinit and systemd, and the current recipe
+    # supports systemd, only call update-rc.d on rootfs creation or if systemd
+    # is not running. That's because systemctl enable/disable will already call
+    # update-rc.d if it detects initscripts.
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and bb.data.inherits_class('systemd', d):
+        return '[ -n "$D" -o ! -d /run/systemd/system ]'
+    return 'true'
+
 updatercd_preinst() {
-if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
+if ${@use_updatercd(d)} && [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
 	${INIT_D_DIR}/${INITSCRIPT_NAME} stop || :
 fi
-if type update-rc.d >/dev/null 2>/dev/null; then
+if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
 		OPT="-f -r $D"
 	else
@@ -26,7 +35,7 @@ fi
 }
 
 updatercd_postinst() {
-if type update-rc.d >/dev/null 2>/dev/null; then
+if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
 		OPT="-r $D"
 	else
@@ -37,13 +46,13 @@ fi
 }
 
 updatercd_prerm() {
-if [ -z "$D" -a -x "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
+if ${@use_updatercd(d)} && [ -z "$D" -a -x "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
 	${INIT_D_DIR}/${INITSCRIPT_NAME} stop || :
 fi
 }
 
 updatercd_postrm() {
-if type update-rc.d >/dev/null 2>/dev/null; then
+if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
 		OPT="-f -r $D"
 	else
-- 
2.7.4


