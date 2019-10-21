Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23D087F49D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E3B621832C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:40 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id HHw7VjqaEPUe
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:35 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 98C0218359
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:35 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8626D1E07B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:35 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B0401E07A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:35 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:35 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 6E4112E65
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 68EF540AB2; Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 12:30:29 +0200
Message-Id: <20191021103034.12200-4-olani@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021103034.12200-1-olani@axis.com>
References: <20191021103034.12200-1-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 4/9] lib/oe/package_manager: Use with to control file handle lifetime
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
X-List-Received-Date: Mon, 21 Oct 2019 10:30:40 -0000

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/lib/oe/package_manager.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 7c373715ad..c841fdbf29 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -298,7 +298,7 @@ class DpkgIndexer(Indexer):
                 release.write("Label: %s\n" % arch)
 
             cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
-            
+
             index_cmds.append(cmd)
 
             deb_dirs_found = True
@@ -655,7 +655,7 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
     pn = d.getVar("PN")
     seendirs = set()
     multilibs = {}
-   
+
     bb.utils.remove(subrepo_dir, recurse=True)
     bb.utils.mkdirhier(subrepo_dir)
 
@@ -1006,8 +1006,8 @@ class RpmPM(PackageManager):
     def load_old_install_solution(self):
         if not os.path.exists(self.solution_manifest):
             return []
-
-        return open(self.solution_manifest, 'r').read().split()
+        with open(self.solution_manifest, 'r') as fd:
+            return fd.read().split()
 
     def _script_num_prefix(self, path):
         files = os.listdir(path)
-- 
2.11.0


