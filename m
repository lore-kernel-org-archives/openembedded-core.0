Return-Path: <william.c.randle@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 291746FF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:11:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 12 Apr 2016 15:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,476,1455004800"; d="scan'208";a="931097487"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.0.173])
	by orsmga001.jf.intel.com with ESMTP; 12 Apr 2016 15:11:30 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:10:51 -0700
Message-Id: <1460499052-14368-2-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1460499052-14368-1-git-send-email-william.c.randle@intel.com>
References: <1460499052-14368-1-git-send-email-william.c.randle@intel.com>
Subject: [PATCH 1/2] rootfs.py: apply ROOTFS_POSTINSTALL_COMMAND to all package formats
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
X-List-Received-Date: Tue, 12 Apr 2016 22:11:29 -0000

Previously, ROOTFS_POSTINSTALL_COMMAND was run only after the opkg rootfs
install post processing phase. This patch makes it generic so it is run fter
any package manager specific rootfs post processing, but before _run_intercepts().

[YOCTO #9248]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/lib/oe/rootfs.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index bfae1d8..a95e1b7 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -173,6 +173,7 @@ class Rootfs(object):
         bb.note("###### Generate rootfs #######")
         pre_process_cmds = self.d.getVar("ROOTFS_PREPROCESS_COMMAND", True)
         post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND", True)
+        rootfs_post_install_cmds = self.d.getVar('ROOTFS_POSTINSTALL_COMMAND', True)
 
         postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR", True)
         if not postinst_intercepts_dir:
@@ -202,6 +203,8 @@ class Rootfs(object):
         with open(sysconfdir + "/version", "w+") as ver:
             ver.write(self.d.getVar('BUILDNAME', True) + "\n")
 
+        execute_pre_post_process(self.d, rootfs_post_install_cmds)
+
         self._run_intercepts()
 
         execute_pre_post_process(self.d, post_process_cmds)
@@ -877,7 +880,6 @@ class OpkgRootfs(DpkgOpkgRootfs):
         pkgs_to_install = self.manifest.parse_initial_manifest()
         opkg_pre_process_cmds = self.d.getVar('OPKG_PREPROCESS_COMMANDS', True)
         opkg_post_process_cmds = self.d.getVar('OPKG_POSTPROCESS_COMMANDS', True)
-        rootfs_post_install_cmds = self.d.getVar('ROOTFS_POSTINSTALL_COMMAND', True)
 
         # update PM index files, unless users provide their own feeds
         if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', True) or "") != "1":
@@ -908,7 +910,6 @@ class OpkgRootfs(DpkgOpkgRootfs):
         self._setup_dbg_rootfs(['/var/lib/opkg'])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
-        execute_pre_post_process(self.d, rootfs_post_install_cmds)
 
         if self.inc_opkg_image_gen == "1":
             self.pm.backup_packaging_data()
-- 
2.5.0


