Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QoA0x-0005Lt-Kl
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 10:07:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Aug 2011 01:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,305,1309762800"; d="scan'208";a="34546305"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2011 01:03:11 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 16:00:29 +0800
Message-Id: <c297d8027272598a1af9b7180482f339fa25ee14.1312271833.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312271833.git.edwin.zhai@intel.com>
References: <cover.1312271833.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1312271833.git.edwin.zhai@intel.com>
References: <cover.1312271833.git.edwin.zhai@intel.com>
Subject: [PATCH 8/8] xserver-nodm-init: Fix X start failure on some platform
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
X-List-Received-Date: Tue, 02 Aug 2011 08:07:49 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

sudo is used to run rootless X in xserver-nodm, and start to fail with
"xf86OpenConsole: Cannot open /dev/tty0" error after upgrade to 1.8.1. sudo
seems wait for some resource that is unavailable in early phase of booting.
This patch swith to "su" for rootless X starting as a fix.

[YOCTO #1211] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../x11-common/xserver-nodm-init/xserver-nodm      |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index d8c4ba0..3b71983 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -35,10 +35,8 @@ case "$1" in
            chmod g+r /dev/tty[0-3]
            chmod o+rw /dev/input/*
        fi
-       # Using sudo -i here has the nice side effect of making sire
-       # HOME, USER and other previously problematic variables
-       # are set correctly
-       sudo -b -i -u $username /etc/X11/Xserver
+       # Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
+       su -l -c '/etc/X11/Xserver&' $username 
        # Wait for the desktop to say its finished loading
        dbus-wait org.matchbox_project.desktop Loaded
   ;;
-- 
1.7.1



