Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RXxfE-0004iL-QY
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 17:14:40 +0100
Received: by mail-gx0-f175.google.com with SMTP id h1so6444446ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 08:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=+9Pcvh7OCosTYMH/RP5Oa/F+D9PyMsxR+m8EtRq1bRg=;
	b=PSEjEJTN4psxWNyYKJ9cVPLH9eVKon2o3jBaDdYcrFK1U8ZPpDHSW7orAYKsQf3xGs
	aOAe0KxWtldk54ecp7ueNd6YwgH/41pNMnscUnMmDhugs2AwSUata3L8roBHcU5pQ4hX
	byB8OnHqe1MsgWxXAFXuATOHDrqNm7NaQuhjY=
Received: by 10.236.179.2 with SMTP id g2mr20374077yhm.27.1323187675211;
	Tue, 06 Dec 2011 08:07:55 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l27sm62085463ani.21.2011.12.06.08.07.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 08:07:54 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 16:07:31 +0000
Message-Id: <eeec6f5e18bc04d5463be1e18331e08923f6afc1.1323187516.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
Subject: [PATCH 5/5] initramfs-module-udev: add
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
X-List-Received-Date: Tue, 06 Dec 2011 16:14:41 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../initrdscripts/initramfs-module-udev/udev       |   22 ++++++++++++++++++++
 .../initrdscripts/initramfs-module-udev_1.0.bb     |   16 ++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-udev/udev
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-udev_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/initramfs-module-udev/udev b/meta/recipes-core/initrdscripts/initramfs-module-udev/udev
new file mode 100644
index 0000000..9ea8aa3
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-udev/udev
@@ -0,0 +1,22 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+udev_enabled() {
+	if [ ! -e /sbin/udevd ]; then
+		debug "/sbin/udev doesn't exist"
+		return 1
+	fi
+
+	return 0
+}
+
+udev_run() {
+	mkdir -p /run
+
+	udevd --daemon > /dev/null
+	udevadm trigger --action=add
+	udevadm settle
+
+	killall udevd 2>/dev/null
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-udev_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-udev_1.0.bb
new file mode 100644
index 0000000..a3fcba0
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-udev_1.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "initramfs support for udev"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS = "initramfs-base udev udev-utils"
+RCONFLICTS = "initramfs-module-mdev"
+
+inherit allarch
+
+SRC_URI = "file://udev"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/udev ${D}/init.d/01-udev
+}
+
+FILES_${PN} = "/init.d/*"
-- 
1.7.2.5



