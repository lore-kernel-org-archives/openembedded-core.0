Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BDE9178869
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 05:46:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 21:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,343,1511856000"; 
   d="scan'208";a="8890782"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2018 21:46:47 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 13:41:11 +0800
Message-Id: <d549bcb39b9a137a37858da6f17f613385a39628.1515648396.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 1/5] scripts/wic: use scriptpath module to find bitbake path and oe lib path
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
X-List-Received-Date: Thu, 11 Jan 2018 05:46:46 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Use the scriptpath module in order to standardize the adding of
bitbake and meta/lib path to sys.path.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/wic | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 097084a..0d98875 100755
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
2.7.4


