Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id AAE9D60FA6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2013 21:42:04 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id j1so3047892oag.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2013 14:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tnt39nxtlFS6ioJlwLoA1VfD831GPakgJZO+KQ6+AC8=;
	b=cdYSW6dYcuKee3qQTD/QkFopcjXwEd5BRhxieu4Bx1Rm04SpzOmHYIuRZFg2T0Xf6w
	UyBld/113H3/knlAAKaDkGEfWQQr6l7uviRR1hFAd7tN2+P1ZbsqEASX6g3jHo5c9+GV
	/hUqO0YzwyXRmk6uvbeu88FOLPLNoq/S4YH9CyzWw5ITgnZMS2qVjjDnVL9pDdjlo0/6
	99tyEnBYYzepjumFV4E+kO25QRhIVjZaEWTDHx4PmaUzM14dwEIhODnunhR2QiwUJbxK
	RKdwr8lh6v5gQXtAXaQVONNrDMp8+FHWaRJr2eSMuz3GkoW6PCD6YNbkq5ubASN+s74X
	lHZg==
X-Gm-Message-State: ALoCoQnPKC1VJpbDWCnMIbrF+PMAfE+FY81pbDy5Sl9CBkNZewvlx+3WG+s6APeq8st75bEF1jKj
X-Received: by 10.60.68.135 with SMTP id w7mr16320964oet.9.1380836526034;
	Thu, 03 Oct 2013 14:42:06 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id rl1sm21159726oeb.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 03 Oct 2013 14:42:05 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Oct 2013 14:42:00 -0700
Message-Id: <1380836520-17121-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2] update-rc: Stop and remove service if updating package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Oct 2013 21:42:05 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Since when updating packages packages managers do not remove the previous package,
it just replaces new files and run pre/post install scripts. This causes not
to update update-rc scripts if they were changed.

This patch is useful in case the newer package version updated the update-rc
script.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/classes/update-rc.d.bbclass | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 5588569..77ea25d 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -13,7 +13,23 @@ INITSCRIPT_PARAMS ?= "defaults"
 INIT_D_DIR = "${sysconfdir}/init.d"
 
 updatercd_postinst() {
-if test "x$D" != "x"; then
+IN_TARGET=`test "x$D" = "x"`
+
+# test if there is a previous init script there, ie, we are updating the package
+# if so, we stop the service and remove it before we install from the new package
+if type update-rc.d >/dev/null 2>/dev/null; then
+	if [ $IN_TARGET -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
+		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+	fi
+	if [ ! $IN_TARGET ]; then
+		OPT="-f -r $D"
+	else
+		OPT="-f"
+	fi
+	update-rc.d $OPT ${INITSCRIPT_NAME} remove
+fi
+
+if [ ! $IN_TARGET ]; then
 	OPT="-r $D"
 else
 	OPT="-s"
-- 
1.8.3.1


