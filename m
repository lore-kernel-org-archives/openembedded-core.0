Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F1A9D60796
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 03:43:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jan 2016 19:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,523,1444719600"; d="scan'208";a="853623740"
Received: from hlee31-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.9])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2016 19:43:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 16:43:21 +1300
Message-Id: <93237bd2ce7d1979b7c9f313d885503d708bc085.1451965306.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1451965306.git.paul.eggleton@linux.intel.com>
References: <cover.1451965306.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1451965306.git.paul.eggleton@linux.intel.com>
References: <cover.1451965306.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/buildhistory: actually use KiB in extensible SDK sizes files
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
X-List-Received-Date: Tue, 05 Jan 2016 03:43:43 -0000

I was using bytes here for the sizes and writing out KiB as the suffix.
Change it to actually write out size values in KiB.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 943c8d7..4153e58 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -531,13 +531,14 @@ END
 
 python buildhistory_get_extra_sdkinfo() {
     import operator
+    import math
     if d.getVar('BB_CURRENTTASK', True) == 'populate_sdk_ext':
         tasksizes = {}
         filesizes = {}
         for root, _, files in os.walk('${SDK_OUTPUT}/${SDKPATH}/sstate-cache'):
             for fn in files:
                 if fn.endswith('.tgz'):
-                    fsize = os.path.getsize(os.path.join(root, fn))
+                    fsize = int(math.ceil(float(os.path.getsize(os.path.join(root, fn))) / 1024))
                     task = fn.rsplit(':', 1)[1].split('_', 1)[1].split('.')[0]
                     origtotal = tasksizes.get(task, 0)
                     tasksizes[task] = origtotal + fsize
-- 
2.5.0


