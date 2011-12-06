Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RXxf9-0004iN-Bu
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 17:14:35 +0100
Received: by mail-yx0-f175.google.com with SMTP id q1so2023632yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 08:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=kl2S1fyEUC0FcMGYNS6VoAW51+WYyAVUlaB8AUMkvac=;
	b=YjqI+U2SgsF7ZDa7nYwuJVxw1JZae2j5sp+efXjgibgvBQzSB0nKuaxWdQ6z8LLpvc
	yD1ZiOoytolu0uan5hois/XfR6OKcAfVlN5Z1717RejmwqaCIg01Mp5pIhFWxJx1vuwg
	aNKMn0kr/DiqwnVuymLcoiM+WS76Ds32E/nVQ=
Received: by 10.236.153.226 with SMTP id f62mr20530837yhk.62.1323187670058;
	Tue, 06 Dec 2011 08:07:50 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l27sm62085463ani.21.2011.12.06.08.07.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 08:07:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 16:07:29 +0000
Message-Id: <5f5928bc7457cee8e16558383cee848b4c43fb20.1323187516.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
Subject: [PATCH 3/5] initramfs-module-mdev: add
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
X-List-Received-Date: Tue, 06 Dec 2011 16:14:35 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../initrdscripts/initramfs-module-mdev/mdev       |   30 ++++++++++++++++++++
 .../initrdscripts/initramfs-module-mdev_1.0.bb     |   16 ++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-mdev/mdev
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-mdev_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/initramfs-module-mdev/mdev b/meta/recipes-core/initrdscripts/initramfs-module-mdev/mdev
new file mode 100644
index 0000000..a5df1d7
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-mdev/mdev
@@ -0,0 +1,30 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+mdev_enabled() {
+	if [ ! -e /sbin/mdev ]; then
+		debug "/sbin/mdev doesn't exist"
+		return 1
+	fi
+
+	return 0
+}
+
+mdev_run() {
+	# setup the environment
+	mount -t tmpfs tmpfs /dev
+
+	mkdir -m 1777 /dev/shm
+
+	mkdir -m 0755 /dev/pts
+	mount -t devpts devpts /dev/pts
+
+	echo /sbin/mdev > /proc/sys/kernel/hotplug
+	mdev -s
+
+	# load modules for devices
+	find /sys -name modalias | while read m; do
+		load_kernel_module $(cat $m)
+	done
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-mdev_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-mdev_1.0.bb
new file mode 100644
index 0000000..e1af0e3
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-mdev_1.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "initramfs support for mdev"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS = "initramfs-base"
+RCONFLICTS = "initramfs-module-udev"
+
+inherit allarch
+
+SRC_URI = "file://mdev"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/mdev ${D}/init.d/01-mdev
+}
+
+FILES_${PN} = "/init.d/*"
-- 
1.7.2.5



