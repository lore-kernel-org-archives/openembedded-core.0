Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A539BC282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 11:12:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19450.1741086757885226839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 03:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 399A1FEC
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 03:12:51 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2362B3F5A1
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 03:12:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] weston-init: improve XDG_RUNTIME_DIR fallback creation
Date: Tue,  4 Mar 2025 11:12:32 +0000
Message-ID: <20250304111233.4038622-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 11:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212262

Sanity-check the permissions of the directory already exists, and clean
up the creation code.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../wayland/weston-init/weston-start          | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/met=
a/recipes-graphics/wayland/weston-init/weston-start
index 01670cd4f51..3b13a0047a9 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -58,14 +58,19 @@ fi
=20
 if test -z "$XDG_RUNTIME_DIR"; then
 	export XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}`
-	if ! test -d "$XDG_RUNTIME_DIR"; then
-		mkdir --parents $XDG_RUNTIME_DIR
-		chmod 0700 $XDG_RUNTIME_DIR
-	fi
-	if [ -n "$WESTON_USER" ]
-	then
-		chown $WESTON_USER:$WESTON_GROUP $XDG_RUNTIME_DIR
+	if test -d "$XDG_RUNTIME_DIR"; then
+	    # Check permissions on existing directory
+	    if [ "$(stat -c %u-%a "$XDG_RUNTIME_DIR")" !=3D "$(id -u ${WESTON_U=
SER})-700" ]; then
+			echo "ERROR: $XDG_RUNTIME_DIR has incorrect permissions"
+			exit 1
+		fi
+	else
+		mkdir --mode 0700 --parents $XDG_RUNTIME_DIR
+		if [ -n "$WESTON_USER" ]
+		then
+			chown $WESTON_USER:$WESTON_GROUP $XDG_RUNTIME_DIR
+		fi
 	fi
 fi
=20
-su -c "XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}` weston $weston=
_args --log=3D/tmp/weston.log" $WESTON_USER
+su -c "XDG_RUNTIME_DIR=3D$XDG_RUNTIME_DIR weston $weston_args --log=3D/t=
mp/weston.log" $WESTON_USER
--=20
2.43.0


