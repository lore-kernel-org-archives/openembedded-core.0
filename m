Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXKXy-0004SO-0r
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 01:00:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2012 15:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103525783"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 15:50:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 15:46:12 -0700
Message-Id: <792213c1edf490b34e7d02f0ca3938fe06921b1f.1337805812.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337805812.git.sgw@linux.intel.com>
References: <cover.1337805812.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337805812.git.sgw@linux.intel.com>
References: <cover.1337805812.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 1/5] qemumachines: Enable xserver-xorg as default xserver
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
X-List-Received-Date: Wed, 23 May 2012 23:00:50 -0000

From: Khem Raj <raj.khem@gmail.com>

For qemux86 and qemux86-64 include qemu.inc after defining XSERVER

XSERVER variable is also weakly defined in task-core-x11.bb
which means we can not use ??= otherwise when building any qemu image
that uses task-core-x11.bb will get the wrong definition

So we define the XSERVER common set for qemu in qemu.inc
and as we know x86 and x86-64 qemu overrides the default
we include qemu.inc after that definition which means that
qemux86 and qemux86-64 get their own definitions and other
qemus get the definitions from qemu.inc. other non-qemu machine
will get their defintion from task which points to kdrive
as of now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/qemu.inc |    9 ++++++++-
 meta/conf/machine/qemux86-64.conf  |    3 ++-
 meta/conf/machine/qemux86.conf     |    3 ++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 421a149..e384879 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,7 +1,14 @@
 PCMCIA_MANAGER = "pcmciautils"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
 
+XSERVER ?= "xserver-xorg \
+            mesa-dri-driver-swrast \
+            xf86-input-evdev \
+            xf86-input-mouse \
+            xf86-video-fbdev \
+            xf86-input-keyboard"
+
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
 IMAGE_FSTYPES += "tar.bz2 ext3"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 129fe9f..2e361a5 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -6,7 +6,6 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 
 require conf/machine/include/tune-x86_64.inc
-require conf/machine/include/qemu.inc
 
 MACHINE_FEATURES += "x86"
 
@@ -23,6 +22,8 @@ XSERVER ?= "xserver-xorg \
            xf86-video-vmware \
            qemugl"
 
+require conf/machine/include/qemu.inc
+
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 246d5a0..ad840c0 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -6,7 +6,6 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 
 require conf/machine/include/tune-i586.inc
-require conf/machine/include/qemu.inc
 
 MACHINE_FEATURES += "x86"
 
@@ -23,6 +22,8 @@ XSERVER ?= "xserver-xorg \
            xf86-video-vmware \
            qemugl"
 
+require conf/machine/include/qemu.inc
+
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
-- 
1.7.7.6



