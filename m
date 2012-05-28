Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SYsyD-000762-NO
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 07:58:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2012 22:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="149128209"
Received: from lpalcu-laptop.sh.intel.com ([10.239.196.129])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2012 22:48:03 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 08:48:00 +0300
Message-Id: <1338184080-18892-4-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1338184080-18892-1-git-send-email-laurentiu.palcu@intel.com>
References: <1338184080-18892-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 3/3] libpciaccess: upgrade to 0.13.1
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
X-List-Received-Date: Mon, 28 May 2012 05:58:22 -0000

Removed also the fix_deletion_of_last_handle.patch because the new
version includes it.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../fix_deletion_of_last_handle.patch              |   51 --------------------
 ...ciaccess_0.12.902.bb => libpciaccess_0.13.1.bb} |    6 +--
 2 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.902.bb => libpciaccess_0.13.1.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch b/meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
deleted file mode 100644
index 1933f45..0000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Upstream-Status: Backport
-
-The below patch is from
-http://cgit.freedesktop.org/xorg/lib/libpciaccess/commit/?id=a798395a1bfd9d06d40e2d8d14377a156c94429a
-It would appear in the next .tar.bz2 release.
-
-------------------------------
-
-commit a798395a1bfd9d06d40e2d8d14377a156c94429a
-Author: Daniel Drake <dsd@laptop.org>
-Date:   Fri Nov 25 12:28:48 2011 -0600
-
-    delete_io_handle: fix deletion of last handle
-    
-    When num_ios goes from 1 to 0, a realloc(ios, 0); call is made.
-    This is equivalent to free(ios) and NULL is returned.
-    
-    However, the previous logic in the code incorrectly discards this NULL
-    return value. When we next call new_io_handle(), realloc(ios, X) is
-    called with "ios" pointing to freed memory. This causes glibc to abort.
-    
-    Correct this logic to detect the 1-to-0 case and handle it correctly.
-    Other cases are unchanged; there is still value in checking the
-    return value from realloc() as it also returns NULL on error.
-    
-    Signed-off-by: Daniel Drake <dsd@laptop.org>
-    Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-
-diff --git a/src/common_io.c b/src/common_io.c
-index f1319f8..5b35e07 100644
---- a/src/common_io.c
-+++ b/src/common_io.c
-@@ -64,10 +64,15 @@ delete_io_handle(struct pci_io_handle *handle)
-         }
-     }
- 
--    new = realloc(ios, sizeof(struct pci_io_handle) * (num_ios - 1));
--    if (new)
--        ios = new;
-     num_ios--;
-+    if (num_ios) {
-+        new = realloc(ios, sizeof(struct pci_io_handle) * num_ios);
-+        if (new)
-+            ios = new;
-+    } else {
-+        free(ios);
-+        ios = NULL;
-+    }
- }
- 
- _pci_hidden void
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb
index 37d291f..178e220 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb
@@ -5,8 +5,6 @@ PCI bus and devices in a platform-independent way."
 
 require xorg-lib-common.inc
 
-SRC_URI += "file://fix_deletion_of_last_handle.patch"
-
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de01cb89a769dc657d4c321c209ce4fc"
 
@@ -14,5 +12,5 @@ PR = "r0"
 
 DEPENDS += "xproto virtual/libx11"
 
-SRC_URI[md5sum] = "f1db198398a8a1143822acc230843e8c"
-SRC_URI[sha256sum] = "0861d5bf68b598baa307e5c9b06dfd38ae03096b46e36b236106517bcd14b63a"
+SRC_URI[md5sum] = "399a419ac6a54f0fc07c69c9bdf452dc"
+SRC_URI[sha256sum] = "27ab68f645691a4ca258dcc9d131040586e134f9233ce079794496f6264da084"
-- 
1.7.9.5



