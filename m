Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C074A6B5CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:59:43 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2013 01:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,844,1367996400"; d="scan'208";a="279808035"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2013 01:59:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 09:59:34 +0100
Message-Id: <eb880f40353abe96bc8c9fbd8f25396c61b23c3b.1376038140.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] gst-ffmpeg: enable using yasm during build
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
X-List-Received-Date: Fri, 09 Aug 2013 08:59:43 -0000

A recipe is now available for this, and it should enhance performance on
x86/x86-64.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index d3f2b3e..ceac4d8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 LICENSE_FLAGS = "commercial"
 HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "gstreamer gst-plugins-base zlib bzip2"
+DEPENDS = "gstreamer gst-plugins-base zlib bzip2 yasm-native"
 
 inherit autotools pkgconfig
 
@@ -49,10 +49,6 @@ PACKAGECONFIG ??= "external-libav"
 PACKAGECONFIG[external-libav] = "--with-system-ffmpeg,,libav"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
 
-# yasm not found, use --disable-yasm for a crippled build for libav
-EXTRA_OECONF_append_x86-64 = " --disable-yasm "
-EXTRA_OECONF_append_x86 = " --disable-yasm "
-
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
-- 
1.8.1.2


