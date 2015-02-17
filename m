Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5905C73555
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 05:48:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1H5mPGf026168
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Feb 2015 21:48:25 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Feb 2015 21:48:24 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 00:47:44 -0500
Message-ID: <1424152066-23546-2-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1424152066-23546-1-git-send-email-paul.gortmaker@windriver.com>
References: <1424152066-23546-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] coreutils: don't generate useless dummy stub manpages
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
X-List-Received-Date: Tue, 17 Feb 2015 05:48:24 -0000
Content-Type: text/plain

We had a couple patches to 1) deal with missing perl and 2) deal
with the perl-less "dummy" help2man fallout, but in the end, they
achieve no purpose whatsoever, since they just populate the doc
RPM with manpages like this one:

  NAME
       chmod - a GNU coreutils 8.22 program

  DESCRIPTION
       OOOPS!   Due to the lack of perl on the build system, we were
       unable to create a proper manual page for chmod.

As the above serves no purpose whatsoever, and since the concept
of running the binaries to capture the "--help" text output is
completely broken for cross compiles, lets just decouple man page
generation from the building of coreutils entirely so it paves the
way for importing pre-generated manpages.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 .../coreutils/coreutils-8.23/dummy_help2man.patch  | 22 ---------------
 .../coreutils-8.23/fix-for-dummy-man-usage.patch   | 31 ----------------------
 .../man-decouple-manpages-from-build.patch         | 27 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.23.bb      |  3 +--
 4 files changed, 28 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils-8.23/dummy_help2man.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils-8.23/fix-for-dummy-man-usage.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.23/man-decouple-manpages-from-build.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.23/dummy_help2man.patch b/meta/recipes-core/coreutils/coreutils-8.23/dummy_help2man.patch
deleted file mode 100644
index 4757f52aa0be..000000000000
--- a/meta/recipes-core/coreutils/coreutils-8.23/dummy_help2man.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd coreutils-8.21/man/local.mk coreutils-8.21/man/local.mk
---- coreutils-8.21/man/local.mk	2013-02-05 16:01:21.000000000 +0200
-+++ coreutils-8.21/man/local.mk	2013-03-23 09:12:53.360470192 +0200
-@@ -19,11 +19,11 @@
- EXTRA_DIST += man/help2man man/dummy-man
-
- ## Graceful degradation for systems lacking perl.
--if HAVE_PERL
--run_help2man = $(PERL) -- $(srcdir)/man/help2man
--else
-+#if HAVE_PERL
-+#run_help2man = $(PERL) -- $(srcdir)/man/help2man
-+#else
- run_help2man = $(SHELL) $(srcdir)/man/dummy-man
--endif
-+#endif
-
- man1_MANS = @man1_MANS@
- EXTRA_DIST += $(man1_MANS:.1=.x)
diff --git a/meta/recipes-core/coreutils/coreutils-8.23/fix-for-dummy-man-usage.patch b/meta/recipes-core/coreutils/coreutils-8.23/fix-for-dummy-man-usage.patch
deleted file mode 100644
index 58b6a7613038..000000000000
--- a/meta/recipes-core/coreutils/coreutils-8.23/fix-for-dummy-man-usage.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Pending
-
-coreutils: fix for dummy-man usage
-
-The options should be before the final argument, otherwise, the following error
-would appear when compiling.
-
-"dummy-man: too many non-option arguments"
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- man/local.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/man/local.mk b/man/local.mk
-index ba8fbf7..3833458 100644
---- a/man/local.mk
-+++ b/man/local.mk
-@@ -101,8 +101,8 @@ man/dynamic-deps.mk: Makefile
- 	  && $(run_help2man)						\
- 		     --source='$(PACKAGE_STRING)'			\
- 		     --include=$(srcdir)/man/$$name.x			\
--		     --output=$$t/$$name.1 $$t/$$argv			\
- 		     --info-page='coreutils \(aq'$$name' invocation\(aq' \
-+		     --output=$$t/$$name.1 $$t/$$argv			\
- 	  && sed \
- 	       -e 's|$*\.td/||g' \
- 	       -e '/For complete documentation/d' \
--- 
-1.9.1
-
diff --git a/meta/recipes-core/coreutils/coreutils-8.23/man-decouple-manpages-from-build.patch b/meta/recipes-core/coreutils/coreutils-8.23/man-decouple-manpages-from-build.patch
new file mode 100644
index 000000000000..3c896a11bf2d
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.23/man-decouple-manpages-from-build.patch
@@ -0,0 +1,27 @@
+From b4d258629f090066783c3b4c91b40f63b9d0a296 Mon Sep 17 00:00:00 2001
+From: Paul Gortmaker <paul.gortmaker@windriver.com>
+Date: Sun, 8 Feb 2015 16:51:57 -0500
+Subject: [PATCH] man: decouple manpages from build
+
+The use of "help2man" doesn't work at all for cross compile, in
+addition to the extra requirement of perl it adds.
+
+Just decouple the manpages from the build in order to pave the way for
+importing prebuilt manpages that can be used in a cross build situation.
+
+Upstream-Status: Inappropriate [upstream doesn't care about x-compile case.]
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index fb4af27..7576b2c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -214,5 +214,4 @@ AM_CPPFLAGS = -Ilib -I$(top_srcdir)/lib -Isrc -I$(top_srcdir)/src
+ include $(top_srcdir)/lib/local.mk
+ include $(top_srcdir)/src/local.mk
+ include $(top_srcdir)/doc/local.mk
+-include $(top_srcdir)/man/local.mk
+ include $(top_srcdir)/tests/local.mk
+-- 
+2.2.2
+
diff --git a/meta/recipes-core/coreutils/coreutils_8.23.bb b/meta/recipes-core/coreutils/coreutils_8.23.bb
index e9d6494708de..be68a310311a 100644
--- a/meta/recipes-core/coreutils/coreutils_8.23.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.23.bb
@@ -13,9 +13,8 @@ DEPENDS_class-native = ""
 inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
+           file://man-decouple-manpages-from-build.patch \
            file://remove-usr-local-lib-from-m4.patch \
-           file://dummy_help2man.patch \
-           file://fix-for-dummy-man-usage.patch \
            file://fix-selinux-flask.patch \
           "
 
-- 
2.2.1


