Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E4A4160EE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 18:40:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Sep 2013 11:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,885,1371106800"; d="scan'208";a="359098867"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 11 Sep 2013 11:40:27 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id DEF966A4007;
	Wed, 11 Sep 2013 11:40:23 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 21:40:21 +0300
Message-Id: <1378924821-22760-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: smart: limit channel add to useful ones
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
X-List-Received-Date: Wed, 11 Sep 2013 18:40:26 -0000

Don't add inappropiate channels on the target.
This happens when building two different machines in the
same dir and then running the tests for each machine.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/smart.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 468e047..e2f0aea 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -59,8 +59,10 @@ class SmartRepoTest(SmartTest):
     def test_smart_channel_add(self):
         image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
         deploy_url = 'http://%s:%s/%s' %(self.tc.qemu.host_ip, self.repo_server.port, image_pkgtype)
+        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True)
         for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
-            self.smart('channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url))
+            if arch in pkgarchs:
+                self.smart('channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url))
         self.smart('update')
 
     def test_smart_channel_help(self):
-- 
1.8.3.1


