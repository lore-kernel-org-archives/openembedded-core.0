Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD8DF660EF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 07:45:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s597jtRr018060
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jun 2014 00:45:55 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 9 Jun 2014 00:45:55 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jun 2014 15:45:52 +0800
Message-ID: <a09006c4c3a44124e37576d9e44d79019cd25739.1402299786.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1402299786.git.Chong.Lu@windriver.com>
References: <cover.1402299786.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sed: enable ptest support
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
X-List-Received-Date: Mon, 09 Jun 2014 07:46:01 -0000
Content-Type: text/plain

Install sed test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/sed/sed-4.2.2/run-ptest      |  3 +
 .../sed/sed-4.2.2/sed-add-ptest.patch              | 66 ++++++++++++++++++++++
 meta/recipes-extended/sed/sed_4.2.2.bb             | 21 ++++++-
 3 files changed, 87 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/sed/sed-4.2.2/run-ptest
 create mode 100644 meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch

diff --git a/meta/recipes-extended/sed/sed-4.2.2/run-ptest b/meta/recipes-extended/sed/sed-4.2.2/run-ptest
new file mode 100644
index 0000000..7c0f627
--- /dev/null
+++ b/meta/recipes-extended/sed/sed-4.2.2/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -C testsuite -k runtest-TESTS
diff --git a/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch b/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
new file mode 100644
index 0000000..105e8b7
--- /dev/null
+++ b/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
@@ -0,0 +1,66 @@
+sed: add ptest
+
+ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+
+And fix following error after add serial-tests.
+
+[snip]
+help2man: can't get `--help' info from ../sed/sed
+make[2]: *** [sed.1] Error 2
+[snip]
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ configure.ac          |    2 +-
+ doc/Makefile.am       |    2 +-
+ testsuite/Makefile.am |    6 ++++++
+ 3 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9d33ec9..4f0c532 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4,7 +4,7 @@ AC_CONFIG_AUX_DIR(build-aux)
+ AC_CONFIG_SRCDIR([sed/sed.c])
+ AM_CONFIG_HEADER(config.h:config_h.in)
+ AC_PREREQ(2.60)
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([serial-tests])
+ 
+ SED_FEATURE_VERSION=4.2.2
+ AC_DEFINE_UNQUOTED(SED_FEATURE_VERSION, "$SED_FEATURE_VERSION",
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index af6975c..6fd8c9a 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -25,7 +25,7 @@ $(srcdir)/s-texi: sed-in.texi $(srcdir)/groupify.sed
+ 	fi
+ 	echo stamp > $(srcdir)/s-texi
+ 
+-sed.1: $(top_srcdir)/sed/sed.c $(top_srcdir)/configure.ac $(srcdir)/sed.x
++_sed.1: $(top_srcdir)/sed/sed.c $(top_srcdir)/configure.ac $(srcdir)/sed.x
+ 	$(HELP2MAN) --name "stream editor for filtering and transforming text" \
+ 	  -p sed --include $(srcdir)/sed.x -o $(srcdir)/sed.1 $(SED) 
+ 
+diff --git a/testsuite/Makefile.am b/testsuite/Makefile.am
+index d80e72c..b05f01e 100644
+--- a/testsuite/Makefile.am
++++ b/testsuite/Makefile.am
+@@ -99,5 +99,11 @@ EXTRA_DIST = \
+ # automake makes `check' depend on $(TESTS).  Declare
+ # dummy targets for $(TESTS) so that make does not complain.
+ 
++install-ptest:
++	cd $(BUILDDIR); tar -cf - $(TESTDIR) --exclude *.o | ( cd $(DESTDIR) && tar -xf - )
++	for i in $(EXTRA_DIST) tst-regex2.c; do install $(srcdir)/$$i $(DESTDIR)/$(TESTDIR); done
++	sed -e 's/^Makefile:/_Makefile:/' -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/bash/sh/' -i $(DESTDIR)/$(TESTDIR)/Makefile
++	for i in `grep -rl "../sed/sed" $(DESTDIR)/$(TESTDIR)`; do sed -e 's/..\/sed\/sed/sed/' -i $$i; done
++
+ .PHONY: $(SEDTESTS)
+ $(SEDTESTS):
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index 47c8b5b..74ac16b 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -5,14 +5,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://sed/sed.h;beginline=1;endline=17;md5=767ab3a06d7584f6fd0469abaec4412f"
 SECTION = "console/utils"
 
-SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz \
+           file://sed-add-ptest.patch \
+           file://run-ptest \
+"
 
 SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
 SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
 
-inherit autotools texinfo update-alternatives gettext
+inherit autotools texinfo update-alternatives gettext ptest
+RDEPENDS_${PN}-ptest += "make locale-base-ru-ru"
 
-EXTRA_OECONF = "--disable-acl"
+EXTRA_OECONF = "--disable-acl \
+                ${@bb.utils.contains('PTEST_ENABLED', '1', '--enable-regex-tests', '', d)}"
 
 do_install () {
 	autotools_do_install
@@ -25,4 +30,14 @@ ALTERNATIVE_${PN} = "sed"
 ALTERNATIVE_LINK_NAME[sed] = "${base_bindir}/sed"
 ALTERNATIVE_PRIORITY = "100"
 
+TESTDIR = "testsuite"
+
+do_compile_ptest() {
+	oe_runmake -C ${TESTDIR} buildtest-TESTS
+}
+
+do_install_ptest() {
+	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
+}
+
 BBCLASSEXTEND = "native"
-- 
1.8.1.2


