Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81209C25B10
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 12:55:54 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.18423.1714996101760854845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 04:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adriaan.schmidt@siemens.com header.s=fm1 header.b=qY3Y+Nxz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-526363-20240506114818e9d79306cc62af8408-8e0v5o@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240506114818e9d79306cc62af8408
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 May 2024 13:48:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adriaan.schmidt@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gy2/SXzmhNh5VOVgQvEkfYRhyDX4vihiotFNxhnjMX0=;
 b=qY3Y+NxzD0+/5BBvVURqNCGGpH4nr4jG0YoFGcYrYPl9wp/sc/m14IoteZfpj9x6kQxhIX
 cs5S1n07+ctikKuw3DFeaEyc62eU5q+ktY37jgfCk0MXDx9mvaSdhY0q0ckzK8rFiaxw0eY8
 /P2AMeasfWpjto1G5YA/vNwBZh/oE=;
From: "Adriaan Schmidt" <adriaan.schmidt@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adriaan Schmidt <adriaan.schmidt@siemens.com>
Subject: [OE-core][scarthgap][master][PATCH] libcgroup_3.1.0: fix build on non-systemd systems
Date: Mon,  6 May 2024 13:48:15 +0200
Message-Id: <20240506114815.138009-1-adriaan.schmidt@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-526363:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 12:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199042

backport upstream commit 592dcdcf243576bd2517d3da9bc18990de08e37e
to fix packaging when building with --enable-systemd=no

Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
---
 ...akefile-install-systemd.h-by-default.patch | 37 +++++++++++++++++++
 .../recipes-core/libcgroup/libcgroup_3.1.0.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch

diff --git a/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch b/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
new file mode 100644
index 0000000000..4b743f9b33
--- /dev/null
+++ b/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
@@ -0,0 +1,37 @@
+From 592dcdcf243576bd2517d3da9bc18990de08e37e Mon Sep 17 00:00:00 2001
+From: Kamalesh Babulal <kamalesh.babulal@oracle.com>
+Date: Mon, 27 Nov 2023 20:07:33 +0530
+Subject: [PATCH 1/1] include/Makefile: install systemd.h by default
+
+Install systemd.h header file by default, as we have stub and defined
+versions of the systemd functions for both non-systemd and systemd
+enabled configurations.  This will help packagers to ship package
+without systemd support (--enable-systemd=no).
+
+Signed-off-by: Kamalesh Babulal <kamalesh.babulal@oracle.com>
+Signed-off-by: Tom Hromatka <tom.hromatka@oracle.com>
+
+Upstream-Status: Backport [https://github.com/libcgroup/libcgroup/commit/592dcdcf243576bd2517d3da9bc18990de08e37e]
+
+Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
+---
+ include/Makefile.am | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/include/Makefile.am b/include/Makefile.am
+index 23cebaac..4cb05529 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -2,8 +2,4 @@
+ nobase_include_HEADERS = libcgroup.h libcgroup/error.h libcgroup/init.h \
+ 			 libcgroup/groups.h libcgroup/tasks.h \
+ 			 libcgroup/iterators.h libcgroup/config.h \
+-			 libcgroup/log.h libcgroup/tools.h
+-
+-if WITH_SYSTEMD
+-nobase_include_HEADERS += libcgroup/systemd.h
+-endif
++			 libcgroup/log.h libcgroup/tools.h libcgroup/systemd.h
+-- 
+2.39.2
+
diff --git a/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb b/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
index 4b4f19e36f..a1d27c7e7f 100644
--- a/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
@@ -13,6 +13,7 @@ DEPENDS = "bison-native flex-native"
 DEPENDS:append:libc-musl = " fts"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
+           file://0001-include-Makefile-install-systemd.h-by-default.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/tags"
 
-- 
2.35.7


