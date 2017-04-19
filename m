Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8F20D71B0B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 08:57:40 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 19 Apr 2017 01:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,220,1488873600"; d="scan'208";a="89627738"
Received: from nbayani-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.108])
	by orsmga005.jf.intel.com with ESMTP; 19 Apr 2017 01:57:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 20:57:28 +1200
Message-Id: <55fe27e1f64352d36e4a49eb488a51bda21bd007.1492592223.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1492592223.git.paul.eggleton@linux.intel.com>
References: <cover.1492592223.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] classes/populate_sdk_ext: work around runqemu behaviour within the eSDK
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
X-List-Received-Date: Wed, 19 Apr 2017 08:57:40 -0000

Currently, in order to figure out variable values when run within the
eSDK, runqemu does not use the standard SDK method nor is it able to run
bitbake (since the eSDK environment isn't initialised like the normal
OE build environment). runqemu really ought to be fixed, but the quick
workaround is to set DEPLOY_DIR_IMAGE in the environment so that runqemu
can find image files.

Fixes [YOCTO #10447].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3e1858c..4dfb94c 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -577,6 +577,8 @@ sdk_ext_postinst() {
 
 	# Allow bitbake environment setup to be ran as part of this sdk.
 	echo "export OE_SKIP_SDK_CHECK=1" >> $env_setup_script
+	# Work around runqemu not knowing how to get this information within the eSDK
+	echo "export DEPLOY_DIR_IMAGE=$target_sdk_dir/tmp/${@os.path.relpath(d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('TMPDIR'))}" >> $env_setup_script
 
 	# A bit of another hack, but we need this in the path only for devtool
 	# so put it at the end of $PATH.
-- 
2.9.3


