Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB1AB73204
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:23:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 31 Aug 2016 12:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,263,1470726000"; d="scan'208";a="1049803924"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2016 12:23:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 22:22:07 +0300
Message-Id: <20160831192207.8403-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160831192207.8403-1-alexander.kanavin@linux.intel.com>
References: <20160831192207.8403-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] gtk-doc: patch the scripts to not hardcode the full paths to interpreters
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2016 19:23:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...hardocode-paths-to-perl-python-in-scripts.patch | 139 +++++++++++++++++++++
 meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb         |   3 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
new file mode 100644
index 0000000..3c8f2a2
--- /dev/null
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -0,0 +1,139 @@
+From 6fab82b93c7bd301eb42448515b02f7cb3306897 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 31 Aug 2016 16:44:46 +0300
+Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
+
+Doing so when the interpreters are somewhere deep in a sysroot directory
+can reach the shebang line limit, and resulting scripts wouldn't work
+on targets either.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gtkdoc-check.in     | 2 +-
+ gtkdoc-common.pl.in | 2 +-
+ gtkdoc-depscan.in   | 2 +-
+ gtkdoc-fixxref.in   | 2 +-
+ gtkdoc-mkdb.in      | 2 +-
+ gtkdoc-mktmpl.in    | 2 +-
+ gtkdoc-rebase.in    | 2 +-
+ gtkdoc-scan.in      | 2 +-
+ gtkdoc-scangobj.in  | 2 +-
+ tests/tools.sh.in   | 4 ++--
+ 10 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/gtkdoc-check.in b/gtkdoc-check.in
+index 560d69b..b60857f 100755
+--- a/gtkdoc-check.in
++++ b/gtkdoc-check.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!/usr/bin/env perl -w
+ # -*- cperl -*-
+ #
+ # gtk-doc - GTK DocBook documentation generator.
+diff --git a/gtkdoc-common.pl.in b/gtkdoc-common.pl.in
+index 4747396..cfadb78 100644
+--- a/gtkdoc-common.pl.in
++++ b/gtkdoc-common.pl.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!/usr/bin/env perl -w
+ # -*- cperl -*-
+ #
+ # gtk-doc - GTK DocBook documentation generator.
+diff --git a/gtkdoc-depscan.in b/gtkdoc-depscan.in
+index 83af01b..917e247 100644
+--- a/gtkdoc-depscan.in
++++ b/gtkdoc-depscan.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON@
++#!/usr/bin/env python
+ 
+ import gzip, os.path, re
+ 
+diff --git a/gtkdoc-fixxref.in b/gtkdoc-fixxref.in
+index 3d9e8d0..d55190b 100755
+--- a/gtkdoc-fixxref.in
++++ b/gtkdoc-fixxref.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!/usr/bin/env perl -w
+ # -*- cperl -*-
+ #
+ # gtk-doc - GTK DocBook documentation generator.
+diff --git a/gtkdoc-mkdb.in b/gtkdoc-mkdb.in
+index 8dd6d5e..d808750 100755
+--- a/gtkdoc-mkdb.in
++++ b/gtkdoc-mkdb.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!/usr/bin/env perl -w
+ # -*- cperl -*-
+ #
+ # gtk-doc - GTK DocBook documentation generator.
+diff --git a/gtkdoc-mktmpl.in b/gtkdoc-mktmpl.in
+index c64dfd3..2f46c18 100755
+--- a/gtkdoc-mktmpl.in
++++ b/gtkdoc-mktmpl.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!/usr/bin/env perl -w
+ # -*- cperl -*-
+ #
+ # gtk-doc - GTK DocBook documentation generator.
+diff --git a/gtkdoc-rebase.in b/gtkdoc-rebase.in
+index 375482d..cf05b45 100644
+--- a/gtkdoc-rebase.in
++++ b/gtkdoc-rebase.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!/usr/bin/env perl -w
+ # -*- cperl -*-
+ #
+ # gtk-doc - GTK DocBook documentation generator.
+diff --git a/gtkdoc-scan.in b/gtkdoc-scan.in
+index 048e5c9..78c6136 100755
+--- a/gtkdoc-scan.in
++++ b/gtkdoc-scan.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!/usr/bin/env perl -w
+ # -*- cperl -*-
+ #
+ # gtk-doc - GTK DocBook documentation generator.
+diff --git a/gtkdoc-scangobj.in b/gtkdoc-scangobj.in
+index fb66b76..67ee8f7 100644
+--- a/gtkdoc-scangobj.in
++++ b/gtkdoc-scangobj.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!/usr/bin/env perl -w
+ # -*- cperl -*-
+ #
+ # gtk-doc - GTK DocBook documentation generator.
+diff --git a/tests/tools.sh.in b/tests/tools.sh.in
+index a114a42..7073883 100644
+--- a/tests/tools.sh.in
++++ b/tests/tools.sh.in
+@@ -11,7 +11,7 @@ echo "Running suite(s): gtk-doc-$suite";
+ 
+ # test perl scripts
+ for file in gtkdoc-check gtkdoc-fixxref gtkdoc-mkdb gtkdoc-mktmpl gtkdoc-rebase gtkdoc-scan gtkdoc-scangobj ; do
+-  @PERL@ -cwT `which $file`
++  perl -cwT `which $file`
+   if test $? = 1 ; then failed=`expr $failed + 1`; fi
+   tested=`expr $tested + 1`
+ done
+@@ -34,7 +34,7 @@ done
+ 
+ 
+ # test python scripts
+-@PYTHON@ -m py_compile `which gtkdoc-depscan`
++python -m py_compile `which gtkdoc-depscan`
+ if test $? != 0 ; then failed=`expr $failed + 1`; fi
+ tested=`expr $tested + 1`
+ 
+-- 
+2.9.3
+
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
index 0585ca9..6587800 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
@@ -10,6 +10,9 @@ DEPENDS_append = "libxslt xmlto source-highlight-native"
 EXTRA_OECONF_append = " --with-highlight=source-highlight"
 EXTRA_OECONF_append_class-native = " --with-xml-catalog=${sysconfdir}/xml/catalog.xml"
 
+SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
+           "
+
 SRC_URI[archive.md5sum] = "0dc6570953112a464a409fb99258ccbc"
 SRC_URI[archive.sha256sum] = "1ea46ed400e6501f975acaafea31479cea8f32f911dca4dff036f59e6464fd42"
 
-- 
2.9.3


