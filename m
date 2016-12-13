Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 36B5E71B23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:15 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885861"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:39 +1300
Message-Id: <6f16cc0f1a7cd2371e799611f6cda49e14a78eec.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/14] classes/patch: move several functions to oe.patch
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:15 -0000

Move patch_path(), src_patches() and should_apply() to oe.patch, making
them easier to call from elsewhere (particularly across the
UI/server boundary).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/patch.bbclass | 105 ++------------------------------------------
 meta/lib/oe/patch.py       | 107 +++++++++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/recipeutils.py |  12 +++--
 3 files changed, 116 insertions(+), 108 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 7ebae28..0e5b602 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -80,110 +80,13 @@ python patch_task_postfunc() {
 }
 
 def src_patches(d, all=False, expand=True):
-    workdir = d.getVar('WORKDIR', True)
-    fetch = bb.fetch2.Fetch([], d)
-    patches = []
-    sources = []
-    for url in fetch.urls:
-        local = patch_path(url, fetch, workdir, expand)
-        if not local:
-            if all:
-                local = fetch.localpath(url)
-                sources.append(local)
-            continue
-
-        urldata = fetch.ud[url]
-        parm = urldata.parm
-        patchname = parm.get('pname') or os.path.basename(local)
-
-        apply, reason = should_apply(parm, d)
-        if not apply:
-            if reason:
-                bb.note("Patch %s %s" % (patchname, reason))
-            continue
-
-        patchparm = {'patchname': patchname}
-        if "striplevel" in parm:
-            striplevel = parm["striplevel"]
-        elif "pnum" in parm:
-            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
-            striplevel = parm["pnum"]
-        else:
-            striplevel = '1'
-        patchparm['striplevel'] = striplevel
-
-        patchdir = parm.get('patchdir')
-        if patchdir:
-            patchparm['patchdir'] = patchdir
-
-        localurl = bb.fetch.encodeurl(('file', '', local, '', '', patchparm))
-        patches.append(localurl)
-
-    if all:
-        return sources
-
-    return patches
-
-def patch_path(url, fetch, workdir, expand=True):
-    """Return the local path of a patch, or None if this isn't a patch"""
-
-    local = fetch.localpath(url)
-    base, ext = os.path.splitext(os.path.basename(local))
-    if ext in ('.gz', '.bz2', '.Z'):
-        if expand:
-            local = os.path.join(workdir, base)
-        ext = os.path.splitext(base)[1]
-
-    urldata = fetch.ud[url]
-    if "apply" in urldata.parm:
-        apply = oe.types.boolean(urldata.parm["apply"])
-        if not apply:
-            return
-    elif ext not in (".diff", ".patch"):
-        return
-
-    return local
+    import oe.patch
+    return oe.patch.src_patches(d, all, expand)
 
 def should_apply(parm, d):
     """Determine if we should apply the given patch"""
-
-    if "mindate" in parm or "maxdate" in parm:
-        pn = d.getVar('PN', True)
-        srcdate = d.getVar('SRCDATE_%s' % pn, True)
-        if not srcdate:
-            srcdate = d.getVar('SRCDATE', True)
-
-        if srcdate == "now":
-            srcdate = d.getVar('DATE', True)
-
-        if "maxdate" in parm and parm["maxdate"] < srcdate:
-            return False, 'is outdated'
-
-        if "mindate" in parm and parm["mindate"] > srcdate:
-            return False, 'is predated'
-
-
-    if "minrev" in parm:
-        srcrev = d.getVar('SRCREV', True)
-        if srcrev and srcrev < parm["minrev"]:
-            return False, 'applies to later revisions'
-
-    if "maxrev" in parm:
-        srcrev = d.getVar('SRCREV', True)
-        if srcrev and srcrev > parm["maxrev"]:
-            return False, 'applies to earlier revisions'
-
-    if "rev" in parm:
-        srcrev = d.getVar('SRCREV', True)
-        if srcrev and parm["rev"] not in srcrev:
-            return False, "doesn't apply to revision"
-
-    if "notrev" in parm:
-        srcrev = d.getVar('SRCREV', True)
-        if srcrev and parm["notrev"] in srcrev:
-            return False, "doesn't apply to revision"
-
-    return True, None
+    import oe.patch
+    return oe.patch.should_apply(parm, d)
 
 should_apply[vardepsexclude] = "DATE SRCDATE"
 
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index dbefd28..456ee70 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -769,3 +769,110 @@ class UserResolver(Resolver):
             os.chdir(olddir)
             raise
         os.chdir(olddir)
+
+
+def patch_path(url, fetch, workdir, expand=True):
+    """Return the local path of a patch, or None if this isn't a patch"""
+
+    local = fetch.localpath(url)
+    base, ext = os.path.splitext(os.path.basename(local))
+    if ext in ('.gz', '.bz2', '.Z'):
+        if expand:
+            local = os.path.join(workdir, base)
+        ext = os.path.splitext(base)[1]
+
+    urldata = fetch.ud[url]
+    if "apply" in urldata.parm:
+        apply = oe.types.boolean(urldata.parm["apply"])
+        if not apply:
+            return
+    elif ext not in (".diff", ".patch"):
+        return
+
+    return local
+
+def src_patches(d, all=False, expand=True):
+    workdir = d.getVar('WORKDIR', True)
+    fetch = bb.fetch2.Fetch([], d)
+    patches = []
+    sources = []
+    for url in fetch.urls:
+        local = patch_path(url, fetch, workdir, expand)
+        if not local:
+            if all:
+                local = fetch.localpath(url)
+                sources.append(local)
+            continue
+
+        urldata = fetch.ud[url]
+        parm = urldata.parm
+        patchname = parm.get('pname') or os.path.basename(local)
+
+        apply, reason = should_apply(parm, d)
+        if not apply:
+            if reason:
+                bb.note("Patch %s %s" % (patchname, reason))
+            continue
+
+        patchparm = {'patchname': patchname}
+        if "striplevel" in parm:
+            striplevel = parm["striplevel"]
+        elif "pnum" in parm:
+            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
+            striplevel = parm["pnum"]
+        else:
+            striplevel = '1'
+        patchparm['striplevel'] = striplevel
+
+        patchdir = parm.get('patchdir')
+        if patchdir:
+            patchparm['patchdir'] = patchdir
+
+        localurl = bb.fetch.encodeurl(('file', '', local, '', '', patchparm))
+        patches.append(localurl)
+
+    if all:
+        return sources
+
+    return patches
+
+
+def should_apply(parm, d):
+    if "mindate" in parm or "maxdate" in parm:
+        pn = d.getVar('PN', True)
+        srcdate = d.getVar('SRCDATE_%s' % pn, True)
+        if not srcdate:
+            srcdate = d.getVar('SRCDATE', True)
+
+        if srcdate == "now":
+            srcdate = d.getVar('DATE', True)
+
+        if "maxdate" in parm and parm["maxdate"] < srcdate:
+            return False, 'is outdated'
+
+        if "mindate" in parm and parm["mindate"] > srcdate:
+            return False, 'is predated'
+
+
+    if "minrev" in parm:
+        srcrev = d.getVar('SRCREV', True)
+        if srcrev and srcrev < parm["minrev"]:
+            return False, 'applies to later revisions'
+
+    if "maxrev" in parm:
+        srcrev = d.getVar('SRCREV', True)
+        if srcrev and srcrev > parm["maxrev"]:
+            return False, 'applies to earlier revisions'
+
+    if "rev" in parm:
+        srcrev = d.getVar('SRCREV', True)
+        if srcrev and parm["rev"] not in srcrev:
+            return False, "doesn't apply to revision"
+
+    if "notrev" in parm:
+        srcrev = d.getVar('SRCREV', True)
+        if srcrev and parm["notrev"] in srcrev:
+            return False, "doesn't apply to revision"
+
+    return True, None
+
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index ae83aab..92fa431 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -382,6 +382,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
 
 def get_recipe_local_files(d, patches=False, archives=False):
     """Get a list of local files in SRC_URI within a recipe."""
+    import oe.patch
     uris = (d.getVar('SRC_URI', True) or "").split()
     fetch = bb.fetch2.Fetch(uris, d)
     # FIXME this list should be factored out somewhere else (such as the
@@ -393,7 +394,7 @@ def get_recipe_local_files(d, patches=False, archives=False):
     for uri in uris:
         if fetch.ud[uri].type == 'file':
             if (not patches and
-                    bb.utils.exec_flat_python_func('patch_path', uri, fetch, '', expand=False)):
+                    oe.patch.patch_path(uri, fetch, '', expand=False)):
                 continue
             # Skip files that are referenced by absolute path
             fname = fetch.ud[uri].basepath
@@ -418,10 +419,9 @@ def get_recipe_local_files(d, patches=False, archives=False):
 
 def get_recipe_patches(d):
     """Get a list of the patches included in SRC_URI within a recipe."""
+    import oe.patch
+    patches = oe.patch.src_patches(d, expand=False)
     patchfiles = []
-    # Execute src_patches() defined in patch.bbclass - this works since that class
-    # is inherited globally
-    patches = bb.utils.exec_flat_python_func('src_patches', d, expand=False)
     for patch in patches:
         _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
         patchfiles.append(local)
@@ -438,9 +438,7 @@ def get_recipe_patched_files(d):
         change mode ('A' for add, 'D' for delete or 'M' for modify)
     """
     import oe.patch
-    # Execute src_patches() defined in patch.bbclass - this works since that class
-    # is inherited globally
-    patches = bb.utils.exec_flat_python_func('src_patches', d, expand=False)
+    patches = oe.patch.src_patches(d, expand=False)
     patchedfiles = {}
     for patch in patches:
         _, _, patchfile, _, _, parm = bb.fetch.decodeurl(patch)
-- 
2.5.5


