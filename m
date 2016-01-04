Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A9A2B731D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:40:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 04 Jan 2016 05:40:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,520,1444719600"; d="scan'208";a="627742203"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Jan 2016 05:40:57 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 351B06A4002;
	Mon,  4 Jan 2016 06:28:54 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 15:43:56 +0200
Message-Id: <1451915036-9767-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCHv2] oe-selftest: Improved --list-classes when determining test names
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
X-List-Received-Date: Mon, 04 Jan 2016 13:40:56 -0000

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
index 08a5af3..1aee057 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -404,7 +404,7 @@ def main():
                         if isinstance(t, type(oeSelfTest)) and issubclass(t, oeSelfTest) and t!=oeSelfTest:
                             print " --", v
                             for method in dir(t):
-                                if method.startswith("test_"):
+                                if method.startswith("test_") and callable(vars(t)[method]):
                                     print " --  --", method
 
                 except (AttributeError, ImportError) as e:
-- 
2.1.0


