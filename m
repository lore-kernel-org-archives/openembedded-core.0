Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UNTv9-0005ig-C6
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 22:04:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2013 12:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="288954198"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2013 12:47:19 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 12:49:41 -0700
Message-Id: <40df07752875c3ceb45b5afe08d3b7ce9d5a35b4.1365018433.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <293e2e6b20a096d41ba43b70d6c3fec0d343d1ef.1365018433.git.dvhart@linux.intel.com>
References: <293e2e6b20a096d41ba43b70d6c3fec0d343d1ef.1365018433.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1365018433.git.dvhart@linux.intel.com>
References: <cover.1365018433.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 3/3] xserver-nodm-init: Add xuser to input group
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 20:04:35 -0000

Fixes [YOCTO 4164](3/3)

Input devices come and go, so a single chmod in this init script is not
adequate to ensure rootless X servers can use input devices.

The o+rw method also introduces a security hole.

The newly added input group and input udev rule address this in a secure
way. Ensure the xuser is added to the input group.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Saul Wold <sgw@linux.intel.com>
Cc: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../x11-common/xserver-nodm-init.bb                |    4 ++--
 .../x11-common/xserver-nodm-init/xserver-nodm      |    1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index eab76c5..d2797a9 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r30"
+PR = "r31"
 RDEPENDS_${PN} = "sudo"
 
 SRC_URI = "file://xserver-nodm \
@@ -34,6 +34,6 @@ INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 # USERADD_PARAM is in sync with the one in connman.inc
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--create-home \
-                       --groups video,tty,audio \
+                       --groups video,tty,audio,input \
                        --user-group xuser"
 
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index e790fb0..f6692a8 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -33,7 +33,6 @@ case "$1" in
            # setting for rootless X
            chmod o+w /var/log
            chmod g+r /dev/tty[0-3]
-           chmod o+rw /dev/input/*
            # hidraw device is probably needed
            if [ -e /dev/hidraw0 ]; then
                chmod o+rw /dev/hidraw*
-- 
1.7.5.4



