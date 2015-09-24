Return-Path: <george.l.musat@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5E58975CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 09:16:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 24 Sep 2015 02:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="812176129"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2015 02:16:43 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id B1B186A4005;
	Thu, 24 Sep 2015 02:15:47 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 12:14:44 +0300
Message-Id: <1443086084-2479-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/testimage: Remove absolute path to oeqa from json
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
X-List-Received-Date: Thu, 24 Sep 2015 09:16:43 -0000

In the json file the whole datastore is serialized which contains
absolute path to the oeqa folder. This breaks the functionality
when trying to run the tests from other machines.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/classes/testimage.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index c62e391..2efab29 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -198,9 +198,18 @@ def exportTests(d,tc):
     savedata["host_dumper"]["parent_dir"] = tc.host_dumper.parent_dir
     savedata["host_dumper"]["cmds"] = tc.host_dumper.cmds
 
-    with open(os.path.join(exportpath, "testdata.json"), "w") as f:
+    json_file = os.path.join(exportpath, "testdata.json")
+    with open(json_file, "w") as f:
             json.dump(savedata, f, skipkeys=True, indent=4, sort_keys=True)
 
+    # Replace absolute path with relative in the file
+    exclude_path = os.path.join(d.getVar("COREBASE", True),'meta','lib','oeqa')
+    f1 = open(json_file,'r').read()
+    f2 = open(json_file,'w')
+    m = f1.replace(exclude_path,'oeqa')
+    f2.write(m)
+    f2.close()
+
     # now start copying files
     # we'll basically copy everything under meta/lib/oeqa, with these exceptions
     #  - oeqa/targetcontrol.py - not needed
-- 
2.1.4


