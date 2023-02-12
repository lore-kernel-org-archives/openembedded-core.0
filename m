Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF6FC64ED6
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:43 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.12.1676236285844440022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tFTYOlhZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id r8so11655650pls.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THLRCelePnaYSyvnR7XLw5Qr9ygbFpRyI3u/kxzPEOQ=;
        b=tFTYOlhZzYxGOmbDC9g5sLT+2mEipKE/vbk81FHhGyaBFKedUwdhF5ww9Lthw3vTVp
         Xnxr9D5yrZEU6pEWx+xs84XQ/k43w7vnEeRLIGGQf4bLNRcoaAwUJzkhiNfWrmcypR2N
         6e69lfJBEn2aYJuWMOwyoHFQMb3OuPiR6sKFSzsIiV7QEaAj/9B8fdkIO5LaYXTWghs+
         OhC4Yl3ukUNuEnzXegFWdyVA4nrbWoijKeK+wO1I24PsmiMDcWZq0hUTCcAoKkFPKskh
         GItP4mYOOGJaJ0C1OIgpujJajHcRrcezp4s2eNm8o5VF7QYZZKtc8swdRWCMffXjDhHn
         6Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THLRCelePnaYSyvnR7XLw5Qr9ygbFpRyI3u/kxzPEOQ=;
        b=4RU0/njes8zX9OmiZ1ESZij/8SaSoha3bq2v1p4vI7o4dkmA7znNp+d3iKvFTEeGgB
         odYWeijDfD1tI8ZIGHCijruXE6IMArYADd+RmBfl9J52rB+tMlz8DYfoGaSzesvG1GVa
         XFW5R6WgxDHjm2rp1wqnR3Ri1WRfx0cCCYlX6jhIeclJIoouqc+XFuo40nAU5+qikgeD
         axxsWgs/sJ0gIvxyhWUUBBvOnDW7b6gNen+BMABBmgLyCmliLy/s+Fx6KydSSG8W1p9k
         7GBCfHBqkTx5y1YWaudG6bV9E3GJ3AQfqoEwGZjRbuUgH7icR/9q7cB09h9SRq78ONaZ
         ohKg==
X-Gm-Message-State: AO0yUKXZF+I+sRcAA+EdDlErRHWiG+PQ0smmvl4THcF5efaI104pbFZA
	3fhgTgCj4znj4Uqxeam6xkCsZkDLlI/tW1lPGp8=
X-Google-Smtp-Source: AK7set9k6hxfcN3ElXLwPbIxwIZ5YdMXfBK04w6BSxKyiXQ7GQY/9kAw+KlUHT90Wpt8Fxy1bnAR9A==
X-Received: by 2002:a17:903:1384:b0:198:e39a:b9c6 with SMTP id jx4-20020a170903138400b00198e39ab9c6mr17212629plb.23.1676236295817;
        Sun, 12 Feb 2023 13:11:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/27] bootchart2: Fix usrmerge support
Date: Sun, 12 Feb 2023 11:10:40 -1000
Message-Id: <5d2e5abd098ae0b4f904cd7270daa1eb61708fa6.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177067

From: Harald Seiler <hws@denx.de>

bootchart2 introduced a variable EARLY_PREFIX for supporting systems
with usrmerge [1].  Right now, the recipe here is sidestepping this
feature and trying to replicate it by overwriting other variables and
even patching the sources.  This wasn't enough, however, as there are
still problems:  For example, some setup code in the bootchart-collector
fails because it expects EARLY_PREFIX to be used [2].

Cleanup the recipe to set EARLY_PREFIX and remove the other workarounds.

[1]: https://github.com/xrmx/bootchart/commit/56a638ace1d172163b6d636c89892446b8add4b6
[2]: https://github.com/xrmx/bootchart/blob/3d2136d0335718fbe1a8e2370ccbc30123a6e593/collector/collector.c#L670-L672

Fixes: 4157600d3122 ("bootchart2: switch to add patch from change source in do_install")
Signed-off-by: Harald Seiler <hws@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7031bc65b10040877392ed774a0cdddef85c12e0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-bootchart2-support-usrmerge.patch    | 37 -------------------
 .../bootchart2/bootchart2_0.14.9.bb           | 11 ++----
 2 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch
deleted file mode 100644
index 88597cf3a9..0000000000
--- a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b6d1a1ff2de363b1b76c8c70f77ae56a4e4d4b56 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 5 Sep 2019 18:37:31 +0800
-Subject: [PATCH] bootchart2: support usrmerge
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 1cc2974..f988904 100644
---- a/Makefile
-+++ b/Makefile
-@@ -36,7 +36,7 @@ endif
- PY_SITEDIR ?= $(PY_LIBDIR)/site-packages
- LIBC_A_PATH = /usr$(LIBDIR)
- # Always lib, even on systems that otherwise use lib64
--SYSTEMD_UNIT_DIR = $(EARLY_PREFIX)/lib/systemd/system
-+SYSTEMD_UNIT_DIR ?= $(EARLY_PREFIX)/lib/systemd/system
- COLLECTOR = \
- 	collector/collector.o \
- 	collector/output.o \
-@@ -99,7 +99,7 @@ install-chroot:
- 	install -d $(DESTDIR)$(PKGLIBDIR)/tmpfs
- 
- install-collector: all install-chroot
--	install -m 755 -D bootchartd $(DESTDIR)$(EARLY_PREFIX)/sbin/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX)
-+	install -m 755 -D bootchartd $(DESTDIR)${BASE_SBINDIR}/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX)
- 	install -m 644 -D bootchartd.conf $(DESTDIR)/etc/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX).conf
- 	install -m 755 -D bootchart-collector $(DESTDIR)$(PKGLIBDIR)/$(PROGRAM_PREFIX)bootchart$(PROGRAM_SUFFIX)-collector
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index b1628075a7..38a1c9d147 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -93,7 +93,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
-           file://0001-bootchart2-support-usrmerge.patch \
            file://0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch \
           "
 
@@ -119,12 +118,11 @@ UPDATERCPN = "bootchartd-stop-initscript"
 INITSCRIPT_NAME = "bootchartd_stop.sh"
 INITSCRIPT_PARAMS = "start 99 2 3 4 5 ."
 
-EXTRA_OEMAKE = 'BASE_SBINDIR="${base_sbindir}"'
-
 do_compile:prepend () {
     export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
     export BINDIR="${bindir}"
-    export LIBDIR="${base_libdir}"
+    export LIBDIR="/${baselib}"
+    export EARLY_PREFIX="${root_prefix}"
 }
 
 do_install () {
@@ -132,9 +130,8 @@ do_install () {
     export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
     export BINDIR="${bindir}"
     export DESTDIR="${D}"
-    export LIBDIR="${base_libdir}"
-    export PKGLIBDIR="${base_libdir}/bootchart"
-    export SYSTEMD_UNIT_DIR="${systemd_system_unitdir}"
+    export LIBDIR="/${baselib}"
+    export EARLY_PREFIX="${root_prefix}"
 
     oe_runmake install NO_PYTHON_COMPILE=1
     install -d ${D}${sysconfdir}/init.d
-- 
2.34.1


