Return-Path: <ddalex@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1333E6EA15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 17:21:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jan 2014 09:21:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,743,1384329600"; d="scan'208";a="472744713"
Received: from adamian-desktop.isw.intel.com ([10.237.224.35])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2014 09:21:42 -0800
Received: by adamian-desktop.isw.intel.com (Postfix, from userid 1000)
	id 2A3C5562CC8; Wed, 29 Jan 2014 17:21:55 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 17:21:50 +0000
Message-Id: <1391016111-7447-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/2] toaster.bbclass: save original package name
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
X-List-Received-Date: Wed, 29 Jan 2014 17:21:44 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

If we can get the original package name when reading
package infos in toaster.bbclass, we save it for proper
referincing in the toater ui.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 7c404b9..eed30d4 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -94,11 +94,15 @@ python toaster_layerinfo_dumpdata() {
 
 def _toaster_load_pkgdatafile(dirpath, filepath):
     import json
+    import re
     pkgdata = {}
     with open(os.path.join(dirpath, filepath), "r") as fin:
         for line in fin:
             try:
                 kn, kv = line.strip().split(": ", 1)
+                m = re.match(r"^PKG_([^A-Z:]*)", kn)
+                if m:
+                    pkgdata['OPKGN'] = m.group(1)
                 kn = "_".join([x for x in kn.split("_") if x.isupper()])
                 pkgdata[kn] = kv.strip()
                 if kn == 'FILES_INFO':
-- 
1.8.3.2


