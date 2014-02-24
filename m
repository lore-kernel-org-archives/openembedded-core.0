Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1573B6E92F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:06:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2014 08:06:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="487168760"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2014 08:06:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 16:05:46 +0000
Message-Id: <094cc9139bb8c25448db05b35e7e6cd9ef1dda53.1393257867.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393257867.git.paul.eggleton@linux.intel.com>
References: <cover.1393257867.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393257867.git.paul.eggleton@linux.intel.com>
References: <cover.1393257867.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] classes/utility-tasks: make do_listtasks a little more friendly
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
X-List-Received-Date: Mon, 24 Feb 2014 16:06:24 -0000

* Sort the list so it's at least in some form of logical order. I looked
  at sorting by dependencies, but that's a topological sort, and given
  no such function is shipped as part of the python standard libraries
  it would seem excessive to pull one in just for this. In any case, I'm
  not sure that for the data we have this would lead to any particularly
  pleasing result.
* Show the doc values as defined in documentation.conf (where present)
  as a description

Addresses [YOCTO #4856].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/utility-tasks.bbclass | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 507e0f1..1792f18 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -1,13 +1,20 @@
 addtask listtasks
 do_listtasks[nostamp] = "1"
 python do_listtasks() {
-    import sys
-    # emit variables and shell functions
-    #bb.data.emit_env(sys.__stdout__, d)
-    # emit the metadata which isnt valid shell
+    taskdescs = {}
+    maxlen = 0
     for e in d.keys():
         if d.getVarFlag(e, 'task'):
-            bb.plain("%s" % e)
+            maxlen = max(maxlen, len(e))
+            if e.endswith('_setscene'):
+                desc = "%s (setscene version)" % (d.getVarFlag(e[:-9], 'doc') or '')
+            else:
+                desc = d.getVarFlag(e, 'doc') or ''
+            taskdescs[e] = desc
+
+    tasks = sorted(taskdescs.keys())
+    for taskname in tasks:
+        bb.plain("%s  %s" % (taskname.ljust(maxlen), taskdescs[taskname]))
 }
 
 CLEANFUNCS ?= ""
-- 
1.8.5.3


