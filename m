Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJG-0001in-4V
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2011 16:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="687688454"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 03 May 2011 16:44:41 -0700
Message-Id: <99623a78fe8952f6cd1aeb787a79da26c920ed69.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 22 Apr 2011 10:07:25 +0800
Date: Tue, 03 May 2011 16:44:41 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 15/33] curl: upgrade to version 7.21.6
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
X-List-Received-Date: Tue, 03 May 2011 23:47:18 -0000

From: Qing He <qing.he@intel.com>

from 7.21.2

Signed-off-by: Qing He <qing.he@intel.com>
---
 meta/recipes-support/curl/curl/noldlibpath.patch   |    2 ++
 meta/recipes-support/curl/curl/pkgconfig_fix.patch |    5 ++++-
 .../curl/{curl_7.21.2.bb => curl_7.21.6.bb}        |    6 +++---
 3 files changed, 9 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_7.21.2.bb => curl_7.21.6.bb} (92%)

diff --git a/meta/recipes-support/curl/curl/noldlibpath.patch b/meta/recipes-support/curl/curl/noldlibpath.patch
index a3319a2..f4c72a1 100644
--- a/meta/recipes-support/curl/curl/noldlibpath.patch
+++ b/meta/recipes-support/curl/curl/noldlibpath.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Manipulating LD_LIBRARY_PATH can totally break builds when cross compiling.
 Since we never run compiled binaries for the target, we should *never* need
 to change LD_LIBRARY_PATH.
diff --git a/meta/recipes-support/curl/curl/pkgconfig_fix.patch b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
index a59d39b..ad73c00 100644
--- a/meta/recipes-support/curl/curl/pkgconfig_fix.patch
+++ b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Inappropriate [packaging]
+
+
 Index: curl-7.20.0/libcurl.pc.in
 ===================================================================
 --- curl-7.20.0.orig/libcurl.pc.in	2009-11-17 18:11:07.000000000 +0000
@@ -5,7 +8,7 @@ Index: curl-7.20.0/libcurl.pc.in
 @@ -35,6 +35,7 @@
  URL: http://curl.haxx.se/
  Description: Library to transfer files with ftp, http, etc.
- Version: @VERSION@
+ Version: @CURLVERSION@
 -Libs: -L${libdir} -lcurl @LIBS@
 -Libs.private: @LIBCURL_LIBS@ @LIBS@
 +Requires.private: @GNUTLS_REQUIRED@
diff --git a/meta/recipes-support/curl/curl_7.21.2.bb b/meta/recipes-support/curl/curl_7.21.6.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.21.2.bb
rename to meta/recipes-support/curl/curl_7.21.6.bb
index cc8bbf1..51e14f9 100644
--- a/meta/recipes-support/curl/curl_7.21.2.bb
+++ b/meta/recipes-support/curl/curl_7.21.6.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
            file://pkgconfig_fix.patch"
 
-SRC_URI[md5sum] = "ca96df88e044c7c25d19692ec8b250b2"
-SRC_URI[sha256sum] = "f4a632e704f28767e6bbffcc6112db0590b1c9d50d8226d706ad39632355bf21"
+SRC_URI[md5sum] = "6611989a81ebd7b03a35adc3001ddee0"
+SRC_URI[sha256sum] = "d9a3d3593796147ad9ca994c9e6834a42b49756420a10e996dbf849495d3d955"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.4.1



