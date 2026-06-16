Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5777CCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:12:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153813.1781615559890887602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 06:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GHpu6KuA;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80E453D5D
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:12:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6C573F763
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781615559; bh=Y7rDfZsPwzqPBjAvI7r9eHaOvYoHJoOKQg17SVEBLAo=;
	h=From:To:Subject:Date:From;
	b=GHpu6KuA/uihPklipq72CKemuB9Q7Ecq6W+M0Ab7PCc6Eyl8N6K/XH68XggnVmGgk
	 kyFvXqg1GgPq4FBL0da8C0OWYvVW83hBhH+SzSXtruqFtEZRCjnKnVpXiEEq6dGPpH
	 oc/r7YmmuzN3LyoLeUUVbT6KaYRIp0iqI0XABIJo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] less: clean up recipe
Date: Tue, 16 Jun 2026 14:12:34 +0100
Message-ID: <20260616131234.2938177-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 13:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238899

The previous upgrade[1] cleaned up the do_install() task but it is now
identical to the task provided by autotools.bbclass so we can remove it.

Whilst here, remove redundant whitespace from EXTRA_OEMAKE and use -C
instead of cd in do_compile_ptest().

[1] oe-core c057b662a0a ("less: upgrade 692 -> 704")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/less/less_704.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/less/less_704.bb b/meta/recipes-extend=
ed/less/less_704.bb
index 76a06e9cdf8..500a39b3278 100644
--- a/meta/recipes-extended/less/less_704.bb
+++ b/meta/recipes-extended/less/less_704.bb
@@ -35,17 +35,12 @@ UPSTREAM_CHECK_URI =3D "http://www.greenwoodsoftware.=
com/less/download.html"
=20
 inherit autotools ptest update-alternatives
=20
-EXTRA_OEMAKE +=3D " LESSTEST=3D1"
+EXTRA_OEMAKE +=3D "LESSTEST=3D1"
=20
 inherit autotools update-alternatives
=20
 do_compile_ptest () {
-        cd ${S}/lesstest
-        oe_runmake
-}
-
-do_install () {
-        oe_runmake 'DESTDIR=3D${D}' install
+        oe_runmake -C ${S}/lesstest
 }
=20
 do_install_ptest () {
--=20
2.43.0


