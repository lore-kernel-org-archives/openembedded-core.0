Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F0BA460797
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:52:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2016 12:52:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1063828196"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2016 12:52:50 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 14:58:01 -0600
Message-Id: <0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 01/13] selftest: base: new object member to store the DISTRO value
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
X-List-Received-Date: Thu, 24 Nov 2016 20:52:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Instead of quering it multiple times, query once and use it on
test method skip checks. Also, rename current distro sstate object
member to a more meaninful name.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/base.py   |  1 +
 meta/lib/oeqa/selftest/sstate.py | 10 +++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 26c93f9..b477db3 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -41,6 +41,7 @@ class oeSelfTest(unittest.TestCase):
             self.testinc_path, self.testinc_bblayers_path,
             self.machineinc_path, self.localconf_backup,
             self.local_bblayers_backup]
+        self.distro = get_bb_var('DISTRO')
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
diff --git a/meta/lib/oeqa/selftest/sstate.py b/meta/lib/oeqa/selftest/sstate.py
index 5989724..d27a45c 100644
--- a/meta/lib/oeqa/selftest/sstate.py
+++ b/meta/lib/oeqa/selftest/sstate.py
@@ -14,8 +14,8 @@ class SStateBase(oeSelfTest):
     def setUpLocal(self):
         self.temp_sstate_location = None
         self.sstate_path = get_bb_var('SSTATE_DIR')
-        self.distro = get_bb_var('NATIVELSBSTRING')
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.distro)
+        self.hostdistro = get_bb_var('NATIVELSBSTRING')
+        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
 
     # Creates a special sstate configuration with the option to add sstate mirrors
     def config_sstate(self, temp_sstate_location=False, add_local_mirrors=[]):
@@ -27,8 +27,8 @@ class SStateBase(oeSelfTest):
             self.append_config(config_temp_sstate)
             self.track_for_cleanup(temp_sstate_path)
         self.sstate_path = get_bb_var('SSTATE_DIR')
-        self.distro = get_bb_var('NATIVELSBSTRING')
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.distro)
+        self.hostdistro = get_bb_var('NATIVELSBSTRING')
+        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
 
         if add_local_mirrors:
             config_set_sstate_if_not_set = 'SSTATE_MIRRORS ?= ""'
@@ -42,7 +42,7 @@ class SStateBase(oeSelfTest):
     def search_sstate(self, filename_regex, distro_specific=True, distro_nonspecific=True):
         result = []
         for root, dirs, files in os.walk(self.sstate_path):
-            if distro_specific and re.search("%s/[a-z0-9]{2}$" % self.distro, root):
+            if distro_specific and re.search("%s/[a-z0-9]{2}$" % self.hostdistro, root):
                 for f in files:
                     if re.search(filename_regex, f):
                         result.append(f)
-- 
2.1.4


