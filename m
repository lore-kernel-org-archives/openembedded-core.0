Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9806E78250
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 09:48:37 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 02:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,356,1498546800"; d="scan'208";a="117958424"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 11 Aug 2017 02:48:37 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 12:45:15 +0300
Message-Id: <20170811094519.27645-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH 1/5] distrodata.bbclass: add UPSTREAM_VERSION_UNKNOWN and UPSTREAM_CHECK_UNRELIABLE
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
X-List-Received-Date: Fri, 11 Aug 2017 09:48:37 -0000

These are optional per-recipe variables with the following meaning:

UPSTREAM_VERSION_UNKNOWN - set if the upstream version check fails reliably,
e.g. absent git tags, or weird version format used on our or on upstream side.
If this variable is not set and version check fails, or if it is set and
the version check succeeds, then the checkpkg selftest for the recipe will fail.

UPSTREAM_CHECK_UNRELIABLE - set if the upstream check cannot be reliably performed
due to transient network failures, or server behaving weirdly. This one should be used
sparingly, as it completely excludes a recipe from upstream checking, and thus
we don't get automatically notified about new upstream releases.

Also the upstream status string in the checkpkg csv output is clarified with the following
possible values:
MATCH - recipe is providing the latest upstream version
UPDATE - there is a new version released by upstream, recipe should be updated
CHECK_IS_UNRELIABLE - an upstream check was skipped as requested by recipe
via UPSTREAM_CHECK_UNRELIABLE
UNKNOWN - upstream version check was performed, but the upstream verison could
not be determined. The recipe acknowledges this via UPSTREAM_VERSION_UNKNOWN setting.
UNKNWON_BROKEN - same as previous, but the recipe does not include the acknowledgement
and should be fixed.
KNOWN_BROKEN - upstream check worked, but recipe claims it shouldn't; to fix this
remove UPSTREAM_VERSION_UNKNOWN from recipe.

[YOCTO #11896]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 73 ++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 5e344416105..c85f7b3474f 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -261,12 +261,44 @@ python do_checkpkg() {
         from bb.utils import vercmp_string
         from bb.fetch2 import FetchError, NoMethodError, decodeurl
 
-        """first check whether a uri is provided"""
-        src_uri = (d.getVar('SRC_URI') or '').split()
-        if src_uri:
-            uri_type, _, _, _, _, _ = decodeurl(src_uri[0])
-        else:
-            uri_type = "none"
+        def get_upstream_version_and_status():
+
+            # set if the upstream check fails reliably, e.g. absent git tags, or weird version format used on our or on upstream side.
+            upstream_version_unknown = localdata.getVar('UPSTREAM_VERSION_UNKNOWN')
+            # set if the upstream check cannot be reliably performed due to transient network failures, or server behaving weirdly. 
+            # This one should be used sparingly, as it completely excludes a recipe from upstream checking.
+            upstream_check_unreliable = localdata.getVar('UPSTREAM_CHECK_UNRELIABLE')
+
+            if upstream_check_unreliable == "1":
+                return "N/A", "CHECK_IS_UNRELIABLE"
+
+            try:
+                uv = oe.recipeutils.get_recipe_upstream_version(localdata)
+                pupver = uv['version'] if uv['version'] else "N/A"
+            except Exception as e:
+                pupver = "N/A"
+
+            if pupver == "N/A":
+                pstatus = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
+            else:
+                src_uri = (localdata.getVar('SRC_URI') or '').split()
+                if src_uri:
+                    uri_type, _, _, _, _, _ = decodeurl(src_uri[0])
+                else:
+                    uri_type = "none"
+                pv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pversion, uri_type)
+                upv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pupver, uri_type)
+
+                cmp = vercmp_string(pv, upv)
+                if cmp == -1:
+                    pstatus = "UPDATE" if not upstream_version_unknown else "KNOWN_BROKEN"
+                elif cmp == 0:
+                    pstatus = "MATCH" if not upstream_version_unknown else "KNOWN_BROKEN"
+                else:
+                    pstatus = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
+
+            return pupver, pstatus
+
 
         """initialize log files."""
         logpath = d.getVar('LOG_DIR')
@@ -313,34 +345,7 @@ python do_checkpkg() {
         psrcuri = localdata.getVar('SRC_URI')
         maintainer = localdata.getVar('RECIPE_MAINTAINER')
 
-        """ Get upstream version version """
-        pupver = ""
-        pstatus = ""
-
-        try:
-            uv = oe.recipeutils.get_recipe_upstream_version(localdata)
-
-            pupver = uv['version']
-        except Exception as e:
-            if e is FetchError:
-                pstatus = "ErrAccess"
-            elif e is NoMethodError:
-                pstatus = "ErrUnsupportedProto"
-            else:
-                pstatus = "ErrUnknown"
-
-        """Set upstream version status"""
-        if not pupver:
-            pupver = "N/A"
-        else:
-            pv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pversion, uri_type)
-            upv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pupver, uri_type)
-
-            cmp = vercmp_string(pv, upv)
-            if cmp == -1:
-                pstatus = "UPDATE"
-            elif cmp == 0:
-                pstatus = "MATCH"
+        pupver, pstatus = get_upstream_version_and_status()
 
         if psrcuri:
             psrcuri = psrcuri.split()[0]
-- 
2.13.2


