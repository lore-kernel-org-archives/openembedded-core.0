Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C734E7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 09:18:45 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.13178.1736759921677373199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 01:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dZYU0Gb6;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso5383415a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 01:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736759920; x=1737364720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ujZiDzZuScxwn5FaMkgAAXcnXQUwMoWfQjHWwt8Iqk=;
        b=dZYU0Gb6hdSOSSMbBeL+TLbO6XV4HQPuHEpVsnHDXmLZ+ZCywVVAO1ml8tEGFWW+Hp
         IVErlBqnM0FlRwr+KS+FDzMd8/+KxglFMkTEwDJaoQOAvmJvngC4dp6thjtgwKFjx1T4
         i+FDXD0WWCOq9bHdNR/kV1yVvka3J0tN+UELJGuqCE9yuhMvjQGMBjPMoMhHXtx8qt9V
         /RePvgWmiWecjkbGwyKW937yOMBw67YH671yyZLJEsOcQfRQr8R/xCYXhTwU8wjY++sV
         CNOy8cesTlyOlmnwT0hzezvR5dOZsJxPvTRgGtK0iwjRONmwRg7sC9hF7MJnV77Lycdd
         p6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736759920; x=1737364720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ujZiDzZuScxwn5FaMkgAAXcnXQUwMoWfQjHWwt8Iqk=;
        b=C7ImMNPOF0Hy27n/bWSuqFvgxB0LIC34A2I3un5VqivDx+3WkrNdsquM1n7xwBkPoc
         07w8WA5GvUGHculxtA9kWojaWgLdR0qwJO2/tUrAxaVKyfs79rhHGl+SSpZUvqdcX/Og
         IwNGwXrJfIIzMFrS1zPHANqFbEaoc5flQ1WXCqzfiF7bCaE28DBigQniI1uzMp7yEMzx
         QrpKgJl5x7KXlt7BJ7XZ9iTF69tC3qFOZ7AenIkmxB8LaxK4izcUbqKI4sfUJ28asQQw
         yunMD/cLuh3r8kve+dybWNEYu8drH4lasY4U5L+Vc96gQ3RBxBTkUqkS3Zv/iYzrRWRR
         D9TQ==
X-Gm-Message-State: AOJu0YwVtz7LproddJw4cTntzS6XY4dnhoClnbCsOvyGvUoHCWaU6zub
	2DHq3pJWBd+uHkF3wQIe04qkOo2uP2dU/P5IG/tkNjiatHzYM4vSsAB38A==
X-Gm-Gg: ASbGncvPlTtUXgyWWYIVLRHQyw7nLSFd94qsq+Fa9Sh+AyNmZW4msH8S6u6KgfAHy6A
	VmJ8IHTcBsajW7LWv0EoY9Kyz/7t1VNZa8gShjA7vUs66tsm1NJYZZvw0NgyPhNnkADA85llqjU
	K+cSpxibDKrtDAKcISygaM/e7Q7nYEv/wWjPX9dDP74Y0XBEFDbWkAx8sHhGp57JK7CFY77Gepu
	iNR8jDWMWse9N76IpB5Wul1wnsT2AGJhq+O0l/4iNAfrEW5IBHTc1x30eOuLiOwjg==
X-Google-Smtp-Source: AGHT+IGZnAlz9rOzANN8hTf1hH85TxodQ6IECOM2Lc60PRxz7wcPFjSYUzYNeG/OTfgIa9snE8AWFA==
X-Received: by 2002:a17:90b:35c7:b0:2ee:e961:303d with SMTP id 98e67ed59e1d1-2f548f3f994mr28481396a91.35.1736759920506;
        Mon, 13 Jan 2025 01:18:40 -0800 (PST)
Received: from L-18010.kpit.com ([49.36.50.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5594512f0sm7418509a91.36.2025.01.13.01.18.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:18:40 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][kirkstone][PATCH] poky: Remove True option to getVar calls
Date: Mon, 13 Jan 2025 14:48:32 +0530
Message-Id: <20250113091832.82071-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 09:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209703

getVar() now defaults to expanding by default, thus remove the True
option from getVar() calls with a regex search and replace.

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-poky/classes/poky-sanity.bbclass                |  6 +++---
 meta/classes/rust-bin.bbclass                        | 12 ++++++------
 .../rust/rust-cross-canadian-common.inc              |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-poky/classes/poky-sanity.bbclass b/meta-poky/classes/poky-sanity.bbclass
index 81cd2eb6a6..a068c7368c 100644
--- a/meta-poky/classes/poky-sanity.bbclass
+++ b/meta-poky/classes/poky-sanity.bbclass
@@ -1,8 +1,8 @@
 # Provide some extensions to sanity.bbclass to handle poky-specific conf file upgrades
 
 python poky_update_bblayersconf() {
-    current_version = int(d.getVar('POKY_BBLAYERS_CONF_VERSION', True) or -1)
-    latest_version = int(d.getVar('REQUIRED_POKY_BBLAYERS_CONF_VERSION', True) or -1)
+    current_version = int(d.getVar('POKY_BBLAYERS_CONF_VERSION') or -1)
+    latest_version = int(d.getVar('REQUIRED_POKY_BBLAYERS_CONF_VERSION') or -1)
     if current_version == -1 or latest_version == -1:
         # one or the other missing => malformed configuration
         raise NotImplementedError("You need to update bblayers.conf manually for this version transition")
@@ -11,7 +11,7 @@ python poky_update_bblayersconf() {
 
     # check for out of date templateconf.cfg file
     lines = []
-    fn = os.path.join(d.getVar('TOPDIR', True), 'conf/templateconf.cfg')
+    fn = os.path.join(d.getVar('TOPDIR'), 'conf/templateconf.cfg')
 
     lines = sanity_conf_read(fn)
     index, meta_yocto_line = sanity_conf_find_line(r'^meta-yocto/', lines)
diff --git a/meta/classes/rust-bin.bbclass b/meta/classes/rust-bin.bbclass
index c87343b3cf..360885cb8b 100644
--- a/meta/classes/rust-bin.bbclass
+++ b/meta/classes/rust-bin.bbclass
@@ -49,14 +49,14 @@ def relative_rpaths(paths, base):
         relpaths.add(os.path.join('$ORIGIN', os.path.relpath(p, base)))
     return '-rpath=' + ':'.join(relpaths) if len(relpaths) else ''
 
-RUST_LIB_RPATH_FLAGS ?= "${@relative_rpaths(d.getVar('RUST_RPATH_ABS', True), d.getVar('rustlibdest', True))}"
-RUST_BIN_RPATH_FLAGS ?= "${@relative_rpaths(d.getVar('RUST_RPATH_ABS', True), d.getVar('rustbindest', True))}"
+RUST_LIB_RPATH_FLAGS ?= "${@relative_rpaths(d.getVar('RUST_RPATH_ABS'), d.getVar('rustlibdest'))}"
+RUST_BIN_RPATH_FLAGS ?= "${@relative_rpaths(d.getVar('RUST_RPATH_ABS'), d.getVar('rustbindest'))}"
 
 def libfilename(d):
-    if d.getVar('CRATE_TYPE', True) == 'dylib':
-        return d.getVar('LIBNAME', True) + '.so'
+    if d.getVar('CRATE_TYPE') == 'dylib':
+        return d.getVar('LIBNAME') + '.so'
     else:
-        return d.getVar('LIBNAME', True) + '.rlib'
+        return d.getVar('LIBNAME') + '.rlib'
 
 def link_args(d, bin):
     linkargs = []
@@ -64,7 +64,7 @@ def link_args(d, bin):
         rpaths = d.getVar('RUST_BIN_RPATH_FLAGS', False)
     else:
         rpaths = d.getVar('RUST_LIB_RPATH_FLAGS', False)
-        if d.getVar('CRATE_TYPE', True) == 'dylib':
+        if d.getVar('CRATE_TYPE') == 'dylib':
             linkargs.append('-soname')
             linkargs.append(libfilename(d))
     if len(rpaths):
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index df4901f1fa..00dab306cb 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -42,8 +42,8 @@ export WRAPPER_TARGET_LDFLAGS = "${TARGET_LDFLAGS}"
 export WRAPPER_TARGET_AR = "${TARGET_PREFIX}ar"
 
 python do_configure:prepend() {
-    targets = [d.getVar("TARGET_SYS", True), "{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
-    hosts = ["{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
+    targets = [d.getVar("TARGET_SYS"), "{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH"))]
+    hosts = ["{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH"))]
 }
 
 INSANE_SKIP:${RUSTLIB_TARGET_PN} = "file-rdeps arch ldflags"
-- 
2.25.1


