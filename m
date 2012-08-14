Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCp-0000ex-9q
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181435"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:31 +0300
Message-Id: <4c24f7f1bde1405673a845692eed9295c0b9db83.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [CONSOLIDATED REQUEST 44/64] qemu: backport patch to fix pl031 RTC
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Roy.Li" <rongqing.li@windriver.com>

Intergrate the patch from:
http://repo.or.cz/w/qemu.git/commit/13a16f1d91fc7a46b65b22a33f6ffea1b826a097

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    1 +
 2 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
new file mode 100644
index 0000000..2ccc663
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport
+commit 13a16f1d91fc7a46b65b22a33f6ffea1b826a097 
+in git://git.qemu.org/qemu.git master
+
+From 13a16f1d91fc7a46b65b22a33f6ffea1b826a097 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Thu, 16 Feb 2012 09:56:10 +0000
+Subject: [PATCH] hw/pl031: Actually raise interrupt on timer expiry
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix a typo in pl031_interrupt() which meant we were setting a bit
+in the interrupt mask rather than the interrupt status register
+and thus not actually raising an interrupt. This fix allows the
+rtctest program from the kernel's Documentation/rtc.txt to pass
+rather than hanging.
+
+Reported-by: Daniel Forsgren <daniel.forsgren@enea.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Acked-by: Andreas Färber <afaerber@suse.de>
+---
+ hw/pl031.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/hw/pl031.c b/hw/pl031.c
+index 05b5b11..69abc4f 100644
+--- a/hw/pl031.c
++++ b/hw/pl031.c
+@@ -76,7 +76,7 @@ static void pl031_interrupt(void * opaque)
+ {
+     pl031_state *s = (pl031_state *)opaque;
+ 
+-    s->im = 1;
++    s->is = 1;
+     DPRINTF("Alarm raised\n");
+     pl031_update(s);
+ }
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index 7b862ed..a914bcf 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "\
     file://dummy-gl-config.patch \
     file://0001-ppc64-Fix-linker-script.patch \
     file://ppc-s500-set-invalid-mask.patch \
+    file://hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch \
     "
 
 # Only use the GL passthrough patches for native/nativesdk versions
-- 
1.7.7.6



