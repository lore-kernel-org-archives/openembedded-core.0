Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0A66CF0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2013 03:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,513,1378882800"; d="scan'208";a="376040037"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2013 03:34:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:34:17 +0300
Message-Id: <dc1ccf53ffa120569c1a9f72219b1064ec45919b.1382005791.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
Subject: [PATCH 7/8] mdadm: upgrade to 3.3
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:29 -0000

Refreshed mdadm-3.2.2_fix_for_x32.patch to apply correctly.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |   11 +++++------
 .../mdadm/{mdadm_3.2.6.bb => mdadm_3.3.bb}         |    5 ++---
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/mdadm/{mdadm_3.2.6.bb => mdadm_3.3.bb} (86%)

diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
index 58d54f9..3b3db0a 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
@@ -8,17 +8,16 @@ make file, hence making the CC definition in the Makefile conditional.
 
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/07
 
-Index: mdadm-3.2.2/Makefile
+Index: mdadm-3.3/Makefile
 ===================================================================
---- mdadm-3.2.2.orig/Makefile
-+++ mdadm-3.2.2/Makefile
-@@ -40,7 +40,8 @@ KLIBC=/home/src/klibc/klibc-0.77
+--- mdadm-3.3.orig/Makefile	2013-09-03 07:47:47.000000000 +0300
++++ mdadm-3.3/Makefile	2013-10-16 16:44:23.542295487 +0300
+@@ -41,7 +41,7 @@
  
  KLIBC_GCC = gcc -nostdinc -iwithprefix include -I$(KLIBC)/klibc/include -I$(KLIBC)/linux/include -I$(KLIBC)/klibc/arch/i386/include -I$(KLIBC)/klibc/include/bits32
  
 -CC = $(CROSS_COMPILE)gcc
 +CC ?= $(CROSS_COMPILE)gcc
-+
- CXFLAGS = -ggdb
+ CXFLAGS ?= -ggdb
  CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter
  ifdef WARN_UNUSED
diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.6.bb b/meta/recipes-extended/mdadm/mdadm_3.3.bb
similarity index 86%
rename from meta/recipes-extended/mdadm/mdadm_3.2.6.bb
rename to meta/recipes-extended/mdadm/mdadm_3.3.bb
index 7b6a6c7..23c9408 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.6.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.bb
@@ -8,14 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
 	    file://mdadm-3.2.2_fix_for_x32.patch \
 	  "
 
-SRC_URI[md5sum] = "3e255dc71e5144bbcb872788ca647267"
-SRC_URI[sha256sum] = "c44ed3b31238b41cffe67caffaf45067d01e095de94988889ea8a94e22dc6c38"
+SRC_URI[md5sum] = "8ac04259cdd74b4566c3b6dea9414b57"
+SRC_URI[sha256sum] = "9c07e518bdf3392ebac8874eb686258e10ea3ae0ff7a8acb6d014718a9c3ed45"
 
 CFLAGS += "-fno-strict-aliasing"
 
-- 
1.7.9.5


