Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RW2w4-0006Zy-Oo
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 10:28:09 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 01:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,277,1320652800"; d="scan'208";a="42830235"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 01:21:27 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 17:21:26 +0800
Message-Id: <243c4b2329a95b3488f9c43e8f361095a686f925.1322731182.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322731182.git.dexuan.cui@intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322731182.git.dexuan.cui@intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
Subject: [PATCH 2/3] task-self-hosted: install sudo, tun.ko, iptables, libgl and libgl-dev into the target
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
X-List-Received-Date: Thu, 01 Dec 2011 09:28:09 -0000

sudo, kernel-module-tun and iptables are needed by runqemu.
strace has appeared in RDEPENDS_task-self-hosted-debug, so let's remove it
from RDEPENDS_task-self-hosted-extended.
install libglu and libgl-dev rather than mesa-dri and mesa-dri-dev due to the
recent commit "mesa: package gl/egl/osmesa to separate packages".

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index c218f43..b3a68b4 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r0"
+PR = "r1"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -142,8 +142,8 @@ RDEPENDS_task-self-hosted-extended = "\
     rpm \
     screen \
     setserial \
-    strace \
     subversion \
+    sudo \
     sysstat \
     tar \
     gzip \
@@ -159,13 +159,19 @@ RDEPENDS_task-self-hosted-extended = "\
     zip \
     zlib \
     cpio \
+    iptables \
+    kernel-module-tun \
+    kernel-module-iptable-raw \
+    kernel-module-iptable-nat \
+    kernel-module-iptable-mangle \
+    kernel-module-iptable-filter \
     "
 
 
 RDEPENDS_task-self-hosted-graphics = "\
     python-pygtk \
-    mesa-dri \
-    mesa-dri-dev \
+    libgl \
+    libgl-dev \
     libglu \
     libglu-dev \
     libsdl \
-- 
1.7.6



