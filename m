Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 934456B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:49:18 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id r10so5232172pdi.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ThLprdl5psILfXLX6C2ZisOIfddGYMYNbx/zyP0u9HQ=;
	b=DW04GNkooDbEPplf7ojqnSF0ZTZKZAD6HfXmiPJgaAQeam1h2O4K6R8pYZkdKf3U/4
	B4n8hwbtNUILMRWJF9mj3S8Fxsdb6S/tiOOq4ai3WRrLRF35CirsLedtg2jkrE7cbePy
	X6dQgv4ZuoGjISEESgcjitH5fP3JNSkxsbVCd+sayVGsBFF9LD7465KBKUCnplXCOfkQ
	wjlnqH3B949GNmkjBKjLGP7r1HUlGORhfAZMHqM0xTAIDRBBn2z2FVqKQtJT9vj9MAHn
	qbN0QOajdQJSnIhXaSgKHpprQCrUfkgr3dDVEgqqcw/TJcJGGEoeTiyi34MKrdWmWQhc
	XmHw==
X-Received: by 10.68.170.133 with SMTP id am5mr4966256pbc.104.1376416159448;
	Tue, 13 Aug 2013 10:49:19 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id wr9sm45206780pbc.7.2013.08.13.10.49.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 10:49:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 10:49:01 -0700
Message-Id: <1376416141-5609-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] qemu: Skip it for mips64 target
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
X-List-Received-Date: Tue, 13 Aug 2013 17:49:18 -0000

We should not skip it always since same recipes provide
qemu-native too so user class-target override to make it
only skip for target recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc      | 1 +
 meta/recipes-devtools/qemu/qemu_1.5.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu_git.bb   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 72988f5..97e9b7b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -85,6 +85,7 @@ PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 
 # Qemu target will not build in world build for ARM or Mips
 BROKEN_qemuarm = "1"
+BROKEN_qemumips64 = "1"
 BROKEN_qemumips = "1"
 
 INSANE_SKIP_${PN} = "arch"
diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
index ed6cd2c..91b8120 100644
--- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
@@ -10,4 +10,4 @@ SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
 SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
 SRC_URI[sha256sum] = "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
 
-COMPATIBLE_HOST_mips64 = "null"
+COMPATIBLE_HOST_class-target_mips64 = "null"
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index f061dc9..ed7ad32 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -13,4 +13,4 @@ S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
 
-COMPATIBLE_HOST_mips64 = "null"
+COMPATIBLE_HOST_class-target_mips64 = "null"
-- 
1.8.3.4


