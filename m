Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhP-0008QH-DR
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:07 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197439"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:04 -0800
Message-Id: <668ee69cefe2ccffab3f10199726fd5b60856aac.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/36] qt4-tools-nativesdk: fix build of 4.7.4
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:07 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Commit 4ccae37db1aa77a1d15098c3720ea6e2d383fbdc introduced a sed command
line to modify a file that only exists in 4.8.0, thus do_configure of
4.7.4 was failing; so make this conditional upon the file existing.

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
1.7.7.6



