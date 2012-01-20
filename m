Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RoJhp-0007jA-6u
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 20:00:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2012 10:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="114501857"
Received: from unknown (HELO localhost) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2012 10:53:15 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 12:52:53 -0600
Message-Id: <e33d9744af1b0ab1c95930db23e3ee5d59b90624.1327084753.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <c6e9e1ecaf59db9149ce4570435f48c927acb29c.1327084753.git.tom.zanussi@intel.com>
References: <c6e9e1ecaf59db9149ce4570435f48c927acb29c.1327084753.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1327084753.git.tom.zanussi@intel.com>
References: <cover.1327084753.git.tom.zanussi@intel.com>
Subject: [PATCH 3/5] base.bbclass: replace COMMERCIAL_LICENSE code with LICENSE_FLAGS code
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
X-List-Received-Date: Fri, 20 Jan 2012 19:00:57 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The COMMERCIAL_LICENSE mechanism has been superseded by LICENSE_FLAGS
so remove the code that implements COMMERCIAL_LICENSE and replace it
with the corresponding LICENSE_FLAGS version.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/base.bbclass |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 091e965..bb3c38d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -349,12 +349,12 @@ python () {
     if license == "INVALID":
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
 
-    commercial_license = " %s " % d.getVar('COMMERCIAL_LICENSE', 1)
-    import re
-    pnr = "[ \t]%s[ \t]" % pn.replace('+', "\+")
-    if commercial_license and re.search(pnr, commercial_license):
-        bb.debug(1, "Skipping %s because it's commercially licensed" % pn)
-        raise bb.parse.SkipPackage("because it may require a commercial license to ship in a product (listed in COMMERCIAL_LICENSE)")
+    unmatched_license_flag = check_license_flags(d)
+    if unmatched_license_flag:
+        bb.debug(1, "Skipping %s because it has a restricted license not"
+             " whitelisted in LICENSE_FLAGS_WHITELIST" % pn)
+        raise bb.parse.SkipPackage("because it has a restricted license not"
+             " whitelisted in LICENSE_FLAGS_WHITELIST")
 
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
-- 
1.7.0.4



