Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDE17887F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 05:46:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 21:46:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,343,1511856000"; 
   d="scan'208";a="8890783"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2018 21:46:49 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 13:41:12 +0800
Message-Id: <460099f517659ddc9afa7b4408ef752d792dc9d4.1515648396.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 2/5] scripts/wic: append bitbake executable file path in eSDK environment
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
X-List-Received-Date: Thu, 11 Jan 2018 05:46:48 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

wic needs a set of tools to be available from sysroots.
wic will find bitbake executable within the environment,
and wic was unable to locate bitbake executable within eSDK
because it wasn't setup with the OE build environment script.
Hence, we need to add bitbake file path into the environment
PATH for wic to be able to discover it and import bb modules.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/wic | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 0d98875..293a216 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -46,6 +46,18 @@ sys.path.insert(0, lib_path)
 import scriptpath
 scriptpath.add_oe_lib_path()
 
+# Check whether wic is running within eSDK environment
+sdkroot = scripts_path
+if os.environ.get('SDKTARGETSYSROOT'):
+    while sdkroot != '' and sdkroot != os.sep:
+        if os.path.exists(os.path.join(sdkroot, '.devtoolbase')):
+            # .devtoolbase only exists within eSDK
+            # If found, initialize bitbake path for eSDK environment and append to PATH
+            sdkroot = os.path.join(os.path.dirname(scripts_path), 'bitbake', 'bin')
+            os.environ['PATH'] += ":" + sdkroot
+            break
+        sdkroot = os.path.dirname(sdkroot)
+
 bitbake_exe = spawn.find_executable('bitbake')
 if bitbake_exe:
     bitbake_path = scriptpath.add_bitbake_lib_path()
-- 
2.7.4


