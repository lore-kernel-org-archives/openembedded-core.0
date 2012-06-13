Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SeewT-0001jV-Uv
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 06:12:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2012 21:01:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="152296955"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2012 21:01:48 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2012 07:01:44 +0300
Message-Id: <1339560104-10189-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339560104-10189-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339560104-10189-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH v2 2/2] connman: make useradd parameters consistent with rootless X
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
X-List-Received-Date: Wed, 13 Jun 2012 04:12:26 -0000

Both connman and rootless X share the same xuser. However, useradd
parameters are not consistent and if connman runs useradd first,
rootless X will be broken.

[Yocto #2467]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc      |    6 ++++--
 .../x11-common/xserver-nodm-init.bb                |    2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 4fb7b43..acc57ea 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -46,9 +46,11 @@ EXTRA_OECONF += "\
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
+# IMPORTANT: because xuser is shared with rootless X, please make sure the
+# USERADD_PARAM is in sync with the one in xserver-nodm-init.bb
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --no-create-home \
-                       --shell /bin/false --groups video,tty,audio \
+USERADD_PARAM_${PN} = "--create-home \
+                       --groups video,tty,audio \
                        --user-group xuser"
 
 inherit autotools pkgconfig update-rc.d useradd
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index 1b95261..8fca056 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -30,6 +30,8 @@ INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
 # Use fixed Xusername of xuser for now, this will need to be
 # fixed if the Xusername changes from xuser
+# IMPORTANT: because xuser is shared with connman, please make sure the
+# USERADD_PARAM is in sync with the one in connman.inc
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--create-home \
                        --groups video,tty,audio \
-- 
1.7.9.5



