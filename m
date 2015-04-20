Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBF973D89
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 16:48:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Apr 2015 09:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,610,1422950400"; d="scan'208";a="716384577"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2015 09:47:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 17:47:06 +0100
Message-Id: <7dce61fa49bac2a7a6a40640bcb9d2b3ea17066e.1429548323.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] classes/populate_sdk_ext: disable network connectivity check
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
X-List-Received-Date: Mon, 20 Apr 2015 16:48:02 -0000

Most of the time we shouldn't be downloading anything within the
extensible SDK (since it's all pre-built and we have the sstate
artifacts) therefore there's really no need for a connectivity
check, in fact it may just get in the way.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 22e0ffc..17a8e8c 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -110,6 +110,9 @@ python copy_buildsystem () {
         f.write('POKYQEMUDEPS_forcevariable = ""\n\n')
         f.write('EXTRA_IMAGEDEPENDS_remove = "qemu-native qemu-helper-native"\n\n')
 
+        # Bypass the default connectivity check if any
+        f.write('CONNECTIVITY_CHECK_URIS = ""\n\n')
+
         # Another hack, but we want the native part of sstate to be kept the same
         # regardless of the host distro
         fixedlsbstring = 'SDK-Fixed'
-- 
2.1.0


