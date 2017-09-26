Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 32BAF78077
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 19:36:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 26 Sep 2017 12:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; d="scan'208";a="904092814"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2017 12:36:08 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 12:36:04 -0700
Message-Id: <20170926193604.194047-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20170926193604.194047-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170926193604.194047-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [morty][PATCH 2/2] sign_rpm.bbclass: force rpm serial signing
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
X-List-Received-Date: Tue, 26 Sep 2017 19:36:07 -0000

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
index a8ea75faaa..fac1b63824 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -51,3 +51,9 @@ python sign_rpm () {
 
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


