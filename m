Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8ECC5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 15:36:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56830.1786462584826415348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 08:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VJhhHPAZ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C9391516;
	Tue, 11 Aug 2026 08:36:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DDD483F632;
	Tue, 11 Aug 2026 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786462584; bh=I55QHWTcYtEfmeVfMXgNjdaqJ6dEG9i8qAbXsuqImBs=;
	h=From:To:Cc:Subject:Date:From;
	b=VJhhHPAZTKKPiPPuQSkoiFH+ShnCKO+7jmG2/TYA/Gk94BLkN/TGtCLT0CMbNscZk
	 lCb1JFyNjVQ3LqNxog7IUBvqWgeNc0e2cQAXBQ0LKiVk0YYjyjFQImetlFKRZWQHpv
	 NFCpsho5+0vBaJ7yO8EqUbI5ZLGkFb8zf5MtLryI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: twoerner@gmail.com
Subject: [PATCH 1/2] wic: remove gptfdisk dependency
Date: Tue, 11 Aug 2026 16:36:17 +0100
Message-ID: <20260811153619.2048639-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 15:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243213

Originally, wic needed gptfdisk because it ran the sgdisk command. But
wic has used sfdisk from util-linux (which is scriptable and supports
GPT, two defining characteristics of sgdisk) since 2024[1] and no longer
calls sgdisk (or any other commands from gptfdisk).

This commit has always been in the split-out wic, and was part of oe-core
from walnascar onwards.

Remove the dependency on gptfdisk from the wic recipe and the test image
wic-image-minimal.bb.

[1] wic 518dea0 ("wic: add WIC_SECTOR_SIZE variable")

Signed-off-by: Ross Burton <ross.burton@arm.com>

wic-image-minimal: remove gptfdisk-native dependency

As with the previous commit, wic no longer calls gptdisk.
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 +-
 meta/recipes-support/wic/wic_0.3.1.bb                  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/met=
a-selftest/recipes-test/images/wic-image-minimal.bb
index 89843d9b3ca..1c6455bb6be 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -6,7 +6,7 @@ IMAGE_INSTALL =3D "packagegroup-core-boot"
=20
 IMAGE_FSTYPES =3D "wic"
=20
-WKS_FILE_DEPENDS =3D "dosfstools-native mtools-native gptfdisk-native"
+WKS_FILE_DEPENDS =3D "dosfstools-native mtools-native"
 WKS_FILE_DEPENDS:append:x86 =3D " syslinux-native syslinux"
 WKS_FILE_DEPENDS:append:x86-64 =3D " syslinux-native syslinux"
 WKS_FILE_DEPENDS:append:x86-x32 =3D " syslinux-native syslinux"
diff --git a/meta/recipes-support/wic/wic_0.3.1.bb b/meta/recipes-support=
/wic/wic_0.3.1.bb
index 116b0a2cd29..308389c183d 100644
--- a/meta/recipes-support/wic/wic_0.3.1.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -16,7 +16,6 @@ RDEPENDS:${PN} +=3D " \
     python3-logging \
     python3-misc \
     parted \
-    gptfdisk \
     dosfstools \
     mtools \
     bmaptool \
--=20
2.43.0


