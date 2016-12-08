Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id AD41871C97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:12 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 5BE04B85C90; Thu,  8 Dec 2016 22:48:00 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:45 +0100
Message-Id: <1481233677-27298-22-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 21/33] package_manager/deb: create Packages.xz
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:13 -0000

apt-get prefers it over Packages.gz.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 v2: Added dependencies on xz-native to callers of write_index().

 meta/classes/package_deb.bbclass | 1 +
 meta/classes/rootfs_deb.bbclass  | 4 ++--
 meta/lib/oe/package_manager.py   | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index fb6034c..09bc5b9 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -356,5 +356,6 @@ addtask package_write_deb after do_packagedata do_package
 
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
+PACKAGEINDEXDEPS += "xz-native:do_populate_sysroot"
 
 do_build[recrdeptask] += "do_package_write_deb"
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index f79fca6..332931e 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -5,8 +5,8 @@
 ROOTFS_PKGMANAGE = "dpkg apt"
 ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
-do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
-do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
+do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot xz-native:do_populate_sysroot"
+do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot xz-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 12dff20..b18148b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -304,6 +304,7 @@ class DpkgIndexer(Indexer):
 
         apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
         gzip = bb.utils.which(os.getenv('PATH'), "gzip")
+        xz = bb.utils.which(os.getenv('PATH'), "xz")
 
         index_cmds = []
         deb_dirs_found = False
@@ -315,6 +316,7 @@ class DpkgIndexer(Indexer):
             cmd = "cd %s; PSEUDO_UNLOAD=1 %s packages . > Packages;" % (arch_dir, apt_ftparchive)
 
             cmd += "%s -fc Packages > Packages.gz;" % gzip
+            cmd += "%s -fc Packages > Packages.xz;" % xz
 
             with open(os.path.join(arch_dir, "Release"), "w+") as release:
                 release.write("Label: %s\n" % arch)
-- 
2.7.4


