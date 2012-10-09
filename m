Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TLTdr-0004PJ-RR
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 08:50:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q996b41H021730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 23:37:04 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 8 Oct 2012 23:37:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Oct 2012 14:36:56 +0800
Message-ID: <ae361c1312b1b2d8530a306c6ae1ea6dd2705a0f.1349689653.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1349689653.git.jackie.huang@windriver.com>
References: <cover.1349689653.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [PATCH 3/4] ruby: Add from OE-Classic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 06:50:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

No modifications in this commit

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/ruby/ruby.inc                |   34 ++++++++++++++++++++
 ...onf-hardcode-wide-getaddr-info-test-outco.patch |   31 ++++++++++++++++++
 meta/recipes-devtools/ruby/ruby/extmk.patch        |   13 +++++++
 meta/recipes-devtools/ruby/ruby/extmk_run.patch    |   15 +++++++++
 meta/recipes-devtools/ruby/ruby_1.8.7-p302.bb      |   12 +++++++
 5 files changed, 105 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby.inc
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/extmk.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/extmk_run.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby_1.8.7-p302.bb

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
new file mode 100644
index 0000000..cbae809
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -0,0 +1,34 @@
+DESCRIPTION = "Ruby is an interpreted scripting language \
+for quick and easy object-oriented programming."
+SECTION = "devel/ruby"
+PRIORITY = "optional"
+LICENSE = "GPL"
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
+# fix building of socket extension
+EXTRA_OECONF = "--enable-wide-getaddrinfo"
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
diff --git a/meta/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch b/meta/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
new file mode 100644
index 0000000..64f093a
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
@@ -0,0 +1,31 @@
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
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/ext/socket/extconf.rb b/ext/socket/extconf.rb
+index ece6158..5fba46c 100644
+--- a/ext/socket/extconf.rb
++++ b/ext/socket/extconf.rb
+@@ -222,6 +222,11 @@ main()
+   exit(EXIT_FAILURE);
+ }
+ EOF
++
++# Ignore the actual result of the above test and assume that
++# everything is OK.
++getaddr_info_ok = true
++
+ end
+ if ipv6 and not getaddr_info_ok
+   abort <<EOS
+-- 
+1.6.6.1
+
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
diff --git a/meta/recipes-devtools/ruby/ruby_1.8.7-p302.bb b/meta/recipes-devtools/ruby/ruby_1.8.7-p302.bb
new file mode 100644
index 0000000..a51edd7
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby_1.8.7-p302.bb
@@ -0,0 +1,12 @@
+require ruby.inc
+PR = "${INC_PR}.1"
+
+SRC_URI += "file://0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch"
+
+SRC_URI[md5sum] = "f446550dfde0d8162a6ed8d5a38b3ac2"
+SRC_URI[sha256sum] = "5883df5204de70762602ce885b18c8bf6c856d33298c35df9151031b2ce044a1"
+
+FILES_${PN}-dbg += "${libdir}/ruby/1.8/*/.debug \
+                    ${libdir}/ruby/1.8/*/*/.debug"
+BBCLASSEXTEND = "native"
+
-- 
1.7.4



