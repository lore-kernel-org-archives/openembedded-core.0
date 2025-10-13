Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE50CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 07:09:07 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.37023.1760339337045645395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 00:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=nHLhBCBi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202510130708531249c1176c00020756-ayb1fe@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202510130708531249c1176c00020756
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Oct 2025 09:08:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Dh/A3bqcsPuLU+kWjVctQrTDHSxiMu3rhLjU32BRZNI=;
 b=nHLhBCBidKnJ7WpLYqI/S4ANA8eL86Fhs3VuVbRyLLx/y/vAjFcujlb0dWRt7XvW6+hpaJ
 wRrz4JxLQYBf7GdS2ToXhIlTrRBMlvkjxgwd7XSEkdAlS1oqHLwNjtXZMkFQ3ZTC5Zxk7cby
 gvKJywSGRcbPnTelZIXQXv+cfvym/sNLnmym6wwA/ShfL14KqRTRjyhUDcreqH44juwpvrZU
 rAyN9H0Zd5mN2MmbKtVhH7aJgi1Ri2PIVFi0rJZI+4vDDunNBFVZvWCDCR/DzBnKD/yumCwz
 AaxVkF500PsmytS1E1lyneDVFzsuxwmqT0zSOpfBZzK41n3X+4qBAvfA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
Date: Mon, 13 Oct 2025 09:08:46 +0200
Message-Id: <20251013070846.505298-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 07:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224765

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
* add patch to disable zlib as autosetup cannot be preconfigured like
  autotools to force function calls
* update packageconfig options to match new syntax
* libedit is detected with ncurses linking options (as seen in
  do_configure log)
* backport rpaths fix
* define soname to avoid file-rdeps QA error due to wrong library name
* clean B for do_configure as the new Makefiles do not seem to properly
  retrigger build if configuration changes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2 changes:
- rebased to latest master
- removed anti-strip hack not needed in latest version
- created patch to disable zlib
- (no change) checked proj-native build: succeeds on Debian 12 x86 host
v3 changes:
- updated upstream status and added comment on reason for it

 meta/recipes-support/sqlite/sqlite3.inc       | 33 ++++++++---
 ...rpath-configure-script-flag-to-addre.patch | 57 ++++++++++++++++++
 .../0002-Add-option-to-disable-zlib.patch     | 58 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |  8 ---
 meta/recipes-support/sqlite/sqlite3_3.50.4.bb | 10 ++++
 5 files changed, 151 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disable-zlib.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.48.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.50.4.bb

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 28a33282ae1..94dbc38ec5e 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -14,34 +14,35 @@ def sqlite_download_version(d):
 SQLITE_PV = "${@sqlite_download_version(d)}"
 
 S = "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
+B = "${WORKDIR}/build"
 
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
 CVE_PRODUCT = "sqlite"
 
-inherit autotools pkgconfig siteinfo
+inherit pkgconfig siteinfo
 
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
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
+PACKAGECONFIG[dyn_ext] = "--enable-load-extension,--disable-load-extension"
 
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-threadsafe \
     --disable-static-shell \
+    --disable-rpath \
+    --soname=legacy \
 "
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
@@ -65,4 +66,22 @@ FILES:lib${BPN}-staticdev = "${libdir}/lib*.a"
 
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
diff --git a/meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disable-zlib.patch
new file mode 100644
index 00000000000..2855372c215
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disable-zlib.patch
@@ -0,0 +1,58 @@
+From f98a739032dd863ba8dd315729ded7ad0c86473c Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Sun, 12 Oct 2025 23:32:46 +0200
+Subject: [PATCH] Add option to disable zlib
+
+Autotools allowed to disable zlib by preconfiguring variable
+'ac_cv_search_deflate=no'.
+Autosetup does not seem to offer this option, so implement real option.
+
+Note that configuring sqlite without zlib is virtually impossible zlib
+normally gets into the system with toolchain. So the only option is to
+configure it out.
+
+This change is being done for Yocto project, where it's currently
+important to avoid additional dependencies having to restore chain of
+dependencies in "restore build from cache" scenario.
+
+Note about upstream status:
+Submitting patches to sqlite is problematic because of their policy of
+public domain declaration.
+This patch or a at least request to make zlib dependency optional
+should be submitted to their forum, however I was not able to register
+there.
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Upstream-Status: Inappropriate [oe-specific]
+---
+ autosetup/sqlite-config.tcl | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
+index 85fe414382..77190a7053 100644
+--- a/autosetup/sqlite-config.tcl
++++ b/autosetup/sqlite-config.tcl
+@@ -274,6 +274,14 @@ proc sqlite-configure {buildMode configScript} {
+       }
+     }
+ 
++    # Other options for CLI shell
++    cli-shell {
++      {*} {
++        zlib=1
++          => {Disable zlib support}
++      }
++    }
++
+     # Options for ICU: International Components for Unicode
+     icu {
+       {*} {
+@@ -641,7 +649,7 @@ proc sqlite-check-common-system-deps {} {
+     string.h strings.h \
+     inttypes.h
+ 
+-  if {[cc-check-includes zlib.h] && [proj-check-function-in-lib deflate z]} {
++  if {[opt-bool zlib] && [cc-check-includes zlib.h] && [proj-check-function-in-lib deflate z]} {
+     # TODO? port over the more sophisticated zlib search from the fossil auto.def
+     define HAVE_ZLIB 1
+     define LDFLAGS_ZLIB -lz
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
deleted file mode 100644
index bd2ac6614d8..00000000000
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
-
diff --git a/meta/recipes-support/sqlite/sqlite3_3.50.4.bb b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
new file mode 100644
index 00000000000..b822d7e919c
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[sha256sum] = "a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18"
+
+SRC_URI += "file://0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch"
+SRC_URI += "file://0002-Add-option-to-disable-zlib.patch"

