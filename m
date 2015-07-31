Return-Path: <elizabeth.flanagan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 62A54765C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:40:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2015 08:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,585,1432623600"; d="scan'208";a="774118818"
Received: from unknown (HELO fuath.ger.corp.intel.com) ([10.252.3.183])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2015 08:40:22 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 16:40:07 +0100
Message-Id: <1438357207-5954-1-git-send-email-elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH][master|fido|dizzy] base.bbclass: Note when including pn with INCOMPATIBLE_LICENSES
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
X-List-Received-Date: Fri, 31 Jul 2015 15:40:25 -0000

We need to be able to tell people if we WHITELIST a recipe
that contains an incompatible licese.

Example: If we set WHITELIST_GPL-3.0 ?= "foo", foo will end
up on an image even if GPL-3.0 is incompatible. This is the
correct behaviour but there is nothing telling people that it
is even happening.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/base.bbclass | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bfc78db..531b0e7 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -478,12 +478,30 @@ python () {
             bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
             whitelist = []
+            incompatwl = []
+            htincompatwl = []
             for lic in bad_licenses:
+                spdx_license = return_spdx(d, lic)
                 for w in ["HOSTTOOLS_WHITELIST_", "LGPLv2_WHITELIST_", "WHITELIST_"]:
                     whitelist.extend((d.getVar(w + lic, True) or "").split())
-                spdx_license = return_spdx(d, lic)
-                if spdx_license:
-                    whitelist.extend((d.getVar('HOSTTOOLS_WHITELIST_%s' % spdx_license, True) or "").split())
+                    if spdx_license:
+                        whitelist.extend((d.getVar(w + spdx_license, True) or "").split())
+                    '''
+                    We need to track what we are whitelisting and why. If pn is 
+                    incompatible and is not HOSTTOOLS_WHITELIST_ we need to be 
+                    able to note that the image that is created may infact 
+                    contain incompatible licenses despite INCOMPATIBLE_LICENSE 
+                    being set.
+                    '''
+                    if "HOSTTOOLS" in w:
+                        htincompatwl.extend((d.getVar(w + lic, True) or "").split())
+                        if spdx_license:
+                            htincompatwl.extend((d.getVar(w + spdx_license, True) or "").split())
+                    else:
+                        incompatwl.extend((d.getVar(w + lic, True) or "").split())
+                        if spdx_license:
+                            incompatwl.extend((d.getVar(w + spdx_license, True) or "").split())
+
             if not pn in whitelist:
                 recipe_license = d.getVar('LICENSE', True)
                 pkgs = d.getVar('PACKAGES', True).split()
@@ -504,6 +522,11 @@ python () {
                 elif all_skipped or incompatible_license(d, bad_licenses):
                     bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, recipe_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % recipe_license)
+            elif pn in whitelist:
+                if pn in incompatwl:
+                    bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
+                elif pn in htincompatwl:
+                    bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")
 
     srcuri = d.getVar('SRC_URI', True)
     # Svn packages should DEPEND on subversion-native
-- 
1.9.1

-------------------------------------------------------------
Intel Ireland Limited (Branch)
Collinstown Industrial Park, Leixlip, County Kildare, Ireland
Registered Number: E902934

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


