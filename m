Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B40FC6B513
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 07:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1F4AA18107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:20 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id stqrHs5CEVO6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:19 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7E69E182CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:19 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 669F11E078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:19 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AA391E075
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:19 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:19 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 4EF66F96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:19 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x1I78ISE024220
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:18 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x1I78Is0024219
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2019 08:08:18 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 08:08:06 +0100
Message-Id: <20190218070808.24163-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 1/3] libc-package.bbclass: Correct a few paths for when usrmerge is used
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
X-List-Received-Date: Mon, 18 Feb 2019 07:08:21 -0000

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


