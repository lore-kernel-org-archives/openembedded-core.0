Return-Path: <sujith.h@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id D163E65CA7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 09:13:08 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id v10so5000713pde.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 02:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tukekA6aFmVPrhDcnbIvVpym76K7PXFLsN0pvTbX8ps=;
	b=VztWdcw2yNvpvFdU9LgFT+fX154tgyTAN00aoyQ09YSBKnp3Y5nxhNxdum+SZLN5ET
	3reglhJdzFN9E+X0VGlYG7GwN/agxBmJzapiNJuN24syUYERQhH7X1i9DAF2uK/GB34p
	nBabMt4f9AKUlBp+Ex3h1f4HpeY+ArY0ZSBfH4zkx4nL7sd8mwHZBIeTpx5Ex28kvbBD
	EllHySItQAgJRzBfzpOwDeoEUyZ7FV3oQ5MVDh6YGpGxEe97sB/ss8O3k29Ikkh2Asin
	bXQDcV0DSM4azK/R4UvpQGyAWyelWWW3S4bEjogoU0/KtxzOB09S/S2zhiK/2iEBP1K3
	gHeg==
X-Received: by 10.68.104.66 with SMTP id gc2mr23184935pbb.17.1407489189717;
	Fri, 08 Aug 2014 02:13:09 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id a17sm2299296pbu.41.2014.08.08.02.13.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 02:13:08 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 14:39:48 +0530
Message-Id: <1407488988-14910-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
Subject: [PATCH] psplash: Adding support for systemd service files
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
X-List-Received-Date: Fri, 08 Aug 2014 09:13:16 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

If the DISTRO_FEATURES has systemd, then its better
to have corresponding service files associated with
the psplash. This change will help to do the same.

Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/recipes-core/psplash/files/psplash-quit.service  | 11 +++++++++++
 meta/recipes-core/psplash/files/psplash-start.service | 11 +++++++++++
 meta/recipes-core/psplash/psplash_git.bb              | 12 +++++++++++-
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/psplash/files/psplash-quit.service
 create mode 100644 meta/recipes-core/psplash/files/psplash-start.service

diff --git a/meta/recipes-core/psplash/files/psplash-quit.service b/meta/recipes-core/psplash/files/psplash-quit.service
new file mode 100644
index 0000000..14bd499
--- /dev/null
+++ b/meta/recipes-core/psplash/files/psplash-quit.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Terminate Psplash Boot Screen
+After=psplash-start.service
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/psplash-write QUIT
+TimeoutSec=20
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
new file mode 100644
index 0000000..502b150
--- /dev/null
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Starts Psplash Boot screen
+Wants=systemd-vconsole-setup.service
+After=systemd-vconsole-setup.service systemd-udev-trigger.service systemd-udevd.service
+DefaultDependencies=no
+
+[Service]
+ExecStart=/usr/bin/psplash
+
+[Install]
+WantedBy=sysinit.target
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 628ced4..16fa0ae 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -11,6 +11,8 @@ PR = "r15"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://psplash-init \
+           file://psplash-start.service \
+           file://psplash-quit.service \
            ${SPLASH_IMAGES}"
 
 SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
@@ -65,11 +67,14 @@ python __anonymous() {
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig update-rc.d update-alternatives
+inherit autotools pkgconfig update-rc.d update-alternatives systemd
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[psplash] = "${bindir}/psplash"
 
+SYSTEMD_PACKAGES = "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
+SYSTEMD_SERVICE_${PN} = "${@base_contains('DISTRO_FEATURES','systemd','psplash-start.service psplash-quit.service','',d)}"
+
 python do_compile () {
     import shutil
 
@@ -103,6 +108,11 @@ do_install_append() {
 		install -m 0755 $i ${D}${bindir}/$i
 	done
 	rm -f ${D}${bindir}/psplash
+
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+                install -d ${D}${systemd_unitdir}/system
+                install -m 644 ${WORKDIR}/*.service ${D}/${systemd_unitdir}/system
+        fi
 }
 
 FILES_${PN} += "/mnt/.psplash"
-- 
1.8.4


