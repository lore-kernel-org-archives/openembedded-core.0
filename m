Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB9C76A51
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:13:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2016 12:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,447,1449561600"; d="scan'208";a="884576078"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.221])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2016 12:13:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 09:13:03 +1300
Message-Id: <db0b6c90569da44ceb5735490dedef98fedd423c.1455480748.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455480748.git.paul.eggleton@linux.intel.com>
References: <cover.1455480748.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455480748.git.paul.eggleton@linux.intel.com>
References: <cover.1455480748.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/buildhistory: fix for python function parsing change
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
X-List-Received-Date: Sun, 14 Feb 2016 20:13:33 -0000

Variable expressions are no longer expanded in python functions as of
BitBake commit 8bf33a8e92c0e188fa392030025756196c96fcbb, so we've now
got to do this explicitly here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index a5a85ff..4854862 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -538,7 +538,7 @@ python buildhistory_get_extra_sdkinfo() {
     if d.getVar('BB_CURRENTTASK', True) == 'populate_sdk_ext':
         tasksizes = {}
         filesizes = {}
-        for root, _, files in os.walk('${SDK_OUTPUT}/${SDKPATH}/sstate-cache'):
+        for root, _, files in os.walk(d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')):
             for fn in files:
                 if fn.endswith('.tgz'):
                     fsize = int(math.ceil(float(os.path.getsize(os.path.join(root, fn))) / 1024))
@@ -546,11 +546,11 @@ python buildhistory_get_extra_sdkinfo() {
                     origtotal = tasksizes.get(task, 0)
                     tasksizes[task] = origtotal + fsize
                     filesizes[fn] = fsize
-        with open('${BUILDHISTORY_DIR_SDK}/sstate-package-sizes.txt', 'w') as f:
+        with open(d.expand('${BUILDHISTORY_DIR_SDK}/sstate-package-sizes.txt'), 'w') as f:
             filesizes_sorted = sorted(filesizes.items(), key=operator.itemgetter(1), reverse=True)
             for fn, size in filesizes_sorted:
                 f.write('%10d KiB %s\n' % (size, fn))
-        with open('${BUILDHISTORY_DIR_SDK}/sstate-task-sizes.txt', 'w') as f:
+        with open(d.expand('${BUILDHISTORY_DIR_SDK}/sstate-task-sizes.txt'), 'w') as f:
             tasksizes_sorted = sorted(tasksizes.items(), key=operator.itemgetter(1), reverse=True)
             for task, size in tasksizes_sorted:
                 f.write('%10d KiB %s\n' % (size, task))
-- 
2.5.0


