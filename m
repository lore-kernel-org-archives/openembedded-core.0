Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF1172FA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 17:11:26 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 01 May 2017 10:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="96295856"
Received: from lchen103-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.185.1])
	by fmsmga006.fm.intel.com with ESMTP; 01 May 2017 10:11:25 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 12:11:23 -0500
Message-Id: <1493658683-8797-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] selftest/devtool: change write to append config in virtual_kernel_modify
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
X-List-Received-Date: Mon, 01 May 2017 17:11:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When uses write it creates a full new configuration in selftest.inc
causing to fail populate_sdk_ext linux-yocto because the signature
of the sstate changes.

[YOCTO #11300]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 8e7642c..0ab18b5 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1635,7 +1635,7 @@ class DevtoolTests(DevtoolBase):
         #Set machine to qemxu86 to be able to modify the kernel and
         #verify the modification.
         features = 'MACHINE = "qemux86"\n'
-        self.write_config(features)
+        self.append_config(features)
         kernel_provider = get_bb_var('PREFERRED_PROVIDER_virtual/kernel')
         # Clean up the enviroment
         bitbake('%s -c clean' % kernel_provider)
-- 
2.1.4


