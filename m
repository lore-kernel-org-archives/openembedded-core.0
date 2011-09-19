Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R5bdm-0007go-Fq
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 13:03:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 03:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50049740"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.110])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2011 03:58:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 11:58:36 +0100
Message-Id: <8d56fe29bb6f9502c56eae71640da4cc31f7e1a4.1316429640.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1316429640.git.paul.eggleton@linux.intel.com>
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1316429640.git.paul.eggleton@linux.intel.com>
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] freetype: disable bzip2 compressed font support
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
X-List-Received-Date: Mon, 19 Sep 2011 11:03:58 -0000

If we do not disable this then it is enabled sometimes and disabled at
others depending on whether bzip2 has been built at the time, and worst
case it will cause a race condition if bzip2 is building at the same
time.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/freetype/freetype_2.4.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.4.6.bb b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
index 8150dd4..94a389a 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.6.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39
 
 SECTION = "libs"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
@@ -28,7 +28,7 @@ inherit autotools pkgconfig binconfig
 LIBTOOL = "${S}/builds/unix/${HOST_SYS}-libtool"
 EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
 EXTRA_OEMAKE_virtclass-native = ""
-EXTRA_OECONF = "--without-zlib"
+EXTRA_OECONF = "--without-zlib --without-bzip2"
 
 do_configure() {
 	cd builds/unix
-- 
1.7.4.1



