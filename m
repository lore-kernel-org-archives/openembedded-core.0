Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82616C4167E
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:22:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7716.1639146172470640199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 215B9106F
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0E163F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:51 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 10/10] apmd: remove obsolete support for renamed libtool
Date: Fri, 10 Dec 2021 14:22:42 +0000
Message-Id: <20211210142242.2698587-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
References: <20211210142242.2698587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:22:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159537

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/apmd/apmd/libtool.patch | 22 +++++++++++++++-------
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb   |  2 +-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-bsp/apmd/apmd/libtool.patch b/meta/recipes-bsp/=
apmd/apmd/libtool.patch
index 834ee080a1f..fd0a952890d 100644
--- a/meta/recipes-bsp/apmd/apmd/libtool.patch
+++ b/meta/recipes-bsp/apmd/apmd/libtool.patch
@@ -1,3 +1,8 @@
+From d5dde7ca91a5aed273d8fe269e1a5194e85c8c79 Mon Sep 17 00:00:00 2001
+From: Scott Garman <scott.a.garman@intel.com>
+Date: Tue, 13 Jul 2010 16:46:46 +0800
+Subject: [PATCH] apmd: upgrade to 3.2.2-14
+
 Add by RP to address "unable to infer tagged configuration" error:
    commit 35de05e61b88c0808a5e885bb0efdf420555d5ad
    Author: Richard Purdie <rpurdie@rpsys.net>
@@ -15,15 +20,18 @@ Upstream-Status: Pending
=20
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
=20
-Index: apmd-3.2.2.orig/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- apmd-3.2.2.orig.orig/Makefile	2004-01-04 08:13:18.000000000 +0000
-+++ apmd-3.2.2.orig/Makefile	2008-04-21 17:10:03.000000000 +0100
-@@ -58,9 +57,8 @@
- #CFLAGS=3D-O3 -m486 -fomit-frame-pointer
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 92fc0fd..8e283dc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -59,8 +59,8 @@ RANLIB=3Dranlib
  #LDFLAGS=3D-s
 =20
--LIBTOOL=3Dlibtool --quiet
+ LIBTOOL=3Dlibtool --quiet
 -LT_COMPILE =3D $(LIBTOOL) --mode=3Dcompile $(CC)
 -LT_LINK =3D $(LIBTOOL) --mode=3Dlink $(CC)
 +LT_COMPILE =3D $(LIBTOOL) --tag=3DCC --mode=3Dcompile $(CC)
diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb b/meta/recipes-bsp/ap=
md/apmd_3.2.2-15.bb
index da17e5a2350..1779e8b2a03 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -43,7 +43,7 @@ EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
=20
 do_compile() {
 	# apmd doesn't use whole autotools. Just libtool for installation
-	oe_runmake "LIBTOOL=3D${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool" apm =
apmd
+	oe_runmake apm apmd
 }
=20
 do_install() {
--=20
2.25.1


