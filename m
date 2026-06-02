Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77212CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 16:06:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1974.1780416405764518737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 09:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GnxCRaX0;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17F9B3597
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jun 2026 09:06:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F6A73F632
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jun 2026 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780416405; bh=yuZAxE6rPvhykqrLFcMOnq0j52vbw2cA7kgKjA2n5E0=;
	h=From:To:Subject:Date:From;
	b=GnxCRaX0pfkGm6myWHCPLQfsm9p/OxolYFzup3imZLHEv+OjnUUHaxG70Isesonh8
	 9S4p0K/Vrk+EP+WbQf1g4Da6wbKEeIgVhLR2/Pntf0bOw+LqHrikUisoYCQC4oYrVZ
	 5dSiDNDMekXM+6cmk9U7+HzGRrgUfYVBvZl7mDDA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: use += instead of :append in SKIPPED_TESTS
Date: Tue,  2 Jun 2026 17:06:40 +0100
Message-ID: <20260602160640.3198315-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 16:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238063

+=3D is less computationally intensive than :append so use it unless the
semantics of :append are needed.

Also remove the class-target override, this is not required as ptests
are only used in target builds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipe=
s-devtools/python/python3_3.14.5.bb
index 2f821b130f..501de75fb1 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -271,13 +271,13 @@ SKIPPED_TESTS =3D " \
 # but not bang completion. test_bang_completion_without_do_shell() passe=
s if
 # building with readline, but we don't want to change the default, so sk=
ip the
 # test.
-SKIPPED_TESTS:append =3D " \
+SKIPPED_TESTS +=3D " \
     --ignore test_bang_completion_without_do_shell \
 "
=20
 # Also fails with editline instead of readline. See:
 # https://github.com/python/cpython/issues/123018
-SKIPPED_TESTS:append =3D " \
+SKIPPED_TESTS +=3D " \
     --ignore test_write_read_limited_history \
 "
=20
@@ -294,22 +294,22 @@ SKIPPED_TESTS:append =3D " \
 # write is seeing the equivalent of:
 #
 # ANY, b"21"
-SKIPPED_TESTS:append =3D " \
+SKIPPED_TESTS +=3D " \
     --ignore test_cursor_back_write \
 "
=20
 # Needs IMAGE_FEATURE +=3D \"tools-sdk\"
-SKIPPED_TESTS:append =3D " \
+SKIPPED_TESTS +=3D " \
     --ignore test_find_library_with_gcc \
     --ignore test_find_library_with_ld \
 "
=20
 # Fails due to differences in CFLAGS as as modified during build
-SKIPPED_TESTS:append =3D " \
+SKIPPED_TESTS +=3D " \
     --ignore test_sysconfigdata_json \
 "
=20
-SKIPPED_TESTS:append:class-target:libc-musl =3D " \
+SKIPPED_TESTS:append:libc-musl =3D " \
     -x test__locale \
     -x test_c_locale_coercion \
     -x test_locale \
--=20
2.43.0


