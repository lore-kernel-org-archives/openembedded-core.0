Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2B21C77AB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 13:57:49 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 06:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; d="scan'208";a="153489055"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga005.jf.intel.com with ESMTP; 26 Sep 2017 06:57:23 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 06:57:19 -0700
Message-Id: <20170926135720.4598-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH 1/2] sign_rpm.bbclass: force rpm serial signing
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
X-List-Received-Date: Tue, 26 Sep 2017 13:57:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Newer versions of gpg (at least 2.1.5 and 2.2.1) have issues when signing occurs in parallel
so (unfortunately) the signing must be done serially. Once the upstream problem is fixed,
this patch must be reverted, otherwise we loose all the intrinsic parallelism from
bitbake.

[YOCTO #12022]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/sign_rpm.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 6796780ee4..4961b03618 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -67,3 +67,9 @@ python sign_rpm () {
 
 do_package_index[depends] += "signing-keys:do_deploy"
 do_rootfs[depends] += "signing-keys:do_populate_sysroot"
+
+# Newer versions of gpg (at least 2.1.5 and 2.2.1) have issues when signing occurs in parallel
+# so unfortunately the signing must be done serially. Once the upstream problem is fixed,
+# the following line must be removed otherwise we loose all the intrinsic parallelism from
+# bitbake.  For more information, check https://bugzilla.yoctoproject.org/show_bug.cgi?id=12022.
+do_package_write_rpm[lockfiles] += "${TMPDIR}/gpg.lock"
-- 
2.12.3


