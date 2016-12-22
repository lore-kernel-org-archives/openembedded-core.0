Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D38DA77673
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 13:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 825B011A078
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:59:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BnkiQ2txzG92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:59:50 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 4895C11A079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:59:50 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35BD41E07F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:59:50 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AD321E07B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:59:50 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:59:50 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by seth.se.axis.com (Postfix) with ESMTP id 1EB02450
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:59:50 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 0A4EB7C066; Thu, 22 Dec 2016 14:59:49 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 14:59:49 +0100
Message-Id: <1482415189-29993-1-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH] externalsrc: Add optional srcdir arg to srctree_hash_files
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
X-List-Received-Date: Thu, 22 Dec 2016 13:59:51 -0000

Make it easier to reuse the function for other dirs than EXTERNALSRC.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 meta/classes/externalsrc.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index e115a47..3e38399 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -142,12 +142,12 @@ python externalsrc_compile_prefunc() {
     bb.plain('NOTE: %s: compiling from external source tree %s' % (d.getVar('PN'), d.getVar('EXTERNALSRC')))
 }
 
-def srctree_hash_files(d):
+def srctree_hash_files(d, srcdir=None):
     import shutil
     import subprocess
     import tempfile
 
-    s_dir = d.getVar('EXTERNALSRC')
+    s_dir = srcdir or d.getVar('EXTERNALSRC')
     git_dir = os.path.join(s_dir, '.git')
     oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1')
 
@@ -165,7 +165,7 @@ def srctree_hash_files(d):
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
     else:
-        ret = d.getVar('EXTERNALSRC') + '/*:True'
+        ret = s_dir + '/*:True'
     return ret
 
 def srctree_configure_hash_files(d):
-- 
2.1.4


