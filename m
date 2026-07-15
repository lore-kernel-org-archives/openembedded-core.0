Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD28EC44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6663.1784124315213963235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hPjyE8Ck;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BB26152B
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 067373F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124314; bh=oOqHUHoaX996sp2J4iQOcJPIdNaZg4CDaf6iW2d3YNs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hPjyE8Ck6oK2lAIUp5TYQkfnt/HAEpmJMhHOO6E4P1j0Ih1BgosdymLO5sqRC2l1Q
	 esFZLR28/P3eFOVQoegRv7w/mXzvY7gLbso2UAumHzu+vYLs4VJYeWqo9R22SvMSEE
	 1b5SJtcE2VVMtaRZ8qAk5s4Sy+scW6Iu4P5hCoeg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/12] evdev: build with meson
Date: Wed, 15 Jul 2026 15:04:57 +0100
Message-ID: <20260715140507.2329605-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240961

Upstream has meson support, so use it.

Explicitly disable the tests and documentation to ensure deterministic
builds as these float depending on whether check and doxygen are found
at configure time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libevdev/libevdev_1.13.6.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.6.bb b/meta/reci=
pes-support/libevdev/libevdev_1.13.6.bb
index 4a2cfee4c1a..a4478b8df5d 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.6.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
@@ -6,12 +6,13 @@ HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/=
libevdev/"
 SECTION =3D "libs"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D80c550b3197bcb8da7d7557ebcc3f=
c46 \
-                    "
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D80c550b3197bcb8da7d7557ebcc3f=
c46"
=20
 SRC_URI =3D "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 SRC_URI[sha256sum] =3D "73f215eccbd8233f414737ac06bca2687e67c44b97d2d757=
6091aa9718551110"
=20
-inherit autotools pkgconfig
+inherit meson pkgconfig
+
+EXTRA_OEMESON =3D "-Dtests=3Ddisabled -Ddocumentation=3Ddisabled"
=20
 UPSTREAM_CHECK_REGEX =3D "libevdev-(?P<pver>(\d+\.)+(?!90\d+)\d+)"
--=20
2.43.0


