Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDAECD8CA7
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 16:34:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.372.1763051691446138025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 08:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BF5712FC
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 08:34:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6888B3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 08:34:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] initscripts: don't read /proc/cmdline in populate-volatile during build
Date: Thu, 13 Nov 2025 16:34:38 +0000
Message-ID: <20251113163438.691353-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 16:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226253

The populate-volatile script will check for "clearcache" in the kernel
command line and wipe the caches if it has been set. This is useful at
boot, but we shouldn't be checking the kernel commandline when being
ran on the build machine at rootfs-time.

[ YOCTO #16056 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../initscripts-1.0/populate-volatile.sh      | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volat=
ile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.=
sh
index bc630e871c1..8b0139c094f 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -220,17 +220,19 @@ apply_cfgfile() {
 }
=20
 clearcache=3D0
-exec 9</proc/cmdline
-while read -r line <&9
-do
-	case "$line" in
-		*clearcache*)  clearcache=3D1
-			       ;;
-		*)	       continue
-			       ;;
-	esac
-done
-exec 9>&-
+if test -z "$ROOT_DIR"; then
+	exec 9</proc/cmdline
+	while read -r line <&9
+	do
+		case "$line" in
+			*clearcache*)  clearcache=3D1
+					;;
+			*)	       continue
+					;;
+		esac
+	done
+	exec 9>&-
+fi
=20
 if test -e "${ROOT_DIR}/etc/volatile.cache" -a "$VOLATILE_ENABLE_CACHE" =
=3D "yes" -a "x$1" !=3D "xupdate" -a "x$clearcache" =3D "x0"
 then
--=20
2.43.0


