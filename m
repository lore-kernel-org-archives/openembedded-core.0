Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWnc-0001zq-4N
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:09:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720801"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:14 -0800
Message-Id: <356645a0891624a037c004e35569dc8bea4db334.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 14/26] xf86-video-intel: Update to 2.17.0
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
X-List-Received-Date: Tue, 29 Nov 2011 23:09:16 -0000

* Remove patch for issue fixed upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-driver/xf86-video-intel/buildfix.patch    |   22 --------------------
 ...-intel_2.16.0.bb => xf86-video-intel_2.17.0.bb} |   14 +++++-------
 2 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/buildfix.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.16.0.bb => xf86-video-intel_2.17.0.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/buildfix.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/buildfix.patch
deleted file mode 100644
index ea5ce79..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/buildfix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Newer mesa doesn't provide dri support, just dri2. The intel driver
-hasn't quite caught up and whilst the configure checks work, the
-global includes have not and need manually tweaking.
-
-RP 2011/10/12
-
-Upstream Status: Superceeded
-
-Index: xf86-video-intel-2.16.0/src/intel.h
-===================================================================
---- xf86-video-intel-2.16.0.orig/src/intel.h	2011-10-12 20:36:18.587187994 +0100
-+++ xf86-video-intel-2.16.0/src/intel.h	2011-10-12 20:36:30.717188011 +0100
-@@ -65,9 +65,7 @@
- #include <pciaccess.h>
- 
- #include "xf86drm.h"
--#include "sarea.h"
- #define _XF86DRI_SERVER_
--#include "dri.h"
- #include "dri2.h"
- #include "intel_bufmgr.h"
- #include "i915_drm.h"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.16.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.17.0.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.16.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.17.0.bb
index 89bc2c5..ca90be2 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.16.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.17.0.bb
@@ -11,17 +11,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
 PR = "${INC_PR}.0"
 
+DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
+	    virtual/libgl xineramaproto xf86driproto libpciaccess"
+
+SRC_URI[md5sum] = "6d7b1f199dba5820f250888b136186ff"
+SRC_URI[sha256sum] = "8b8450f2a2cc52ef31a83414e2f290e748a956690e11b41759d5650aaedc4387"
+
 EXTRA_OECONF += "--disable-xvmc"
 
 # --enable-kms-only option is required by ROOTLESS_X
 EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "", d )}'
 
-DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
-	    virtual/libgl xineramaproto xf86driproto libpciaccess"
-
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-
-SRC_URI += "file://buildfix.patch"
-
-SRC_URI[md5sum] = "e0406c50a747c358654b93cb23bf7375"
-SRC_URI[sha256sum] = "77482bcd1e30a57b68ba0d6a1862b4ff3c55fa23bf0109ec2af318a3e066ebfe"
-- 
1.7.6.4



