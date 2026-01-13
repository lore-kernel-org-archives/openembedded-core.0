Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8F6D29DFA
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:51:40 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55720.1768297895781215554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 01:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dPdL5ei7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768297896; x=1799833896;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ATKnIun4K+TUR1b1xwrqiCK1KSIhR9J/aG0xz1h5fA8=;
  b=dPdL5ei7MrkomhIfHv+HsxUXyg4mvLYPnQymgmiy5IzrsiwNUin8Qv0m
   8jNC4HiSjWk0wT5xV5pxNb1+JWDzYPojHowu3ZjHKzOud/UkxurEn6Ygi
   CQxXp6maRMsY06t8otBRZ6kGlZh/keetrTokz6dWONk6fGJCsp5hRTcK+
   3F/EeQqeKf4YL86drYeyBModGEwmSv2wJAFyHb6TdgWbfnMs5ARjlsa6O
   J4HGoVK61bAeSbYFAJouy84hinfuHoTpZItvEuWAiA4mlw1rpTFniwkNg
   Z8iFwvxwdA+5Vakbe+8eMp0LISIdx5j8Jfj9OX1SNBW+vxwzD9d5Lsl8D
   w==;
X-CSE-ConnectionGUID: BFUKFP0UTy+38UGk932fMw==
X-CSE-MsgGUID: sDIUBlZxQU2B+bAs9XA5KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225592343"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225592343"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:51:34 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1CBC21002B85
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:51:34 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C4D231801FF3
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:51:33 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 78F2A826FF4
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:51:31 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libcap-ng: upgrade 0.8.5 -> 0.9
Date: Tue, 13 Jan 2026 17:51:09 +0800
Message-ID: <20260113095109.8693-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229237

1. Changelog
  https://github.com/stevegrubb/libcap-ng/releases/tag/v0.9

2. Drop file://0001-Fix-python-path-when-invoking-py-compile-54.patch as it was merged upstream.

3. Add pkgconfig to solve following configure error:
 ../sources/libcap-ng-0.9/configure: line 14862: syntax error near unexpected token `LIBBPF,libbpf,'
 ../sources/libcap-ng-0.9/configure: line 14862: `PKG_CHECK_MODULES(LIBBPF,libbpf,'

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...hon-path-when-invoking-py-compile-54.patch | 34 -------------------
 ...ython_0.8.5.bb => libcap-ng-python_0.9.bb} |  0
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  8 ++---
 .../{libcap-ng_0.8.5.bb => libcap-ng_0.9.bb}  |  0
 4 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.5.bb => libcap-ng-python_0.9.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.5.bb => libcap-ng_0.9.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch b/meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
deleted file mode 100644
index a0452ad53d..0000000000
--- a/meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1fe7c1cfeea00ba4eb903fbb39b74361594d4835 Mon Sep 17 00:00:00 2001
-From: Jan Palus <jpalus@fastmail.com>
-Date: Wed, 10 Apr 2024 21:30:51 +0200
-Subject: [PATCH] Fix python path when invoking py-compile (#54)
-
-48eebb2 replaced custom PYTHON3 variable with PYTHON by using standard
-AM_PATH_PYTHON macro. Makefile however still referred to old one.
-There's no need to set PYTHON explicitly anymore so drop it.
-
-Fixes #53
-
-Upstream-Status: Backport
-[https://github.com/stevegrubb/libcap-ng/commit/1fe7c1cfeea00ba4eb903fbb39b74361594d4835]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- bindings/python3/Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/bindings/python3/Makefile.am b/bindings/python3/Makefile.am
-index 70a1dd8..6072fc2 100644
---- a/bindings/python3/Makefile.am
-+++ b/bindings/python3/Makefile.am
-@@ -27,7 +27,6 @@ AM_CPPFLAGS = -I. -I$(top_builddir) $(PYTHON3_INCLUDES)
- LIBS = ${top_builddir}/src/libcap-ng.la
- SWIG_FLAGS = -python
- SWIG_INCLUDES = ${AM_CPPFLAGS}
--PYTHON = $(PYTHON3)
- pyexec_PYTHON = capng.py
- pyexec_LTLIBRARIES = _capng.la
- pyexec_SOLIBRARIES = _capng.so
--- 
-2.25.1
-
diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index ed8712bf2b..632527eb12 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -7,12 +7,10 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master \
-           file://0001-Fix-python-path-when-invoking-py-compile-54.patch \
-           "
-SRCREV = "f5d39702622208b3ada064d7b2eaeaf1454c9bd3"
+SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "6ab1fe90fc24fcc1ed4ced635eb20166bcf00023"
 
-inherit lib_package autotools
+inherit lib_package autotools pkgconfig
 
 do_configure:prepend() {
     touch ${S}/NEWS
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.bb
-- 
2.43.0


