Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4B72C70265
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 15:38:54 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2014 08:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,514,1400050800"; d="scan'208";a="447997179"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 20 Jun 2014 08:38:40 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jun 2014 18:42:17 +0300
Message-Id: <e96f09ffae12592ff00f6227153f456a2d8e2667.1403277454.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
Subject: [PATCH 2/5] oe-core/init-install-testfs.sh: do not overwrite /etc/mtab if the link already exist
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jun 2014 15:38:57 -0000

Overwriting of /etc/mtab would fail as below if the /etc/mtab link already
exist during installation phase, this patch fix this problem by checking
existance of the link before try to overwrite it.

Error message during installation if the /etc/mtab exists:
"cat: /proc/mounts: input file is output file"

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-testfs.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index 6faa233..d2cc6ac 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -90,7 +90,9 @@ if [ ! -b /dev/loop0 ] ; then
 fi
 
 mkdir -p /tmp
-cat /proc/mounts > /etc/mtab
+if [ ! -L /etc/mtab ]; then
+	cat /proc/mounts > /etc/mtab
+fi
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
-- 
1.9.1


