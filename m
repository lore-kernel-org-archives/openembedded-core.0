Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE3F77038
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:27 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so28643385igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=R8Qub64Qb+WoV9+heN+k+mxqpbk6I6rTCyM4787uY70=;
	b=P2G3QBBrKjwmvIDK51zh1Q3lp2NT/Ys/YL/j1VesTqPHkUzQnScFvr4i1gr1MXBzAZ
	qh0XZ8hZRMQtmCnMdkdUBNkuMjktyTe2SMDVQvhnsPnIWlF92lwqBbptab40TkMLVeiM
	AymbJgALZB7+r5CajdIM/8Oi72jEfzxDJFVkv92U/ZvJC3CnbWHOCf+ttvFR2eX4wFyR
	KYrEYuFP17aNkjOs8WUL7DCg12VpcCeYa4OfA8vD1BIPaN2jOmm4HkYOpsETLwnVwvmj
	YbusGF0EB7GHn6NUx+EYBtYzWoGE1bH9oi/L0tYwSwD4HSFxkcI3ty9t8RR6dKgEYJWG
	5TSg==
X-Gm-Message-State: ALoCoQlOjX+m4UW9tRtfEvdgr/YE9mQ+8FQrQBiwoRXWwBKKn9ylsUovaqbZY4klgzI3Fi0Emfdh
X-Received: by 10.50.114.68 with SMTP id je4mr4121754igb.78.1441208907895;
	Wed, 02 Sep 2015 08:48:27 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122]) by smtp.gmail.com with ESMTPSA id
	o189sm17258398ioe.30.2015.09.02.08.48.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:27 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:38 +0200
Message-Id: <33a0da1f6331b4d44deefc5b7916d984981d2c30.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
References: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 02/10] initrdscripts: create /dev/console
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:28 -0000

Some kernels, for example linux-yocto 3.19 for qemux86, fail to
execute /init in an initramfs unless there is already a /dev/console
char device in the initramfs. Booting then fails with:
    Kernel panic - not syncing: /dev/console is missing or not a character device!
    Please ensure your rootfs is properly configured

The panic itself comes from a linux-yocto specific patch to
kernel_init_freeable in init/main.c, but even without it, that
function will print an error when /dev/console is missing. The
kernel's Documentation/initrd.txt also mentions creating that device.

It remained unclear why this is not a problem on other machines. On
intel-corei7-64 from meta-intel, something (the kernel?) creates
/dev/console and /dev/[012] before transfering control to the init
script. In that case, creating /dev/console in advance is not
necessary, but does not cause any problem either.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 7 ++++++-
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 89b900d..6c37b9a 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -34,6 +34,11 @@ do_install() {
 
     # debug
     install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
+
+    # Create device nodes expected by some kernels in initramfs
+    # before even executing /init.
+    install -d ${D}/dev
+    mknod -m 622 ${D}/dev/console c 5 1
 }
 
 PACKAGES = "${PN}-base \
@@ -42,7 +47,7 @@ PACKAGES = "${PN}-base \
             initramfs-module-e2fs \
             initramfs-module-debug"
 
-FILES_${PN}-base = "/init /init.d/99-finish"
+FILES_${PN}-base = "/init /init.d/99-finish /dev"
 
 SUMMARY_initramfs-module-mdev = "initramfs support for mdev"
 RDEPENDS_initramfs-module-mdev = "${PN}-base"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index b54cb61..57b3025 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -11,9 +11,11 @@ S = "${WORKDIR}"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
+        install -d ${D}/dev
+        mknod -m 622 ${D}/dev/console c 5 1
 }
 
-FILES_${PN} += " /init "
+FILES_${PN} += " /init /dev "
 
 # Due to kernel dependency
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.1.4


