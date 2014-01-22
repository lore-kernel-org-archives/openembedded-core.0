Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 689BC6CDF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:53:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 16:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442600432"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 16:53:09 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 16:58:46 -0800
Message-Id: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390351667.git.dvhart@linux.intel.com>
References: <cover.1390351667.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 01/19] x86: Replace ia32 with x86 when referring to the generic architecture
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
X-List-Received-Date: Wed, 22 Jan 2014 00:53:08 -0000

ia32 implies 32bit, while these files provide descriptions for IA32,
X86_64, and X32 architectures. The term "x86" fits this used better
without resorting to using the term "Intel" which isn't quite right as
it excludes things like the tune-c3 file describing a Via CPU.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta/conf/machine/include/tune-c3.inc              |    2 +-
 meta/conf/machine/include/tune-i586.inc            |    2 +-
 meta/conf/machine/include/tune-x86_64.inc          |    2 +-
 .../include/{ia32-base.inc => x86-base.inc}        |   18 +++++++++---------
 meta/conf/machine/include/{ia32 => x86}/README     |    6 +++---
 .../{ia32/arch-ia32.inc => x86/arch-x86.inc}       |    2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/conf/machine/include/{ia32-base.inc => x86-base.inc} (72%)
 rename meta/conf/machine/include/{ia32 => x86}/README (81%)
 rename meta/conf/machine/include/{ia32/arch-ia32.inc => x86/arch-x86.inc} (97%)

diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index 18865b7..fafc28a 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -1,4 +1,4 @@
-require conf/machine/include/ia32/arch-ia32.inc
+require conf/machine/include/x86/arch-x86.inc
 
 TUNEVALID[c3] = "VIA Cyrix III or VIA C3 specific optimizations"
 TUNECONFLICTS[c3] = "m64 mx32"
diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index 4542b9b..a315b35 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?= "i586"
 
-require conf/machine/include/ia32/arch-ia32.inc
+require conf/machine/include/x86/arch-x86.inc
 
 # Extra tune features
 TUNEVALID[i586] = "Enable i586 specific processor optimizations"
diff --git a/meta/conf/machine/include/tune-x86_64.inc b/meta/conf/machine/include/tune-x86_64.inc
index 31e06da..ae48124 100644
--- a/meta/conf/machine/include/tune-x86_64.inc
+++ b/meta/conf/machine/include/tune-x86_64.inc
@@ -1,4 +1,4 @@
 DEFAULTTUNE ?= "x86-64"
 
-require conf/machine/include/ia32/arch-ia32.inc
+require conf/machine/include/x86/arch-x86.inc
 
diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/x86-base.inc
similarity index 72%
rename from meta/conf/machine/include/ia32-base.inc
rename to meta/conf/machine/include/x86-base.inc
index e15f927..d6c4d60 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -1,9 +1,9 @@
 #
-# base machine settings for ia32-architecture BSPs
+# Base machine settings for X86 architecture BSPs
 #
 
 #
-# common settings for Intel-based machines
+# common settings for X86 machines
 #
 MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
                      acpi serial usbgadget alsa"
@@ -25,28 +25,28 @@ PREFERRED_VERSION_linux-yocto ??= "3.0%"
 #
 # XSERVER subcomponents, used to build the XSERVER variable
 #
-XSERVER_IA32_BASE = "xserver-xorg \
+XSERVER_X86_BASE = "xserver-xorg \
            xf86-input-mouse \
            xf86-input-keyboard \
            xf86-input-evdev \
            xf86-input-synaptics \
            "
 
-XSERVER_IA32_EXT = " \
+XSERVER_X86_EXT = " \
            ${@base_contains('DISTRO_FEATURES', 'opengl', 'xserver-xorg-extension-glx', '', d)} \
            xserver-xorg-module-libint10 \
            "
 
-XSERVER_IA32_I915 = "xf86-video-intel \
+XSERVER_X86_I915 = "xf86-video-intel \
            ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i915', '', d)} \
            "
 
-XSERVER_IA32_I965 = "xf86-video-intel \
+XSERVER_X86_I965 = "xf86-video-intel \
            ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i965', '', d)} \
            "
 
-XSERVER_IA32_VESA = "xf86-video-vesa"
+XSERVER_X86_VESA = "xf86-video-vesa"
 
-XSERVER_IA32_FBDEV = "xf86-video-fbdev"
+XSERVER_X86_FBDEV = "xf86-video-fbdev"
 
-XSERVER_IA32_MODESETTING = "xf86-video-modesetting"
+XSERVER_X86_MODESETTING = "xf86-video-modesetting"
diff --git a/meta/conf/machine/include/ia32/README b/meta/conf/machine/include/x86/README
similarity index 81%
rename from meta/conf/machine/include/ia32/README
rename to meta/conf/machine/include/x86/README
index 8f80a5b..d8b6793 100644
--- a/meta/conf/machine/include/ia32/README
+++ b/meta/conf/machine/include/x86/README
@@ -1,12 +1,12 @@
 2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
  - Initial version
 
-Most of the items for the IA architecture are defined in the single 
-arch-ia32 file.
+Most of the items for the Intel architectures are defined in the single 
+arch-x86 file.
 
 Three ABIs are define, m32, mx32 and m64.
 
-The following is the list of ia32 specific variables:
+The following is the list of intel specific variables:
 
 X86ARCH32 - This is the 32-bit architecture GNU canonical arch, TUNE_ARCH.
 
diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/x86/arch-x86.inc
similarity index 97%
rename from meta/conf/machine/include/ia32/arch-ia32.inc
rename to meta/conf/machine/include/x86/arch-x86.inc
index aa83896..298bddc 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -1,5 +1,5 @@
 #
-# IA32 Architecture definition
+# X86 Architecture definition (IA32, X86_64, and X32)
 #
 
 DEFAULTTUNE ?= "x86"
-- 
1.7.9.5


