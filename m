Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 313E5757EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 19:48:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 02 Jun 2015 12:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,541,1427785200"; d="scan'208";a="719544797"
Received: from krithika-mobl2.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.254.180.132])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2015 12:48:23 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 14:49:47 -0500
Message-Id: <6a36e477f836595ec2ce048efffeb1e375acb30d.1433274434.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433274434.git.anibal.limon@linux.intel.com>
References: <cover.1433274434.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1433274434.git.anibal.limon@linux.intel.com>
References: <cover.1433274434.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] distrodata: checkpkg make usage of oe.recipeutils.get_recipe_upstream_version
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
X-List-Received-Date: Tue, 02 Jun 2015 19:48:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now get_recipe_upstream_version function exists in oe.recipeutils module
to avoid duplicate code make usage of it.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 84 ++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 47 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index e1fc6dd..092c372 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -266,11 +266,15 @@ python do_checkpkg() {
         import re
         import tempfile
         import subprocess
+        import oe.recipeutils
+        from bb.utils import vercmp_string
+        from bb.fetch2 import FetchError, NoMethodError, decodeurl
 
         """first check whether a uri is provided"""
         src_uri = d.getVar('SRC_URI', True)
         if not src_uri:
                 return
+        uri_type, _, _, _, _, _ = decodeurl(src_uri)
 
         """initialize log files."""
         logpath = d.getVar('LOG_DIR', True)
@@ -310,10 +314,7 @@ python do_checkpkg() {
 
         pdesc = localdata.getVar('DESCRIPTION', True)
         pgrp = localdata.getVar('SECTION', True)
-        if localdata.getVar('PRSPV', True):
-                pversion = localdata.getVar('PRSPV', True)
-        else:
-                pversion = localdata.getVar('PV', True)
+        pversion = localdata.getVar('PV', True)
         plicense = localdata.getVar('LICENSE', True)
         psection = localdata.getVar('SECTION', True)
         phome = localdata.getVar('HOMEPAGE', True)
@@ -325,61 +326,50 @@ python do_checkpkg() {
         maintainer = localdata.getVar('RECIPE_MAINTAINER', True)
 
         """ Get upstream version version """
-        pupver = None
-        pstatus = "ErrUnknown"
-        found = 0
-
-        for uri in src_uri.split():
-            m = re.compile('(?P<type>[^:]*)').match(uri)
-            if not m:
-                raise MalformedUrl(uri)
-            elif m.group('type') in ('http', 'https', 'ftp', 'cvs', 'svn', 'git'):
-                found = 1
-                psrcuri = uri
-                pproto = m.group('type')
-                break
-        if not found:
-                pproto = "file"
-
-        if pproto in ['http', 'https', 'ftp', 'git']:
-            try:
-                ud = bb.fetch2.FetchData(psrcuri, d)
-                pupver = ud.method.latest_versionstring(ud, d)
-                if pproto == 'git':
-                    if pupver == "":
-                        pupver = pversion.rsplit("+")[0]
-                    if re.search(pversion, "gitrAUTOINC"):
-                        pupver += "+gitrAUTOINC+"
-                    else:
-                        pupver += "+gitAUTOINC+"
-                    latest_revision = ud.method.latest_revision(ud, d, ud.names[0])
-                    pupver += latest_revision[:10]
-            except Exception as inst:
-                bb.warn("%s: unexpected error: %s" % (pname, repr(inst)))
+        pupver = ""
+        pstatus = ""
+
+        try:
+            uv = oe.recipeutils.get_recipe_upstream_version(localdata)
+
+            pupver = uv['version']
+        except Exception as e:
+            if e is FetchError:
                 pstatus = "ErrAccess"
-        elif pproto == "file":
-            """Local files are always updated"""
-            pupver = pversion
-        else:
-            pstatus = "ErrUnsupportedProto"
-            bb.note("do_checkpkg, protocol %s isn't implemented" % pproto)
+            elif e is NoMethodError:
+                pstatus = "ErrUnsupportedProto"
+            else:
+                pstatus = "ErrUnknown"
 
+        """Set upstream version status"""
         if not pupver:
             pupver = "N/A"
-        elif pupver == pversion:
-            pstatus = "MATCH"
         else:
-            pstatus = "UPDATE"
+            pv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pversion, uri_type)
+            upv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pupver, uri_type)
+
+            cmp = vercmp_string(pv, upv)
+            if cmp == -1:
+                pstatus = "UPDATE"
+            elif cmp == 0:
+                pstatus = "MATCH"
 
         """Read from manual distro tracking fields as alternative"""
         pmver = d.getVar("RECIPE_UPSTREAM_VERSION", True)
         if not pmver:
             pmver = "N/A"
             pmstatus = "ErrNoRecipeData"
-        elif pmver == pupver:
-            pmstatus = "MATCH"
         else:
-            pmstatus = "UPDATE"
+            mpv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pmver, uri_type)
+            upv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pupver, uri_type)
+
+            cmp = vercmp_string(mpv, upv)
+            if cmp == -1:
+                pmstatus = "UPDATE"
+            elif cmp == 0:
+                pmstatus = "MATCH"
+            else:
+                pmstatus = ""
 
         pdepends = "".join(pdepends.split("\t"))
         pdesc = "".join(pdesc.split("\t"))
-- 
1.9.1


