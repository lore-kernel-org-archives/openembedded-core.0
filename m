Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R1KiG-0008Sr-5w
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 18:10:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2011 09:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="50058193"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.53])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2011 09:05:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 17:05:42 +0100
Message-Id: <0c4d59106cfe15e76b9e419798feb90c7b1bf15b.1315411460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1315411459.git.paul.eggleton@linux.intel.com>
References: <cover.1315411459.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1315411459.git.paul.eggleton@linux.intel.com>
References: <cover.1315411459.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] base.bbclass: fix substring matching in COMMERCIAL_LICENSE
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
X-List-Received-Date: Wed, 07 Sep 2011 16:10:56 -0000

Previously, if for example you had a package called "mx", and a second
package called "libomxil" listed in COMMERCIAL_LICENSE (without mx being
listed there), it would match mx as being commercially licensed because
mx is a substring of libomxil. Fix the search to ensure it only matches
the listed package name exactly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3501f4b..104bec8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -340,9 +340,9 @@ python () {
     if license == "INVALID":
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
 
-    commercial_license = bb.data.getVar('COMMERCIAL_LICENSE', d, 1)
+    commercial_license = " %s " % bb.data.getVar('COMMERCIAL_LICENSE', d, 1)
     import re
-    pnr = pn.replace('+', "\+")
+    pnr = "[ \t]%s[ \t]" % pn.replace('+', "\+")
     if commercial_license and re.search(pnr, commercial_license):
         bb.debug(1, "Skipping %s because it's commercially licensed" % pn)
         raise bb.parse.SkipPackage("because it may require a commercial license to ship in a product (listed in COMMERCIAL_LICENSE)")
-- 
1.7.4.1



