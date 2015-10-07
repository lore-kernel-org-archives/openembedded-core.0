Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E41560125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 09:18:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Oct 2015 02:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,648,1437462000"; d="scan'208";a="659459322"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 07 Oct 2015 02:18:27 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 6859D6A4083;
	Wed,  7 Oct 2015 02:17:30 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Oct 2015 12:18:27 +0300
Message-Id: <1444209507-24955-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/testimage: Added support for folder names in TEST_SUITES.
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
X-List-Received-Date: Wed, 07 Oct 2015 09:18:29 -0000

You can add oeqa.runtime.<foldername> and it will run all the
tests found in it. Basically extends the functionality of feature
[YOCTO #7834]

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/classes/testimage.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index b4d4a69..c575db1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -140,7 +140,16 @@ def get_tests_list(d, type="runtime"):
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
2.1.4


