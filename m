Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF2F36067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:39:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2016 05:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1000491860"
Received: from lwong9-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.13])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2016 05:39:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jul 2016 00:38:14 +1200
Message-Id: <694045b5f36c16b26009f249169ec19edc341bc8.1469190931.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/8] classes/buildhistory: ensure eSDK sstate lists sorted secondarily by name
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
X-List-Received-Date: Fri, 22 Jul 2016 12:39:01 -0000

I got fed up with seeing items dance around in sstate-package-sizes.txt
in the buildhistory git repo simply because they have the same size.
Let's sort the list first by size and then also by name to ensure items
with the same size are deterministically sorted.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 943bfc8..2db9145 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -561,11 +561,11 @@ python buildhistory_get_extra_sdkinfo() {
                     tasksizes[task] = origtotal + fsize
                     filesizes[fn] = fsize
         with open(d.expand('${BUILDHISTORY_DIR_SDK}/sstate-package-sizes.txt'), 'w') as f:
-            filesizes_sorted = sorted(filesizes.items(), key=operator.itemgetter(1), reverse=True)
+            filesizes_sorted = sorted(filesizes.items(), key=operator.itemgetter(1, 0), reverse=True)
             for fn, size in filesizes_sorted:
                 f.write('%10d KiB %s\n' % (size, fn))
         with open(d.expand('${BUILDHISTORY_DIR_SDK}/sstate-task-sizes.txt'), 'w') as f:
-            tasksizes_sorted = sorted(tasksizes.items(), key=operator.itemgetter(1), reverse=True)
+            tasksizes_sorted = sorted(tasksizes.items(), key=operator.itemgetter(1, 0), reverse=True)
             for task, size in tasksizes_sorted:
                 f.write('%10d KiB %s\n' % (size, task))
 }
-- 
2.5.5


