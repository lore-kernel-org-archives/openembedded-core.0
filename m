Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QG5TB-0001wn-NJ
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Apr 2011 10:24:06 +0200
Received: by wye20 with SMTP id 20so3703874wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 01:21:31 -0700 (PDT)
Received: by 10.227.61.13 with SMTP id r13mr1752973wbh.52.1304151689547;
	Sat, 30 Apr 2011 01:21:29 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o6sm2140433wbo.20.2011.04.30.01.21.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2011 01:21:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Apr 2011 10:21:15 +0200
Message-Id: <1304151675-8653-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] git: make it work on the target
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
X-List-Received-Date: Sat, 30 Apr 2011 08:24:06 -0000

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
1.6.6.1



