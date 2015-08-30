Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0042676E9F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 17:47:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 30 Aug 2015 10:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="758366181"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2015 10:47:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id BC9B86A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:46:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 20:47:02 +0300
Message-Id: <73c6cbb78429541333514c8dd8510e92f0974983.1440956535.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 05/12] wic: add default_image attribute to BitbakeVars
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
X-List-Received-Date: Sun, 30 Aug 2015 17:47:19 -0000

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


