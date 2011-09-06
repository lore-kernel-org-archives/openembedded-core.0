Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R0ler-0003yn-NE
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 04:45:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2011 19:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,336,1312182000"; d="scan'208";a="49269088"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2011 19:39:56 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 10:36:12 +0800
Message-Id: <6fb4806c9fad49d323cbbd1d0a0a54a5a279b2f0.1315276240.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315276240.git.edwin.zhai@intel.com>
References: <cover.1315276240.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1315276240.git.edwin.zhai@intel.com>
References: <cover.1315276240.git.edwin.zhai@intel.com>
Subject: [PATCH 1/2] xserver-nodm-init: Change hidraw mode to allow normal user access
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
X-List-Received-Date: Tue, 06 Sep 2011 02:45:06 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

USB HID like touch screen could be presented as hidraw* device, this change
make user under rootless X can access them.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../x11-common/xserver-nodm-init/xserver-nodm      |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index 858af0b..c707a4b 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -34,6 +34,10 @@ case "$1" in
            chmod o+w /var/log
            chmod g+r /dev/tty[0-3]
            chmod o+rw /dev/input/*
+           # hidraw device is probably needed
+           if [ -e /dev/hidraw0 ]; then
+               chmod o+rw /dev/hidraw*
+           fi
        fi
        # Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
        su -l -c '/etc/X11/Xserver&' $username 
-- 
1.7.1



