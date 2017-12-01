Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id F133E786AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 13:05:38 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b184so12980170qkc.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 05:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=GLDNGKDVWGQQsePSsbBl8aNIz1CITsdR0xRv6fuKab4=;
	b=mAbww9asK7GuDGsK6wmD2C0APrwrqJeIEgoWLHG7eNDO5CjOReIFQfj1EBrSDvNgvz
	Kizqrz+DVVveekEIy91a6UB2dsXWoGBQUK/W0A2Y5nUSjQp4S2A/qPYVd64dWUl2k+zH
	FW1pd6kYdURvcuhYTQCh1EqpGM9iIyMFRzDS78QC3BUd5j3unPN/EYwFa0tGmebw58wC
	qOhPO7KQardzjj9MW6oKtzLCqzCNYYwKt7D4tZIRX76Bpen3KX5/2nBqL2sL7iQmIX5j
	UqkWrw6nMm2bbP160qiAyzyQyPK/YQIdcZKaNIgFHwq5i7lvguIreJ/9+pj0Xa7CAa7X
	5D4Q==
X-Gm-Message-State: AKGB3mJCOj8dFJZGOOHEo2ogW5AN5jF28wEh+vaxv+e51LeG0eG9FmpY
	tIqeFoyLh0PbWCa9pNd50aU1cg==
X-Google-Smtp-Source: AGs4zMa2NJ854HV2Zs6ijWUKuacI/llZ+J5+80Rxix75hh3gQFxedFbbeJEebkm5px/TjDD2Fezi0g==
X-Received: by 10.55.215.67 with SMTP id m64mr7679560qki.91.1512133539445;
	Fri, 01 Dec 2017 05:05:39 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	d184sm4670934qka.15.2017.12.01.05.05.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Dec 2017 05:05:38 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Dec 2017 11:05:33 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  1 Dec 2017 11:05:32 -0200
Message-Id: <20171201130532.21749-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] initramfs-framework: Add exec module
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
X-List-Received-Date: Fri, 01 Dec 2017 13:05:39 -0000

This new module allow for easy execution of external scripts or
applications. It runs anything found in /exec.d directory in order and
in case of no scripts to be available, it opens a shell.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../initrdscripts/initramfs-framework/exec         | 29 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  9 +++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/exec

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/exec b/meta/recipes-core/initrdscripts/initramfs-framework/exec
new file mode 100644
index 0000000000..a8e2432bb6
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/exec
@@ -0,0 +1,29 @@
+#!/bin/sh
+# Copyright (C) 2017 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+EXEC_DIR=/exec.d  # place to look for modules
+
+exec_enabled() {
+	return 0
+}
+
+exec_run() {
+	if [ ! -d $EXEC_DIR ]; then
+		msg "No contents to exec in $EXEC_DIR. Starting shell ..."
+		sh
+	fi
+
+	# Load and run modules
+	for m in $EXEC_DIR/*; do
+		# Skip backup files
+		if [ "`echo $m | sed -e 's/\~$//'`" != "$m" ]; then
+			continue
+		fi
+
+		debug "Starting $m"
+
+		# process module
+		./$m
+	done
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 2afc37ee75..75d965f069 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -8,6 +8,7 @@ PR = "r4"
 inherit allarch
 
 SRC_URI = "file://init \
+           file://exec \
            file://rootfs \
            file://finish \
            file://mdev \
@@ -26,6 +27,9 @@ do_install() {
     install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
     install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
 
+	# exec
+    install -m 0755 ${WORKDIR}/exec ${D}/init.d/89-exec
+
     # mdev
     install -m 0755 ${WORKDIR}/mdev ${D}/init.d/01-mdev
 
@@ -45,6 +49,7 @@ do_install() {
 }
 
 PACKAGES = "${PN}-base \
+            initramfs-module-exec \
             initramfs-module-mdev \
             initramfs-module-udev \
             initramfs-module-e2fs \
@@ -62,6 +67,10 @@ FILES_${PN}-base = "/init /init.d/99-finish /dev"
 # and mounts the rootfs. Then 90-rootfs will proceed immediately.
 RRECOMMENDS_${PN}-base += "initramfs-module-rootfs"
 
+SUMMARY_initramfs-module-exec = "initramfs support for easy execution of applications"
+RDEPENDS_initramfs-module-exec = "${PN}-base"
+FILES_initramfs-module-exec = "/init.d/89-exec"
+
 SUMMARY_initramfs-module-mdev = "initramfs support for mdev"
 RDEPENDS_initramfs-module-mdev = "${PN}-base busybox-mdev"
 FILES_initramfs-module-mdev = "/init.d/01-mdev"
-- 
2.15.0


