Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504F0C44511
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6664.1784124315920858858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qzARb9uV;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E78CF1477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B515E3F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124315; bh=BMdXsr05TtrhO8LrNYfad6Vi2xbGeawbvjKCsEGQNTE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qzARb9uVvZ5PJRd8p2oqKBoCAmUDey8UfLJgAoomDOGmfCTmSAn780Y+v/ABu0h2D
	 p1QPWMcrfBdErbcdywX9AbRZ1R/6CQa56tExKzlWPzHPhvyFRm/2Awx6JBy3mqs/K9
	 QeA81z+xeNAQ4LgDNjggoIFhmYNAewjeZHk+JwgA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/12] libpsl: use libidn2 instead of ICU
Date: Wed, 15 Jul 2026 15:04:58 +0100
Message-ID: <20260715140507.2329605-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240962

The default IDNA library was changed from libidn2 to ICU in 2021[1] with
no rationale, and upstream has had libidn2 as the default since 2017.

Switch back to libidn2 to respect upstream's opinion, and because ICU is
a monolithic dependency: this switch causes a minimal image containg
libpsl to shrink by ~30MB.

[1] oe-core 20fc11919e2 ("libpsl: Add config knobs for runtime/builtin co=
nversion choices")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libpsl/libpsl_0.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpsl/libpsl_0.22.0.bb b/meta/recipes-=
support/libpsl/libpsl_0.22.0.bb
index 741038ddc52..1e5e9c74b4c 100644
--- a/meta/recipes-support/libpsl/libpsl_0.22.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.22.0.bb
@@ -19,7 +19,7 @@ GITHUB_BASE_URI =3D "https://github.com/rockdaboot/libp=
sl/releases"
=20
 inherit autotools gettext gtk-doc manpages pkgconfig lib_package github-=
releases
=20
-PACKAGECONFIG ?=3D "icu"
+PACKAGECONFIG ?=3D "idn2"
 PACKAGECONFIG[manpages] =3D "--enable-man,--disable-man,libxslt-native"
 PACKAGECONFIG[icu] =3D "--enable-runtime=3Dlibicu --enable-builtin=3Dlib=
icu,,icu"
 PACKAGECONFIG[idn2] =3D "--enable-runtime=3Dlibidn2 --enable-builtin=3Dl=
ibidn2,,libidn2 libunistring"
--=20
2.43.0


