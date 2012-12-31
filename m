Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gilbert_coville@mentor.com>) id 1Tpkce-0007OB-8m
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 20:02:09 +0100
Received: from ghc.alm.mentorg.com ([134.86.96.237])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qBVIl3aF032274;
	Mon, 31 Dec 2012 12:47:03 -0600
From: Gilbert Coville <gilbert_coville@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2012 12:47:35 -0600
Message-Id: <1356979656-998-1-git-send-email-gilbert_coville@mentor.com>
X-Mailer: git-send-email 1.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] copyleft_compliance: grab the scm mirror tarballs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Dec 2012 19:02:09 -0000

From: Christopher Larson <chris_larson@mentor.com>

If the mirror tarball is available, it's a better choice for this than the
repository directory.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Gilbert Coville <gilbert_coville@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index e68942d..786cf1e 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -13,6 +13,7 @@ COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
 
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files"""
+    import os.path
     import shutil
 
     p = d.getVar('P', True)
@@ -24,22 +25,27 @@ python do_prepare_copyleft_sources () {
         bb.debug(1, 'copyleft: %s is included: %s' % (p, reason))
 
     sources_dir = d.getVar('COPYLEFT_SOURCES_DIR', True)
+    dl_dir = d.getVar('DL_DIR', True)
     src_uri = d.getVar('SRC_URI', True).split()
     fetch = bb.fetch2.Fetch(src_uri, d)
     ud = fetch.ud
 
-    locals = (fetch.localpath(url) for url in fetch.urls)
-    localpaths = [local for local in locals if not local.endswith('.bb')]
-    if not localpaths:
-        return
-
     pf = d.getVar('PF', True)
     dest = os.path.join(sources_dir, pf)
     shutil.rmtree(dest, ignore_errors=True)
     bb.mkdirhier(dest)
 
-    for path in localpaths:
-        os.symlink(path, os.path.join(dest, os.path.basename(path)))
+    for u in ud.values():
+        local = os.path.normpath(fetch.localpath(u.url))
+        if local.endswith('.bb'):
+            continue
+
+        if u.mirrortarball:
+            tarball_path = os.path.join(dl_dir, u.mirrortarball)
+            if os.path.exists(tarball_path):
+                local = tarball_path
+
+        os.symlink(local, os.path.join(dest, os.path.basename(local)))
 
     patches = src_patches(d)
     for patch in patches:
-- 
1.8.0



