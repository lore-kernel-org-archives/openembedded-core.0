Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOxBF-0002AN-MZ
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 21:22:16 +0200
Received: by pzk36 with SMTP id 36so3193663pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=wRUaNczP5lvoONnLWGVd45cQKAqoNrHGLY2Rr/1zBGI=;
	b=F2dMmSi5hXpCloAcfnbnJ92nOIx0rcmfU7+zd6gdR017L3DNRoXk7kL0YN1U0Rx74V
	OlW6J8EJOPED/bioHrMUA3ALIC5KW9g1ZQhgqS7JhjpssOIdOqJZJ9AZH+C4iE1BB5Dl
	VhBipr+yjT5TWtEGCz+LDJjAcsYdavaemQoXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Upxq0ky+r919lLncxZxBbgf4Gc3ytJqNOXDsRkt5gaQM31duCdmFI6DcCdjACrPK1E
	WBqmQlChw3h1VO9SSFk957YRuPX7jGRJwjKptA8rcOf8UlpcgznW14LzceuQ3QeLmGGy
	sqvyXeYq2DoI0wkGjzjRsnedBmPeZkbqUbPF8=
Received: by 10.68.37.72 with SMTP id w8mr2920014pbj.263.1306264742314;
	Tue, 24 May 2011 12:19:02 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 8sm5171308pbw.23.2011.05.24.12.19.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 12:19:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 May 2011 12:18:52 -0700
Message-Id: <be1050a4fddcd92e16d666b74670bb26523bb866.1306264437.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1306264437.git.raj.khem@gmail.com>
References: <cover.1306264437.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] elfutils_0.148.bb: Fix compilation on uclibc
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
X-List-Received-Date: Tue, 24 May 2011 19:22:17 -0000

Currently all components of elfutils dont compile with uclibc
but elfutils is one part which is needed by other recipes e.g.
gcc 4.5 to compile. we make adjustments so that when compiling
for uclibc targets it _only_ builds and packages libelf

use --enable-uclibc only when building for uclibc targets

The supporting patch is also needed for compiling with uclibc
to specify -lintl and -luargp on linker commandline

Add missing inherit on gettext

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils-0.148/uclibc-support.patch   |   91 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   15 +++-
 2 files changed, 103 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support.patch
new file mode 100644
index 0000000..3cf16ac
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support.patch
@@ -0,0 +1,91 @@
+on uclibc systems libintl and libuargp are separate from libc.
+so they need to be specified on commandline when we use proxy-libintl
+then libintl is a static archive so it should be listed last since
+elfutils does not respect disable-nls we need to link in libintl
+
+We add a new option --enable-uclibc which will be used to control
+the uclibc specific configurations during build.
+
+Signed-off-by: Khem Raj <raj.khem>
+
+Upstream-Status: Inappropriate [uclibc specific]
+
+Index: elfutils-0.148/configure.ac
+===================================================================
+--- elfutils-0.148.orig/configure.ac
++++ elfutils-0.148/configure.ac
+@@ -55,9 +55,16 @@ AS_IF([test "$use_locks" = yes], [AC_DEF
+ 
+ AH_TEMPLATE([USE_LOCKS], [Defined if libraries should be thread-safe.])
+ 
++AC_ARG_ENABLE([uclibc],
++AS_HELP_STRING([--enable-uclibc], [Use uclibc for system libraries]),
++use_uclibc=yes, use_uclibc=no)
++AM_CONDITIONAL(USE_UCLIBC, test "$use_uclibc" = yes)
++AS_IF([test "$use_uclibc" = yes], [AC_DEFINE(USE_UCLIBC)])
++
++AH_TEMPLATE([USE_UCLIBC], [Defined if uclibc libraries are used.])
++
+ dnl Add all the languages for which translations are available.
+ ALL_LINGUAS=
+-
+ AC_PROG_CC
+ AC_PROG_RANLIB
+ AC_PROG_YACC
+Index: elfutils-0.148/libelf/Makefile.am
+===================================================================
+--- elfutils-0.148.orig/libelf/Makefile.am
++++ elfutils-0.148/libelf/Makefile.am
+@@ -93,7 +93,12 @@ if !MUDFLAP
+ libelf_pic_a_SOURCES =
+ am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
+ 
++
+ libelf_so_LDLIBS =
++if USE_UCLIBC
++libelf_so_LDLIBS += -lintl -luargp
++endif
++
+ if USE_LOCKS
+ libelf_so_LDLIBS += -lpthread
+ endif
+Index: elfutils-0.148/libdw/Makefile.am
+===================================================================
+--- elfutils-0.148.orig/libdw/Makefile.am
++++ elfutils-0.148/libdw/Makefile.am
+@@ -98,6 +98,11 @@ if !MUDFLAP
+ libdw_pic_a_SOURCES =
+ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
+ 
++libdw_so_LDLIBS =
++if USE_UCLIBC
++libdw_so_LDLIBS += -lintl -luargp
++endif
++
+ libdw_so_SOURCES =
+ libdw.so: $(srcdir)/libdw.map libdw_pic.a \
+ 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a \
+@@ -108,7 +113,7 @@ libdw.so: $(srcdir)/libdw.map libdw_pic.
+ 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
+ 		-Wl,--version-script,$<,--no-undefined \
+ 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
+-		-ldl $(zip_LIBS)
++		-ldl $(zip_LIBS) $(libdw_so_LDLIBS)
+ 	if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+ 	ln -fs $@ $@.$(VERSION)
+ 
+Index: elfutils-0.148/libcpu/Makefile.am
+===================================================================
+--- elfutils-0.148.orig/libcpu/Makefile.am
++++ elfutils-0.148/libcpu/Makefile.am
+@@ -63,6 +63,10 @@ i386_parse_CFLAGS = -DNMNES="`wc -l < i3
+ i386_lex.o: i386_parse.h
+ i386_gendis_LDADD = $(libeu) -lm $(libmudflap)
+ 
++if USE_UCLIBC
++i386_gendis_LDADD += -luargp -lintl
++endif
++
+ i386_parse.h: i386_parse.c ;
+ 
+ noinst_HEADERS = memory-access.h i386_parse.h i386_data.h
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index df933f6..115ff9b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -30,6 +30,9 @@ SRC_URI += "\
 	file://remove-unused.patch \
 	file://mempcpy.patch \
 "
+# Only apply when building uclibc based target recipe
+SRC_URI_append_libc-uclibc = " ${@['', 'file://uclibc-support.patch']['${PN}' == '${BPN}']}"
+
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
 # along with the do_configure_prepend()
@@ -38,9 +41,10 @@ SRC_URI += "\
         file://i386_dis.h \
         file://x86_64_dis.h \
 "
-inherit autotools
+inherit autotools gettext
 
 EXTRA_OECONF = "--program-prefix=eu-"
+EXTRA_OECONF_append_libc-uclibc = " ${@['', '--enable-uclibc']['${PN}' == '${BPN}']}"
 
 do_configure_prepend() {
 	sed -i 's:./i386_gendis:echo\ \#:g' ${S}/libcpu/Makefile.am
@@ -48,8 +52,13 @@ do_configure_prepend() {
 	cp ${WORKDIR}/*dis.h ${S}/libcpu
 }
 
-# Only append ldflags for target recipe
-TARGET_LDFLAGS_libc-uclibc += "${@['', '-lintl -luargp']['${PN}' == '${BPN}']}"
+# we can not build complete elfutils when using uclibc
+# but some recipes e.g. gcc 4.5 depends on libelf so we
+# build only libelf for uclibc case
+
+EXTRA_OEMAKE_libc-uclibc = "-C libelf"
+EXTRA_OEMAKE_virtclass-native = ""
+EXTRA_OEMAKE_virtclass-nativesdk = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.4.1



