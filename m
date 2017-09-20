Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9556612D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 08:17:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8K8H6Pq024450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 01:17:06 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 20 Sep 2017 01:17:05 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Sep 2017 01:17:05 -0700
Message-ID: <20170920081705.9406-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] kernel.bbclass: build host programs with native sysroots
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
X-List-Received-Date: Wed, 20 Sep 2017 08:17:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Allow to search header files and libs from native sysroots.

For example, an expanded BUILD_CFLAGS includes:
  '-isystem/builddir/to/linux-yocto/recipe-sysroot-native/usr/include'

And an expanded BUILD_LDFLAGS includes:
  '-L/builddir/to/linux-yocto/recipe-sysroot-native/usr/lib
   -Wl,-rpath-link,/builddir/to/linux-yocto/recipe-sysroot-native/usr/lib
   -Wl,-rpath,/builddir/to/linux-yocto/recipe-sysroot-native/usr/lib'

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 02a5e961cb..5a2f23e3a8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -155,7 +155,7 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 # Some Linux kernel configurations need additional parameters on the command line
 KERNEL_EXTRA_ARGS ?= ""
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 KERNEL_ALT_IMAGETYPE ??= ""
 
 copy_initramfs() {
-- 
2.13.0


