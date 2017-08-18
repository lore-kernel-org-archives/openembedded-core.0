Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 46FFA78462
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 09:06:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Aug 2017 02:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,392,1498546800"; d="scan'208";a="1163917165"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 18 Aug 2017 02:06:46 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 12:06:45 +0300
Message-Id: <20170818090645.20260-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] oeqa: increase verbosity of dnf commands in dnf packagefeed test
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
X-List-Received-Date: Fri, 18 Aug 2017 09:06:47 -0000

Makes diagnosing failures easier.

[YOCTO #11209]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 6742e8c080..81c50ed97b 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -37,11 +37,11 @@ class DnfSelftest(DnfTest):
 
         import re
         # Use '-y' for non-interactive mode: automatically import the feed signing key
-        output_makecache = self.dnf('-y makecache')
+        output_makecache = self.dnf('-vy makecache')
         self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
         self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
 
-        output_repoinfo = self.dnf('repoinfo')
+        output_repoinfo = self.dnf('-v repoinfo')
         matchobj = re.match(r".*Repo-pkgs\s*:\s*(?P<n_pkgs>[0-9]+)", output_repoinfo, re.DOTALL)
         self.assertTrue(matchobj is not None, msg = "Could not find the amount of packages in dnf repoinfo output: %s" %(output_repoinfo))
         self.assertTrue(int(matchobj.group('n_pkgs')) > 0, msg = "Amount of remote packages is not more than zero: %s\n" %(output_repoinfo))
-- 
2.12.3


