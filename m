Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1ABEE71E0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B9A621832E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:49:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qb8VobEpwBqH
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:49:48 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id D50B71832D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:49:47 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5434D1A069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:49:47 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4981B1A066
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:49:47 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:49:47 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 3DEC8A25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:49:47 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id F350C7C066; Wed, 25 Jan 2017 16:49:46 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 16:49:46 +0100
Message-Id: <1485359386-9793-1-git-send-email-olani@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH] externalsrc: Hide created symlinks with .git/info/exclude
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
X-List-Received-Date: Wed, 25 Jan 2017 15:49:51 -0000

Add created symlinks to the exclude file.  This will both make them
less distracting and hide them from the srctree_hash_files function.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes/externalsrc.bbclass | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index bdf23ec..39789ea 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -124,11 +124,13 @@ python () {
 }
 
 python externalsrc_configure_prefunc() {
+    s_dir = d.getVar('S')
     # Create desired symlinks
     symlinks = (d.getVar('EXTERNALSRC_SYMLINKS') or '').split()
+    newlinks = []
     for symlink in symlinks:
         symsplit = symlink.split(':', 1)
-        lnkfile = os.path.join(d.getVar('S'), symsplit[0])
+        lnkfile = os.path.join(s_dir, symsplit[0])
         target = d.expand(symsplit[1])
         if len(symsplit) > 1:
             if os.path.islink(lnkfile):
@@ -140,6 +142,19 @@ python externalsrc_configure_prefunc() {
                 # File/dir exists with same name as link, just leave it alone
                 continue
             os.symlink(target, lnkfile)
+            newlinks.append(symsplit[0])
+    # Hide the symlinks from git
+    try:
+        git_exclude_file = os.path.join(s_dir, '.git/info/exclude')
+        if os.path.exists(git_exclude_file):
+            with open(git_exclude_file, 'r+') as efile:
+                elines = efile.readlines()
+                for link in newlinks:
+                    if link in elines or '/'+link in elines:
+                        continue
+                    efile.write('/' + link + '\n')
+    except IOError as ioe:
+        bb.note('Failed to hide EXTERNALSRC_SYMLINKS from git')
 }
 
 python externalsrc_compile_prefunc() {
-- 
2.1.4


