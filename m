Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 21A1F77046
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 23:46:14 +0000 (UTC)
Received: by qgev79 with SMTP id v79so16860797qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 16:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gQ7xroVO7dLZUnl62olinanIf11KyTMqJh5PWUgK2yM=;
	b=DPlfv3qYq7rD5FODxeZati0jYpgfQhMK1+5YYSzpoytYW338SUzTJlTkHbOv0LklQ+
	9891/bRoMlzsh8qI2viLn9gNE3vjc0X8uoSv3RoBURDI9P7dLST7kgbtu/57PRH+o0ZS
	HuE1SROyz4DP+lKC87bg/qU1TVYI8c+03KJZv9xnLlMvu1Eb2rNeAWKsbk2TL+MKqV6+
	VKC3AxxzLODxg+9o+NppgqFrP9bFOsVQa9aM4xFZkNqE+NerJSM24WIDL619zf0bA/qy
	QyBSp2+AKYQDFbnMAetQcF9EoyaFNy0MFTgPC+t79CNlS9fL/5/MMbU5bWASTAZ1y3AO
	GzpA==
X-Received: by 10.140.134.196 with SMTP id 187mr64731972qhg.24.1441237574922; 
	Wed, 02 Sep 2015 16:46:14 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	s64sm13788127qgs.33.2015.09.02.16.46.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 16:46:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 23:46:09 +0000
Message-Id: <6a9c6aab1cce75c3ca4d09f0217115eafebdd15e.1441237371.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <cover.1441237371.git.raj.khem@gmail.com>
References: <cover.1441237371.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] binutils: Fix symbols with --dynamic-list when using gold linker
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
X-List-Received-Date: Wed, 02 Sep 2015 23:46:15 -0000

There are random crashes and hangups, seen in libQtCore (QT4) as mentioned
in the binutils bugs as well, the reason is that
gold ignores all other symbols except specified in --dynamic-list which
is different in behavior as compared to bfd linker. The patch is a
backport from upstream master. This patch implements the bfd linker's
behaviour into gold.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.25.1.inc |   1 +
 ...-list-so-that-symbols-not-in-the-list-are.patch | 131 +++++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
index ef85fd4..120db87 100644
--- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
@@ -32,6 +32,7 @@ SRC_URI = "\
      file://0012-Add-XLP-instructions-support.patch \
      file://0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch \
      file://0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch \
+     file://0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch \
      file://binutils-octeon3.patch \
      "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch b/meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch
new file mode 100644
index 0000000..ee49c38
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch
@@ -0,0 +1,131 @@
+From e9c1bdad269c0c3352eebcc9481ed65144001b0b Mon Sep 17 00:00:00 2001
+From: Cary Coutant <ccoutant@google.com>
+Date: Mon, 16 Feb 2015 22:15:12 -0800
+Subject: [PATCH] Fix --dynamic-list so that symbols not in the list are still
+ exported.
+
+In PR 13577, the complaint was that -Bsymbolic was overriding the binding
+behavior for symbols listed in the --dynamic-list by setting the DT_SYMBOLIC
+tag in the dynamic table. In reading the Gnu ld manual, I decided that
+--dynamic-list should be mutually exclusive of -Bsymbolic, and modified
+gold so that --dynamic-list would treat symbols listed as preemptible,
+and all other symbols as internally bound. I was wrong.
+
+PR 16992 shows that with --dynamic-list (and not -Bsymbolic), a symbol
+not listed in the dynamic list is being internally bound within the
+shared library, but because it's still in the dynamic symbol table, we
+expose it to a COPY relocation, and things go really bad from there.
+
+(I can reproduce the same failure, simply by turning on -Bsymbolic-functions
+with the Gnu linker. Even though the symbol is bound internally, it's
+still exported to the dynamic symbol table, and is exposed to a COPY
+relocation.)
+
+I've backed out part of the fix for PR 13577, and -Bsymbolic (or
+-Bsymbolic-functions) can now be used with --dynamic-list, but if the
+two are used together, we do not set DT_SYMBOLIC or DF_SYMBOLIC
+(this matches Gnu ld behavior). We now treat symbols listed in the
+dynamic list as premptible, but we do not automatically treat symbols
+not listed there as non-premptible.
+
+gold/
+	PR gold/13577
+	PR gold/16992
+	* layout.cc (Layout::finish_dynamic_section): Don't set DT_SYMBOLIC or
+	DF_SYMBOLIC if --dynamic-list option is used.
+	* options.cc (General_options::finalize): --dynamic-list is not
+	mutually exclusive with -Bsymbolic.
+	* symtab.h (Symbol::is_preemptible): Don't exclude dynamic symbols not
+	listed in --dynamic-list.
+	* testsuite/Makefile.am (dynamic_list_lib2.so): Add
+	-Bsymbolic-functions.
+	* testsuite/Makefile.in: Regenerate.
+---
+Upstream-Status: Backport
+
+ gold/ChangeLog             | 14 ++++++++++++++
+ gold/layout.cc             |  3 ++-
+ gold/options.cc            |  7 -------
+ gold/symtab.h              |  6 ++----
+ gold/testsuite/Makefile.am |  2 +-
+ gold/testsuite/Makefile.in |  2 +-
+ 6 files changed, 20 insertions(+), 14 deletions(-)
+
+diff --git a/gold/layout.cc b/gold/layout.cc
+index bcdaac8..7836640 100644
+--- a/gold/layout.cc
++++ b/gold/layout.cc
+@@ -4873,7 +4873,8 @@ Layout::finish_dynamic_section(const Input_objects* input_objects,
+     flags |= elfcpp::DF_STATIC_TLS;
+   if (parameters->options().origin())
+     flags |= elfcpp::DF_ORIGIN;
+-  if (parameters->options().Bsymbolic())
++  if (parameters->options().Bsymbolic()
++      && !parameters->options().have_dynamic_list())
+     {
+       flags |= elfcpp::DF_SYMBOLIC;
+       // Add DT_SYMBOLIC for compatibility with older loaders.
+diff --git a/gold/options.cc b/gold/options.cc
+index 7eb8f27..7f1f69e 100644
+--- a/gold/options.cc
++++ b/gold/options.cc
+@@ -1200,13 +1200,6 @@ General_options::finalize()
+   // in the path, as appropriate.
+   this->add_sysroot();
+ 
+-  // --dynamic-list overrides -Bsymbolic and -Bsymbolic-functions.
+-  if (this->have_dynamic_list())
+-    {
+-      this->set_Bsymbolic(false);
+-      this->set_Bsymbolic_functions(false);
+-    }
+-
+   // Now that we've normalized the options, check for contradictory ones.
+   if (this->shared() && this->is_static())
+     gold_fatal(_("-shared and -static are incompatible"));
+diff --git a/gold/symtab.h b/gold/symtab.h
+index aa0cb68..9413360 100644
+--- a/gold/symtab.h
++++ b/gold/symtab.h
+@@ -604,10 +604,8 @@ class Symbol
+     if (parameters->options().in_dynamic_list(this->name()))
+       return true;
+ 
+-    // If the user used -Bsymbolic or provided a --dynamic-list script,
+-    // then nothing (else) is preemptible.
+-    if (parameters->options().Bsymbolic()
+-        || parameters->options().have_dynamic_list())
++    // If the user used -Bsymbolic, then nothing (else) is preemptible.
++    if (parameters->options().Bsymbolic())
+       return false;
+ 
+     // If the user used -Bsymbolic-functions, then functions are not
+diff --git a/gold/testsuite/Makefile.am b/gold/testsuite/Makefile.am
+index f767c21..7b73f9d 100644
+--- a/gold/testsuite/Makefile.am
++++ b/gold/testsuite/Makefile.am
+@@ -1518,7 +1518,7 @@ dynamic_list_lib1.o: dynamic_list_lib1.cc
+ 	$(CXXCOMPILE) -c -fpic -o $@ $<
+ 
+ dynamic_list_lib2.so: gcctestdir/ld dynamic_list_lib2.o $(srcdir)/dynamic_list_2.t
+-	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--dynamic-list,$(srcdir)/dynamic_list_2.t dynamic_list_lib2.o
++	$(CXXLINK) -Bgcctestdir/ -shared -Wl,-Bsymbolic-functions -Wl,--dynamic-list,$(srcdir)/dynamic_list_2.t dynamic_list_lib2.o
+ dynamic_list_lib2.o: dynamic_list_lib2.cc
+ 	$(CXXCOMPILE) -c -fpic -o $@ $<
+ 
+diff --git a/gold/testsuite/Makefile.in b/gold/testsuite/Makefile.in
+index 217e472..b4ae3fd 100644
+--- a/gold/testsuite/Makefile.in
++++ b/gold/testsuite/Makefile.in
+@@ -5319,7 +5319,7 @@ uninstall-am:
+ @GCC_TRUE@@NATIVE_LINKER_TRUE@	$(CXXCOMPILE) -c -fpic -o $@ $<
+ 
+ @GCC_TRUE@@NATIVE_LINKER_TRUE@dynamic_list_lib2.so: gcctestdir/ld dynamic_list_lib2.o $(srcdir)/dynamic_list_2.t
+-@GCC_TRUE@@NATIVE_LINKER_TRUE@	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--dynamic-list,$(srcdir)/dynamic_list_2.t dynamic_list_lib2.o
++@GCC_TRUE@@NATIVE_LINKER_TRUE@	$(CXXLINK) -Bgcctestdir/ -shared -Wl,-Bsymbolic-functions -Wl,--dynamic-list,$(srcdir)/dynamic_list_2.t dynamic_list_lib2.o
+ @GCC_TRUE@@NATIVE_LINKER_TRUE@dynamic_list_lib2.o: dynamic_list_lib2.cc
+ @GCC_TRUE@@NATIVE_LINKER_TRUE@	$(CXXCOMPILE) -c -fpic -o $@ $<
+ 
+-- 
+1.9.1
+
-- 
2.5.1


