Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RvYN0-00047b-5t
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:05:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2012 09:57:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105753147"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.13])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2012 09:57:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, philip@balister.org,
	eric@eukrea.com
Date: Thu,  9 Feb 2012 17:57:09 +0000
Message-Id: <132bea470ed535e3d455253f9e7fe3f7fa371e9b.1328809777.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1328809777.git.paul.eggleton@linux.intel.com>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1328809777.git.paul.eggleton@linux.intel.com>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 3/4] qt4-tools-nativesdk: fix build of 4.7.4
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
X-List-Received-Date: Thu, 09 Feb 2012 18:05:22 -0000

The previous commit uses sed to modify a file that only exists in 4.8.0,
thus do_configure of 4.7.4 was failing; so make this conditional upon
the file existing.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index 4b097cf..64cc1ae 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
@@ -59,9 +59,12 @@ do_configure() {
 
     cp ../g++.conf mkspecs/common
     cp ../linux.conf mkspecs/common
-    # don't use host g++ even during configure
-    sed -i -e "s#g++#${CXX}#" mkspecs/common/g++-base.conf
-    sed -i -e "s#gcc#${CC}#" mkspecs/common/g++-base.conf
+
+    if [ -f mkspecs/common/g++-base.conf ] ; then
+        # don't use host g++ even during configure (4.8.0+)
+        sed -i -e "s#g++#${CXX}#" mkspecs/common/g++-base.conf
+        sed -i -e "s#gcc#${CC}#" mkspecs/common/g++-base.conf
+    fi
 
     # first launch configure to get qmake compiled for the nativesdk
     (echo o; echo yes) | CC="${CC}" CXX="${CXX}" ./configure ${EXTRA_OECONF} || true
-- 
1.7.5.4



