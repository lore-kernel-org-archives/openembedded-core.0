Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE16C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:24:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12014.1784132661245845904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ITqnWRKa;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76D2F152B;
	Wed, 15 Jul 2026 09:24:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 353203F7B4;
	Wed, 15 Jul 2026 09:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784132660; bh=yR6rek2dg9HVCQkJpkRbodK8cKCUT7LDO7r+3JnD2CU=;
	h=From:To:Cc:Subject:Date:From;
	b=ITqnWRKakniRDVJZijiu+Wj/j0C3QYwzJRiZpL8OQ1fJm8jViz/Lq8TvJfUEAAuDi
	 2OjLo9UDB3l1yYhdzG/Dd3vmqR39JvGLWsORjYjDDmqCBHJBMGCe2eVhwp7xx1chlL
	 2eB8P1Ns3v/k8zHceI8YOMA885uZP56P9f5D/9AI=
From: Ross Burton <ross.burton@arm.com>
To: poky@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] distro/poky: enable minidebuginfo DISTRO_FEATURE
Date: Wed, 15 Jul 2026 17:24:10 +0100
Message-ID: <20260715162410.639632-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240988

Enable the "minidebuginfo" DISTRO_FEATURE in poky builds, so that all
binaries have just enough debuginfo in them to get a useful stack trace.

This aids with debugging occasional failures that hit the autobuilder,
at minimal cost.  For example, core-image-sato with systemd:

  core-image-sato: IMAGESIZE changed from 481532 to 486044 (+1%)
  glibc: PKGSIZE changed from 3715743 to 3805871 (+2%)
  sqlite3: PKGSIZE changed from 462840 to 469056 (+1%)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky=
.conf
index 2ba98f4ba2..86576e48a0 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -13,7 +13,7 @@ TARGET_VENDOR =3D "-poky"
 LOCALCONF_VERSION =3D "2"
=20
 # Override these in poky based distros
-POKY_DEFAULT_DISTRO_FEATURES =3D ""
+POKY_DEFAULT_DISTRO_FEATURES =3D "minidebuginfo"
 POKY_DEFAULT_EXTRA_RDEPENDS =3D "packagegroup-core-boot"
 POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-module-af-packet"
=20
--=20
2.43.0


