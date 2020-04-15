Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.24950.1586986120701965509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 14:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03FLSdYw025945
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 14:28:39 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 15 Apr 2020
 14:28:38 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] vim: do not adjust script paths building for target
Date: Wed, 15 Apr 2020 14:28:38 -0700
Message-ID: <20200415212838.39606-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When cross-compiling, do not change scripts to use host
versions of perl and gawk.

Also, use INSANE_SKIP to suppress QA complaints if perl
or gawk are not on the target.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-support/vim/files/no-path-adjust.patch | 27 ++++++++++++++++++++++
 meta/recipes-support/vim/vim.inc                   | 12 +++++-----
 2 files changed, 33 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/vim/files/no-path-adjust.patch

diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
new file mode 100644
index 0000000..05c2d80
--- /dev/null
+++ b/meta/recipes-support/vim/files/no-path-adjust.patch
@@ -0,0 +1,27 @@
+vim: do not adjust script pathnames
+
+When cross-compiling, we do not want to reference the host versions of
+things like perl and awk.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -2507,11 +2507,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
+ 		 rm -rf $$cvs; \
+ 	      fi
+ 	-chmod $(FILEMOD) $(DEST_TOOLS)/*
+-# replace the path in some tools
++
++# replace the path in some tools, but not when cross-compiling
++ifneq ($(CROSS_COMPILING),1)
+ 	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
+ 	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+ 		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+ 		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
++endif
+ 	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
+ 
+ # install the language specific files for tools, if they were unpacked
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 78e3f95..9f3dc08 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
+           file://no-path-adjust.patch \
 "
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
@@ -82,12 +83,6 @@ EXTRA_OECONF = " \
 do_install() {
     autotools_do_install
 
-    # Work around file-rdeps picking up csh, awk, perl or python as a dep
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
-
     # Install example vimrc from runtime files
     install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 
@@ -110,7 +105,12 @@ FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
 FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
 FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
 FILES_${PN}-data = "${datadir}/${BPN}"
+
+# We do not want to complain if perl or gawk are not on the target.
+#
 FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
+INSANE_SKIP_${PN}-tools = "file-rdeps"
+
 FILES_${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/*.vim \
     ${datadir}/${BPN}/${VIMDIR}/autoload \
-- 
2.7.4

