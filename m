Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SA1jg-0006pi-R9
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 17:16:37 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2012 09:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141958482"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.195])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2012 09:06:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 16:06:25 +0000
Message-Id: <7c29300e0567807044ff9d27869d2d09fbc9e0a6.1332259383.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332259383.git.paul.eggleton@linux.intel.com>
References: <cover.1332259383.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332259383.git.paul.eggleton@linux.intel.com>
References: <cover.1332259383.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] buildhistory_analysis: hide version number increases in dependencies
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
X-List-Received-Date: Tue, 20 Mar 2012 16:16:37 -0000

If an item in RDEPENDS or RRECOMMENDS only increases in its version
number then don't report it as a change, since we don't care about
it. This significantly reduces the noise after upgrades.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |   51 +++++++++++++++++++++++++++++++--
 1 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index c0fa339..a828f28 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -55,8 +55,7 @@ class ChangeRecord:
         else:
             prefix = ''
 
-        def pkglist_split(pkgs):
-            depver = bb.utils.explode_dep_versions(pkgs)
+        def pkglist_combine(depver):
             pkglist = []
             for k,v in depver.iteritems():
                 if v:
@@ -67,8 +66,9 @@ class ChangeRecord:
 
         if self.fieldname in list_fields or self.fieldname in list_order_fields:
             if self.fieldname in ['RDEPENDS', 'RRECOMMENDS']:
-                aitems = pkglist_split(self.oldvalue)
-                bitems = pkglist_split(self.newvalue)
+                (depvera, depverb) = compare_pkg_lists(self.oldvalue, self.newvalue)
+                aitems = pkglist_combine(depvera)
+                bitems = pkglist_combine(depverb)
             else:
                 aitems = self.oldvalue.split()
                 bitems = self.newvalue.split()
@@ -239,6 +239,45 @@ def compare_lists(alines, blines):
     return filechanges
 
 
+def split_version(s):
+    """Split a version string into its constituent parts (PE, PV, PR)
+    FIXME: this is a duplicate of a new function in bitbake/lib/bb/utils -
+    we should switch to that once we can bump the minimum bitbake version
+    """
+    s = s.strip(" <>=")
+    e = 0
+    if s.count(':'):
+        e = int(s.split(":")[0])
+        s = s.split(":")[1]
+    r = ""
+    if s.count('-'):
+        r = s.rsplit("-", 1)[1]
+        s = s.rsplit("-", 1)[0]
+    v = s
+    return (e, v, r)
+
+
+def compare_pkg_lists(astr, bstr):
+    depvera = bb.utils.explode_dep_versions(astr)
+    depverb = bb.utils.explode_dep_versions(bstr)
+
+    # Strip out changes where the version has increased
+    remove = []
+    for k in depvera:
+        if k in depverb:
+            dva = depvera[k]
+            dvb = depverb[k]
+            if dva != dvb:
+                if bb.utils.vercmp(split_version(dva), split_version(dvb)) < 0:
+                    remove.append(k)
+
+    for k in remove:
+        depvera.pop(k)
+        depverb.pop(k)
+
+    return (depvera, depverb)
+
+
 def compare_dict_blobs(path, ablob, bblob, report_all):
     adict = blob_to_dict(ablob)
     bdict = blob_to_dict(bblob)
@@ -259,6 +298,10 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
                 if percentchg < monitor_numeric_threshold:
                     continue
             elif (not report_all) and key in list_fields:
+                if key in ['RDEPENDS', 'RRECOMMENDS']:
+                    (depvera, depverb) = compare_pkg_lists(astr, bstr)
+                    if depvera == depverb:
+                        continue
                 alist = astr.split()
                 alist.sort()
                 blist = bstr.split()
-- 
1.7.5.4



