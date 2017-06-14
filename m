Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AB4267823F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 20:50:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 13:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,341,1493708400"; d="scan'208";a="868035042"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2017 13:50:33 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 13:50:30 -0700
Message-Id: <20170614205030.9985-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] depmodwrapper-cross: conditionally inherit nopackages
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
X-List-Received-Date: Wed, 14 Jun 2017 20:50:52 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The class nopackages deletes tasks needed by the archiver, so in case
the latter is globally inherited, do not inherit nopackages. Without
this patch, the following error occurs:

    ERROR: Task do_deploy_archives in .../meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb depends upon non-existent task do_package_write_rpm in \
                                      .../meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
    ERROR: Command execution failed: 1

The solution was suggested by J. Richardson, mentioned on the bugzilla
entry.

[YOCTO #11121]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 44d013f29d..a0ae9bbb61 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -45,4 +45,5 @@ EOF
 
 SYSROOT_DIRS += "${bindir_crossscripts}"
 
-inherit nopackages
+# The archiver requires tasks that nopackages deletes.
+inherit ${@'nopackages' if not bb.data.inherits_class('archiver', d) else ''}
-- 
2.12.0


