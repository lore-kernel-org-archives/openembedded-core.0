Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8cXD-0004u7-Lg
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2012 12:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="140089242"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.171])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2012 12:01:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 19:01:00 +0000
Message-Id: <392f6adc4d9fe0511547bd368506846749d117c3.1331924409.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331924409.git.paul.eggleton@linux.intel.com>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331924409.git.paul.eggleton@linux.intel.com>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] iproute2: fix unpackaged files warning
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
X-List-Received-Date: Fri, 16 Mar 2012 19:09:55 -0000

Fixes the following warnings:
WARNING: For recipe iproute2, the following files/directories were installed but not shipped in any package:
WARNING:   /lib
WARNING:   /lib/tc

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc    |    2 +-
 .../iproute2/iproute2_3.2.0.bb                     |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 6fc30a0..86847ef 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -26,7 +26,7 @@ do_install () {
 # There are only .so files in iproute2
 INSANE_SKIP_${PN} = "dev-so"
 
-FILES_${PN} += "${base_libdir}/tc/*"
+FILES_${PN} += "${base_libdir}/tc"
 FILES_${PN}-dbg += "${base_libdir}/tc/.debug"
 
 ALTERNATIVE_NAME = "ip"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
index 4391fb6..5af12af 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
@@ -1,5 +1,7 @@
 require iproute2.inc
 
+PR = "r1"
+
 #v3.2.0 tag is "447c118f138171b260ad045ad6e1b17f9ef462e2"
 #but it was not fully tested and had build error, and the next commit fixed it.
 SRCREV = "13603f6a9e46f08576f6284a0ef1ce1fbf94ffe0"
-- 
1.7.5.4



