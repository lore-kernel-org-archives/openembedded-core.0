Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B178C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:11:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34495.1782727902834395753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=r1Nyvnf3;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFA0E1595
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:11:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEC6B3F836
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782727902; bh=IfA0chKE2JdhjGa5rzljLc5Ut7Ash1VZv8SHcFJi0xo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r1Nyvnf3qEeyU+9dSxhsT1F04yTMcLmgig+GkD54PGIBDnMmb/O5tn7bOr1FYOk/E
	 0QtjjX1Y1VdnCMwNhs7+sNmzuciWMLaOVzDI+BVU4bAuoKpzH69vN4+eu4WpJJnr5v
	 oWQDE7muUWTPVwRA9sy1bkod1axZkd6EhI7xJaTs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: set the compilation progress bar flag
Date: Mon, 29 Jun 2026 11:11:36 +0100
Message-ID: <20260629101136.1319045-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629101136.1319045-1-ross.burton@arm.com>
References: <20260629101136.1319045-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239744

Qemu uses meson to build but wraps it in Makefiles, so we don't get the
progress bar assignment from meson.bbclass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 3071f74650a..4a48ace0482 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -143,6 +143,9 @@ do_configure() {
 }
 do_configure[cleandirs] +=3D "${B}"
=20
+# Use the Meson progress regex as qemu uses meson internally
+do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
+
 do_install () {
 	export STRIP=3D""
 	oe_runmake 'DESTDIR=3D${D}' install
--=20
2.43.0


