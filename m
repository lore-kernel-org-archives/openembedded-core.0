Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51992C44500
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 12:56:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68469.1782996991247383336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 05:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=B6jdZP8V;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CCCF1FCD
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:56:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CBAE3F673
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782996990; bh=xYcmzf+U+zrtnHWrpbPPfQUyv+B2KsyWBeLJ3/ZLUsI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B6jdZP8VivH7s+VeZ7sm4B1Y7/vL6dB8VPwQ+FH1KTAo5j0tUKdGhDYohpT9ZJYGp
	 /FOk4r1Qw6uV5WcQhSjiBJnkAl5k4wrm0R15woNiMIOKiK0b5HP+VZbXpQFpHLboTS
	 umAWtBOGI9GyyU1+lRC3ZuJ9UXHF2EkP4d/Ttmv4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/6] python3-pycairo: inherit python3-dir not python3targetconfig
Date: Thu,  2 Jul 2026 13:56:24 +0100
Message-ID: <20260702125627.977563-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702125627.977563-1-ross.burton@arm.com>
References: <20260702125627.977563-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 12:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240039

Now that meson.bbclass tells meson where to install Python files this
recipe just needs to know the value of PYTHON_SITEPACKAGES_DIR for
FILES, so just inherit python3-dir to remove a dependency on the target
python recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pycairo_1.29.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb b/met=
a/recipes-devtools/python/python3-pycairo_1.29.0.bb
index 20c2c332cdb..9b78e4f3d3f 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D "f3f7fde97325cae80224c09f12564ef=
58d0d0f655da0e3b040f5807bd5
=20
 S =3D "${UNPACKDIR}/pycairo-${PV}"
=20
-inherit meson pkgconfig python3targetconfig github-releases
+inherit meson pkgconfig python3-dir github-releases
=20
 CFLAGS +=3D "-fPIC"
=20
--=20
2.43.0


