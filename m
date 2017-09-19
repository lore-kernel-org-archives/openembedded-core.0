Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 43F4E77EA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 18:27:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2017 11:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,418,1500966000"; d="scan'208";a="901938607"
Received: from swold-mobl2.jf.intel.com ([10.24.10.67])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2017 11:27:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 19 Sep 2017 11:27:33 -0700
Message-Id: <20170919182734.15741-3-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170919182734.15741-1-sgw@linux.intel.com>
References: <20170919182734.15741-1-sgw@linux.intel.com>
Subject: [PATCH 2/3] wic: remove systemd-boot for x32
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
X-List-Received-Date: Tue, 19 Sep 2017 18:27:34 -0000

Currently systemd-boot actually incorporates libgcc, since the
systemd-boot needs to be built with 64bit instructions it can not
use the x32 based libgcc.

Use the new override to ensure it gets overriden, linux-gnux32 could
not be used because x86-64 has higher priority.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass | 1 +
 meta/recipes-core/meta/wic-tools.bb  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index b825b47ce5..b9503c69c5 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -45,6 +45,7 @@ WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native cdrtools-native bt
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS_x86-64 = "syslinux grub-efi systemd-boot"
+WKS_FILE_DEPENDS_BOOTLOADERS_x86_x32 = "syslinux grub-efi"
 
 WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS}"
 
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 57dd37a440..09eb409e87 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -10,6 +10,7 @@ DEPENDS = "\
            "
 DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
 DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
+DEPENDS_append_x86-x32 = " syslinux grub-efi"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
2.11.0


