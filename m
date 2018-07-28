Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CF4A26FFFE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 08:53:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2018 01:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,413,1526367600"; d="scan'208";a="68210421"
Received: from kaovince-mobl1.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.166.184])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2018 01:53:18 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2018 16:53:16 +0800
Message-Id: <20180728085316.13484-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/selftest: check if rm_work is enabled
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
X-List-Received-Date: Sat, 28 Jul 2018 08:53:19 -0000

rm_work if enabled leads to some tests failing that rely on artifacts
being present. Check if rm_work.bbclass is included and show an error
and exit if it is.

Fixes [YOCTO #12694]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/context.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 16812ba96e..3a70f9e77b 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -187,6 +187,10 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             self.tc.logger.error("You have buildhistory enabled already and this isn't recommended for selftest, please disable it first.")
             raise OEQAPreRun
 
+        if "rm_work.bbclass" in self.tc.td["BBINCLUDED"]:
+            self.tc.logger.error("You have rm_work enabled which isn't recommended while running oe-selftest. Please disable it before continuing.")
+            raise OEQAPreRun
+
         if "PRSERV_HOST" in self.tc.td:
             self.tc.logger.error("Please unset PRSERV_HOST in order to run oe-selftest")
             raise OEQAPreRun
-- 
2.17.1


