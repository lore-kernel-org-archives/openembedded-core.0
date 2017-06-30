Return-Path: <wei.tee.ng@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C74E378246
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:40:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 00:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,285,1496127600"; d="scan'208";a="1188914011"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jun 2017 00:40:58 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 17:30:18 -0700
Message-Id: <47b026d2a54a16bf3ee8e0dfc0335dfceb0aff74.1498782014.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1498782014.git.wei.tee.ng@intel.com>
References: <cover.1498782014.git.wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com
Subject: [PATCH v2 3/3] initramfs-framwork: module to support boot live image
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
X-List-Received-Date: Fri, 30 Jun 2017 07:40:57 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

setup-live module is a new module being introduced to integrate the
functionality of init-live.sh into new scriptlet in order to
support the live boot image. It gets to run before the rootfs
and finish module.

[YOCTO #11701]

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 6bbe4c1..f7b47d9 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -13,7 +13,8 @@ SRC_URI = "file://init \
            file://mdev \
            file://udev \
            file://e2fs \
-           file://debug"
+           file://debug \
+           file://setup-live"
 
 S = "${WORKDIR}"
 
@@ -24,6 +25,7 @@ do_install() {
     install -m 0755 ${WORKDIR}/init ${D}/init
     install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
     install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
+    install -m 0755 ${WORKDIR}/setup-live ${D}/init.d/80-setup-live
 
     # mdev
     install -m 0755 ${WORKDIR}/mdev ${D}/init.d/01-mdev
@@ -50,7 +52,7 @@ PACKAGES = "${PN}-base \
             initramfs-module-rootfs \
             initramfs-module-debug"
 
-FILES_${PN}-base = "/init /init.d/99-finish /dev"
+FILES_${PN}-base = "/init /init.d/99-finish /init.d/80-setup-live /dev"
 
 # 99-finish in base depends on some other module which mounts
 # the rootfs, like 90-rootfs. To replace that default, use
-- 
2.7.4


