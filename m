Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.1051.1629822357303292137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360259"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360259"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658959"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:49 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/28] oeqa/runtime/cases: make date.DateTest.test_date more reliable
Date: Wed, 25 Aug 2021 00:25:13 +0800
Message-Id: <09e238635c8d4cd595c2233a14c2ce1cbb9e5162.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The test uses the broken out time and can only handle about 59s of delay,
use a UNIX timestamp to allow for up to a 300s delay.

[YOCTO #14463]

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b705e9373acd4119da75af4eb96ec92cc964aa86)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/date.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index e14322911d..bd6537400e 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -28,14 +28,13 @@ class DateTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
         oldDate = output
 
-        sampleDate = '"2016-08-09 10:00:00"'
-        (status, output) = self.target.run("date -s %s" % sampleDate)
+        sampleTimestamp = 1488800000
+        (status, output) = self.target.run("date -s @%d" % sampleTimestamp)
         self.assertEqual(status, 0, msg='Date set failed, output: %s' % output)
 
-        (status, output) = self.target.run("date -R")
-        p = re.match('Tue, 09 Aug 2016 10:00:.. \+0000', output)
+        (status, output) = self.target.run('date +"%s"')
         msg = 'The date was not set correctly, output: %s' % output
-        self.assertTrue(p, msg=msg)
+        self.assertTrue(int(output) - sampleTimestamp < 300, msg=msg)
 
         (status, output) = self.target.run('date -s "%s"' % oldDate)
         msg = 'Failed to reset date, output: %s' % output
-- 
2.31.1

