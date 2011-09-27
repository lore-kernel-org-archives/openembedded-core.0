Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8MFA-0003aV-RR
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 03:13:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2011 18:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56151561"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2011 18:08:30 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 09:04:01 +0800
Message-Id: <f320b31bdc3dbba74e4b5d711e288042fee99a10.1317084972.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4f9d7fab604a93ebdc478178c82746e0e10f8cde.1317084972.git.edwin.zhai@intel.com>
References: <4f9d7fab604a93ebdc478178c82746e0e10f8cde.1317084972.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317084972.git.edwin.zhai@intel.com>
References: <cover.1317084972.git.edwin.zhai@intel.com>
Subject: [PATCH 3/3] Enabled kernel module for eGalax touch screen.
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
X-List-Received-Date: Tue, 27 Sep 2011 01:13:57 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta-pegasus/conf/machine/pegasus.conf             |    2 +-
 .../recipes-kernel/linux/linux-yocto/pegasus.cfg   |    4 ++++
 .../linux/linux-yocto_2.6.37.bbappend              |   12 ++++++++++++
 3 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 meta-pegasus/recipes-kernel/linux/linux-yocto/pegasus.cfg
 create mode 100644 meta-pegasus/recipes-kernel/linux/linux-yocto_2.6.37.bbappend

diff --git a/meta-pegasus/conf/machine/pegasus.conf b/meta-pegasus/conf/machine/pegasus.conf
index 8a4335e..5da6655 100644
--- a/meta-pegasus/conf/machine/pegasus.conf
+++ b/meta-pegasus/conf/machine/pegasus.conf
@@ -9,7 +9,7 @@ SYSLINUX_OPTS = "serial 0 115200"
 SERIAL_CONSOLE = "115200 ttyS0"
 APPEND += "console=ttyS0,115200 console=tty0" 
 
-#PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 
 #PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto-dev"
 
diff --git a/meta-pegasus/recipes-kernel/linux/linux-yocto/pegasus.cfg b/meta-pegasus/recipes-kernel/linux/linux-yocto/pegasus.cfg
new file mode 100644
index 0000000..d115d06
--- /dev/null
+++ b/meta-pegasus/recipes-kernel/linux/linux-yocto/pegasus.cfg
@@ -0,0 +1,4 @@
+# Pegasus touchscreen
+CONFIG_HIDRAW=y
+CONFIG_USB_HID=y
+CONFIG_HID_PID=y
diff --git a/meta-pegasus/recipes-kernel/linux/linux-yocto_2.6.37.bbappend b/meta-pegasus/recipes-kernel/linux/linux-yocto_2.6.37.bbappend
new file mode 100644
index 0000000..3e965dd
--- /dev/null
+++ b/meta-pegasus/recipes-kernel/linux/linux-yocto_2.6.37.bbappend
@@ -0,0 +1,12 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+KMACHINE_pegasus = "yocto/standard/common-pc/atom-pc"
+COMPATIBLE_MACHINE_pegasus = "pegasus"
+
+# The n450 is a single core hypterthreaded CPU
+KERNEL_FEATURES_append_pegasus += " cfg/smp.scc"
+
+SRC_URI += "file://pegasus.cfg"
+
+# We use the atom-pc machine SRCREV and the default meta SRCREV
+#SRCREV_machine_pn-linux-yocto-stable_pegasus = ""
+#SRCREV_meta_pn-linux-yocto-stable_pegasus ?= ""
-- 
1.7.1



