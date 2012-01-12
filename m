Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RlKYZ-0000KR-IW
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 14:19:03 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jan 2012 05:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111506293"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2012 05:11:27 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 20:57:37 +0800
Message-Id: <0ffd87a287912fbfdc51ac9e139cbd4a089b7314.1326372828.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1326372828.git.edwin.zhai@intel.com>
References: <cover.1326372828.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1326372828.git.edwin.zhai@intel.com>
References: <cover.1326372828.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] runqemu: Fix the wrong path of libGL.so in 64b Ubuntu 11.10
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
X-List-Received-Date: Thu, 12 Jan 2012 13:19:03 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

From 11.10, libGL.so is installed @ /usr/lib/x86_64-linux-gnu/ in 64b Ubuntu.

[YOCTO #1885] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 scripts/runqemu-internal |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 2968ed9..aaf776a 100755
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
1.7.1



