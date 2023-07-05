Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1891C001B0
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 15:32:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20893.1688571123703394149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 08:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A67D2175A;
	Wed,  5 Jul 2023 08:32:45 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF3F63F762;
	Wed,  5 Jul 2023 08:32:02 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] rootfs_rpm: don't depend on opkg-native for update-alternatives
Date: Wed,  5 Jul 2023 16:31:59 +0100
Message-Id: <20230705153159.2302752-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 15:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183895

From: Ross Burton <ross.burton@arm.com>

opkg-native hasn't provided update-alternatives since 2014[1] so this is
the wrong dependency, and image.bbclass depends on the virtual provider
virtual/update-alternatives-native already.

[1] oe-core 1e2c38ce13f8e4b25d8656d237343380cbc970aa

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/rootfs_rpm.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rootfs_rpm.bbclass b/meta/classes-recipe=
/rootfs_rpm.bbclass
index 6eccd5a9599..55f1cc92ca9 100644
--- a/meta/classes-recipe/rootfs_rpm.bbclass
+++ b/meta/classes-recipe/rootfs_rpm.bbclass
@@ -20,11 +20,9 @@ IMAGE_ROOTFS_EXTRA_SPACE:append =3D "${@bb.utils.conta=
ins("PACKAGE_INSTALL", "dnf"
 # Dnf is python based, so be sure python3-native is available to us.
 EXTRANATIVEPATH +=3D "python3-native"
=20
-# opkg is needed for update-alternatives
 RPMROOTFSDEPENDS =3D "rpm-native:do_populate_sysroot \
     dnf-native:do_populate_sysroot \
-    createrepo-c-native:do_populate_sysroot \
-    opkg-native:do_populate_sysroot"
+    createrepo-c-native:do_populate_sysroot"
=20
 do_rootfs[depends] +=3D "${RPMROOTFSDEPENDS}"
 do_populate_sdk[depends] +=3D "${RPMROOTFSDEPENDS}"
--=20
2.34.1


