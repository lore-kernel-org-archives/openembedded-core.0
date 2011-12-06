Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RXxfC-0004iL-QS
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 17:14:38 +0100
Received: by mail-gx0-f175.google.com with SMTP id h1so6444446ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 08:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=eNiHWg2E22+bvIKJq529kTBC4aq8GVm2zAwKw/vhZpU=;
	b=G7YC7lF/36uvwDspt7I2vs4gt0QKYp9obQ8sixdLrWW/B9XhAh6EHOM5E+e2h9EIId
	3HHuz9C4UGjz3njW6TYXfCJ4jtwbC248G/8lVAylGh2UaD+dPSJZlgUH3lwnHV0eZzcX
	eLrQWAz2iUMg943GTFIVUFOEblciDYEiQ6yaI=
Received: by 10.236.183.133 with SMTP id q5mr20317942yhm.38.1323187673201;
	Tue, 06 Dec 2011 08:07:53 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l27sm62085463ani.21.2011.12.06.08.07.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 08:07:51 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 16:07:30 +0000
Message-Id: <d3f26adf5c6129ea8023e87588c7898e3e19c74a.1323187516.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
Subject: [PATCH 4/5] initramfs-module-e2fs: add
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
X-List-Received-Date: Tue, 06 Dec 2011 16:14:39 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../initrdscripts/initramfs-module-e2fs/e2fs       |   28 ++++++++++++++++++++
 .../initrdscripts/initramfs-module-e2fs_1.0.bb     |   15 ++++++++++
 2 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-module-e2fs/e2fs
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-e2fs_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/initramfs-module-e2fs/e2fs b/meta/recipes-core/initrdscripts/initramfs-module-e2fs/e2fs
new file mode 100755
index 0000000..29f801a
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-e2fs/e2fs
@@ -0,0 +1,28 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+e2fs_enabled() {
+	return 0
+}
+
+e2fs_run() {
+	filesystems="ext4 ext3 ext2"
+
+	# load modules
+	for fs in $filesystems; do
+		load_kernel_module $fs
+	done
+
+	for fs in $filesystems; do
+		eval "fs_options=\$bootparam_${fs}"
+		if [ -n "$fs_options" ]; then
+		    dev=`expr "$fs_options" : '\([^:]*\).*'`
+		    path=`expr "$fs_options" : '[^:]*:\([^:]*\).*'`
+
+		    info "Mounting $dev as $fs on $path as $fs..."
+			mkdir -p $path
+		    mount -t $fs $dev $path
+		fi
+	done
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-e2fs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-e2fs_1.0.bb
new file mode 100644
index 0000000..89f15ae
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-e2fs_1.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "initramfs support for ext2/ext3/ext3"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS = "initramfs-base"
+
+inherit allarch
+
+SRC_URI = "file://e2fs"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/e2fs ${D}/init.d/20-e2fs
+}
+
+FILES_${PN} = "/init.d/*"
-- 
1.7.2.5



