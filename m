Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id DCE9B745AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 06:09:46 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w8R69jjF007639
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 27 Sep 2018 08:09:45 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.201])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w8R69jtj014806;
	Thu, 27 Sep 2018 08:09:45 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 23F3C2EA2C1;
	Thu, 27 Sep 2018 08:09:44 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2018 08:09:33 +0200
Message-Id: <20180927060933.2121-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <7f369514-092a-6a76-0262-ac9a84309b10>
References: <7f369514-092a-6a76-0262-ac9a84309b10>
Subject: [PATCH v2] kernel-devsrc: fix searching for non-existing manifest files
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
X-List-Received-Date: Thu, 27 Sep 2018 06:09:47 -0000

Even if the do_populate_sysroot have had set-up noexec flag, populate_sdk's
tasks were trying to find .populate_sysroot manifest file. Change noexec
flag settings to delete appreciated task.

WARNING: core-image-minimal-1.0-r0 do_sdk_depends: Manifest
build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-devsrc.populate_sysroot
not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm allarch x86_64_x86_64-nativesdk (variant '')?

WARNING: core-image-minimal-1.0-r0 do_populate_sdk_ext: Manifest
build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-devsrc.populate_sysroot
not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm allarch x86_64_x86_64-nativesdk (variant '')?

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 463305e89a..5758572221 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -25,7 +25,7 @@ do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
+deltask do_populate_sysroot
 
 S = "${STAGING_KERNEL_DIR}"
 B = "${STAGING_KERNEL_BUILDDIR}"
-- 
2.11.0


