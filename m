Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 754487713C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 02:54:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2016 18:54:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,347,1449561600"; d="scan'208";a="36152749"
Received: from wkhoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.195])
	by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2016 18:54:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 15:53:57 +1300
Message-Id: <48f8fd59c0285bd76e68abf8fdc9393e24470c1f.1453776397.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453776397.git.paul.eggleton@linux.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453776397.git.paul.eggleton@linux.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] devtool: properly handle bb.build.FuncFailed when extracting source
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
X-List-Received-Date: Tue, 26 Jan 2016 02:54:40 -0000

When we run the tasks required to extract the source for a recipe (e.g.
within "devtool modify" or "devtool extract") if one of those tasks
fails you get a bb.build.FuncFailed exception; handle this properly so
you don't see a traceback.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 187dff2..18daf84 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -386,7 +386,10 @@ class BbTaskExecutor(object):
                 logger.info('Executing %s...' % func)
             fn = self.rdata.getVar('FILE', True)
             localdata = bb.build._task_data(fn, func, self.rdata)
-            bb.build.exec_func(func, localdata)
+            try:
+                bb.build.exec_func(func, localdata)
+            except bb.build.FuncFailed as e:
+                raise DevtoolError(str(e))
             self.executed.append(func)
 
 
-- 
2.5.0


