Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 54A97731BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:28:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 18 Dec 2015 04:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="843990211"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2015 04:28:44 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 761BA6A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:45 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:40:59 +0200
Message-Id: <4c32d4f86ee5638129a4bb7cf2491259b262ffdf.1450441923.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
Subject: [PATCH 07/12] oeqa/runexported: Added support for folder names in TEST_SUITES.
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
X-List-Received-Date: Fri, 18 Dec 2015 12:28:44 -0000

From: Lucian Musat <george.l.musat@intel.com>

It can accept parameters like oeqa.runtime.<foldername> and it
will run all test files from that folder.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runexported.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index f147089..c3ce79a 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -138,6 +138,12 @@ def main():
         for test in tc.testslist:
             print test
     else:
+        for index, test in enumerate(tc.testslist):
+            if os.path.isdir(os.sep.join(test.split('.'))):
+                del tc.testslist[index]
+                for files in os.listdir(os.sep.join(test.split('.'))):
+                    if (files.endswith(".py")) and not files.startswith("_"):
+                        tc.testslist.insert(index, test+'.'+files.split('.')[0])
         target.exportStart()
         runTests(tc)
 
-- 
2.5.0


