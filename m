Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEA3C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:16:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38494.1782742564297101384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=imfyeUPt;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 580EE16A3
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:15:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 584F23F905
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782742563; bh=j2fWdtjs9ebhg4N4cYh20//ZGSLg3/aLpxzAC0OCP3E=;
	h=From:To:Subject:Date:From;
	b=imfyeUPtc69uoaZyHGyPmD5tj3OrpkCyRv7jOM4f+Afpq10kUriJ08gDutMpeQz78
	 g1NJE3gemxK5UZ51ghN6oiMRNGSogT1aTSX2gW9KUQP6ozTQGYqqhyeg/xIRmQSyaf
	 kdbk+Q2Zm8Di+C9RIu1RnVudJ8Hurlg8B8wYvviQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] classes/meson: use ninja explicitly when compiling
Date: Mon, 29 Jun 2026 15:15:57 +0100
Message-ID: <20260629141559.1305873-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239785

"meson compile" is essentially a glorified wrapper around calling ninja
that doesn't support all of the options that ninja does, so calling it
directly means builds are fractionally faster and we get direct control
over the flags that ninja is passed.

A longer rationale can be found in the Gentoo change by Eli Schwartz
that caused this patch, who is both a Gentoo and Meson developer:

https://github.com/gentoo/gentoo/commit/66011abd663671947fe07835f0d9cc360=
f5de317

The only change is that the compile target doesn't support the optional
convenience target type, but this is rarely used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 9bed293603c..a4643591103 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -180,7 +180,7 @@ meson_do_configure() {
=20
 do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
-    meson compile -v ${PARALLEL_MAKE} ${MESON_TARGET}
+    ninja --verbose ${PARALLEL_MAKE} ${MESON_TARGET}
 }
=20
 meson_do_install() {
--=20
2.43.0


