Return-Path: <georgex.l.musat@intel.com>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 Sep 2014 08:44:40 UTC
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D450760809
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 08:44:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 24 Sep 2014 01:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,587,1406617200"; d="scan'208";a="578092837"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 24 Sep 2014 01:34:37 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id D063E6A4087;
	Wed, 24 Sep 2014 01:33:51 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Sep 2014 11:28:48 +0300
Message-Id: <1411547328-10605-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] oeqa/utils: Added filter to LogResults decorator to enforce custom log level.
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
X-List-Received-Date: Wed, 24 Sep 2014 08:44:47 -0000

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index a9e67ed..7f845db 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -91,6 +91,10 @@ class testcase(object):
 	wrapped_f.test_case = self.test_case
 	return wrapped_f
 
+class NoParsingFilter(logging.Filter):
+    def filter(self, record):
+	return record.levelno == 100
+
 def LogResults(original_class):
     orig_method = original_class.run
 
@@ -121,6 +125,8 @@ def LogResults(original_class):
                             format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                             datefmt='%H:%M:%S',
                             level=custom_log_level)
+	for handler in logging.root.handlers:
+		handler.addFilter(NoParsingFilter())
 	local_log = logging.getLogger(caller)
 
 	#check status of tests and record it
-- 
1.9.1


