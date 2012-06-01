Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SaMpf-0002XY-22
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 10:03:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jun 2012 00:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173580830"
Received: from sentry (HELO localhost.localdomain) ([10.237.104.51])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2012 00:52:11 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 10:52:38 +0300
Message-Id: <1338537158-19917-1-git-send-email-cristian.iorga@intel.com>
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
X-List-Received-Date: Fri, 01 Jun 2012 08:03:39 -0000

ltp makefile does not interpret correctly the result of git describe
command and assumes that it is working with a git repo, while in fact
working with a source code archive.
Added a patch to corect makefile system.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../ltp/ltp/fix_building_fom_archive.patch         |   23 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20120401.bb          |    4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch

diff --git a/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
new file mode 100644
index 0000000..c0ecc86
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
@@ -0,0 +1,23 @@
+ltp package build system is broken if building from archive
+
+ltp makefile does not interpret correctly the result of git describe
+command and assumes that it is working with a git repo, while in fact
+working with a source code archive.
+
+Upstream-Status: Pending
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+
+Index: ltp-20120401/Makefile
+===================================================================
+--- ltp-20120401.orig/Makefile
++++ ltp-20120401/Makefile
+@@ -173,7 +173,8 @@ SRCDIR_INSTALL_TARGETS	:= $(SRCDIR_INSTA
+ #
+ .PHONY: Version
+ Version:
+-	if git describe &> /dev/null; then \
++	git describe &> /dev/null
++	if [ $? -eq 0 ]; then \
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



