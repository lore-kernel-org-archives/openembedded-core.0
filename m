Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RirGX-0007x7-MN
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:38:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92761358"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:30:43 -0800
Message-Id: <313df815ee1c22e6a80c6b46ef1f106653c86042.1325784550.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
References: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325784550.git.nitin.a.kamble@intel.com>
References: <cover.1325784550.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/7] libxxf86dga: fix compilation with x32 toolchain
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
X-List-Received-Date: Thu, 05 Jan 2012 17:38:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fix type conversion for x32. For x32 the off_t is 64bit and pointers are
32bit.
so the conversion of pointer to off_t was resulting into this error:

| XF86DGA2.c:931:24: error: cast from pointer to integer of different
size [-Werror=pointer-to-int-cast]
| cc1: some warnings being treated as errors
|
| make[2]: *** [XF86DGA2.lo] Error 1

Fixed it by typecasting pointer into unsigned long 1st and then again
typecasting unsigned long to off_t.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libxxf86dga-1.1.2_fix_for_x32.patch            |   30 ++++++++++++++++++++
 .../recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb |    5 ++-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-1.1.2_fix_for_x32.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-1.1.2_fix_for_x32.patch b/meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-1.1.2_fix_for_x32.patch
new file mode 100644
index 0000000..30692ad
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-1.1.2_fix_for_x32.patch
@@ -0,0 +1,30 @@
+Upstream-Status: pending
+
+Fix type conversion for x32. For x32 the off_t is 64bit and pointers are 32bit.
+so the conversion of pointer to off_t was resulting into this error:
+
+| XF86DGA2.c:931:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+| cc1: some warnings being treated as errors
+| 
+| make[2]: *** [XF86DGA2.lo] Error 1
+
+Fixed it by typecasting pointer into unsigned long 1st and then again typecasting 
+unsigned long to off_t.
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/01/04
+
+
+Index: libXxf86dga-1.1.2/src/XF86DGA2.c
+===================================================================
+--- libXxf86dga-1.1.2.orig/src/XF86DGA2.c	2010-10-06 21:17:11.000000000 -0700
++++ libXxf86dga-1.1.2/src/XF86DGA2.c	2012-01-04 14:21:36.275971172 -0800
+@@ -928,7 +928,7 @@ DGAMapPhysical(
+     if ((pMap->fd = open(name, O_RDWR)) < 0)
+ 	return False;
+     pMap->virtual = mmap(NULL, size, PROT_READ | PROT_WRITE, 
+-			MAP_FILE | MAP_SHARED, pMap->fd, (off_t)base);
++			MAP_FILE | MAP_SHARED, pMap->fd, (off_t)(unsigned long)base);
+     if (pMap->virtual == (void *)-1)
+ 	return False;
+     mprotect(pMap->virtual, size, PROT_READ | PROT_WRITE);
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
index 8e777c3..9a1c96f 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
@@ -8,7 +8,10 @@ allows relative mouse reporting, et al.  It is mainly used by games and \
 emulators for games."
 
 DEPENDS += "libxext xf86dgaproto"
-PR = "r1"
+PR = "r2"
+
+SRC_URI += "file://libxxf86dga-1.1.2_fix_for_x32.patch"
+
 PE = "1"
 
 XORG_PN = "libXxf86dga"
-- 
1.7.6.4



