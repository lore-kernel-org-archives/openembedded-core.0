Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sod5V-0006tq-2F
	for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:14:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2012 09:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120803496"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jul 2012 09:03:41 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 09:02:15 -0700
Message-Id: <b64abc1706307236805da42dc0362f729c87817f.1341935782.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
References: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341935782.git.nitin.a.kamble@intel.com>
References: <cover.1341935782.git.nitin.a.kamble@intel.com>
Subject: [PATCH 15/19] libunistring: fix build with automake 1.12
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
X-List-Received-Date: Tue, 10 Jul 2012 16:14:58 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added a new patch:
   libunistring/libunistring_fix_for_automake_1.12.patch

More comments in the patch header.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libunistring_fix_for_automake_1.12.patch       |   81 ++++++++++++++++++++
 .../libunistring/libunistring_0.9.3.bb             |    5 +-
 2 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch

diff --git a/meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch b/meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..5d831d5
--- /dev/null
+++ b/meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch
@@ -0,0 +1,81 @@
+Upstream-Status: Pending
+
+automake 1.12 has deprecated use of mkdir_p, and it recommends
+use of MKDIR_P instead. Changed the code to avoid these kind 
+of warning-errors.
+
+| make[2]: /build/tmp/work/x86_64-linux/libunistring-native-0.9.3-r2/image/srv/home/nitin/builds2/build0/tmp/sysroots/x86_64-linux/usr/share/doc/libunistring: Command not found
+| make[2]: *** [install-html-split] Error 127
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/10
+
+Index: libunistring-0.9.3/doc/Makefile.am
+===================================================================
+--- libunistring-0.9.3.orig/doc/Makefile.am
++++ libunistring-0.9.3/doc/Makefile.am
+@@ -87,7 +87,7 @@ TEXI2DVI = @TEXI2DVI@ $(TEXINCLUDES)
+ # The install-dvi target is already defined by automake.
+ 
+ installdirs-dvi:
+-	$(mkdir_p) $(DESTDIR)$(dvidir)
++	$(MKDIR_P) $(DESTDIR)$(dvidir)
+ 
+ uninstall-dvi:
+ 	$(RM) $(DESTDIR)$(dvidir)/libunistring.dvi
+@@ -105,7 +105,7 @@ libunistring.ps: libunistring.dvi
+ # The install-ps target is already defined by automake.
+ 
+ installdirs-ps:
+-	$(mkdir_p) $(DESTDIR)$(psdir)
++	$(MKDIR_P) $(DESTDIR)$(psdir)
+ 
+ uninstall-ps:
+ 	$(RM) $(DESTDIR)$(psdir)/libunistring.ps
+@@ -120,7 +120,7 @@ TEXI2PDF = @TEXI2DVI@ --pdf $(TEXINCLUDE
+ # The install-pdf target is already defined by automake.
+ 
+ installdirs-pdf:
+-	$(mkdir_p) $(DESTDIR)$(pdfdir)
++	$(MKDIR_P) $(DESTDIR)$(pdfdir)
+ 
+ uninstall-pdf:
+ 	$(RM) $(DESTDIR)$(pdfdir)/libunistring.pdf
+@@ -151,17 +151,17 @@ libunistring_toc.html: libunistring.texi
+ 	   }
+ 
+ install-html-monolithic: libunistring.html
+-	$(mkdir_p) $(DESTDIR)$(htmldir)
++	$(MKDIR_P) $(DESTDIR)$(htmldir)
+ 	$(INSTALL_DATA) `if test -f libunistring.html; then echo .; else echo $(srcdir); fi`/libunistring.html $(DESTDIR)$(htmldir)/libunistring.html
+ 
+ install-html-split: libunistring_toc.html
+-	$(mkdir_p) $(DESTDIR)$(htmldir)
++	$(MKDIR_P) $(DESTDIR)$(htmldir)
+ 	for file in `if test -f libunistring_toc.html; then echo .; else echo $(srcdir); fi`/libunistring_*.html; do \
+ 	  $(INSTALL_DATA) $$file $(DESTDIR)$(htmldir)/`basename $$file`; \
+ 	done
+ 
+ installdirs-html:
+-	$(mkdir_p) $(DESTDIR)$(htmldir)
++	$(MKDIR_P) $(DESTDIR)$(htmldir)
+ 
+ uninstall-html-monolithic:
+ 	$(RM) $(DESTDIR)$(htmldir)/libunistring.html
+@@ -170,14 +170,14 @@ uninstall-html-split:
+ 	$(RM) $(DESTDIR)$(htmldir)/libunistring_*.html
+ 
+ dist-html-monolithic:
+-	$(mkdir_p) $(distdir)/
++	$(MKDIR_P) $(distdir)/
+ 	file=libunistring.html; \
+ 	if test -f $$file; then d=.; else d=$(srcdir); fi; \
+ 	cp -p $$d/$$file $(distdir)/$$file || exit 1
+ 
+ # We would like to put libunistring_*.html into EXTRA_DIST, but it doesn't work.
+ dist-html-split: libunistring_toc.html
+-	$(mkdir_p) $(distdir)/
++	$(MKDIR_P) $(distdir)/
+ 	file=libunistring_toc.html; \
+ 	if test -f $$file; then d=.; else d=$(srcdir); fi; \
+ 	for file in `cd $$d && echo libunistring_*.html`; do \
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
index 02a28f4..454a0e6 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.3.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
@@ -18,12 +18,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6" 
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
-           file://parallelmake.patch"
+           file://parallelmake.patch \
+           file://libunistring_fix_for_automake_1.12.patch"
 
 SRC_URI[md5sum] = "db8eca3b64163abadf8c40e5cecc261f"
 SRC_URI[sha256sum] = "610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f764041006a3"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4



