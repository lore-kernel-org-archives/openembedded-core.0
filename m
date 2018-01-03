Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A4A7871D97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:48:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 17:48:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,499,1508828400"; 
   d="scan'208";a="7408964"
Received: from anujm-desk.png.intel.com ([172.30.199.130])
	by orsmga007.jf.intel.com with ESMTP; 02 Jan 2018 17:48:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jan 2018 09:48:52 +0800
Message-Id: <1514944132-4148-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] systemd-boot: fix build with musl and x32
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
X-List-Received-Date: Wed, 03 Jan 2018 01:48:58 -0000

systemd-boot shouldn't be built for x32. Make sure that this is the
case when TCLIBC is set to something other than glibc.

Fixes [YOCTO #12122]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/systemd/systemd-boot_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb b/meta/recipes-core/systemd/systemd-boot_234.bb
index 7b18b25..88a14ac 100644
--- a/meta/recipes-core/systemd/systemd-boot_234.bb
+++ b/meta/recipes-core/systemd/systemd-boot_234.bb
@@ -21,7 +21,7 @@ EXTRA_OECONF = " --enable-gnuefi \
 # Imported from the old gummiboot recipe
 TUNE_CCARGS_remove = "-mfpmath=sse"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
-COMPATIBLE_HOST_linux-gnux32 = "null"
+COMPATIBLE_HOST_x86-x32 = "null"
 
 do_compile() {
 	SYSTEMD_BOOT_EFI_ARCH="ia32"
-- 
2.7.4


