Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UNA9S-0007ry-3t
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 00:58:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Apr 2013 15:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,396,1363158000"; d="scan'208";a="311416309"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 02 Apr 2013 15:40:32 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2013 15:42:49 -0700
Message-Id: <15246952e07abb312a4636bde8b5c648d01693cf.1364942359.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <293e2e6b20a096d41ba43b70d6c3fec0d343d1ef.1364942359.git.dvhart@linux.intel.com>
References: <293e2e6b20a096d41ba43b70d6c3fec0d343d1ef.1364942359.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1364942359.git.dvhart@linux.intel.com>
References: <cover.1364942359.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/3] udev: Add rule adding input devices to input group
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
X-List-Received-Date: Tue, 02 Apr 2013 22:58:17 -0000
X-List-Received-Date: Tue, 02 Apr 2013 22:58:17 -0000

Fixes [YOCTO 4164](2/3)

Add all /dev/input/* devices to the input group with g+rw.  This is
needed for rootless X without adding a security hole by making the
device o+rw.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Saul Wold <sgw@linux.intel.com>
Cc: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/udev/udev/local.rules |    2 ++
 meta/recipes-core/udev/udev_182.bb      |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
index 72d92ef..8ebcb2c 100644
--- a/meta/recipes-core/udev/udev/local.rules
+++ b/meta/recipes-core/udev/udev/local.rules
@@ -19,3 +19,5 @@ ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe
 # Create a symlink to any touchscreen input device
 SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
 
+# Make all input devices read-write to the input group
+SUBSYSTEM=="input", GROUP="input", MODE="660"
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index 42b4d08..d66292e 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r6"
+PR = "r7"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.7.5.4



