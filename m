Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A4D117D449
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:19:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2019 02:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="132891047"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 04 Apr 2019 02:19:44 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 16:48:37 +0800
Message-Id: <1554367718-74682-4-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554367718-74682-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1554367718-74682-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 3/4] resulttool/manualexecution: Fixed step sorted by integer
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
X-List-Received-Date: Thu, 04 Apr 2019 09:19:44 -0000

Currently the manual execution display step by sorting
the step as string, where steps were not being sorted
correctly when there are more than 9 steps.

Fixed the step sorting by sorting step as integer.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 0783540..9a29b0b 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -85,7 +85,7 @@ class ManualTestRunner(object):
         print('------------------------------------------------------------------------')
         print('You have total ' + str(total_steps) + ' test steps to be executed.')
         print('------------------------------------------------------------------------\n')
-        for step in sorted((self.jdata[test_id]['test']['execution']).keys()):
+        for step, _ in sorted(self.jdata[test_id]['test']['execution'].items(), key=lambda x: int(x[0])):
             print('Step %s: ' % step + self.jdata[test_id]['test']['execution']['%s' % step]['action'])
             expected_output = self.jdata[test_id]['test']['execution']['%s' % step]['expected_results']
             if expected_output:
-- 
2.7.4


