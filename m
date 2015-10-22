Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id D19F277131
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 2DCCC600F5C
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:36 +0100
Message-Id: <b5917f8032d6965596868b2fe01da4e0682e2804.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 15/52] oetest: Add tearDownLocal class
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:21 -0000

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
Signed-off-by: Ross Burton <ross.burton@intel.com>
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
2.1.4


