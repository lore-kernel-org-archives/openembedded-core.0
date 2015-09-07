Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D18F760132
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940045"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:22 +0100
Message-Id: <7deab0d0b108022cff22a15775934bc6463efc09.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/11] copy_buildsystem: make sure bitbake directory is copied
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:47 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

The previous code assumes that bitbake/ directory is under the core layer.
This is the case for Yocto project. But users might clone oe-core and bitbake
separately. So we use bb.__file__ to locate the bitbake directory to make sure
it's copied into the extensible SDK.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/copy_buildsystem.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index cf7fada..979578c 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -28,11 +28,10 @@ class BuildSystem(object):
         layers.append(corebase)
 
         corebase_files = self.d.getVar('COREBASE_FILES', True).split()
-
-        # bitbake belongs in corebase so make sure it goes there
-        if "bitbake" not in corebase_files:
-            corebase_files.append("bitbake")
         corebase_files = [corebase + '/' +x for x in corebase_files]
+        # Make sure bitbake goes in
+        bitbake_dir = bb.__file__.rsplit('/', 3)[0]
+        corebase_files.append(bitbake_dir)
 
         for layer in layers:
             layerconf = os.path.join(layer, 'conf', 'layer.conf')
-- 
2.1.0


