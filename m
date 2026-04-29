Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53507CD3421
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.892.1777481310646051123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ETxWskq4;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B97EB33EA
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D286B3F62B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481310; bh=8o+ijSgeHlUr0UPuDOor2rxm0aLLEg4S0iJfAE7OCXA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ETxWskq4rqADD6Vo2tW9obrNqs2+4Ts1bE5WC4CqE2F8lAYeusFC33VLdoc5AbRgb
	 +ed397Y2fSeEkvdTlsTo5yCEGAzWwD9Oa0TJ6tyVFcXkKfG1S5qtscwANE8h1ljq2j
	 vW/DXzatmIMcupYGO4Co1lLKGIuRT0yKtgzCKf98=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] wireless-regdb: use ${firmwaredir} instead of ${nonarch_base_libdir}/firmware
Date: Wed, 29 Apr 2026 17:48:16 +0100
Message-ID: <20260429164821.3425757-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
References: <20260429164821.3425757-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236117

Now that firmwaredir has been defined, use it instead of explicitly using
${nonarch_base_libdir}/firmware.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../wireless-regdb/wireless-regdb_2026.02.04.bb           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04=
.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
index 2f7c8160434..e967d51fd32 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
@@ -15,8 +15,8 @@ do_install() {
     install -m 0644 regulatory.bin ${D}${nonarch_libdir}/crda/regulatory=
.bin
     install -m 0644 wens.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pu=
bkeys/wens.key.pub.pem
=20
-    install -m 0644 -D regulatory.db ${D}${nonarch_base_libdir}/firmware=
/regulatory.db
-    install -m 0644 regulatory.db.p7s ${D}${nonarch_base_libdir}/firmwar=
e/regulatory.db.p7s
+    install -m 0644 -D regulatory.db ${D}${firmwaredir}/regulatory.db
+    install -m 0644 regulatory.db.p7s ${D}${firmwaredir}/regulatory.db.p=
7s
 }
=20
 # Install static regulatory DB in /lib/firmware for kernel to load.
@@ -27,8 +27,8 @@ PACKAGES =3D "${PN}-static ${PN}"
 RCONFLICTS:${PN} =3D "${PN}-static"
=20
 FILES:${PN}-static =3D " \
-    ${nonarch_base_libdir}/firmware/regulatory.db \
-    ${nonarch_base_libdir}/firmware/regulatory.db.p7s \
+    ${firmwaredir}/regulatory.db \
+    ${firmwaredir}/regulatory.db.p7s \
 "
=20
 # Native users might want to use the source of regulatory DB.
--=20
2.43.0


