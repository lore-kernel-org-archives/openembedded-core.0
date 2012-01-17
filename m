Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ax-0006gw-Nv
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632968"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:16 -0800
Message-Id: <0425f4dd12d84e3d9378a55d6c5d1c744f595047.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 31/62] runqemu: Fix the wrong path of libGL.so in 64b Ubuntu 11.10
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
X-List-Received-Date: Tue, 17 Jan 2012 08:47:47 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

From 11.10, libGL.so is installed @ /usr/lib/x86_64-linux-gnu/ in 64b Ubuntu.

[YOCTO #1885] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 scripts/runqemu-internal |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index c55619b..11dda55 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -472,8 +472,17 @@ EOM
 # Automatically use Ubuntu system's mesa libGL, other distro can add its own path
     if grep -i ubuntu /etc/lsb-release &> /dev/null
     then
+        GL_PATH=""
+        if test -e /usr/lib/libGL.so
+        then 
+            GL_PATH="/usr/lib/libGL.so"
+        elif test -e /usr/lib/x86_64-linux-gnu/libGL.so
+        then
+            GL_PATH="/usr/lib/x86_64-linux-gnu/libGL.so"
+        fi
+
         echo "Skip nVidia's libGL on Ubuntu!"
-        GL_LD_PRELOAD="/usr/lib/libGL.so $LD_PRELOAD"
+        GL_LD_PRELOAD="$GL_PATH $LD_PRELOAD"
     fi
 fi
 
-- 
1.7.6.5



