Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ED410D14B4
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 13:28:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51287.1774877315418315974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 06:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jsXMQJ42;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EFDF3563
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 06:28:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9B0DD3F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774877314; bh=ZBeCMuOR6qEgCNNH+AyGzkBXRytSuxkJWXo5OfVotTo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jsXMQJ42mVJqmHpj1cgA0AqPQaZwPz57gfI4h9qYunWxgiZCz2BjIMfJ0zuZ2DRUl
	 Q8ZIDEqlVruL/DQpvMtYgtux17K/BlsvjG64nMvjMlGLpCzIrBmtj40ZOvzy/VXBVk
	 r7AdkvNUcLzjso6EpPmAS65in3YsjYw9fPns2HI8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] diffstat: change configure.in to use standard autoconf
Date: Mon, 30 Mar 2026 14:28:23 +0100
Message-ID: <20260330132825.1784802-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132825.1784802-1-ross.burton@arm.com>
References: <20260330132825.1784802-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 13:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234234

diffstat uses a fork of autoconf which we don't package, but we need to
autoreconf the configure.in because it has buggy macros. The new version
of autoconf however notices that AC_OUTPUT is being called with invalid
arguments and refuses to run.

Luckily it's easy to use standard autoconf: delete the hand-coded
config_h.in so that autoheader runs, and use the standard form of
AC_OUTPUT to generate the Makefile and config.h.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../diffstat/diffstat/standard-autoconf.patch | 48 +++++++++++++++++++
 .../diffstat/diffstat_1.68.bb                 |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/diffstat/diffstat/standard-auto=
conf.patch

diff --git a/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.pa=
tch b/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch
new file mode 100644
index 00000000000..b301c2d86db
--- /dev/null
+++ b/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch
@@ -0,0 +1,48 @@
+From 0069056a23b39f53a05b89b2545a3a5ad1ff070a Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 18 Mar 2026 11:27:24 +0000
+Subject: [PATCH] Use standard autoconf
+
+diffstat uses a fork of autoconf which we don't package but we need to a=
utoreconf
+the configure.in because it has buggy macros.
+
+Delete the hand-coded config_h.in so that autoheader runs, and use the s=
tandard
+form of AC_OUTPUT.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ config_h.in  | 8 --------
+ configure.in | 2 +-
+ 2 files changed, 1 insertion(+), 9 deletions(-)
+ delete mode 100644 config_h.in
+
+diff --git a/config_h.in b/config_h.in
+deleted file mode 100644
+index ac8ff1d..0000000
+--- a/config_h.in
++++ /dev/null
+@@ -1,8 +0,0 @@
+-/*=20
+- * $Id: config_h.in,v 1.1 1994/06/12 23:48:18 tom Exp $
+- * config_h.in is a template file used by configure to produce config.h=
.
+- * config_h is then transformed (by config.status) into the header file=
=20
+- * config.h -- Kevin Buettner.
+- */
+-
+-@DEFS@
+diff --git a/configure.in b/configure.in
+index cb641d4..7042800 100644
+--- a/configure.in
++++ b/configure.in
+@@ -83,5 +83,6 @@ CF_WITH_MAN2HTML
+ CF_DISABLE_LEAKS
+=20
+ ###	output makefile and config.h
+-AC_OUTPUT(makefile,,,cat)
++AC_CONFIG_FILES([makefile])
++AC_OUTPUT
+ CF_MAKE_DOCS(diffstat,1)
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.68.bb b/meta/recip=
es-devtools/diffstat/diffstat_1.68.bb
index 488f0834d64..4bc18158378 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.68.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0c432d3aeb9358=
55b2ca1ad2a0542ce4"
=20
 SRC_URI =3D "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
+           file://standard-autoconf.patch \
            file://avoid-check-user-break-cc.patch \
            "
=20
--=20
2.43.0


