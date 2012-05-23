Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDE-0006Li-AF
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507164"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:27 -0700
Message-Id: <85318707a2b7475a03658238826448afe25013f1.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 12/30] texinfo: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:00 -0000

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
1.7.7



