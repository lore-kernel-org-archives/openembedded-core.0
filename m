Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 673F36E666
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 13:15:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 05:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="905998786"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.3.17])
	by orsmga001.jf.intel.com with ESMTP; 09 Mar 2016 05:15:33 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 13:15:25 +0000
Message-Id: <1457529325-12211-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] lib/sstatesig: skip shared_workdir when checking locked sigs
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
X-List-Received-Date: Wed, 09 Mar 2016 13:15:35 -0000

do_shared_workdir is not a proper sstate task, it always reruns if
needed, so special-case it in warnings when checking locked sigs.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/sstatesig.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index d65586b..4f115e9 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -194,6 +194,8 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             if task not in ret:
                 for pn in self.lockedsigs:
                     if sq_hash[task] in self.lockedsigs[pn].itervalues():
+                        if sq_task[task] == 'do_shared_workdir':
+                            continue
                         self.mismatch_msgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
                                                % (pn, sq_task[task], sq_hash[task]))
 
-- 
2.5.0


