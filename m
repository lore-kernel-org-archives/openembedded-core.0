Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Sbz0R-0002YV-Ux
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 21:01:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jun 2012 11:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="148568416"
Received: from sentry (HELO localhost.localdomain) ([10.237.104.51])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2012 11:50:59 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2012 21:51:17 +0300
Message-Id: <1338922277-26222-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] ltp: Add patch to correct failing build
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
X-List-Received-Date: Tue, 05 Jun 2012 19:01:28 -0000

ltp makefile does not interpret correctly the result of git describe
command and assumes that it is working with a git repo, while in fact
working with a source code archive.
Added a patch to corect makefile system.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../ltp/ltp/fix_building_fom_archive.patch         |   13 +++++++++++++
 meta/recipes-extended/ltp/ltp_20120401.bb          |    4 ++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch

diff --git a/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
new file mode 100644
index 0000000..a8064cf
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
@@ -0,0 +1,13 @@
+Index: ltp-20120401/Makefile
+===================================================================
+--- ltp-20120401.orig/Makefile
++++ ltp-20120401/Makefile
+@@ -173,7 +173,7 @@ SRCDIR_INSTALL_TARGETS	:= $(SRCDIR_INSTA
+ #
+ .PHONY: Version
+ Version:
+-	if git describe &> /dev/null; then \
++	if git describe > /dev/null 2>&1; then \
+ 		git describe > "$@"; \
+ 	else \
+ 		cp VERSION "$@"; \
diff --git a/meta/recipes-extended/ltp/ltp_20120401.bb b/meta/recipes-extended/ltp/ltp_20120401.bb
index 912d6d9..563bd58 100644
--- a/meta/recipes-extended/ltp/ltp_20120401.bb
+++ b/meta/recipes-extended/ltp/ltp_20120401.bb
@@ -21,10 +21,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
-          "
+           file://fix_building_fom_archive.patch"
 
 SRC_URI[md5sum] = "e1d0acf1a6b6da0cb30dc1b0dcf5f26d"
 SRC_URI[sha256sum] = "f0f5845f9666f61332fdf0b7e396fc647f9372db0902a829af2cf9402b807bd1"
-- 
1.7.9.5



