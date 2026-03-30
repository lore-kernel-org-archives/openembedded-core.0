Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DAB1061B29
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 23:11:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8491.1774912262554600158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 16:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=U82PleD1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C15E1A3092
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 23:11:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 528395FFA8
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 23:11:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F8ED104507FB;
	Tue, 31 Mar 2026 01:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774912259; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XyT8sXlN6oFAJMrO8Qm9Dlq7pQ8dEyYEVgsoO1M6BTQ=;
	b=U82PleD15N73QaV4GujNjmIitXYNEVUjgqyfrk0lNJs0Mq1wXxpdKnTyKPSRqT+k25Ti/c
	clorErLcBIxGIrwQsETnlv23P+m7QqaNDCtLpdVPcVskSSsu9LtPNIOizTXIn2PRHutewg
	5D5NIb4TfqGQONY+JuSTrD1Ch0XunHW3KRLnWRmmTfO98qbkvmVe84R0hBJPQZzCgoAT6U
	3oRJKw6huEouac4qk9dUqOg8SDIGIW857hBJaGRXY3n1YTO2MhS/+PtQSlK5FaULNK9ZmU
	HBCiPD9IXUsCR2KhxPHyA6X2jZnKYHdJjf+gyP6vzGVAxliwrnYD3/Q36VtPlw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] lto: disable LTO for e2fsprogs
Date: Tue, 31 Mar 2026 01:07:27 +0200
Message-ID: <20260330230727.1380122-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 23:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234259

From: Thomas Perrot <thomas.perrot@bootlin.com>

Fat LTO objects embed original source paths in .gnu.lto_* IR sections
which are not remapped by -ffile-prefix-map. This causes buildpaths QA
failures for libss.a and libext2fs.a in the e2fsprogs-staticdev package.

Disable LTO for e2fsprogs to prevent TMPDIR references from leaking into
the installed static libraries.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/conf/distro/include/lto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/=
lto.inc
index 2802d38ad3df..7471360236f9 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -4,6 +4,8 @@
 #
=20
 # Disable LTO for following packages
+
+LTO:pn-e2fsprogs =3D ""=20
 LTO:pn-expect =3D ""=20
 LTO:pn-glibc =3D ""
 LTO:pn-gcc-runtime =3D ""
--=20
2.53.0


