Return-Path: <baruch@tkos.co.il>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8C4C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 18:30:30 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web10.14179.1707762629520069669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 10:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tkos.co.il header.s=default header.b=Q6/0foxi;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id B28F5440865;
	Mon, 12 Feb 2024 20:29:50 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707762590;
	bh=Mb9tKe6hi/CZqqYH0rxX7vLYl3jdWbp5G9KQN4tPVUI=;
	h=From:To:Cc:Subject:Date:From;
	b=Q6/0foxi9LaXXsnXVM31Pp3yxCpWkHiHMl5/bWoonc+vwWdXEywR/KyDdF55h5SMU
	 mJe+089ONeAE1Eg0sd3HDL2xbjZdvPBLpBmqYSfOQZVh6sbgKHMNcf11yh9rRYWK0B
	 3Sjiz3iSmUKoaWgEHV0xNXP50CDGjeFaKweq45+DHyf+6cO7Fvz2FkYlt7gtYzKxy/
	 aNJH90o8Z/uXLa+nEro8v+2q4tpmMUO4+gl6+XfJTXsEcpnUChtNBmrd2UL+Xs7+UL
	 G20E5LpV1nyXLdU7zRVv7fXhCsihVTvSdbvOoqf8kssmst9vEZK50pf6LBkXnukYA9
	 bL0LeK66Zm7TA==
From: Baruch Siach <baruch@tkos.co.il>
To: openembedded-core@lists.openembedded.org
Cc: Baruch Siach <baruch@tkos.co.il>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2] overlayfs-etc: add option to skip creation of mount dirs
Date: Mon, 12 Feb 2024 20:30:06 +0200
Message-ID: <ed5d6a8c842319c81026bb4aab7e2a9de3c13189.1707762606.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 18:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195355

The 'preinit' script can't create mount directories when rootfs is
read-only. Add an option to skip this step. The user must make sure that
all required directories are already in the rootfs directory layout.

Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Add a user selectable option. Don't skip mkdir automatically when
    read-only-rootfs feature is enabled.
---
 meta/classes-recipe/overlayfs-etc.bbclass |  5 ++++-
 meta/files/overlayfs-etc-preinit.sh.in    | 16 +++++++++-------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-rec=
ipe/overlayfs-etc.bbclass
index 0c7834d01f43..d339fbbeee9f 100644
--- a/meta/classes-recipe/overlayfs-etc.bbclass
+++ b/meta/classes-recipe/overlayfs-etc.bbclass
@@ -41,6 +41,7 @@ OVERLAYFS_ETC_USE_ORIG_INIT_NAME ??=3D "1"
 OVERLAYFS_ETC_MOUNT_OPTIONS ??=3D "defaults"
 OVERLAYFS_ETC_INIT_TEMPLATE ??=3D "${COREBASE}/meta/files/overlayfs-etc-=
preinit.sh.in"
 OVERLAYFS_ETC_EXPOSE_LOWER ??=3D "0"
+OVERLAYFS_ETC_CREATE_MOUNT_DIRS ??=3D "1"
=20
 python create_overlayfs_etc_preinit() {
     overlayEtcMountPoint =3D d.getVar("OVERLAYFS_ETC_MOUNT_POINT")
@@ -62,6 +63,7 @@ python create_overlayfs_etc_preinit() {
     initBaseName =3D oe.path.join(d.getVar("base_sbindir"), "init")
     origInitNameSuffix =3D ".orig"
     exposeLower =3D oe.types.boolean(d.getVar('OVERLAYFS_ETC_EXPOSE_LOWE=
R'))
+    createMoundDirs =3D oe.types.boolean(d.getVar('OVERLAYFS_ETC_CREATE_=
MOUNT_DIRS'))
=20
     args =3D {
         'OVERLAYFS_ETC_MOUNT_POINT': overlayEtcMountPoint,
@@ -69,7 +71,8 @@ python create_overlayfs_etc_preinit() {
         'OVERLAYFS_ETC_FSTYPE': overlayEtcFsType,
         'OVERLAYFS_ETC_DEVICE': overlayEtcDevice,
         'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrigIn=
it else initBaseName,
-        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"
+        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"=
,
+        'CREATE_MOUNT_DIRS': "true" if createMoundDirs else "false"
     }
=20
     if useOrigInit:
diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayf=
s-etc-preinit.sh.in
index 8db076f4ba65..b05e3957a382 100644
--- a/meta/files/overlayfs-etc-preinit.sh.in
+++ b/meta/files/overlayfs-etc-preinit.sh.in
@@ -3,12 +3,15 @@
 echo "PREINIT: Start"
=20
 PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
-mount -o remount,rw /
-
-mkdir -p /proc
-mkdir -p /sys
-mkdir -p /run
-mkdir -p /var/run
+if {CREATE_MOUNT_DIRS}; then
+    mount -o remount,rw /
+
+    mkdir -p /proc
+    mkdir -p /sys
+    mkdir -p /run
+    mkdir -p /var/run
+    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
+fi
=20
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
@@ -20,7 +23,6 @@ UPPER_DIR=3D$BASE_OVERLAY_ETC_DIR/upper
 WORK_DIR=3D$BASE_OVERLAY_ETC_DIR/work
 LOWER_DIR=3D$BASE_OVERLAY_ETC_DIR/lower
=20
-mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
 if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
     -o {OVERLAYFS_ETC_MOUNT_OPTIONS} \
     {OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}
--=20
2.43.0


