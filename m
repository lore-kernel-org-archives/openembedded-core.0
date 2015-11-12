Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 13C3477277
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:40:05 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so79750930pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Z+h/SULErDr/9MZ7RoZaetFUdeTrNAYCyF1XQGuE+vs=;
	b=eqRfIH2dV27aB2fpfRKygMPSGOQg/kA+SqngaOZudvWYN4489rbpTSOETqJOWVEIfh
	PldJ2Rqna7hX1dlMSf5cmuMbpC+1UMZX3MpEN4P+6XS4PUzEu1OHP2zqx27dFacyBteG
	ibmANVZJaAzOz+B5A75oiyBvWKBA91LoIQoBQY7JRxzuPa6amdxf+2pMbLmySABe9Tlo
	cMXENqVboxgcG16vDTZUOLAV+kGpKzj3NvwHxxxUnU9R1TNEMcbjswoLt9CTLIzJ62f/
	fBQ3HvF8vQ0erV5bhKQjpPx2yqixDc9jSC8aX6EdpTZVED8a4OaYftko8p425MNXR1kb
	WCNw==
X-Received: by 10.66.102.65 with SMTP id fm1mr27090696pab.20.1447371605603;
	Thu, 12 Nov 2015 15:40:05 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.40.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:40:02 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:19 -0700
Message-Id: <7dfc5c44d99054fd0f087bd1b4102aef0511029e.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 08/11] systemd: drop unneeded $D check in prerm
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
X-List-Received-Date: Thu, 12 Nov 2015 23:40:05 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/qemu.bbclass                | 5 +++++
 meta/recipes-core/systemd/systemd_225.bb | 6 +-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 315c17f..1f5bbcc 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -50,3 +50,8 @@ QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e5500"
 QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e6500"
 QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e6500"
 QEMU_EXTRAOPTIONS_ppc7400   = " -cpu 7400"
+
+python () {
+    if "QEMU_EXTRAOPTIONS" in d and d.expand("QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}") not in d and d.getVar("PACKAGE_ARCH", True) != "all":
+        bb.fatal("Incorrect use of overrides rather than PACKAGE_ARCH for QEMU_EXTRAOPTIONS")
+}
diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 9b0503d..6bd9adc 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -408,11 +408,7 @@ pkg_postinst_udev-hwdb () {
 }
 
 pkg_prerm_udev-hwdb () {
-	if test -n "$D"; then
-		exit 1
-	fi
-
-	rm -f ${sysconfdir}/udev/hwdb.bin
+	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
 
 # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
-- 
2.2.1


