Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A7A1571985
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:30:55 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 06 Feb 2017 12:30:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="61869039"
Received: from mmurr6x-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.252.199.82])
	by fmsmga005.fm.intel.com with ESMTP; 06 Feb 2017 12:30:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 09:30:49 +1300
Message-Id: <8dcf30d04d29fe27743ae28077c054dfc52471f1.1486412900.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1486412900.git.paul.eggleton@linux.intel.com>
References: <cover.1486412900.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] classes/patch: switch to new bb.build.tasksbetween() function
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
X-List-Received-Date: Mon, 06 Feb 2017 20:30:56 -0000

A generic version of the code to work out the tasks between two
tasks (based on the code here) has been added to bb.build, so use that
instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/patch.bbclass | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index d0806bc..8f35cb4 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -12,25 +12,7 @@ inherit terminal
 
 python () {
     if d.getVar('PATCHTOOL') == 'git' and d.getVar('PATCH_COMMIT_FUNCTIONS') == '1':
-        tasks = list(filter(lambda k: d.getVarFlag(k, "task"), d.keys()))
-        extratasks = []
-        def follow_chain(task, endtask, chain=None):
-            if not chain:
-                chain = []
-            chain.append(task)
-            for othertask in tasks:
-                if othertask == task:
-                    continue
-                if task == endtask:
-                    for ctask in chain:
-                        if ctask not in extratasks:
-                            extratasks.append(ctask)
-                else:
-                    deps = d.getVarFlag(othertask, 'deps', False)
-                    if task in deps:
-                        follow_chain(othertask, endtask, chain)
-            chain.pop()
-        follow_chain('do_unpack', 'do_patch')
+        extratasks = bb.build.tasksbetween('do_unpack', 'do_patch', d)
         try:
             extratasks.remove('do_unpack')
         except ValueError:
-- 
2.9.3


