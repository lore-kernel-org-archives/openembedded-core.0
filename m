Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D15360119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 14:45:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Jul 2016 07:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,330,1464678000"; d="scan'208";a="1018061145"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2016 07:45:29 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 762696A4080;
	Fri,  8 Jul 2016 07:45:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2016 17:35:20 +0300
Message-Id: <1467988520-1574-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] buildhistory-diff: reduce PKGR noise
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
X-List-Received-Date: Fri, 08 Jul 2016 14:45:33 -0000

When using PR service the buildhistory-diff output contains a lot of
PKGR changes: In practice the mass of PKGR updates hide other important
changes as they often account for 80% of all changes.

Skipped incremental and decremental changes of PKGR versions to reduce
amount of the script output. All changes are still included in the
output if script is run with -a/--report-all command line option.

[YOCTO #9755]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 4353381..b6c0265 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -359,6 +359,24 @@ def compare_dict_blobs(path, ablob, bblob, report_all, report_ver):
                 if ' '.join(alist) == ' '.join(blist):
                     continue
 
+            if key == 'PKGR' and not report_all:
+                vers = []
+                # strip leading 'r' and dots
+                for ver in (astr.split()[0], bstr.split()[0]):
+                    if ver.startswith('r'):
+                        ver = ver[1:]
+                    vers.append(ver.replace('.', ''))
+                maxlen = max(len(vers[0]), len(vers[1]))
+                try:
+                    # pad with '0' and convert to int
+                    vers = [int(ver.ljust(maxlen, '0')) for ver in vers]
+                except ValueError:
+                    pass
+                else:
+                     # skip decrements and increments
+                    if abs(vers[0] - vers[1]) == 1:
+                        continue
+
             chg = ChangeRecord(path, key, astr, bstr, monitored)
             changes.append(chg)
     return changes
-- 
2.1.4


