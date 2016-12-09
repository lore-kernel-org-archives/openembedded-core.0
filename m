Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6B7271CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 07:42:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB97g7rd022304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2016 23:42:08 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Dec 2016 23:42:06 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Dec 2016 15:43:03 +0800
Message-ID: <f26e3de2a7a94cb9618f4cc957fe37cbb820a716.1481269071.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1481269071.git.Qi.Chen@windriver.com>
References: <cover.1481269071.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Use weak assignment for SERIAL_CONSOLES in qemu configuration files
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
X-List-Received-Date: Fri, 09 Dec 2016 07:42:07 -0000
Content-Type: text/plain

Use weak assignment for SERIAL_CONSOLES in qemu configuration files so that
the value could serve as a default value and could be easily overridden in
configuration files like local.conf.

When using the default value for SERAIL_CONSOLES in qemux86-64,we would have
annoying messages on console complaining about respawning getty on ttyS1.
Although the value is set by purpose, at least we need to provide an easy way
to override it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/machine/qemuarm.conf    | 2 +-
 meta/conf/machine/qemuarm64.conf  | 2 +-
 meta/conf/machine/qemumips.conf   | 2 +-
 meta/conf/machine/qemumips64.conf | 2 +-
 meta/conf/machine/qemuppc.conf    | 2 +-
 meta/conf/machine/qemux86-64.conf | 2 +-
 meta/conf/machine/qemux86.conf    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 17402ef..f9d6dd7 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -8,7 +8,7 @@ require conf/machine/include/tune-arm926ejs.inc
 
 KERNEL_IMAGETYPE = "zImage"
 
-SERIAL_CONSOLES = "115200;ttyAMA0 115200;ttyAMA1"
+SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index df2010c..e70538a 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -7,7 +7,7 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
 
-SERIAL_CONSOLES = "38400;ttyAMA0 38400;hvc0"
+SERIAL_CONSOLES ?= "38400;ttyAMA0 38400;hvc0"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-aarch64"
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 3182ea1..986315a 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -9,6 +9,6 @@ require conf/machine/include/qemuboot-mips.inc
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
+SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index 9529f4c..3f91cbe 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -9,6 +9,6 @@ require conf/machine/include/qemuboot-mips.inc
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
+SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 8703c20..9d174bc 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -9,7 +9,7 @@ TARGET_CC_KERNEL_ARCH = "-mno-spe"
 
 KERNEL_IMAGETYPE = "vmlinux"
 
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
+SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-ppc"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 3117ca1..150d745 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -14,7 +14,7 @@ require conf/machine/include/qemuboot-x86.inc
 
 KERNEL_IMAGETYPE = "bzImage"
 
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
+SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 7785999..8997f6b 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -13,7 +13,7 @@ require conf/machine/include/qemuboot-x86.inc
 
 KERNEL_IMAGETYPE = "bzImage"
 
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
+SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
-- 
1.9.1


