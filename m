Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TF8py-0000v3-LU
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 21:24:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Sep 2012 12:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="225191359"
Received: from unknown (HELO localhost) ([10.255.13.250])
	by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2012 12:11:46 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2012 14:11:45 -0500
Message-Id: <96ec94413cd58a08aa4277ac8a863dea4b0e8c55.1348254442.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1348254442.git.tom.zanussi@intel.com>
References: <cover.1348254442.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] initscripts/sysfs.sh: mount debugfs if present
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
X-List-Received-Date: Fri, 21 Sep 2012 19:24:30 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

debugfs is another kernel virtual file system that should be mounted
if configured, so if it's configured into the kernel, mount it.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh | 4 ++++
 meta/recipes-core/initscripts/initscripts_1.0.bb       | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
index bd87dcd..0cfe76e 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
@@ -17,3 +17,7 @@ fi
 if [ -e /sys ] && grep -q sysfs /proc/filesystems && ! [ -e /sys/class ]; then
   mount -t sysfs sysfs /sys
 fi
+
+if [ -e /sys/kernel/debug ] && grep -q debugfs /proc/filesystems; then
+  mount -t debugfs debugfs /sys/kernel/debug
+fi
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index b741b61..d25838b 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r136"
+PR = "r137"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.11.4



