Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 40F4F71A4B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:08 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id EE61EB88D8E; Tue,  6 Dec 2016 12:49:53 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:39 +0100
Message-Id: <1481024991-5882-22-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 21/33] package_manager/deb: create Packages.xz
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:08 -0000

apt-get prefers it over Packages.gz.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/lib/oe/package_manager.py | 2 ++
 1 file changed, 2 insertions(+)

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


