Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 222046012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:03:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 03:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860438986"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 03:03:16 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 308966A4087
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:02:07 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 13:04:18 +0200
Message-Id: <1448622259-5907-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/2] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Fri, 27 Nov 2015 11:03:15 -0000

Removing libjpeg from oe-core to replace it with libjpeg-turbo.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/jpeg/jpeg_9a.bb | 29 -----------------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta/recipes-core/jpeg/jpeg_9a.bb

diff --git a/meta/recipes-core/jpeg/jpeg_9a.bb b/meta/recipes-core/jpeg/jpeg_9a.bb
deleted file mode 100644
index ea2e65d..0000000
--- a/meta/recipes-core/jpeg/jpeg_9a.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "libjpeg is a library for handling the JPEG (JFIF) image format"
-DESCRIPTION = "libjpeg contains a library for handling the JPEG (JFIF) image format, as well as related programs for accessing the libjpeg functions."
-HOMEPAGE = "http://www.ijg.org/"
-
-LICENSE ="BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://README;md5=ea93a8a2fed10106b63bc21679edacb9"
-
-SECTION = "libs"
-
-SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
-	  "
-
-SRC_URI[md5sum] = "3353992aecaee1805ef4109aadd433e7"
-SRC_URI[sha256sum] = "3a753ea48d917945dd54a2d97de388aa06ca2eb1066cbfdc6652036349fe05a7"
-
-inherit autotools
-
-PACKAGES =+ 		"jpeg-tools "
-DESCRIPTION_jpeg-tools = "The jpeg-tools package includes the client programs for access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files."
-FILES_jpeg-tools = 	"${bindir}/*"
-
-BBCLASSEXTEND = "native"
-
-pkg_postinst_${PN}_linuxstdbase () {
-    if [ ! -e $D${libdir}/libjpeg.so.62 ]; then
-        JPEG=`find $D${libdir} -type f -name libjpeg.so.\*.\*.\*`
-        ln -sf `basename $JPEG` $D${libdir}/libjpeg.so.62
-    fi
-}
-- 
2.4.0


