Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QIGYi-0002rb-V7
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 10:38:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 May 2011 01:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,325,1301900400"; d="scan'208";a="743220423"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 06 May 2011 01:36:07 -0700
Message-Id: <52d0f8883f82d2cab0fad9b85298506a169acec0.1304670670.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1304670670.git.edwin.zhai@intel.com>
References: <cover.1304670670.git.edwin.zhai@intel.com>
Old-Date: Fri, 6 May 2011 15:20:55 +0800
Date: Fri, 06 May 2011 16:36:15 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 1/1] qemu-script: Fix qemu seg fault if install Nvidia proprietary driver.
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
X-List-Received-Date: Fri, 06 May 2011 08:38:49 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This fix works on Ubuntu, and other distro can add its own path of Mesa's libGL

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 scripts/poky-qemu-internal |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/poky-qemu-internal b/scripts/poky-qemu-internal
index c88d711..acaeb1b 100755
--- a/scripts/poky-qemu-internal
+++ b/scripts/poky-qemu-internal
@@ -448,20 +448,29 @@ else
 fi
 
 # qemu got segfault if linked with nVidia's libgl
+GL_LD_PRELOAD=$LD_PRELOAD
+
 if ldd $QEMUBIN | grep -i nvidia &> /dev/null
 then
 cat << EOM
 WARNING: nVidia proprietary OpenGL libraries detected.
 nVidia's OpenGL libraries are known to have compatibility issues with qemu,
 resulting in a segfault. Please uninstall these drivers or ensure the mesa libGL
-libraries precede nvidia's via LD_PRELOAD.
+libraries precede nvidia's via LD_PRELOAD(Already do it on Ubuntu).
 EOM
+
+# Automatically use Ubuntu system's mesa libGL, other distro can add its own path
+    if grep -i ubuntu /etc/lsb-release &> /dev/null
+    then
+        echo "Skip nVidia's libGL on Ubuntu!"
+        GL_LD_PRELOAD="/usr/lib/libGL.so $LD_PRELOAD"
+    fi
 fi
 
 echo "Running $QEMU..."
 # -no-reboot is a mandatory option - see bug #100
 echo $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append '"'$KERNCMDLINE $SCRIPT_KERNEL_OPT'"'
-$QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append "$KERNCMDLINE $SCRIPT_KERNEL_OPT"
+LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append "$KERNCMDLINE $SCRIPT_KERNEL_OPT"
 
 
 cleanup
-- 
1.7.1



