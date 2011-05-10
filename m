Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVE-0001SG-1d
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; 
   d="scan'208";a="163168"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2011 22:26:14 -0700
Message-Id: <ea5ee22337d5317e4e02e31eb56752a5323a3c9f.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Fri, 6 May 2011 15:20:55 +0800
Date: Mon, 09 May 2011 22:26:14 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 01/30] qemu-script: Fix qemu seg fault if install Nvidia proprietary driver.
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
X-List-Received-Date: Tue, 10 May 2011 05:29:00 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This fix works on Ubuntu, and other distro can add its own path of Mesa's libGL

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 scripts/runqemu-internal |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 9a786e4..ffac05e 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
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
1.7.1.1



