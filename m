Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id B49D765D22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 14:51:35 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 26 Apr 2014 16:51:29 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 65AA428C882;
	Sat, 26 Apr 2014 16:51:29 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Apr 2014 16:51:25 +0200
Message-ID: <1398523885-16845-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] ltp: update version to 20140422
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
X-List-Received-Date: Sat, 26 Apr 2014 14:51:39 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Update ltp version to 20140422
Removed two patches that already exist in the current version:
1. regen-makefile.patch
2. ffsb-remove-hardcoded-configure.patch

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../ltp/ltp/ffsb-remove-hardcoded-configure.patch  |   15 -------------
 meta/recipes-extended/ltp/ltp/regen-makefile.patch |   22 --------------------
 .../ltp/{ltp_20140115.bb => ltp_20140422.bb}       |    6 ++----
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/regen-makefile.patch
 rename meta/recipes-extended/ltp/{ltp_20140115.bb => ltp_20140422.bb} (96%)

diff --git a/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch b/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
deleted file mode 100644
index 9f02711..0000000
--- a/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Get rid of the hardcoded configure call preventing cross-compilation
-
-Upstream-Status: Pending
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
-
---- a/utils/Makefile
-+++ b/utils/Makefile
-@@ -29,7 +29,6 @@ FILTER_OUT_DIRS		:= $(FFSBDIR)
- FFSB			:= $(FFSBDIR)/ffsb
- 
- $(FFSB): $(FFSBDIR)
--	cd $^; ./configure
- 	$(MAKE) -C $^ -f "$(abs_srcdir)/$^/Makefile" all
- 	cp $(FFSBDIR)/ffsb ffsb
- 
diff --git a/meta/recipes-extended/ltp/ltp/regen-makefile.patch b/meta/recipes-extended/ltp/ltp/regen-makefile.patch
deleted file mode 100644
index 3e114a1..0000000
--- a/meta/recipes-extended/ltp/ltp/regen-makefile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix the dependencies for linux_syscall_numbers.h where in a parallel build it was
-finding the temporary file linux_syscall_numbers.h.[pid].sh (where sh is an
-architecture name).  Instead don't wildcard *.sh as the only .sh we care about
-here is regen.sh, so hard-code that.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/testcases/kernel/include/Makefile b/testcases/kernel/include/Makefile
-index db21a2a..585eb5e 100644
---- a/testcases/kernel/include/Makefile
-+++ b/testcases/kernel/include/Makefile
-@@ -28,7 +28,7 @@ INSTALL_DIR		:= $(includedir)
- 
- MAKE_TARGETS		:= linux_syscall_numbers.h
- 
--linux_syscall_numbers.h: $(wildcard $(abs_srcdir)/*.sh $(abs_srcdir)/*.in)
--	$(SHELL) "$(abs_srcdir)/regen.sh"
-+linux_syscall_numbers.h: $(abs_srcdir)/regen.sh $(wildcard $(abs_srcdir)/*.in)
-+	$(SHELL) "$<"
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
similarity index 96%
rename from meta/recipes-extended/ltp/ltp_20140115.bb
rename to meta/recipes-extended/ltp/ltp_20140422.bb
index c2ee9fb..bad9e6f 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -20,12 +20,10 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "attr libaio libcap acl openssl"
-SRCREV = "c8b3e28097e7d3208df9daceaf92c25eae87ebf0"
+SRCREV = "f4c3bfe1eab51eb72caeb0f3336d2790c9a8bd1b"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
-    file://regen-makefile.patch \
-    file://ffsb-remove-hardcoded-configure.patch \
     file://ltp-Do-not-link-against-libfl.patch \
 "
 
@@ -46,7 +44,7 @@ do_configure_append() {
 
 # The makefiles make excessive use of make -C and several include testcases.mk
 # which triggers a build of the syscall header. To reproduce, build ltp,
-# then delete the header, then "make -j XX" and watch regen.sh run multiple 
+# then delete the header, then "make -j XX" and watch regen.sh run multiple
 # times. Its easier to generate this once here instead.
 do_compile_prepend () {
 	( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
-- 
1.7.10.4


