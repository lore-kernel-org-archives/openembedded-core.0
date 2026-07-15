Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36AAC4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 11:02:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3707.1784113365625979047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 04:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cc5eOeyS;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA8DC152B
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB8883F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784113365; bh=2W152Buvk3y9ciiRxAH2ZBryiyq7vZ9vTbCXPOy2QtQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cc5eOeySqSxv13em9uzFySEk0589aqDavx93Pax79IXuXj+5leVbyUXWInOzd9F/7
	 fJCVZDtQIWvtMRukmjFWwTrwP1gpfO18mIshgO4EKpEeiW7z8FpN76U/SHoC69dfDn
	 WwZXiFM4EmkzojhuEF+KwG2eaDkLpjjkeGDGgi1s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libxml2: remove LSB-specific overrides
Date: Wed, 15 Jul 2026 12:02:35 +0100
Message-ID: <20260715110237.1692760-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715110237.1692760-1-ross.burton@arm.com>
References: <20260715110237.1692760-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240945

The linuxstdbase override was used by the poky-lsb distribution, which
aimed to be compatible with the Linux Standard Base specification.

LSB is long-dead and poky-lsb was removed back in 2018 with the thud
release[1].

Clarify the recipe by deleting these obsolete and unused assignments.

[1] meta-yocto 00fdefff55 ("poky-altcfg: Replace poky-lsb with poky-altcf=
g")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/libxml/libxml2_2.15.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-co=
re/libxml/libxml2_2.15.3.bb
index abf9889b3f3..096a719d1c4 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -45,7 +45,6 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-gcon=
v-ebcdic-us \
 EXTRA_OECONF =3D "--without-debug --without-legacy --with-catalog --with=
-c14n"
 EXTRA_OECONF:class-native =3D "--without-legacy --with-c14n --with-zlib"
 EXTRA_OECONF:class-nativesdk =3D "--without-legacy --with-c14n --with-zl=
ib"
-EXTRA_OECONF:linuxstdbase =3D "--with-debug --with-legacy --with-c14n --=
with-zlib"
=20
 python populate_packages:prepend () {
     # autonamer would call this libxml2-2, but we don't want that
--=20
2.43.0


