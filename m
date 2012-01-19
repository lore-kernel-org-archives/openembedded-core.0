Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rnpdn-0002GJ-9S
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 11:54:47 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2012 02:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113934478"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.198])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2012 02:32:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 10:32:10 +0000
Message-Id: <e31a6d93bb9267c84675373830678b28cb2781d4.1326968802.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326968802.git.paul.eggleton@linux.intel.com>
References: <cover.1326968802.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326968802.git.paul.eggleton@linux.intel.com>
References: <cover.1326968802.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] buildhistory_analysis: correctly handle whitespace when splitting lists
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
X-List-Received-Date: Thu, 19 Jan 2012 10:54:47 -0000

Don't specify any argument to the split() function when handling changes
to list type variables (e.g. PACKAGES) so that the values are split by
any whitespace and only split once for a block of multiple whitespace
characters.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index d3c0448..a2fa643 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -34,8 +34,8 @@ class ChangeRecord:
 
     def __str__(self):
         if self.fieldname in list_fields:
-            aitems = self.oldvalue.split(' ')
-            bitems = self.newvalue.split(' ')
+            aitems = self.oldvalue.split()
+            bitems = self.newvalue.split()
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
             return '%s: %s:%s%s' % (self.path, self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
-- 
1.7.5.4



