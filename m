Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooperjr27@gmail.com>) id 1TDkYZ-0004L5-Ds
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 01:16:47 +0200
Received: by mail-ob0-f175.google.com with SMTP id lz20so9889076obb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 16:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pM4El86IC1hmZ6k/Wm3QLLx6s27zA69VDlJ42FLMKU0=;
	b=n7j+Ah/X+lqlpEBT5fjKTvWiWRzuZkVkT29RwS2HM31c1/kKwv4800YEpp+Xgw3cb8
	z+1mgMkRB9NHWqZk9nSRxbaLeDjJpYjDdBcm9QrGmJMzwvxgXWlfmNeCTTpAwiUzY54z
	bciDnK5o8iVK2x5f3Xt/pJC/prpCc+26/r02mNddL5FTrPkI8BNdIYvPgpijy5zzcKLD
	+LZsYXqOLZXZPSGPUCgLOyxF/Kxz1PgL2OqgevTtqKKWt8JAuhTUMfvh0vrUN8DGfGY6
	EAteg5Uk8AGwi8AScZJV2yBkLDiR6LN4Q6Xr7bFqX4CKTUFvJI/RGbruNr7PvWciMMdA
	btVw==
Received: by 10.182.131.98 with SMTP id ol2mr13262857obb.69.1347923050303;
	Mon, 17 Sep 2012 16:04:10 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d6sm12216451obx.15.2012.09.17.16.04.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 16:04:09 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 18:25:53 -0500
Message-Id: <1347924353-11159-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1347924353-11159-1-git-send-email-fcooper@ti.com>
References: <1347924353-11159-1-git-send-email-fcooper@ti.com>
Subject: [denzil][PATCH 2/2] dbus: Ensure dbus-nativesdk doesn't RPROVIDE dbus-x11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 23:16:47 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

dbus-x11 should not RPROVIDE dbus-x11 as this is incorrect and confuses
builds. This fixes the nativesdk case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dbus/dbus.inc |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 164c4d3..1984c74 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -33,9 +33,12 @@ DEBIANNAME_${PN} = "dbus-1"
 
 PACKAGES =+ "${PN}-lib ${PN}-systemd"
 
+OLDPKGNAME = "dbus-x11"
+OLDPKGNAME_virtclass-nativesdk = ""
+
 # for compatibility
-RPROVIDES_${PN} = "dbus-x11"
-RREPLACES_${PN} += "dbus-x11"
+RPROVIDES_${PN} = "${OLDPKGNAME}"
+RREPLACES_${PN} += "${OLDPKGNAME}"
 
 FILES_${PN}-systemd = "${systemd_unitdir}/system/"
 
-- 
1.7.0.4



