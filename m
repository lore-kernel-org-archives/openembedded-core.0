Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4A65D7F225
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 09:55:03 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b24so2484618wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 02:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fVgtcl7wwK13uY3UTLwJRlaHBTO6TAacamCAUnhasmQ=;
	b=ggHdHNcUIqwWY5NQ6/WiT5JjSsuU2QV00RvSr1MBaYb0omiS6mL27qbwGRnK5x4enb
	OWLiOHItaCLS0O6X6IuyU9q9DHkuQWj0T4EAobe3zQTO/hAk6+9vyl6gMabWCmnHKgkX
	UtdRG8MZc94i0+fLpvNawv+cKyYJI53nSoG8Iu2XHBXhBecF/q9CWnDkkIrqHvIR9G8M
	aDb6qxZ7lngnBWsqx7DKJxBxkzWNyjKKHRj36Fj5xnRnFAitwmJWcHsjd6sdRmUdOnfo
	Yeyd1et9PkM18ISYh/4NiWX8MKkMFYDqA73HEP58VgFDy9dHKd4B+kGuzmND+LmnPKXe
	ASHA==
X-Gm-Message-State: APjAAAWZArObNO1QUXpO4yDlRNgogV9bfEcXjCmUPrFAIPM/foFlClmO
	yYWG4usP4rNkfZM65UIEOFQH3Zql
X-Google-Smtp-Source: APXvYqy8mYRrwCOCH811LYvgaRNMnPTpNur/8qBG94UYZXJHrq20xuCqRk5cj7SKprY/TyC4xefU4g==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
	25mr2729765wmg.133.1569923703679; 
	Tue, 01 Oct 2019 02:55:03 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g185sm3070875wme.10.2019.10.01.02.55.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 02:55:02 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2019 10:54:52 +0100
Message-Id: <20191001095452.37335-5-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191001095452.37335-1-git@andred.net>
References: <20191001095452.37335-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 4/4] ruby: update to v2.6.4
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
X-List-Received-Date: Tue, 01 Oct 2019 09:55:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Most patches had to be refreshed

Note that we can now drop
    EXTRA_AUTORECONF += "--exclude=aclocal"
from the recipe, as ruby upstream now fully supports
runnning aclocal:
    https://github.com/ruby/ruby/pull/1793/commits/df9bf70cd2275a3ddc3108f392214fcc4a9b0859
    https://github.com/ruby/ruby/commit/ec43478f34de262ebdd2922c488e265344b489c3

Also note that 'created.rid' is not being installed
anymore since v2.6.0

While additional LICENSEs were added to the recipe,
they should always have been mentioned in this recipe,
i.e. the license checksum was updated only because:
    * URLs were updated
    * new imported components were mentioned (with no new licenses)
    * formatting was changed
    * dates were updated

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-devtools/ruby/ruby.inc           |  6 ++--
 ...x-cross-compilation-of-external-gems.patch | 34 +++++++++++++++++++
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 22 ++++++------
 ...k-finite-isinf-isnan-as-macros-firs.patch} | 30 ++++++++--------
 meta/recipes-devtools/ruby/ruby/extmk.patch   | 16 ---------
 .../ruby/{ruby_2.5.5.bb => ruby_2.6.4.bb}     | 14 ++------
 6 files changed, 68 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
 rename meta/recipes-devtools/ruby/ruby/{0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch => 0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch} (78%)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/extmk.patch
 rename meta/recipes-devtools/ruby/{ruby_2.5.5.bb => ruby_2.6.4.bb} (81%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index a98249afbd..c0ceb1c10b 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -6,12 +6,12 @@ It is simple, straight-forward, and extensible. \
 "
 HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
-LICENSE = "Ruby | BSD | GPLv2"
+LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPLv2 | ISC | MIT"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
     file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=23a79bb4c1a40f6cc9bcb6f4e7c39799 \
+    file://LEGAL;md5=4ac0b84d1f7f420bca282e1adefc7f99 \
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline libffi"
@@ -19,7 +19,7 @@ DEPENDS_class-native = "openssl-native libyaml-native readline-native zlib-nativ
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-           file://extmk.patch \
+           file://0001-extmk-fix-cross-compilation-of-external-gems.patch \
            file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
new file mode 100644
index 0000000000..2e3156880e
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -0,0 +1,34 @@
+From a6e12b25a54d112c899b70c89c0bec9c5e5ebf3c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Mon, 30 Sep 2019 16:57:01 +0100
+Subject: [PATCH 1/3] extmk: fix cross-compilation of external gems
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Note that I (André) didn't actually write this patch, I
+only updated it so that git-am works.
+
+Upstream-Status: Pending
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+---
+ ext/extmk.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/extmk.rb b/ext/extmk.rb
+index 1389dc4117..e4d923d7a7 100755
+--- a/ext/extmk.rb
++++ b/ext/extmk.rb
+@@ -413,8 +413,8 @@ def $mflags.defined?(var)
+ end
+ $ruby = [$ruby]
+ $ruby << "-I'$(topdir)'"
++$ruby << "-I'$(top_srcdir)/lib'"
+ unless CROSS_COMPILING
+-  $ruby << "-I'$(top_srcdir)/lib'"
+   $ruby << "-I'$(extout)/$(arch)'" << "-I'$(extout)/common'" if $extout
+   ENV["RUBYLIB"] = "-"
+ end
+-- 
+2.23.0.rc1
+
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 4cf579f427..5979d8bd73 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,25 +1,27 @@
-Upstream-Status: Pending
-
-From 306e95a9818d39d3349075aac9609e062b0f19ce Mon Sep 17 00:00:00 2001
+From 6d608326970b1613633d7715ebb7d628dfcd16ee Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
-Subject: [PATCH 2/2] Obey LDFLAGS for the link of libruby
+Subject: [PATCH 2/3] Obey LDFLAGS for the link of libruby
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-Status: Pending
 ---
  Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: ruby-2.5.0/Makefile.in
-===================================================================
---- ruby-2.5.0.orig/Makefile.in
-+++ ruby-2.5.0/Makefile.in
-@@ -77,7 +77,7 @@ LIBS = @LIBS@ $(EXTLIBS)
- MISSING = @LIBOBJS@ @ALLOCA@
+diff --git a/Makefile.in b/Makefile.in
+index fa1e19ef37..bbd07fa34b 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -109,7 +109,7 @@ MISSING = @LIBOBJS@ @ALLOCA@
  ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
+ DLDSHARED = @DLDSHARED@
 -DLDFLAGS = @LIBRUBY_DLDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
 +DLDFLAGS = @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
  SOLIBS = @SOLIBS@
  ENABLE_DEBUG_ENV = @ENABLE_DEBUG_ENV@
  MAINLIBS = @MAINLIBS@
+-- 
+2.23.0.rc1
+
diff --git a/meta/recipes-devtools/ruby/ruby/0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch b/meta/recipes-devtools/ruby/ruby/0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
similarity index 78%
rename from meta/recipes-devtools/ruby/ruby/0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
rename to meta/recipes-devtools/ruby/ruby/0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
index 4cc1fa027f..1a8cff3e8c 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
@@ -1,7 +1,7 @@
-From 3a8189530312e81d6c005c396565f985a47f3383 Mon Sep 17 00:00:00 2001
+From bd71b698bf733e6e93282cd2b1b93f51e1a33c7c Mon Sep 17 00:00:00 2001
 From: nobu <nobu@b2dd03c8-39d4-4d8f-98ff-823fe69b080e>
 Date: Fri, 8 Feb 2019 07:22:55 +0000
-Subject: [PATCH] configure.ac: check finite,isinf,isnan as macros first
+Subject: [PATCH 3/3] configure.ac: check finite,isinf,isnan as macros first
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -12,7 +12,6 @@ git-svn-id: svn+ssh://ci.ruby-lang.org/ruby/trunk@67036 b2dd03c8-39d4-4d8f-98ff-
 
 ---
 Upstream-Status: Backport [https://github.com/ruby/ruby/commit/74f94b3e6ebf15b76f3b357e754095412b006e94]
-(modified so as to apply cleanly here)
 Signed-off-by: André Draszik <andre.draszik@jci.com>
 ---
  aclocal.m4                    |  1 +
@@ -22,19 +21,22 @@ Signed-off-by: André Draszik <andre.draszik@jci.com>
  create mode 100644 tool/m4/ruby_replace_funcs.m4
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 18ba297b05..2a907b3467 100644
+index b0fe3eb959..ed7d14ef63 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -13,3 +13,4 @@
- 
- m4_ifndef([AC_CONFIG_MACRO_DIRS], [m4_defun([_AM_CONFIG_MACRO_DIRS], [])m4_defun([AC_CONFIG_MACRO_DIRS], [_AM_CONFIG_MACRO_DIRS($@)])])
- m4_include([acinclude.m4])
+@@ -35,6 +35,7 @@ m4_include([tool/m4/ruby_func_attribute.m4])
+ m4_include([tool/m4/ruby_mingw32.m4])
+ m4_include([tool/m4/ruby_prepend_option.m4])
+ m4_include([tool/m4/ruby_prog_gnu_ld.m4])
 +m4_include([tool/m4/ruby_replace_funcs.m4])
+ m4_include([tool/m4/ruby_replace_type.m4])
+ m4_include([tool/m4/ruby_rm_recursive.m4])
+ m4_include([tool/m4/ruby_setjmp_type.m4])
 diff --git a/configure.ac b/configure.ac
-index 8a7cee55b8..b97c5b3cc9 100644
+index 2c4d2888d2..2691da6a3c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1189,9 +1189,6 @@ main()
+@@ -946,9 +946,6 @@ main()
  		ac_cv_func_fsync=yes
  		ac_cv_func_seekdir=yes
  		ac_cv_func_telldir=yes
@@ -44,7 +46,7 @@ index 8a7cee55b8..b97c5b3cc9 100644
  		ac_cv_func_lchown=yes
  		ac_cv_func_link=yes
  		ac_cv_func_readlink=yes
-@@ -1239,9 +1236,6 @@ main()
+@@ -999,9 +996,6 @@ main()
  [netbsd*], [	LIBS="-lm $LIBS"
  		],
  [dragonfly*], [	LIBS="-lm $LIBS"
@@ -54,7 +56,7 @@ index 8a7cee55b8..b97c5b3cc9 100644
  		],
  [aix*],[	LIBS="-lm $LIBS"
  		ac_cv_func_round=no
-@@ -2213,11 +2207,8 @@ AC_REPLACE_FUNCS(dup2)
+@@ -1724,11 +1718,8 @@ AC_REPLACE_FUNCS(dup2)
  AC_REPLACE_FUNCS(erf)
  AC_REPLACE_FUNCS(explicit_bzero)
  AC_REPLACE_FUNCS(ffs)
@@ -65,8 +67,8 @@ index 8a7cee55b8..b97c5b3cc9 100644
 -AC_REPLACE_FUNCS(isnan)
  AC_REPLACE_FUNCS(lgamma_r)
  AC_REPLACE_FUNCS(memmove)
- AC_REPLACE_FUNCS(nextafter)
-@@ -2229,6 +2220,10 @@ AC_REPLACE_FUNCS(strlcpy)
+ AC_REPLACE_FUNCS(nan)
+@@ -1741,6 +1732,10 @@ AC_REPLACE_FUNCS(strlcpy)
  AC_REPLACE_FUNCS(strstr)
  AC_REPLACE_FUNCS(tgamma)
  
diff --git a/meta/recipes-devtools/ruby/ruby/extmk.patch b/meta/recipes-devtools/ruby/ruby/extmk.patch
deleted file mode 100644
index 404b9af7aa..0000000000
--- a/meta/recipes-devtools/ruby/ruby/extmk.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-diff -ru ruby-1.8.7-p248.orig/ext/extmk.rb ruby-1.8.7-p248/ext/extmk.rb
---- ruby-1.8.7-p248.orig/ext/extmk.rb	2009-12-24 03:01:58.000000000 -0600
-+++ ruby-1.8.7-p248/ext/extmk.rb	2010-02-12 15:55:27.370061558 -0600
-@@ -413,8 +413,8 @@ def $mflags.defined?(var)
- end
- $ruby = [$ruby]
- $ruby << "-I'$(topdir)'"
-+$ruby << "-I'$(top_srcdir)/lib'"
- unless CROSS_COMPILING
--  $ruby << "-I'$(top_srcdir)/lib'"
-   $ruby << "-I'$(extout)/$(arch)'" << "-I'$(extout)/common'" if $extout
-   ENV["RUBYLIB"] = "-"
- end
--- 
-
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devtools/ruby/ruby_2.6.4.bb
similarity index 81%
rename from meta/recipes-devtools/ruby/ruby_2.5.5.bb
rename to meta/recipes-devtools/ruby/ruby_2.6.4.bb
index 223b0371eb..4554487c0a 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.6.4.bb
@@ -1,12 +1,12 @@
 require ruby.inc
 
 SRC_URI += " \
-           file://0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch \
+           file://0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "7e156fb526b8f4bb1b30a3dd8a7ce400"
-SRC_URI[sha256sum] = "28a945fdf340e6ba04fc890b98648342e3cccfd6d223a48f3810572f11b2514c"
+SRC_URI[md5sum] = "49b628cdb21db967d8a3f6ca6e222583"
+SRC_URI[sha256sum] = "4fc1d8ba75505b3797020a6ffc85a8bcff6adc4dabae343b6572bf281ee17937"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
@@ -15,8 +15,6 @@ PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
 PACKAGECONFIG[gmp] = "--with-gmp=yes, --with-gmp=no, gmp"
 PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 
-EXTRA_AUTORECONF += "--exclude=aclocal"
-
 EXTRA_OECONF = "\
     --disable-versioned-paths \
     --disable-rpath \
@@ -42,12 +40,6 @@ do_install_append_class-target () {
            -e 's:${RECIPE_SYSROOT}::g' \
            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
         ${D}$rbconfig_rb
-
-    # Find out created.rid from .installed.list
-    created_rid=`grep created.rid ${B}/.installed.list`
-    # Remove build host directories
-    sed -i -e 's:${WORKDIR}::g' ${D}$created_rid
-
 }
 
 do_install_ptest () {
-- 
2.23.0.rc1


