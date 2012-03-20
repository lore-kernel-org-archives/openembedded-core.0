Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SA1jh-0006pi-H5
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 17:16:37 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2012 09:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141958506"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.195])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2012 09:06:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 16:06:27 +0000
Message-Id: <0da63bcf8dd1843eeddfeb2348791fa75691fe74.1332259383.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332259383.git.paul.eggleton@linux.intel.com>
References: <cover.1332259383.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332259383.git.paul.eggleton@linux.intel.com>
References: <cover.1332259383.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] buildhistory_analysis: report if all items removed from a list
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
X-List-Received-Date: Tue, 20 Mar 2012 16:16:37 -0000

If all items have been removed from a list then state that explicitly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 2942f72..4f55d9a 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -76,7 +76,10 @@ class ChangeRecord:
             added = list(set(bitems) - set(aitems))
 
             if removed or added:
-                out = '%s:%s%s' % (self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
+                if removed and not bitems:
+                    out = '%s: removed all items "%s"' % (self.fieldname, ' '.join(removed))
+                else:
+                    out = '%s:%s%s' % (self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
             else:
                 out = '%s changed order' % self.fieldname
         elif self.fieldname in numeric_fields:
-- 
1.7.5.4



