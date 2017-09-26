Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDB07806E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 20:04:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 13:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; d="scan'208";a="316505764"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2017 13:04:31 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 13:04:29 -0700
Message-Id: <20170926200429.6248-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20170926200429.6248-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170926200429.6248-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [pyro][PATCH 2/2] sign_rpm.bbclass: force rpm serial signing
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
X-List-Received-Date: Tue, 26 Sep 2017 20:04:30 -0000

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
index bc2e947107..21010b03d6 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -44,3 +44,9 @@ python sign_rpm () {
 
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


