Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 78C3D77501
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 03:14:11 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 21 Dec 2016 19:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,386,1477983600"; d="scan'208";a="45278541"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.181.112])
	by orsmga005.jf.intel.com with ESMTP; 21 Dec 2016 19:14:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 16:13:58 +1300
Message-Id: <af03426da1f2d00149a2021b8d681b2dcef3a1ea.1482376395.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482376395.git.paul.eggleton@linux.intel.com>
References: <cover.1482376395.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] classes/buildstats: don't expand variable pointing to SystemStats
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
X-List-Received-Date: Thu, 22 Dec 2016 03:14:11 -0000

We're placing an object into the datastore - it's very definitely not
something we want to be expanding.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildstats.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 8703cb2..8d7b598 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -197,7 +197,7 @@ python runqueue_stats () {
     # are available that we need to find the output directory.
     # The persistent SystemStats is stored in the datastore and
     # closed when the build is done.
-    system_stats = d.getVar('_buildstats_system_stats')
+    system_stats = d.getVar('_buildstats_system_stats', False)
     if not system_stats and isinstance(e, (bb.runqueue.sceneQueueTaskStarted, bb.runqueue.runQueueTaskStarted)):
         system_stats = buildstats.SystemStats(d)
         d.setVar('_buildstats_system_stats', system_stats)
-- 
2.5.5


