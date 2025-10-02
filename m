Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D33ECAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 21:17:53 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.1.1759439870625207464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 14:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=DNw4FcmR;
 spf=pass (domain: inovex.de, ip: 209.85.128.41, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46b303f7469so10170655e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 14:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google; t=1759439869; x=1760044669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/5ve587BqYOrgAU3/i1MwGNIaGzNifCfPhv22Oa9gQ=;
        b=DNw4FcmRqQChUkFeevcqNvWSGE0Nxe4W3cMmcBXIiQEcV7aoJ0EpkIxoHYBH8Ka4FO
         RJZ/qroxhVZCfSGKFmul2VEJoTzr68VIM54N4Da0veO/+lJjQf9acFcrJpUO1baeSYAY
         7TjgZNcPiL7VyW/eRZPL1T5vBWTgGvTgmPPT+pyMhBVF+vZwyXAHLV7HuYEe/w1aSyiU
         alOALkiYCDW7xhTtkNrufokr9x5ANsHh8+D8Jy9GTrrROPnCjhr5v/oqkEKs5jExSpiu
         bT/B+ZnuFFDDxAy6TM7loQkCYsMYo6wNMe6kcsrprdJiIMEeJisfW6jckcUIed/pMEMg
         wFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759439869; x=1760044669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/5ve587BqYOrgAU3/i1MwGNIaGzNifCfPhv22Oa9gQ=;
        b=htFps8o0B1nInVyLyaXxKqp56Tkt/t5xVIWk5bphmCUXQsGhL9Omukswph1Oralj7p
         CYeJuQYgE2RWTsPoyCIeSQGcJjakG3JPjq4XP2aFlfG0wrRV2ZjQ00kaZEugzCNEZ9Sj
         +MxUJ8ihtSiH5k83iKiwJwmZ9TP3Nerst3LQ02Yc7WuNUzWpinSyCFKWTiyCOaaHeWV1
         LGY5SzipKbbvY1b0uo/CGZkQTj6fAt0CBYlKUEs6hTh4RQpJ1DtZ1abc4qYLnyrkg/o0
         mKyALjzMtThYmTAPtJPOp22CumL5PKS6qpmUjqpDUGy5Y211hjRlBy8DXUmREkUwaxjH
         JEGA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9z5VJStgFxP0cwVXnB1Px7aSjWVIA2ihmepiqVzJq01/8WmdmWKx+xZwaHEVzFC7dA2osQLN195IHgcPjBjqKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxE8GthUw4b1+mPYgMENiAEJy7lifVl0+Vqqjpcb4l4F9H2DZ7g
	AWSc6Gn3rxXODlMhuGF815lAfWqLj1/vB1y0+8zYFXhfKTwGRBIW4Rh5wZi2UaJ1TIk=
X-Gm-Gg: ASbGnct0yRjUZmY9d3JyLVZkQQegVVvqtSdnT1i/kErG4wXqSepmGNOXxCoV5hr58c5
	V+JnY5M8QF8rhHsUiIr60MHtkY0nY3FYhSWrz2/8cMOwYeS9yMmzJBQeLFWlQyVzV6X2ivqOrgW
	QSuao85PAMornb36UxpUR2cb72v2c4fBDdC2eSOYEXeOwLmSNEZoPDqYYWC3wrMdCSGNpD1uHRn
	VDoJkQQ8CScAgD3L4ANd6+H0LWtvIySPJd64QLR+z5XxQG3HuAmpeImnDoVLKusG1qWgSRJz+v+
	n0rNbBtViHv7Lau5xoyWGL5uJmKYKgeY+o3E0y4uHizRH9BiFZzLUQ9VgyBaMAUF0Xl61h2DT/C
	p7emZW/CUQC59YnXDNHpGwzeGSOFeAsBhm44GhTTm923C6JqOCC+dLT2Qen54QkI=
X-Google-Smtp-Source: AGHT+IEuj1VsKtmc0jKj1DWtbEINBnJGqHohXgyzuhvIQNoz6C6Re45tdWH1Xx/XzbPh0WQxBedJSQ==
X-Received: by 2002:a05:600c:4f92:b0:46e:3e25:1626 with SMTP id 5b1f17b1804b1-46e7113ffa9mr3973035e9.19.1759439868922;
        Thu, 02 Oct 2025 14:17:48 -0700 (PDT)
Received: from Phoenix.fritz.box ([2001:4091:a244:82ce:c612:ad15:829:ca8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c4c0321sm61909615e9.8.2025.10.02.14.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:17:48 -0700 (PDT)
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
To: alex.kanavin@gmail.com,
	openembedded-core@lists.openembedded.org
Cc: denis@denix.org,
	mathieu.dubois-briand@bootlin.com,
	Anna-Lena Marx <anna-lena.marx@inovex.de>
Subject: [PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
Date: Thu,  2 Oct 2025 23:17:44 +0200
Message-ID: <20251002211744.3418535-1-anna-lena.marx@inovex.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 21:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224383

With the upgrade to 3.50.4, some configure options changed
as the project switched from `autotools` to `autosetup`.
The PACKAGECONFIG "dyn_ext" is not longer available.
Besides, the default CONFIGUREOPTS "target", "exec_prefix"
and "oldincludedir" became invalid.

Changelog: https://sqlite.org/releaselog/3_50_4.html

Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
---
 meta/recipes-support/sqlite/sqlite3.inc       | 15 +++--
 ...eenable-disable-rpath-configure-flag.patch | 57 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |  8 ---
 meta/recipes-support/sqlite/sqlite3_3.50.4.bb | 10 ++++
 4 files changed, 78 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/0001-backport-reenable-disable-rpath-configure-flag.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.48.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.50.4.bb

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 28a33282ae..a0d6a53ad7 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -23,8 +23,8 @@ CVE_PRODUCT = "sqlite"
 inherit autotools pkgconfig siteinfo
 
 # enable those which are enabled by default in configure
-PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext"
-PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
+PACKAGECONFIG ?= "fts4 fts5 rtree"
+PACKAGECONFIG:class-native ?= "fts4 fts5 rtree"
 
 PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
@@ -33,15 +33,22 @@ PACKAGECONFIG[fts4] = "--enable-fts4,--disable-fts4"
 PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"
 PACKAGECONFIG[rtree] = "--enable-rtree,--disable-rtree"
 PACKAGECONFIG[session] = "--enable-session,--disable-session"
-PACKAGECONFIG[dyn_ext] = "--enable-dynamic-extensions,--disable-dynamic-extensions"
 PACKAGECONFIG[zlib] = ",,zlib"
 
 CACHED_CONFIGUREVARS += "${@bb.utils.contains('PACKAGECONFIG', 'zlib', '', 'ac_cv_search_deflate=no',d)}"
 
+# The configure options target, exec_prefix and oldincludedir
+# are not supported by sqlite3 anymore.
+CONFIGUREOPTS:remove = "--target=${TARGET_SYS}"
+CONFIGUREOPTS:remove = "--exec_prefix=${exec_prefix}"
+CONFIGUREOPTS:remove = "--oldincludedir=${includedir}"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-threadsafe \
     --disable-static-shell \
+    --soname=legacy \
+    --disable-rpath \
 "
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
@@ -51,7 +58,7 @@ CFLAGS += "-DUSE_PREAD"
 CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
 
 # Unless SQLITE_BYTEORDER is predefined, the code falls back to build time
-# huristics, which are not always correct
+# heuristics, which are not always correct
 CFLAGS += "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLITE_BYTEORDER=1234', '-DSQLITE_BYTEORDER=4321', d)}"
 
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
diff --git a/meta/recipes-support/sqlite/sqlite3/0001-backport-reenable-disable-rpath-configure-flag.patch b/meta/recipes-support/sqlite/sqlite3/0001-backport-reenable-disable-rpath-configure-flag.patch
new file mode 100644
index 0000000000..cfb0119233
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/0001-backport-reenable-disable-rpath-configure-flag.patch
@@ -0,0 +1,57 @@
+From 45ab3ac5efa7c08ba5ce3564a86bd348380ce70f Mon Sep 17 00:00:00 2001
+From: Anna-Lena Marx <anna-lena.marx@inovex.de>
+Date: Thu, 2 Oct 2025 20:30:08 +0200
+Subject: [PATCH] backport: reenable --disable-rpath configure flag
+
+Reenable support for `--disable-rpath`.
+This patch is backported and will be obsolete for version 3.51.
+
+Upstream-Status: Backport (https://sqlite.org/src/info/a59d9bb25e518f5d)
+Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
+---
+ autosetup/sqlite-config.tcl | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
+index 85fe414..faff00b 100644
+--- a/autosetup/sqlite-config.tcl
++++ b/autosetup/sqlite-config.tcl
+@@ -334,8 +334,7 @@ proc sqlite-configure {buildMode configScript} {
+           => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
+       }
+       {canonical autoconf} {
+-        # A potential TODO without a current use case:
+-        #rpath=1 => {Disable use of the rpath linker flag}
++        rpath=1 => {Disable use of the rpath linker flag}
+         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
+         soname:=legacy
+           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
+@@ -2119,7 +2118,6 @@ proc sqlite-handle-tcl {} {
+ ########################################################################
+ # Handle the --enable/disable-rpath flag.
+ proc sqlite-handle-rpath {} {
+-  proj-check-rpath
+   # autosetup/cc-shared.tcl sets the rpath flag definition in
+   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
+   # rather than as a compiler check. Though we should do a proper
+@@ -2128,12 +2126,14 @@ proc sqlite-handle-rpath {} {
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
++
++  }
+ }
+ 
+ ########################################################################
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
deleted file mode 100644
index bd2ac6614d..0000000000
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
index 0000000000..5e55c7877a
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://0001-backport-reenable-disable-rpath-configure-flag.patch \
+           "
+SRC_URI[sha256sum] = "a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18"
+
-- 
2.51.0


