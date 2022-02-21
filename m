Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB044C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 17:32:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1705.1645464777299013350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A47DB106F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:32:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FBB33F70D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:32:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] poky-tiny: set QB_DEFAULT_FSTYPE correctly
Date: Mon, 21 Feb 2022 17:32:53 +0000
Message-Id: <20220221173253.768983-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221173253.768983-1-ross.burton@arm.com>
References: <20220221173253.768983-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 17:32:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162062

QB_DEFAULT_FSTYPE is used literally as the image extension in the testima=
ge
code, so this shouldn't be set as IMAGE_FSTYPES because that variable is =
a
list of image types, so if IMAGE_FSTYPES is extended and testimage ran it
will try to look for an image called e.g. "core-image-minimal-cpio.gz ext=
4".

Instead, set QB_DEFAULT_FSTYPE explicitly to cpio.gz.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro=
/poky-tiny.conf
index 8fae126cbc..efa111d5b1 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -97,8 +97,7 @@ INIT_MANAGER ?=3D "mdev-busybox"
 # udev, grub, etc.  These pull in gettext, which fails to build with wid=
e
 # character support.
 IMAGE_FSTYPES =3D "cpio.gz"
-
-QB_DEFAULT_FSTYPE =3D "${IMAGE_FSTYPES}"
+QB_DEFAULT_FSTYPE =3D "cpio.gz"
=20
 # Drop v86d from qemu dependency list (we support serial)
 # Drop grub from meta-intel BSPs
--=20
2.25.1


