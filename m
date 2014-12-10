Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id E63FA7235C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:54:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 13B551C9B31;
	Wed, 10 Dec 2014 12:46:34 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>>,
	Rifenbark Scott <scott.m.rifenbark@intel.com>
Date: Wed, 10 Dec 2014 12:45:57 +0100
Message-Id: <1418211958-27738-3-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1418211958-27738-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1418211958-27738-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 2/3] wic: add globbing support in IMAGE_BOOT_FILES entries
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
X-List-Received-Date: Wed, 10 Dec 2014 11:54:28 -0000

Adding glob support for entries in IMAGE_BOOT_FILES. Files picked up by
glob are by default installed under their basename, as this is likely
most common use case. Target name for globbed entries specifies the
name of directory in which files will be installed withing the partition.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 .../lib/wic/plugins/source/bootimg-partition.py    | 41 +++++++++++++++++-----
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 564118a..6ba39a0 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -29,6 +29,7 @@ import re
 from wic import msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.oe.misc import *
+from glob import glob
 
 class BootimgPartitionPlugin(SourcePlugin):
     name = 'bootimg-partition'
@@ -87,7 +88,7 @@ class BootimgPartitionPlugin(SourcePlugin):
 
         # list of tuples (src_name, dst_name)
         deploy_files = []
-        for src_entry in re.findall(r'[\w;\-\./]+', boot_files):
+        for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
             if ';' in src_entry:
                 dst_entry = tuple(src_entry.split(';'))
                 if not dst_entry[0] or not dst_entry[1]:
@@ -100,14 +101,36 @@ class BootimgPartitionPlugin(SourcePlugin):
 
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
-            src_path = os.path.join(bootimg_dir, src)
-            dst_path = os.path.join(hdddir, dst)
-
-            msger.debug('Install %s as %s' % (os.path.basename(src_path),
-                                              dst_path))
-            install_cmd = "install -m 0644 -D %s %s" \
-                          % (src_path, dst_path)
-            exec_cmd(install_cmd)
+            install_task = []
+            if '*' in src:
+                # by default install files under their basename
+                entry_name_fn = os.path.basename
+                if dst != src:
+                    # unless a target name was given, then treat name
+                    # as a directory and append a basename
+                    entry_name_fn = lambda name: \
+                                    os.path.join(dst,
+                                                 os.path.basename(name))
+
+                srcs = glob(os.path.join(bootimg_dir, src))
+
+                msger.debug('Globbed sources: %s' % (', '.join(srcs)))
+                for entry in srcs:
+                    entry_dst_name = entry_name_fn(entry)
+                    install_task.append((entry,
+                                         os.path.join(hdddir,
+                                                      entry_dst_name)))
+            else:
+                install_task = [(os.path.join(bootimg_dir, src),
+                                 os.path.join(hdddir, dst))]
+
+            for task in install_task:
+                src_path, dst_path = task
+                msger.debug('Install %s as %s' % (os.path.basename(src_path),
+                                                  dst_path))
+                install_cmd = "install -m 0644 -D %s %s" \
+                              % (src_path, dst_path)
+                exec_cmd(install_cmd)
 
         msger.debug('Prepare boot partition using rootfs in %s' % (hdddir))
         part.prepare_rootfs(cr_workdir, oe_builddir, hdddir,
-- 
1.9.3


