Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 08151605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:11:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2016 22:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="915344766"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2016 22:11:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:10:56 +1300
Message-Id: <40b3be38d6781f48901e225992f75d1e2543eb30.1458537025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537025.git.paul.eggleton@linux.intel.com>
References: <cover.1458537025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537025.git.paul.eggleton@linux.intel.com>
References: <cover.1458537025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/packagegroup: fix dbg/dev/ptest complementary packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Mar 2016 05:11:33 -0000

OE-Core commit 8981ed20234c42dc1f5cdef802ebe7214bd55238 (from 2013)
caused a regression where -dbg/-dev/-ptest packages weren't generated
for packagegroups because we weren't setting ALLOW_EMPTY for them.
Break out the code for adding complementary groups to its own
conditional so we can set ALLOW_EMPTY at the same time.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/packagegroup.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 56cfead..92e0bbe 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -22,12 +22,15 @@ inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED', True) == 'all', 'al
 # Also mark all packages as ALLOW_EMPTY
 python () {
     packages = d.getVar('PACKAGES', True).split()
-    genpackages = []
     for pkg in packages:
         d.setVar("ALLOW_EMPTY_%s" % pkg, "1")
-        for postfix in ['-dbg', '-dev', '-ptest']:
-            genpackages.append(pkg+postfix)
     if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY', True) != '1':
+        # Add complementary packagegroups
+        genpackages = []
+        for pkg in packages:
+            for postfix in ['-dbg', '-dev', '-ptest']:
+                genpackages.append(pkg+postfix)
+                d.setVar("ALLOW_EMPTY_%s" % pkg+postfix, "1")
         d.setVar('PACKAGES', ' '.join(packages+genpackages))
 }
 
-- 
2.5.5


