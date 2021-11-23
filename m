Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815D4C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 19:39:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.16390.1637696349719057615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 11:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C43EC1FB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 11:39:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E8043F66F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 11:39:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: drop redundant patch
Date: Tue, 23 Nov 2021 19:38:59 +0000
Message-Id: <20211123193859.2983287-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 19:39:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158616

This patch disables the debian-detection to use the correct $libdir by
default on that platform.  However in cross builds this is always
overridden to be $prefix/lib, and all recipes that inherit meson pass
the correct libdir explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 -
 ...01-is_debianlike-always-return-False.patch | 26 -------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-is_debianlike-=
always-return-False.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtool=
s/meson/meson.inc
index f383ad9f74..757295a50a 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -13,7 +13,6 @@ SRC_URI =3D "https://github.com/mesonbuild/meson/releas=
es/download/${PV}/meson-${P
            file://disable-rpath-handling.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
-           file://0001-is_debianlike-always-return-False.patch \
            "
 SRC_URI[sha256sum] =3D "5add789c953d984b500858b2851ee3d7add0460cf1a6f852=
f0a721af17384e13"
=20
diff --git a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-=
return-False.patch b/meta/recipes-devtools/meson/meson/0001-is_debianlike=
-always-return-False.patch
deleted file mode 100644
index 83c4782a61..0000000000
--- a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-=
False.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 667b9ede638677fb37911306937ea62f05897581 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 18 Oct 2021 15:55:59 +0200
-Subject: [PATCH] is_debianlike(): always return False
-
-Otherwise, host contamination happens.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- mesonbuild/mesonlib/universal.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/mesonlib/universal.py b/mesonbuild/mesonlib/univ=
ersal.py
-index d670d04..47d1b52 100644
---- a/mesonbuild/mesonlib/universal.py
-+++ b/mesonbuild/mesonlib/universal.py
-@@ -651,7 +651,7 @@ def is_cygwin() -> bool:
-=20
-=20
- def is_debianlike() -> bool:
--    return os.path.isfile('/etc/debian_version')
-+    return False
-=20
-=20
- def is_dragonflybsd() -> bool:
--=20
2.25.1


