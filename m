Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SMb9K-0005Di-07
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 10:31:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Apr 2012 01:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157494512"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga002.fm.intel.com with ESMTP; 24 Apr 2012 01:21:26 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Apr 2012 16:18:15 +0800
Message-Id: <466ec63d843bd1f13db3928871890b2e9f53c373.1335254875.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1335254875.git.dongxiao.xu@intel.com>
References: <cover.1335254875.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1335254875.git.dongxiao.xu@intel.com>
References: <cover.1335254875.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] sanity.bbclass: Add a new case to issue sanity_check()
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
X-List-Received-Date: Tue, 24 Apr 2012 08:31:02 -0000

Judge if "SanityCheck" event is received, it will issue the
sanity_check() and send "SanityCheckPassed" back if succeeded.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/sanity.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c3d4e58..687ddeb 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -455,6 +455,9 @@ addhandler check_sanity_eventhandler
 python check_sanity_eventhandler() {
     if bb.event.getName(e) == "ConfigParsed" and e.data.getVar("BB_WORKERCONTEXT", True) != "1" and e.data.getVar("DISABLE_SANITY_CHECKS", True) != "1":
         check_sanity(e)
+    elif bb.event.getName(e) == "SanityCheck":
+        check_sanity(e)
+        bb.event.fire(bb.event.SanityCheckPassed(), e.data)
 
     return
 }
-- 
1.7.4.1



