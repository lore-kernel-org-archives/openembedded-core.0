Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sm7jW-0003dV-3l
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:21:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2012 11:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173049545"
Received: from unknown (HELO localhost) ([10.255.12.166])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2012 11:10:49 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 13:10:35 -0500
Message-Id: <1270ddc19a4f865a6a13e694f0af940ed76f7570.1341338051.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
References: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341338051.git.tom.zanussi@intel.com>
References: <cover.1341338051.git.tom.zanussi@intel.com>
Subject: [PATCH 8/9] qemumachines: make MACHINE_FEATURES append follow qemu.inc include
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
X-List-Received-Date: Tue, 03 Jul 2012 18:21:54 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

qemu.inc does a straight assign to MACHINE_FEATURES so overwriting the
preceding append to MACHINE_FEATURES, so the MACHINE_FEATURES append
needs to be moved after the include.

This situation came about as a result of commit 71a4bf386:

    qemumachines: Enable xserver-xorg as default xserver

    For qemux86 and qemux86-64 include qemu.inc after defining XSERVER

which missed this side-effect (and maybe others).

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/conf/machine/qemux86-64.conf |    4 ++--
 meta/conf/machine/qemux86.conf    |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 2e361a5..998ef60 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -7,8 +7,6 @@ PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 
 require conf/machine/include/tune-x86_64.inc
 
-MACHINE_FEATURES += "x86"
-
 KERNEL_IMAGETYPE = "bzImage"
 
 SERIAL_CONSOLE = "115200 ttyS0"
@@ -24,6 +22,8 @@ XSERVER ?= "xserver-xorg \
 
 require conf/machine/include/qemu.inc
 
+MACHINE_FEATURES += "x86"
+
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index ad840c0..57e480c 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -7,8 +7,6 @@ PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 
 require conf/machine/include/tune-i586.inc
 
-MACHINE_FEATURES += "x86"
-
 KERNEL_IMAGETYPE = "bzImage"
 
 SERIAL_CONSOLE = "115200 ttyS0"
@@ -24,6 +22,8 @@ XSERVER ?= "xserver-xorg \
 
 require conf/machine/include/qemu.inc
 
+MACHINE_FEATURES += "x86"
+
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
-- 
1.7.0.4



