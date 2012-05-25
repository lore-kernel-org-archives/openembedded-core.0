Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoON-000867-W2
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115429"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:59 -0700
Message-Id: <94ff53cc85f2ef94ff296fd84f82cd3aff8cffd9.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 20/45] texinfo: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:53:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../texinfo_fix_for_automake-1.12.patch            |   24 ++++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    3 +-
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/texinfo_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo_fix_for_automake-1.12.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..11d34b1
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo_fix_for_automake-1.12.patch
@@ -0,0 +1,24 @@
+Upstream-Status: pending
+
+automake 1.12 has deprecated support for lzma-compressed distribution archives
+this patch fixes following issue with automake 1.12
+
+| configure.ac:16: error: support for lzma-compressed distribution archives has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+
+Index: texinfo-4.13/configure.ac
+===================================================================
+--- texinfo-4.13.orig/configure.ac
++++ texinfo-4.13/configure.ac
+@@ -13,7 +13,7 @@ AC_INIT([GNU Texinfo], [4.13], [bug-texi
+ 
+ dnl Must come before AM_INIT_AUTOMAKE.
+ AC_CONFIG_AUX_DIR([build-aux])
+-AM_INIT_AUTOMAKE([1.10.1 readme-alpha dist-lzma])
++AM_INIT_AUTOMAKE([1.10.1 readme-alpha])
+ 
+ # Minimum Autoconf version required.
+ AC_PREREQ(2.59)
diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index f9e566b..50892ce 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/texinfo/"
 SECTION = "console/utils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "zlib ncurses texinfo-native"
 DEPENDS_virtclass-native = "zlib-native ncurses-native"
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.gz \
            file://disable-native-tools.patch \
            file://link-zip.patch \
            file://gettext-macros.patch \
+           file://texinfo_fix_for_automake-1.12.patch \
            ${TARGET_PATCH}"
 
 SRC_URI[md5sum] = "71ba711519209b5fb583fed2b3d86fcb"
-- 
1.7.7.6



