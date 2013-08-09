Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D4AE16B5D6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:59:42 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2013 01:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,844,1367996400"; d="scan'208";a="279808030"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2013 01:59:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 09:59:33 +0100
Message-Id: <950bf363a00a0398b7669ec2b87cd49cec303268.1376038140.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] gst-ffmpeg: merge in bbappend from meta-oe
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

* Enable external libav for better optimisations/additional bugfixes
  (internal ffmpeg copy is quite old), default enabled but can be
  disabled using PACKAGECONFIG
* Add a PACKAGECONFIG for orc, disabled by default in line with other
  gstreamer recipes
* Bump PR to r7 so the bbappend can be dropped without PR going
  backwards

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 8605ca4..d3f2b3e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
 SRC_URI[sha256sum] = "76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62"
 
-PR = "r4"
+PR = "r7"
 
 GSTREAMER_DEBUG ?= "--disable-debug"
 
@@ -45,6 +45,10 @@ FFMPEG_EXTRA_CONFIGURE_COMMON = \
 
 EXTRA_OECONF = "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
 
+PACKAGECONFIG ??= "external-libav"
+PACKAGECONFIG[external-libav] = "--with-system-ffmpeg,,libav"
+PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
+
 # yasm not found, use --disable-yasm for a crippled build for libav
 EXTRA_OECONF_append_x86-64 = " --disable-yasm "
 EXTRA_OECONF_append_x86 = " --disable-yasm "
-- 
1.8.1.2


