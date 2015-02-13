Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAC8B7342A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8FciJ022777
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:38 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:27 -0800
Message-ID: <e94539a84d12272c0d7777584807be1d09bd3a57.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/12] slang: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:37 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../slang/slang/slang-makefile-fix-parallel.patch  |  177 ++++++++++++++++++++
 meta/recipes-extended/slang/slang_2.2.4.bb         |    2 +-
 2 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/slang/slang/slang-makefile-fix-parallel.patch

diff --git a/meta/recipes-extended/slang/slang/slang-makefile-fix-parallel.patch b/meta/recipes-extended/slang/slang/slang-makefile-fix-parallel.patch
new file mode 100644
index 0000000..3524061
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/slang-makefile-fix-parallel.patch
@@ -0,0 +1,177 @@
+From ba11ed50474cf00d38ad96f600e4f5fc0d42d924 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Jan 2015 22:55:17 -0800
+Subject: [PATCH] Makefile.in: fix for parallel build
+
+Fixed:
+* /bin/sh: 1: cd: can't cd to objs
+
+The $(OBJDIR) was in wrong place.
+
+* install: cannot stat `src/elfobjs/libslang.so.2.2.4': No such file or directory
+
+* install: target `/usr/share/slsh/rline/' is not a directory: No such file or directory
+
+Upstream-Status: Pending
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ modules/Makefile.in |   64 +++++++++++++++++++++++++--------------------------
+ slsh/Makefile.in    |   10 ++++----
+ src/Makefile.in     |    2 +-
+ 3 files changed, 38 insertions(+), 38 deletions(-)
+
+diff --git a/modules/Makefile.in b/modules/Makefile.in
+index 0384359..bd9e9a6 100644
+--- a/modules/Makefile.in
++++ b/modules/Makefile.in
+@@ -87,53 +87,53 @@ config.h: ../src/config.h
+ $(OBJDIR):
+ 	-$(MKINSDIR) $(OBJDIR)
+ #
+-slsmg-module.so: $(OBJDIR) $(OBJDIR)/slsmg-module.so
+-$(OBJDIR)/slsmg-module.so: slsmg-module.c config.h
++slsmg-module.so: $(OBJDIR)/slsmg-module.so
++$(OBJDIR)/slsmg-module.so: slsmg-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/slsmg-module.c -o slsmg-module.so $(LIBS)
+-rand-module.so: $(OBJDIR) $(OBJDIR)/rand-module.so
+-$(OBJDIR)/rand-module.so: rand-module.c config.h
++rand-module.so: $(OBJDIR)/rand-module.so
++$(OBJDIR)/rand-module.so: rand-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/rand-module.c -o rand-module.so $(LIBS)
+-newt-module.so: $(OBJDIR) $(OBJDIR)/newt-module.so
+-$(OBJDIR)/newt-module.so: newt-module.c config.h
++newt-module.so: $(OBJDIR)/newt-module.so
++$(OBJDIR)/newt-module.so: newt-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/newt-module.c -o newt-module.so -lnewt $(LIBS)
+-termios-module.so: $(OBJDIR) $(OBJDIR)/termios-module.so
+-$(OBJDIR)/termios-module.so: termios-module.c config.h
++termios-module.so: $(OBJDIR)/termios-module.so
++$(OBJDIR)/termios-module.so: termios-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/termios-module.c -o termios-module.so $(LIBS)
+-select-module.so: $(OBJDIR) $(OBJDIR)/select-module.so
+-$(OBJDIR)/select-module.so: select-module.c config.h
++select-module.so: $(OBJDIR)/select-module.so
++$(OBJDIR)/select-module.so: select-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/select-module.c -o select-module.so $(LIBS)
+-fcntl-module.so: $(OBJDIR) $(OBJDIR)/fcntl-module.so
+-$(OBJDIR)/fcntl-module.so: fcntl-module.c config.h
++fcntl-module.so: $(OBJDIR)/fcntl-module.so
++$(OBJDIR)/fcntl-module.so: fcntl-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/fcntl-module.c -o fcntl-module.so $(LIBS)
+-varray-module.so: $(OBJDIR) $(OBJDIR)/varray-module.so
+-$(OBJDIR)/varray-module.so: varray-module.c config.h
++varray-module.so: $(OBJDIR)/varray-module.so
++$(OBJDIR)/varray-module.so: varray-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/varray-module.c -o varray-module.so $(LIBS)
+-pcre-module.so: $(OBJDIR) $(OBJDIR)/pcre-module.so
+-$(OBJDIR)/pcre-module.so: pcre-module.c config.h
++pcre-module.so: $(OBJDIR)/pcre-module.so
++$(OBJDIR)/pcre-module.so: pcre-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(PCRE_INC) $(SRCDIR)/pcre-module.c -o pcre-module.so $(PCRE_LIB) $(LIBS)
+-onig-module.so: $(OBJDIR) $(OBJDIR)/onig-module.so
+-$(OBJDIR)/onig-module.so: onig-module.c config.h
++onig-module.so: $(OBJDIR)/onig-module.so
++$(OBJDIR)/onig-module.so: onig-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(ONIG_INC) $(SRCDIR)/onig-module.c -o onig-module.so $(ONIG_LIB) $(LIBS)
+-png-module.so: $(OBJDIR) $(OBJDIR)/png-module.so
+-$(OBJDIR)/png-module.so: png-module.c config.h
++png-module.so: $(OBJDIR)/png-module.so
++$(OBJDIR)/png-module.so: png-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(PNG_INC) $(SRCDIR)/png-module.c -o png-module.so $(PNG_LIB) $(LIBS)
+-socket-module.so: $(OBJDIR) $(OBJDIR)/socket-module.so
+-$(OBJDIR)/socket-module.so: socket-module.c config.h
++socket-module.so: $(OBJDIR)/socket-module.so
++$(OBJDIR)/socket-module.so: socket-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/socket-module.c -o socket-module.so $(SOCKET_LIBS) $(LIBS)
+-iconv-module.so: $(OBJDIR) $(OBJDIR)/iconv-module.so
+-$(OBJDIR)/iconv-module.so: iconv-module.c config.h
++iconv-module.so: $(OBJDIR)/iconv-module.so
++$(OBJDIR)/iconv-module.so: iconv-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(ICONV_INC) $(SRCDIR)/iconv-module.c -o iconv-module.so $(ICONV_LIB) $(LIBS)
+-zlib-module.so: $(OBJDIR) $(OBJDIR)/zlib-module.so
+-$(OBJDIR)/zlib-module.so: zlib-module.c config.h
++zlib-module.so: $(OBJDIR)/zlib-module.so
++$(OBJDIR)/zlib-module.so: zlib-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(ZLIB_INC) $(SRCDIR)/zlib-module.c -o zlib-module.so $(ZLIB_LIB) $(LIBS)
+-fork-module.so: $(OBJDIR) $(OBJDIR)/fork-module.so
+-$(OBJDIR)/fork-module.so: fork-module.c config.h
++fork-module.so: $(OBJDIR)/fork-module.so
++$(OBJDIR)/fork-module.so: fork-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/fork-module.c -o fork-module.so $(LIBS)
+-sysconf-module.so: $(OBJDIR) $(OBJDIR)/sysconf-module.so
+-$(OBJDIR)/sysconf-module.so: sysconf-module.c config.h
++sysconf-module.so: $(OBJDIR)/sysconf-module.so
++$(OBJDIR)/sysconf-module.so: sysconf-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/sysconf-module.c -o sysconf-module.so $(LIBS)
+-csv-module.so: $(OBJDIR) $(OBJDIR)/csv-module.so
+-$(OBJDIR)/csv-module.so: csv-module.c config.h
++csv-module.so: $(OBJDIR)/csv-module.so
++$(OBJDIR)/csv-module.so: csv-module.c config.h $(OBJDIR)
+ 	cd $(OBJDIR) && $(CC_SHARED) $(INCS) $(SRCDIR)/csv-module.c -o csv-module.so $(LIBS)
+ 
+ # Note that Windows/Cygwin modules need execute permissions
+diff --git a/slsh/Makefile.in b/slsh/Makefile.in
+index b71b9bc..0b0271c 100644
+--- a/slsh/Makefile.in
++++ b/slsh/Makefile.in
+@@ -99,7 +99,7 @@ install_directories:
+ 	$(MKINSDIR) $(DEST_SLSH_LOCALLIB_DIR)
+ 	$(MKINSDIR) $(DEST_SLSH_SCRIPT_DIR)
+ 	$(MKINSDIR) $(DEST_SLSH_DOC_DIR)/html
+-install_lib_files:
++install_lib_files: install_directories
+ 	@for X in lib/*.sl; \
+ 	do \
+ 		echo $(INSTALL_DATA) $$X $(DEST_SLSH_LIB_DIR); \
+@@ -108,7 +108,7 @@ install_lib_files:
+ 		  exit 1; \
+ 		fi; \
+ 	done
+-install_rline_files:
++install_rline_files: install_directories
+ 	@for X in lib/rline/*.sl lib/rline/slrline.rc; \
+ 	do \
+ 		echo $(INSTALL_DATA) $$X $(DEST_SLSH_LIB_DIR)/rline/; \
+@@ -117,7 +117,7 @@ install_rline_files:
+ 		  exit 1; \
+ 		fi; \
+ 	done
+-install_scripts:
++install_scripts: install_directories
+ 	@for X in $(SCRIPTS); \
+ 	do \
+ 		echo $(INSTALL) scripts/$$X $(DEST_SLSH_SCRIPT_DIR); \
+@@ -126,7 +126,7 @@ install_scripts:
+ 		  exit 1; \
+ 		fi; \
+ 	done
+-install_help:
++install_help: install_directories
+ 	@for X in lib/help/*.hlp; \
+ 	do \
+ 		echo $(INSTALL_DATA) $$X $(DEST_SLSH_HELP_DIR); \
+@@ -135,7 +135,7 @@ install_help:
+ 		  exit 1; \
+ 		fi; \
+ 	done
+-install_docs:
++install_docs: install_directories
+ 	@for X in doc/html/*.html; \
+ 	do \
+ 		echo $(INSTALL_DATA) $$X $(DEST_SLSH_DOC_DIR)/html/; \
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 03fa056..2c6cdbf 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -191,7 +191,7 @@ install-static: static install-headers install-docs $(DEST_LIBDIR)
+ 	@echo installing $(OBJDIR_NORMAL_LIB) in $(DEST_LIBDIR)/
+ 	$(INSTALL_DATA) $(OBJDIR_NORMAL_LIB) $(DEST_LIBDIR)/
+ 	$(RANLIB) $(DEST_LIBDIR)/$(NORMAL_LIB)
+-install-elf-and-links:
++install-elf-and-links: $(ELFDIR_ELF_LIB)
+ 	-$(RM) $(DEST_LIBDIR)/$(ELFLIB)
+ 	-$(RM) $(DEST_LIBDIR)/$(ELFLIB_MAJOR)
+ 	@echo installing $(ELFLIB_BUILD_NAME) in $(DEST_LIBDIR)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index ed1190a..aca3593 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
            file://change-char-type-to-signed-char-in-macros.patch \
            file://sprintf-bug-concerning-8-bit-characters.patch \
            file://slang-fix-the-iconv-existence-checking.patch \
+           file://slang-makefile-fix-parallel.patch \
           "
 
 inherit autotools-brokensep
@@ -48,4 +49,3 @@ do_install() {
 FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
 FILES_${PN}-dbg += "${libdir}/${BPN}/v2/modules/.debug"
 
-PARALLEL_MAKE = ""
-- 
1.7.9.5


