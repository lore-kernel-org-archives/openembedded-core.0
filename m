Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RQutn-0005Ih-QB
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 06:52:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Nov 2011 21:45:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="76566351"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga002.jf.intel.com with ESMTP; 16 Nov 2011 21:45:02 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 14:05:50 +0800
Message-Id: <a57410c62ee00cf88d1d09a38fb502ca62d17fab.1321509543.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <f6328ed6e9a96d7e66d95f479bc1ac8796cbd3e2.1321509543.git.jiajun.xu@intel.com>
References: <f6328ed6e9a96d7e66d95f479bc1ac8796cbd3e2.1321509543.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1321509543.git.jiajun.xu@intel.com>
References: <cover.1321509543.git.jiajun.xu@intel.com>
Subject: [PATCH 2/2] sanitytest: remove rpm/zypper tests if PACKAGE_CLASSES does not set package_rpm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Nov 2011 05:52:36 -0000

If PACKAGE_CLASSES does not set package_rpm as the first item, the root filesystem
will not be generated based on rpm. We need remove rpm/zypper tests against
non-rpm filesystem.

[YOCTO #1757]

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 meta/classes/imagetest-qemu.bbclass |   25 ++++++++++++++++++++++++-
 1 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index de142bc..d01d1f4 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -80,9 +80,31 @@ def qemuimagetest_main(d):
         bb.note("Run %s test in scenario %s" % (case, scen))
         os.system("%s" % fulltestpath)
     
+    """function to check testcase list and remove inappropriate cases"""
+    def check_list(list):
+	final_list = []
+	for test in list:
+	    (scen, case, fullpath) = test
+
+	    """Skip rpm/zypper if package_rpm not set for PACKAGE_CLASSES"""
+	    if case.find("zypper") != -1 or case.find("rpm") != -1:
+	        if d.getVar("PACKAGE_CLASSES", True).find("rpm", 0, 11) == -1:
+            	    bb.note("skip rpm/zypper cases since package_rpm not set in PACKAGE_CLASSES")
+	 	    continue
+	        else:
+		    final_list.append((scen, case, fullpath))
+	    else:
+                    final_list.append((scen, case, fullpath))
+
+	if not final_list:
+	    raise bb.build.FuncFailed("There is no suitable testcase for this target")
+
+	return final_list
+
     """Generate testcase list in runtime"""
     def generate_list(testlist):
         list = []
+	final_list = []
         if len(testlist) == 0:
             raise bb.build.FuncFailed("No testcase defined in TEST_SCEN")
 
@@ -114,7 +136,8 @@ def qemuimagetest_main(d):
                        if not os.path.isfile(fulltestcase):
                             raise bb.build.FuncFailed("Testcase %s not found" % fulltestcase)
                        list.append((item, casefile, fulltestcase))
-        return list
+	final_list = check_list(list)
+        return final_list
 
     """Clean tmp folder for testing"""
     def clean_tmp():
-- 
1.7.1



