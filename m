Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2CFCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:57:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15759.1791989871644175531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=QqWKQc0t;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E028B1570
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:57:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAE1F3F673
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791989871; bh=YFxfcqfD2hiUkqNFFQ6Mih2M4wIALLHCowWZoDiZ5LA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QqWKQc0t15NZYN0D/4ja4D2tu4GgDkYWXmKC9uvAavMMwv3XQY6tM5Rwi1CWTKt8S
	 eeh/VqsHzFkfTPhgITI9BZQjE3uISO+XoZ5rxZlxHDZIwVeLUFVhaXCTqM6vXSbmpm
	 S8FX8ZrChN5A9Tkb9yc561e43T9+XiqZTOcqHIxI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-installer: upgrade 1.0.1 -> 1.1.0
Date: Wed, 14 Oct 2026 15:57:44 +0100
Message-ID: <20261014145744.1818933-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014145744.1818933-1-ross.burton@arm.com>
References: <20261014145744.1818933-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247778

- Add early return when there are no optimization levels to compile
  bytecode for
- Avoid building a `pathlib.Path` object for each record entry
- Declare support for Python 3.15
- Use `os.path.commonpath` instead of `os.path.commonprefix` to address
  deprecation warnings on Python 3.15

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-installer/interpreter.patch       | 12 +++++-------
 ...installer_1.0.1.bb =3D> python3-installer_1.1.0.bb} |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-installer_1.0.1.bb =3D> pyt=
hon3-installer_1.1.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-installer/interpreter.p=
atch b/meta/recipes-devtools/python/python3-installer/interpreter.patch
index 0a5d34a349a..aa9cb6f6c39 100644
--- a/meta/recipes-devtools/python/python3-installer/interpreter.patch
+++ b/meta/recipes-devtools/python/python3-installer/interpreter.patch
@@ -1,7 +1,7 @@
-From 22fa800b4cbcfddd57fa262fd7f2aeb06a15a711 Mon Sep 17 00:00:00 2001
+From 23e4f2d9c47de7c4b855e72691217e98c1a504ba Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 14 Mar 2022 14:39:22 +0000
-Subject: [PATCH 1/2] installer: add --interpreter option
+Subject: [PATCH] installer: add --interpreter option
=20
 The currently running Python might not be the right one for the installe=
d
 wheels, so add an option to allow the interpreter to be overridden.
@@ -14,8 +14,9 @@ host might not be the right path for the scripts to use=
 on the target.
 Upstream-Status: Submitted [https://github.com/pypa/installer/pull/332]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- src/installer/__main__.py | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
+ src/installer/__main__.py |  9 ++++++++-
+ src/installer/scripts.py  | 15 +--------------
+ 2 files changed, 9 insertions(+), 15 deletions(-)
=20
 diff --git a/src/installer/__main__.py b/src/installer/__main__.py
 index b7a7445..25415ea 100644
@@ -67,6 +68,3 @@ index b21a72e..551941f 100644
 -        # I don't understand a lick what this is trying to do.
 -        return b"#!/bin/sh\n'''exec' " + quoted + b' "$0" "$@"\n' + b"'=
 '''"
 +        return b"#!" + executable_bytes
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3-installer_1.0.1.bb b/me=
ta/recipes-devtools/python/python3-installer_1.1.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-installer_1.0.1.bb
rename to meta/recipes-devtools/python/python3-installer_1.1.0.bb
index 6727f8e21e8..83e53f6a0c5 100644
--- a/meta/recipes-devtools/python/python3-installer_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-installer_1.1.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5038641aec7a77=
451e31da828ebfae00"
=20
 SRC_URI +=3D "file://interpreter.patch"
=20
-SRC_URI[sha256sum] =3D "052c7fc3721d54c696e2dea019be67539d7b144e924f559f=
54beb3121831c364"
+SRC_URI[sha256sum] =3D "5adc0c01ce62d809989e246987cd68944fe5df8af562d035=
8f65b2ab15cb5de7"
=20
 inherit pypi python_flit_core
=20
--=20
2.43.0


