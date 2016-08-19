Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D41B177060
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 06:55:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J6tXCO025109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 23:55:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 23:55:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 23:55:25 -0700
Message-ID: <b8682ee4c43a9687e0406570f72ff3a9cfe90d6a.1471589537.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471589537.git.liezhi.yang@windriver.com>
References: <cover.1471589537.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 4/8] qemux86.conf/qemux86-64.conf: set vars for runqemu
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
X-List-Received-Date: Fri, 19 Aug 2016 06:55:33 -0000
Content-Type: text/plain

Add qemuboot-x86.inc to reduce duplicated code, the x86/x86_64 bsps
which can be boot by runqemu can require qemuboot-x86.inc.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/qemuboot-x86.inc | 14 ++++++++++++++
 meta/conf/machine/qemux86-64.conf          |  1 +
 meta/conf/machine/qemux86.conf             |  1 +
 3 files changed, 16 insertions(+)
 create mode 100644 meta/conf/machine/include/qemuboot-x86.inc

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
new file mode 100644
index 0000000..2ff3ca9
--- /dev/null
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -0,0 +1,14 @@
+# For runqemu
+IMAGE_CLASSES += "qemuboot"
+QB_SYSTEM_NAME_x86 = "qemu-system-i386"
+QB_CPU_x86 = "-cpu qemu32"
+QB_CPU_KVM_x86 = "-cpu kvm32"
+
+QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
+QB_CPU_x86-64 = "-cpu core2duo"
+QB_CPU_KVM_x86-64 = "-cpu kvm64"
+
+QB_AUDIO_DRV = "alsa"
+QB_AUDIO_OPT = "-soundhw ac97,es1370"
+QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1"
+QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 489194a..881a454 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -10,6 +10,7 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-64"
 require conf/machine/include/tune-core2.inc
+require conf/machine/include/qemuboot-x86.inc
 
 KERNEL_IMAGETYPE = "bzImage"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 3cc8091..ca707fb 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -9,6 +9,7 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-i586.inc
+require conf/machine/include/qemuboot-x86.inc
 
 KERNEL_IMAGETYPE = "bzImage"
 
-- 
2.9.0


