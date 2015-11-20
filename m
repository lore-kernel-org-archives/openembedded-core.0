Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id BA8BB6212F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:19 +0000 (UTC)
Received: by ioc74 with SMTP id 74so138211480ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2vdj2BjR9fjAWDN4kz70eAc6LvSA6iYOBpfKHj7l+Uw=;
	b=kWkniDiBzhdukg5Et4kuol6ptoNLR7bEWEz/7BFhZHS1HEQtA6RLpheGOoXo9yql3k
	N7WLiJ0vbCUMZXTgfbFqeJN2aR4lrAi+SyIFGKTv/0oUJxq9rGGSFBNNzsEnAPZA1tvr
	/pEt9RfYwFr+7jvtCTLb7KcxvxWkXcv9BN4zMK1Mxa585FINWy7PJo/CiDzPwqzD5VZl
	fULfg1lMMDgae2fiyL9FPJvlqQQRecHxJR2mIZGrDWCG2dytXbJ53Atq87rHu5NZKNXH
	ctv+NqglCA+FwatoFGjwNlQA7E3DNOcWBgKPJ53Yqtp/o/QoG5C5ZyH24py8YOoIsmGG
	OuaA==
X-Received: by 10.107.1.196 with SMTP id 187mr18570864iob.167.1448059460129;
	Fri, 20 Nov 2015 14:44:20 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:18 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:50 -0800
Message-Id: <1448059438-24431-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:20 -0000

EXTRA_OEMAKE options and do_install_ptest() are common to both
busybox recipes, so move into busybox.inc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 8 +++++++-
 meta/recipes-core/busybox/busybox_1.23.2.bb | 8 --------
 meta/recipes-core/busybox/busybox_git.bb    | 8 --------
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 9e1a207..ac534a4 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,7 +18,7 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
-EXTRA_OEMAKE += "LD='${CCLD}'"
+EXTRA_OEMAKE += "LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
@@ -301,6 +301,12 @@ do_install () {
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


