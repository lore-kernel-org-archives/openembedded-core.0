Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E68E67C740
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 14:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 76A1C18288
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:16 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id FAs9pUls_vIQ
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:16 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id EE8D21814A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:15 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3CAF1E060
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:15 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B87DF1E057
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:15 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:15 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id AC95318D7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:15 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x1HEpELT002864
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:14 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x1HEpE0g002863
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2019 15:51:14 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 15:51:05 +0100
Message-Id: <20190217145107.2796-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/3] libc-package.bbclass: Correct a few paths for when usrmerge is used
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
X-List-Received-Date: Sun, 17 Feb 2019 14:51:16 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/libc-package.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 0b4c666a74..60000a9547 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -68,8 +68,8 @@ do_prep_locale_tree() {
 		gunzip $i
 	done
 	tar -cf - -C ${LOCALETREESRC}${base_libdir} -p . | tar -xf - -C $treedir/${base_libdir}
-	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.* ]; then
-		tar -cf - -C ${STAGING_DIR_NATIVE}/${prefix_native}/${base_libdir} -p libgcc_s.* | tar -xf - -C $treedir/${base_libdir}
+	if [ -f ${STAGING_LIBDIR_NATIVE}/libgcc_s.* ]; then
+		tar -cf - -C ${STAGING_LIBDIR_NATIVE} -p libgcc_s.* | tar -xf - -C $treedir/${base_libdir}
 	fi
 	install -m 0755 ${LOCALETREESRC}${bindir}/localedef $treedir/${base_bindir}
 }
@@ -278,7 +278,7 @@ python package_do_split_gconvs () {
             qemu_options = d.getVar('QEMU_OPTIONS')
 
             cmd = "PSEUDO_RELOADED=YES PATH=\"%s\" I18NPATH=\"%s\" %s -L %s \
-                -E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % \
+                -E LD_LIBRARY_PATH=%s %s %s${base_bindir}/localedef %s" % \
                 (path, i18npath, qemu, treedir, ldlibdir, qemu_options, treedir, localedef_opts)
 
         commands["%s/%s" % (outputpath, name)] = cmd
-- 
2.12.0


