Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1SkCk7-0003Ab-Qw
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 13:18:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5S8Ekrr000881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 01:14:46 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 28 Jun 2012 01:14:45 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2012 16:14:39 +0800
Message-ID: <1340871279-23335-2-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <1340871279-23335-1-git-send-email-jackie.huang@windriver.com>
References: <1340871279-23335-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] ruby: Add ruby 1.9.3 recipe
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
X-List-Received-Date: Thu, 28 Jun 2012 11:18:36 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Took ruby 1.8.7 from OE and updated to 1.9.3-p194.
Most of the 1.9.3 patches originate from ruby-1.9.3.194-10.1.fc17.src.rpm

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/ruby/ruby.inc                |   32 ++
 meta/recipes-devtools/ruby/ruby/extmk.patch        |   13 +
 meta/recipes-devtools/ruby/ruby/extmk_run.patch    |   15 +
 ...onf-hardcode-wide-getaddr-info-test-outco.patch |   26 ++
 .../ruby/ruby/ruby-1.9.3-always-use-i386.patch     |   11 +
 .../ruby/ruby/ruby-1.9.3-bignum-test-fix.patch     |   31 ++
 .../ruby/ruby-1.9.3-custom-rubygems-location.patch |   86 ++++++
 .../ruby/ruby-1.9.3-disable-versioned-paths.patch  |  149 ++++++++++
 .../ruby/ruby/ruby-1.9.3-fix-s390x-build.patch     |   12 +
 .../ruby/ruby/ruby-1.9.3-install-cross.patch       |   16 +
 .../ruby/ruby/ruby-1.9.3-mkmf-verbose.patch        |   11 +
 .../ruby-1.9.3-rubygems-1.8.11-uninstaller.patch   |   76 +++++
 .../ruby/ruby/ruby-1.9.3-webrick-test-fix.patch    |   24 ++
 .../ruby/rubygems-1.8.11-binary-extensions.patch   |  296 ++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_1.9.3-p194.bb      |   57 ++++
 15 files changed, 855 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby.inc
 create mode 100644 meta/recipes-devtools/ruby/ruby/extmk.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/extmk_run.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby_1.9.3-p194.bb

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
new file mode 100644
index 0000000..489b6c1
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -0,0 +1,32 @@
+DESCRIPTION = "Ruby is an interpreted scripting language \
+for quick and easy object-oriented programming."
+SECTION = "devel/ruby"
+PRIORITY = "optional"
+LICENSE = "Ruby | BSD | GPLv2"
+DEPENDS = "ruby-native zlib openssl"
+DEPENDS_virtclass-native = ""
+
+INC_PR = "r2"
+
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SRC_URI = "ftp://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
+           file://extmk_run.patch \
+           file://extmk.patch \
+"
+
+S = "${WORKDIR}/ruby-${PV}"
+
+inherit autotools
+
+
+# This snippet lets compiled extensions which rely on external libraries,
+# such as zlib, compile properly.  If we don't do this, then when extmk.rb
+# runs, it uses the native libraries instead of the target libraries, and so
+# none of the linking operations succeed -- which makes extconf.rb think
+# that the libraries aren't available and hence that the extension can't be
+# built.
+
+do_configure_prepend() {
+	sed -i "s#%%TARGET_CFLAGS%%#$TARGET_CFLAGS#; s#%%TARGET_LDFLAGS%%#$TARGET_LDFLAGS#" ${S}/common.mk
+	rm -rf ${S}/ruby/
+}
diff --git a/meta/recipes-devtools/ruby/ruby/extmk.patch b/meta/recipes-devtools/ruby/ruby/extmk.patch
new file mode 100644
index 0000000..8b68450
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/extmk.patch
@@ -0,0 +1,13 @@
+diff -ru ruby-1.8.7-p248.orig/ext/extmk.rb ruby-1.8.7-p248/ext/extmk.rb
+--- ruby-1.8.7-p248.orig/ext/extmk.rb	2009-12-24 03:01:58.000000000 -0600
++++ ruby-1.8.7-p248/ext/extmk.rb	2010-02-12 15:55:27.370061558 -0600
+@@ -354,8 +354,8 @@
+   $ruby = '$(topdir)/miniruby' + EXEEXT
+ end
+ $ruby << " -I'$(topdir)'"
++$ruby << " -I'$(top_srcdir)/lib'"
+ unless CROSS_COMPILING
+-  $ruby << " -I'$(top_srcdir)/lib'"
+   $ruby << " -I'$(extout)/$(arch)' -I'$(extout)/common'" if $extout
+   $ruby << " -I./- -I'$(top_srcdir)/ext' -rpurelib.rb"
+   ENV["RUBYLIB"] = "-"
diff --git a/meta/recipes-devtools/ruby/ruby/extmk_run.patch b/meta/recipes-devtools/ruby/ruby/extmk_run.patch
new file mode 100644
index 0000000..57926f5
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/extmk_run.patch
@@ -0,0 +1,15 @@
+============================================================
+--- packages/ruby/ruby-1.8.5/extmk_run.patch	d9738b5a71e2f9a98d009af9fd0ef1ceaff9ef48
++++ packages/ruby/ruby-1.8.5/extmk_run.patch	d9738b5a71e2f9a98d009af9fd0ef1ceaff9ef48
+@@ -0,0 +1,11 @@
++--- ruby-1.8.5/common.mk.orig	2006-12-30 13:07:32.000000000 +1100
+++++ ruby-1.8.5/common.mk	2006-12-30 13:08:32.000000000 +1100
++@@ -56,7 +56,7 @@
++ 		--make="$(MAKE)" \
++ 		--mflags="$(MFLAGS)" \
++ 		--make-flags="$(MAKEFLAGS)"
++-EXTMK_ARGS    =	$(SCRIPT_ARGS) --extout="$(EXTOUT)" --extension $(EXTS) --extstatic $(EXTSTATIC) --
+++EXTMK_ARGS    =	$(SCRIPT_ARGS) --with-ldflags="%%TARGET_LDFLAGS%%" --with-cflags="%%TARGET_CFLAGS%%" --extout="$(EXTOUT)" --extension $(EXTS) --extstatic $(EXTSTATIC) --
++ 
++ all: $(MKFILES) $(PREP) $(RBCONFIG) $(LIBRUBY)
++ 	@$(MINIRUBY) $(srcdir)/ext/extmk.rb $(EXTMK_ARGS)
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
new file mode 100644
index 0000000..712602a
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
@@ -0,0 +1,26 @@
+From 9341293e71c03fe606edc9157bf1e13e3dd5b507 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 17 Dec 2010 11:35:38 +0100
+Subject: [PATCH] socket extconf: hardcode wide-getaddr info test outcome to true
+
+Without this the socket extension doesn't build correctly
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ ext/socket/extconf.rb |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+--- a/ext/socket/extconf.rb
++++ b/ext/socket/extconf.rb
+@@ -356,6 +356,11 @@
+   exit(EXIT_FAILURE);
+ }
+ EOF
++
++# Ignore the actual result of the above test and assume that
++# everything is OK.
++getaddr_info_ok = true
++
+ if ipv6 and not getaddr_info_ok
+   abort <<EOS
+ 
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
new file mode 100644
index 0000000..f5a8c3d
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
@@ -0,0 +1,11 @@
+--- a/configure.in.orig	2011-10-18 08:56:21.587594685 +0200
++++ b/configure.in	2011-10-18 08:56:59.751593321 +0200
+@@ -2935,6 +2935,8 @@
+ configure_args=$ac_configure_args
+ AC_SUBST(configure_args)dnl
+ 
++target_cpu=`echo $target_cpu | sed s/i.86/i386/`
++
+ if test "${universal_binary-no}" = yes ; then
+     arch="universal-${target_os}"
+     AC_CACHE_CHECK(whether __ARCHITECTURE__ is available, rb_cv_architecture_available,
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch
new file mode 100644
index 0000000..cb3682d
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch
@@ -0,0 +1,31 @@
+--- ruby-1.9.3-p0/test/ruby/test_bignum.rb.orig	2011-11-10 09:52:59.101925465 +0100
++++ ruby-1.9.3-p0/test/ruby/test_bignum.rb	2011-11-10 09:54:14.580798826 +0100
+@@ -378,7 +378,7 @@
+     assert_equal(true, (2**32).even?)
+   end
+ 
+-  def interrupt
++  def assert_interrupt
+     time = Time.now
+     start_flag = false
+     end_flag = false
+@@ -387,14 +387,16 @@
+       yield
+       end_flag = true
+     end
+-    sleep 1
++    Thread.pass until start_flag
+     thread.raise
+     thread.join rescue nil
+-    start_flag && !end_flag && Time.now - time < 10
++    time = Time.now - time
++    assert_equal([true, false], [start_flag, end_flag])
++    assert_operator(time, :<, 10)
+   end
+ 
+   def test_interrupt
+-    assert(interrupt { (65536 ** 65536).to_s })
++    assert_interrupt {(65536 ** 65536).to_s}
+   end
+ 
+   def test_too_big_to_s
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
new file mode 100644
index 0000000..e11febc
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
@@ -0,0 +1,86 @@
+From 279a693ce4ef3a887ce8d4fa59e0f2616a14d91a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
+Date: Fri, 11 Nov 2011 13:14:45 +0100
+Subject: [PATCH] Allow to install RubyGems into custom location, outside of
+ Ruby tree.
+
+---
+ configure.in      |    8 ++++++++
+ tool/mkconfig.rb  |    1 +
+ tool/rbinstall.rb |    9 +++++++++
+ version.c         |    4 ++++
+ 4 files changed, 22 insertions(+)
+
+--- a/configure.in
++++ b/configure.in
+@@ -2801,6 +2801,13 @@
+     dir="${VENDOR_DIR}"
+ done
+ 
++AC_ARG_WITH(rubygemsdir,
++           AS_HELP_STRING([--with-rubygemsdir=DIR], [custom rubygems directory]),
++            [rubygemsdir=$withval])
++if test "$rubygemsdir" != ""; then
++    AC_DEFINE_UNQUOTED(RUBYGEMS_DIR,"$rubygemsdir")
++fi
++
+ if test "${LOAD_RELATIVE+set}"; then
+     AC_DEFINE_UNQUOTED(LOAD_RELATIVE, $LOAD_RELATIVE)
+     RUBY_EXEC_PREFIX=""
+@@ -2921,6 +2928,7 @@
+ AC_SUBST(rubyhdrdir)dnl
+ AC_SUBST(sitehdrdir)dnl
+ AC_SUBST(vendorhdrdir)dnl
++AC_SUBST(rubygemsdir)dnl
+ 
+ AC_ARG_WITH(opt-dir,
+ 	AS_HELP_STRING([--with-opt-dir=DIR], [add optional headers and libraries DIR]))
+--- a/tool/mkconfig.rb
++++ b/tool/mkconfig.rb
+@@ -78,6 +78,7 @@
+     when /^RUBY_SO_NAME$/; next if $so_name
+     when /^arch$/; if val.empty? then val = arch else arch = val end
+     when /^sitearch/; val = '$(arch)' if val.empty?
++    when /^rubygemsdir/; next if val.empty?
+     end
+     case val
+     when /^\$\(ac_\w+\)$/; next
+--- a/tool/rbinstall.rb
++++ b/tool/rbinstall.rb
+@@ -300,6 +300,7 @@
+ sitearchlibdir = CONFIG["sitearchdir"]
+ vendorlibdir = CONFIG["vendorlibdir"]
+ vendorarchlibdir = CONFIG["vendorarchdir"]
++rubygemsdir = CONFIG["rubygemsdir"]
+ mandir = CONFIG["mandir"]
+ capidir = CONFIG["docdir"]
+ configure_args = Shellwords.shellwords(CONFIG["configure_args"])
+@@ -487,7 +488,15 @@
+ install?(:local, :comm, :lib) do
+   prepare "library scripts", rubylibdir
+   noinst = %w[README* *.txt *.rdoc]
++  noinst += %w[*ubygems.rb rubygems/ datadir.rb] if rubygemsdir
+   install_recursive(File.join(srcdir, "lib"), rubylibdir, :no_install => noinst, :mode => $data_mode)
++  if rubygemsdir
++    noinst = %w[obsolete.rb]
++    install_recursive(File.join(srcdir, "lib", "rubygems"), File.join(rubygemsdir, "rubygems"), :mode => $data_mode)
++    install_recursive(File.join(srcdir, "lib", "rbconfig"), File.join(rubygemsdir, "rbconfig"), :no_install => noinst, :mode => $data_mode)
++    install(File.join(srcdir, "lib", "ubygems.rb"), File.join(rubygemsdir, "ubygems.rb"), :mode => $data_mode)
++    install(File.join(srcdir, "lib", "rubygems.rb"), File.join(rubygemsdir, "rubygems.rb"), :mode => $data_mode)
++  end
+ end
+ 
+ install?(:local, :arch, :lib) do
+--- a/version.c
++++ b/version.c
+@@ -97,6 +97,10 @@
+ #endif
+ #endif
+ 
++#ifdef RUBYGEMS_DIR
++    RUBYGEMS_DIR "\0"
++#endif
++
+     RUBY_LIB "\0"
+ #ifdef RUBY_THIN_ARCHLIB
+     RUBY_THIN_ARCHLIB "\0"
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
new file mode 100644
index 0000000..6d0c5e1
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
@@ -0,0 +1,149 @@
+From fa1a50ad10814f724b8713865dc222724cb955ab Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
+Date: Thu, 25 Aug 2011 14:33:51 +0200
+Subject: [PATCH] Allow to disable versioned paths.
+
+---
+ configure.in     |   11 +++++++++++
+ tool/mkconfig.rb |    9 ++++++---
+ version.c        |   10 ++++++++++
+ 3 files changed, 27 insertions(+), 3 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index e742e74..86cb68f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -2963,6 +2963,17 @@ else
+ fi
+ AC_SUBST(USE_RUBYGEMS)
+ 
++AC_ARG_ENABLE(versioned-paths,
++	AS_HELP_STRING([--disable-versioned-paths], [disable paths with version number]),
++	[enable_versioned_paths="$enableval"], [enable_versioned_paths=yes])
++if test x"$enable_versioned_paths" = xno; then
++    AC_DEFINE(DISABLE_VERSIONED_PATHS, 1)
++    USE_VERSIONED_PATHS=NO
++else
++    USE_VERSIONED_PATHS=YES
++fi
++AC_SUBST(USE_VERSIONED_PATHS)
++
+ arch_hdrdir="${EXTOUT}/include/${arch}/ruby"
+ AS_MKDIR_P("${arch_hdrdir}")
+ config_h="${arch_hdrdir}/config.h"
+diff --git a/tool/mkconfig.rb b/tool/mkconfig.rb
+index a2221f0..47d8c8f 100755
+--- a/tool/mkconfig.rb
++++ b/tool/mkconfig.rb
+@@ -42,6 +42,7 @@ v_others = []
+ vars = {}
+ continued_name = nil
+ continued_line = nil
++path_version = "/$(ruby_version)"
+ File.foreach "config.status" do |line|
+   next if /^#/ =~ line
+   name = nil
+@@ -138,6 +139,8 @@ File.foreach "config.status" do |line|
+     case name
+     when "ruby_version"
+       version = val[/\A"(.*)"\z/, 1]
++    when /^USE_VERSIONED_PATHS$/
++      path_version = nil if /NO/ =~ val
+     end
+   end
+ #  break if /^CEOF/
+@@ -203,15 +206,15 @@ end
+ print(*v_fast)
+ print(*v_others)
+ print <<EOS
+-  CONFIG["rubylibdir"] = "$(rubylibprefix)/$(ruby_version)"
++  CONFIG["rubylibdir"] = "$(rubylibprefix)#{path_version}"
+   CONFIG["archdir"] = "$(rubylibdir)/$(arch)"
+ EOS
+ print <<EOS unless v_disabled["sitedir"]
+-  CONFIG["sitelibdir"] = "$(sitedir)/$(ruby_version)"
++  CONFIG["sitelibdir"] = "$(sitedir)#{path_version}"
+   CONFIG["sitearchdir"] = "$(sitelibdir)/$(sitearch)"
+ EOS
+ print <<EOS unless v_disabled["vendordir"]
+-  CONFIG["vendorlibdir"] = "$(vendordir)/$(ruby_version)"
++  CONFIG["vendorlibdir"] = "$(vendordir)#{path_version}"
+   CONFIG["vendorarchdir"] = "$(vendorlibdir)/$(sitearch)"
+ EOS
+ print <<EOS
+diff --git a/version.c b/version.c
+index 59d4e5e..641dc33 100644
+--- a/version.c
++++ b/version.c
+@@ -38,9 +38,15 @@
+ #define RUBY_VENDOR_LIB RUBY_LIB_PREFIX"/vendor_ruby"
+ #endif
+ 
++#ifdef DISABLE_VERSIONED_PATHS
++#define RUBY_LIB                    RUBY_LIB_PREFIX
++#define RUBY_SITE_LIB2              RUBY_SITE_LIB
++#define RUBY_VENDOR_LIB2            RUBY_VENDOR_LIB
++#else
+ #define RUBY_LIB                    RUBY_LIB_PREFIX  "/"RUBY_LIB_VERSION
+ #define RUBY_SITE_LIB2              RUBY_SITE_LIB    "/"RUBY_LIB_VERSION
+ #define RUBY_VENDOR_LIB2            RUBY_VENDOR_LIB  "/"RUBY_LIB_VERSION
++#endif
+ #define RUBY_ARCHLIB                RUBY_LIB         "/"RUBY_ARCH
+ #define RUBY_SITE_ARCHLIB           RUBY_SITE_LIB2   "/"RUBY_SITEARCH
+ #define RUBY_VENDOR_ARCHLIB         RUBY_VENDOR_LIB2 "/"RUBY_SITEARCH
+@@ -75,8 +81,10 @@ const char ruby_initial_load_paths[] =
+     RUBY_SITE_THIN_ARCHLIB "\0"
+ #endif
+     RUBY_SITE_ARCHLIB "\0"
++#ifndef DISABLE_VERSIONED_PATHS
+     RUBY_SITE_LIB "\0"
+ #endif
++#endif
+ 
+ #ifndef NO_RUBY_VENDOR_LIB
+     RUBY_VENDOR_LIB2 "\0"
+@@ -84,8 +92,10 @@ const char ruby_initial_load_paths[] =
+     RUBY_VENDOR_THIN_ARCHLIB "\0"
+ #endif
+     RUBY_VENDOR_ARCHLIB "\0"
++#ifndef DISABLE_VERSIONED_PATHS
+     RUBY_VENDOR_LIB "\0"
+ #endif
++#endif
+ 
+     RUBY_LIB "\0"
+ #ifdef RUBY_THIN_ARCHLIB
+-- 
+1.7.7.3
+diff --git a/lib/rdoc/ri/paths.rb b/lib/rdoc/ri/paths.rb
+index a3c65bf..0575730 100644
+--- a/lib/rdoc/ri/paths.rb
++++ b/lib/rdoc/ri/paths.rb
+@@ -11,9 +11,9 @@ module RDoc::RI::Paths
+   version = RbConfig::CONFIG['ruby_version']
+ 
+   base    = if RbConfig::CONFIG.key? 'ridir' then
+-              File.join RbConfig::CONFIG['ridir'], version
++              File.join [RbConfig::CONFIG['ridir'], RbConfig::CONFIG['USE_VERSIONED_PATHS'] == 'YES' ? version : nil].compact
+             else
+-              File.join RbConfig::CONFIG['datadir'], 'ri', version
++              File.join [RbConfig::CONFIG['datadir'], 'ri', RbConfig::CONFIG['USE_VERSIONED_PATHS'] == 'YES' ? version : nil].compact
+             end
+ 
+   SYSDIR  = File.join base, "system"
+diff --git a/tool/rbinstall.rb b/tool/rbinstall.rb
+index cec8c9f..fed14d2 100755
+--- a/tool/rbinstall.rb
++++ b/tool/rbinstall.rb
+@@ -379,7 +379,7 @@ end
+ 
+ install?(:doc, :rdoc) do
+   if $rdocdir
+-    ridatadir = File.join(CONFIG['ridir'], CONFIG['ruby_version'], "system")
++    ridatadir = File.join([CONFIG['ridir'], RbConfig::CONFIG['USE_VERSIONED_PATHS'] == 'YES' ? version : nil, "system"].compact)
+     prepare "rdoc", ridatadir
+     install_recursive($rdocdir, ridatadir, :mode => $data_mode)
+   end
+-- 
+1.7.6
+
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch
new file mode 100644
index 0000000..d0ade91
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch
@@ -0,0 +1,12 @@
+diff -up ruby-1.9.3-p0/ext/tk/extconf.rb.orig ruby-1.9.3-p0/ext/tk/extconf.rb
+--- ruby-1.9.3-p0/ext/tk/extconf.rb.orig	2011-06-29 16:11:19.000000000 +0200
++++ ruby-1.9.3-p0/ext/tk/extconf.rb	2011-10-18 16:15:59.406299659 +0200
+@@ -114,7 +114,7 @@ def is_macosx?
+ end
+ 
+ def maybe_64bit?
+-  /64|universal/ =~ RUBY_PLATFORM
++  /64|universal|s390x/ =~ RUBY_PLATFORM
+ end
+ 
+ def check_tcltk_version(version)
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
new file mode 100644
index 0000000..9515ece
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
@@ -0,0 +1,16 @@
+---
+ Makefile.in |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -210,7 +210,8 @@
+ 	@$(RM) fake.rb fake-rbconfig.rb
+ 	$(INSTALL_DATA) $(arch_hdrdir)/ruby/config.h $(XRUBY_RUBYHDRDIR)/$(arch)/ruby
+ 	$(INSTALL_DATA) $(top_srcdir)/include/ruby/win32.h $(XRUBY_RUBYHDRDIR)/ruby
+-	$(INSTALL_DATA) $(LIBRUBY) $(LIBRUBY_A) $(XRUBY_RUBYLIBDIR)/$(arch)
++	$(INSTALL_DATA) $(LIBRUBY) $(XRUBY_RUBYLIBDIR)/$(arch)
++	$(INSTALL_DATA) $(LIBRUBY_A) $(XRUBY_RUBYLIBDIR)/$(arch)
+ 	$(INSTALL_PROGRAM) $(LIBRUBY_SO) $(XRUBY_RUBYLIBDIR)/$(arch)
+ 
+ Makefile:	$(srcdir)/Makefile.in $(srcdir)/enc/Makefile.in
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
new file mode 100644
index 0000000..7da66c8
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
@@ -0,0 +1,11 @@
+--- ruby-1.9.3-p0/lib/mkmf.rb.debug	2011-08-11 15:07:37.000000000 +0900
++++ ruby-1.9.3-p0/lib/mkmf.rb	2012-01-29 21:34:17.000000000 +0900
+@@ -1638,7 +1638,7 @@
+ SHELL = /bin/sh
+ 
+ # V=0 quiet, V=1 verbose.  other values don't work.
+-V = 0
++V = 1
+ Q1 = $(V:1=)
+ Q = $(Q1:0=@)
+ n=$(NULLCMD)
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
new file mode 100644
index 0000000..af1cff2
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
@@ -0,0 +1,76 @@
+--- ruby-1.9.3-p0/lib/rubygems/uninstaller.rb.orig	2011-10-31 10:22:36.321579483 +0100
++++ ruby-1.9.3-p0/lib/rubygems/uninstaller.rb	2011-10-31 10:34:25.563626119 +0100
+@@ -51,15 +51,14 @@
+     @bin_dir           = options[:bin_dir]
+     @format_executable = options[:format_executable]
+ 
++    if options[:force]
++      @force_all = true
++      @force_ignore = true
++    end
++
+     # only add user directory if install_dir is not set
+     @user_install = false
+     @user_install = options[:user_install] unless options[:install_dir]
+-
+-    if @user_install then
+-      Gem.use_paths Gem.user_dir, @gem_home
+-    else
+-      Gem.use_paths @gem_home
+-    end
+   end
+ 
+   ##
+@@ -69,10 +68,24 @@
+   def uninstall
+     list = Gem::Specification.find_all_by_name(@gem, @version)
+ 
++    list, other_repo_specs = list.partition do |spec|
++      @gem_home == spec.base_dir or
++      (@user_install and spec.base_dir == Gem.user_dir)
++    end
++
+     if list.empty? then
+-      raise Gem::InstallError, "gem #{@gem.inspect} is not installed"
++      raise Gem::InstallError, "gem #{@gem.inspect} is not installed" if
++        other_repo_specs.empty?
++
++      other_repos = other_repo_specs.map { |spec| spec.base_dir }.uniq
++
++      message = ["#{@gem} is not installed in GEM_HOME, try:"]
++      message.concat other_repos.map { |repo|
++        "\tgem uninstall -i #{repo} #{@gem}"
++      }
+ 
+-    elsif list.size > 1 and @force_all then
++      raise Gem::InstallError, message.join("\n")
++    elsif @force_all then
+       remove_all list
+ 
+     elsif list.size > 1 then
+@@ -250,12 +263,10 @@
+     msg << "\t#{spec.full_name}"
+ 
+     spec.dependent_gems.each do |dep_spec, dep, satlist|
+-      msg <<
+-        ("#{dep_spec.name}-#{dep_spec.version} depends on " +
+-         "[#{dep.name} (#{dep.requirement})]")
++      msg << "#{dep_spec.name}-#{dep_spec.version} depends on #{dep}"
+     end
+ 
+-    msg << 'If you remove this gems, one or more dependencies will not be met.'
++    msg << 'If you remove this gem, one or more dependencies will not be met.'
+     msg << 'Continue with Uninstall?'
+     return ask_yes_no(msg.join("\n"), true)
+   end
+
+--- ruby-1.9.3-p0/test/rubygems/test_gem_uninstaller.rb.orig	2011-11-03 08:58:31.411272176 +0100
++++ ruby-1.9.3-p0/test/rubygems/test_gem_uninstaller.rb	2011-11-03 08:58:43.010272351 +0100
+@@ -225,7 +225,7 @@
+ 
+     uninstaller = Gem::Uninstaller.new('a')
+ 
+-    use_ui Gem::MockGemUi.new("2\n") do
++    use_ui Gem::MockGemUi.new("2\ny\n") do
+       uninstaller.uninstall
+     end
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch
new file mode 100644
index 0000000..c6eb3fa
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch
@@ -0,0 +1,24 @@
+diff --git a/test/webrick/test_cgi.rb b/test/webrick/test_cgi.rb
+index 1185316..0ef1b37 100644
+--- a/test/webrick/test_cgi.rb
++++ b/test/webrick/test_cgi.rb
+@@ -14,6 +14,7 @@ class TestWEBrickCGI < Test::Unit::TestCase
+         def req.meta_vars
+           meta = super
+           meta["RUBYLIB"] = $:.join(File::PATH_SEPARATOR)
++          meta[RbConfig::CONFIG['LIBPATHENV']] = ENV[RbConfig::CONFIG['LIBPATHENV']]
+           return meta
+         end
+       },
+diff --git a/test/webrick/test_filehandler.rb b/test/webrick/test_filehandler.rb
+index bcdb3df..f78ba5c 100644
+--- a/test/webrick/test_filehandler.rb
++++ b/test/webrick/test_filehandler.rb
+@@ -252,6 +252,7 @@ class WEBrick::TestFileHandler < Test::Unit::TestCase
+         def req.meta_vars
+           meta = super
+           meta["RUBYLIB"] = $:.join(File::PATH_SEPARATOR)
++          meta[RbConfig::CONFIG['LIBPATHENV']] = ENV[RbConfig::CONFIG['LIBPATHENV']]
+           return meta
+         end
+       },
diff --git a/meta/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch b/meta/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
new file mode 100644
index 0000000..5a3bfb4
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
@@ -0,0 +1,296 @@
+From 5a37a3489491a33f2e7011043fbbcd9a765e1777 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
+Date: Thu, 3 Nov 2011 16:43:05 +0100
+Subject: [PATCH 1/6] Add dedicate extensions folder into $LOAD_PATH.
+
+---
+ lib/rubygems/specification.rb |   37 ++++++++++++++++++++++++++++++-------
+ 1 files changed, 30 insertions(+), 7 deletions(-)
+
+diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
+index 97db19e..263e7d3 100644
+--- a/lib/rubygems/specification.rb
++++ b/lib/rubygems/specification.rb
+@@ -843,6 +843,12 @@ class Gem::Specification
+       File.join full_gem_path, path
+     end
+ 
++    unless extensions.empty?
++      paths += require_paths.map do |path|
++        File.join ext_dir, path
++      end
++    end
++
+     # gem directories must come after -I and ENV['RUBYLIB']
+     insert_index = Gem.load_path_insert_index
+ 
+@@ -954,16 +960,16 @@ class Gem::Specification
+ 
+   def contains_requirable_file? file
+     root = full_gem_path
++    ext = ext_dir
++
++    require_paths.any? do |lib|
++      base = ["#{root}/#{lib}/#{file}"]
++      base << "#{ext}/#{lib}/#{file}" unless extensions.empty?
+ 
+-    require_paths.each do |lib|
+-      base = "#{root}/#{lib}/#{file}"
+-      Gem.suffixes.each do |suf|
+-        path = "#{base}#{suf}"
+-        return true if File.file? path
++      base.any? do |path|
++        Gem.suffixes.any? { |suf| File.file? "#{path}#{suf}" }
+       end
+     end
+-
+-    return false
+   end
+ 
+   ##
+@@ -1273,6 +1279,23 @@ class Gem::Specification
+   end
+ 
+   ##
++  # Returns the full path to this spec's ext directory.
++  # eg: /usr/local/lib/ruby/1.8/exts/mygem-1.0
++
++  def ext_dir
++    @gem_dir ||= File.expand_path File.join(exts_dir, full_name)
++  end
++
++  ##
++  # Returns the full path to the exts directory containing this spec's
++  # gem directory. eg: /usr/local/lib/ruby/1.8/exts
++
++  def exts_dir
++    # TODO: this logic seems terribly broken, but tests fail if just base_dir
++    @exts_dir ||= File.join(loaded_from && base_dir || Gem.dir, "exts")
++  end
++
++  ##
+   # Deprecated and ignored, defaults to true.
+   #
+   # Formerly used to indicate this gem was RDoc-capable.
+-- 
+1.7.7.3
+
+
+From 671e4285bf9db948bc5f054d7d3d931cdd7a17f8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
+Date: Wed, 16 Nov 2011 13:26:48 +0100
+Subject: [PATCH 2/6] Use spec's ext dir for extension installation.
+
+---
+ lib/rubygems/installer.rb     |    2 +-
+ lib/rubygems/specification.rb |    7 +++----
+ 2 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/lib/rubygems/installer.rb b/lib/rubygems/installer.rb
+index 74d803d..0063c7f 100644
+--- a/lib/rubygems/installer.rb
++++ b/lib/rubygems/installer.rb
+@@ -499,7 +499,7 @@ TEXT
+   def build_extensions
+     return if spec.extensions.empty?
+     say "Building native extensions.  This could take a while..."
+-    dest_path = File.join gem_dir, spec.require_paths.first
++    dest_path = spec.ext_dir
+     ran_rake = false # only run rake once
+ 
+     spec.extensions.each do |extension|
+diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
+index 263e7d3..d31b93b 100644
+--- a/lib/rubygems/specification.rb
++++ b/lib/rubygems/specification.rb
+@@ -1283,16 +1283,15 @@ class Gem::Specification
+   # eg: /usr/local/lib/ruby/1.8/exts/mygem-1.0
+ 
+   def ext_dir
+-    @gem_dir ||= File.expand_path File.join(exts_dir, full_name)
++    @ext_dir ||= File.join exts_dir, full_name, require_paths.first
+   end
+ 
+   ##
+   # Returns the full path to the exts directory containing this spec's
+-  # gem directory. eg: /usr/local/lib/ruby/1.8/exts
++  # gem directory. eg: /usr/local/lib/ruby/1.8/gems
+ 
+   def exts_dir
+-    # TODO: this logic seems terribly broken, but tests fail if just base_dir
+-    @exts_dir ||= File.join(loaded_from && base_dir || Gem.dir, "exts")
++    @exts_dir ||= gems_dir
+   end
+ 
+   ##
+-- 
+1.7.7.3
+
+
+From 11b4a0cbadd8b1d3320f838881aa60feb6f848e7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
+Date: Wed, 16 Nov 2011 14:52:16 +0100
+Subject: [PATCH 3/6] Simplify the extending of $LOAD_PATH for binary gems.
+
+---
+ lib/rubygems/specification.rb |   11 +++++------
+ 1 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
+index d31b93b..e65ea2d 100644
+--- a/lib/rubygems/specification.rb
++++ b/lib/rubygems/specification.rb
+@@ -843,11 +843,7 @@ class Gem::Specification
+       File.join full_gem_path, path
+     end
+ 
+-    unless extensions.empty?
+-      paths += require_paths.map do |path|
+-        File.join ext_dir, path
+-      end
+-    end
++    paths << ext_dir unless extensions.empty? || paths.include?(ext_dir)
+ 
+     # gem directories must come after -I and ENV['RUBYLIB']
+     insert_index = Gem.load_path_insert_index
+@@ -1291,7 +1287,10 @@ class Gem::Specification
+   # gem directory. eg: /usr/local/lib/ruby/1.8/gems
+ 
+   def exts_dir
+-    @exts_dir ||= gems_dir
++    @exts_dir ||= begin
++      dirs = Gem.default_dirs.detect {|location, paths| paths[:gem_dir] == base_dir}
++      dirs ? File.join(dirs.last[:ext_dir], 'exts') : gems_dir
++    end
+   end
+ 
+   ##
+-- 
+1.7.7.3
+
+
+From 5d46cd2b1ac9517a9cbcfa430261e62bb3a376b8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
+Date: Fri, 9 Dec 2011 16:31:04 +0100
+Subject: [PATCH 4/6] Fix the binary extension search path construction.
+
+---
+ lib/rubygems/installer.rb     |    2 +-
+ lib/rubygems/specification.rb |    4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/rubygems/installer.rb b/lib/rubygems/installer.rb
+index 0063c7f..83b8fd5 100644
+--- a/lib/rubygems/installer.rb
++++ b/lib/rubygems/installer.rb
+@@ -499,7 +499,7 @@ TEXT
+   def build_extensions
+     return if spec.extensions.empty?
+     say "Building native extensions.  This could take a while..."
+-    dest_path = spec.ext_dir
++    dest_path = File.join spec.ext_dir, spec.require_paths.first
+     ran_rake = false # only run rake once
+ 
+     spec.extensions.each do |extension|
+diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
+index e65ea2d..8be2ade 100644
+--- a/lib/rubygems/specification.rb
++++ b/lib/rubygems/specification.rb
+@@ -843,7 +843,7 @@ class Gem::Specification
+       File.join full_gem_path, path
+     end
+ 
+-    paths << ext_dir unless extensions.empty? || paths.include?(ext_dir)
++    paths << File.join(ext_dir, require_paths.first) unless extensions.empty? || (ext_dir == full_gem_path)
+ 
+     # gem directories must come after -I and ENV['RUBYLIB']
+     insert_index = Gem.load_path_insert_index
+@@ -1279,7 +1279,7 @@ class Gem::Specification
+   # eg: /usr/local/lib/ruby/1.8/exts/mygem-1.0
+ 
+   def ext_dir
+-    @ext_dir ||= File.join exts_dir, full_name, require_paths.first
++    @ext_dir ||= File.join exts_dir, full_name
+   end
+ 
+   ##
+-- 
+1.7.7.3
+
+
+From 6229583633802b45e5a3e5689ab9077347cd9ef7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
+Date: Tue, 13 Dec 2011 12:14:54 +0100
+Subject: [PATCH 5/6] Remove binary extensions during uninstall.
+
+---
+ lib/rubygems/uninstaller.rb |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/lib/rubygems/uninstaller.rb b/lib/rubygems/uninstaller.rb
+index cc32ea4..94d78e0 100644
+--- a/lib/rubygems/uninstaller.rb
++++ b/lib/rubygems/uninstaller.rb
+@@ -213,6 +213,7 @@ class Gem::Uninstaller
+       File.writable?(spec.base_dir)
+ 
+     FileUtils.rm_rf spec.full_gem_path
++    FileUtils.rm_rf spec.ext_dir
+ 
+     # TODO: should this be moved to spec?... I vote eww (also exists in docmgr)
+     old_platform_name = [spec.name,
+-- 
+1.7.7.3
+
+
+From bc40e1b9f60a9a04456e3504ffe6ee600b6da269 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
+Date: Tue, 13 Dec 2011 14:27:14 +0100
+Subject: [PATCH 6/6] Avoid dependency on customized operating_system.rb.
+
+---
+ lib/rubygems/defaults.rb      |   11 +++++++++++
+ lib/rubygems/specification.rb |    5 +----
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/lib/rubygems/defaults.rb b/lib/rubygems/defaults.rb
+index 20b4198..6d8711f 100644
+--- a/lib/rubygems/defaults.rb
++++ b/lib/rubygems/defaults.rb
+@@ -87,6 +87,17 @@ module Gem
+   end
+ 
+   ##
++  # Returns binary extensions dir for specified RubyGems base dir or nil
++  # if such directory cannot be determined.
++  #
++  # By default, the binary extensions are located side by side with their
++  # Ruby counterparts, therefore nil is returned
++
++  def self.default_ext_dir_for base_dir
++    nil
++  end
++
++  ##
+   # The default system-wide source info cache directory
+ 
+   def self.default_system_source_cache_dir
+diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
+index 8be2ade..f54210a 100644
+--- a/lib/rubygems/specification.rb
++++ b/lib/rubygems/specification.rb
+@@ -1287,10 +1287,7 @@ class Gem::Specification
+   # gem directory. eg: /usr/local/lib/ruby/1.8/gems
+ 
+   def exts_dir
+-    @exts_dir ||= begin
+-      dirs = Gem.default_dirs.detect {|location, paths| paths[:gem_dir] == base_dir}
+-      dirs ? File.join(dirs.last[:ext_dir], 'exts') : gems_dir
+-    end
++    @exts_dir ||= Gem.default_ext_dir_for(base_dir) || gems_dir
+   end
+ 
+   ##
+-- 
+1.7.7.3
+
diff --git a/meta/recipes-devtools/ruby/ruby_1.9.3-p194.bb b/meta/recipes-devtools/ruby/ruby_1.9.3-p194.bb
new file mode 100644
index 0000000..8e39c84
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby_1.9.3-p194.bb
@@ -0,0 +1,57 @@
+require ruby.inc
+PR = "${INC_PR}.1"
+
+DEPENDS += "yaml"
+
+SRC_URI += "\
+	file://ruby-1.9.3-0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch \
+	file://ruby-1.9.3-always-use-i386.patch \
+	file://ruby-1.9.3-disable-versioned-paths.patch \
+	file://ruby-1.9.3-fix-s390x-build.patch \
+	file://ruby-1.9.3-rubygems-1.8.11-uninstaller.patch \
+	file://ruby-1.9.3-webrick-test-fix.patch \
+	file://ruby-1.9.3-bignum-test-fix.patch \
+	file://ruby-1.9.3-custom-rubygems-location.patch \
+	file://rubygems-1.8.11-binary-extensions.patch \
+	file://ruby-1.9.3-mkmf-verbose.patch \
+	file://ruby-1.9.3-install-cross.patch \
+"
+
+SRC_URI[md5sum] = "bc0c715c69da4d1d8bd57069c19f6c0e"
+SRC_URI[sha256sum] = "46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb"
+
+EXTRA_OECONF = "\
+	--enable-wide-getaddrinfo \
+	--with-rubygemsdir=${datadir}/rubygems \
+	--disable-versioned-paths \
+	--disable-rpath \
+	--enable-shared \
+"
+
+EXTRA_OEMAKE = " \
+	LIBRUBYARG='-lruby-static' \
+"
+
+do_install() {
+	if [ ${PN} = "ruby" ]; then
+		oe_runmake 'DESTDIR=${D}' install install-cross
+	else
+		oe_runmake 'DESTDIR=${D}' install
+	fi
+}
+
+FILES_${PN} += "${datadir}/rubygems \
+		${datadir}/ri"
+
+FILES_${PN}-dbg += "${libdir}/ruby/*/.debug \
+                    ${libdir}/ruby/*/*/.debug \
+                    ${libdir}/ruby/*/*/*/.debug"
+
+BBCLASSEXTEND = "native"
+
+LIC_FILES_CHKSUM = "\
+	file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \
+	file://BSDL;md5=3949e007205deef714bd225e1ee4a8ea \
+	file://GPL;md5=393a5ca445f6965873eca0259a17f833 \
+	file://LEGAL;md5=e88686821918c0b6d2b1b8328116cec5 \
+"
-- 
1.7.4



