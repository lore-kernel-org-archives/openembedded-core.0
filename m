Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CCBA260685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 17:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490634730; x=1522170730;
	h=from:to:cc:subject:date:message-id;
	bh=JewjdkPIxVjZFVcTO1sFvcZS/juLkHd8XuBdIBFQ3Lw=;
	b=qSQPEW/DGGMAVHqqBixb6a+qS0qTXJg+eGA1nL9X8eN/aPxnxZyyGolU
	LdjfqwWFewJgAimfuQZQQp50VdfOWg==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 10:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,232,1486454400"; d="scan'208";a="1147530064"
Received: from pequod.jf.intel.com ([10.54.74.23])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2017 10:12:08 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 10:11:21 -0700
Message-Id: <20170327171121.2636-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.12.1
Subject: [PATCH] insane.bbclass: error if file-rdeps not met
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
X-List-Received-Date: Mon, 27 Mar 2017 17:12:09 -0000

Missing runtime dependencies should result in an error rather than a
warning. Indeed, if RPM is listed in PACKAGE_CLASSES, it will throw
an error rather than install packages with missing dependencies. This
functionality should be consistent across package types. This patch
ensures that an error will be thrown.

[YOCTO #10949]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7a869977e1..dc1c2f8d41 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -30,7 +30,7 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir build-deps file-rdeps \
+            pn-overrides infodir build-deps \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated \
             "
@@ -38,7 +38,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
-            license-checksum dev-elf \
+            license-checksum dev-elf file-rdeps \
             "
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
-- 
2.12.1


