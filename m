Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlo-0001pp-11
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:16 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2011 00:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="913034171"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2011 00:24:43 -0700
Message-Id: <07fef47f9163c9c4f3c5b7cfd6c6fbf38d9e0742.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 16:22:07 +0800
Date: Fri, 22 Apr 2011  0:24:43 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 14/33] mdadm: upgrade from 3.1.4 to the latest version 3.2.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Apr 2011 07:27:16 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

removed fix-z-now.patch since 3.2.1 has integrated it.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-extended/mdadm/files/fix-z-now.patch  |   15 ---------------
 .../mdadm/{mdadm_3.1.4.bb => mdadm_3.2.1.bb}       |    9 ++++-----
 2 files changed, 4 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/fix-z-now.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.1.4.bb => mdadm_3.2.1.bb} (78%)

diff --git a/meta/recipes-extended/mdadm/files/fix-z-now.patch b/meta/recipes-extended/mdadm/files/fix-z-now.patch
deleted file mode 100644
index 3cd606b..0000000
--- a/meta/recipes-extended/mdadm/files/fix-z-now.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix -z now is really a LD option, not a gcc option so use -Wl to pass it to LD
-
-Created-by: Saul Wold <saul.wold@intel.com>
-
---- Makefile.orig	2010-08-31 13:52:46.277764099 -0700
-+++ Makefile	2010-08-31 14:02:28.218014078 -0700
-@@ -167,7 +167,7 @@
- 
- # use '-z now' to guarantee no dynamic linker interactions with the monitor thread
- mdmon : $(MON_OBJS)
--	$(CC) $(LDFLAGS) $(MON_LDFLAGS) -z now -o mdmon $(MON_OBJS) $(LDLIBS)
-+	$(CC) $(LDFLAGS) $(MON_LDFLAGS) -Wl,-z,now -o mdmon $(MON_OBJS) $(LDLIBS)
- msg.o: msg.c msg.h
- 
- test_stripe : restripe.c mdadm.h
diff --git a/meta/recipes-extended/mdadm/mdadm_3.1.4.bb b/meta/recipes-extended/mdadm/mdadm_3.2.1.bb
similarity index 78%
rename from meta/recipes-extended/mdadm/mdadm_3.1.4.bb
rename to meta/recipes-extended/mdadm/mdadm_3.2.1.bb
index ef62a3f..937abad 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.1.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.1.bb
@@ -8,13 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
-	   file://fix-z-now.patch;striplevel=0"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "0e7dcb5cc4192ae3abd9956bac475576"
-SRC_URI[sha256sum] = "849ad0ad4ad3c1d2d8806a16b30e1f59ab2daf313cb103807207f7cba889ea63"
+SRC_URI[md5sum] = "d1e2549202bd79d9e99f1498d1109530"
+SRC_URI[sha256sum] = "7f68f149c6c0e8893d0b9220ac255b46af08e6a6b81223cab57ed54d628ae125"
 
 CFLAGS += "-fno-strict-aliasing"
 
-- 
1.7.1



