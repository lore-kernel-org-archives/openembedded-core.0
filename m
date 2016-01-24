Return-Path: <costin.c.constantin@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E9D43770CA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:37:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jan 2016 11:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="888277345"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2016 11:37:58 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 1FAE12C8001;
	Sun, 24 Jan 2016 12:25:52 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 21:49:45 +0200
Message-Id: <1453664991-31706-7-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
References: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
Cc: Lucian Musat <george.l.musat@intel.com>
Subject: [PATCH 07/13] oeqa/runexported: Added support for folder names in TEST_SUITES.
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
X-List-Received-Date: Sun, 24 Jan 2016 19:37:58 -0000

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


