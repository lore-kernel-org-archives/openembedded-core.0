Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R04Fe-0007MM-No
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 06:24:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2011 21:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,326,1312182000"; d="scan'208";a="47948256"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.30])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2011 21:19:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 21:19:07 -0700
Message-Id: <9f4240fffc8748f28e2d4ce6a6c88dee30ab9ddd.1315109841.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315109841.git.sgw@linux.intel.com>
References: <cover.1315109841.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315109841.git.sgw@linux.intel.com>
References: <cover.1315109841.git.sgw@linux.intel.com>
Subject: [PATCH 1/2] groff: Fix sstate relocation issue
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
X-List-Received-Date: Sun, 04 Sep 2011 04:24:10 -0000

[YOCTO #1439]

This fixes a problem where the native groff has a path hard coded into
it, therefor add a wrapper to set the command line with the correct
paths for fonts and tmac directories.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/groff/groff_1.20.1.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb b/meta/recipes-extended/groff/groff_1.20.1.bb
index 7085911..3e24253 100644
--- a/meta/recipes-extended/groff/groff_1.20.1.bb
+++ b/meta/recipes-extended/groff/groff_1.20.1.bb
@@ -4,7 +4,7 @@ formatting commands and produces formatted output."
 SECTION = "base"
 HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -34,4 +34,11 @@ do_configure_prepend() {
 	fi
 }
 
+do_install_append_virtclass-native() {
+	create_cmdline_wrapper ${D}/${bindir}/groff \
+		-F${STAGING_DIR_NATIVE}/usr/share/groff/${PV}/font \
+		-M${STAGING_DIR_NATIVE}/usr/share/groff/${PV}/tmac
+}
+
+
 BBCLASSEXTEND = "native"
-- 
1.7.6



