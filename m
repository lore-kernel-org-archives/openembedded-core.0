Return-Path: <baruch@tkos.co.il>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1851C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 07:23:04 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web10.12713.1707376974871917500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 23:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tkos.co.il header.s=default header.b=b2AyZ+48;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 33C56440845;
	Thu,  8 Feb 2024 09:22:21 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707376941;
	bh=1ayAdLdjDsyzc5FG57GhI5xlIbhNAc3Lr8GE2HfIKcA=;
	h=From:To:Cc:Subject:Date:From;
	b=b2AyZ+48t3rFD7HjMkftp6l9TSShNWZ4Vau/KsecBFmYZAiri6Pg0GjdFLCi7p9L4
	 D6SoyLzHSFu6AGutTvlVzaw6AtpM2H/N0jxgb6xcwa6WwYnHY/IGYHMV+Gq4F+0o6x
	 a4TXsIwoEbRt8cDGRE0IHwn15eEd8f8IkqhUWtpjBwSLofUbx17kbc6vejK7EiPoEm
	 AflRZmRC+UG/o4EhGXluQIjkQZPCvBwLf6K7Hy4rMMzygqyDEzryK893AhZEJSmpPU
	 Y2l4szE/2JlKcBtV0A/opI/YPTEyaRZQHRhb9j3UIyAWfINtatwUxjP4v+lM+L0yyM
	 8fF98m6Ap5YzQ==
From: Baruch Siach <baruch@tkos.co.il>
To: openembedded-core@lists.openembedded.org
Cc: Baruch Siach <baruch@tkos.co.il>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] overlayfs-etc: take read-only-rootfs into account
Date: Thu,  8 Feb 2024 09:22:46 +0200
Message-ID: <391a7b90f3cb6a7b276904b69a2251bf0d3849c9.1707376966.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 07:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195104

Don't remount rootfs read-write when read-only-rootfs feature is
enabled. Assume that all mount points are in place for the read-only
case.

Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 meta/classes-recipe/overlayfs-etc.bbclass |  4 +++-
 meta/files/overlayfs-etc-preinit.sh.in    | 16 +++++++++-------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-rec=
ipe/overlayfs-etc.bbclass
index 0c7834d01f43..e695ebdcf843 100644
--- a/meta/classes-recipe/overlayfs-etc.bbclass
+++ b/meta/classes-recipe/overlayfs-etc.bbclass
@@ -69,7 +69,9 @@ python create_overlayfs_etc_preinit() {
         'OVERLAYFS_ETC_FSTYPE': overlayEtcFsType,
         'OVERLAYFS_ETC_DEVICE': overlayEtcDevice,
         'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrigIn=
it else initBaseName,
-        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"
+        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"=
,
+        'READ_ONLY_ROOTFS': bb.utils.contains("IMAGE_FEATURES", "read-on=
ly-rootfs",
+                                              "true", "false", d)
     }
=20
     if useOrigInit:
diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayf=
s-etc-preinit.sh.in
index 8db076f4ba65..79cecf8ac97d 100644
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
+if ! {READ_ONLY_ROOTFS}; then
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


