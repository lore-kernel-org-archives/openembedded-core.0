Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id EA74471A65
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:10 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 3B5C4B8B285; Tue,  6 Dec 2016 12:49:53 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:40 +0100
Message-Id: <1481024991-5882-23-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 22/33] package_manager/deb: implement BAD_RECOMMENDATIONS
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:11 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/rootfs_deb.bbclass |  6 ------
 meta/lib/oe/package_manager.py  | 27 +++++++++++++++++++++++++++
 meta/lib/oe/rootfs.py           |  2 ++
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index f79fca6..18d0b83 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -13,12 +13,6 @@ do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
-python rootfs_deb_bad_recommendations() {
-    if d.getVar("BAD_RECOMMENDATIONS", True):
-        bb.warn("Debian package install does not support BAD_RECOMMENDATIONS")
-}
-do_rootfs[prefuncs] += "rootfs_deb_bad_recommendations"
-
 DEB_POSTPROCESS_COMMANDS = ""
 
 opkglibdir = "${localstatedir}/lib/opkg"
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b18148b..6c5b7ef 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -2198,6 +2198,33 @@ class DpkgPM(OpkgDpkgPM):
 
         return tmp_dir
 
+    def handle_bad_recommendations(self):
+        bad_recommendations = (self.d.getVar("BAD_RECOMMENDATIONS", True) or "").strip()
+        if not bad_recommendations:
+            return
+
+        status_file = self.target_rootfs + "/var/lib/dpkg/status"
+
+        with open(status_file + ".tmp", "w") as status:
+            for pkg in bad_recommendations.split():
+                pkg_info = ('apt-cache', 'show', pkg)
+
+                try:
+                    output = subprocess.check_output(pkg_info, stderr=subprocess.STDOUT).decode("utf-8")
+                except subprocess.CalledProcessError as e:
+                    bb.fatal("Cannot get package info. Command '%s' "
+                             "returned %d:\n%s" % (' '.join(pkg_info), e.returncode, e.output))
+
+                for line in output.splitlines():
+                    if not line:
+                        status.write("Status: hold ok not-installed\n\n")
+                        break
+
+                    if line.startswith(' ') or line.split(': ', 1)[0] not in ('Filename', 'Size', 'MD5sum', 'MSDOS-Filename'):
+                        status.write(line + "\n")
+
+        os.rename(status_file + ".tmp", status_file)
+
 def generate_index_files(d):
     classes = d.getVar('PACKAGE_CLASSES', True).replace("package_", "").split()
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4c82456..b2bb67b 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -663,6 +663,8 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
         self.pm.update()
 
+        self.pm.handle_bad_recommendations()
+
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-- 
2.7.4


