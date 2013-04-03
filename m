Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UNTv8-0005ig-Df
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 22:04:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2013 12:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="288954195"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2013 12:47:19 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 12:49:40 -0700
Message-Id: <b2edd8971fd7b0eab5d3e25904b7c98d3efcfb56.1365018433.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <293e2e6b20a096d41ba43b70d6c3fec0d343d1ef.1365018433.git.dvhart@linux.intel.com>
References: <293e2e6b20a096d41ba43b70d6c3fec0d343d1ef.1365018433.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1365018433.git.dvhart@linux.intel.com>
References: <cover.1365018433.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/3] udev-extraconf: Add rule adding input devices to input group
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
X-List-Received-Date: Wed, 03 Apr 2013 20:04:34 -0000

Fixes [YOCTO 4164](2/3)

Add all /dev/input/* devices to the input group with g+rw.  This is
needed for rootless X without adding a security hole by making the
device o+rw.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Saul Wold <sgw@linux.intel.com>
Cc: Radu Moisan <radu.moisan@intel.com>
Cc: Ross Burton <ross.burton@intel.com>
---
 .../udev/udev-extraconf/localextra.rules           |    2 ++
 meta/recipes-core/udev/udev-extraconf_1.0.bb       |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/localextra.rules b/meta/recipes-core/udev/udev-extraconf/localextra.rules
index 4eaa8ca..3d51d3e 100644
--- a/meta/recipes-core/udev/udev-extraconf/localextra.rules
+++ b/meta/recipes-core/udev/udev-extraconf/localextra.rules
@@ -19,3 +19,5 @@ KERNEL=="rtc0", SYMLINK+="rtc"
 #The first framebuffer is symlinked to /dev/fb
 KERNEL=="fb0",  SYMLINK+="fb"
 
+# Make all input devices read-write to the input group
+SUBSYSTEM=="input", GROUP="input", MODE="660"
diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
index 2c4a4f1..ea95a60 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 inherit allarch
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = " \
        file://automount.rules \
-- 
1.7.5.4



