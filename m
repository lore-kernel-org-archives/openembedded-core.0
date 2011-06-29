Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qbua9-0002ie-O7
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:13:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2011 06:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="19673248"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by orsmga002.jf.intel.com with ESMTP; 29 Jun 2011 06:09:45 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 21:09:38 +0800
Message-Id: <c572d4f39bc61df11a8e5a344b88c7b3fe8e476f.1309352791.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1309352791.git.dexuan.cui@intel.com>
References: <cover.1309352791.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1309352791.git.dexuan.cui@intel.com>
References: <cover.1309352791.git.dexuan.cui@intel.com>
Subject: [PATCH 1/3] grub: add -fno-reorder-functions into STAGE2_COMPILE
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
X-List-Received-Date: Wed, 29 Jun 2011 13:13:29 -0000

This is used to work around a gcc-4.6's bug about the option.

[YOCTO #1099]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../grub/grub-0.97/no-reorder-functions.patch      |   31 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |    5 ++-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/no-reorder-functions.patch

diff --git a/meta/recipes-bsp/grub/grub-0.97/no-reorder-functions.patch b/meta/recipes-bsp/grub/grub-0.97/no-reorder-functions.patch
new file mode 100644
index 0000000..70037e4
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-0.97/no-reorder-functions.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Inappropriate [disable feature]
+
+After the commit "tcmode-default: switch to gcc 4.6.0 for x86, x86-64 & arm",
+we got bug 1099 (http://bugzilla.yoctoproject.org/show_bug.cgi?id=1099):
+
+Running "install --stage2=/ssd/boot/grub/stage2 /boot/grub/stage1(hd0)
+     /boot/grub/stage2 p /boot/grub/menu list" failed
+Error 6: Mismatched or corrupt version of stage1/stage2
+
+This turned out to be a gcc's bug. See
+https://bugs.gentoo.org/show_bug.cgi?id=360513
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39333
+
+Upstream gcc seems uninterested in the bug, so at present we can disable the
+option as a workaround. Thanks Ryan Hill for the investigation and the
+workaround patch.
+
+Dexuan Cui <dexuan.cui@intel.com>
+Wed Jun 29 20:21:39 CST 2011
+
+--- grub-0.97/stage2/Makefile.am.orig
++++ grub-0.97/stage2/Makefile.am
+@@ -79,7 +79,7 @@
+ HERCULES_FLAGS =
+ endif
+ 
+-STAGE2_COMPILE = $(STAGE2_CFLAGS) -fno-builtin -nostdinc \
++STAGE2_COMPILE = $(STAGE2_CFLAGS) -fno-reorder-functions -fno-builtin -nostdinc \
+ 	$(NETBOOT_FLAGS) $(SERIAL_FLAGS) $(HERCULES_FLAGS)
+ 
+ STAGE1_5_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,2000
diff --git a/meta/recipes-bsp/grub/grub_0.97.bb b/meta/recipes-bsp/grub/grub_0.97.bb
index 131d942..ffacb61 100644
--- a/meta/recipes-bsp/grub/grub_0.97.bb
+++ b/meta/recipes-bsp/grub/grub_0.97.bb
@@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b \
                     file://grub/main.c;beginline=3;endline=9;md5=22a5f28d2130fff9f2a17ed54be90ed6"
 
 RDEPENDS_${PN} = "diffutils"
-PR = "r3"
+PR = "r6"
 
 SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz; \
-	   file://autohell.patch;apply=yes "
+            file://no-reorder-functions.patch \
+            file://autohell.patch "
 
 SRC_URI[md5sum] = "cd3f3eb54446be6003156158d51f4884"
 SRC_URI[sha256sum] = "4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b"
-- 
1.7.6



