Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B54077762D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 13:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5B53E18367
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:28:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hQuf9DsunPT4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:28:03 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id BE82018231
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:28:03 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 687B41E072
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:28:03 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D8B01E064
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:28:03 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:28:03 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 5115F755
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:28:03 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 3FCA97C066; Thu, 22 Dec 2016 14:28:03 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 14:28:03 +0100
Message-Id: <1482413283-25405-1-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH] externalsrc.bbclass: Add task buildclean
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
X-List-Received-Date: Thu, 22 Dec 2016 13:28:09 -0000

The buildclean task should call the package build system clean
command, just implemented for Make for now.

This is meant for recipes where S == B, but can be useful as a
standalone task for other recipes too.

Setting it to run before do_clean will do what most developers expect
when calling bitbake -c clean.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 meta/classes/externalsrc.bbclass | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index e115a47..bc82f1f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -4,7 +4,7 @@
 # Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 #
-# externalsrc.bbclass enables use of an existing source tree, usually external to 
+# externalsrc.bbclass enables use of an existing source tree, usually external to
 # the build system to build a piece of software rather than the usual fetch/unpack/patch
 # process.
 #
@@ -108,6 +108,8 @@ python () {
         # We don't want the workdir to go away
         d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN'))
 
+        bb.build.addtask('do_makeclean', 'do_clean', None, d)
+
         # If B=S the same builddir is used even for different architectures.
         # Thus, use a shared CONFIGURESTAMPFILE and STAMP directory so that
         # change of do_configure task hash is correctly detected and stamps are
@@ -142,6 +144,17 @@ python externalsrc_compile_prefunc() {
     bb.plain('NOTE: %s: compiling from external source tree %s' % (d.getVar('PN'), d.getVar('EXTERNALSRC')))
 }
 
+do_buildclean[dirs] = "${S} ${B}"
+do_buildclean[nostamp] = "1"
+do_buildclean[doc] = "Call 'make clean' or equivalent in ${B}"
+externalsrc_do_buildclean() {
+	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
+		oe_runmake clean || die "make failed"
+	else
+		bbnote "nothing to compile - no makefile found"
+	fi
+}
+
 def srctree_hash_files(d):
     import shutil
     import subprocess
@@ -188,3 +201,5 @@ def srctree_configure_hash_files(d):
                 if f in search_files:
                     out_items.append('%s:True' % os.path.join(root, f))
     return ' '.join(out_items)
+
+EXPORT_FUNCTIONS do_buildclean
-- 
2.1.4


