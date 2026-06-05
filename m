Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A99CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 15:15:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10367.1780672518159371343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 08:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WbFXLtJO;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91EA832F4
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 08:15:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 028DD3F86F
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 08:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780672517; bh=qlz8Yr4lD8X9XmlnL3s5pFeJanQddN2p5GYIO45w7fA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WbFXLtJO8GK/rwAik24bwl6iDOTYDf7pm2AgSyX6GUWE/005OWCj6wJ2/WuTNZdS8
	 7rz9q2CzeuHxg27XWBym1gm8k7gdUE14ezy0tv1bbSL25Cx4oXRdAUu6gjUHUF8k/b
	 bacizBSekiEUYIpbIBVV3mJyklzf5St1j+z56pz4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3: remove obsolete skips of some ctypes tests
Date: Fri,  5 Jun 2026 16:15:10 +0100
Message-ID: <20260605151511.3522627-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605151511.3522627-1-ross.burton@arm.com>
References: <20260605151511.3522627-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238175

These two tests were skipped in 2021[1] as at the time they required
dependencies that were primarily provided by packagegroup-core-buildessen=
tial.

I'm not sure what this dependency was, but the tests pass with just the
core-image-ptest-python3 image:

  test_find_library_with_gcc (FindLibraryLinux.test_find_library_with_gcc=
) ... ok
  test_find_library_with_ld (FindLibraryLinux.test_find_library_with_ld) =
... ok

[1] oe-core c6567235cba ("python3: skip tests requiring tools-sdk")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipe=
s-devtools/python/python3_3.14.5.bb
index b3709db9e21..6e237fb0308 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -298,12 +298,6 @@ SKIPPED_TESTS +=3D " \
     --ignore test_cursor_back_write \
 "
=20
-# Needs IMAGE_FEATURE +=3D \"tools-sdk\"
-SKIPPED_TESTS +=3D " \
-    --ignore test_find_library_with_gcc \
-    --ignore test_find_library_with_ld \
-"
-
 # Fails due to differences in CFLAGS as as modified during build
 SKIPPED_TESTS +=3D " \
     --ignore test_sysconfigdata_json \
--=20
2.43.0


