Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id EE89171C0C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 17:24:04 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 10 Dec 2016 09:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,328,1477983600"; d="scan'208";a="38840449"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga004.jf.intel.com with ESMTP; 10 Dec 2016 09:24:06 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Dec 2016 09:21:45 -0800
Message-Id: <1481390505-36840-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: richard.purdie@intel.com
Subject: [PATCH] targetloader.py: drop test for ClassType
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
X-List-Received-Date: Sat, 10 Dec 2016 17:24:06 -0000

ClassType was removed from python3.
The code testing for ClassType kept throwing AttributeError exceptions:

    module 'types' has no attribute 'ClassType'

The exceptions prevented loading of any dynamically resolved target
controllers.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/lib/oeqa/controllers/testtargetloader.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/controllers/testtargetloader.py b/meta/lib/oeqa/controllers/testtargetloader.py
index a1b7b1d..b51d04b 100644
--- a/meta/lib/oeqa/controllers/testtargetloader.py
+++ b/meta/lib/oeqa/controllers/testtargetloader.py
@@ -61,8 +61,6 @@ class TestTargetLoader:
             obj = getattr(module, target)
             if obj: 
                 from oeqa.targetcontrol import BaseTarget
-                if (not isinstance(obj, (type, types.ClassType))):
-                    bb.warn("Target {0} found, but not of type Class".format(target))
                 if( not issubclass(obj, BaseTarget)):
                     bb.warn("Target {0} found, but subclass is not BaseTarget".format(target))
         except:
-- 
2.7.4


