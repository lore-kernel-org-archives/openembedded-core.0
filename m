Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B595A70679
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:08:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2014 07:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,678,1400050800"; d="scan'208";a="574681494"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2014 07:06:51 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 10C096A4087;
	Thu, 17 Jul 2014 07:06:16 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 19:11:47 +0300
Message-Id: <1405613507-18662-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] scripts/test-remote-image: use the scriptpath module
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
X-List-Received-Date: Thu, 17 Jul 2014 14:09:00 -0000

Use the scripts/lib/scriptpath module in order to standardize the adding of bitbake/lib and meta/lib to sys.path.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 scripts/test-remote-image | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index 8120a62..f3a44eb 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -32,8 +32,15 @@ import logging
 import shutil
 from abc import ABCMeta, abstractmethod
 
+# Add path to scripts/lib in sys.path;
+scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+
+import scriptpath
+
 # Add meta/lib to sys.path
-sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'meta/lib')))
+scriptpath.add_oe_lib_path()
 
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
@@ -43,7 +50,10 @@ for path in get_bb_var('BBPATH').split(":"):
     sys.path.insert(0, os.path.abspath(os.path.join(path, 'lib')))
 
 # In order to import modules that contain target controllers, we need the bitbake libraries in sys.path .
-sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'bitbake/lib')))
+bitbakepath = scriptpath.add_bitbake_lib_path()
+if not bitbakepath:
+    sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
+    sys.exit(1)
 
 # create a logger
 def logger_create():
-- 
1.8.3.2


