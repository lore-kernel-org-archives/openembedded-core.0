Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2ISc-0004wt-AX
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:35:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2013 01:19:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="252243151"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Feb 2013 01:19:44 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:20:20 +0200
Message-Id: <05399de088345892abfd0ea7938692c7891e7368.1359967266.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
Subject: [PATCH 06/10] taglib: use LIB_SUFFIX in order to determine the correct baselib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 09:35:36 -0000

WARNING: QA Issue: taglib: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/libtag.so
  /usr/lib/libtag.so.1.12.0
  /usr/lib/libtag.so.1
  /usr/lib/libtag_c.so.0.0.0
  /usr/lib/libtag_c.so
  /usr/lib/libtag_c.so.0
  ...

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-support/taglib/taglib_1.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/taglib/taglib_1.8.bb b/meta/recipes-support/taglib/taglib_1.8.bb
index c713e43..76d2e51 100644
--- a/meta/recipes-support/taglib/taglib_1.8.bb
+++ b/meta/recipes-support/taglib/taglib_1.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=9df2c7399519b7310568a7c55042ecee"
 
-PR = "r0"
+PR = "r1"
 # http://developer.kde.org/~wheeler/files/src/taglib-${PV}.tar.gz
 SRC_URI = "https://github.com/downloads/taglib/taglib/taglib-1.8.tar.gz \
            "
@@ -21,6 +21,8 @@ inherit cmake pkgconfig binconfig
 PACKAGES =+ "${PN}-c"
 FILES_${PN}-c = "${libdir}/libtag_c.so.*"
 
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+
 do_configure_prepend () {
 	rm -f ${S}/admin/ltmain.sh
 	rm -f ${S}/admin/libtool.m4.in
-- 
1.7.11.7



