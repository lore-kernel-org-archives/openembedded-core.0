Return-Path: <costin.c.constantin@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0E038770C9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:37:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jan 2016 11:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="888277335"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2016 11:37:57 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id AEF8E2C8001;
	Sun, 24 Jan 2016 12:25:50 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 21:49:44 +0200
Message-Id: <1453664991-31706-6-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
References: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
Cc: Lucian Musat <george.l.musat@intel.com>
Subject: [PATCH 06/13] oeqa/testimage: Added support for folder names in TEST_SUITES.
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
X-List-Received-Date: Sun, 24 Jan 2016 19:37:57 -0000

From: Lucian Musat <george.l.musat@intel.com>

You can add oeqa.runtime.<foldername> and it will run all the
tests found in it. Basically extends the functionality of feature
[YOCTO #7834]

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/classes/testimage.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2e963f8..400d16d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -143,7 +143,16 @@ def get_tests_list(d, type="runtime"):
     for testname in testsuites:
         if testname != "auto":
             if testname.startswith("oeqa."):
-                testslist.append(testname)
+                for p in bbpath:
+                    test_location = os.path.join(p, 'lib', os.sep.join(testname.split('.')))
+                    if os.path.isfile(test_location+".py") or \
+                        (os.path.isfile(test_location.rsplit(os.sep, 1)[0]+".py")) or \
+                        (os.path.isfile(test_location.rsplit(os.sep, 2)[0]+".py")):
+                        testslist.append(testname)
+                    elif os.path.isdir(test_location):
+                        for files in os.listdir(test_location):
+                            if (files.endswith(".py")) and not files.startswith("_"):
+                                testslist.append(testname+'.'+files.split('.')[0])
                 continue
             found = False
             for p in bbpath:
-- 
2.5.0


