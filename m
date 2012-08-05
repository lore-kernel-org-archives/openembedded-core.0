Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71b-0005Ex-VM
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:02:07 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so974714wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=YuQsZsFZWzQM382V+FXOPDraSg2NPtTXZUwZTwLhWek=;
	b=hm7VxtPvfncV5XS/XLgJChidV1GTvNCq4OnDwiiE7mhfubI3MngcXLwiGwkoYqtMFU
	lC6PLXdo2GuD9wTpy75JYNXiIsiVxNHcdQ3nJAuk9QefF5/cHy/IPu17hLNIa+HJWOHE
	4Pq4X+OSUr7PH0jALrNshYOnDAl1krnPlVOT2aZc/YpkEpncDRGqcNfBusispeYY33sa
	/f56neG8m/gRdXjdqat3dE/eLZvG1L5IZl6kvBNp9Z0xkBKtbwdI/Bb/1tBNk+Tk8+ru
	+a5qKm6Wb0t5nl21s+jY/rfLabhEHRGk+UWp99qwcCfqEnQDqPtmFUVpGqIQU6TY6ZG1
	/33A==
Received: by 10.180.81.133 with SMTP id a5mr12354590wiy.17.1344196226579;
	Sun, 05 Aug 2012 12:50:26 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:25 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:50 +0200
Message-Id: <1344196136-7643-23-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlx3Hegi9rkIIf2gDs7AHA1Ctem2PqMFL0gDkC1QaL9nT4RYsF/bscayfmHQn5cJD3IKrbx
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 22/28] xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 20:02:08 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../x11-common/xserver-nodm-init.bb                |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index 8fca056..eab76c5 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r29"
+PR = "r30"
 RDEPENDS_${PN} = "sudo"
 
 SRC_URI = "file://xserver-nodm \
@@ -14,12 +14,12 @@ S = "${WORKDIR}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_install() {
-    install -d ${D}/etc
-    install -d ${D}/etc/init.d
-    install xserver-nodm ${D}/etc/init.d
+    install -d ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}/init.d
+    install xserver-nodm ${D}${sysconfdir}/init.d
     if [ "${ROOTLESS_X}" = "1" ] ; then
-        install -d ${D}/etc/X11
-        install Xusername ${D}/etc/X11
+        install -d ${D}${sysconfdir}/X11
+        install Xusername ${D}${sysconfdir}/X11
     fi
 }
 
-- 
1.7.7.6



