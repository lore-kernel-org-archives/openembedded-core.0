Return-Path: <kevin.strasser@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 444ED6A5DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 20:34:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2013 13:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,854,1363158000"; d="scan'208";a="328443565"
Received: from wrk.jf.intel.com ([10.7.202.76])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2013 13:34:15 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 13:27:15 -0700
Message-Id: <35f9a49eef9959320295599353215931260449e0.1371068581.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] archiver.bbclass: check if package contains a copyleft license
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
X-List-Received-Date: Wed, 12 Jun 2013 20:34:14 -0000

The copyleft filter is only excluding packages that contain a
closed source license. This is because oe.license.is_included()
returns a boolean value that indicates if the license is excluded,
and a string that contains the matched included licenses. If the
string is empty it indicates that no licenses were matched.

Reject packages that do not contain a copyleft license.

[YOCTO 4630]

Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
---
 meta/classes/archiver.bbclass |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 6749d61..3d75d8e 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -63,7 +63,10 @@ def copyleft_should_include(d):
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
     else:
         if is_included:
-            return True, 'recipe has included licenses: %s' % ', '.join(reason)
+            if reason:
+                return True, 'recipe has included licenses: %s' % ', '.join(reason)
+            else:
+                return False, 'recipe does not include a copyleft license'
         else:
             return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
 
-- 
1.7.9.5


