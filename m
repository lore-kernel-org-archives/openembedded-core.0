Return-Path: <hws@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4830AC636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 10:00:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.7180.1675418426435029918
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 02:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=uH+Iv4dm;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: hws@denx.de)
Received: from maia.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hws@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D738385EC0;
	Fri,  3 Feb 2023 11:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1675418420;
	bh=82QUQtYthLftjAWmTFM1F6P7fQfDwXgczuQ4fU7ksXM=;
	h=From:To:Cc:Subject:Date:From;
	b=uH+Iv4dmPRJMbiECJE892TafzuBLAmjrqgXHJGIoRRL+bOuEEfLYGmkataQou36Gj
	 PfBB6JFZAbdrzwP/vzgBeIHfDBb3wd2qkhr075x9wNEF/Aai0WYMBwI7Hiu8zXFhh2
	 qUCjuwN2MpSJwpNtxs4dUiTtdp4UzvggUhhEGqjjRwVxUaBu/ZA9zes1isF2voshcA
	 kTQN6ilMAj4K6DeICqsJNY3tgC7mqD3Ikt6uYS0BeuYoPn6kKLXFmQFofEvVZnDOZS
	 DjogmEDHDEm6Ho5Y9/ign/Ye9w5MJZoRtl4ST5aeLlyzZPXZXxXoxN9RNR4UjsjsC3
	 uQracd152BouQ==
From: Harald Seiler <hws@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Harald Seiler <hws@denx.de>
Subject: [PATCH] bootchart2: Fix usrmerge support
Date: Fri,  3 Feb 2023 10:59:51 +0100
Message-Id: <20230203095951.535898-1-hws@denx.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 10:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176713

bootchart2 introduced a variable EARLY_PREFIX for supporting systems
with usrmerge [1].  Right now, the recipe here is sidestepping this
feature and trying to replicate it by overwriting other variables and
even patching the sources.  This wasn't enough, however, as there are
still problems:  For example, some setup code in the bootchart-collector
fails because it expects EARLY_PREFIX to be used [2].

Cleanup the recipe to set EARLY_PREFIX and remove the other workarounds.

[1]: https://github.com/xrmx/bootchart/commit/56a638ace1d172163b6d636c898=
92446b8add4b6
[2]: https://github.com/xrmx/bootchart/blob/3d2136d0335718fbe1a8e2370ccbc=
30123a6e593/collector/collector.c#L670-L672

Fixes: 4157600d3122 ("bootchart2: switch to add patch from change source =
in do_install")
Signed-off-by: Harald Seiler <hws@denx.de>
---
 .../0001-bootchart2-support-usrmerge.patch    | 37 -------------------
 .../bootchart2/bootchart2_0.14.9.bb           | 11 ++----
 2 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-boot=
chart2-support-usrmerge.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-=
support-usrmerge.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001=
-bootchart2-support-usrmerge.patch
deleted file mode 100644
index 88597cf3a9..0000000000
--- a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support=
-usrmerge.patch
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
- PY_SITEDIR ?=3D $(PY_LIBDIR)/site-packages
- LIBC_A_PATH =3D /usr$(LIBDIR)
- # Always lib, even on systems that otherwise use lib64
--SYSTEMD_UNIT_DIR =3D $(EARLY_PREFIX)/lib/systemd/system
-+SYSTEMD_UNIT_DIR ?=3D $(EARLY_PREFIX)/lib/systemd/system
- COLLECTOR =3D \
- 	collector/collector.o \
- 	collector/output.o \
-@@ -99,7 +99,7 @@ install-chroot:
- 	install -d $(DESTDIR)$(PKGLIBDIR)/tmpfs
-=20
- install-collector: all install-chroot
--	install -m 755 -D bootchartd $(DESTDIR)$(EARLY_PREFIX)/sbin/$(PROGRAM_=
PREFIX)bootchartd$(PROGRAM_SUFFIX)
-+	install -m 755 -D bootchartd $(DESTDIR)${BASE_SBINDIR}/$(PROGRAM_PREFI=
X)bootchartd$(PROGRAM_SUFFIX)
- 	install -m 644 -D bootchartd.conf $(DESTDIR)/etc/$(PROGRAM_PREFIX)boot=
chartd$(PROGRAM_SUFFIX).conf
- 	install -m 755 -D bootchart-collector $(DESTDIR)$(PKGLIBDIR)/$(PROGRAM=
_PREFIX)bootchart$(PROGRAM_SUFFIX)-collector
-=20
---=20
-2.7.4
-
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta=
/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index b4d5b7cd9b..297dbfb578 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -93,7 +93,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+(\.\d+=
)*)"
 SRC_URI =3D "git://github.com/xrmx/bootchart.git;branch=3Dmaster;protoco=
l=3Dhttps \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch=
 \
-           file://0001-bootchart2-support-usrmerge.patch \
            file://0001-bootchartd.in-make-sure-only-one-bootchartd-proce=
ss.patch \
            file://0001-Do-not-include-linux-fs.h.patch \
           "
@@ -120,12 +119,11 @@ UPDATERCPN =3D "bootchartd-stop-initscript"
 INITSCRIPT_NAME =3D "bootchartd_stop.sh"
 INITSCRIPT_PARAMS =3D "start 99 2 3 4 5 ."
=20
-EXTRA_OEMAKE =3D 'BASE_SBINDIR=3D"${base_sbindir}"'
-
 do_compile:prepend () {
     export PY_LIBDIR=3D"${libdir}/${PYTHON_DIR}"
     export BINDIR=3D"${bindir}"
-    export LIBDIR=3D"${base_libdir}"
+    export LIBDIR=3D"/${baselib}"
+    export EARLY_PREFIX=3D"${root_prefix}"
 }
=20
 do_install () {
@@ -133,9 +131,8 @@ do_install () {
     export PY_LIBDIR=3D"${libdir}/${PYTHON_DIR}"
     export BINDIR=3D"${bindir}"
     export DESTDIR=3D"${D}"
-    export LIBDIR=3D"${base_libdir}"
-    export PKGLIBDIR=3D"${base_libdir}/bootchart"
-    export SYSTEMD_UNIT_DIR=3D"${systemd_system_unitdir}"
+    export LIBDIR=3D"/${baselib}"
+    export EARLY_PREFIX=3D"${root_prefix}"
=20
     oe_runmake install NO_PYTHON_COMPILE=3D1
     install -d ${D}${sysconfdir}/init.d
--=20
2.39.1


