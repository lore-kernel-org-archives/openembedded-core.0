Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TGWnG-0000OK-36
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 17:11:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Sep 2012 07:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,483,1344236400"; d="scan'208";a="212738714"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.7])
	by orsmga002.jf.intel.com with ESMTP; 25 Sep 2012 07:58:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2012 15:58:32 +0100
Message-Id: <1348585112-2458-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] layer.conf: allow other layers to depend on this version
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
X-List-Received-Date: Tue, 25 Sep 2012 15:11:26 -0000

Set LAYERVERSION and rename the collection to "core". Given changes such
as the tabs to spaces cleanup for python functions in the current
version, this allows other layers to depend on this version of OE-Core
specifically should they choose to do so, by specifying the following
in their own layer.conf:

LAYERDEPENDS_layername = "core:1"

Where layername is whatever value is being added to BBFILE_COLLECTIONS.

(This change does nothing unless a layer has LAYERDEPENDS set.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/layer.conf |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index ed50f1c..78ceae9 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -3,9 +3,13 @@ BBPATH .= ":${LAYERDIR}"
 # We have a packages directory, add to BBFILES
 BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
-BBFILE_COLLECTIONS += "normal"
-BBFILE_PATTERN_normal := "^${LAYERDIR}/"
-BBFILE_PRIORITY_normal = "5"
+BBFILE_COLLECTIONS += "core"
+BBFILE_PATTERN_core := "^${LAYERDIR}/"
+BBFILE_PRIORITY_core = "5"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_core = "1"
 
 # Set a variable to get to the top of the metadata location
 COREBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
-- 
1.7.9.5



