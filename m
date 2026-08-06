Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C669C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 16:27:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23853.1786033656921063685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 09:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=rgAP2PhI;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D42E9153B
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 09:27:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B6E33F9A2
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786033655; bh=ouf3suhtMX1ktXxC+M5zoJvFHpuY1EsqfJQ64/9nLuU=;
	h=From:To:Subject:Date:From;
	b=rgAP2PhI5BTGQB3oHOflIrctTbEvyPYhDZav69DZ+7H3hj2vjGM6TF43dSSgc+ICk
	 SL3lSyYOqyQ5nuD5+Ly7szBjtDz4YmIIv64+66ydr/6XD8wBHnDpeg7W3/dEIKiUt4
	 D93vCPOI33vWNFIeo10XjzDSzz8PBb5ox2HiesyY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] cross-localedef-native: prune patch list
Date: Thu,  6 Aug 2026 17:27:28 +0100
Message-ID: <20260806162730.352060-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 16:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242957

The cross-localedef-native recipe builds on top of glibc and drops in an
autoconf tree to build just localedef.  For some reason we're applying a
partial subset of glibc patches that do not impact the localedef build
at all, for example adding documentation or fixing nscd.

Remove patches and other assignments that don't impact the build of
localedef.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.44.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.44.bb b/met=
a/recipes-core/glibc/cross-localedef-native_2.44.bb
index cf48b9c83bf..47018ff23b4 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.44.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.44.bb
@@ -25,13 +25,8 @@ SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0001-localedef-Add-hardlink-resolver-from-util-linux.p=
atch \
            file://0002-localedef-fix-ups-hardlink-to-make-it-compile.pat=
ch \
            \
-           file://0009-eglibc-Cross-building-and-testing-instructions.pa=
tch \
-           file://0010-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0011-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0012-eglibc-Forward-port-cross-locale-generation-suppo=
rt.patch \
            file://0013-localedef-add-to-archive-uses-a-hard-coded-locale=
-pa.patch \
-           file://0016-Replace-echo-with-printf-builtin-in-nscd-init-scr=
ipt.patch \
-           file://0018-timezone-Make-shell-interpreter-overridable-in-tz=
sel.patch \
            "
 # Makes for a rather long rev (22 characters), but...
 #
@@ -39,10 +34,6 @@ SRCREV_FORMAT =3D "glibc_localedef"
=20
 EXTRA_OECONF =3D "--with-glibc=3D${S}"
=20
-# We do not need bash to run tzselect script, the default is to use
-# bash but it can be configured by setting KSHELL Makefile variable
-EXTRA_OEMAKE +=3D "KSHELL=3D/bin/sh"
-
 CFLAGS +=3D "-fgnu89-inline -std=3Dgnu99 -DIS_IN\(x\)=3D'0'"
=20
 do_install() {
--=20
2.43.0


