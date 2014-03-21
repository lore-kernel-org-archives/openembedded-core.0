Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC196FA5E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 18:08:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2014 11:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,704,1389772800"; d="scan'208";a="504049121"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.240])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2014 11:02:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Mar 2014 18:02:38 +0000
Message-Id: <4f553dd641285cd06e65755aede1d3c3d6def6c5.1395424859.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395424859.git.paul.eggleton@linux.intel.com>
References: <cover.1395424859.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395424859.git.paul.eggleton@linux.intel.com>
References: <cover.1395424859.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 1/2] classes/kernel: move module postinst commands to kernel-base
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
X-List-Received-Date: Fri, 21 Mar 2014 18:08:23 -0000

Since kernel-base is the package that contains the files that depmod
needs to run, we should be running depmod from the kernel-base
postinstall rather than kernel-image.

Fixes [YOCTO #5392].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/kernel.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6953109..19b159b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -362,8 +362,7 @@ ALLOW_EMPTY_kernel-image = "1"
 ALLOW_EMPTY_kernel-modules = "1"
 DESCRIPTION_kernel-modules = "Kernel modules meta package"
 
-pkg_postinst_kernel-image () {
-	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
+pkg_postinst_kernel-base () {
 	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
 		mkdir -p $D/lib/modules/${KERNEL_VERSION}
 	fi
@@ -374,6 +373,10 @@ pkg_postinst_kernel-image () {
 	fi
 }
 
+pkg_postinst_kernel-image () {
+	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
+}
+
 pkg_postrm_kernel-image () {
 	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
 }
-- 
1.8.5.3


