Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE2C77501
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 03:14:08 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 21 Dec 2016 19:14:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,386,1477983600"; d="scan'208";a="45278529"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.181.112])
	by orsmga005.jf.intel.com with ESMTP; 21 Dec 2016 19:14:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 16:13:57 +1300
Message-Id: <181f25ab570147931954417e03c4aaaf0d93ed7b.1482376395.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482376395.git.paul.eggleton@linux.intel.com>
References: <cover.1482376395.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] oe-selftest: fix behaviour if oe-selftest.log is a dangling symlink
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
X-List-Received-Date: Thu, 22 Dec 2016 03:14:08 -0000

If you delete the log file that the oe-selftest.log symlink points to
but not the symlink itself, because we were using os.path.exists() here
the code assumed that the symlink didn't exist when in fact it still
did. Use os.path.lexists() instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-selftest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index bfcea66..1f11a06 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -62,7 +62,8 @@ log_prefix = "oe-selftest-" + t.strftime("%Y%m%d-%H%M%S")
 
 def logger_create():
     log_file = log_prefix + ".log"
-    if os.path.exists("oe-selftest.log"): os.remove("oe-selftest.log")
+    if os.path.lexists("oe-selftest.log"):
+        os.remove("oe-selftest.log")
     os.symlink(log_file, "oe-selftest.log")
 
     log = logging.getLogger("selftest")
-- 
2.5.5


