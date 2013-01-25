Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TypQF-00085q-3R
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:58:47 +0100
Received: by mail-da0-f54.google.com with SMTP id n2so317662dad.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=3QyzBS3nwJOcGmAhu/SgbPDNOl2QARvOC5oz4Nb8QtA=;
	b=CZuSJgcH7ghIlXWJbdy9jf7Ppu9sfaevPAXmLhCMzeUuwcfbXriwsKmHluXvmfgbpx
	kr460N15nxkEuzfZ/xvM6twdtgERq7uT5ryE3pqBuT6ETBXgQEfF5BMCruJU+xyYwTq0
	Id1eb2WNJQ9jBKag3ulboLGtDbxvIyn1Q8rFZzmSvIiC9OCqJarnogg9SJk+a+sGJQuA
	e9yULW9aF5xaytSVsiwjPDBEj7dS7nY1BzRb0nfFTyJxwf5kpuTBlMjiJgWn+YliRFDS
	M6GOmeKL0ce6JYiT15Y4ndSSN2mqHvL65eqWkujFKa4IzIX5NTx7Bexq7Nn8f4K2ho29
	yxTQ==
X-Received: by 10.68.232.195 with SMTP id tq3mr16892357pbc.70.1359142991748;
	Fri, 25 Jan 2013 11:43:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wh8sm1165247pbc.75.2013.01.25.11.43.09
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:43:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:42:49 +0100
Message-Id: <40602fae206e6946d89593ed8dca2782775b9cf2.1359142768.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/7] initrdscripts: exclude conflicting packages from world-image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 19:58:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 ++
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index cbb4a39..8df391e 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -34,6 +34,8 @@ do_install() {
     install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
 }
 
+EXCLUDE_PACKAGES_FROM_WORLD_IMAGE = "${PN}-base"
+
 PACKAGES = "${PN}-base \
             initramfs-module-mdev \
             initramfs-module-udev \
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 55a8600..17be28f 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -5,6 +5,8 @@ RDEPENDS = "udev"
 DEPENDS = "virtual/kernel"
 SRC_URI = "file://init-live.sh"
 
+EXCLUDE_FROM_WORLD_IMAGE = "1"
+
 PR = "r11"
 
 do_compile() {
-- 
1.8.1.1



