Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3A60C60144
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 09:15:12 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so821263wib.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 02:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PZ0MrngepH2F2K89Ydah8fu2XCSY/9YB6iOjk5Xh680=;
	b=OVJEcLVzcliNWIVcZEtQBPslHilYZDEQZ8Vu2nEJqcdgJgNGlITkZLgxcNLAcN6Gk5
	1GfagvVYDtSTIPyxuIZGTeMacrolHVFV3WMDoC2U6UlEzq6CEDE1QA4HFfMrJtYsAP2S
	MEAi2Ojovfbr9sNCCv/fvJxNKPM8fHJaFqY7WiMAEwSGWdHJm5iLCnU27fpDN1uWyMfK
	ly0TGKCkRJtbCoRdQXdAOb/0PNWZe8EgUasoEHK6xTlMev1U0u+BKisTRjV9CT+7+LUW
	iZmwZJGc2S512bDOXrM62836Gs0qC8VGH64cxnmj9PCSJNX2P4pTEOvaG5QAFPimSjB5
	meOw==
X-Gm-Message-State: ALoCoQlzpxtKdmGIuEWoxwa4tfMiq5lNh1VMMy+vyRaUwTqVPB2u7ZxKS6fXiF5nv1xAfl1To0pB
X-Received: by 10.181.13.112 with SMTP id ex16mr2762135wid.23.1396602913062;
	Fri, 04 Apr 2014 02:15:13 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id u46sm18216714eel.1.2014.04.04.02.15.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Apr 2014 02:15:12 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 11:15:04 +0200
Message-Id: <1396602904-14596-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [Dora][PATCH] buildhistory-diff: add ability to report version changes
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
X-List-Received-Date: Fri, 04 Apr 2014 09:15:17 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Add a -v/--report-ver option to report changes in PKGE/PKGV/PKGR even
if the value is the same as the default from PE/PV/PR.

Also add a -a/--report-all option to report all changes instead of just
the default significant ones.

Addresses [YOCTO #5263].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>


(From OE-Core master rev: b7de1eaac9eed559b2d68058f5de67de74a6cb58)

Dora backport a51d96c44e6feac8322284c54bfc01ef598f8821 broke buildhistory-diff:

koen@beast:/build/v2013.12$ buildhistory-diff
Traceback (most recent call last):
  File "/build/v2013.12/sources/openembedded-core/scripts/buildhistory-diff", line 98, in <module>
    main()
  File "/build/v2013.12/sources/openembedded-core/scripts/buildhistory-diff", line 82, in main
    changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev)
  File "/build/v2013.12/sources/openembedded-core/meta/lib/oe/buildhistory_analysis.py", line 403, in process_changes
    changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all, report_ver))

Cherry-pick the commit that the backport needs. And since it's a cherry-pick:

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

---
 meta/lib/oe/buildhistory_analysis.py | 41 +++++++++++++++++++-----------------
 scripts/buildhistory-diff            |  8 ++++++-
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index ffe12d0..ed3a1ec 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -19,10 +19,11 @@ import bb.utils
 # How to display fields
 list_fields = ['DEPENDS', 'RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS', 'FILES', 'FILELIST', 'USER_CLASSES', 'IMAGE_CLASSES', 'IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS']
 list_order_fields = ['PACKAGES']
-defaultval_fields = ['PKG', 'PKGE', 'PKGV', 'PKGR']
+defaultval_map = {'PKG': 'PKG', 'PKGE': 'PE', 'PKGV': 'PV', 'PKGR': 'PR'}
 numeric_fields = ['PKGSIZE', 'IMAGESIZE']
 # Fields to monitor
-monitor_fields = ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RREPLACES', 'RCONFLICTS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'PKG', 'PKGE', 'PKGV', 'PKGR']
+monitor_fields = ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RREPLACES', 'RCONFLICTS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'PKG']
+ver_monitor_fields = ['PKGE', 'PKGV', 'PKGR']
 # Percentage change to alert for numeric fields
 monitor_numeric_threshold = 10
 # Image files to monitor (note that image-info.txt is handled separately)
@@ -94,7 +95,7 @@ class ChangeRecord:
             else:
                 percentchg = 100
             out = '%s changed from %s to %s (%s%d%%)' % (self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg)
-        elif self.fieldname in defaultval_fields:
+        elif self.fieldname in defaultval_map:
             out = '%s changed from %s to %s' % (self.fieldname, self.oldvalue, self.newvalue)
             if self.fieldname == 'PKG' and '[default]' in self.newvalue:
                 out += ' - may indicate debian renaming failure'
@@ -305,24 +306,32 @@ def compare_pkg_lists(astr, bstr):
     return (depvera, depverb)
 
 
-def compare_dict_blobs(path, ablob, bblob, report_all):
+def compare_dict_blobs(path, ablob, bblob, report_all, report_ver):
     adict = blob_to_dict(ablob)
     bdict = blob_to_dict(bblob)
 
     pkgname = os.path.basename(path)
+
     defaultvals = {}
     defaultvals['PKG'] = pkgname
-    defaultvals['PKGE'] = adict.get('PE', '0')
-    defaultvals['PKGV'] = adict.get('PV', '')
-    defaultvals['PKGR'] = adict.get('PR', '')
-    for key in defaultvals:
-        defaultvals[key] = '%s [default]' % defaultvals[key]
+    defaultvals['PKGE'] = '0'
 
     changes = []
-    keys = list(set(adict.keys()) | set(bdict.keys()))
+    keys = list(set(adict.keys()) | set(bdict.keys()) | set(defaultval_map.keys()))
     for key in keys:
         astr = adict.get(key, '')
         bstr = bdict.get(key, '')
+        if key in ver_monitor_fields:
+            monitored = report_ver or astr or bstr
+        else:
+            monitored = key in monitor_fields
+        mapped_key = defaultval_map.get(key, '')
+        if mapped_key:
+            if not astr:
+                astr = '%s [default]' % adict.get(mapped_key, defaultvals.get(key, ''))
+            if not bstr:
+                bstr = '%s [default]' % bdict.get(mapped_key, defaultvals.get(key, ''))
+
         if astr != bstr:
             if (not report_all) and key in numeric_fields:
                 aval = int(astr or 0)
@@ -350,18 +359,12 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
                 if ' '.join(alist) == ' '.join(blist):
                     continue
 
-            if key in defaultval_fields:
-                if not astr:
-                    astr = defaultvals[key]
-                elif not bstr:
-                    bstr = defaultvals[key]
-
-            chg = ChangeRecord(path, key, astr, bstr, key in monitor_fields)
+            chg = ChangeRecord(path, key, astr, bstr, monitored)
             changes.append(chg)
     return changes
 
 
-def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False):
+def process_changes(repopath, revision1, revision2='HEAD', report_all=False, report_ver=False):
     repo = git.Repo(repopath)
     assert repo.bare == False
     commit = repo.commit(revision1)
@@ -373,7 +376,7 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
         if path.startswith('packages/'):
             filename = os.path.basename(d.a_blob.path)
             if filename == 'latest':
-                changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
+                changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all, report_ver))
             elif filename.startswith('latest.'):
                 chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
                 changes.append(chg)
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index b82240d..ad50414 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -27,6 +27,12 @@ def main():
     parser.add_option("-p", "--buildhistory-dir",
             help = "Specify path to buildhistory directory (defaults to buildhistory/ under cwd)",
             action="store", dest="buildhistory_dir", default='buildhistory/')
+    parser.add_option("-v", "--report-version",
+            help = "Report changes in PKGE/PKGV/PKGR even when the values are still the default (PE/PV/PR)",
+            action="store_true", dest="report_ver", default=False)
+    parser.add_option("-a", "--report-all",
+            help = "Report all changes, not just the default significant ones",
+            action="store_true", dest="report_all", default=False)
 
     options, args = parser.parse_args(sys.argv)
 
@@ -79,7 +85,7 @@ def main():
 
     import gitdb
     try:
-        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev)
+        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev, options.report_all, options.report_ver)
     except gitdb.exc.BadObject as e:
         if len(args) == 1:
             sys.stderr.write("Unable to find previous build revision in buildhistory repository\n\n")
-- 
1.9.0


