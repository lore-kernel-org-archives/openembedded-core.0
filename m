Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QUTdU-0004n4-5o
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 03:02:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jun 2011 17:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,340,1304319600"; 
   d="scan'208";a="9591106"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2011 17:57:43 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 09:08:32 +0800
Message-Id: <e3cc91a222b0bdf0fe6c5cf6c8f43dfbf806f83b.1307581528.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1307581528.git.dongxiao.xu@intel.com>
References: <cover.1307581528.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1307581528.git.dongxiao.xu@intel.com>
References: <cover.1307581528.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] udev: Fix udevd launch issue after system second boot
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
X-List-Received-Date: Thu, 09 Jun 2011 01:02:16 -0000

"grep" command will return 1 if nothing is grepped, which will cause
the udevd daemon not working correctly.

This fixes [YOCTO #1146]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/udev/udev-164/init |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev-164/init b/meta/recipes-core/udev/udev-164/init
index 1a8fca5..9ce95ee 100644
--- a/meta/recipes-core/udev/udev-164/init
+++ b/meta/recipes-core/udev/udev-164/init
@@ -35,7 +35,7 @@ LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
 }
 
 if [ -e /etc/dev.tar ]; then
-	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp')
+	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
 	not_first_boot=1
 fi
 
-- 
1.7.1



