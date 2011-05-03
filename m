Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJR-0001qN-CF
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2011 16:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="637467210"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2011 16:44:51 -0700
Message-Id: <8658d1f447d3cf3d46d08cc7f25da766f3b1d463.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Sat, 30 Apr 2011 10:21:15 +0200
Date: Tue, 03 May 2011 16:44:51 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 23/33] git: make it work on the target
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
X-List-Received-Date: Tue, 03 May 2011 23:47:30 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Packaging is synced with OE .dev, but without the -large, thanks to pseudo we retain all (hard)links properly:

* git-perltools holds all the utils requiring perl and adds appropriate RDEPENDS
* git-tk holds the tcl/tk utils once they get activate
* git now packages /usr/libexec/git-core

The result:

8.5M	ipk/armv7a/git_1.7.4.3-r2_armv7a.ipk
3.1M	ipk/armv7a/git-dbg_1.7.4.3-r2_armv7a.ipk
4.0K	ipk/armv7a/git-dev_1.7.4.3-r2_armv7a.ipk
12K	ipk/armv7a/git-doc_1.7.4.3-r2_armv7a.ipk
136K	ipk/armv7a/git-perltools_1.7.4.3-r2_armv7a.ipk

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/git/git.inc        |   32 ++++++++++++++++++++++++++++-
 meta/recipes-devtools/git/git_1.7.4.3.bb |    2 +-
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 843a1d3..7f12859 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -14,11 +14,39 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl --without-tcltk"
 inherit autotools
 
 do_install () {
-	oe_runmake install DESTDIR="${D}" bindir=${bindir} gitexecdir=${gitexecdir} \
+	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
 }
 
-FILES_${PN} += "${datadir}/git-core"
+FILES_${PN} += "${datadir}/git-core ${libxecdir}/git-core/"
+FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
+
+# Git tools requiring perl
+PACKAGES =+ "${PN}-perltools"
+FILES_${PN}-perltools += " \
+    ${libexecdir}/git-core/git-add--interactive \
+    ${libexecdir}/git-core/git-archimport \
+    ${libexecdir}/git-core/git-cvsexportcommit \
+    ${libexecdir}/git-core/git-cvsimport \
+    ${libexecdir}/git-core/git-cvsserver \
+    ${bindir}/git-cvsserver \
+    ${libexecdir}/git-core/git-difftool \
+    ${libexecdir}/git-core/git-relink \
+    ${libexecdir}/git-core/git-send-email \
+    ${libexecdir}/git-core/git-svn \
+    ${datadir}/perl \
+"
+RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
+
+# git-tk package with gitk and git-gui
+PACKAGES =+ "${PN}-tk"
+RDEPENDS_${PN}-tk = "${PN} tk tcl"
+EXTRA_OEMAKE = "TCL_PATH=${STAGING_BINDIR_CROSS}/tclsh"
+FILES_${PN}-tk = " \
+    ${bindir}/gitk \
+    ${datadir}/gitk \
+"
+
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb b/meta/recipes-devtools/git/git_1.7.4.3.bb
index 2ff1ed5..45ef61b 100644
--- a/meta/recipes-devtools/git/git_1.7.4.3.bb
+++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
@@ -1,6 +1,6 @@
 require git.inc
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.4.1



