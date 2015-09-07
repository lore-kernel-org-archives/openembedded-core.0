Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 72EDA73232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940051"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:24 +0100
Message-Id: <e3a519829437048e40a7598a90663c51ae0575a3.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/11] populate_sdk_ext: don't remove the native qemu dependencies
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:48 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

These dependencies were deliberately removed because it was assumed that
they were provided by nativesdk packages. On the one hand, nativesdk packages
in extensible SDK don't have these packages; on the other hand, even if we
add these nativesdk packages, they are still not useful because we we need
runqemu to run correctly.

So we don't remove these native qemu dependencies.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fa36a91..fc2d96f 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -140,11 +140,6 @@ python copy_buildsystem () {
         # Some classes are not suitable for SDK, remove them from INHERIT
         f.write('INHERIT_remove = "%s"\n' % d.getVar('SDK_INHERIT_BLACKLIST'))
 
-        # This is a bit of a hack, but we really don't want these dependencies
-        # (we're including them in the SDK as nativesdk- versions instead)
-        f.write('POKYQEMUDEPS_forcevariable = ""\n\n')
-        f.write('EXTRA_IMAGEDEPENDS_remove = "qemu-native qemu-helper-native"\n\n')
-
         # Bypass the default connectivity check if any
         f.write('CONNECTIVITY_CHECK_URIS = ""\n\n')
 
-- 
2.1.0


