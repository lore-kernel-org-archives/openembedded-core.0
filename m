Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A73B57D444
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:19:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2019 02:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="132891038"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 04 Apr 2019 02:19:41 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 16:48:36 +0800
Message-Id: <1554367718-74682-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554367718-74682-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1554367718-74682-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/4] resulttool/manualexecution: Enable display full steps without press enter
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
X-List-Received-Date: Thu, 04 Apr 2019 09:19:41 -0000

Current manualexecution required pressing enter button to show each step
information, where this was wasting execution time. Enable display
full steps without needing to any press enter button.

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 8ce7903..0783540 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -87,8 +87,9 @@ class ManualTestRunner(object):
         print('------------------------------------------------------------------------\n')
         for step in sorted((self.jdata[test_id]['test']['execution']).keys()):
             print('Step %s: ' % step + self.jdata[test_id]['test']['execution']['%s' % step]['action'])
-            print('Expected output: ' + self.jdata[test_id]['test']['execution']['%s' % step]['expected_results'])
-            done = input('\nPlease press ENTER when you are done to proceed to next step.\n')
+            expected_output = self.jdata[test_id]['test']['execution']['%s' % step]['expected_results']
+            if expected_output:
+                print('Expected output: ' + expected_output)
         while True:
             done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked/(S)kipped? \n')
             done = done.lower()
-- 
2.7.4


