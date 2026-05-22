Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30095CD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 16:05:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20417.1779465896912438970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 09:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=HI5htTci;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BB5525E1
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 09:04:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C828C3F85F
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 09:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779465896; bh=Jh7r6YO2zghbYtRk3D2S3dK/BhI2aYxFdUG3yZcL4kM=;
	h=From:To:Subject:Date:From;
	b=HI5htTciJOtWfQ7rSmRLTjQsLLdWeDrDOuOSe1j6C12bcAyeLoeTEo7QtFWSqsmfp
	 hVqEDHno1U+2Wmv02E496K5/EiMCbHtotk6YesogYf1jwWilPttmgVTafEE8wFTuLb
	 Z01hlZ8bEYbIRfegf0it+LLVXDGZW6xt3ghfhS/Y=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/gtk-icon-cache: fix libdir passed to the postrm intercept
Date: Fri, 22 May 2026 17:04:51 +0100
Message-ID: <20260522160451.3272911-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 16:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237556

Back in 2015[1] I fixed the libdir passed to the postinst intercept, but
I forgot to also update the postrm intercept.  This should also be
libdir_native, not libdir.

[ YOCTO #13896 ]

[1] oe-core 0fe8400717 ("gtk-icon-cache: pass the native libdir to the in=
tercept")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gtk-icon-cache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass b/meta/classes-re=
cipe/gtk-icon-cache.bbclass
index fad8c4c65f..1c573264e0 100644
--- a/meta/classes-recipe/gtk-icon-cache.bbclass
+++ b/meta/classes-recipe/gtk-icon-cache.bbclass
@@ -46,7 +46,7 @@ gtk_icon_cache_postrm() {
 if [ "x$D" !=3D "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG} \
 		mlprefix=3D${MLPREFIX} \
-		libdir=3D${libdir}
+		libdir_native=3D${libdir_native}
 else
 	for icondir in /usr/share/icons/* ; do
 		if [ -d $icondir ] ; then
--=20
2.43.0


