Return-Path: <jose.perez.carranza@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 042DE74197
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 15:28:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 10 Aug 2016 08:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,500,1464678000"; d="scan'208";a="863097534"
Received: from jgperezc-mobl1.zpn.intel.com ([10.219.5.37])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 08:28:49 -0700
From: Jose Perez Carranza <jose.perez.carranza@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 10:36:17 -0500
Message-Id: <1470843377-8185-1-git-send-email-jose.perez.carranza@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] buildperf: Add support for times without decimal part
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
X-List-Received-Date: Wed, 10 Aug 2016 15:28:54 -0000

Add logic for the cases when the time retrieved does
not have decimal part.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 527563b..1eb21f6 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -244,7 +244,11 @@ class BuildPerfTest(object):
             split = strtime.split(':')
             hours = int(split[0]) if len(split) > 2 else 0
             mins = int(split[-2])
-            secs, frac = split[-1].split('.')
+            try:
+                secs, frac = split[-1].split('.')
+            except:
+                secs = split[-1]
+                frac = '0'
             secs = int(secs)
             microsecs = int(float('0.' + frac) * pow(10, 6))
             return timedelta(0, hours*3600 + mins*60 + secs, microsecs)
-- 
1.9.1


