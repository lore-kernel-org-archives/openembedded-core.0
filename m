Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8cXB-0004u5-VI
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2012 12:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="140089194"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.171])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2012 12:01:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 19:00:57 +0000
Message-Id: <2b1fc484fc04dcd1286f0b690cef5da879843d21.1331924409.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331924409.git.paul.eggleton@linux.intel.com>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331924409.git.paul.eggleton@linux.intel.com>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] buildhistory_analysis: fix duplicate PE/PV/PR in related fields
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
X-List-Received-Date: Fri, 16 Mar 2012 19:09:54 -0000

Since PE, PV and PR appear in both the recipe history and package
history files these were showing up twice when they were added as
related fields to monitored changes. Only add them when the path is
exactly the same.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 4f3e635..d09911c 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -307,7 +307,7 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
                 if chg.path == chg2.path or os.path.dirname(chg.path) == chg2.path:
                     if chg2.fieldname in related_fields.get(chg.fieldname, []):
                         chg.related.append(chg2)
-                    elif chg.path.startswith('packages/') and chg2.fieldname in ['PE', 'PV', 'PR']:
+                    elif chg.path == chg2.path and chg.path.startswith('packages/') and chg2.fieldname in ['PE', 'PV', 'PR']:
                         chg.related.append(chg2)
 
     if report_all:
-- 
1.7.5.4



