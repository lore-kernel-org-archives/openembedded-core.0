Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm04.jp.fujitsu.com (mgwkm04.jp.fujitsu.com [202.219.69.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF1C6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 08:14:07 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm04.jp.fujitsu.com with smtp
	id 1231_33a0_43fa8534_7c6f_459a_94f4_8671c4c7a73c;
	Fri, 02 Jun 2017 17:13:58 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 98F64AC00DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 17:13:58 +0900 (JST)
Received: from g01jpexchyt37.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	7EEA746E7A2 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 17:13:57 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt37.g01.fujitsu.local (10.128.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 2 Jun 2017 17:13:57 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Jun 2017 17:15:15 +0900
Message-ID: <1496391315-26446-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] sed: Upgrade 4.2.2 -> 4.4
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
X-List-Received-Date: Fri, 02 Jun 2017 08:14:09 -0000
Content-Type: text/plain

1. Upgrade sed from 4.2.2 to 4.4

2. Update the SRC_URI
   The format of archive file is changed from .tar.gz to .tar.xz

3. Rename the folder from sed-4.2.2 to sed
   No need to update the folder name when version upgrade

4. Delete unncessary patch file due to the applied file is not exist.
   sed-add-ptest.patch

5. Update licence checksum due to date change, not license change

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../sed/sed-4.2.2/sed-add-ptest.patch              | 66 ----------------------
 ...need_charset_alias-when-building-for-musl.patch |  0
 .../sed/{sed-4.2.2 => sed}/run-ptest               |  0
 .../sed/{sed_4.2.2.bb => sed_4.4.bb}               | 11 ++--
 4 files changed, 5 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
 rename meta/recipes-extended/sed/{sed-4.2.2 => sed}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-extended/sed/{sed-4.2.2 => sed}/run-ptest (100%)
 rename meta/recipes-extended/sed/{sed_4.2.2.bb => sed_4.4.bb} (76%)

diff --git a/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch b/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
deleted file mode 100644
index 0293900..0000000
--- a/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-sed: add ptest
-
-ptest needs buildtest-TESTS and runtest-TESTS targets.
-serial-tests is required to generate those targets.
-
-And fix following error after add serial-tests.
-
-[snip]
-help2man: can't get `--help' info from ../sed/sed
-make[2]: *** [sed.1] Error 2
-[snip]
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- configure.ac          |    2 +-
- doc/Makefile.am       |    2 +-
- testsuite/Makefile.am |    6 ++++++
- 3 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9d33ec9..4f0c532 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4,7 +4,7 @@ AC_CONFIG_AUX_DIR(build-aux)
- AC_CONFIG_SRCDIR([sed/sed.c])
- AM_CONFIG_HEADER(config.h:config_h.in)
- AC_PREREQ(2.60)
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([serial-tests])
- 
- SED_FEATURE_VERSION=4.2.2
- AC_DEFINE_UNQUOTED(SED_FEATURE_VERSION, "$SED_FEATURE_VERSION",
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index af6975c..6fd8c9a 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -25,7 +25,7 @@ $(srcdir)/s-texi: sed-in.texi $(srcdir)/groupify.sed
- 	fi
- 	echo stamp > $(srcdir)/s-texi
- 
--sed.1: $(top_srcdir)/sed/sed.c $(top_srcdir)/configure.ac $(srcdir)/sed.x
-+_sed.1: $(top_srcdir)/sed/sed.c $(top_srcdir)/configure.ac $(srcdir)/sed.x
- 	$(HELP2MAN) --name "stream editor for filtering and transforming text" \
- 	  -p sed --include $(srcdir)/sed.x -o $(srcdir)/sed.1 $(SED) 
- 
-diff --git a/testsuite/Makefile.am b/testsuite/Makefile.am
-index d80e72c..b05f01e 100644
---- a/testsuite/Makefile.am
-+++ b/testsuite/Makefile.am
-@@ -99,5 +99,11 @@ EXTRA_DIST = \
- # automake makes `check' depend on $(TESTS).  Declare
- # dummy targets for $(TESTS) so that make does not complain.
- 
-+install-ptest:
-+	cd $(BUILDDIR); tar -c --exclude=*.o $(TESTDIR) | ( cd $(DESTDIR) && tar -xf - )
-+	for i in $(EXTRA_DIST) tst-regex2.c; do install $(srcdir)/$$i $(DESTDIR)/$(TESTDIR); done
-+	sed -e 's/^Makefile:/_Makefile:/' -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/bash/sh/' -i $(DESTDIR)/$(TESTDIR)/Makefile
-+	for i in `grep -rl "../sed/sed" $(DESTDIR)/$(TESTDIR)`; do sed -e 's/..\/sed\/sed/sed/' -i $$i; done
-+
- .PHONY: $(SEDTESTS)
- $(SEDTESTS):
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/sed/sed/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-extended/sed/sed/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-extended/sed/sed-4.2.2/run-ptest b/meta/recipes-extended/sed/sed/run-ptest
similarity index 100%
rename from meta/recipes-extended/sed/sed-4.2.2/run-ptest
rename to meta/recipes-extended/sed/sed/run-ptest
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.4.bb
similarity index 76%
rename from meta/recipes-extended/sed/sed_4.2.2.bb
rename to meta/recipes-extended/sed/sed_4.4.bb
index 5aa7d8a..cb559e0 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.4.bb
@@ -1,18 +1,17 @@
 SUMMARY = "Stream EDitor (text filtering utility)"
 HOMEPAGE = "http://www.gnu.org/software/sed/"
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://sed/sed.h;beginline=1;endline=17;md5=767ab3a06d7584f6fd0469abaec4412f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://sed/sed.h;beginline=1;endline=17;md5=0664656da44a21fb9b468ddac4293029"
 SECTION = "console/utils"
 
-SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz \
-           file://sed-add-ptest.patch \
+SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.xz \
 	   file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
-SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
+SRC_URI[md5sum] = "e0c583d4c380059abd818cd540fe6938"
+SRC_URI[sha256sum] = "cbd6ebc5aaf080ed60d0162d7f6aeae58211a1ee9ba9bb25623daa6cd942683b"
 
 inherit autotools texinfo update-alternatives gettext ptest
 RDEPENDS_${PN}-ptest += "make ${PN}"
-- 
1.9.1


