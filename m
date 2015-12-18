Return-Path: <costin.c.constantin@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 176F0731BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:28:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 04:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="874234783"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2015 04:28:44 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id B99F46A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:42 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:40:58 +0200
Message-Id: <5ed262db12550b462a54103366e564a336d2729f.1450441923.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
Subject: [PATCH 06/12] oeqa/testimage: Added support for folder names in TEST_SUITES.
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
X-List-Received-Date: Fri, 18 Dec 2015 12:28:45 -0000

From: Lucian Musat <george.l.musat@intel.com>

You can add oeqa.runtime.<foldername> and it will run all the
tests found in it. Basically extends the functionality of feature
[YOCTO #7834]

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/classes/testimage.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index bcf113f..40442b7 100644
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
2.5.0


