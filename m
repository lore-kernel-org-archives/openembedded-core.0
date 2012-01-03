Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrW-0004fO-WF
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752300"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:23 -0800
Message-Id: <21fe60376229dea0eec296bb4d9664235234c25a.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 097/113] libpciaccess: upgrade from 0.12.1 to 0.12.902
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
X-List-Received-Date: Tue, 03 Jan 2012 06:29:36 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

According to http://cgit.freedesktop.org/xorg/lib/libpciaccess/log/, 0.12.902
does fix some bugs, so let's upgrade to it.

Moreover, I pulled a patch from upstream git repo.

I also updated the COPYING's chksum since there is a minor change to the
Copyright header.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../fix_deletion_of_last_handle.patch              |   51 ++++++++++++++++++++
 ...ciaccess_0.12.1.bb => libpciaccess_0.12.902.bb} |    8 ++-
 2 files changed, 56 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.1.bb => libpciaccess_0.12.902.bb} (50%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch b/meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
new file mode 100644
index 0000000..1933f45
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
@@ -0,0 +1,51 @@
+Upstream-Status: Backport
+
+The below patch is from
+http://cgit.freedesktop.org/xorg/lib/libpciaccess/commit/?id=a798395a1bfd9d06d40e2d8d14377a156c94429a
+It would appear in the next .tar.bz2 release.
+
+------------------------------
+
+commit a798395a1bfd9d06d40e2d8d14377a156c94429a
+Author: Daniel Drake <dsd@laptop.org>
+Date:   Fri Nov 25 12:28:48 2011 -0600
+
+    delete_io_handle: fix deletion of last handle
+    
+    When num_ios goes from 1 to 0, a realloc(ios, 0); call is made.
+    This is equivalent to free(ios) and NULL is returned.
+    
+    However, the previous logic in the code incorrectly discards this NULL
+    return value. When we next call new_io_handle(), realloc(ios, X) is
+    called with "ios" pointing to freed memory. This causes glibc to abort.
+    
+    Correct this logic to detect the 1-to-0 case and handle it correctly.
+    Other cases are unchanged; there is still value in checking the
+    return value from realloc() as it also returns NULL on error.
+    
+    Signed-off-by: Daniel Drake <dsd@laptop.org>
+    Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+diff --git a/src/common_io.c b/src/common_io.c
+index f1319f8..5b35e07 100644
+--- a/src/common_io.c
++++ b/src/common_io.c
+@@ -64,10 +64,15 @@ delete_io_handle(struct pci_io_handle *handle)
+         }
+     }
+ 
+-    new = realloc(ios, sizeof(struct pci_io_handle) * (num_ios - 1));
+-    if (new)
+-        ios = new;
+     num_ios--;
++    if (num_ios) {
++        new = realloc(ios, sizeof(struct pci_io_handle) * num_ios);
++        if (new)
++            ios = new;
++    } else {
++        free(ios);
++        ios = NULL;
++    }
+ }
+ 
+ _pci_hidden void
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb
similarity index 50%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb
index b3091fd..5043634 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb
@@ -5,12 +5,14 @@ PCI bus and devices in a platform-independant way."
 
 require xorg-lib-common.inc
 
+SRC_URI += "file://fix_deletion_of_last_handle.patch"
+
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2c765efe1e0722c1badff5e54429b102"
+LIC_FILES_CHKSUM = "file://COPYING;md5=de01cb89a769dc657d4c321c209ce4fc"
 
 PR = "r0"
 
 DEPENDS += "xproto virtual/libx11"
 
-SRC_URI[md5sum] = "d6363ee9f4df79f6fc47cba7c67b0d35"
-SRC_URI[sha256sum] = "cc47d7f0e48cf4eed972916b536fdc97788d7521915e3ae1cc92d540776d7344"
+SRC_URI[md5sum] = "f1db198398a8a1143822acc230843e8c"
+SRC_URI[sha256sum] = "0861d5bf68b598baa307e5c9b06dfd38ae03096b46e36b236106517bcd14b63a"
-- 
1.7.6.4



