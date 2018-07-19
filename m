Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBA278A68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:51:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6JEpgNU012015
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jul 2018 07:51:43 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 19 Jul 2018 07:51:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 19 Jul 2018 23:01:51 +0800
Message-ID: <1532012511-40908-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] systemtap: improve reproducibility
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
X-List-Received-Date: Thu, 19 Jul 2018 14:51:42 -0000
Content-Type: text/plain

- Fix build path issue of .pyc files;

- Fix build path issue of c++ object files;

[YOCTO #12528]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...all-python-modules-to-correct-library-dir.patch | 11 ++++++--
 ...1-improve-reproducibility-for-c-compiling.patch | 31 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  8 ++++++
 3 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
index 528864c..c7ba338 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
@@ -5,6 +5,13 @@ Subject: [PATCH] Install python modules to correct library dir.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Supply "--root" directory to the "install" command, and use
+it as a prefix to strip off the purported filename encoded
+in bytecode files. (It strips build path prefix from .pyc files)
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  python/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -18,7 +25,7 @@ index a254480f9..efe9f3c01 100644
  	(cd $(srcdir); CFLAGS="$(AM_CPPFLAGS)" $(PYTHON) setup.py build \
           --build-base $(shell readlink -f $(builddir))/py2build \
 -	 install --prefix $(DESTDIR)$(prefix) \
-+	 install --prefix $(DESTDIR)$(prefix) --install-lib=$(DESTDIR)${pythondir} \
++	 install --root $(DESTDIR) --prefix $(prefix) --prefix $(prefix) --install-lib=${pythondir} \
  	 --single-version-externally-managed \
  	 --record $(shell readlink -f $(builddir))/py2build/install_files.txt \
           --verbose)
@@ -27,7 +34,7 @@ index a254480f9..efe9f3c01 100644
  	(cd $(srcdir); CFLAGS="$(AM_CPPFLAGS)" $(PYTHON3) setup.py build \
           --build-base $(shell readlink -f $(builddir))/py3build \
 -	 install --prefix $(DESTDIR)$(prefix) \
-+	 install --prefix $(DESTDIR)$(prefix) --install-lib=$(DESTDIR)${python3dir} \
++	 install --root $(DESTDIR) --prefix $(prefix) --install-lib=${python3dir} \
  	 --single-version-externally-managed \
  	 --record $(shell readlink -f $(builddir))/py3build/install_files.txt \
           --verbose)
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
new file mode 100644
index 0000000..15a6f2a
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
@@ -0,0 +1,31 @@
+From 6288ba5df0a8c73ef842b609081449ac4de86123 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 18 Jul 2018 16:58:33 +0800
+Subject: [PATCH] improve reproducibility for c++ compiling
+
+Use relative dir to include header string_ref to
+strip build path prefix in c++ object file
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ stringtable.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/stringtable.h b/stringtable.h
+index 5fc42e7..6fd8a1e 100644
+--- a/stringtable.h
++++ b/stringtable.h
+@@ -19,7 +19,7 @@
+ 
+ #if defined(HAVE_BOOST_UTILITY_STRING_REF_HPP)
+ #include <boost/version.hpp>
+-#include <boost/utility/string_ref.hpp> //header with string_ref
++#include "@RELATIVE_STAGING_INCDIR@/boost/utility/string_ref.hpp" //header with string_ref
+ 
+ // XXX: experimental tunables
+ #define INTERNED_STRING_FIND_MEMMEM 1 /* perf stat indicates a very slight benefit */
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index b280f58..0b7833e 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
 
+SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch"
+
 DEPENDS = "elfutils"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
@@ -25,6 +27,12 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 
 inherit autotools gettext pkgconfig distutils3-base
 
+do_configure_prepend () {
+    # Improve reproducibility for c++ object files
+    reltivepath="${@os.path.relpath(d.getVar('STAGING_INCDIR'), d.getVar('S'))}"
+    sed -i "s:@RELATIVE_STAGING_INCDIR@:$reltivepath:g" ${S}/stringtable.h
+}
+
 do_install_append () {
    if [ ! -f ${D}${bindir}/stap ]; then
       # translator disabled case, need to leave only minimal runtime
-- 
2.7.4


