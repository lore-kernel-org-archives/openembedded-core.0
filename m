Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C14566E87E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:34:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 29 Jan 2014 04:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,742,1384329600"; d="scan'208";a="466567685"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2014 04:34:17 -0800
Received: from thunderbird.rb.intel.com (thunderbird.rb.intel.com
	[10.237.105.57])
	by linux.intel.com (Postfix) with ESMTP id E0BC16A4094;
	Wed, 29 Jan 2014 04:34:10 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 14:30:57 +0200
Message-Id: <1390998657-29861-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/runtime: smart: fix adding channels
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
X-List-Received-Date: Wed, 29 Jan 2014 12:34:16 -0000

Without this it won't add core2-64 and similar channels, as the
directory name in deploy_dir/rpm uses _ not - as the package arch.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/smart.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 7ef4b0e..8299bf3 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -59,7 +59,7 @@ class SmartRepoTest(SmartTest):
     def test_smart_channel_add(self):
         image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
         deploy_url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, image_pkgtype)
-        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True)
+        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True).replace("-","_").split()
         for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
             if arch in pkgarchs:
                 self.smart('channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url))
-- 
1.8.5.3


