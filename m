Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAA2C636D7
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:47 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.19561.1676150644242898900
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rtP7DN1T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id ea13so5672147pfb.13
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btP92xenkDRuvgEowNazQQPtJVsTKO0kg95Cg5wNWLI=;
        b=rtP7DN1TdRKXpv5+NlI2wNEr007TMh+dxMLIfh0Bnhz6+YXDAu/BViaKJcaawE/+dZ
         NREiSE6ZtKxrCXITb9a8wrZvb01CVfxrkz2kZEF3NHqry5DMNSRfhMokjAjJ5q2QEuLo
         xQGs+VNvYOgUB4hthMmVyyXAVsKFSHd0aioMf0D8RWdzRiNiZIhWI/jaYLf3lsAAPWjg
         AvvJFV1WCRkr8ExCTPrSqy+WuqU4GXypotfAZGVBGDwWfOI3DRcuF9ttTgzzGFuQjPja
         03a9h2tr3VQH/qDVUX9FZw//1X+WokC4djO/wvpcAxyyHhIH9yPUdsygTTiy6MOsfrep
         FsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btP92xenkDRuvgEowNazQQPtJVsTKO0kg95Cg5wNWLI=;
        b=3eX08zCGqqQN8jIsX4ga0IDOZavjvzIuix3n/RN/QfaRuqPnrJOBjTTLU+DPuc8jTf
         0Vs5q2+bmyO/DRhupDFg/LOOna1VOmNx/YJL47eaieEd8AeNjdOhR9QzPL7Bk6s5F+J2
         ZdSuBAvvIM/vZhOyvopq/oYZWmC/Xd8yalYlgaX/ixuS+FYkJ20SCiq/NwiFxSR9er48
         uIrVC0BhwKrhhUHf+LHV4u9Ur22KpRlQB2rLrxx0IAxgFnJEBpXqb8+nl0a54zhNJNa6
         c2jN01HuaxzhRoS7Y7CAM8vtpj0MnQatI4lW++ZRO9L9avoEeLp1XRxC3g1uqbKyLSnf
         yA5Q==
X-Gm-Message-State: AO0yUKU0DraQg45SWC8FTSBiw87JRWKgZX4z48dIQwiZqi65lyUvEa+G
	Bu2iNSJPqGvgeuxfHf0yWMLf0WN6snd1cUOKSko=
X-Google-Smtp-Source: AK7set8OuEP8iS35DG4b7G0wW8wfdb06g0f4PzBFCukueE9I49CN9S+TopgZ93fcgs+NFkxXbypq+w==
X-Received: by 2002:aa7:942e:0:b0:59b:3ee7:690a with SMTP id y14-20020aa7942e000000b0059b3ee7690amr14130046pfo.13.1676150680943;
        Sat, 11 Feb 2023 13:24:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 25/28] bootchart2: Fix usrmerge support
Date: Sat, 11 Feb 2023 11:23:48 -1000
Message-Id: <5e1dbd44d1aaaeaa9bca7d99ad21499cc57e21d3.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177035

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
index b4d5b7cd9b..297dbfb578 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -93,7 +93,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
-           file://0001-bootchart2-support-usrmerge.patch \
            file://0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch \
            file://0001-Do-not-include-linux-fs.h.patch \
           "
@@ -120,12 +119,11 @@ UPDATERCPN = "bootchartd-stop-initscript"
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
@@ -133,9 +131,8 @@ do_install () {
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


