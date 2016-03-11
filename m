Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA97731E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 15:34:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2016 07:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,321,1455004800"; d="scan'208";a="931818040"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2016 07:34:05 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 07:29:17 +0000
Message-Id: <35fe3bae8c679fba140648711209c31300f4948d.1457679835.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1457679835.git.mariano.lopez@linux.intel.com>
References: <cover.1457679835.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] package_manager.py: Fix race condition in OpkgIndexer.write_index()
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
X-List-Received-Date: Fri, 11 Mar 2016 15:34:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

When writing the index using ipk packages there could be a race condition
when populate the index. This happens because the architectures
are repeated (specially all) and the commands generated to write the index
run in parallel.

This change avoid the duplication of commands using a set instead of a list.

[YOCTO #8924]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b701b8c..fe3f8c5 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -157,7 +157,7 @@ class OpkgIndexer(Indexer):
         if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
             open(os.path.join(self.deploy_dir, "Packages"), "w").close()
 
-        index_cmds = []
+        index_cmds = set()
         for arch_var in arch_vars:
             archs = self.d.getVar(arch_var, True)
             if archs is None:
@@ -173,7 +173,7 @@ class OpkgIndexer(Indexer):
                 if not os.path.exists(pkgs_file):
                     open(pkgs_file, "w").close()
 
-                index_cmds.append('%s -r %s -p %s -m %s' %
+                index_cmds.add('%s -r %s -p %s -m %s' %
                                   (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
 
         if len(index_cmds) == 0:
-- 
2.6.2


