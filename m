Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494680"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494680"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075558"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:04 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 23/28] oeqa/selftest/multiprocesslauch: Fix test race
Date: Fri, 16 Jul 2021 10:42:21 +0800
Message-Id: <22079206130005324c5b3cd11fdb1f4921a725c2.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Having two possible failures in multiprocesslauch creates a race where one failure
may occur and stop processes being lanuched meaning the second failure may not
be seen. Rather than having periodic races appearing on the autobuilder, only
have one failure, making the test much more deterministic.

[YOCTO #13054]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31e9dcda40aae3ce0801580c838928956e1455e3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/oelib/utils.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index a7214beb4c..bbf67bf9c9 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -64,7 +64,7 @@ class TestMultiprocessLaunch(TestCase):
         import bb
 
         def testfunction(item, d):
-            if item == "2" or item == "1":
+            if item == "2":
                 raise KeyError("Invalid number %s" % item)
             return "Found %s" % item
 
@@ -99,5 +99,4 @@ class TestMultiprocessLaunch(TestCase):
         # Assert the function prints exceptions
         with captured_output() as (out, err):
             self.assertRaises(bb.BBHandledException, multiprocess_launch, testfunction, ["1", "2", "3", "4", "5", "6"], d, extraargs=(d,))
-        self.assertIn("KeyError: 'Invalid number 1'", out.getvalue())
         self.assertIn("KeyError: 'Invalid number 2'", out.getvalue())
-- 
2.31.1

