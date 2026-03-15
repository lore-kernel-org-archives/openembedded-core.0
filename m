Return-Path: <opensource@nabladev.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63427D58B1B
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 12:44:11 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27926.1773578646265664113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 05:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nabladev.com header.s=dkim header.b=FNuaxqTC;
 spf=pass (domain: nabladev.com, ip: 178.251.229.89, mailfrom: opensource@nabladev.com)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EA83109A17;
	Sun, 15 Mar 2026 13:44:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773578644; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=fqMu/tFB4ty02XIplk2jycH8Vchjrv5AtQ06Z+JTO3Q=;
	b=FNuaxqTCZRG/z93mMP/M0MhLsQYQc6UYNi+TPO3giSmPkcTnNyp4bd9Q7KN2/6GQyoiG8J
	QWbhWu9wHUQd7rLDIR9VewVX33s15uD90sL978DbR+/8RfvIwPOfmD6ePQBE6nnaFTUxGh
	TQ8aXskdQKSgBcVeQxT+omkSsfpzy8Pzd5jeZ+tIzBLhc/C+4ule/NVHVe/92npQ+d4H9i
	A1v8AfgYbrTcErjtUSSRgiXe0v3Xg9fZtxiKeJC1YusJBzhk3mKcVM7xWD4Tna7d2mkLeC
	2NWErfvOUFLOCgZMoQG+cphEjJmNms58EFjt1osOuvx4rju1lcCNEtNs6bgKDg==
From: opensource@nabladev.com
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@nabladev.com>
Subject: [PATCH] udev-extraconf: detect init manager from pid
Date: Sun, 15 Mar 2026 13:44:01 +0100
Message-ID: <20260315124401.53744-1-opensource@nabladev.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 12:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233107

From: Stefano Babic <sbabic@nabladev.com>

Detecting the init manager from /sbin/init does not always work and it
fails when etc-overlayfs is used, because first the
pre-init script is called and init is renamed as init.orig.. Read the
process name with pid =3D 1 from /proc, and use it to detect the init man=
ager.

Signed-off-by: Stefano Babic <sbabic@nabladev.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipe=
s-core/udev/udev-extraconf/mount.sh
index 4827779e2f..3ddee84b78 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -4,7 +4,8 @@
 #
 # Attempt to mount any added block devices and umount any removed device=
s
=20
-BASE_INIT=3D"`readlink -f "@base_sbindir@/init"`"
+INITNAME=3D`cat /proc/1/cmdline`
+BASE_INIT=3D"`readlink -f ${INITNAME}`"
 INIT_SYSTEMD=3D"@systemd_unitdir@/systemd"
 MOUNT_BASE=3D"@MOUNT_BASE@"
=20
@@ -165,7 +166,7 @@ automount() {
 		echo "$name" > "/tmp/.automount-$name"
 	fi
 }
-=09
+
 rm_dir() {
 	# We do not want to rm -r populated directories
 	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
--=20
2.43.0


