Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigy1-0001EK-8K
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:25 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:31:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663923"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:31:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:46 -0800
Message-Id: <f0cf6b492d89f0b23087744c3dcaed7532f9f13e.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/28] libxp: fix cast error
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-lib/libxp/fix-cast-error.patch            |   42 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb      |    4 +-
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch b/meta/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch
new file mode 100644
index 0000000..fea18cf
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch
@@ -0,0 +1,42 @@
+This patch fixes these new errors:
+
+| XpNotifyPdm.c:234:10: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+| XpNotifyPdm.c:271:10: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+| XpNotifyPdm.c:286:10: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: libXp-1.0.1/src/XpNotifyPdm.c
+===================================================================
+--- libXp-1.0.1.orig/src/XpNotifyPdm.c
++++ libXp-1.0.1/src/XpNotifyPdm.c
+@@ -231,7 +231,7 @@ XpGetPdmStartParams (
+ 	/*
+ 	 * Error - cannot determine or establish a selection_display.
+ 	 */
+-	return( (Status) NULL );
++	return( (Status) 0 );
+     }
+ 
+     /*
+@@ -268,7 +268,7 @@ XpGetPdmStartParams (
+ 	    XCloseDisplay( *selection_display );
+ 	    *selection_display = (Display *) NULL;
+ 	}
+-	return( (Status) NULL );
++	return( (Status) 0 );
+     }
+ 
+     status = XmbTextListToTextProperty( *selection_display, list, 6,
+@@ -283,7 +283,7 @@ XpGetPdmStartParams (
+ 	    XCloseDisplay( *selection_display );
+ 	    *selection_display = (Display *) NULL;
+ 	}
+-	return( (Status) NULL );
++	return( (Status) 0 );
+     }
+ 
+     *type              = text_prop.encoding;
diff --git a/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb b/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
index a19f561..349dad1 100644
--- a/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
@@ -10,12 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9504a1264f5ddd4949254a57c0f8d6bb \
                     file://src/XpPage.c;beginline=2;endline=35;md5=2b7d3d2ba5505b19271cf31b6918997e"
 
 DEPENDS += "libxext libxau printproto"
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXp"
 
 CFLAGS_append += " -I ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
 
+SRC_URI += "file://fix-cast-error.patch"
+
 SRC_URI[md5sum] = "7ae1d63748e79086bd51a633da1ff1a9"
 SRC_URI[sha256sum] = "71d1f260005616d646b8c8788365f2b7d93911dac57bb53b65753d9f9e6443d2"
-- 
1.7.6.4



