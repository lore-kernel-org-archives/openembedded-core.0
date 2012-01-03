Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RiDRW-0000GM-19
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 00:06:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 14:59:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92638326"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 14:59:34 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 14:59:30 -0800
Message-Id: <d0c80f038de8f7c0f53b759503611aefa28c536b.1325631444.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <cover.1325631444.git.nitin.a.kamble@intel.com>
References: <cover.1325631444.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] prelink: also look at nonstandard lib paths
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
X-List-Received-Date: Tue, 03 Jan 2012 23:06:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Prelinking for x32 image showed that it was ignoring libraries
located at locations like /usr/libx32. Like that mips n32 has
library locations set as lib32
  This commit modifies prelink.conf to look at libraries also
located at libx32 & lib32 locations.
  Thanks to Mark Hatle for suggesting the fix.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/prelink/prelink/prelink.conf |    8 ++++----
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink/prelink.conf b/meta/recipes-devtools/prelink/prelink/prelink.conf
index ed30c28..562f23c 100644
--- a/meta/recipes-devtools/prelink/prelink/prelink.conf
+++ b/meta/recipes-devtools/prelink/prelink/prelink.conf
@@ -12,7 +12,7 @@
 -l /usr/bin
 -l /usr/X11R6/bin
 -l /usr/games
--l /usr/local/lib{,64}
--l /lib{,64}
--l /usr/lib{,64}
--l /usr/X11R6/lib{,64}
+-l /usr/local/lib{,32,64,x32}
+-l /lib{,32,64,x32}
+-l /usr/lib{,32,64,x32}
+-l /usr/X11R6/lib{,32,64,x32}
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 31c22ef..17141e9 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRCREV = "bb1b660c5e3859b6c5a2ac8d739713e9989a4dd7"
 PV = "1.0+git${SRCPV}"
-PR = "r7"
+PR = "r8"
 
 #
 # The cron script attempts to re-prelink the system daily -- on
-- 
1.7.4.4



