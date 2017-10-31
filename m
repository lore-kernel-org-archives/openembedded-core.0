Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6931E6022F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 17:43:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Oct 2017 10:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,325,1505804400"; d="scan'208";a="1212472684"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2017 10:43:54 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Oct 2017 19:43:56 +0200
Message-Id: <20171031174357.9502-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH 1/2] distrodata.bbclass: make upstream version check more useful for git upstreams
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
X-List-Received-Date: Tue, 31 Oct 2017 17:43:55 -0000

Specifically:

1) remove +git${SRCPV} stuff from comparison and output; it's just
unnecessary clutter;

2) write the commit id of the latest version tag into the output;
this saves quite a bit of trouble of manually checking what that
commit id is when doing version updates;

3) when UPSTREAM_CHECK_COMMITS is set, ignore the tags altogether;
instead check if the latest commit is different to the one we use,
and if so, report that the recipe can be updated to said commit
(which is also written into the output, as in 2). Multiple
recipes are failing the upstream check because they never
issue tags, now we can fix them.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 26 ++++++++----------------
 meta/lib/oe/recipeutils.py      | 44 +++++++++++++++++------------------------
 2 files changed, 26 insertions(+), 44 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index c85f7b3474f..b0f4ecea09f 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -272,24 +272,15 @@ python do_checkpkg() {
             if upstream_check_unreliable == "1":
                 return "N/A", "CHECK_IS_UNRELIABLE"
 
-            try:
-                uv = oe.recipeutils.get_recipe_upstream_version(localdata)
-                pupver = uv['version'] if uv['version'] else "N/A"
-            except Exception as e:
-                pupver = "N/A"
+            uv = oe.recipeutils.get_recipe_upstream_version(localdata)
+            pupver = uv['version'] if uv['version'] else "N/A"
+            pversion = uv['current_version']
+            revision = uv['revision'] if uv['revision'] else "N/A"
 
             if pupver == "N/A":
                 pstatus = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
             else:
-                src_uri = (localdata.getVar('SRC_URI') or '').split()
-                if src_uri:
-                    uri_type, _, _, _, _, _ = decodeurl(src_uri[0])
-                else:
-                    uri_type = "none"
-                pv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pversion, uri_type)
-                upv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pupver, uri_type)
-
-                cmp = vercmp_string(pv, upv)
+                cmp = vercmp_string(pversion, pupver)
                 if cmp == -1:
                     pstatus = "UPDATE" if not upstream_version_unknown else "KNOWN_BROKEN"
                 elif cmp == 0:
@@ -297,7 +288,7 @@ python do_checkpkg() {
                 else:
                     pstatus = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
 
-            return pupver, pstatus
+            return pversion, pupver, pstatus, revision
 
 
         """initialize log files."""
@@ -334,7 +325,6 @@ python do_checkpkg() {
 
         pdesc = localdata.getVar('DESCRIPTION')
         pgrp = localdata.getVar('SECTION')
-        pversion = localdata.getVar('PV')
         plicense = localdata.getVar('LICENSE')
         psection = localdata.getVar('SECTION')
         phome = localdata.getVar('HOMEPAGE')
@@ -345,7 +335,7 @@ python do_checkpkg() {
         psrcuri = localdata.getVar('SRC_URI')
         maintainer = localdata.getVar('RECIPE_MAINTAINER')
 
-        pupver, pstatus = get_upstream_version_and_status()
+        pversion, pupver, pstatus, prevision = get_upstream_version_and_status()
 
         if psrcuri:
             psrcuri = psrcuri.split()[0]
@@ -358,7 +348,7 @@ python do_checkpkg() {
         with open(logfile, "a") as f:
             writer = csv.writer(f, delimiter='\t')
             writer.writerow([pname, pversion, pupver, plicense, psection, phome, 
-                prelease, pdepends, pbugtracker, ppe, pdesc, pstatus, pupver,
+                prelease, pdepends, pbugtracker, ppe, pdesc, pstatus, prevision,
                 psrcuri, maintainer, no_upgr_reason])
             f.close()
         bb.utils.unlockfile(lf)
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c8570acf9e7..9313915ff09 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -862,25 +862,25 @@ def get_recipe_upstream_version(rd):
             FetchError when don't have network access or upstream site don't response.
             NoMethodError when uri latest_versionstring method isn't implemented.
 
-        Returns a dictonary with version, type and datetime.
+        Returns a dictonary with version, repository revision, current_version, type and datetime.
         Type can be A for Automatic, M for Manual and U for Unknown.
     """
     from bb.fetch2 import decodeurl
     from datetime import datetime
 
     ru = {}
+    ru['current_version'] = rd.getVar('PV')
     ru['version'] = ''
     ru['type'] = 'U'
     ru['datetime'] = ''
-
-    pv = rd.getVar('PV')
+    ru['revision'] = ''
 
     # XXX: If don't have SRC_URI means that don't have upstream sources so
     # returns the current recipe version, so that upstream version check
     # declares a match.
     src_uris = rd.getVar('SRC_URI')
     if not src_uris:
-        ru['version'] = pv
+        ru['version'] = ru['current_version']
         ru['type'] = 'M'
         ru['datetime'] = datetime.now()
         return ru
@@ -889,6 +889,9 @@ def get_recipe_upstream_version(rd):
     src_uri = src_uris.split()[0]
     uri_type, _, _, _, _, _ =  decodeurl(src_uri)
 
+    (pv, pfx, sfx) = get_recipe_pv_without_srcpv(rd.getVar('PV'), uri_type)
+    ru['current_version'] = pv
+
     manual_upstream_version = rd.getVar("RECIPE_UPSTREAM_VERSION")
     if manual_upstream_version:
         # manual tracking of upstream version.
@@ -909,33 +912,22 @@ def get_recipe_upstream_version(rd):
         ru['datetime'] = datetime.now()
     else:
         ud = bb.fetch2.FetchData(src_uri, rd)
-        pupver = ud.method.latest_versionstring(ud, rd)
-        (upversion, revision) = pupver
-
-        # format git version version+gitAUTOINC+HASH
-        if uri_type == 'git':
-            (pv, pfx, sfx) = get_recipe_pv_without_srcpv(pv, uri_type)
-
-            # if contains revision but not upversion use current pv
-            if upversion == '' and revision:
-                upversion = pv
-
-            if upversion:
-                tmp = upversion
-                upversion = ''
-
-                if pfx:
-                    upversion = pfx + tmp
-                else:
-                    upversion = tmp
-
-                if sfx:
-                    upversion = upversion + sfx + revision[:10]
+        if rd.getVar("UPSTREAM_CHECK_COMMITS") == "1":
+            revision = ud.method.latest_revision(ud, rd, 'default')
+            upversion = pv
+            if revision != rd.getVar("SRCREV"):
+                upversion = upversion + "-new-commits-available" 
+        else:
+            pupver = ud.method.latest_versionstring(ud, rd)
+            (upversion, revision) = pupver
 
         if upversion:
             ru['version'] = upversion
             ru['type'] = 'A'
 
+        if revision:
+            ru['revision'] = revision
+
         ru['datetime'] = datetime.now()
 
     return ru
-- 
2.14.2


