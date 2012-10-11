Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TMHMJ-0004t6-5t
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 13:55:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2012 04:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,571,1344236400"; d="scan'208";a="203222914"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.62])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2012 04:42:10 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2012 14:44:46 +0300
Message-Id: <1349955886-6399-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] sanity.bbclass: trigger network tests explicitly
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
X-List-Received-Date: Thu, 11 Oct 2012 11:55:23 -0000

The network tests in sanity.bbclass can now be trigerred explicitly
by firing the NetworkTest event. This is part of the fix for bug #3026.

[YOCTO #3026]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/classes/sanity.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index f2e9a74..3806bc5 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -639,6 +639,9 @@ python check_sanity_eventhandler() {
         sanity_data.setVar("SANITY_USE_EVENTS", "1")
         check_sanity(sanity_data)
         bb.event.fire(bb.event.SanityCheckPassed(), e.data)
+    elif bb.event.getName(e) == "NetworkTest":
+        sanity_data = copy_data(e)
+        bb.event.fire(bb.event.NetworkTestFailed() if check_connectivity(sanity_data) else bb.event.NetworkTestPassed(), e.data)
 
     return
 }
-- 
1.7.9.5



