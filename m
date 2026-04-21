Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD64BF8FA90
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 15:12:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34343.1776784371751521964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 08:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vG5Lv/+I;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C06CA263D
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 08:12:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 033533FAF5
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776784371; bh=P5mrIhRSGCFnPUeww/EyZswdHevYLWwK6V8qsIHKz5U=;
	h=From:To:Subject:Date:From;
	b=vG5Lv/+IF+Hq/QgIs+/qWSSEO8zq3/lENYs59r6hYYHQjRfEAbSHYi39FRv3zlxtf
	 08R80u6pTy0Q3Oug1DskhhljbCdjCKevwpPwXXH3zg22IM7dfzcomeI1IqzTZvvYr9
	 M2qWt+cLibV143V2htgiOiFFEG4LH+Tv4xsb8M9s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] classes/base: add explicit bzip2-native dependency for unpacking .bz2
Date: Tue, 21 Apr 2026 16:12:46 +0100
Message-ID: <20260421151247.754876-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 15:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235685

Currently this is in ASSUME_PROVIDED and HOSTTOOLS so doesn't have any
effect, but declaring the dependency is the right thing to do.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
index 76fd0ac046a..ddf1d784a10 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -658,6 +658,10 @@ python () {
         elif uri.scheme =3D=3D "repo":
             d.appendVarFlag('do_fetch', 'depends', ' repo-native:do_popu=
late_sysroot')
=20
+        # *.bz2 should DEPEND on bzip2-native for unpacking
+        if path.endswith('.bz2'):
+            d.appendVarFlag('do_unpack', 'depends', ' bzip2-native:do_po=
pulate_sysroot')
+
         # *.lz4 should DEPEND on lz4-native for unpacking
         if path.endswith('.lz4'):
             d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_popu=
late_sysroot')
--=20
2.43.0


