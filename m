Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0AF78824
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:00:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 07:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; d="scan'208";a="192926989"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 11 Jan 2018 07:00:47 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 22:55:19 +0800
Message-Id: <bdf397c9ec53ffc47269c88739c6fb777e46c20f.1515681706.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2 1/5] scripts/wic: use scriptpath module to find bitbake path and oe lib path
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
X-List-Received-Date: Thu, 11 Jan 2018 15:00:47 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Use the scriptpath module in order to standardize the adding of
bitbake and meta/lib path to sys.path.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/wic | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 097084a6033..0d988757150 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -43,13 +43,12 @@ from distutils import spawn
 scripts_path = os.path.abspath(os.path.dirname(__file__))
 lib_path = scripts_path + '/lib'
 sys.path.insert(0, lib_path)
-oe_lib_path = os.path.join(os.path.dirname(scripts_path), 'meta', 'lib')
-sys.path.insert(0, oe_lib_path)
+import scriptpath
+scriptpath.add_oe_lib_path()
 
 bitbake_exe = spawn.find_executable('bitbake')
 if bitbake_exe:
-    bitbake_path = os.path.join(os.path.dirname(bitbake_exe), '../lib')
-    sys.path.insert(0, bitbake_path)
+    bitbake_path = scriptpath.add_bitbake_lib_path()
     from bb import cookerdata
     from bb.main import bitbake_main, BitBakeConfigParameters
 else:
-- 
2.15.0


