Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9C37F8BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:20:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9VAKLjB025674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:20:21 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 31 Oct 2019 03:20:20 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Oct 2019 18:20:19 +0800
Message-ID: <1572517219-382824-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] linux-dummy: Add package kernel
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
X-List-Received-Date: Thu, 31 Oct 2019 10:20:20 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Some package like packagegroup-core-boot may ask for package kernel. Let
linux-dummy rprovide package kernel to fix the following build failure.

ERROR: Nothing RPROVIDES 'kernel' (but
.../meta/recipes-core/packagegroups/packagegroup-core-boot.bb RDEPENDS on or
otherwise requires it)

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 62cf6f5ea6..20d7ed815d 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -8,19 +8,22 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 PROVIDES += "virtual/kernel"
+RPROVIDES_${PN} += "kernel lib32-kernel"
 
 PACKAGES_DYNAMIC += "^kernel-module-.*"
 PACKAGES_DYNAMIC += "^kernel-image-.*"
 PACKAGES_DYNAMIC += "^kernel-firmware-.*"
 
-PACKAGES += "kernel-modules kernel-vmlinux"
+PACKAGES += "kernel-modules kernel-vmlinux kernel"
 FILES_kernel-modules = ""
 ALLOW_EMPTY_kernel-modules = "1"
 DESCRIPTION_kernel-modules = "Kernel modules meta package"
 FILES_kernel-vmlinux = ""
 ALLOW_EMPTY_kernel-vmlinux = "1"
 DESCRIPTION_kernel-vmlinux = "Kernel vmlinux meta package"
-
+FILES_kernel = ""
+ALLOW_EMPTY_kernel = "1"
+DESCRIPTION_kernel = "Kernel meta package"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
2.17.1


