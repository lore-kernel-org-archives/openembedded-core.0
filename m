Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZV6U-0004r4-5R
	for openembedded-core@openembedded.org; Sat, 10 Dec 2011 23:09:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2011 14:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100849593"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2011 14:02:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Sat, 10 Dec 2011 14:02:00 -0800
Message-Id: <fb8e8e13ad2294768bd267c7e64c35bb690efcc3.1323554268.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323554268.git.sgw@linux.intel.com>
References: <cover.1323554268.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323554268.git.sgw@linux.intel.com>
References: <cover.1323554268.git.sgw@linux.intel.com>
Subject: [PATCH 4/5] texinfo: fix compile failure due target makedoc binary being used
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
X-List-Received-Date: Sat, 10 Dec 2011 22:09:10 -0000

Need to have the texinfo-native build and install a host sysroot makedoc
binary and then patch the target build to use this binary. This requires
that we don't ASSUME_PROVIDED texinfo-native any longer since we need to
install this makedoc tool which is not part of the normal distrubtion.

This convouted installation is needed because we have disabled
the cross-compliation of texinfo tools due to host intrusion
issues. http://bugzilla.pokylinux.org/show_bug.cgi?id=1483

[YOCTO #1664]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../texinfo/texinfo-4.13a/use_host_makedoc.patch   |   37 ++++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   11 +++++-
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/use_host_makedoc.patch

diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/use_host_makedoc.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/use_host_makedoc.patch
new file mode 100644
index 0000000..db41f1a
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/use_host_makedoc.patch
@@ -0,0 +1,37 @@
+This patch requires that we also enable building of the
+texinfo-native recipe which will install the makedoc tool 
+for the host machine.
+
+This patch simply uses the newly installed makedoc tool from
+sysroot.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: texinfo-4.13/info/Makefile.am
+===================================================================
+--- texinfo-4.13.orig/info/Makefile.am	2008-05-22 05:11:33.000000000 -0700
++++ texinfo-4.13/info/Makefile.am	2011-12-10 12:55:53.604440118 -0800
+@@ -75,7 +75,7 @@
+ # more than once.
+ funs.h: makedoc$(EXEEXT) $(cmd_sources)
+ 	rm -f $(generated_sources)
+-	$(top_builddir)/$(native_tools)/info/makedoc $(cmd_sources)
++	makedoc $(cmd_sources)
+ 
+ # The following hack is necessary to hint make before the automatic
+ # dependencies are built.
+Index: texinfo-4.13/doc/Makefile.am
+===================================================================
+--- texinfo-4.13.orig/doc/Makefile.am	2008-09-18 11:31:56.000000000 -0700
++++ texinfo-4.13/doc/Makefile.am	2011-12-10 13:04:09.216457601 -0800
+@@ -19,7 +19,7 @@
+ 
+ # Use the programs built in our distribution, taking account of possible
+ # cross-compiling.
+-MAKEINFO = $(top_builddir)/$(native_tools)/makeinfo/makeinfo
++MAKEINFO = makeinfo
+ 
+ # We'd also like to use something like this, but Automake calls
+ # "install-info" directly.
diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index 9f1c04a..f205d4e 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -6,11 +6,14 @@ HOMEPAGE = "http://www.gnu.org/software/texinfo/"
 SECTION = "console/utils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "zlib ncurses texinfo-native"
 DEPENDS_virtclass-native = "zlib-native ncurses-native"
 
+TARGET_PATCH = "file://use_host_makedoc.patch"
+TARGET_PATCH_virtclass-native = ""
+
 SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.gz \
            file://texinfo-4.12-zlib.patch \
            file://texinfo-4.13a-data_types.patch \
@@ -19,7 +22,8 @@ SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.gz \
            file://texinfo-4.13a-help-index-segfault.patch \
            file://disable-native-tools.patch \
            file://link-zip.patch \
-           file://gettext-macros.patch"
+           file://gettext-macros.patch \
+           ${TARGET_PATCH}"
 
 SRC_URI[md5sum] = "71ba711519209b5fb583fed2b3d86fcb"
 SRC_URI[sha256sum] = "1303e91a1c752b69a32666a407e9fbdd6e936def4b09bc7de30f416301530d68"
@@ -39,6 +43,9 @@ do_install_append() {
 	mkdir -p ${D}${datadir}/${tex_texinfo}
 	install -p -m644 doc/texinfo.tex doc/txi-??.tex ${D}${datadir}/${tex_texinfo} 	
 }
+do_install_append_virtclass-native() {
+	install -m 755 info/makedoc ${D}${bindir}
+}
 
 PACKAGES += "info info-doc"
 
-- 
1.7.6.4



