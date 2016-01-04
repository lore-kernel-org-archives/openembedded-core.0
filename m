Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBE46FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 12:22:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2016 04:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,520,1444719600"; d="scan'208";a="719855611"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 04 Jan 2016 04:22:24 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 287536A4002;
	Mon,  4 Jan 2016 05:10:21 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 14:25:24 +0200
Message-Id: <1451910324-5914-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oe-selftest: Improved --list-classes when determining test names
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
X-List-Received-Date: Mon, 04 Jan 2016 12:22:25 -0000

--list-classes does a weak validation when determining test names:
(if method.startswith("test_") which could report any class attribute
that starts with 'test_' as a valid test case.

This fix checks that the class attribute that starts with 'test_'
is also callable (is a method).

Fix for [YOCTO #8862]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 scripts/oe-selftest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 08a5af3..65d6b5e 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -404,7 +404,7 @@ def main():
                         if isinstance(t, type(oeSelfTest)) and issubclass(t, oeSelfTest) and t!=oeSelfTest:
                             print " --", v
                             for method in dir(t):
-                                if method.startswith("test_"):
+                                if method.startswith("test_") and hasattr(vars(t)[method], '__call__'):
                                     print " --  --", method
 
                 except (AttributeError, ImportError) as e:
-- 
2.1.0


