Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RbSr8-0004o5-BK
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 09:09:26 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2011 00:01:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87202612"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2011 00:01:21 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 15:53:22 +0800
Message-Id: <684530c1b7e5aab3e0f3f6f8bbe64b5fb839eff3.1324021777.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324021777.git.edwin.zhai@intel.com>
References: <cover.1324021777.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1324021777.git.edwin.zhai@intel.com>
References: <cover.1324021777.git.edwin.zhai@intel.com>
Subject: [PATCH 1/2] xserver-nodm-init: Fix xuser creation
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
X-List-Received-Date: Fri, 16 Dec 2011 08:09:26 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Rootless X start fail as xuser has no home and shell. This patch fix it.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../x11-common/xserver-nodm-init.bb                |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index dbc1c42..99ef72e 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r28"
+PR = "r29"
 RDEPENDS_${PN} = "sudo"
 
 SRC_URI = "file://xserver-nodm \
@@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 # Use fixed Xusername of xuser for now, this will need to be
 # fixed if the Xusername changes from xuser
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --no-create-home \
-                       --shell /bin/false --groups video,tty,audio \
+USERADD_PARAM_${PN} = "--create-home \
+                       --groups video,tty,audio \
                        --user-group xuser"
 
-- 
1.7.1



