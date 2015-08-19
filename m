Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F043276A63
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:39:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 19 Aug 2015 06:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="771742239"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2015 06:39:54 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 16:40:50 +0300
Message-Id: <aa55a535108f6ae3e7e269256b20db3bedf35398.1439991562.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/22] ruby: add a recipe from meta-ruby
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
X-List-Received-Date: Wed, 19 Aug 2015 13:39:55 -0000

Ruby is required to build webkit.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/ruby/ruby.inc         | 40 +++++++++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby/extmk.patch | 13 +++++++++
 meta/recipes-devtools/ruby/ruby_2.2.2.bb    | 42 +++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby.inc
 create mode 100644 meta/recipes-devtools/ruby/ruby/extmk.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby_2.2.2.bb

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
new file mode 100644
index 0000000..ba60191
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -0,0 +1,40 @@
+SUMMARY = "An interpreter of object-oriented scripting language"
+DESCRIPTION = "Ruby is an interpreted scripting language for quick \
+and easy object-oriented programming. It has many features to process \
+text files and to do system management tasks (as in Perl). \
+It is simple, straight-forward, and extensible. \
+"
+HOMEPAGE = "http://www.ruby-lang.org/"
+SECTION = "devel/ruby"
+LICENSE = "Ruby | BSD | GPLv2"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \
+    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
+    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
+    file://LEGAL;md5=c440adb575ba4e6e2344c2630b6a5584\
+"
+
+DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
+DEPENDS_class-native = "libyaml-native"
+
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
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
+    sed -i "s#%%TARGET_CFLAGS%%#$TARGET_CFLAGS#; s#%%TARGET_LDFLAGS%%#$TARGET_LDFLAGS#" ${S}/common.mk
+    rm -rf ${S}/ruby/
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
diff --git a/meta/recipes-devtools/ruby/ruby_2.2.2.bb b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
new file mode 100644
index 0000000..78c943c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
@@ -0,0 +1,42 @@
+require ruby.inc
+
+SRC_URI[md5sum] = "326e99ddc75381c7b50c85f7089f3260"
+SRC_URI[sha256sum] = "5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf845fa02a7b113d9b44"
+
+# it's unknown to configure script, but then passed to extconf.rb
+# maybe it's not really needed as we're hardcoding the result with
+# 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
+UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+
+PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
+PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
+PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
+
+EXTRA_OECONF = "\
+    --disable-versioned-paths \
+    --disable-rpath \
+    --disable-dtrace \
+    --enable-shared \
+    --enable-load-relative \
+"
+
+EXTRA_OEMAKE = " \
+    LIBRUBYARG='-lruby-static' \
+"
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+}
+
+FILES_${PN} += "${datadir}/rubygems \
+                ${datadir}/ri"
+
+FILES_${PN}-dbg += "${libdir}/ruby/*/.debug \
+                    ${libdir}/ruby/*/*/.debug \
+                    ${libdir}/ruby/*/*/*/.debug \
+                    ${libdir}/ruby/*/*/*/*/.debug"
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


