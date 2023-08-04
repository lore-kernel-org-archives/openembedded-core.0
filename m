Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A15C001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 15:29:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.272.1691162979102729204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 08:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A5B61007;
	Fri,  4 Aug 2023 08:30:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C1DF3F6C4;
	Fri,  4 Aug 2023 08:29:37 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] systemd: set correct paths for kdb binaries
Date: Fri,  4 Aug 2023 16:29:36 +0100
Message-Id: <20230804152936.1861831-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 15:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185527

From: Ross Burton <ross.burton@arm.com>

The kbd binaries (loadkeys and setfont) are installed to bindir, not
base_bindir.

Fixes: 94ccc7acc4a871f5bb7ab8e135e70b5519eff6ad
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_254.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core=
/systemd/systemd_254.bb
index ea1a4f02f05..3dd949e69c7 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -252,8 +252,8 @@ EXTRA_OEMESON +=3D "-Dkexec-path=3D${sbindir}/kexec \
                   -Dsulogin-path=3D${base_sbindir}/sulogin \
                   -Dnologin-path=3D${base_sbindir}/nologin \
                   -Dumount-path=3D${base_bindir}/umount \
-                  -Dloadkeys-path=3D${base_bindir}/loadkeys \
-                  -Dsetfont-path=3D${base_bindir}/setfont"
+                  -Dloadkeys-path=3D${bindir}/loadkeys \
+                  -Dsetfont-path=3D${bindir}/setfont"
=20
 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??=3D "60"
--=20
2.34.1


