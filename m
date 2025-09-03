Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAA3CA1010
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 22:27:55 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.25982.1756938470640167823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 15:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YVoEsZwj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250903222745eb48ee579f000207b5-jvjcyi@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250903222745eb48ee579f000207b5
        for <openembedded-core@lists.openembedded.org>;
        Thu, 04 Sep 2025 00:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=roWf0elA1Vyz7FR7ulO7SfF9UNQBiQX6e+bgEhdLNKc=;
 b=YVoEsZwjQsvoMvC8sYK0sH43cvBwk2Pd6tCpzNQGtSnhPwPBmiSVcOzCnRNO/72HxLWKur
 w3AZ/4wyOuhvVV0xHqqScou02rLyMaSEs8HploPPIDMFWj8Zh4HnEflN4hm/T6LlnkWHMXzZ
 X7TvepOfMe+B6rRe3BG61Msiae/zRkIZK7on91q/Fjczsx7UgCFqomEnGVio5k78WoGFK4zK
 ohl+Rddr1wV133vwMHI5V92rr9r3Q+bPWl7EMc9vz91iUUmfl8Es9FWiR/UwIRlkAmnoZ0bG
 Yi1m1xnf5hxW54Ptc8QyikA0oq9xrKdwR2Rtlu1/d8wenMq9IB7ZRpMw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Date: Thu,  4 Sep 2025 00:26:58 +0200
Message-Id: <20250903222658.3929743-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 22:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222882

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2025-3277, CVE-2025-29087 and CVE-2025-29088.

This update includes major change in how it is built.
Instead of autotools, autosetup is used.

Autosetup (https://msteveb.github.io/autosetup/) claims to be
* Replacement for autoconf in many situations
However it also claims NOT to
* Intended to replace all possible uses of autoconf
This means that some autoconf features are not available.

Recipe changes:
* stop inheriting autotools and define B, do_configure and do_install
* depend on zlib unconditionally, autoconf cannot be preconfigured in
  similar way as autotools
* update packageconfig options to match new syntax
* libedit is detected with ncurses linking options (as seen in
  do_configure log)
* backport rpaths fix
* define soname to avoid file-rdeps QA error due to wrong library name
* add hack to rewrite native binaries as native installation will strip
  them unconditionally
* clean B for do_configure as the new Makefiles do not seem to properly
  retrigger build if configuration changes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sqlite/sqlite3.inc       | 41 ++++++++++---
 ...rpath-configure-script-flag-to-addre.patch | 57 +++++++++++++++++++
 .../{sqlite3_3.48.0.bb => sqlite3_3.50.4.bb}  |  3 +-
 3 files changed, 93 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.50.4.bb} (53%)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 28a33282ae1..0415ec0098e 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -14,34 +14,37 @@ def sqlite_download_version(d):
 SQLITE_PV = "${@sqlite_download_version(d)}"
 
 S = "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
+B = "${WORKDIR}/build"
 
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
 CVE_PRODUCT = "sqlite"
 
-inherit autotools pkgconfig siteinfo
+inherit pkgconfig siteinfo
+
+# zlib is autodetected and gets to sysroots as transitive dependency, make this deterministic
+DEPENDS = "zlib"
 
 # enable those which are enabled by default in configure
 PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext"
 PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
 
-PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
-PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
+PACKAGECONFIG[editline] = "--enable-editline --with-readline-header=${includedir}/editline/readline.h,--disable-editline,libedit ncurses"
+PACKAGECONFIG[readline] = "--enable-readline --with-readline-header=${includedir}/readline/readline.h,--disable-readline,readline ncurses"
 PACKAGECONFIG[fts3] = "--enable-fts3,--disable-fts3"
 PACKAGECONFIG[fts4] = "--enable-fts4,--disable-fts4"
 PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"
 PACKAGECONFIG[rtree] = "--enable-rtree,--disable-rtree"
 PACKAGECONFIG[session] = "--enable-session,--disable-session"
-PACKAGECONFIG[dyn_ext] = "--enable-dynamic-extensions,--disable-dynamic-extensions"
-PACKAGECONFIG[zlib] = ",,zlib"
-
-CACHED_CONFIGUREVARS += "${@bb.utils.contains('PACKAGECONFIG', 'zlib', '', 'ac_cv_search_deflate=no',d)}"
+PACKAGECONFIG[dyn_ext] = "--enable-load-extension,--disable-load-extension"
 
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-threadsafe \
     --disable-static-shell \
+    --disable-rpath \
+    --soname=legacy \
 "
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
@@ -65,4 +68,28 @@ FILES:lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 AUTO_LIBNAME_PKGS = "${MLPREFIX}lib${BPN}"
 
+do_configure() {
+    ${S}/configure \
+        --build=${BUILD_SYS} \
+        --host=${TARGET_SYS} \
+        --prefix=${prefix} \
+        --bindir=${bindir} \
+        --libdir=${libdir} \
+        --includedir=${includedir} \
+        --mandir=${mandir} \
+        ${EXTRA_OECONF} \
+        ${PACKAGECONFIG_CONFARGS}
+}
+do_configure[cleandirs] = "${B}"
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+
+    # binaries are stripped during installation when not cross-compiling, take the unstripped ones instead
+    if [ "${BUILD_SYS}" = "${TARGET_SYS}" ]; then
+        install -m 0644 ${B}/sqlite3 ${D}${bindir}
+        install -m 0644 ${B}/libsqlite3.so ${D}${libdir}/libsqlite3.so.${PV}
+    fi
+}
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
new file mode 100644
index 00000000000..f1e93a1c9a7
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
@@ -0,0 +1,57 @@
+From 87c807c6dd4df67328919fa28e89a06839e634fe Mon Sep 17 00:00:00 2001
+From: stephan <stephan@noemail.net>
+Date: Sun, 22 Jun 2025 22:48:11 +0000
+Subject: [PATCH] Add the --disable-rpath configure script flag to address
+ [forum:13cac3b56516f849 | forum post 13cac3b56516f849].
+
+FossilOrigin-Name: a59d9bb25e518f5d79f654615b92f6c50cfb704b5abee0f820912644b89366c5
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/87c807c6dd4df67328919fa28e89a06839e634fe]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ autosetup/sqlite-config.tcl | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
+index bb81123204..4dd065095e 100644
+--- a/autosetup/sqlite-config.tcl
++++ b/autosetup/sqlite-config.tcl
+@@ -334,8 +334,8 @@ proc sqlite-configure {buildMode configScript} {
+           => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
+       }
+       {canonical autoconf} {
+-        # A potential TODO without a current use case:
+-        #rpath=1 => {Disable use of the rpath linker flag}
++        rpath=1 => {Disable use of the rpath linker flag}
++
+         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
+         soname:=legacy
+           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
+@@ -2119,7 +2119,6 @@ proc sqlite-handle-tcl {} {
+ ########################################################################
+ # Handle the --enable/disable-rpath flag.
+ proc sqlite-handle-rpath {} {
+-  proj-check-rpath
+   # autosetup/cc-shared.tcl sets the rpath flag definition in
+   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
+   # rather than as a compiler check. Though we should do a proper
+@@ -2128,12 +2127,13 @@ proc sqlite-handle-rpath {} {
+   # for which sqlite-env-is-unix-on-windows returns a non-empty
+   # string.
+ 
+-#  if {[proj-opt-truthy rpath]} {
+-#    proj-check-rpath
+-#  } else {
+-#    msg-result "Disabling use of rpath."
+-#    define LDFLAGS_RPATH ""
+-#  }
++  # https://sqlite.org/forum/forumpost/13cac3b56516f849
++  if {[proj-opt-truthy rpath]} {
++    proj-check-rpath
++  } else {
++    msg-result "Disabling use of rpath."
++    define LDFLAGS_RPATH ""
++  }
+ }
+ 
+ ########################################################################
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
similarity index 53%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.50.4.bb
index bd2ac6614d8..4d0a807e204 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
@@ -4,5 +4,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI[sha256sum] = "a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18"
 
+SRC_URI += "file://0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch"

