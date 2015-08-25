Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ECB047689C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:05:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 25 Aug 2015 02:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="548073797"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2015 02:04:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 00C656A4087;
	Tue, 25 Aug 2015 02:03:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:17 +0300
Message-Id: <f8efb089c9879780a59e1e20ab0042a26b3695bb.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/17] wic: add default_image attribute to BitbakeVars
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
X-List-Received-Date: Tue, 25 Aug 2015 09:05:06 -0000

New attribute is used when bitbake variable is requested without
specifying image name. The attribute should be set from outside,
for example when wic is called with '-e <image>' option.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 41e435f..040176d 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -131,6 +131,9 @@ class BitbakeVars(defaultdict):
     def __init__(self):
         defaultdict.__init__(self, dict)
 
+        # default_image attribute should be set from outside
+        self.default_image = None
+
     def _parse_line(self, line, image):
         """
         Parse one line from bitbake -e output.
@@ -152,6 +155,9 @@ class BitbakeVars(defaultdict):
         Get bitbake variable value lazy way, i.e. run
         'bitbake -e' only when variable is requested.
         """
+        if not image:
+            image = self.default_image
+
         if image not in self:
             # Get bitbake -e output
             cmd = "bitbake -e"
-- 
2.1.4


