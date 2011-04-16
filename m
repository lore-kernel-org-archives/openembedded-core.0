Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzSd-0006M2-Ud
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:58:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2011 23:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="629635856"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2011 23:56:08 -0700
Message-Id: <578042d2eedb26dea6e9f15d4677d1c2c90adfa9.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 18:26:00 +0800
Date: Fri, 15 Apr 2011 23:56:07 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 58/58] jpeg: add link libjpeg.so.62 for LSB library test
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
X-List-Received-Date: Sat, 16 Apr 2011 06:58:28 -0000

From: Kang Kai <kai.kang@windriver.com>

LSB test just test whether libjpeg.so.62 exists, and no more use of it.
So just make link to pass library check.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/jpeg/jpeg_8b.bb |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/jpeg/jpeg_8b.bb b/meta/recipes-core/jpeg/jpeg_8b.bb
index 8e2c24d..78fabf1 100644
--- a/meta/recipes-core/jpeg/jpeg_8b.bb
+++ b/meta/recipes-core/jpeg/jpeg_8b.bb
@@ -14,7 +14,7 @@ PRIORITY = "required"
 DEPENDS = "libtool-cross"
 DEPENDS_virtclass-native = "libtool-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
 	   file://debian-libjpeg7_7-1.diff;patch=1"
@@ -45,3 +45,14 @@ DESCRIPTION_jpeg-tools = "The jpeg-tools package includes the client programs fo
 FILES_jpeg-tools = 	"${bindir}/*"
 
 BBCLASSEXTEND = "native"
+
+pkg_postinst_${PN}_poky-lsb () {
+    if [ "$D" = "" ]; then
+        if [ ! -e ${libdir}/libjpeg.so.62 ]; then
+            JPEG=`find ${libdir} -type f -name libjpeg.so.\*.\*.\*`
+            ln -sf `basename $JPEG` ${libdir}/libjpeg.so.62
+        fi
+    else
+        exit 1
+    fi
+}
-- 
1.7.1.1



