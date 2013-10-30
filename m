Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id DFDB76B0E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 01:00:19 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id ep20so526714lab.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 18:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V9qJHWOgULyVjff2gkKvzQ9NBrvxPhyvlN397STmEHY=;
	b=CJxg4aoCAOAMcfdJVtYyplJf3mANzTrTK3xxm7yMJCw5y17EyCLxcyfce2hzHI/zoS
	l8ea58wy3/785RwLyb4DyXESW7NTQZEYRdjmLiiiTQNM8U6y17YGoh9CUldalX3j71JI
	UJ1ovDcPc9heg0ZbJtEu/7emnnrtsIQhROMmLNGDgcwWjf2kGr0rQQJOiZkKLkKiQpGq
	ZwZXIPtAtYJ9HXLHFObmfDtxIMSfLAt3OQ5LIdp5bHR8OFfhtzS4BPT9mzXzt1xw4vLt
	yGUz8SG/V3555yLdJ3gLOac8PkD19/BkYMX+YffrImwQR6BbcSkHi2Hc5ZUdgEwpnD5Y
	1g9A==
X-Received: by 10.152.36.41 with SMTP id n9mr1281044laj.21.1383094820765;
	Tue, 29 Oct 2013 18:00:20 -0700 (PDT)
Received: from skeletor.greyskull (89-253-118-72.customers.ownit.se.
	[89.253.118.72]) by mx.google.com with ESMTPSA id
	os9sm18186268lbb.17.2013.10.29.18.00.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 18:00:20 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 01:57:11 +0100
Message-Id: <1383094631-19855-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.8.3.1
Cc: Jacob Kroon <jacob.kroon@mikrodidakt.se>
Subject: [PATCH] update-rc.d.bbclass: Cleanup package scripts
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
X-List-Received-Date: Wed, 30 Oct 2013 01:00:21 -0000

* Add proper preinst script
* Use -n "$D"/-z "$D" checks throughout the scripts
* Only set OPT in cases where its used
* Don't pass unnecessary -f to update-rc.d in postrm script
* Remove outdated comment

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta/classes/update-rc.d.bbclass | 49 ++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 9437e9c..29b5a8e 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -12,13 +12,11 @@ INITSCRIPT_PARAMS ?= "defaults"
 
 INIT_D_DIR = "${sysconfdir}/init.d"
 
-updatercd_postinst() {
-# test if there is a previous init script there, ie, we are updating the package
-# if so, we stop the service and remove it before we install from the new package
+updatercd_preinst() {
+if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
+	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+fi
 if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
-		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
-	fi
 	if [ -n "$D" ]; then
 		OPT="-f -r $D"
 	else
@@ -26,30 +24,32 @@ if type update-rc.d >/dev/null 2>/dev/null; then
 	fi
 	update-rc.d $OPT ${INITSCRIPT_NAME} remove
 fi
+}
 
-if [ -n "$D" ]; then
-	OPT="-r $D"
-else
-	OPT="-s"
-fi
+updatercd_postinst() {
 if type update-rc.d >/dev/null 2>/dev/null; then
+	if [ -n "$D" ]; then
+		OPT="-r $D"
+	else
+		OPT="-s"
+	fi
 	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 fi
 }
 
 updatercd_prerm() {
-if test "x$D" = "x"; then
+if [ -z "$D" ]; then
 	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
 fi
 }
 
 updatercd_postrm() {
-if test "$D" != ""; then
-	OPT="-f -r $D"
-else
-	OPT=""
-fi
 if type update-rc.d >/dev/null 2>/dev/null; then
+	if [ -n "$D" ]; then
+		OPT="-r $D"
+	else
+		OPT=""
+	fi
 	update-rc.d $OPT ${INITSCRIPT_NAME} remove
 fi
 }
@@ -68,22 +68,23 @@ python __anonymous() {
 
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
 
-populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_postinst"
+populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
 
 python populate_packages_updatercd () {
     def update_rcd_package(pkg):
-        bb.debug(1, 'adding update-rc.d calls to postinst/postrm for %s' % pkg)
-        """
-        update_rc.d postinst is appended here because pkg_postinst may require to
-        execute on the target. Not doing so may cause update_rc.d postinst invoked
-        twice to cause unwanted warnings.
-        """ 
+        bb.debug(1, 'adding update-rc.d calls to preinst/postinst/prerm/postrm for %s' % pkg)
 
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES", True)
         localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
         bb.data.update_data(localdata)
 
+        preinst = d.getVar('pkg_preinst_%s' % pkg, True)
+        if not preinst:
+            preinst = '#!/bin/sh\n'
+        preinst += localdata.getVar('updatercd_preinst', True)
+        d.setVar('pkg_preinst_%s' % pkg, preinst)
+
         postinst = d.getVar('pkg_postinst_%s' % pkg, True)
         if not postinst:
             postinst = '#!/bin/sh\n'
-- 
1.8.3.1


