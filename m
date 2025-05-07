Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8511C3ABC5
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 08:18:31 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.3698.1746605902251209108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 01:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GUxmHieb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250507081816e41e3202c08d602db3-l3ehgs@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250507081816e41e3202c08d602db3
        for <openembedded-core@lists.openembedded.org>;
        Wed, 07 May 2025 10:18:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BYusSMTIDue+mm/wEf3FqQkWlPe0yvfc55BFIbL5YpQ=;
 b=GUxmHieba0Srcy0eA6LQZdacEJQsPOKGAZCu+8ZlWur9rqw90iUuMeVPJu+qeE6g4AyGZJ
 jiQv9mBd5it2XBiwel/QCX0YxjqHL1J4B4zoaxAbTzm9YiUuoooU0WDXY8OeDfjIOMWJodWW
 kRjuK1swVY/2sBYKgO6QSRlbGpOUmK6V+IJsaKCCOkN1SKXBjzECH88b3l6LXGnu13pqvDPM
 DlA4si1YjfcqVWVKXqbUlwQlbu2aWUSDitvbPVZvIXeQugV8bqfs11i1045P/SBHgeSz04J+
 jP12fv2+unC+sVjh1SVcKtlLF+hyUldGjJ1tL078+8zZkkdNN6h2qf8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.49.1
Date: Wed,  7 May 2025 10:17:17 +0200
Message-Id: <20250507081717.287535-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 08:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216099

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
* clean B for do_configure as the new Makefiles do not seem to properly
  retrigger build if configuration changes
* use unstripped binaries for native (non-cross-compile) case

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: use --build=${BUILD_SYS} as an attemt to fix package installation

 meta/recipes-support/sqlite/sqlite3.inc       |  41 +++++--
 ...tically-fail-the-check-for-rpath-on-.patch | 102 ++++++++++++++++++
 .../{sqlite3_3.48.0.bb => sqlite3_3.49.1.bb}  |   3 +-
 3 files changed, 138 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/0001-configure-automatically-fail-the-check-for-rpath-on-.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.49.1.bb} (53%)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index d093ec5859..60e9c4f2c3 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -14,34 +14,37 @@ def sqlite_download_version(d):
 SQLITE_PV = "${@sqlite_download_version(d)}"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
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
+    --soname=${PV} \
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
diff --git a/meta/recipes-support/sqlite/sqlite3/0001-configure-automatically-fail-the-check-for-rpath-on-.patch b/meta/recipes-support/sqlite/sqlite3/0001-configure-automatically-fail-the-check-for-rpath-on-.patch
new file mode 100644
index 0000000000..0eaa06d908
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/0001-configure-automatically-fail-the-check-for-rpath-on-.patch
@@ -0,0 +1,102 @@
+From f9f6410c31de9f6b377c7d8cd6d56548d3f20551 Mon Sep 17 00:00:00 2001
+From: stephan <stephan@noemail.net>
+Date: Thu, 20 Feb 2025 17:15:37 +0000
+Subject: [PATCH] configure: automatically fail the check for rpath on AIX
+ systems and provide a --disable-rpath flag as a fallback for use on platforms
+ which pass the configure-time rpath check but then fail at link-time. Based
+ on discussion in [forum:ae5bd8a84b|forum thread ae5bd8a84b].
+
+FossilOrigin-Name: b6603986e621918525312130996c298135ad27af293df9bb9f99e1fc87844379
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/f9f6410c31de9f6b377c7d8cd6d56548d3f20551]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ auto.def                    |  2 +-
+ autosetup/proj.tcl          | 18 ++++++++++++++----
+ autosetup/sqlite-config.tcl | 14 ++++++++++++++
+ 3 files changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/auto.def b/auto.def
+index 9df87f579a..84dfa824c2 100644
+--- a/auto.def
++++ b/auto.def
+@@ -11,7 +11,7 @@ use sqlite-config
+ sqlite-config-bootstrap autoconf
+ sqlite-check-common-bins
+ sqlite-check-common-system-deps
+-proj-check-rpath
++sqlite-handle-rpath
+ sqlite-handle-soname
+ sqlite-setup-default-cflags
+ sqlite-handle-debug
+diff --git a/autosetup/proj.tcl b/autosetup/proj.tcl
+index 6a1960f603..6b49dcdae0 100644
+--- a/autosetup/proj.tcl
++++ b/autosetup/proj.tcl
+@@ -921,9 +921,20 @@ proc proj-check-emsdk {} {
+ #
+ # Achtung: we have seen platforms which report that a given option
+ # checked here will work but then fails at build-time, and the current
+-# order of checks reflects that.
++# order of checks reflects that. Similarly, platforms which are known
++# to report success here but fail to handle this flag at link-time are
++# special-cased here to behave as if the check failed.
+ proc proj-check-rpath {} {
+-  set rc 1
++  switch -glob -- [get-define host] {
++    *-*-aix* {
++      # Skip this check on platform(s) where we know it to pass at
++      # this step but fail at build-time, as a workaround for
++      # https://sqlite.org/forum/forumpost/ae5bd8a84b until we can
++      # find a more reliable approach.
++      define LDFLAGS_RPATH ""
++      return 0
++    }
++  }
+   if {[proj-opt-was-provided libdir]
+       || [proj-opt-was-provided exec-prefix]} {
+     set lp "[get-define libdir]"
+@@ -945,10 +956,9 @@ proc proj-check-rpath {} {
+       define LDFLAGS_RPATH "-Wl,-R$lp"
+     } else {
+       define LDFLAGS_RPATH ""
+-      set rc 0
+     }
+   }
+-  return $rc
++  expr {"" ne [get-define LDFLAGS_RPATH]}
+ }
+ 
+ ########################################################################
+diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
+index 7d9a9ea84b..be2522fb12 100644
+--- a/autosetup/sqlite-config.tcl
++++ b/autosetup/sqlite-config.tcl
+@@ -244,6 +244,9 @@ proc sqlite-config-bootstrap {buildMode} {
+         static-shell=1       => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
+       }
+       {*} {
++        # rpath: https://sqlite.org/forum/forumpost/fa3a6ed858
++        rpath=1
++          => {Disable checking for rpath support}
+         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
+         soname:=legacy
+           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
+@@ -644,6 +647,17 @@ proc sqlite-handle-debug {} {
+   }
+ }
+ 
++########################################################################
++# If the --disable-rpath flag is used, this [define]s LDFLAGS_RPATH to
++# an empty string, else it invokes [proj-check-rpath].
++proc sqlite-handle-rpath {} {
++  proj-if-opt-truthy rpath {
++    proj-check-rpath
++  } {
++    define LDFLAGS_RPATH ""
++  }
++}
++
+ ########################################################################
+ # "soname" for libsqlite3.so. See discussion at:
+ # https://sqlite.org/src/forumpost/5a3b44f510df8ded
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.49.1.bb
similarity index 53%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.49.1.bb
index bd2ac6614d..c3c0670884 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.49.1.bb
@@ -4,5 +4,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI[sha256sum] = "106642d8ccb36c5f7323b64e4152e9b719f7c0215acf5bfeac3d5e7f97b59254"
 
+SRC_URI += "file://0001-configure-automatically-fail-the-check-for-rpath-on-.patch"

