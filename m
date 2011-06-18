Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QY0lC-0006oO-7X
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 21:00:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Jun 2011 11:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,386,1304319600"; d="scan'208";a="15140023"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.16.245])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2011 11:57:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jun 2011 19:56:49 +0100
Message-Id: <11485e23dab6a284009ac850616899faf1005f1a.1308423290.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308423290.git.paul.eggleton@linux.intel.com>
References: <cover.1308423290.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1308423290.git.paul.eggleton@linux.intel.com>
References: <cover.1308423290.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] qt4-tools-nativesdk: fix unpack failure due to missing g++.conf
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
X-List-Received-Date: Sat, 18 Jun 2011 19:00:46 -0000

FILESPATHPKG was being used to in order to bring in linux.conf and
g++.conf in this recipe, however this probably never worked since
FILESPATHPKG always has the MACHINE appended to it and these are not
machine-specific files. The only reason it built was that these two files
could be found within the "files" subdir until we removed Qt 4.6.3.
Using FILESEXTRAPATHS (as qt4-tools-native does) solves this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index 5faf40c..d1f4b47 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -5,9 +5,10 @@ HOMEPAGE = "http://qt.nokia.com"
 PRIORITY = "optional"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r3"
+INC_PR = "r4"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
-FILESPATHPKG =. "qt-${PV}:"
 inherit nativesdk qmake2
 
 SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-- 
1.7.4.1



