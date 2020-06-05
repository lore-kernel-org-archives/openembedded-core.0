Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2559.1591323245619188881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 19:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0552Dits008246
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jun 2020 19:13:55 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 4 Jun 2020 19:13:34 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] Revert "vim: do not adjust script paths building for target"
Date: Fri, 5 Jun 2020 10:13:31 +0800
Message-ID: <20200605021331.20630-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

This reverts commit 8972fe5581b9fe8ef14d539001758bb13bca6737.

The above commit causes regression when vim-tools is installed.
The error is like below.

Error:
 Problem: conflicting requests
   - nothing provides /bin/csh needed by vim-tools-8.2-r0.corei7_64
   - nothing provides /usr/bin/nawk needed by vim-tools-8.2-r0.corei7_64
   - nothing provides /usr/bin/python needed by vim-tools-8.2-r0.corei7_64

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../vim/files/no-path-adjust.patch            | 27 -------------------
 meta/recipes-support/vim/vim.inc              | 12 ++++-----
 2 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/no-path-adjust.patch

diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
deleted file mode 100644
index 05c2d803f6..0000000000
--- a/meta/recipes-support/vim/files/no-path-adjust.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-vim: do not adjust script pathnames
-
-When cross-compiling, we do not want to reference the host versions of
-things like perl and awk.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -2507,11 +2507,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
- 		 rm -rf $$cvs; \
- 	      fi
- 	-chmod $(FILEMOD) $(DEST_TOOLS)/*
--# replace the path in some tools
-+
-+# replace the path in some tools, but not when cross-compiling
-+ifneq ($(CROSS_COMPILING),1)
- 	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
- 	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
- 		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
- 		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
-+endif
- 	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
- 
- # install the language specific files for tools, if they were unpacked
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9f3dc08027..78e3f9528d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
-           file://no-path-adjust.patch \
 "
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
@@ -83,6 +82,12 @@ EXTRA_OECONF = " \
 do_install() {
     autotools_do_install
 
+    # Work around file-rdeps picking up csh, awk, perl or python as a dep
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
+
     # Install example vimrc from runtime files
     install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 
@@ -105,12 +110,7 @@ FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
 FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
 FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
 FILES_${PN}-data = "${datadir}/${BPN}"
-
-# We do not want to complain if perl or gawk are not on the target.
-#
 FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
-INSANE_SKIP_${PN}-tools = "file-rdeps"
-
 FILES_${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/*.vim \
     ${datadir}/${BPN}/${VIMDIR}/autoload \
-- 
2.17.1

