Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A314177BE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490779605; x=1522315605;
	h=from:to:cc:subject:date:message-id;
	bh=yeIihI5zcrmqLd+jTP0E5FnqWw3ncd2Wdkicb4x/eNg=;
	b=g2YaTsAf/Iy5ACGYKJU0cwwXCXlmmNRNwDBWULX1nbSxO7PS8Y7zzY4o
	0+q4cyuD2yRxRQnO/Mr4Dazl11eYUw==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2017 02:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,240,1486454400"; d="scan'208";a="1128411074"
Received: from akratz-mobl.ger.corp.intel.com (HELO summit.ger.corp.intel.com)
	([10.252.11.241])
	by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2017 02:26:37 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 12:26:38 +0300
Message-Id: <20170329092638.11677-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] systemd: check 'efi' in MACHINE_FEATURES
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
X-List-Received-Date: Wed, 29 Mar 2017 09:26:44 -0000

The recipe checks 'efi' in DISTRO_FEATURES but it's a machine feature.

Fix the check to use MACHINE_FEATURES to determine whether to
enable/disable 'efi' PACKAGECONFIG.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index fa6a6a817f..150bb9ea65 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -40,7 +40,8 @@ SRC_URI_append_libc-uclibc = "\
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 PACKAGECONFIG ??= "xz \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam selinux ldconfig', d)} \
+                   ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
                    binfmt \
-- 
2.11.0


