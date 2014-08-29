Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5025C7106F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 17:06:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2014 10:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="565468724"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2014 10:06:39 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 20:06:33 +0300
Message-Id: <d2fae85b12f235fc318e5559b0b15cb334bf1134.1409331937.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409331937.git.cristian.iorga@intel.com>
References: <cover.1409331937.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409331937.git.cristian.iorga@intel.com>
References: <cover.1409331937.git.cristian.iorga@intel.com>
Subject: [PATCH 2/3] alsa-tools: upgrade to 1.0.28
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
X-List-Received-Date: Fri, 29 Aug 2014 17:06:39 -0000

mips_has_no_io_h.patch removed, no longer necessary.
Changelog:
http://www.alsa-project.org/main/index.php/Changes_v1.0.27.2_v1.0.28

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../alsa/alsa-tools/mips_has_no_io_h.patch               | 16 ----------------
 .../alsa/{alsa-tools_1.0.27.bb => alsa-tools_1.0.28.bb}  |  7 +++----
 2 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.27.bb => alsa-tools_1.0.28.bb} (82%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch b/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch
deleted file mode 100644
index 09b10f1..0000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: alsa-tools-1.0.26.1/hda-verb/hda-verb.c
-===================================================================
---- alsa-tools-1.0.26.1.orig/hda-verb/hda-verb.c
-+++ alsa-tools-1.0.26.1/hda-verb/hda-verb.c
-@@ -13,7 +13,7 @@
- #include <ctype.h>
- #include <unistd.h>
- #include <sys/ioctl.h>
--#ifndef __PPC__
-+#if !(__PPC__ || __mips__)
- #include <sys/io.h>
- #endif
- #include <sys/types.h>
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb
similarity index 82%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb
index bca7170..4b9509e 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb
@@ -8,14 +8,13 @@ DEPENDS = "alsa-lib ncurses"
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
-           file://mips_has_no_io_h.patch \
+SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
            file://autotools.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', \
                                 'file://makefile_no_gtk.patch', d)}"
 
-SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
-SRC_URI[sha256sum] = "6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2"
+SRC_URI[md5sum] = "e6c929175d8ee729c06d49b51439bad6"
+SRC_URI[sha256sum] = "76e59711c6d0f39cbddce83ce1ed8da00bad112fee021f94fa990d8685cc3761"
 
 inherit autotools-brokensep pkgconfig
 
-- 
1.9.1


