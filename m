Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DEFE26B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 05:11:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2U5BSq8021536
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 22:11:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 29 Mar 2017 22:11:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 13:12:44 +0800
Message-ID: <d6b2737e706f743644df63f21a8f061b9e2f83c7.1490850708.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1490850708.git.Qi.Chen@windriver.com>
References: <cover.1490850708.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.inc/qemu.inc: preserve directories to be used by runqemu
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
X-List-Received-Date: Thu, 30 Mar 2017 05:11:28 -0000
Content-Type: text/plain

The 'recipe-sysroot' and 'recipe-sysroot-native' directories need to
be preserved for runqemu to work correctly. Otherwise, when 'rm_work'
is enabled, these directories are removed, thus causing errors when
using runqemu .

[YOCTO #11266]
[YOCTO #11193]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass         | 1 +
 meta/conf/machine/include/qemu.inc | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73..cac3a5f 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -8,6 +8,7 @@ inherit ${SDKEXTCLASS}
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
+RM_WORK_EXCLUDE_ITEMS_append = " ${IMAGE_RM_WORK_EXCLUDE_ITEMS}"
 
 LICENSE = "MIT"
 PACKAGES = ""
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 0e4103b..8345c08 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -29,3 +29,6 @@ KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
 MACHINE_EXTRA_RRECOMMENDS += "rng-tools"
 
 IMAGE_CLASSES += "qemuboot"
+
+# These two directories need to be preserved for runqemu to work well
+IMAGE_RM_WORK_EXCLUDE_ITEMS = "recipe-sysroot recipe-sysroot-native"
-- 
1.9.1


