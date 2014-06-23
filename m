Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 000B46B711
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 10:55:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jun 2014 03:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,529,1400050800"; d="scan'208";a="559578951"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2014 03:55:09 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id DF02F6A4087;
	Mon, 23 Jun 2014 03:54:38 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jun 2014 15:59:44 +0300
Message-Id: <1403528385-4446-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/2] oeqa/targetcontrol.py: Separate the matching of supported image fstypes from the resulting value check.
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
X-List-Received-Date: Mon, 23 Jun 2014 10:55:45 -0000

Because we used a bb.fatal call inside the get_image_fstype classmethod, this caused problems when accessed without instantiating the object with a valid bb environment.

Separating the matching part of the classmethod(that is usable by outside scripts) from the check of the resulting value.
The matching is done within a new classmethod and the latter keeps the old method name and internal functionality, this way we don't have to change any other target controllers code.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1464bf4..cc582dd 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -77,14 +77,21 @@ class BaseTarget(object):
         return None
 
     @classmethod
-    def get_image_fstype(self, d, image_fstypes=None):
+    def match_image_fstype(self, d, image_fstypes=None):
         if not image_fstypes:
             image_fstypes = d.getVar('IMAGE_FSTYPES', True).split(' ')
         possible_image_fstypes = [fstype for fstype in self.supported_image_fstypes if fstype in image_fstypes]
         if possible_image_fstypes:
             return possible_image_fstypes[0]
         else:
-            bb.fatal("no possible image_fstype could not be determined. IMAGE_FSTYPES=\"%s\" and supported_image_fstypes=\"%s\": " % (', '.join(map(str, image_fstypes)), ', '.join(map(str, self.supported_image_fstypes))))
+            return None
+
+    def get_image_fstype(self, d):
+        image_fstype = self.match_image_fstype(d)
+        if image_fstype:
+            return image_fstype
+        else:
+            bb.fatal("IMAGE_FSTYPES should contain a Target Controller supported image fstype: %s " % ', '.join(map(str, self.supported_image_fstypes)))
 
     def restart(self, params=None):
         self.stop()
-- 
1.8.3.2


