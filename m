Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42897C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:07:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13494.1789045630561247346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tLTl/3Uf;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64501153B
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:07:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFA4A3F528
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789045630; bh=RJb9hgsEHI6oyrnI/AXyoOogcfgMCq5+1Zew2Tm2Esc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tLTl/3UfrOBroMMHlbWyuhFSfrVv1EjvcCEx/jMfCrEZk5D/htsCW3JOGawr9kYmc
	 fRRLO5eQybAoYUGFX0d1MQ0TphHLt7XZAUYhNFiOwb4brbNGZRv3dCgPZ6dslRfcNe
	 WS79IcdP5rdsURzUwSeLEePAXXpuf+2y2SIQd/Z4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] automake: 1.18.1 -> 1.19
Date: Thu, 10 Sep 2026 14:07:00 +0100
Message-ID: <20260910130700.2587601-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910130700.2587601-1-ross.burton@arm.com>
References: <20260910130700.2587601-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245566

Summary of the release notes:

* New features added

  - New autoconf macro AM_OPTIONAL_AUTOMAKE.

* Bugs fixed

  - Recognize COPYINGv2, COPYINGv3, COPYING.LESSERv2 and COPYING.LESSERv3
    as license files; distribute them automatically, similarly to COPYING=
.

  - `make dist' no longer propagates its internal distribution-directory
    cleanup override to recursive makes run while constructing distdir.

  - `make dist-bzip2 dist-xz' now succeeds.

  - Non-zero exit codes of compressors for the dist tarballs no longer ab=
ort
    the job in a state where the empty files are left behind.

  - Busybox tar no longer assumed to be GNU tar just because it
    supports --version.

  - `make dist' now fails when tar fails, instead of exiting
    successfully with a truncated archive.

  - The filename-length-max=3DN option no longer rejects file names of
    exactly N characters.

  - A file that is not currently present is still a part of the distribut=
ion
    if a `Makefile.am' rule can build it.

  - Objective C and Objective C++ sources built with Libtool are now
    compiled and linked with `--tag=3DOBJC' and `--tag=3DOBJCXX'.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../automake/{automake_1.18.1.bb =3D> automake_1.19.bb}          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/automake/{automake_1.18.1.bb =3D> automake_=
1.19.bb} (92%)

diff --git a/meta/recipes-devtools/automake/automake_1.18.1.bb b/meta/rec=
ipes-devtools/automake/automake_1.19.bb
similarity index 92%
rename from meta/recipes-devtools/automake/automake_1.18.1.bb
rename to meta/recipes-devtools/automake/automake_1.19.bb
index 4544f7d5395..0ee4d8facfa 100644
--- a/meta/recipes-devtools/automake/automake_1.18.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.19.bb
@@ -1,4 +1,5 @@
 require automake.inc
+
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
 DEPENDS:class-native =3D "autoconf-native"
@@ -24,7 +25,7 @@ SRC_URI +=3D "\
            file://0006-automake-Remove-delays-in-configure-scripts-using=
-au.patch \
            "
=20
-SRC_URI[sha256sum] =3D "63e585246d0fc8772dffdee0724f2f988146d1a3f1c756a3=
dc5cfbefa3c01915"
+SRC_URI[sha256sum] =3D "79e8b1f7a967e87ce8a9ded76bee7f793d0ce1886ab2002f=
eb1b0510f578b75a"
=20
 PERL =3D "${USRBINPATH}/perl"
 PERL:class-native =3D "${USRBINPATH}/env perl"
--=20
2.43.0


