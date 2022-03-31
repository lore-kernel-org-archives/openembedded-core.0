Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA78FC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.653.1648751358746723060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4E7813D5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86D313F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/23] image_types: hddimg and iso only work on x86
Date: Thu, 31 Mar 2022 19:28:54 +0100
Message-Id: <20220331182915.22128-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163844

These image types use syslinux which is only available on x86, so only
add them to IMAGE_TYPES on x86.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/image_types.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index f643ed3ce7f..960dab1a60e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -264,8 +264,6 @@ IMAGE_TYPES =3D " \
     ext3 ext3.gz \
     ext4 ext4.gz \
     btrfs \
-    iso \
-    hddimg \
     squashfs squashfs-xz squashfs-lzo squashfs-lz4 squashfs-zst \
     ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
@@ -275,6 +273,9 @@ IMAGE_TYPES =3D " \
     f2fs \
     erofs erofs-lz4 erofs-lz4hc \
 "
+# These image types are x86 specific as they need syslinux
+IMAGE_TYPES:append:x86 =3D " hddimg iso"
+IMAGE_TYPES:append:x86-64 =3D " hddimg iso"
=20
 # Compression is a special case of conversion. The old variable
 # names are still supported for backward-compatibility. When defining
--=20
2.25.1


