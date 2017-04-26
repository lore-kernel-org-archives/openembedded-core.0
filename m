Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 024E877C76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 13:57:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 26 Apr 2017 06:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,254,1488873600"; d="scan'208";a="253720756"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2017 06:57:10 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 05:54:00 +0000
Message-Id: <20170426055400.31359-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.0
MIME-Version: 1.0
Subject: [PATCH] devtool: Avoid touch sstates when cleaning linux-yocto environment
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
X-List-Received-Date: Wed, 26 Apr 2017 13:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

sstates are cleaned when ruining  test_devtool_virtual_kernel_modify to
have a clean environment but this is affecting eSDK test that are
dependent of those sstates, hence “cleansstate” is replaced for
“clean”.

[YOCTO #11300]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 762c7bacec5..8e7642c32b6 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1638,7 +1638,7 @@ class DevtoolTests(DevtoolBase):
         self.write_config(features)
         kernel_provider = get_bb_var('PREFERRED_PROVIDER_virtual/kernel')
         # Clean up the enviroment
-        bitbake('%s -c cleansstate' % kernel_provider)
+        bitbake('%s -c clean' % kernel_provider)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-- 
2.12.0


