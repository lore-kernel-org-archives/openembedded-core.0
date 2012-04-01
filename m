Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SEAqd-0007TX-ES
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 04:48:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 Mar 2012 19:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125670257"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by azsmga001.ch.intel.com with ESMTP; 31 Mar 2012 19:39:47 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2012 10:24:28 +0800
Message-Id: <eade13c5319cbe9e1a640501f8520b80a3210604.1333246894.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333246894.git.edwin.zhai@intel.com>
References: <cover.1333246894.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1333246894.git.edwin.zhai@intel.com>
References: <cover.1333246894.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] qemugl: Fix GL apps failure on Ubuntu 11 host with nVidia GLX driver
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
X-List-Received-Date: Sun, 01 Apr 2012 02:48:55 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Previous version of nVidia GLX driver in Ubuntu 10 cause qemu segfault, so we
fall back to Mesa GLX driver if detecting nVidia driver installed. From Ubuntu
11, nVidia GLX driver works well, while previous work around cause GL apps
failure. So this work around is limited in Ubuntu 10 only, and will be removed
in future.

[YOCTO #1886] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 scripts/runqemu-internal |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 73b8b41..92f245a 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -467,11 +467,15 @@ cat << EOM
 WARNING: nVidia proprietary OpenGL libraries detected.
 nVidia's OpenGL libraries are known to have compatibility issues with qemu,
 resulting in a segfault. Please uninstall these drivers or ensure the mesa libGL
-libraries precede nvidia's via LD_PRELOAD(Already do it on Ubuntu).
+libraries precede nvidia's via LD_PRELOAD(Already do it on Ubuntu 10).
 EOM
 
 # Automatically use Ubuntu system's mesa libGL, other distro can add its own path
-    if grep -i ubuntu /etc/lsb-release &> /dev/null
+if grep -i ubuntu /etc/lsb-release &> /dev/null
+then
+    # precede nvidia's driver on Ubuntu 10
+    UBUNTU_MAIN_VERSION=`cat /etc/lsb-release |grep DISTRIB_RELEASE |cut -d=  -f 2| cut -d. -f 1`
+    if [ $UBUNTU_MAIN_VERSION -eq 10 ];
     then
         GL_PATH=""
         if test -e /usr/lib/libGL.so
@@ -482,10 +486,11 @@ EOM
             GL_PATH="/usr/lib/x86_64-linux-gnu/libGL.so"
         fi
 
-        echo "Skip nVidia's libGL on Ubuntu!"
+        echo "Skip nVidia's libGL on Ubuntu 10!"
         GL_LD_PRELOAD="$GL_PATH $LD_PRELOAD"
     fi
 fi
+fi
 
 echo "Running $QEMU..."
 # -no-reboot is a mandatory option - see bug #100
-- 
1.7.5.4



