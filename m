Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hj-0006Z6-HV
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980211"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:55:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:24 -0700
Message-Id: <811a2cc3d1f9d025f99f7decfa6d3603cb3ca5f2.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/32] tcl: fix networking breakage
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:43 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Without providing these site entries tcl networking doesn't work on the target.

Original OE commit:

commit 0c340037644f87054462f62b50cd397c162615b7
Author: Koen Kooi <koen@openembedded.org>
Date:   Wed May 26 13:04:18 2010 +0200

    tcl: add 2 entries to arm-linux site file (possibly only glibc specific, need to check)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
index 2eabb4d..1b4ae83 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
     file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
     "
 
-PR = "r1"
+PR = "r2"
 
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
@@ -30,7 +30,9 @@ inherit autotools
 
 DEPENDS_virtclass-native = ""
 
-EXTRA_OECONF = "--enable-threads"
+EXTRA_OECONF = "--enable-threads \
+                tcl_cv_api_getaddrinfo=yes \
+               "
 
 do_configure() {
 	gnu-configize
-- 
1.7.6



