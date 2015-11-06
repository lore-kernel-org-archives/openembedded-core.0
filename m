Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6204560124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:30 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so116503651pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QQ+0d5eLveLeY76J+FrZzZoLmIECQ3w52IPb8qH1jBc=;
	b=B6vhclQtIkv7JERzAnBG4qCqYdAlD8SVx7SJzHgH1pxZprT6+ZpiTyX8QEWH6MExmb
	laa5c60iroEPFdzL42RetRKcO5a5DvwhMm+TwLsRZ+OK8oJRaVDEqC6hmrqw3wO1trOI
	fTKQRPgaeBcDEetvkx4KU7YvlLxrEYTbuj96IkoQS/cZ0g4Yi+W/DB0sMChQ8LBVV4vc
	RXEs3Ywrl4PlAVO0mmH3mOhJFImlIDiMoFZ6gaoIODRDtszXomeBlR+dXPRX9SwOOY/6
	sTxSW5P/OUisr2OGlsQCWQZwxXECZJEcPI99U0aY+Fg4xtWTnUzW1Acfc//eXzKBGQpt
	Z8uQ==
X-Received: by 10.68.138.233 with SMTP id qt9mr15599005pbb.99.1446799651318;
	Fri, 06 Nov 2015 00:47:31 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:30 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:03 -0800
Message-Id: <1446799631-7037-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 03/11] busybox: move EXTRA_OEMAKE etc into busybox.inc
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:31 -0000

EXTRA_OEMAKE and do_install_ptest() are currently common to all supported
versions of busybox, so move from version specific recipes into busybox.inc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 7 +++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb | 8 --------
 meta/recipes-core/busybox/busybox_git.bb    | 8 --------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 5e59ca7..48a012c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -19,6 +19,7 @@ export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
 EXTRA_OEMAKE += "'LD=${CCLD}'"
+EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
@@ -301,6 +302,12 @@ do_install () {
     fi
 }
 
+do_install_ptest () {
+        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
+        cp ${B}/.config      ${D}${PTEST_PATH}/
+        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+}
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "50"
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 2559823..e9f7eb6 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -43,11 +43,3 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
 SRC_URI[tarball.sha256sum] = "05a6f9e21aad8c098e388ae77de7b2361941afa7157ef74216703395b14e319a"
-
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-
-do_install_ptest () {
-        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
-        cp ${B}/.config      ${D}${PTEST_PATH}/
-        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
-}
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ed1c0a8..e9ff0bc 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -44,12 +44,4 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://getopts.cfg \
 "
 
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-
-do_install_ptest () {
-        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
-        cp ${B}/.config      ${D}${PTEST_PATH}/
-        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
-}
-
 DEFAULT_PREFERENCE = "-1"
-- 
1.9.1


