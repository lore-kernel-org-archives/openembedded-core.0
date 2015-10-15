Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5C93E77032
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 14:39:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2015 07:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,686,1437462000"; d="scan'208";a="827690462"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2015 07:39:57 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Oct 2015 06:29:37 +0000
Message-Id: <a122232253701935dc215de94c9be4eef7549cf7.1444890026.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1444890026.git.mariano.lopez@linux.intel.com>
References: <cover.1444890026.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1444890026.git.mariano.lopez@linux.intel.com>
References: <cover.1444890026.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/2] oetest: Add tearDownLocal class
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
X-List-Received-Date: Thu, 15 Oct 2015 14:39:57 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

In the current state there are some runtime test that
don't run the tearDown method fromm oeRuntimeTest class
because the tearDown class is overwritten in the child
class.

This change adds tearDownLocal method in oeRuntimeTest
class that will run after tearDown. This method can be
overwritten in the child classes to implement specific
test functionality.

[YOCTO #8465]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index e3bbc46..6f9edec 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -196,6 +196,12 @@ class oeRuntimeTest(oeTest):
             print ("%s dump data stored in %s" % (self._testMethodName,
                      self.tc.host_dumper.dump_dir))
 
+        self.tearDownLocal()
+
+    # Method to be run after tearDown and implemented by child classes
+    def tearDownLocal(self):
+        pass
+
     #TODO: use package_manager.py to install packages on any type of image
     def install_packages(self, packagelist):
         for package in packagelist:
-- 
1.8.4.5


