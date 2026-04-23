Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E5AF9936E
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:11:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17117.1776942670894114747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 04:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jiZmm9Wr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A04721C25
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 04:11:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D1C813F23F
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776942670; bh=Zy2KcyQgn5EqsAPcY3WcI7LzjNdidXsi6tSSBNQLOns=;
	h=From:To:Subject:Date:From;
	b=jiZmm9WrAeXvkj14GLm6e3Mk6FwmISwkTDbAQoNiup+dKDdUOx6aV4uacRA3GuVoY
	 rN9O5/R0VWwvfygWfWk5yzdVqkWWXHXa0kQkl33qbeqn2NPGECd8KG1KupMryRw6Sq
	 i4EtiS4SKNijcWuKsbRwNZL0U6doFXagoGSpSPNc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] classes/base: add explicit bzip2-native dependency for unpacking .bz2
Date: Thu, 23 Apr 2026 12:11:05 +0100
Message-ID: <20260423111105.2049297-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 11:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235754

Currently this is in ASSUME_PROVIDED and HOSTTOOLS so doesn't have any
effect, but declaring the dependency is the right thing to do.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
index 76fd0ac046a..319bf02d81e 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -662,6 +662,10 @@ python () {
         if path.endswith('.lz4'):
             d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_popu=
late_sysroot')
=20
+        # *.bz2 should DEPEND on bzip2-native for unpacking
+        elif path.endswith('.bz2'):
+            d.appendVarFlag('do_unpack', 'depends', ' bzip2-native:do_po=
pulate_sysroot')
+
         # *.zst should DEPEND on zstd-native for unpacking
         elif path.endswith('.zst'):
             d.appendVarFlag('do_unpack', 'depends', ' zstd-native:do_pop=
ulate_sysroot')
--=20
2.43.0


