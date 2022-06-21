Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C10FC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 05:09:52 +0000 (UTC)
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mx.groups.io with SMTP id smtpd.web09.40082.1655788188813902119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 22:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.180, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.92,209,1650960000";
   d="scan'208";a="77477263"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 20 Jun 2022 21:09:48 -0800
IronPort-SDR: 
 8sb/w2Ra8Iy5/7Nt56tuHYvm6iNWU8KGBd+TbxQlKoU1HPkw9HRgmANPYj4bba/uGqUaxsfEmO
 J7NOgvPLJEI0u22tZzMWpEwt6N2xcU7QvUOEvlB1z79p0555+c6ZJUVoFawsa71GEoEOLcCYzx
 99nQdTnU+n1k1Vb+Sf0oQhWgYWLs5MrqQFFwiB15SMVcYVtaWMLg326G8mBfoohlXOK+qvLlr1
 PewmMoWApgpSIPsY+BBM49vEJi/qSTKq40xp9SxkRtCZJv8wG2lDLBWzmHwEwQRzZNQ3qzxaGR
 bSQ=
From: Muhammad Hamza <muhammad_hamza@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Muhammad Hamza <muhammad_hamza@mentor.com>, Ansar Rasool
	<ansar_rasool@mentor.com>
Subject: [PATCH] udev-extraconf/mount.sh: ignore lvm in automount
Date: Tue, 21 Jun 2022 10:09:37 +0500
Message-ID: <20220621050937.2332316-1-muhammad_hamza@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 05:09:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167129

Failure message is shown in boot logs when trying to
mount lvm as automounter does not handle cases where
lvm is mounted. This simply skips lvm while automounting
to avoid failure message in boot logs.

Signed-off-by: Ansar Rasool <ansar_rasool@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 5195bf8dc2..0b0a22965a 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -83,6 +83,8 @@ automount_systemd() {
         ;;
     swap)
         return ;;
+    lvm*|LVM*)
+        return ;;
     # TODO
     *)
         ;;
@@ -143,6 +145,8 @@ automount() {
 		;;
 	swap)
 		return ;;
+	lvm*|LVM*)
+                return ;;
 	# TODO
 	*)
 		;;
-- 
2.25.1


