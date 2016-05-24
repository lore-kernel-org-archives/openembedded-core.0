Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDCA6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:49:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326982"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:49:11 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:19 +0000
Message-Id: <39bf31bc5d7a51dd6d01c9e22826f56946206c23.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 10/10] testimage.bbclass: Make dependency of cpio when using RPMs
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
X-List-Received-Date: Tue, 24 May 2016 20:49:10 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

do_test_extract_packages task needs cpio when building and image
using RPM packages, not all distros include cpio by default, so
we need to build it.

[YOCTO #8694]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 436dec4..4f2abb8 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -68,6 +68,8 @@ TEST_TARGET ?= "qemu"
 
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
-- 
2.6.6


