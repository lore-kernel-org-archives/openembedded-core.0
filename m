Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7DE78432
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 14:57:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2018 07:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,338,1526367600"; d="scan'208";a="63922103"
Received: from bucksteg-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.38.111])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2018 07:57:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 16:56:49 +0200
Message-Id: <0adb9dd9b48caf4816ce570f521ba40dad8083a9.1531320900.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1531320900.git.paul.eggleton@linux.intel.com>
References: <cover.1531320900.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] lib/oe/buildhistory_analysis: drop related field feature
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
X-List-Received-Date: Wed, 11 Jul 2018 14:57:10 -0000

The original idea here was that changes to certain fields might be able
to be explained if there was a change to another field, for example if
RDEPENDS changed it might be because DEPENDS changed. Thus we were
printing this kind of thing out with each change. Unfortunately in
practice this turned out to be noisy and not particularly useful, so we
might as well remove it.

Fixes [YOCTO #7336].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index b0365abcedf..ff7815d7c94 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -31,13 +31,6 @@ ver_monitor_fields = ['PKGE', 'PKGV', 'PKGR']
 monitor_numeric_threshold = 10
 # Image files to monitor (note that image-info.txt is handled separately)
 img_monitor_files = ['installed-package-names.txt', 'files-in-image.txt']
-# Related context fields for reporting (note: PE, PV & PR are always reported for monitored package fields)
-related_fields = {}
-related_fields['RDEPENDS'] = ['DEPENDS']
-related_fields['RRECOMMENDS'] = ['DEPENDS']
-related_fields['FILELIST'] = ['FILES']
-related_fields['files-in-image.txt'] = ['installed-package-names.txt', 'USER_CLASSES', 'IMAGE_CLASSES', 'ROOTFS_POSTPROCESS_COMMAND', 'IMAGE_POSTPROCESS_COMMAND']
-related_fields['installed-package-names.txt'] = ['IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS', 'NO_RECOMMENDATIONS', 'PACKAGE_EXCLUDE']
 
 colours = {
     'colour_default': '',
@@ -67,7 +60,6 @@ class ChangeRecord:
         self.oldvalue = oldvalue
         self.newvalue = newvalue
         self.monitored = monitored
-        self.related = []
         self.filechanges = None
 
     def __str__(self):
@@ -206,13 +198,6 @@ class ChangeRecord:
         else:
             out = '{} changed from "{colour_remove}{}{colour_default}" to "{colour_add}{}{colour_default}"'.format(self.fieldname, self.oldvalue, self.newvalue, **colours)
 
-        if self.related:
-            for chg in self.related:
-                if not outer and chg.fieldname in ['PE', 'PV', 'PR']:
-                    continue
-                for line in chg._str_internal(False).splitlines():
-                    out += '\n  * %s' % line
-
         return '%s%s' % (prefix, out) if out else ''
 
 class FileChange:
@@ -635,17 +620,6 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
                 chg = ChangeRecord(path, filename[7:], d.a_blob.data_stream.read().decode('utf-8'), '', True)
                 changes.append(chg)
 
-    # Link related changes
-    for chg in changes:
-        if chg.monitored:
-            for chg2 in changes:
-                # (Check dirname in the case of fields from recipe info files)
-                if chg.path == chg2.path or os.path.dirname(chg.path) == chg2.path:
-                    if chg2.fieldname in related_fields.get(chg.fieldname, []):
-                        chg.related.append(chg2)
-                    elif chg.path == chg2.path and chg.path.startswith('packages/') and chg2.fieldname in ['PE', 'PV', 'PR']:
-                        chg.related.append(chg2)
-
     # filter out unwanted paths
     if exclude_path:
         for chg in changes:
-- 
2.17.1


