Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoivZ-0002CA-Ky
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056937"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:31 -0700
Message-Id: <7652e0c7b2e559fb54713d888d983010fc7846ac.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/33] xserver-nodm-init: Fix X start failure on some platform
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:34 -0000

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
1.7.3.4



