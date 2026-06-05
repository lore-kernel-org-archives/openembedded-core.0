Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2056BCD8C81
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 15:15:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10365.1780672517087686893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 08:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KKSTTjIa;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBB2632F4
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 08:15:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E3A93F86F
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 08:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780672516; bh=3qNyzQ57oRNKlgSWvRyk9HLoxUzqTktiN++ol+dTlX4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KKSTTjIaK6db8OgPyQLKFWEMtqoULTZeF4bpuVg0kOuk4P1d13+KTSnOw9xe5j59C
	 Z6GA3NtrO39tS6OoHqQ2jqT2PfPnYtFikuHo7YbBn3AjkdiHt59DQn+HyOyf0bCcWv
	 oIxGhC+dOeB4YDAO53vg0kciaqq3rlc6epzd2xcs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3: remove toolchain dependencies in python3-ptest
Date: Fri,  5 Jun 2026 16:15:09 +0100
Message-ID: <20260605151511.3522627-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605151511.3522627-1-ross.burton@arm.com>
References: <20260605151511.3522627-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238174

The tests that build extension code in the test suite are not currently
enabled: we need to opt-in to both the "calls subprocesses" and "CPU
intensive" features.

Until that is done, drop the dependencies. They're only valid for when
python3 was built with the GCC toolchain and would need to be set using
toolchain overrides instead, and there's also breakage if ccache is
enabled.

This has the side-effect of removing a dependency on target gcc from all
builds of python3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipe=
s-devtools/python/python3_3.14.5.bb
index 501de75fb18..b3709db9e21 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -553,10 +553,6 @@ RDEPENDS:${PN}-ptest =3D "\
     binutils \
     bzip2 \
     coreutils \
-    gcc \
-    gcc-symlinks \
-    g++ \
-    libgcc \
     locale-base-fr-fr \
     locale-base-en-us \
     locale-base-de-de \
--=20
2.43.0


