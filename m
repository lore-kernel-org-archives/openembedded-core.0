Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDCE6CAD5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 10:08:56 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Feb 2014 02:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,799,1384329600"; d="scan'208";a="409142497"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 07 Feb 2014 02:08:56 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id AA2476A4007;
	Fri,  7 Feb 2014 02:08:48 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2014 12:08:51 +0200
Message-Id: <1391767731-10158-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] scripts/oe-selftest: return based on the test results
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
X-List-Received-Date: Fri, 07 Feb 2014 10:08:56 -0000

Regardless if the tests passed or not the script returned 0,
which isn't what one would expect.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/oe-selftest | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 29fe010..8c4ea92 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -144,8 +144,10 @@ def main():
     add_include()
     result = runner.run(suite)
     log.info("Finished")
-
-    return 0
+    if result.wasSuccessful():
+        return 0
+    else:
+        return 1
 
 if __name__ == "__main__":
     try:
-- 
1.8.5.3


