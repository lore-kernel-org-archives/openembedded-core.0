Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Rhnge-0001Rn-VE
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 20:36:49 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 11:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91624645"
Received: from unknown (HELO localhost) ([10.255.13.35])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 11:29:26 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Mon,  2 Jan 2012 13:29:24 -0600
Message-Id: <6f382ab47a126d96637ba3581f11bf1f2093b5a0.1325526807.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325526807.git.tom.zanussi@intel.com>
References: <cover.1325526807.git.tom.zanussi@intel.com>
Subject: [PATCH 1/5] base.bbclass: add support for LICENSE_FLAGS
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
X-List-Received-Date: Mon, 02 Jan 2012 19:36:49 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

LICENSE_FLAGS are a per-recipe replacement for COMMERCIAL_FLAGS.  Any
flags listed in a recipe's LICENSE_FLAGS variable must have a match in
the global LICENSE_FLAGS_WHITELIST variable.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/base.bbclass |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index fbcaefb..9132ed4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -350,6 +350,25 @@ python () {
     if license == "INVALID":
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
 
+    def skip_package(pn, flag):
+        bb.debug(1, "Skipping %s because it has a restricted license (%s) not"
+             " whitelisted in LICENSE_FLAGS_WHITELIST" % (pn, flag))
+        raise bb.parse.SkipPackage("because it may require a special license"
+            " to ship in a product (listed in LICENSE_FLAGS)")
+
+    def all_license_flags_match(flags, whitelist):
+        for flag in flags.split():
+            if not flag in whitelist.split():
+                return False
+        return True
+
+    license_flags = d.getVar('LICENSE_FLAGS', True)
+    if license_flags:
+        license_flags_whitelist = d.getVar('LICENSE_FLAGS_WHITELIST', True)
+        if not license_flags_whitelist or not all_license_flags_match(
+                license_flags, license_flags_whitelist):
+            skip_package(pn, license_flags)
+
     commercial_license = " %s " % d.getVar('COMMERCIAL_LICENSE', 1)
     import re
     pnr = "[ \t]%s[ \t]" % pn.replace('+', "\+")
-- 
1.7.0.4



