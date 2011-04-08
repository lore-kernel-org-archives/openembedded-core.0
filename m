Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q88YX-0008HU-LU
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 12:04:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Apr 2011 03:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,322,1299484800"; d="scan'208";a="415959631"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 08 Apr 2011 03:01:30 -0700
Message-Id: <22750afce467a2b203c9e21c3db6f392f0599816.1302256139.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302256139.git.dexuan.cui@intel.com>
References: <cover.1302256139.git.dexuan.cui@intel.com>
Old-Date: Thu, 7 Apr 2011 17:38:17 +0800
Date: Fri, 08 Apr 2011 17:59:32 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 1/2] sstate: ensure an ordered mapping between SSTATETASKS and SSTATETASKNAMES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Apr 2011 10:04:46 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Fix [YOCTO #964]

A recent commit 25a6e5f9(sstate: use only unique set of SSTATETASK) breaks
the ordered mapping between SSTATETASKS and SSTATETASKNAMES. As a result,
in sstate_cleanall, the line
taskname = tasks[namemap.index(name)]
gets an incorrect result, and "bitbake -c cleanall" doesn't really remove
the files populalted by do_populate_sysroot.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/sstate.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index cc0b866..be650c4 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -39,8 +39,10 @@ python () {
         scan_cmd = "grep -Irl ${STAGING_DIR} ${SSTATE_BUILDDIR}"
         bb.data.setVar('SSTATE_SCAN_CMD', scan_cmd, d)
 
+    unique_tasks = set((bb.data.getVar('SSTATETASKS', d, True) or "").split())
+    d.setVar('SSTATETASKS', " ".join(unique_tasks))
     namemap = []
-    for task in set((bb.data.getVar('SSTATETASKS', d, True) or "").split()):
+    for task in unique_tasks:
         namemap.append(bb.data.getVarFlag(task, 'sstate-name', d))
         funcs = bb.data.getVarFlag(task, 'prefuncs', d) or ""
         funcs = "sstate_task_prefunc " + funcs
@@ -200,7 +202,7 @@ def sstate_clean_cachefile(ss, d):
     oe.path.remove(sstatepkgfile)
 
 def sstate_clean_cachefiles(d):
-    for task in set((bb.data.getVar('SSTATETASKS', d, True) or "").split()):
+    for task in (bb.data.getVar('SSTATETASKS', d, True) or "").split():
         ss = sstate_state_fromvars(d, task[3:])
         sstate_clean_cachefile(ss, d)
 
-- 
1.7.2



