Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 93B9871ABF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 16:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id D55CB2E330
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:45:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dXP8T3QbVruz
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:44:58 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id CCAE12E36F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:44:58 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 933011E087
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:44:58 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 884C41E085
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:44:58 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:44:58 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 7CB875F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:44:58 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 686C97C066; Mon,  9 Jan 2017 17:44:58 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 17:44:57 +0100
Message-Id: <1483980298-3647-1-git-send-email-olani@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH v3 1/2] externalsrc.bbclass: Add task buildclean
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
X-List-Received-Date: Mon, 09 Jan 2017 16:45:02 -0000

The buildclean task should call the package build system clean
command, just implemented for Make for now.

This is meant for recipes where S == B, but can be useful as a
standalone task for other recipes too.

When S == B, set it to run before do_clean which will do what most
developers expect when calling bitbake -c clean.  For S != B, do not
add it before clean as it is not needed and may take some time.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes/externalsrc.bbclass | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 6ec46a6..bdf23ec 100644
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
@@ -108,6 +108,10 @@ python () {
         # We don't want the workdir to go away
         d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN'))
 
+        bb.build.addtask('do_buildclean',
+                         'do_clean' if d.getVar('S') == d.getVar('B') else None,
+                         None, d)
+
         # If B=S the same builddir is used even for different architectures.
         # Thus, use a shared CONFIGURESTAMPFILE and STAMP directory so that
         # change of do_configure task hash is correctly detected and stamps are
@@ -143,6 +147,17 @@ python externalsrc_compile_prefunc() {
     bb.plain('NOTE: %s: compiling from external source tree %s' % (d.getVar('PN'), d.getVar('EXTERNALSRC')))
 }
 
+do_buildclean[dirs] = "${S} ${B}"
+do_buildclean[nostamp] = "1"
+do_buildclean[doc] = "Call 'make clean' or equivalent in ${B}"
+externalsrc_do_buildclean() {
+	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
+		oe_runmake clean || die "make failed"
+	else
+		bbnote "nothing to do - no makefile found"
+	fi
+}
+
 def srctree_hash_files(d, srcdir=None):
     import shutil
     import subprocess
@@ -189,3 +204,5 @@ def srctree_configure_hash_files(d):
                 if f in search_files:
                     out_items.append('%s:True' % os.path.join(root, f))
     return ' '.join(out_items)
+
+EXPORT_FUNCTIONS do_buildclean
-- 
2.1.4


