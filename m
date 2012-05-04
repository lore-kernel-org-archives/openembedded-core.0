Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQLRt-00033H-7Q
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 18:33:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 May 2012 09:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138956407"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.171])
	by azsmga001.ch.intel.com with ESMTP; 04 May 2012 09:23:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 09:23:51 -0700
Message-Id: <1336148632-5828-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 1/2][EDISON 1.1.2] image.bbclass: add check for live and convert to ext3
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
X-List-Received-Date: Fri, 04 May 2012 16:33:41 -0000

The live image type depends on ext3 which has it's own
dependencies, while the live type has none, this is a
backport change to fix [YOCTO #2246]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b8ca370..e9a3aa6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -76,6 +76,8 @@ inherit image-${IMAGE_TYPE}
 python () {
     deps = bb.data.getVarFlag('do_rootfs', 'depends', d) or ""
     for type in (bb.data.getVar('IMAGE_FSTYPES', d, True) or "").split():
+        if type == "live":
+            type = "ext3"
         for dep in ((bb.data.getVar('IMAGE_DEPENDS_%s' % type, d) or "").split() or []):
             deps += " %s:do_populate_sysroot" % dep
     for dep in (bb.data.getVar('EXTRA_IMAGEDEPENDS', d, True) or "").split():
-- 
1.7.7.6



